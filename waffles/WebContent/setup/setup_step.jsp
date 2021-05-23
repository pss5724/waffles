<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창업안내 - 창업절차 및 비용 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/waffles.css">
<style>
	div.content {
		width : 1200px;
		margin : auto;
		text-align : center;
		border : 1px solid green;
	}
	
	div.content>section:first-child div {
		font-size : 40px;
		font-weight : 400;
	}

	div.content>section:nth-child(2), div.content>section:last-child {
		display : inline-block;
		border : 1px solid red;
		width : 45%;
		height : 700px;
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
			<div> 창업절차 및 비용 </div>
		</section>
		
		<section>
			<img src = "../images/setup/1.PNG">
			<div> 1. 가맹상담 </div>
			<div> 사업설명, 정보공개서제공, 투자자금계획, 자금운영상담</div>
		
			<img src = "../images/setup/2.PNG">
			<div> 2. 상권조사 </div>
			<div> 입점 후보지 현장방문조사, 상권조사</div>
		
			
			<img src = "../images/setup/3.PNG">
			<div> 3. 가맹정계약 </div>
			<div> 점포확정, 가맹점계약 체결</div>
			
			<img src = "../images/setup/4.PNG">
			<div> 4. 인테리어공사 </div>
			<div> 점포실측, 도면확정, 디자인결정</div>
			
		</section>
		
		<section>
			<img src = "../images/setup/5.PNG">
			<div> 5. 교육 </div>
			<div> 레시피교육, 매장운영교육, 점포실습교육, 리허설</div>
		
			<img src = "../images/setup/6.PNG">
			<div> 6. 개점준비 </div>
			<div> 가구 및 주방집기 설치, 본사 개점 전문인력 투입</div>
		
			
			<img src = "../images/setup/7.PNG">
			<div> 7. 개업 및 관리 </div>
			<div> 매장 오픈 및 영업개시, 본사의 지속적인 현황 체크 및 SV 관리 </div>
		</section>	
			
	
	</div>
	
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
	
</body>
</html>