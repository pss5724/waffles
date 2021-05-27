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
	<jsp:param name="sublabel" value=" Home > 와플대학스토리 > 와플대학협동조합 " />
</jsp:include>
	<section class="union">
		<div>
			<img src="http://localhost:9000/waffles/images/story/union/history.png">
		</div>
	</section>
	
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>