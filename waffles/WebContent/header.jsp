<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String id = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
		    for(Cookie co : cookies){
		        if(co.getName().equals("log_id")) {
		        	request.getSession().setAttribute("id", co.getValue());
		        }
		    }
		}
		if(session.getAttribute("id") != null){
			id = (String) session.getAttribute("id");
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="http://localhost:9000/waffles/css/bootstrap/bootstrap.css">
<title>Insert title here</title>
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="http://localhost:9000/waffles/js/bootstrap.js"></script>
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
	});
	
</script>
<script type="text/javascript">
	function getUnread() {
		$.ajax({
			type: "POST",
			url: "http://localhost:9000/waffles/counselUnread",
			data: {
				userID: encodeURIComponent('<%= id %>'),
			},
			success: function(result) {
				if(result >= 1) {
					showUnread("•");
				} else {
					showUnread('');
				}				
			}
		});
	}
	function getInfiniteUnread() {
		setInterval(function() {
			getUnread();
		}, 4000);
	}
	function showUnread(result) {
		$('#unread').html(result);
	}
</script>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/waffles.css">
</head>
<body>
	<header>
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
						<a href="http://localhost:9000/waffles/setup/setup_main.jsp">창업안내</a>
						</div>
						<ul id="sub-menu">
							<li id="topdeco"></li>
							<li><a href="http://localhost:9000/waffles/setup/setup_main.jsp">창업 경쟁력</a></li>
							<li><a href="http://localhost:9000/waffles/setup/setup_step.jsp">창업 절차 및 비용</a></li>
							<li><a href="http://localhost:9000/waffles/setup/setup_counsel.jsp">창업상담</a></li>
							<li><a href="http://localhost:9000/waffles/setup/setup_faq.jsp">자주 묻는 질문</a></li>
						</ul>
					</li>
					<li>
						<div>
						<a href="http://localhost:9000/waffles/support/notice/notice_list.jsp">고객문의</a>
						</div>
						<ul id="sub-menu">
							<li id="topdeco"></li>
							<li><a href="http://localhost:9000/waffles/support/notice/notice_list.jsp">공지사항</a></li>
							<li><a href="http://localhost:9000/waffles/support/FAQ/faq_list.jsp">문의 게시판</a></li>
						</ul>
					</li>
					<%
					if(id == null) { 
					%>
					<li><div><button class="login_btn" onclick="location.href='http://localhost:9000/waffles/login/login.jsp'">로그인</button></div></li>
					<li><div><button class="join_btn" onclick="location.href='http://localhost:9000/waffles/join/join.jsp'">회원가입</button></div></li>
					<%
					} else if(id.equals("manager")) { 
					%>	
					<li><div><button class="login_btn" onclick="location.href='http://localhost:9000/waffles/admin/adminindex.jsp'">관리메뉴</button>
					<span id="unread" class="label label-info" style="position: absolute; color:red; top:28px; right:100px; background-color:rgba(0,0,0,0);"></span>
					</div></li>
					<li><div><button class="join_btn" onclick="location.href='http://localhost:9000/waffles/login/logoutAction.jsp'">로그아웃</button></div></li>
					<%
					} else {
					%>
					<li><div><button class="login_btn" onclick="location.href='http://localhost:9000/waffles/login/login.jsp'">정보수정</button></div></li>
					<li><div><button class="join_btn" onclick="location.href='http://localhost:9000/waffles/login/logoutAction.jsp'">로그아웃</button></div></li>
					<%
					} 
					%>
				</ul>
			</nav>
			<div>
				<a href="http://localhost:9000/waffles/index.jsp">
					<img src="http://localhost:9000/waffles/images/header/logo.png">
				</a>
			</div>
			<div>
				<p class="mainLabel"><%= request.getParameter("mainlabel") %></p>
			</div>
			<div>
			    <p class="subLabel"><%= request.getParameter("sublabel") %></p>
			</div>
	 	</div>
<%
	if(id != null) {
%>
	<script type="text/javascript">
		$(document).ready(function () {
			getUnread();
			getInfiniteUnread();
		});
	</script>		
<%
	}
%>
	</header>
</body>
</html>