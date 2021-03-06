<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.waffles.dao.*, com.waffles.vo.*, com.page.Paging" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<% 	//paging
	String select = request.getParameter("select");
	String select_value = request.getParameter("select_value");
	
	Paging p = new Paging();
	CampusDAO cdao = new CampusDAO();
	
	//전체 데이터 갯수 구하기
	int dataCount = 0;
	if(select_value == null || select_value.equals("null") || select_value.equals("") ) {
	dataCount = cdao.getCampusDataCount();
	} else {
	dataCount = cdao.getCampusDataCountSearch(select,select_value);
	}
	//한 페이지당 보여질 글의 갯수
	int showData = 10;
	//전체 페이지 수 구하기
	int pageCount = p.getPageCount(dataCount, showData);
	
	//넘어온 페이지 번호
	String pageNo = request.getParameter("pageNo");
	//첫 시작 페이지
	int curPage = 1; 
	//넘어온 페이지 번호가 존재할 경우 현재페이지에 값 넣기
	if(pageNo != null){
		curPage = Integer.parseInt(pageNo);
	}
	//현재 페이지의 게시물의 rownum 구하기
   	int pageBegin = (curPage -1) * showData + 1;	//시작번호 = (현재페이지 - 1) * 페이지당 게시물수 + 1
   	int pageEnd = curPage * showData;				//끝번호 = 현재페이지 * 페이지당 게시물수
	//DB에서 해당 페이지 게시물을 가져오기
	ArrayList<CampusVO> pageData = new ArrayList<CampusVO>();
	if(select_value == null || select_value.equals("null") || select_value.equals("") ) {
		pageData = cdao.getPageData(pageBegin, pageEnd);
	} else {
		pageData = cdao.getPageDataSearch(pageBegin, pageEnd ,select, select_value);
	}
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국 캠퍼스 현황</title>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/ohdabin.css">
<link rel="stylesheet" href="http://localhost:9000/waffles/css/bootstrap.min.css">
<script src="http://localhost:9000/waffles/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp">
		<jsp:param name="mainlabel" value="캠퍼스안내" />
		<jsp:param name="sublabel" value=" Home > 캠퍼스안내 > 전국캠퍼스현황 " />
	</jsp:include>

	<!-- content -->
	<div class="content">
		<div class="nationwide">
			<div class="nationwide-top">
				<img src="http://localhost:9000/waffles/images/campus/학사모.png">
				<h1>전국 캠퍼스 현황</h1>
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
					<form name = "faq_write" action = "nationwide.jsp" method = "post"> 
						<select name="select">
							<option value="areaName">지역+캠퍼스명</option>
							<option value="area">지역</option>
							<option value="name">캠퍼스명</option>
							<option value="hp">전화번호</option>
							<option value="address">주소(도로명)</option>
						</select>
						<input type="text" name="select_value" style="width:250px;">
						<button type= "submit">검색</button>
					</form>
				</div>
			</div>

			<!-- 캠퍼스 목록 -->
			<div class="campus-list">
				<table class="table table-striped text-center">
					<thead>
						<tr>
							<th scope="col" style = "text-align:center">지역</th>
							<th scope="col" style = "text-align:center">캠퍼스</th>
							<th scope="col" style = "text-align:center">전화번호</th>
							<th scope="col" style = "text-align:center">주소(도로명)</th>
						</tr>
					</thead>
					<tbody>
						<% for(CampusVO vo : pageData){ %>
						<tr>
							<td style="width: 100px;"><%= vo.getLoction() %></td>
							<td style="width: 300px;"><a href="http://localhost:9000/waffles/campus/campus_information.jsp?name=<%= vo.getName() %>"><%= vo.getName() %></a></td>
							<td style="width: 300px;"><%= vo.getTel() %></td>
							<td style="width: 500px;"><%= vo.getAddress() %></td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>

			<!-- 페이지수 -->
			<div class="page">
				<% for(int i=1;i<pageCount+1;i++){ %>
				<a type="button" class="btn btn-outline-primary" href="nationwide.jsp?pageNo=<%= i %>&select=<%= select %>&select_value=<%=select_value %>" role="button"><%= i %></a>
				<% } %>
			</div>
		</div>
	</div>

	<!-- footer -->
	<div class="footnation">
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>