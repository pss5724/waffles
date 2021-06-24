<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>   
<%
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String) session.getAttribute("id");
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공 | 와플대학</title>
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
		<section class = "login_success" style="margin:100px 0;">
			<img src = "../images/setup/step1.PNG">
			<h1 class = "title_login_success"> 로그인 성공!! </h1>
			<h3> 로그인에 성공하셨습니다. </h3>
			<a href = "../index.jsp"><button type = "button" class = "btn_loginsuccess">홈으로</button></a>
		</section>
		
	</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
</body>
</html>
