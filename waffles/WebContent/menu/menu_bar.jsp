<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.waffles.dao.*, com.waffles.vo.MenuVO" %>
<%
	request.setCharacterEncoding("utf-8");
%>  
<%	//DB에서 메뉴명, 이미지 가져오기
	String kind = request.getParameter("kind");
	
	MenuDAO mdao = new MenuDAO();
	ArrayList<MenuVO> menu = mdao.getMenuList(kind);
	
	String[] menu_bar = {"전체","와플","커피/라떼","쥬스/차"};
	String[] waffle_bar = {"베이직와플","스페셜와플","과일/누텔라와플","아이스크림와플"};
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴소개</title>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/ohdabin.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		/**메뉴 오버레이**/
		$(".owl-stage").children().mouseenter(function() {
			$(this).children().children("span").stop().animate({
										  height:'100%', 
										  'border-top-left-radius': '15px',
									      'border-top-right-radius': '15px',
										  },300);
			$(this).children().children().children("p").stop().animate({top:'35%'},300);
			$(this).find("a").stop().animate({top:'80%'},300);
			$(this).children().children().children("div").stop().animate({top:'58%'},300);
		});
		$(".owl-stage").children().mouseleave(function() {
			$(this).children().children("span").stop().animate({
										  height:'40%',
										  'border-top-left-radius': 0,
									      'border-top-right-radius': 0,
										  },300);
			$(this).children().children().children("p").stop().animate({top:'80%'},300);
			$(this).find("a").stop().animate({top:'130%'},300);
			$(this).children().children().children("div").stop().animate({top:'110%'},300);
		});
	});
</script>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/ohdabin.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp">
		<jsp:param name="mainlabel" value="메뉴소개" />
		<jsp:param name="sublabel" value=" Home > 메뉴소개" />
	</jsp:include>

	<!-- menu-bar -->
	<div class="menu-bar">
		<a href="menu.jsp?kind=<%= menu_bar[0] %>"><label><%= menu_bar[0] %></label></a>
		<% for(int i=1; i<menu_bar.length; i++){ %>
		<a href="menu_bar.jsp?kind=<%= menu_bar[i] %>" ><label class="star1">☆ </label><label><%= menu_bar[i] %></label></a>
		<% } %>
	</div>
	<!-- waffle-bar -->
	<% if(kind.equals("와플")){ %>
	<div class="sub-menu-bar">
		<% for(int i=0; i<waffle_bar.length; i++){ %>
		<a href="waffle_bar.jsp?kind=와플&waffle=<%= waffle_bar[i] %>"><label class="star2">☆ </label><label><%= waffle_bar[i] %></label></a>
		<% } %>
	</div>
	<% } %>
	<div class="p1">
		<p>※ 가맹점의 판매 가격은 매장의 임차조건이나 상권에 따라서 다소 차이가 있을 수 있습니다.</p>
	</div>
	<div class="p2">
		<p>※ 포장 및 배달로 간단하게 주문하여 드실 수 있습니다. (일부매장 제외)</p>
	</div>
	
	<!-- content -->
	<div class="content">
		<div class="menu-content">
			<div class="owl-stage-outer">
				<div class="owl-stage">
					<% for(MenuVO vo : menu){ %>
					<div class="owl-item">
						<div>
							<img src="http://localhost:9000/waffles/images/menu/<%= vo.getImg() %>" style="width:200px">
							<span></span>
							<div>
								<p><%= vo.getName() %></p>
								<div><img src="http://localhost:9000/waffles/images/index/carosel/icon_waffle.png"></div>
								<a type="button" class="btn btn-outline-secondary" href="menu_information.jsp?kind=<%= kind %>&name=<%= vo.getName() %>">VIEW</a>
							</div>
						</div> 
					</div>
					<% } %>
				</div>
			</div>
		</div>
	</div> 
	
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>