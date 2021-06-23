<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.waffles.vo.*, com.waffles.dao.*" %>
<%
	String id = request.getParameter("id");
	System.out.print(id);
	
	MemberDAO dao = new MemberDAO();
	boolean result = dao.getDeleteResult(id);
	
	
	
	if(result){
		response.sendRedirect("http://localhost:9000/waffles/admin/member/member_list.jsp");
	}

%>
