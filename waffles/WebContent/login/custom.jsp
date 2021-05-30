<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="회원정보수정" />
	<jsp:param name="sublabel" value=" Home > 회원정보수정"/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_modify">
		<section>
			<div class = "title"> 회원정보수정 </div>
			<div class = "hr"></div>
			<form name = "modify_form" action = "#" method = "get" class = "content_layout_modify">
				<ul>
					<li>
						<label> 아이디 </label>
						<input type = "text" name = "id" class = "id" disabled>
						<div class = "line"></div>
					</li>
					
					<li>
						<label> 이름 </label>
						<input type = "text" name = "name" class = "name" disabled>
						<div class = "line"></div>
					</li>
					
					<li>
						<label> 이메일 </label>
						<input type = "text" name = "email1" class = "email1"> @ 
						<input type = "text" name = "email2" class = "email2">
						<select class = "email3">
							<option value = "choice">선택</option>
							<option value = "naver.com">naver.com</option>
							<option value = "daum.net">daum.net</option>
							<option value = "hanmail.net">hanmail.net</option>
							<option value = "gmail.com">gmail.com</option>
						</select>
						<div class = "line"></div>
					</li>
					
					
					<li>
						<label> 비밀번호 </label>
						<input type = "password" name = "pass" class = "pass">
						<div class = "line"></div>
					</li>
					
					<li>
						<label> 비밀번호 확인 </label>
						<input type = "password" name = "cpass" class = "cpass">
						<div class = "line"></div>
					</li>
					
					
					<li>
						<a href = "../index.jsp"><button type = "button" class = "btn_modify_1">취소</button></a>
						<button type = "button" class = "btn_modify_2">정보수정</button>
					</li>
				
				</ul>
				
			
			</form>
		
		
		
		
		
		
		
		</section>
	</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
</body>
</html>