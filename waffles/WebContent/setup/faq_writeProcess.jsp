<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.waffles.vo.*, com.waffles.dao.*" %>
<%
	QuestionVO vo = new QuestionVO();
	vo.setQtitle(request.getParameter("qtitle"));
	vo.setQcontent(request.getParameter("qcontent"));
	vo.setQwriter(request.getParameter("qwriter"));
	
	QuestionDAO dao = new QuestionDAO();
	boolean result = dao.getInsertResult(vo);

	if(result) {
		response.sendRedirect("setup_faq.jsp");
	}  else {
		System.out.println("글쓰기 실패");
	}	
%>
