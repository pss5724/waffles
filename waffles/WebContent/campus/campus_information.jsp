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
<link rel="stylesheet" href="http://localhost:9000/waffles/css/bootstrap/bootstrap.css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
<link rel="stylesheet" href="http://localhost:9000/waffles/css/ohdabin.css">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="http://localhost:9000/waffles/js/bootstrap.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp">
		<jsp:param name="mainlabel" value="캠퍼스안내" />
		<jsp:param name="sublabel" value=" Home > 캠퍼스안내 > 전국캠퍼스현황 > " />
	</jsp:include>
	
	<!--  -->
	
	<!-- content -->
	<div class="row" id="information">
	</div>
	<div class="content">
		<div class="campus-information">
			<div class="information-top">
				<img src="http://localhost:9000/waffles/images/campus/학사모.png">
				<p style ="font-size:45px; margin-top: 0px;"><%= vo.getName() %></p>
			</div>
			
			<div>
			
			<p style="font-size: 17px; margin: 140px"><%= vo.getAddress() %>에 있는 <%= vo.getName() %>에 많은 성원과 관심 부탁드립니다</p>
			
			</div>
			<!-- 캠퍼스 정보 -->
				
				<div style="padding:100px; text-align:center; width: 100%;" class="bg-transparent add-transparent padding-100">
	            <div class="container">
	              <div class="row">
	                <div class="col-md-3 adress add_box"  style="width:380px;">
	                 <div class="col-md-3 icon"> <i class="fa fa-road"></i> </div>
	                  <div class="col-sm-12 content-item addess-info" style="text-align: left;  width: 400px;">
	                  	<span class= "glyphicon glyphicon-road" aria-hidden="true" style="color:white; display: inline; font-size: 70px;  float: left; padding-right: 20px;"></span>
	                    <div style="display: inline-block; float: left; color:white;">
		                    <h3>주소(도로명)</h3>
		                    <p><%= vo.getAddress() %></p>
	                    </div>
	                  </div>
	                </div>
	                <div class="col-md-3 adress add_box" style="width:380px;">
	                 <div class="col-md-3 icon"> <i class="fa fa-road"></i> </div>
	                  <div class="col-sm-12 content-item addess-info" style="text-align: left;  width: 400px;">
	                  	<span class= "glyphicon glyphicon-earphone" aria-hidden="true" style="color:white; display: inline; font-size: 70px;  float: left; padding-right: 20px;"></span>
	                    <div style="display: inline-block; float: left; color:white;">
		                    <h3>전화번호</h3>
	                    	<p>tel : <%= vo.getTel() %></p>
	                    </div>
	                  </div>
	                </div>
	                <div class="col-md-3 adress add_box" style="width:380px;">
	                 <div class="col-md-3 icon"> <i class="fa fa-road"></i> </div>
	                  <div class="col-sm-12 content-item addess-info" style="text-align: left;  width: 400px; ">
	                  	<span class= "glyphicon glyphicon-envelope" aria-hidden="true" style="color:white; display: inline; font-size: 70px;  float: left; padding-right: 20px;"></span>
	                    <div style="display: inline-block; float: left; color:white;">
		                     <h3>이용시간</h3>
	                   		 <p>AM 10:00 ~ PM 10:00<br></p>
	                    </div>
	                  </div>
	                </div>
	                </div>
	              </div>
	            </div>
	          </div>
	</div>
			<!-- 캠퍼스 이미지 -->
			<div class="campus-photo" ;">
				<div class="campus-photo2">
					<div class="photo-line"  style=" margin-top: 120px; margin-bottom: 100px;">
						<div id="before"></div>
						<p style="font-size: 20px;width: 200px; position:relative; bottom: 7px;">Campus Photo</p>
						<div id="after"></div>
					</div>
				</div>
				<div class="campus-img" style="width:100%; height:100%; margin-top: 20px; margin-bottom: 200px; display: inline-block;">
					<img style="width:22%; height:30%; margin: 10px;" src="http://localhost:9000/waffles/images/campus/캠퍼스사진.png">
					<img style="width:22%; height:30%; margin: 10px;" src="http://localhost:9000/waffles/images/campus/캠퍼스사진2.png">
					<img style="width:22%; height:30%; margin: 10px;" src="http://localhost:9000/waffles/images/campus/캠퍼스사진3.png">
				</div>
			</div>
			
			<div id="map" style="width: 100%; height:470px;">
			
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
				<a href="http://localhost:9000/waffles/campus/nationwide.jsp" class="btn btn-dark" 
				style="border: 1px solid gray; background-color:gray; color: white; width: 100px; padding: 10px;font-size:16px;margin: 40px;">리스트</a>
			</div>
	<!-- 지도 -->
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
