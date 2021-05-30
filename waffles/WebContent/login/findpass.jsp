<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기 - 새비밀번호 설정 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="새 비밀번호 설정" />
	<jsp:param name="sublabel" value=" Home > 아이디 / 비밀번호 찾기 > 새 비밀번호 설정"/>
	</jsp:include>
	
	<!-- content --> 
		<div class = "content_findpass">
			<section>
				<div class = "title"> 새 비밀번호 설정 </div>
				<form name = "findpass_form" action = "#" method = "get" class = "content_layout_findpass">
					<ul>
						<li>
							<label> 새 비밀번호 </label>
							<input type = "password" name = "pass">
						</li>
					
						<li>
							<label> 새 비밀번호 확인 </label>
							<input type = "password" name = "cpass">
						</li>	

						<li>
							<button type = "button" class = "btn_findpass">비밀번호 설정</button>
						</li>
					
					</ul>
				</form>
			</section>
			
		</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
</body>
</html>