<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.waffles.dao.*, com.waffles.vo.* " %>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	SuccessStoryDAO dao = new SuccessStoryDAO();
	ArrayList<SuccessStoryVO> list = dao.getStoryList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠퍼스 창업성공스토리</title>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/ohdabin.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp">
		<jsp:param name="mainlabel" value="캠퍼스안내" />
		<jsp:param name="sublabel" value=" Home > 캠퍼스안내 > 캠퍼스 창업성공스토리" />
	</jsp:include>
	
	<!-- content -->
	<div class="content">
		<div class="success-story">
			<div class="story-top">
				<img style= "margin: -10px;" src="http://localhost:9000/waffles/images/campus/학사모.png">
				<h1>캠퍼스 창업성공스토리</h1>
				<div class="story-line">
					<div id="before"></div>
					<p>Success Story</p>
					<div id="after"></div>
				</div>
			</div>
		</div>
		
		<!-- 게시글 -->
		<div class="story-list">
			<% for(SuccessStoryVO vo : list){ %>
			<div class="story">
				<a href="http://localhost:9000/waffles/campus/story_view.jsp?no=<%= vo.getNo() %>">
					<img src="http://localhost:9000/waffles/images/success_story/<%= vo.getImg() %>">
					<label><%= vo.getTitle() %></label>
				</a>
			</div>
			<% } %>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
