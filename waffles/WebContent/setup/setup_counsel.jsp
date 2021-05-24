<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창업안내 - 창업상담 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/waffles.css">
<style>
	div.content {
		width : 1200px;
		margin : auto;
		text-align : center;
		border : 1px solid green;
	}
	
	div.content>section.setup_counsel {
		width : 90%;
		margin : auto;
	}
	
	div.content>section:first-child div:nth-child(2) {
		font-size : 40px;
		font-weight : 400;
	}
	
	div.content>section:first-child>div:nth-child(3), div.content>section:first-child>div:nth-child(5) {
		background-color : lightgray;
		width : 70px; height : 2px;
		display : inline-block;
		
	} 
	
	div.content>section:first-child>div:nth-child(4) {
		display : inline-block;
		font-size : 20px;
		margin : 10px 15px;
	}
	
	div.content>section:nth-child(2)>textarea.initial {
		width : 100%;
		height : 300px;
		border : 5px solid yellow;
	}
	
	div.content>section:nth-child(2)>div:nth-child(3) {
		float : right;
		margin : 10px 0 40px 0;
		border : 1px solid red;
	}
	
	div.content>section:nth-child(2)>div:nth-child(4) {
		float : left;
		font-size : 16px;
		font-weight : 400;
		margin : 40px 0 20px 0;
		border : 1px solid red;
	}
	
	div.content>section:nth-child(2)>div.line {
		background-color : gold;
		width : 100%; height : 2px;
		border : 1px solid red;
		margin-top : 85px;
	}
	
	div.content>section:nth-child(2)>form.content_layout {
		border : 1px solid red;
		margin-top : 20px;
	}
	
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp"></jsp:include>
	
	
	<!-- content -->
	<div class = "content">
		<section>
			<img src = "../images/setup/step1.PNG">
			<div> 창업상담 </div>
			<div></div><div> Keep in Touch</div><div></div>
		</section>
	
		<section class = "setup_counsel">
			<h3> 개인정보수집 및 이용에 대한 안내 </h3>
			
			<textarea class = "initial"> 
			와플대학은 주문을 위하여 아래와 같이 개인정보를 수집·이용하는 내용을 관계 법령에 따라 알리오니, 동의해 주시기를 바랍니다.
			
			■ 개인정보의 수집·이용 항목
			회사는 온라인예약을 위해 아래와 같은 개인정보를 수집하고 있습니다.
			
			수집항목 : 이름, 연락처, 이메일, 아이디, 주소
			개인정보 수집방법 : 회원가입 </textarea>
				
			<div> <input type = "checkbox" name = "initial_check"> 개인정보수집 및 이용에 동의합니다. </div>
			<div> * 표시는 필수 입력사항입니다.</div>
			<div class = "line"></div>
			
			<form name = "join_form" action = "#" method = "get" class = "content_layout">
				<ul>
					<li>
						<label> 이름 * </label>
						<input type = "text" name = "name" class = "i1">
					</li>
					
					<li>
						<label> 핸드폰 </label>
						<select name = "hp1" id = "hp1">
							<option value = "choice">선택</option>
							<option value = "010">010</option>
							<option value = "011">011</option>
							<option value = "016">016</option>
							<option value = "017">017</option>
						</select>
						-<input type = "text" name = "hp2" maxlength = "4" class = "i2" id = "hp2">
						-<input type = "text" name = "hp3" maxlength = "4" class = "i2" id = "hp3">
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
						<label> 와플대학 인지 경로 </label>
						<input type = "checkbox" name = "route" value = "뉴스 기사">뉴스 기사
						<input type = "checkbox" name = "route" value = "검색">검색
						<input type = "checkbox" name = "route" value = "지인 추천">지인 추천
						<input type = "checkbox" name = "route" value = "가맹점 방문">가맹점 방문
						<input type = "checkbox" name = "route" value = "기타">기타
					</li>
					
					<li>
						<label> 창업 희망 지역 * </label>
						<input type = "text" name = "local" class = "i1">
					</li>
					
					<li>
						<label> 기타 문의사항 </label>
						<textarea></textarea>
					</li>
					
					
					<li>
						<a href = "setup_main.jsp"><button type = "button" class = "btn_style">취소</button></a>
						<button type = "button" class = "btn_style">확인</button>
					</li>
				
				</ul>
				
			
			</form>
		
		
		</section>
	
	
	
	
	
	
	
	
	
	
	</div>
	
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
	
</body>
</html>