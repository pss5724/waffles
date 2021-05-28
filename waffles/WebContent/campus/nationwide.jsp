<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="waffles.dao.CampusDAO"%>
<%@ page import="waffles.vo.CampusVO"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="campus" class="waffles.vo.CampusVO" scope="page" />


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
		<jsp:param name="sublabel" value=" Home > 캠퍼스안내 > 전국캠퍼스현황 " />
	</jsp:include>

	<!-- content -->
	<div class="content">
		<div class="nationwide">
			<div class="nationwide-top">
				<img src="http://localhost:9000/waffles/images/campus/학사모.png">
				<h1>전국캠퍼스현황</h1>
				<div class="nationwide-line">
					<div id="before"></div>
					<p>Waffle universities nationwide</p>
					<div id="after"></div>
				</div>
			</div>

			<!-- 검색창 -->
			<div class="nationwide-search">
				<div>
					<img src="http://localhost:9000/waffles/images/campus/와플대학로고.png">
					<p>전국의 와플대학을 검색해 보실 수 있습니다.</p>
				</div>
				<div>
					<select>
						<option value="areaName">지역+캠퍼스명</option>
						<option value="area">지역</option>
						<option value="name">캠퍼스명</option>
						<option value="hp">전화번호</option>
						<option value="address">주소(도로명)</option>
					</select> <input type="text">
					<button>검색</button>
				</div>
			</div>

			<!-- 캠퍼스 목록 -->
			<div class="campus-list"></div>
			<%
				CampusDAO cdao = new CampusDAO();
			CampusVO cvo = cdao.getCampusList();

			PrintWriter script = response.getWriter();

			script.println(cvo.getLoction() + " " + cvo.getName() + " " + cvo.getHp() + " " + cvo.getAddress());
			%>


			<!-- 페이지수 -->
			<div class="page"></div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>







