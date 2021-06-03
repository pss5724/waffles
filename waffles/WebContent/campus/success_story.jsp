<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/ohdabin.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp">
		<jsp:param name="mainlabel" value="와플대학스토리" />
		<jsp:param name="sublabel" value=" Home > 캠퍼스안내 > 캠퍼스 창업 성공스토리" />
	</jsp:include>
	
	<!-- content -->
	<div class="content">
		<div class="success-story">
			<div class="story-top">
				<img src="http://localhost:9000/waffles/images/campus/학사모.png">
				<h1>캠퍼스 창업 성공 스토리</h1>
				<div class="story-line">
					<div id="before"></div>
					<p>Success Story</p>
					<div id="after"></div>
				</div>
			</div>
		</div>
		
		<!-- 게시글 -->
		<div class="story-list">
			<a href="http://localhost:9000/waffles/campus/story_view.jsp"><img src=""><label></label></a>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
</body>
</html>