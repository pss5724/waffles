<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waffles.vo.*, com.waffles.dao.*,java.io.File" %>
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
		file.delete();
	}
		}
	}
	
	
	
	
	if(result){%>
		<script>
		alert("성공적으로 글이 삭제되었습니다");
 		location.href= "faq_list.jsp";
		</script>
	<%}
%>