<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>   
<!DOCTYPE html>
<html>
<head>
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$("#main-li li:nth-child(1),#main-li li:nth-child(2),#main-li li:nth-child(3),#main-li li:nth-child(4),#main-li li:nth-child(5)").mouseenter(function() {
			$(this).children("div").css("color","#00498c").css("background-color","rgba(241,241,241, 0.8)");
		});
		
		$("#main-li li:nth-child(1),#main-li li:nth-child(2),#main-li li:nth-child(3),#main-li li:nth-child(4),#main-li li:nth-child(5)").mouseenter(function() {
			$(this).find("#sub-menu").fadeIn(250);
		}).mouseleave(function() {
			$(this).find("#sub-menu:visible").fadeOut(250, function() {
			});
		});
		
		$("#main-li li").mouseleave(function() {
			$(this).parent().parent().find("div").css("background-color","rgba(255, 255, 255, 0)").css("color","white");
		});
	});
</script>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/waffles_sg.css">
<script>
window.onload = function(){
	var speed = 8000
	var Pic = new Array()

	Pic[0] = 'http://localhost:9000/waffles/images/index/header/1.jpg'
	Pic[1] = 'http://localhost:9000/waffles/images/index/header/2.jpg'
	Pic[2] = 'http://localhost:9000/waffles/images/index/header/3.jpg'
	Pic[3] = 'http://localhost:9000/waffles/images/index/header/4.jpg'
	Pic[4] = 'http://localhost:9000/waffles/images/index/header/5.jpg'
	document.getElementById("header").style.backgroundImage = "url("+Pic[0]+")";
	var i = 0
	var p = Pic.length
	playAlert = setInterval(function() {
		document.getElementById("header").style.backgroundImage = "url("+Pic[i]+")";
		i = i+1;
		if(i>(p-1)) i=0;
	}, speed);

}
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<p>
			<a href="http://localhost:9000/waffles/index.jsp">
				<img src="http://localhost:9000/waffles/images/header/logo.png">
			</a>
		</p>
		<div id="headbtn">
			<button class="login_btn" onclick="location.href='http://localhost:9000/waffles/login/login.jsp'">로그인</button>
			<button class="join_btn" onclick="location.href='http://localhost:9000/waffles/join/join.jsp'">회원가입</button>
		</div>
		<div>
			<nav>
				<ul id="main-li">
					<li>
						<div id="d1">
						<a href="http://localhost:9000/waffles/wafflestory/sayHello.jsp">와플대학스토리</a>
						</div>
						<ul id="sub-menu">
							<li id="topdeco"></li>
							<li><a href="http://localhost:9000/waffles/wafflestory/sayHello.jsp">인사말</a></li>
							<li><a href="http://localhost:9000/waffles/wafflestory/brand.jsp">브랜드스토리</a></li>
							<li><a href="http://localhost:9000/waffles/wafflestory/union.jsp">와플대학협동조합</a></li>
							<li><a href="http://localhost:9000/waffles/wafflestory/map.jsp">오시는 길</a></li>
						</ul>
					</li>
					<li>
						<div>
						<a href="http://localhost:9000/waffles/menu/menu.jsp">메뉴소개</a>
						</div>
						<ul id="sub-menu">
							<li id="topdeco"></li>
							<li><a href="http://localhost:9000/waffles/menu/waffle.jsp">와플</a></li>
							<li><a href="#">커피 / 라떼</a></li>
							<li><a href="#">주스 / 차</a></li>
						</ul>
					</li>
					<li>
						<div>
						<a href="http://localhost:9000/waffles/campus/nationwide.jsp">캠퍼스안내</a>
						</div>
						<ul id="sub-menu">
							<li id="topdeco"></li>
							<li><a href="http://localhost:9000/waffles/campus/nationwide.jsp">전국 캠퍼스 현황</a></li>
							<li><a href="http://localhost:9000/waffles/campus/success_story.jsp">캠퍼스 창업 성공스토리</a></li>
						</ul>
					</li>
					<li>
						<div>
						<a href="#">창업안내</a>
						</div>
						<ul id="sub-menu">
							<li id="topdeco"></li>
							<li><a href="#">창업 경쟁력</a></li>
							<li><a href="#">창업 절차 및 비용</a></li>
							<li><a href="#">창업상담</a></li>
							<li><a href="#">자주 묻는 질문</a></li>
						</ul>
					</li>
					<li>
						<div>
						<a href="http://localhost:9000/waffles/support/notice/notice_board.jsp">고객문의</a>
						</div>
						<ul id="sub-menu">
							<li id="topdeco"></li>
							<li><a href="http://localhost:9000/waffles/support/notice/notice_board.jsp">공지사항</a></li>
							<li><a href="http://localhost:9000/waffles/support/FAQ/faq_board.jsp">문의 게시판</a></li>
						</ul>
					</li>
				</ul>
				
			</nav>
			<div class="mainLabel">
				<P><img src="http://localhost:9000/waffles/images/index/header/visual_top.png"></P>
				<p>Waffles with 10 flavors of fresh cream</p>
				<p>COFFEE & WAFFLE</p>
				<P><img src="http://localhost:9000/waffles/images/index/header/visual_bot.png"></P>
			</div>
	 	</div>
	</div>
<section class="index">
	<div class="indexMid">
		<div><img src="http://localhost:9000/waffles/images/index/section/300exceed.jpg"></div>
		<div>
			<div>
				<span>공지사항</span>
				<div><a href="#">더보기 ></a></div>
				<ul>
					<li><a href="#">와플대학을 항상 찾아 주시는 분들 덕분에 30...</a></li>
					<li><a href="#">와플대학을 항상 찾아 주시는 분들 덕분에 20...</a></li>
					<li><a href="#">와플대학 190호 캠퍼스를 달성 하였습니다...</a></li>
				</ul>
			</div>
		</div>
		<div style="cursor:pointer" onclick="window.location.href='#';">
			<p>BRAND STORY</p>
			<p>하루종일 수백개의 와플을 만들지만</p>
			<p>고객님을 위한 단 하나의 와플을 만듭니다!</p>
		</div>
		<div>
			<ul>
				<li style="cursor:pointer" onclick="window.location.href='#';">
					<img src="http://localhost:9000/waffles/images/index/section/blog.jpg">
					<div>
					<p>와플대학 광주첨단2지구 캠퍼스 와플 맛집</p>
					<p>같아요 와플대학 와플메뉴는 정말 다양한데요 기본적인 와플에 시럽, 크림, 젤라또 아이스크림에 과일...</p>
					</div>
				</li>
				<li><div></div></li>
				<li style="cursor:pointer" onclick="window.location.href='#';">
					<img src="http://localhost:9000/waffles/images/index/section/blog.jpg">
					<div>
					<p>와플대학 메뉴 추천: 치즈범벅 생딸기와플 베리베리좋아요</p>
					<p>실패 없는 크림이라 취향따라 입맛따라 가는것도 좋습니다 와플대학에서 추천하는 조합말고 나만의 메뉴...</p>
					</div>				
				</li>
			</ul>
		</div>
	</div>
	<div class="indexMenu">
		<div>
			<img src="http://localhost:9000/waffles/images/index/section/베스트메뉴.JPG">
			<div><a href="#">ALL</a> <a href="#"><font color="red">☆ </font>WAFFLE</a> <a href="#"><font color="red">☆ </font>COFFEE</a> <a href="#"><font color="red">☆ </font>JUICE/BEVERAGE</a> <a href="#"><font color="red">☆ </font>ICE-CREAM</a></div>
			<ul>
			<li>
			<img src="http://localhost:9000/waffles/images/index/section/12312123121.png">
			</li>
			<li>
			<img src="http://localhost:9000/waffles/images/index/section/67Kg66as67Kg66as.jpg">
			</li>
			<li>
			<img src="http://localhost:9000/waffles/images/index/section/67O17JWE.jpg">
			</li>
			<li>
			<img src="http://localhost:9000/waffles/images/index/section/7J6Q66q97JeQ7J2065Oc.jpg">
			</li>
			</ul>
		</div>
	</div>
	<div class="indexBot">
		<div id="p1" style="cursor:pointer" onclick="window.location.href='#';">
			<p>창업안내</p>
			<p>어려웠던 창업! 와플대학과 함께라면</p>
			<p>행복한 고민이 시작됩니다.</p>	
		</div>
		<div id="p2">
			<p>전국 캠퍼스 현황</p>
			<p>지금 가장 가까운</p>
			<p>'와플대학 캠퍼스'를 찾아보세요.</p>
			<div>
				<input type="text" name="id" id="id" placeholder="매장이나 시/군 명 입력">
				<a href="#"><img src="http://localhost:9000/waffles/images/index/section/search.png"></a> 
			</div>
		</div>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>