<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.waffles.vo.*, com.waffles.dao.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1 + "@" + email2;

	
	MemberDAO dao = new MemberDAO();
	MemberVO vo = dao.getFindidResult(name, email);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
</head>
<body>

	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="아이디 찾기" />
	<jsp:param name="sublabel" value=" Home > 아이디 / 비밀번호 찾기 > 아이디 찾기"/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_idfind">
		<section>
			<img src = "../images/setup/step1.PNG">
			<h1 class = "title_idfind"> 아이디 찾기 </h1>
			
			<% if(vo.getId() != null) { %>
			<h3>찾으시는 아이디는</h3>
			<div class = "find_id_check1" style="width:500px; position:relative; left:290px; margin:60px;"><%= vo.getId() %></div>
			<%} else { %>
			<div class = "find_id_check2" style="width:500px; position:relative; left:290px; margin:60px;">찾으시는 아이디 값이 없습니다.</div>
			<% } %>
			
			<a href = "login.jsp"><button type = "button" class = "btn_loginsuccess">로그인하기</button></a>
			<a href = "../index.jsp"><button type = "button" class = "btn_loginsuccess">홈으로</button></a>
		</section>
	</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>

</body>
</html>