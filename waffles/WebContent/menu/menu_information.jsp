<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.waffles.dao.MenuDAO"%>
<%@ page import="com.waffles.vo.MenuVO"%>
<%
	request.setCharacterEncoding("utf-8");
%>  
<%	//메뉴 상세정보 가져오기
	String name = request.getParameter("name");

	MenuDAO mdao = new MenuDAO();
	MenuVO vo = mdao.getMenuDetail(name);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= name %></title>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/ohdabin.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp">
		<jsp:param name="mainlabel" value="와플대학스토리" />
		<jsp:param name="sublabel" value=" Home > 메뉴소개 > " />
	</jsp:include>
	
	<!-- content -->
	<div class="menu-information-body">
		<div class="menu-information" id="menu-information">
			<!-- 메뉴 이미지 -->
			<div class="menu-left">
				<img src="http://localhost:9000/waffles/images/menu/<%= vo.getImg() %>">
			</div>
			
			<div class="menu-right">
				<!-- 메뉴명 -->
				<div class="menu-right1">
					<label><%= name %></label>
				</div>
				
				<!-- 메뉴 설명 -->
				<div class="menu-right2">
					<label><%= vo.getExplain() %></label>
				</div>
				
				<!-- 메뉴 성분표 -->
				<div class="menu-right3">
					<p>1회제공분</p>
				</div>
				<div class="menu-right4">
					<img src="http://localhost:9000/waffles/images/ingredient/<%= vo.getIngredient() %>"  style="width:480px">
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>