<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.waffles.dao.MemberDAO" %>
<%
	//폼에서 요청한 데이터 받기
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	// 로그인 처리
		MemberDAO dao = new MemberDAO();
		boolean result = dao.getLoginResult(id, pass);
		
		if(result) {
			response.sendRedirect("loginSuccess.jsp");
		}else {
			response.sendRedirect("loginFail.jsp");
		}
%>
