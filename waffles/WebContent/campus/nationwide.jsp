<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:10000/waffles/css/waffles.css">
</head>
<body>
	<!-- header -->
	<%-- <jsp:include page="header.jsp"></jsp:include> --%>
	
	<!-- content -->
	<div class="content">
		<div class="nationwide">
			<div class="nationwide-top">
				<img src="http://localhost:10000/waffles/images/campus/학사모.png">
				<h1>전국캠퍼스현황</h1>
				<p>Waffle universities nationwide</p>
			</div>
			
			<!-- 검색창 -->
			<div class="nationwide-search">
				<div>
					<p>
						<img src="http://localhost:10000/waffles/images/campus/와플대학로고.png">
						전국의 와플대학을 검색해 보실 수 있습니다.
					</p>
				</div>
				<div>
					<select>
						<option value="areaName">지역+캠퍼스명</option>
						<option value="area">지역</option>
						<option value="name">캠퍼스명</option>
						<option value="hp">전화번호</option>
						<option value="address">주소(도로명)</option>
					</select>
					<input type="text">
					<button>검색</button>
				</div>
			</div>
			
			<!-- 캠퍼스 목록 -->
			<div class="campus-list"></div>
			
			<!-- 페이지수 -->
			<div class="page">
				
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
</body>
</html>