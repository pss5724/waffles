<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.waffles.dao.*, com.waffles.vo.*" %>
<%
	// 폼에서 요청한 데이터 받기
	String email = request.getParameter("email");
	String[] emailList = email.split("@");
	
	
	MemberVO vo = new MemberVO();
	vo.setName(request.getParameter("name"));
	vo.setEmail1(emailList[0]);
	vo.setEmail2(emailList[1]);
	vo.setPass(request.getParameter("pass"));
	vo.setId(request.getParameter("id"));
	
	MemberDAO dao = new MemberDAO();
	boolean result = dao.getInsertResult(vo);
	
	if(result) {
		response.sendRedirect("joinSuccess.jsp");
	} else {
		response.sendRedirect("../errorPage.jsp");
	}
%>  