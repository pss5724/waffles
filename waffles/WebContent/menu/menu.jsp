<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴소개</title>
<script>
var menulist = ["http://localhost:9000/waffles/images/waffle/딸기듬뿍와플.jpg",
				"http://localhost:9000/waffles/images/waffle/딸기와플.png",
				"http://localhost:9000/waffles/images/waffle/망고범벅와플.jpg",
				"http://localhost:9000/waffles/images/waffle/메이플시나몬와플.png",
				"http://localhost:9000/waffles/images/waffle/밀크카라멜와플.png",
				"http://localhost:9000/waffles/images/waffle/바나나누텔라와플.jpg",
				"http://localhost:9000/waffles/images/waffle/베리베리와플.jpg",
				"http://localhost:9000/waffles/images/waffle/스노우와플.jpg"
				];
var i;
text = "";

window.onload = function(){
	for (i=0; i<menulist.length ; i++) {
		 document.getElementById("menu" + i).src = menulist[i];
	}
}
</script>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/ohdabin.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp">
		<jsp:param name="mainlabel" value="와플대학스토리" />
		<jsp:param name="sublabel" value=" Home > 와플대학스토리 > 메뉴소개 > 전체 " />
	</jsp:include>
	
	<!-- menu-bar -->
	<div class="menu-bar">
		<a href="http://localhost:9000/waffles/menu/menu.jsp"><label>전체</label></a>
		<a href="http://localhost:9000/waffles/menu/waffle.jsp"><label class="star1">☆ </label><label>와플</label></a>
		<a href="#"><label class="star1">☆ </label><label>커피 / 라떼</label></a>
		<a href="#"><label class="star1">☆ </label><label>쥬스 / 차</label></a>
	</div>
	<div class="p1">
		<p style="color: blue">※ 가맹점의 판매 가격은 매장의 임차조건이나 상권에 따라서 다소 차이가 있을 수 있습니다.</p>
	</div>
	<div class="p2">
		<p style="color: gray">※ 포장 및 배달로 간단하게 주문하여 드실 수 있습니다. (일부매장 제외)</p>
	</div>
	
	<!-- content -->
	<div class="content">
		<div class="menu">
			<div class="hover"></div>
			<img id="menu0" src="">
			<img id="menu1" src="">
			<img id="menu2" src="">
			<img id="menu3" src="">
			<img id="menu4" src="">
			<img id="menu5" src="">
			<img id="menu6" src="">
			<img id="menu7" src="">
		</div>
	</div>
	
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>