<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.waffles.vo.*, com.waffles.dao.*" %>
<%
	request.setCharacterEncoding("utf-8");

	MemberVO vo = new MemberVO();
	MemberDAO dao = new MemberDAO();
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	boolean result = dao.getFindpassUpdate(pass, id);
	
	if(result = false) {
		response.sendRedirect("findPassFail.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 비밀번호 설정 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
</head>
<body>

	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="새 비밀번호 설정" />
	<jsp:param name="sublabel" value=" Home > 아이디 / 비밀번호 찾기 > 새 비밀번호 설정 "/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_idfind">
		<section>
			<img src = "../images/setup/step1.PNG">
			<h1 class = "title_idfind"> 새 비밀번호 설정 성공 </h1>
			<h3>비밀번호 설정이 완료되었습니다.</h3>
			<a href = "login.jsp"><button type = "button" class = "btn_loginsuccess">로그인하기</button></a>
			<a href = "../index.jsp"><button type = "button" class = "btn_loginsuccess">홈으로</button></a>
		</section>
	</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>

</body>
</html>