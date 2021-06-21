package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
		
		String loginck = request.getParameter("loginck");
		String idsave = request.getParameter("idsave");
		
		MemberDAO dao = new MemberDAO();
		
		boolean result = dao.getLoginResult(id, pass);
		
		if(result) {
			request.getSession().setAttribute("id", id);
			
			if(loginck != null) {
				Cookie log_cookie = new Cookie("log_id",id);
				log_cookie.setMaxAge(60*30);
				log_cookie.setPath("/");
				response.addCookie(log_cookie);
			}
			if(idsave != null) {
				Cookie save_cookie = new Cookie("save_id",id);
				save_cookie.setMaxAge(60*30);
				save_cookie.setPath("/");
				response.addCookie(save_cookie);
			} else if(idsave == null) {
				Cookie[] cookies = request.getCookies();
			    if(cookies!=null){
			        for(Cookie tempCookie : cookies){
			            if(tempCookie.getName().equals("save_id")){
			                tempCookie.setMaxAge(0);
			                tempCookie.setPath("/");
			                response.addCookie(tempCookie);
			            }
			        }
			    }
			}
			
			response.sendRedirect("http://localhost:9000/waffles/login/loginSuccess.jsp");
		} else {
			response.sendRedirect("http://localhost:9000/waffles/login/loginFail.jsp");

		}
		
	}

}
