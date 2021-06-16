<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String checkCode = (String)request.getAttribute("checkCode");
	String email = (String)request.getAttribute("email");
	String name = (String)request.getAttribute("name");
	String id = (String)request.getAttribute("id");
	String pass = (String)request.getAttribute("pass");
%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		var checkCode = "<%= checkCode %>";
		var e_check = false;
		$("#emailcheck").click(function() {
			if($("#auth").val() == checkCode) {
				alert("인증번호가 일치합니다");
				e_check = true;
			}else{
				alert("인증번호가 일치하지 않습니다");
				e_check = false;
			}
		});
		$("#joinBtn").click(function() {
			if(e_check == true){
				join_form.submit();
			} else {
			alert("이메일 인증을 먼저 수행해 주십시오");
			}
		});
		
	});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="회원가입" />
	<jsp:param name="sublabel" value=" Home > 회원가입 "/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_join">
		<section style = "margin-bottom: 100px; margin-top: 100px;">
			<div class = "title"> 이메일 인증 </div>
			<form name = "join_form" action = "http://localhost:9000/waffles/join/joinProcess.jsp" method = "post" class = "content_layout_join">
			<input type="hidden" name="id" value = <%= id %>>
			<input type="hidden" name="email" value = <%= email %>>
			<input type="hidden" name="name" value = <%= name %>>
			<input type="hidden" name="pass" value = <%= pass %>>
				<ul>
					<li>
						<label style = "width: 200px;"> 인증번호를 입력해 주세요 </label>
						<input type = "text" name = "auth" id = "auth" class = "auth" style = "width: 200px; margin-right:10px">
						<button type = "button" id = "emailcheck">인증번호 확인</button>
						<div id = "idmsg"></div>
						<div class = "line"></div>
					</li>
					
					<li>
						<a href = "../login/login.jsp"><button type = "button" class = "btn_join_1">취소</button></a>
						<button type = "button" id = "joinBtn" class = "btn_join_2">회원가입</button>
					</li>
				
				</ul>
				
			
			</form>
		</section>
		
	</div>
	
	
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
	
</body>
</html>