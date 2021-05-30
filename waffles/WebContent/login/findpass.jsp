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
<script>
	$(document).ready(function() {
		
		$("#passBtn").click(function() {
			
			if($("#pass").val() == "") {
				alert("새 비밀번호를 입력해주세요");
				$("#pass").focus();
				return false;
			} else if ($("#cpass").val() == "") {
				alert("새 비밀번호 확인을 입력해주세요");
				$("#cpass").focus();
				return false;
			} else {
				newpass_form.submit();
			}
		});
		
		/* 패스워드 체크 */
		$("#cpass").blur(function() {
			if($("#pass").val() != "" && $("#cpass").val() != "") {
				if($("#pass").val() == $("#cpass").val()) {
					$("#msg").text("패스워드가 동일합니다").css("color", "blue");
					return true;
				}else {
					$("#msg").text("패스워드가 다릅니다").css("color", "red");
					$("#pass").val("");
					$("#cpass").val("").focus();
					return false;
				}
			}	
		});	
	});
</script>
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
				<form name = "newpass_form" action = "#" method = "get" class = "content_layout_findpass">
					<ul>
						<li>
							<label> 새 비밀번호 </label>
							<input type = "password" name = "pass" id = "pass">
						</li>
					
						<li>
							<label> 새 비밀번호 확인 </label>
							<input type = "password" name = "cpass" id = "cpass">
							<div id = "msg"></div>
						</li>	

						<li>
							<button type = "button" id = "passBtn" class = "btn_findpass">비밀번호 설정</button>
						</li>
					
					</ul>
				</form>
			</section>
			
		</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
</body>
</html>