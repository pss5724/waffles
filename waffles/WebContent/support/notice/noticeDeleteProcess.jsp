<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waffles.vo.*, com.waffles.dao.*,java.io.File" %>
<%
	String nid = request.getParameter("nid");
	
	
	
	NoticeDAO dao = new NoticeDAO();
	String nsfile = dao.getNsfile(nid);
	boolean result = dao.getDeleteResult(nid);
	
	if(result){
		if(nsfile != null){
	String savePath = request.getServletContext().getRealPath("/upload");
	
	
	File file = new File(savePath+"/"+nsfile);
	if(file.exists()){
		if(file.delete()) System.out.println("파일삭제완료");
	}
		}
	}
	
	
	
	
	if(result){
		response.sendRedirect("notice_list.jsp");
	}
%>