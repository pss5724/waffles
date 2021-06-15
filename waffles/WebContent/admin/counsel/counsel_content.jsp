<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "com.waffles.dao.CounselDAO, com.waffles.vo.CounselVO, java.util.ArrayList" %>
<%
	request.setCharacterEncoding("utf-8");
%>   
<%
	CounselDAO dao = new CounselDAO();
	ArrayList<CounselVO> list = dao.getcounselList(request.getParameter("pnum"));
	String cid = request.getParameter("cid");
	CounselVO vo = new CounselVO();
	for(int i = 0; i<list.size(); i++ ){
		if(list.get(i).getCid().equals(cid)) {
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
					<li><a href="#">메뉴관리</a></li>
					<li><a href="#">회원관리<span id="unread" class="label label-info"></span></a></li>
					<li class="active"><a href="counselList.jsp">창업상담내역</a></li>
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
			<div class = "title">FAQ 내용보기</div>
			<div class = "line"></div>
		</section>
	
		<section>
			<form name = "faq_content" action = "#" method = "get">
				<h3><%= vo.getLocal() + " 지역 창업 희망" %></h3>
				<div>신청인 <%= vo.getName() %></div>
				<div>조회수 <%= vo.getViews()+1 %></div>
				<hr style="display: inline-block; width:100%;">
				<div class="counsel_content">
					<div>이메일 주소 : <%= vo.getEmail() %></div>
					<div>연락처 : <%= vo.getHp() %></div>
					<div>알게된 경로 : <%= vo.getRoute() %></div>
					<div>기타 문의 사항 : <%= vo.getEtc() %></div>
				</div>
				<hr>
				<button type = "button" class = "btn_setup_faq">이메일 답장</button>
				<a href = "counselList.jsp"><button type = "button" class = "btn_setup_faq">목록</button></a>
				<a href = "http://localhost:9000/waffles/admin/adminindex.jsp"><button type = "button" class = "btn_setup_faq">홈으로</button></a>
			</form>	
		</section>
		
	</div>
</body>
</html>
	
	
	