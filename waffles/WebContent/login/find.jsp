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
<script>
	$(document).ready(function() {
		
		/* 아이디 찾기 */
		$("#findidBtn").click(function() {
			
			if($("#name").val() == "") {
				alert("이름을 입력해주세요");
				$("#name").focus();
				return false;
			} else if ($("#email1").val() == "") {
				alert("이메일을 입력해주세요");
				$("#email1").focus();
				return false;
			} else if ($("#email2").val() == "") {
				alert("이메일을 입력해주세요");
				$("#email2").focus();
				return false;
			} else {
				findid_form.submit();
			}
		});
		
		/* 비밀번호 찾기 */
		$("#findpassBtn").click(function() {
			
			if($("#id").val() == "") {
				alert("아이디를 입력해주세요");
				$("#id").focus();
				return false;
			} else if($("#pname").val() == "") {
				alert("이름을 입력해주세요");
				$("#pname").focus();
				return false;	
			} else if ($("#pemail1").val() == "") {
				alert("이메일을 입력해주세요");
				$("#pemail1").focus();
				return false;
			} else if ($("#pemail2").val() == "") {
				alert("이메일을 입력해주세요");
				$("#pemail2").focus();
				return false;
			} else {
				findpass_form.submit();
			}
		});
	});

</script>
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
			
			<form name = "findid_form" action = "findIdProcess.jsp" method = "post" class = "content_layout_id">
				<div> 아이디 찾기 </div>
				<ul>
					<li>
						<label> 이름 </label>
						<input type = "text" name = "name" id = "name">
					</li>
					
					<li>
						<label> 이메일 </label>
						<input type = "text" name = "email1" id = "email1"> @
						<input type = "text" name = "email2" id = "email2">
					</li>
					
					<li>
						<button type = "button" id = "findidBtn" class = "btn_find">확인</button>
					</li>	
				</ul>	
			</form>
			
			<form name = "findpass_form" action = "findPassProcess.jsp" method = "post" class = "content_layout_pass">
				<div> 비밀번호 찾기 </div>
				<ul>
					<li>
						<label> 아이디 </label>
						<input type = "text" name = "id" id = "id">
					</li>
					
					<li>
						<label> 이름 </label>
						<input type = "text" name = "name" id = "pname"> 
					</li>
					
					<li>
						<label> 이메일 </label>
						<input type = "text" name = "email1" id = "pemail1"> @
						<input type = "text" name = "email2" id = "pemail2">
					</li>
				<li>
					<button type = "button" id = "findpassBtn" class = "btn_find">확인</button>
				</li>
				</ul>
			</form>
		</section>
			
	</div>
		
		
		<!-- footer -->
		<jsp:include page = "../footer.jsp"></jsp:include>
</body>
</html>