<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.waffles.dao.MenuDAO, com.waffles.vo.MenuVO"%>
<%
	request.setCharacterEncoding("utf-8");
%>  
<%	//메뉴명, 이미지 가져오기
	MenuDAO mdao = new MenuDAO();
	ArrayList<MenuVO> menu = mdao.getMenuList();

	String kind = request.getParameter("kind");
	if(kind == "all"){
		
	}else if(kind == "와플"){
		
	}else if(kind == "커피/라떼"){
		
	}else if(kind == "쥬스/차"){
		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴소개</title>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/ohdabin.css">
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
			$(this).children().children().children("p").stop().animate({top:'75%'},300);
			$(this).find("a").stop().animate({top:'130%'},300);
			$(this).children().children().children("div").stop().animate({top:'110%'},300);
		});
	});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp">
		<jsp:param name="mainlabel" value="와플대학스토리" />
		<jsp:param name="sublabel" value=" Home > 메뉴소개 > " />
	</jsp:include>
	
	<!-- menu-bar -->
	<div class="menu-bar">
		<a href="menu.jsp?kind=all"><label>전체</label></a>
		<a href="menu.jsp?kind=와플"><label class="star1">☆ </label><label>와플</label></a>
		<a href="menu.jsp?kind=커피/라떼"><label class="star1">☆ </label><label>커피 / 라떼</label></a>
		<a href="menu.jsp?kind=쥬스/차"><label class="star1">☆ </label><label>쥬스 / 차</label></a>
	</div>
	<div class="p1">
		<p style="color: blue">※ 가맹점의 판매 가격은 매장의 임차조건이나 상권에 따라서 다소 차이가 있을 수 있습니다.</p>
	</div>
	<div class="p2">
		<p style="color: gray">※ 포장 및 배달로 간단하게 주문하여 드실 수 있습니다. (일부매장 제외)</p>
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
								<a type="button" class="btn btn-outline-secondary" href="menu_information.jsp?name=<%= vo.getName() %>">VIEW</a>
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