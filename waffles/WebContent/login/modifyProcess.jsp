<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.waffles.dao.MemberDAO, com.waffles.vo.MemberVO" %>

<jsp:useBean id = "vo" class = "com.waffles.vo.MemberVO" />
<jsp:setProperty name = "vo" property = "*" ></jsp:setProperty>

<%
	request.setCharacterEncoding("utf-8");

	MemberDAO dao = new MemberDAO();
	boolean result = dao.getModify(vo);
	
	if(result) {
		System.out.println("성공");
		response.sendRedirect("../index.jsp");
	} else {
		System.out.println("실패");
		response.sendRedirect("../errorPage.jsp");
	}
	
%>