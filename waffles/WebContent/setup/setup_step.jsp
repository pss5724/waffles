<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창업안내 - 창업절차 및 비용 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/waffles.css">
<style>
	div.content_setup_step {
		width : 1200px;
		margin : auto;
		text-align : center;
		margin-top : 50px;
		/* border : 1px solid green; */
	}
	
	div.content_setup_step>section:first-child div {
		font-size : 40px;
		font-weight : 400;
	}

	div.content_setup_step>section:nth-child(2) {
		/* border : 1px solid red; */
		display : inline-block;
		width : 44%;
		height : 630px;
	}
	
	div.content_setup_step>section:nth-child(3) {
		/* border : 1px solid red; */
		float : right;
		margin-right : 30px;
		height : 630px;
		width : 44%;
	}
	
	div.content_setup_step>section:nth-child(2) img, div.content_setup_step>section:nth-child(3) img {
		/* border : 1px solid yellow; */
		margin : 20px 0;
		float : left;
	}
	
	.setup2_info {
		/* border : 1px solid green; */
		display : inline-block;
		font-size : 14px;
		width : 75%;
	}
	
	.setup2_info>p:nth-child(2) {
		/* border : 1px solid red; */
		margin : 20px 20px;
		width : 60%;
		float : left;
		text-align : left;
		font-weight : bold;
		color : #404040;
	}
	
	.setup2_info>p:nth-child(3) {
		/* border : 1px solid red; */
		margin : 10px 20px;
		width : 60%;
		float : left;
		text-align : left;
		font-weight : bold;
		color : gray;
	}
	
	.line {
		background-color : lightgray;
		width : 100%; height : 1px;
		margin-bottom : 30px;
	}
	
	.content_setup_step>section:nth-child(5)>div:first-child {
		font-size : 36px;
		font-weight : bolder;
	}
	
	.content_setup_step>section:nth-child(5)>table {
		width : 80%;
		font-size : 22px;
		text-align : center;
		border-collapse : collapse; 
		margin : auto;
		margin-top : 20px;
		
	}
	
	.content_setup_step>section:nth-child(5)>table th, .content_setup_step>section:nth-child(5)>table td {
		border : 1px solid gray;
		color : #404040;
		padding : 5px;
	}
	
	.content_setup_step>section:nth-child(5)>table th {
		background-color : #ffff66;
		font-weight : bold;
	}
	
	 .content_setup_step>section:nth-child(5)>table tr:last-child {
	 	font-size : 26px;
		font-weight : bolder;
	 }
	 
	 .content_setup_step>section:nth-child(5)>div:nth-child(3), .content_setup_step>section:nth-child(5)>div:nth-child(4),
	 .content_setup_step>section:nth-child(5)>div:nth-child(5), .content_setup_step>section:nth-child(5)>div:nth-child(6) {
	 	text-align : left;
	 	color : #404040;
	 	padding : 3px;
	 	margin-left : 120px;
	 }
	 
	 .btn_style {
		background-color : black;
		color : white;
		width : 300px;
		font-size : 18px;
		margin-top : 30px;
	}

</style>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp"></jsp:include>
	
	
	<!-- content -->
	<div class = "content_setup_step">
		<section>
			<img src = "../images/setup/step1.PNG">
			<div> 창업절차 및 비용 </div>
		</section>
		
		<section>
			<div class = "setup2_info"> 
				<img src = "../images/setup/1.PNG">
				<p>1. 가맹상담 </p>
				<p> 사업설명, 정보공개서제공, 투자자금계획, 자금운영상담 </p> 
			</div>

			<div class = "setup2_info"> 
				<img src = "../images/setup/2.PNG">
				<p> 2. 상권조사 </p>
				<p> 입점 후보지 현장방문조사, 상권조사 </p>
			</div>
	
			<div class = "setup2_info"> 
				<img src = "../images/setup/3.PNG">
				<p> 3. 가맹정계약 </p>
				<p> 점포확정, 가맹점계약 체결 </p>
			</div>
	
			<div class = "setup2_info"> 
				<img src = "../images/setup/4.PNG">
				<p> 4. 인테리어공사 </p>
				<p> 점포실측, 도면확정, 디자인결정 </p>
			</div>
			
		</section>
		
		
		
		<section>
			<div class = "setup2_info">
				<img src = "../images/setup/5.PNG">
				<p> 5. 교육 </p>
				<p> 레시피교육, 매장운영교육, 점포실습교육, 리허설 </p>
			</div>
			
			<div class = "setup2_info">
				<img src = "../images/setup/6.PNG">
				<p> 6. 개점준비 </p>
				<p> 가구 및 주방집기 설치, 본사 개점 전문인력 투입 </p>
			</div>
			
			<div class = "setup2_info">
				<img src = "../images/setup/7.PNG">
				<p> 7. 개업 및 관리 </p>
				<p> 매장 오픈 및 영업개시, 본사의 지속적인 현황 체크 및 SV 관리 </p>
			</div>
			
			<div class = "setup2_info">
				<img src = "../images/setup/8.PNG">
			</div>
			
		</section>	
			
		<div class = "line"></div>
			
		<section>
			<div> 33m2 (10평) 창업 비용 </div>
			<table>
				<tr>
					<th>구분</th>
					<th>항목</th>
					<th>내용</th>
					<th>금액(만원)</th>
				</tr>
				
				<tr>
					<td rowspan = "4"> 본사 </td>
					<td>가맹비</td>
					<td>상권보장, 노하우제공</td>
					<td>500</td>
				</tr>
				
				<tr>
					<td>교육비</td>
					<td>창업 핵심, 레시피, QSC</td>
					<td>300</td>
				</tr>
				
				<tr>
					<td>개점지원비</td>
					<td>개점일 본사 전문 인력 지원</td>
					<td>지원</td>
				</tr>
				
				<tr>
					<td>이행보증금</td>
					<td>계약 종료 시 반환</td>
					<td>200</td>
				</tr>
				
				<tr>
					<td>장비</td>
					<td>기계장비</td>
					<td>커피머신, 2도어냉동고, 크림케이스, 와플머신 등</td>
					<td>1,500</td>
				</tr>
				
				<tr>
					<td rowspan = "3">인테리어</td>
					<td>외부공사</td>
					<td>간판, 사인공사</td>
					<td rowspan = "2">2,800</td>
				</tr>
				
				<tr>
					<td>내부공사</td>
					<td>인테리어 기본 공사</td>
				</tr>
				
				<tr>
					<td>별도공사</td>
					<td>승압, 냉난방기</td>
					<td>별도</td>
				</tr>
				
				<tr>
					<td colspan = "2">총금액</td>
					<td colspan = "2">5,300</td>
				</tr>
			</table>
			
			<div>점포 주변 환경 및 기타 요구 사항에 따라 비용이 달라질 수 있습니다.</div>
			<div>초도 물품 비용 (약 300만원)은 별도입니다.</div>
			<div>가맹점 관리 및 지원비(로열티) 월 10~20만원 입니다.</div>
			<div>부가세 별도(이행 보증금 제외) 입니다.</div>
		</section>
		
		<a href = "setup_counsel.jsp"><button type = "button" class = "btn_style"> 창업 상담 바로가기 </button></a>
	
	</div>
	
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
	
</body>
</html>