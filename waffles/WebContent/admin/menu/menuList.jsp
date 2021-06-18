<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "com.waffles.dao.adminMenuDAO, com.waffles.vo.CounselVO, java.util.ArrayList" %>
<%
	request.setCharacterEncoding("utf-8");
%>   
<%
	adminMenuDAO dao = new adminMenuDAO();

	String pageNumber = "1";
	if(request.getParameter("pageNumber") != null) {
		pageNumber = request.getParameter("pageNumber");
	}
	
	ArrayList<CounselVO> list = dao.getcounselList(pageNumber);
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="test/html; charset=UTF-8">
	<meta name ="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://localhost:9000/waffles/css/bootstrap/bootstrap.css">
	<link rel="stylesheet" href="http://localhost:9000/waffles/css/bootstrap/custom.css">
	<link rel ="stylesheet" href ="http://localhost:9000/waffles/css/setupforcounsel.css">
	<title>관리자 수정 페이지</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
	<script src="http://localhost:9000/waffles/js/bootstrap.js"></script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class ="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expeanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="http://localhost:9000/waffles/admin/adminindex.jsp">관리자 수정 페이지</a>
		</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="http://localhost:9000/waffles/admin/adminindex.jsp">메인</a>
					<li class="active"><a href="#">메뉴관리</a></li>
					<li><a href="#">회원관리<span id="unread" class="label label-info"></span></a></li>
					<li><a href="http://localhost:9000/waffles/admin/counsel/counselList.jsp">창업상담내역</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="http://localhost:9000/waffles/index.jsp">메인으로</a>
					</li>
				</ul>						
			</div>
		</nav>
		<div class = "content_setup_faq">
	
		<section class = "section_setup_faq">
			<img src = "http://localhost:9000/waffles/images/setup/step1.PNG">
			<div> 창업상담내역 </div>
			<div></div>
		</section>
		
		<section class ="setup_faq_list">
			<table class = "content_layout_setup_faq">
				
				<tr>
					<td> 번호 </td>
					<td> 이름 </td>
					<td> 지역 </td>
					<td> 날짜 </td>
					<td> 조회수 </td>
				</tr>
				<% for(CounselVO vo : list) { %>
				<tr>
					<td><%= vo.getNum() %></td>
					<td><a href = "http://localhost:9000/waffles/admin/counsel/counsel_content.jsp?cid=<%=vo.getCid() %>&pnum=<%= pageNumber %>"><%= vo.getName() %></a></td>
					<td><a href = "http://localhost:9000/waffles/admin/counsel/counsel_content.jsp?cid=<%=vo.getCid() %>&pnum=<%= pageNumber %>"><%= vo.getLocal() %></a></td>
					<td><%= vo.getSubmittime() %></td>
					<td><%= vo.getViews() %></td>
				</tr>
				<% } %>
				<tr>
					<td colspan="5">
						<ul class = "pagination" style="margin: 0 auto;">
					<%
						int startPage = (Integer.parseInt(pageNumber) / 10) *10 +1; 
						if(Integer.parseInt(pageNumber) % 10 == 0) startPage -= 10;  
						int targetPage = new adminMenuDAO().targetPage(pageNumber);
						if(startPage != 1) {
					%>
						<li><a href="menuList.jsp?pageNumber=<%= startPage -1 %>"><span ><</span></a></li>
					<%
						} else {
					%>
						<li><span style="color: gray;"><</span></li>
					<%
						}
						for(int i = startPage; i < Integer.parseInt(pageNumber); i++) {
					%>
						<li><a href="menuList.jsp?pageNumber=<%= i %>" style="color: #000000;"><%= i %></a></li>
					<%
						}
					%>
						<li class="active_page" ><a href="menuList.jsp?pageNumber=<%= pageNumber %>" style="background-color: #3d2520;color: #ffffff;"><%= pageNumber %></a></li>
					<%
						for(int i = Integer.parseInt(pageNumber) + 1; i <= targetPage + Integer.parseInt(pageNumber); i++) {
							if(i < startPage +10) {
					%>
						<li><a href="menuList.jsp?pageNumber=<%= i %>" style="color: #000000;"><%= i %></a></li>
					<%
							}
						}
						if(targetPage + Integer.parseInt(pageNumber) > startPage + 9){
					%>
						<li><a href="menuList.jsp?pageNumber=<%= startPage + 10 %>"color: #000000;"><span>></span></a></li>
					<%
						} else {
					%>
						<li><span style="color: gray;">></span></li>
					<%		
						}
					%>
						</ul>	
					</td>
				</tr>
			</table>
		</section>
		<section class = "setup_faq_search">
			<select class = "search">
				<option value = "title">제목</option>
				<option value = "content">내용</option>
				<option value = "title+content">제목+내용</option>
				<option value = "writer">글쓴이</option>
			</select>
			
			<input type = "text" name = "search_text" class = "search_text">
			<button type = "button" class = "btn_search">검색</button>
			
		</section>
	</div>	
</body>
</html>