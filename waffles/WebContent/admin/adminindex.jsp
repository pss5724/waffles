<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
		String id = null;
		String save_id = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
		    for(Cookie co : cookies){
		        if(co.getName().equals("save_id")){
		        	save_id = co.getValue();
		        }else if(co.getName().equals("log_id")) {
		        	request.getSession().setAttribute("id", co.getValue());
		        }
		    }
		}
		if(session.getAttribute("id") != null){
			id = (String) session.getAttribute("id");
		}
		if(id == null || !id.equals("manager")) {
			response.sendRedirect("http://localhost:9000/waffles/index.jsp");
		}
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="test/html; charset=UTF-8">
	<meta name ="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://localhost:9000/waffles/css/bootstrap/bootstrap.css">
	<link rel="stylesheet" href="http://localhost:9000/waffles/css/bootstrap/custom.css">
	<title>관리자 수정 페이지</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="http://localhost:9000/waffles/js/bootstrap.js"></script>
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
					<li class="active"><a href="http://localhost:9000/waffles/admin/adminindex.jsp">메인</a>
					<li><a href="http://localhost:9000/waffles/admin/menu/menuList.jsp">메뉴관리</a></li>
					<li><a href="#">회원관리</a></li>
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