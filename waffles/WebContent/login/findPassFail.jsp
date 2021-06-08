<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 실패| 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>

</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="비밀번호 찾기" />
	<jsp:param name="sublabel" value=" Home > 아이디 / 비밀번호 찾기 "/>
	</jsp:include>
	
	
	<!-- content -->
	<div class = "content_loginsuccess">
		<section class = "login_success">
		<img src = "../images/setup/step1.PNG">
			<h1 class = "title_login_success"> 비밀번호 설정 실패 </h1>
			<h3> 비밀번호 찾기에 실패하셨습니다 </h3>
			<h3> 존재하지 않는 아이디거나 정보가 틀렸습니다. </h3>
			<a href = "find.jsp"><button type = "button" class = "btn_loginsuccess">아이디 / 패스워드 찾기</button></a>
			<a href = "../index.jsp"><button type = "button" class = "btn_loginsuccess">홈으로</button></a>
		</section>
		
	</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
</body>
</html>
