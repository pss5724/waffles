<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.waffles.vo.*, com.waffles.dao.*" %>
<%
	String id = (String) session.getAttribute("id");
	
	
	MemberDAO dao = new MemberDAO();
	boolean result = dao.getChoiceUpdate(id);
	
	
	
	if(result){
		response.sendRedirect("http://localhost:9000/waffles/login/userinfo.jsp");
	}

%>
