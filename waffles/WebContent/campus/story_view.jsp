<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.waffles.dao.*, com.waffles.vo.* " %>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String rno = request.getParameter("rno");

	SuccessStoryDAO dao =new SuccessStoryDAO();
	SuccessStoryVO vo = dao.getStoryViewList(rno);
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/ohdabin.css">
<link rel="stylesheet" href="http://localhost:9000/waffles/css/setup.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp">
		<jsp:param name="mainlabel" value="캠퍼스안내" />
		<jsp:param name="sublabel" value=" Home > 캠퍼스안내 > 캠퍼스 창업 성공스토리 > " />
	</jsp:include>
	
	<!-- content -->
	<div class = "content_setup_faq_content">
		<section>
			<img src = "../images/setup/step1.PNG">
			<div class = "title">캠퍼스 창업성공스토리</div>
			<div class = "line"></div>
		</section>
	
		<section>
			<form name = "faq_content" action = "#" method = "get">
				<h3><%= vo.getTitle() %></h3>
				<div>작성자 <%= vo.getId() %>		작성날짜 <%= vo.getSdate() %>		조회수 <%= vo.getHit() %></div>
				<hr>
				<div><%= vo.getContent() %></div>
				<hr>
				<a href = "success_story.jsp"><button type = "button" class = "btn_setup_faq">목록</button></a>
				<a href = "../index.jsp"><button type = "button" class = "btn_setup_faq">홈으로</button></a>
			</form>	
		</section>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>