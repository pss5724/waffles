<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창업안내 - 창업FAQ - 글 내용 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="창업 FAQ " />
	<jsp:param name="sublabel" value=" Home > 창업안내 > 창업 FAQ > 내용보기 "/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_setup_faq_content">
		<section>
			<img src = "../images/setup/step1.PNG">
			<div class = "title">FAQ 내용보기</div>
			<div class = "line"></div>
		</section>
	
		<section>
			<form name = "faq_content" action = "#" method = "get">
				<h3>앞에서 넘어온 데이터 vo.getRno</h3>
				<div>작성자 vo		작성날짜 vo	조회수 vo</div>
				<hr>
				<div>내용 vo 높이 높게 설정</div>
				<hr>
				<a href = "setup_faq.jsp"><button type = "button" class = "btn_setup_faq">목록</button></a>
				<a href = "../index.jsp"><button type = "button" class = "btn_setup_faq">홈으로</button></a>
			</form>	
		</section>
		
	</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
</body>
</html>