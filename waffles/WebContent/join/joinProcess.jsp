<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.waffles.dao.*, com.waffles.vo.*" %>
<%
	// 폼에서 요청한 데이터 받기
	MemberVO vo = new MemberVO();
	vo.setName(request.getParameter("name"));
	vo.setEmail1(request.getParameter("email1"));
	vo.setEmail2(request.getParameter("email2"));
	vo.setId(request.getParameter("id"));
	vo.setPass(request.getParameter("pass"));
	
	MemberDAO dao = new MemberDAO();
	boolean result = dao.getInsertResult(vo);
	
	if(result) {
		response.sendRedirect("joinSuccess.jsp");
	} else {
		response.sendRedirect("../errorPage.jsp");
	}
	
%>  