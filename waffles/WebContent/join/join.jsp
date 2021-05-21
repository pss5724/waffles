<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/waffles.css">
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp"></jsp:include>
	
	
	
	<!-- content -->
	<div class = "content">
		<section class = "join">
			<h1 class = "title"> 회원가입 </h1>
			<h3> 개인정보수집 및 이용에 대한 안내 </h3>
			
			<textarea name = "initial">
				와플대학은 주문을 위하여 아래와 같이 개인정보를 수집·이용하는 내용을 관계 법령에 따라 알리오니, 동의해 주시기를 바랍니다.

				■ 개인정보의 수집·이용 항목
				회사는 온라인예약을 위해 아래와 같은 개인정보를 수집하고 있습니다.
				
				수집항목 : 이름, 연락처, 이메일, 아이디, 주소
				개인정보 수집방법 : 회원가입 </textarea>
			<input type = "checkbox" name = "initial_check">
			<label> 개인정보수집 및 이용에 동의합니다. </label> <br></br>
			<label> * 표시는 필수 입력사항입니다. 반드시 입력해주세요. </label>
			
			<form name = "join_form" action = "#" method = "get" class = "content_layout">
				<ul>
					<li>
						<label> 이름 * </label>
						<input type = "text" name = "name" class = "i1">
					</li>
					
					<li>
						<label> 이메일 * </label>
						<input type = "text" name = "email1">@
						<input type = "text" name = "email2">
						<select>
							<option value = "choice">선택</option>
							<option value = "naver.com">naver.com</option>
							<option value = "daum.net">daum.net</option>
							<option value = "hanmail.net">hanmail.net</option>
							<option value = "gmail.com">gmail.com</option>
						</select>
					</li>
					
					<li>
						<label> 아이디 * </label>
						<input type = "text" name = "id" class = "i1">
						<button type = "button">중복체크</button>
					</li>
					
					<li>
						<label> 비밀번호 * </label>
						<input type = "password" name = "pass" class = "i1">
					</li>
					
					<li>
						<label> 비밀번호 확인 * </label>
						<input type = "password" name = "cpass" class = "i1">
					</li>
					
					
					<li>
						<a href = "../login/login.jsp"><button type = "button" class = "btn_style">취소</button></a>
						<button type = "button" class = "btn_style">회원가입</button>
					</li>
				
				</ul>
				
			
			</form>
		</section>
		
	</div>
	
	
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
	
</body>
</html>