<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.waffles.vo.*, com.waffles.dao.*" %>
<%
	// 아이디 / 비밀번호 찾기에서 비밀번호 찾기 --> 아이디, 이름, 이메일 비교해서 맞으면 새 비밀번호 창으로 넘어가는 ...
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1 + "@" + email2;

	MemberDAO dao = new MemberDAO();
	boolean result = dao.getFindpassResult(id, name, email);
	
	if(result) {
		response.sendRedirect("findpass.jsp?id=" + id);
	}else {
		response.sendRedirect("findPassFail.jsp");
	}
	
%>