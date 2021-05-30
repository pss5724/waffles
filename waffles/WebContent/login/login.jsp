<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면 | 와플대학</title>
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
	<div class = "content_login">
		<section>
			<div class = "title"> 회원로그인 </div>
			<form name = "login_form" action = "#" method = "get" class = "content_layout_login">
				<ul>
					<li>
						<label> 아이디 </label>
						<input type = "text" name = "id">
					</li>
					
					<li>
						<label> 비밀번호 </label>
						<input type = "password" name = "pass">
					</li>
					
					<li>
						<button type = "button" class = "btn_login">로그인</button>
					</li>
					
					<li>
						<a href = "../join/join.jsp"><button type = "button" class = "btn_login_op">회원가입</button></a>
						<a href = "find.jsp"><button type = "button" class = "btn_login_op">아이디 / 비밀번호 찾기</button></a>
					</li>
				
				</ul>
				
			
			</form>
		</section>
	</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
</body>
</html>