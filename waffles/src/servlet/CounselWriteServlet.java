package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.waffles.dao.CounselDAO;

@WebServlet("/CounselWriteServlet")
public class CounselWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("name");
		String hp1 =  request.getParameter("hp1");
		String hp2 =  request.getParameter("hp2");
		String hp3 =  request.getParameter("hp3");
		String hp = hp1 +"-"+ hp2 +"-"+ hp3;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1 + "@" + email2;
		String[] routes = request.getParameterValues("route");
		StringBuffer routestack = new StringBuffer("");
		String local = request.getParameter("local");
		String etc = request.getParameter("etc");
		
		for (int i = 0; i < routes.length; i++) {
			if(i != routes.length-1) {
				routestack.append(routes[i] + ",");
			} else {
				routestack.append(routes[i]);
			}
		}
		String route = routestack.toString();
		
		CounselDAO dao = new CounselDAO();
		boolean result = false;
		result = dao.counselInsert(name, hp, email, route, local, etc);
		if(result) {
			response.sendRedirect("http://localhost:9000/waffles/setup/counselSuccess.jsp");
		} else {
			response.sendRedirect("http://localhost:9000/waffles/setup/counseFail.jsp");
		}
	} 

}
