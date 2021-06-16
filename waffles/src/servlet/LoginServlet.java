package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.waffles.dao.MemberDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		MemberDAO dao = new MemberDAO();
		boolean result = dao.getLoginResult(id, pass);
		
		if(result) {
			request.getSession().setAttribute("id", id);
			response.sendRedirect("http://localhost:9000/waffles/login/loginSuccess.jsp");
		} else {
			response.sendRedirect("http://localhost:9000/waffles/login/loginFail.jsp");

		}
		
	}

}
