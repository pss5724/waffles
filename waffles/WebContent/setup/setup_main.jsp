<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창업안내 - 창업경쟁력 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">

</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="창업경쟁력" />
	<jsp:param name="sublabel" value=" Home > 창업안내 > 창업경쟁력 "/>
	</jsp:include>
	
	
	<!-- content -->
	<div class = "content_setup_main">
	
		<section>
			<img src = "../images/setup/step1.PNG">
			<div> 창업경쟁력 </div>
		</section>
		
		<section>
			<article>
				<iframe width=90% height=650px src="https://www.youtube.com/embed/pSxIJjRqOMo" 
				title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; 
				encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</article>
		</section>
		
		<section>
			<article>
				<div> 입소문으로 2008년부터 계속 이어가고 있는 와플대학 브랜드의 저력! </div>
				<div> 꾸준히 사랑받는 아메리칸 와플 전문점 우리동네 1등 디저트 </div>
				<div> 여성, 청년의 창업자들이 많은 와플대학 </div>
				<div> 함께하는 성공, 자립창업  </div>
			</article>
		</section>
		
		
		<section>
				<img src = "../images/setup/와플대학3.PNG">
			<article>
				<div> 1. 차별화 된 맛있는 와플을 위한 전용믹스와 자체 생산 크림 </div>
				<div> - 차별화 된 와플의 맛과 향의 전용 믹스와 초코, 요거트 등 10가지 자체 생산 전용 크림과 10가지 젤라토 등의 재료를 이용하여 주문과 동시에 와플을 구워 차별화된 맛을 제공합니다. </div>
				<div> 2. 와플과 가장 잘 어울리는 커피 </div>
				<div> - 세계적으로 주목받는 레인 포레스트와 UTZ 인증을 획득한 친환경 농법의 스페셜 티 원두를 주원료로 하여 고소한 향과 깊고 풍부한 단맛 그리고 다크 초콜릿 같은 쌉싸름한 맛을 더해 와플과 함께 먹었을 때 가장 맛있는 커피입니다. </div>
			</article>	
		</section>
		
		<section>
				<img src = "../images/setup/와플대학4.PNG">
			<article>	
				<div> 1. 고객 대기 시간은 Down 판매 회전율은 Up </div>
				<div> - 고객이 직접 주문하는 주문/결제 시스템인 키오스크 시스템과 짧은 조리 시간으로 고객별 응대시간을 최소화하고, 테이크 아웃 형태로 판매 회전율을 극대화하여 높은 수익율을 확보하였습니다. </div>
				<div> 2. 창업 경험이 없는 여성, 청년의 창업자를 위한 창업 지원 </div>
				<div> - 창업 경험이 없는 여성 또는 청년 창업자분들도 매장 운영애 문제가 없도록 본사  교육을 지원하며, 다년간의 매장 운영 경험을 가진 슈퍼 바이져 지원을 통해 매장을 운영하실 수 있도록 지원합니다. </div>
			</article>	
		</section>
		
		<a href = "setup_counsel.jsp"><button type = "button" class = "btn_setup_counsel_style"> 창업 상담 바로가기 </button></a>
		
	</div>		
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
	
</body>
</html>