<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.waffles.dao.CampusDAO, com.waffles.vo.CampusVO, com.page.Paging" %>    
<%
	request.setCharacterEncoding("utf-8");
%>
<%  //캠퍼스 상세정보 가져오기
	String name = request.getParameter("name");

	CampusDAO cdao = new CampusDAO();
	CampusVO vo = cdao.getCampusInformation(name);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= name %></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cayrl604ux"></script>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/ohdabin.css">
<link rel="stylesheet" href="http://localhost:9000/waffles/css/bootstrap.min.css">
<script src="http://localhost:9000/waffles/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp">
		<jsp:param name="mainlabel" value="와플대학스토리" />
		<jsp:param name="sublabel" value=" Home > 캠퍼스안내 > 전국캠퍼스현황 > " />
	</jsp:include>
	
	<!--  -->
	
	<!-- content -->
	<div class="content">
		<div class="campus-information">
			<div class="information-top">
				<img src="http://localhost:9000/waffles/images/campus/학사모.png">
				<h1><%= name %></h1>
			</div>
			
			<!-- 캠퍼스 정보 -->
			<div class="row" id="information">
				<div class="col-4" id="addr">
					<img src="http://localhost:9000/waffles/images/campus/와플대학로고.png">
					<div>
						<h4>주소</h4>
						<p><%= vo.getAddress() %></p>
					</div>
				</div>
				<div class="col-4" id="tel">
					<img src="http://localhost:9000/waffles/images/campus/와플대학로고.png">
					<div>
						<h4>전화번호</h4>
						<p>Tel : <%= vo.getTel() %></p>
					</div>
				</div>
				<div class="col-4" id="time">
					<img src="http://localhost:9000/waffles/images/campus/와플대학로고.png">
					<div>
						<h4>이용시간</h4>
						<p>AM 10:00 ~ PM 10:00</p>
					</div>
				</div>
			</div>
			
			<!-- 캠퍼스 이미지 -->
			<div class="campus-photo">
				<div class="campus-photo2">
					<div class="photo-line">
						<div id="before"></div>
						<p>Campus Photo</p>
						<div id="after"></div>
					</div>
				</div>
				<div class="campus-img">
					<img src="http://localhost:9000/waffles/images/campus/<%= vo.getImg() %>">
				</div>
			</div>
			
			<!-- 목록으로 돌아가는 버튼 -->
			<div class="btnList">
				<a href="http://localhost:9000/waffles/campus/nationwide.jsp" class="btn btn-dark">목록</a>
			</div>
		</div>
	</div>
	
	
	<!-- 네이버 지도 -->
	<div id="map" style="width:100%;height:300px;"></div>

	<script>
	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(<%= vo.getCoordinates() %>),
	    zoom: 17
	});

	var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(<%= vo.getCoordinates() %>),
	    map: map
	});
	</script>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>