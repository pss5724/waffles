<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:10000/waffles/css/waffles.css">
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp"></jsp:include>
	
	
	<!-- content -->
	<div class = "content">
		<section class = "login">
			<h1 class = "title"> 로그인 </h1>
			<form name = "login_form" action = "#" method = "get" class = "content_layout">
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
						<button type = "button" class = "btn_style">로그인</button>
					</li>
					
					<li>
						<a href = "../join/join.jsp"><button type = "button" class = "btn_style">회원가입</button></a>
						<a href = "find.jsp"><button type = "button" class = "btn_style">아이디 / 비밀번호 찾기</button></a>
					</li>
				
				</ul>
				
			
			</form>
		</section>
		
	</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
</body>
</html>