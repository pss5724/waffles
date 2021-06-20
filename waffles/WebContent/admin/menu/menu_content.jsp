<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "com.waffles.dao.adminMenuDAO, com.waffles.vo.MenuVO, java.util.ArrayList" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = null;
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}
	if(id == null || !id.equals("manager")) {
		response.sendRedirect("http://localhost:9000/waffles/index.jsp");
	}
	adminMenuDAO dao = new adminMenuDAO();
	String pnum = request.getParameter("pnum");
	ArrayList<MenuVO> list = dao.getcounselList(pnum);
	String cid = request.getParameter("cid");
	MenuVO vo = new MenuVO();
	for(int i = 0; i<list.size(); i++ ){
		if(list.get(i).getName().equals(cid)) {
			vo = list.get(i);
		}
		
	}
	if(vo != null) dao.getUpdateHit(cid);
	
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
function deleteFunction() {
	if (confirm("정말 이 데이터를 삭제 하시겠습니까?")) {
		faq_content.submit();         
    } else {
    	alert("삭제을 취소했습니다.");
    }
}
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
					<li class="active"><a href="http://localhost:9000/waffles/admin/menu/menuList.jsp">메뉴관리</a></li>
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
	<div class = "content_setup_faq_content">
		<section>
			<img src = "http://localhost:9000/waffles/images/setup/step1.PNG">
			<div class = "title">메뉴상세내용</div>
			<div class = "line"></div>
		</section>
	
		<section>
			<form name = "faq_content" action = "../../MenuDeleteServlet" method = "post">
				<input type="hidden" name="name" value=<%= vo.getName() %>>
				<h3><%= vo.getName()%></h3>
				<div>종류 <%= vo.getKind() %></div>
				<hr style="display: inline-block; width:100%;">
				<div class="counsel_content">
					<div style="margin-bottom: 50px">설명 : <%= vo.getExplain() %></div>
					<div style="display:inline-block;">이미지 : <img src="http://localhost:9000/waffles/images/menu/<%= vo.getImg() %>" style ="width:200px; height:200px;"></div>
					<div style="float:right;">상세 내용 이미지 : <img src="http://localhost:9000/waffles/images/menu/<%= vo.getIngredient() %>"style ="width:600px; height:200px;"></div>
				</div>
				<hr>
				<button type = "button" class = "btn_setup_faq" onclick="location.href='http://localhost:9000/waffles/admin/menu/menuUpdate.jsp?name=<%= vo.getName() %>&pnum=<%= pnum %>'">수정</button>
				<button type = "button" class = "btn_setup_faq" onclick= "deleteFunction();">삭제</button>
				
				<a href = "menuList.jsp"><button type = "button" class = "btn_setup_faq">목록</button></a>
				<a href = "http://localhost:9000/waffles/admin/adminindex.jsp"><button type = "button" class = "btn_setup_faq">홈으로</button></a>
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
	
	
	