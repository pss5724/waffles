<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "com.waffles.dao.CounselDAO, com.waffles.vo.CounselVO, java.util.ArrayList" %>
<%
	request.setCharacterEncoding("utf-8");

	String id = null;
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}
	if(id == null || !id.equals("manager")) {
		response.sendRedirect("http://localhost:9000/waffles/index.jsp");
	}

	String email = request.getParameter("email");
	
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
	<script>
	$(document).ready(function() {
		
		/* 폼체크 */
		$("#counselBtn").click(function() {
			if($("#name").val() == "") {
				alert("제목을 입력해주세요");
				$("#name").focus();
				return false;
			} else if($("#content").val() == "") {
				alert("내용을 입력해주세요");
				$("#content").focus();
				return false;
			} else {
				setup_counsel_form.submit();
			}
		});
	});
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
					<li><a href="http://localhost:9000/waffles/admin/member/member_list.jsp">회원관리</a></li>
					<li class="active"><a href="http://localhost:9000/waffles/admin/counsel/counselList.jsp">창업상담내역
					<span id="unread" class="label label-info" style="position: relative; bottom: 2px; background-color:#D0B07E;"></span></a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="http://localhost:9000/waffles/index.jsp">메인으로</a>
					</li>
				</ul>						
			</div>
		</nav>
	<div class = "content_setup_counsel">
		<section>
			<img src = "../../images/setup/step1.PNG">
			<div> 창업상담 </div>
			<div></div><div> Keep in Touch</div><div></div>
		</section>
	
		<section class = "setup_counsel">
		
			<form name = "setup_counsel_form" action = "http://localhost:9000/waffles/emailSendServlet" method = "post" class = "content_layout_setup_counsel">
				<input type ="hidden" name = "email" value = <%= email %> >
				<ul>
					<li>
						<label style ="display : inline-block; position: relative; top: -3px;">E-mail 제목 </label>
						<input type = "text" name = "name" id = "name" style = "width: 800px;">
						<div></div>
					</li>
					<li>
						<label style ="display : inline-block; position: relative; top: -280px;">E-mail 내용 </label>
						<textarea name="content" id="content" style = "width: 800px; height: 300px;"></textarea>
						<div></div>
					</li>
					
					
					<li>
						<a href = "counselList.jsp"><button type = "button" class = "btn_counsel_1">취소</button></a>
						<button type = "submit" id = "counselBtn" class = "btn_counsel_2">확인</button>
					</li>
				
				</ul>
				
			
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
	
	
	