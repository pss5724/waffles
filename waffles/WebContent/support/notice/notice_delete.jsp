<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.waffles.dao.*, com.waffles.vo.*"%>
<%
	request.setCharacterEncoding("utf-8");
	NoticeDAO dao = new NoticeDAO();
	String nid = request.getParameter("nid");
	
	String id = null;
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}
	
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 - 공지사항 - 게시물 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>

</head>
<body>
	<!-- header -->
	<jsp:include page = "../../header.jsp">
	<jsp:param name="mainlabel" value="공지사항 " />
	<jsp:param name="sublabel" value=" Home > 고객센터 > 공지사항 > 게시물 > 삭제 "/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_setup_faq_content">
		<section>
			<img src = "../../images/setup/step1.PNG">
			<div class = "title">공지사항</div>
			<div class = "line"></div>
		</section>
		<section>
			<form name = "faq_content" action = "#" method = "get">
				<h3>정말로 삭제하시겠습니까?</h3>
				<img src="../../images/delete.jpg">				
				
			</form>	
			<a href = "noticeDeleteProcess.jsp?nid=<%=nid%>"><button type = "button" class = "btn_setup_faq">삭제완료</button></a>
				<a href = "notice_list.jsp"><button type = "button" class = "btn_setup_faq">목록</button></a>
				<a href = "../../index.jsp"><button type = "button" class = "btn_setup_faq">홈으로</button></a>
		</section>
			
		
		
	</div>
	
	<!-- footer -->
	<jsp:include page = "../../footer.jsp"></jsp:include>
</body>
</html>