<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창업안내 - 창업상담 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
		/* 폼체크 */
		$("#counselBtn").click(function() {
			if($("input[name = 'initial_check']:checked").length == 0) {
				alert("개인정보수집 및 이용에 동의해주세요");
				$("input[name = 'initial_check']").focus();
				return false;
			} else if($("#name").val() == "") {
				alert("이름을 입력해주세요");
				$("#name").focus();
				return false;
			} else if ($("#hp1").val() == "choice") {
				alert("핸드폰1 번호를 입력해주세요");
				$("#hp1").focus();
				return false;
			} else if($("#hp2").val() == "") {
				alert("핸드폰2 번호를 입력해주세요");
				$("#hp2").focus();
				return false;
			} else if($("#hp3").val() == "") {
				alert("핸드폰3 번호를 입력해주세요");
				$("#hp3").focus();
				return false;	
			} else if($("#email1").val() == "") {
				alert("email1을 입력해주세요");
				$("#email1").focus();
				return false;
			} else if ($("#email2").val() == "") {
				alert("email2,3을 입력해주세요");
				$("#email3").focus();
				return false;
			} else if($("#local").val() == "") {
				alert("창업 희망 지역을 입력해주세요");
				$("#local").focus();
				return false;
			} else {
				setup_counsel_form.submit();
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
			

	});

</script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="창업상담" />
	<jsp:param name="sublabel" value=" Home > 창업안내 > 창업상담 "/>
	</jsp:include>
	
	
	<!-- content -->
	<div class = "content_setup_counsel">
		<section>
			<img src = "../images/setup/step1.PNG">
			<div> 창업상담 </div>
			<div></div><div> Keep in Touch</div><div></div>
		</section>
			<form name = "setup_counsel_form" action = "http://localhost:9000/waffles/CounselWriteServlet" method = "post" class = "content_layout_setup_counsel">
				<ul>
					<li>
						<label> 이름 * </label>
						<input type = "text" name = "name" id = "name">
						<div></div>
					</li>
					
					<li>
						<label> 핸드폰 * </label>
						<select name = "hp1" id = "hp1">
							<option value = "choice">선택</option>
							<option value = "010">010</option>
							<option value = "011">011</option>
							<option value = "016">016</option>
							<option value = "017">017</option>
						</select>
						- <input type = "text" name = "hp2" maxlength = "4" class = "i2" id = "hp2">
						- <input type = "text" name = "hp3" maxlength = "4" class = "i2" id = "hp3">
						<div></div>
					</li>
					
					<li>
						<label> 이메일 * </label>
						<input type = "text" name = "email1" id = "email1"> @ 
						<input type = "text" name = "email2" id = "email2">
						<select id = "email3">
							<option value = "choice">선택</option>
							<option value = "naver.com">naver.com</option>
							<option value = "daum.net">daum.net</option>
							<option value = "hanmail.net">hanmail.net</option>
							<option value = "gmail.com">gmail.com</option>
						</select>
						<div></div>
					</li>
					
					<li>
						<label> 와플대학 인지 경로 </label>
						<input type = "checkbox" name = "route" value = "뉴스 기사">뉴스 기사
						<input type = "checkbox" name = "route" value = "검색">검색
						<input type = "checkbox" name = "route" value = "지인 추천">지인 추천
						<input type = "checkbox" name = "route" value = "가맹점 방문">가맹점 방문
						<input type = "checkbox" name = "route" value = "기타">기타
						<div></div>
					</li>
					
					<li>
						<label> 창업 희망 지역 * </label>
						<input type = "text" name = "local" id = "local">
						<div></div>
					</li>
					
					<li>
						<label> 기타 문의사항 </label>
						<textarea name="etc"></textarea>
						<div></div>
					</li>
					
					
					<li>
						<a href = "setup_main.jsp"><button type = "button" class = "btn_counsel_1">취소</button></a>
						<button type = "submit" id = "counselBtn" class = "btn_counsel_2">확인</button>
					</li>
				
				</ul>
				
			
			</form>
		
		
		</section>

	
	</div>
	
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
</body>
</html>