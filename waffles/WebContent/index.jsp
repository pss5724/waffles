<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/waffles/plugin/owl.carousel.min.css">
<link rel="stylesheet" href="http://localhost:9000/waffles/plugin/owl.theme.default.min.css">
<script src="http://localhost:9000/waffles/plugin/owl.carousel.js"></script>
<script>
	$(document).ready(function(){
		$("#main-li li:nth-child(1),#main-li li:nth-child(2),#main-li li:nth-child(3),#main-li li:nth-child(4),#main-li li:nth-child(5)").mouseenter(function() {
			$(this).children("div").css("color","#00498c").css("background-color","rgba(241,241,241, 0.8)");
		});
		
		$("#main-li li:nth-child(1),#main-li li:nth-child(2),#main-li li:nth-child(3),#main-li li:nth-child(4),#main-li li:nth-child(5)").mouseenter(function() {
			$(this).find("#sub-menu").stop().fadeIn(250);
		}).mouseleave(function() {
			$(this).find("#sub-menu:visible").stop().fadeOut(250, function() {
			});
		});
		
		$("#main-li li").mouseleave(function() {
			$(this).parent().parent().find("div").css("background-color","rgba(255, 255, 255, 0)").css("color","white");
		});
		
		/** 백그라운드 페이드인 아웃 전환 **/
		$("div#bgImage>ul>li:nth-child(1)").animate({opacity:0},2500);
		$("div#bgImage>ul>li:nth-child(2)").animate({opacity:1},2500);
		var check = 1;
		setInterval(function() {
			check += 1;
			if(check>5) check=0;
			if(check == 0){
				$("div#bgImage>ul>li:nth-child(5)").animate({opacity:0},2500);
				$("div#bgImage>ul>li:nth-child(1)").animate({opacity:1},2500);
			}else if(check == 1){
				$("div#bgImage>ul>li:nth-child(1)").animate({opacity:0},2500);
				$("div#bgImage>ul>li:nth-child(2)").animate({opacity:1},2500);
			}else if(check == 2){
				$("div#bgImage>ul>li:nth-child(2)").animate({opacity:0},2500);
				$("div#bgImage>ul>li:nth-child(3)").animate({opacity:1},2500);
			}else if(check == 3){
				$("div#bgImage>ul>li:nth-child(3)").animate({opacity:0},2500);
				$("div#bgImage>ul>li:nth-child(4)").animate({opacity:1},2500);
			}else if(check == 4){
				$("div#bgImage>ul>li:nth-child(4)").animate({opacity:0},2500);
				$("div#bgImage>ul>li:nth-child(5)").animate({opacity:1},2500);
			}
		},6000);
		/**메뉴 오버레이**/
		$(".owl-stage").children().mouseenter(function() {
			$(this).children().children("span").stop().animate({
										  height:'100%', 
										  'border-top-left-radius': '15px',
									      'border-top-right-radius': '15px',
										  },300);
			$(this).children().children().children("p").stop().animate({top:'35%'},300);
			$(this).find("button").stop().animate({top:'80%'},300);
			$(this).children().children().children("div").stop().animate({top:'58%'},300);
		});
		$(".owl-stage").children().mouseleave(function() {
			$(this).children().children("span").stop().animate({
										  height:'40%',
										  'border-top-left-radius': 0,
									      'border-top-right-radius': 0,
										  },300);
			$(this).children().children().children("p").stop().animate({top:'75%'},300);
			$(this).find("button").stop().animate({top:'130%'},300);
			$(this).children().children().children("div").stop().animate({top:'110%'},300);
		});
		
		
		
	});
</script>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/waffles_sg.css">
<title>Insert title here</title>
</head>
<body>
	<div id="bgImage">
		<ul>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
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
							<li><a href="http://localhost:9000/waffles/menu/menu_bar.jsp?kind=와플">와플</a></li>
							<li><a href="http://localhost:9000/waffles/menu/menu_bar.jsp?kind=커피/라떼">커피/라떼</a></li>
							<li><a href="http://localhost:9000/waffles/menu/menu_bar.jsp?kind=쥬스/차">쥬스/차</a></li>
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
		<!-- 캐로셀 2 위치  -->
		<div>
			<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100"
						src="http://localhost:9000/waffles/images/index/carosel2/1.jpg" alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="http://localhost:9000/waffles/images/index/carosel2/2.jpg" alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="http://localhost:9000/waffles/images/index/carosel2/3.jpg" alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		   </div>
		</div>
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
					<img src="http://localhost:9000/waffles/images/index/section/blog.jpg" id="im2">
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
			<div><a href="#">ALL</a> <a href="#"><font color="red">☆ </font>WAFFLE</a> <a href="#"><font color="red">☆ </font>COFFEE</a> <a href="#"><font color="red">☆ </font>JUICE/BEVERAGE</a></div>
			<div class="owl-carousel owl-theme owl-loaded">
				<div class="owl-stage-outer">
					<div class="owl-stage">
						<div class="owl-item">
							<p>WAFFLE</p>
							<div>
								<img src="http://localhost:9000/waffles/images/index/carosel/waffle1.jpg">
								<span></span>
								<div>
									<p>초코범벅젤라또와플</p>
									<div><img src="http://localhost:9000/waffles/images/index/carosel/icon_waffle.png"></div>
									<button>view</button>
								</div>
							</div>
						</div>
						<div class="owl-item">
							<p>WAFFLE</p>
							<div>
								<img src="http://localhost:9000/waffles/images/index/carosel/waffle2.png">
								<span></span>
								<div>
									<p>초코범벅젤라또와플</p>
									<div><img src="http://localhost:9000/waffles/images/index/carosel/icon_waffle.png"></div>
									<button>view</button>
								</div>
							</div>
						</div>
						<div class="owl-item">
						<p>WAFFLE</p>
						<div>
							<img src="http://localhost:9000/waffles/images/index/carosel/waffle3.jpg">
							<span></span>
							<div>
								<p>초코범벅젤라또와플</p>
								<div><img src="http://localhost:9000/waffles/images/index/carosel/icon_waffle.png"></div>
								<button>view</button>
							</div>
						</div>
						</div>
						<div class="owl-item">
						<p>WAFFLE</p>
							<div>
								<img src="http://localhost:9000/waffles/images/index/carosel/waffle4.png">
								<span></span>
								<div>
									<p>초코범벅젤라또와플</p>
									<div><img src="http://localhost:9000/waffles/images/index/carosel/icon_waffle.png"></div>
									<button>view</button>
								</div>
							</div>
						</div>
						<div class="owl-item">
						<p>COFFEE</p>
							<div>
								<img src="http://localhost:9000/waffles/images/index/carosel/coffee1.jpg">
								<span></span>
								<div>
									<p>초코범벅젤라또와플</p>
									<div><img src="http://localhost:9000/waffles/images/index/carosel/icon_waffle.png"></div>
									<button>view</button>
								</div>
							</div>
						</div>
						<div class="owl-item">
						<p>COFFEE</p>
							<div>
								<img src="http://localhost:9000/waffles/images/index/carosel/coffee2.jpg">
								<span></span>
								<div>
									<p>초코범벅젤라또와플</p>
									<div><img src="http://localhost:9000/waffles/images/index/carosel/icon_waffle.png"></div>
									<button>view</button>
								</div>
							</div>
						</div>
						<div class="owl-item">
						<p>COFFEE</p>
							<div>
								<img src="http://localhost:9000/waffles/images/index/carosel/coffee3.jpg">
								<span></span>
								<div>
									<p>초코범벅젤라또와플</p>
									<div><img src="http://localhost:9000/waffles/images/index/carosel/icon_waffle.png"></div>
									<button>view</button>
								</div>
							</div>
						</div>
						<div class="owl-item">
						<p>COFFEE</p>
							<div>
								<img src="http://localhost:9000/waffles/images/index/carosel/coffee4.jpg">
								<span></span>
								<div>
									<p>초코범벅젤라또와플</p>
									<div><img src="http://localhost:9000/waffles/images/index/carosel/icon_waffle.png"></div>
									<button>view</button>
								</div>
							</div>
						</div>
						<div class="owl-item">
						<p>JUICE/BEVERAGE</p>
							<div>
								<img src="http://localhost:9000/waffles/images/index/carosel/juice1.jpg">
								<span></span>
								<div>
									<p>초코범벅젤라또와플</p>
									<div><img src="http://localhost:9000/waffles/images/index/carosel/icon_waffle.png"></div>
									<button>view</button>
								</div>
							</div>
						</div>
						<div class="owl-item">
						<p>JUICE/BEVERAGE</p>
						<div>
							<img src="http://localhost:9000/waffles/images/index/carosel/juice2.jpg">
							<span></span>
							<div>
								<p>초코범벅젤라또와플</p>
								<div><img src="http://localhost:9000/waffles/images/index/carosel/icon_waffle.png"></div>
								<button>view</button>
							</div>
						</div>
						</div>
						<div class="owl-item">
						<p>JUICE/BEVERAGE</p>
						<div>
							<img src="http://localhost:9000/waffles/images/index/carosel/juice3.jpg">
							<span></span>
							<div>
								<p>초코범벅젤라또와플</p>
								<div><img src="http://localhost:9000/waffles/images/index/carosel/icon_waffle.png"></div>
								<button>view</button>
							</div>
						</div>
						</div>
						<div class="owl-item">
						<p>JUICE/BEVERAGE</p>
						<div>
							<img src="http://localhost:9000/waffles/images/index/carosel/juice4.jpg">
							<span></span>
							<div>
								<p>초코범벅젤라또와플</p>
								<div><img src="http://localhost:9000/waffles/images/index/carosel/icon_waffle.png"></div>
								<button>view</button>
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
						<script type="text/javascript">
							$(document).ready(function() {
								var owl = $('.owl-carousel');
					
								owl.owlCarousel({
									items : 4,
									loop : false,
									rewind: true,
									margin : 30,
									autoplay : true,
									autoplaySpeed: 1000,
									autoplayTimeout : 3500,
									autoplayHoverPause : true,
									dotsSpeed : 200,
								});
							});
						</script>
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
<div class="indexfooter">
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>