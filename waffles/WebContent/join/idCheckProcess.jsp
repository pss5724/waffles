<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.waffles.dao.MemberDAO" %>
<%
	String id = request.getParameter("id");
	MemberDAO dao = new MemberDAO();
	int result = dao.getIdCheck(id);
	
	out.write(String.valueOf(result));	//꼭 String으로 다시 넘겨야하고, 아래 html 다 지워줘야함!

%>