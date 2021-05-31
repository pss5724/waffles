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
<script>
	$(document).ready(function() {
		
		/* 폼체크 */
		$("#modifyBtn").click(function() {
			if($("#email1").val() == "") {
				alert("email1을 입력해주세요");
				$("#email1").focus();
				return false;
			} else if ($("#email2").val() == "") {
				alert("email2,3을 입력해주세요");
				$("#email3").focus();
				return false;
			} else if ($("#pass").val() == "") {
				alert("패스워드를 입력해주세요");
				$("#pass").focus();
				return false;
			} else if ($("#cpass").val() == "") {
				alert("패스워드 확인을 입력해주세요");
				$("#cpass").focus();
				return false;	
			} else {
				modify_form.submit();
			}

		});
		
		
		/* 이메일 체크 */
		$("#email3").change(function() {
			if($("#email3").val() == "선택") {
				alert("주소 선택해주세요");
				$("#email2").val("");
				$("#email3").focus();
				return false;
			} else {
				$("#email2").val($("#email3").val());
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
						<input type = "text" name = "email1" id = "email1" class = "email1"> @ 
						<input type = "text" name = "email2" id = "email2" class = "email2">
						<select id = "email3" class = "email3">
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
						<input type = "password" name = "pass" id = "pass" class = "pass">
						<div class = "line"></div>
					</li>
					
					<li>
						<label> 비밀번호 확인 </label>
						<input type = "password" name = "cpass" id = "cpass" class = "cpass">
						<div id = "msg"></div>
						<div class = "line"></div>
					</li>
					
					
					<li>
						<a href = "../index.jsp"><button type = "button" class = "btn_modify_1">취소</button></a>
						<button type = "button" id = "modifyBtn" class = "btn_modify_2">정보수정</button>
						<button type = "button" class = "btn_modify_2">회원탈퇴</button>
					</li>
				
				</ul>
				
			
			</form>
		
		
		
		
		
		
		
		</section>
	</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
</body>
</html>