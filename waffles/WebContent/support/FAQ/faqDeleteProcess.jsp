<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waffles.dao.*, com.waffles.vo.*,java.io.File" %>
<%
	String fid = request.getParameter("fid");
	
	
	
	FaqDAO dao = new FaqDAO();
	String fsfile = dao.getFsfile(fid);
	boolean result = dao.getDeleteResult(fid);
	
	if(result){
		if(fsfile != null){
	String savePath = request.getServletContext().getRealPath("/upload");
	
	
	File file = new File(savePath+"/"+fsfile);
	if(file.exists()){
		if(file.delete()) System.out.println("파일삭제완료");
	}
		}
	}
	
	
	
	
	if(result){
		response.sendRedirect("faq_list.jsp");
	}
%>