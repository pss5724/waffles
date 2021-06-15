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
<meta charset="UTF-8">
<!--  <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=cayrl604ux"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=674bc6df4de3c9d4c2a193001987b616"></script>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/ohdabin.css">
<link rel="stylesheet" href="http://localhost:9000/waffles/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
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
				<%-- <div class="col-4" id="addr">
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
				</div> --%>
			</div>
				
				<div class="bg-transparent add-transparent padding-100">
	            <div class="container">
	              <div class="row">
	                <div class="col-md-3 adress add_box">
	                  <div class="col-md-3 icon "> <i class="fa fa-road"></i> </div>
	                  <div class="col-sm-12 content-item addess-info">
	                    <h3>주소(도로명)</h3>
	                    <p>경기도 평택시 이충로35번길 20-9</p>
	                  </div>
	                </div>
	                <div class="col-md-3 Phone add_box">
	                  <div class="col-md-3 icon"><i class="fa fa-phone" aria-hidden="true"></i></div>
	                  <div class="col-sm-12 content-item addess-info">
	                    <h3>전화번호</h3>
	                    <p>Tel : 031-663-6312</p>
	                  </div>
	                </div>
	                <div class="col-md-3 email add_box">
	                  <div class="col-md-3 icon"> <i class="fa fa-envelope"></i> </div>
	                  <div class="col-sm-12 content-item addess-info">
	                    <h3>이용시간</h3>
	                    <p>AM 10:00 ~ PM 10:00<br></p>
	                  </div>
	                </div>
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
			
			<div id="map">
				<!-- 네이버 지도 -->
				<%-- <script>
				var map = new naver.maps.Map('map', {
				    center: new naver.maps.LatLng(<%= vo.getCoordinates() %>),
				    zoom: 17
				});
			
				var marker = new naver.maps.Marker({
				    position: new naver.maps.LatLng(<%= vo.getCoordinates() %>),
				    map: map
				});
				</script> --%>
				
				<!-- 카카오 맵 -->
				<script>
				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
					center: new kakao.maps.LatLng(<%= vo.getCoordinates() %>), //지도의 중심좌표.
					level: 3 //지도의 레벨(확대, 축소 정도)
				};
			
				var map = new kakao.maps.Map(container, options); // 지도를 생성합니다
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(<%= vo.getCoordinates() %>); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				</script>
			</div>
			
			<!-- 목록으로 돌아가는 버튼 -->
			<div class="btnList">
				<a href="http://localhost:9000/waffles/campus/nationwide.jsp" class="btn btn-dark">목록</a>
			</div>
		</div>
	</div>
	
	<!-- 지도 -->
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
