<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패| 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>

</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="로그인" />
	<jsp:param name="sublabel" value=" Home > 로그인 "/>
	</jsp:include>
	
	
	<!-- content -->
	<div class = "content_loginsuccess">
		<section class = "login_success">
		<img src = "../images/setup/step1.PNG">
			<h1 class = "title_login_success"> 로그인 실패!! </h1>
			<h3> 로그인에 실패하셨습니다 </h3>
			<a href = "login.jsp"><button type = "button" class = "btn_loginsuccess">다시 로그인하기</button></a>
			<a href = "find.jsp"><button type = "button" class = "btn_loginsuccess">아이디 / 패스워드 찾기</button></a>
		</section>
		
	</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
</body>
</html>
