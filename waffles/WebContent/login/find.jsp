<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="아이디 / 비밀번호 찾기" />
	<jsp:param name="sublabel" value=" Home > 아이디 / 비밀번호 찾기"/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_find">
		<section>
			<div class = "title"> 아이디 / 비밀번호 찾기 </div>
			
			<form name = "find_form" action = "#" method = "get" class = "content_layout_id">
				<div> 아이디 찾기 </div>
				<ul>
					<li>
						<label> 이름 </label>
						<input type = "text" name = "name">
					</li>
					
					<li>
						<label> 이메일 </label>
						<input type = "text" name = "email1"> @
						<input type = "text" name = "email2">
					</li>
					
					<li>
						<button type = "button" class = "btn_find">확인</button>
					</li>	
				</ul>	
			</form>
			
			<form name = "find_form" action = "#" method = "get" class = "content_layout_pass">
				<div> 비밀번호 찾기 </div>
				<ul>
					<li>
						<label> 아이디 </label>
						<input type = "text" name = "id">
					</li>
					
					<li>
						<label> 이름 </label>
						<input type = "text" name = "name"> 
					</li>
					
					<li>
						<label> 이메일 </label>
						<input type = "text" name = "email1"> @
						<input type = "text" name = "email2">
					</li>
				<li>
					<button type = "button" class = "btn_find">확인</button>
				</li>
				</ul>
			</form>
		</section>
			
	</div>
		
		
		<!-- footer -->
		<jsp:include page = "../footer.jsp"></jsp:include>
</body>
</html>