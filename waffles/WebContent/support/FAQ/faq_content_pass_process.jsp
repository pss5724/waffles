<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waffles.vo.*, com.waffles.dao.*,java.io.File" %>
<%
	String fid = request.getParameter("fid");
	String rno = request.getParameter("rno");
	
	
	FaqDAO dao = new FaqDAO();
	FaqVO vo = dao.getContent(fid);
	
	boolean result=false;
	
	if(vo.getPass().equals(request.getParameter("pass"))) {
		response.sendRedirect("faq_content.jsp?fid="+fid+"&rno="+rno);
	} else {
		response.sendRedirect("faq_list.jsp");
	}
%>