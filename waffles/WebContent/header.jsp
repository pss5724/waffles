<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://localhost:10000/waffles/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#main-li li:nth-child(1),li:nth-child(2),li:nth-child(3),li:nth-child(4),li:nth-child(5)").mouseenter(function() {
			$(this).children("div").css("color","#00498c").css("background-color","rgba(241,241,241, 0.8)");
		});
		
		$("#main-li li:nth-child(1),li:nth-child(2),li:nth-child(3),li:nth-child(4),li:nth-child(5)").mouseenter(function() {
			$(this).find("#sub-menu").fadeIn(250);
		}).mouseleave(function() {
			$(this).find("#sub-menu:visible").fadeOut(250, function() {
			});
		});
		
		$("#main-li li").mouseleave(function() {
			$(this).parent().parent().find("div").css("background-color","rgba( 255, 255, 255, 0)").css("color","white");
		});
		
	});
</script>
</head>
<body>
	<header>
		<div>
			<nav>
				<ul id="main-li">
					<li>
						<div id="d1">와플대학스토리</div>
						<ul id="sub-menu">
							<li id="topdeco"></li>
							<li><a href="#">인사말</a></li>
							<li><a href="#">브랜드스토리</a></li>
							<li><a href="#">와플대학협동조합</a></li>
							<li><a href="#">오시는 길</a></li>
						</ul>
					</li>
					<li>
						<div>메뉴소개</div>
						<ul id="sub-menu">
							<li id="topdeco"></li>
							<li><a href="#">와플</a></li>
							<li><a href="#">커피 / 라떼</a></li>
							<li><a href="#">주스 / 차</a></li>
						</ul>
					</li>
					<li>
						<div>캠퍼스안내</div>
						<ul id="sub-menu">
							<li id="topdeco"></li>
							<li><a href="#">캠퍼스 창업 성공스토리</a></li>
							<li><a href="#">전국 캠퍼스 현황</a></li>
						</ul>
					</li>
					<li>
						<div>창업안내</div>
						<ul id="sub-menu">
							<li id="topdeco"></li>
							<li><a href="#">창업 경쟁력</a></li>
							<li><a href="#">창업 절차 및 비용</a></li>
							<li><a href="#">창업상담</a></li>
							<li><a href="#">자주 묻는 질문</a></li>
						</ul>
					</li>
					<li>
						<div>고객문의</div>
						<ul id="sub-menu">
							<li id="topdeco"></li>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">문의 게시판</a></li>
						</ul>
					</li>
					<li><div><button class="login_btn">로그인</button></div></li>
					<li><div><button class="join_btn">회원가입</button></div></li>
				</ul>
			</nav>
			<div>
				<img src="http://localhost:10000/waffles/images/header/logo.png">
			</div>
			<div>
				<p class="p1">와플대학스토리</p>
			</div>
			<div>
			    <p class="p2">Home > 와플대학스토리 > 인사말</p>
			</div>
	 	</div>
	</header>
</body>
</html>