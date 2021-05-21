<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기 - 새비밀번호 설정 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/waffles.css">
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp"></jsp:include>
	
	<!-- content --> 
		<div class = "content">
			<section class = "findpass">
				<h1 class = "title"> 새 비밀번호 설정 </h1>
				<form name = "findpass_form" action = "#" method = "get" class = "content_layout">


								<label> 비밀번호 </label> <br>
								<input type = "password" name = "pass" class = "i1"> <br>

					

								<label> 비밀번호 확인 </label> <br>
								<input type = "password" name = "cpass" class = "i1"> <br>


							<button type = "button" class = "btn_style">비밀번호 설정</button>

					
				
				</form>
			</section>
			
		</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
</body>
</html>