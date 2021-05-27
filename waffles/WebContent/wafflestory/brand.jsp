<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/waffles/css/waffles_sg.css">
</head>
<body>
<jsp:include page="../header.jsp">
	<jsp:param name="mainlabel" value="와플대학스토리" />
	<jsp:param name="sublabel" value=" Home > 와플대학스토리 > Brand Story > 와플대학이걸어온길 " />
</jsp:include>
	<section class="brand">
		<div>
			<img src="http://localhost:9000/waffles/images/story/brand/brand1.JPG">
		</div>
		<div>
			<button type="button">와플대학이걸어온길</button>
		</div>
		<div>
			<img src="http://localhost:9000/waffles/images/story/brand/brand2.JPG">
			<div></div>
		</div>
		<div>
			<img src="http://localhost:9000/waffles/images/story/brand/brand3.JPG">
			<div></div>
		</div>
		<div>
			<img src="http://localhost:9000/waffles/images/story/brand/brand4.JPG">
			<div></div>
		</div>
		<div>
			<img src="http://localhost:9000/waffles/images/story/brand/brand5.JPG">
			<div class="lastLine"></div>
		</div>
	</section>
	
	
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>