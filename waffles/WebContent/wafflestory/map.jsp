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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=2judvestfm"></script>
<script>
window.onload = function(){
	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(37.66509031517129, 127.01016204856681),
	    zoom: 15
	});
	
	var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(37.66509031517129, 127.01016204856681),
	    map: map
	});
}
</script>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/waffles_sg.css">
</head>
<body>
<jsp:include page="../header.jsp">
	<jsp:param name="mainlabel" value="와플대학스토리" />
	<jsp:param name="sublabel" value=" Home > 와플대학스토리 > 오시는길 " />
</jsp:include>
	<section class="map">
		<div>
			<img src="http://localhost:9000/waffles/images/story/map/map1.JPG">
		</div>
		<div id="map" style="width:100%;height:450px;"></div>
		<div>
			<img src="http://localhost:9000/waffles/images/story/map/map2.JPG">
		</div>
	</section>
	
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>