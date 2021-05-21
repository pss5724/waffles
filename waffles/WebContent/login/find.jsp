<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/waffles.css">
<style>
	form {
		border : 1px solid red;
		display : inline-block;
		padding : 10px;
	}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class = "content">
			<section class = "find">
				<h1 class = "title"> 아이디 / 비밀번호 찾기 </h1>
				<form name = "find_form" action = "#" method = "get" class = "content_layout">

							<h3> 아이디 찾기 </h3>

							<label> 이름 </label> <br>
							<input type = "text" name = "name"> <br>

							<label> 이메일 </label> <br>
							<input type = "text" name = "email1">@
							<input type = "text" name = "email2"> <br>

							<button type = "button" class = "btn_style">확인</button>

					
				
				</form>
				
				<form name = "find_form" action = "#" method = "get" class = "content_layout">

							<h3> 비밀번호 찾기 </h3>

							<label> 아이디 </label> <br>
							<input type = "text" name = "id"> <br>
							
							<label> 이름 </label> <br>
							<input type = "text" name = "name"> <br>

							<label> 이메일 </label> <br>
							<input type = "text" name = "email1">@
							<input type = "text" name = "email2"> <br>

							<button type = "button" class = "btn_style">확인</button>

					
				
				</form>
			</section>
			
		</div>
		
		
		<!-- footer -->
		<jsp:include page = "../footer.jsp"></jsp:include>
</body>
</html>