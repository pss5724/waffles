<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.waffles.dao.*, com.waffles.vo.*,java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = null;
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}
// 	if(id == null || !id.equals("manager")) {
// 		response.sendRedirect("http://localhost:9000/waffles/index.jsp"); 
// 	}

	String search = request.getParameter("search");
	String search_text = request.getParameter("search_text");	
	
	
      MemberDAO dao = new MemberDAO();
      
      String pageNumber = "1";
      
  	if(request.getParameter("pageNumber") != null) {
  		pageNumber = request.getParameter("pageNumber");
  	}
  	 
  	ArrayList<MemberVO> list = new ArrayList<MemberVO>();
  	
  	if(search_text == null || search_text.equals("") || search_text.equals("null")) {
  		list = dao.getList(pageNumber);
  	} else {
  		list = dao.getList(pageNumber,search,search_text);
  	}
      
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="test/html; charset=UTF-8">
	<meta name ="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://localhost:9000/waffles/css/bootstrap/bootstrap.css">
	<link rel="stylesheet" href="http://localhost:9000/waffles/css/bootstrap/custom.css">
	<link rel ="stylesheet" href ="http://localhost:9000/waffles/css/setupforcounsel.css">
	<title>관리자 수정 페이지</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
	<script src="http://localhost:9000/waffles/js/bootstrap.js"></script>
<style>
	table tr:first-child th{
		text-align : center;
	}
</style>
<script type="text/javascript">
		function getUnread() {
			$.ajax({
				type: "POST",
				url: "http://localhost:9000/waffles/counselUnread",
				data: {
					userID: encodeURIComponent('<%= id %>'),
				},
				success: function(result) {
					if(result >= 1) {
						showUnread(result);
					} else {
						showUnread('');
					}				
				}
			});
		}
		function getInfiniteUnread() {
			setInterval(function() {
				getUnread();
			}, 4000);
		}
		function showUnread(result) {
			$('#unread').html(result);
		}
	</script>
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
					<li><a href="http://localhost:9000/waffles/admin/menu/menuList.jsp">메뉴관리</a></li>
					<li class="active"><a href="http://localhost:9000/waffles/admin/member/member_list.jsp">회원관리</a></li>
					<li><a href="http://localhost:9000/waffles/admin/counsel/counselList.jsp">창업상담내역
					<span id="unread" class="label label-info" style="position: relative; bottom: 2px; background-color:#c59d5f;"></span></a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="http://localhost:9000/waffles/index.jsp">메인으로</a>
					</li>
				</ul>						
			</div>
		</nav>
	
	<!-- content -->
	<div class = "content_setup_faq">
	
		<section class = "section_setup_faq">
			<img src = "../../images/setup/step1.PNG">
			<div> 회원관리 </div>
			<div></div>
		</section>
	
		<section class ="setup_faq_list">
			<table class = "content_layout_setup_faq">
				
				<tr>
					<th> 번호 </th>
					<th> 아이디 </th>
					<th> 이름 </th>
					<th> 이메일 </th>
					<th> 가입날짜 </th>
					<th> 회원탈퇴 </th>
				</tr>
				<% for(MemberVO vo : list){ %>
				<tr>
					<td><%= vo.getRno() %></td>
					<td><%=vo.getId() %></td>
					<td><%= vo.getName() %></td>
					<td><%= vo.getEmail() %></td>
					<td><%= vo.getMdate() %></td>
					<td>
						<% if(vo.getChoice()==0){ %>
						<button type="button" style="border:1px solid lightgray; border-radius:5px;"disabled>승인</button>
						<%} else{ %>
						<form name = "member_delete" action="memberDeleteProcess.jsp" method = "post">
						<input type="hidden" name="id" value="<%=vo.getId() %>">
						<button type="submit" style="background-color:red; color:white; border:1px solid lightgray; border-radius:5px;">승인</button>
						</form>
						<%} %>
					</td>
				</tr>
				<%} %>
			<tr>
					<td colspan="6">
						<ul class = "pagination" style="margin: 0 auto;">
					<%
						int startPage = (Integer.parseInt(pageNumber) / 10) *10 +1; 
						if(Integer.parseInt(pageNumber) % 10 == 0) startPage -= 10;
						int targetPage =0;
						if(search_text == null || search_text.equals("")  || search_text.equals("null")) {
							targetPage = dao.targetPage(pageNumber);
						}else{
							targetPage = dao.targetPage(pageNumber, search, search_text);
						}
						if(startPage != 1) {
					%>
						<li><a href="member_list.jsp?pageNumber=<%= startPage -1 %>&search=<%= search %>&search_text=<%= search_text %>"><span ><</span></a></li>
					<%
						} else {
					%>
						<li><span style="color: gray;"><</span></li>
					<%
						}
						for(int i = startPage; i < Integer.parseInt(pageNumber); i++) {
					%>
						<li><a href="member_list.jsp?pageNumber=<%= i %>&search=<%= search %>&search_text=<%= search_text %>" style="color: #000000;"><%= i %></a></li>
					<%
						}
					%>
						<li class="active_page" ><a href="member_list.jsp?pageNumber=<%= pageNumber %>&search=<%= search %>&search_text=<%= search_text %>" style="background-color: #3d2520;color: #ffffff;"><%= pageNumber %></a></li>
					<%
						for(int i = Integer.parseInt(pageNumber) + 1; i <= targetPage + Integer.parseInt(pageNumber); i++) {
							if(i < startPage +10) {
					%>
						<li><a href="member_list.jsp?pageNumber=<%= i %>&search=<%= search %>&search_text=<%= search_text %>" style="color: #000000;"><%= i %></a></li>
					<%
							}
						}
						if(targetPage + Integer.parseInt(pageNumber) > startPage + 9){
					%>
						<li><a href="member_list.jsp?pageNumber=<%= startPage + 10 %>&search=<%= search %>&search_text=<%= search_text %>"color: #000000;"><span>></span></a></li>
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
			<form name = "setup_counsel_form" action ="http://localhost:9000/waffles/admin/member/member_list.jsp" method = "post">
				<select class = "search" name = "search" style = "width: 70px; height: 27px">
					<option value = "id">아이디</option>
					<option value = "name">이름</option>
				</select>
				
				<input type = "text" name = "search_text" class = "search_text" style = "width: 300px; margin: 0 10px;">
				<button type = "submit" class = "btn_search">검색</button>
			</form>
		</section>
		
	</div>
	<%
			if(id != null) {
		%>
			<script type="text/javascript">
				$(document).ready(function () {
					getUnread();
					getInfiniteUnread();
				});
			</script>		
		<%
			}
		%>
</body>
</html>