<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/ohdabin.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp">
		<jsp:param name="mainlabel" value="와플대학스토리" />
		<jsp:param name="sublabel" value=" Home > 와플대학스토리 > 메뉴소개 >  " />
	</jsp:include>
	
	<!-- content -->
	<div class="menu-detail-body">
		<div class="menu-detail">
			<!-- 메뉴 이미지 -->
			<div class="menu-left">
			
			</div>
			
			<div class="menu-right">
				<!-- 메뉴명 -->
				<div class="menu-right1">
					
				</div>
				
				<!-- 메뉴 설명 -->
				<div class="menu-right2">
					
				</div>
				
				<div class="menu-right3">
					<p>1회제공분</p>
				</div>
				
				<!-- 메뉴 성분표 -->
				<div class="menu-right4">
					
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>