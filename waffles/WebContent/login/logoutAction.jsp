<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="test/html; charset=UTF-8">
	<title>JSP Ajax 실시간 회원제 채팅 서비스</title>
</head>
<body>
	<% 
		session.invalidate();
	
		Cookie[] cookies = request.getCookies();
	    if(cookies!=null){
	        for(Cookie tempCookie : cookies){
	            if(tempCookie.getName().equals("log_id")){
	                tempCookie.setMaxAge(0);
	                tempCookie.setPath("/");
	                response.addCookie(tempCookie);
	                
	            }
	        }
	    }
	%>
	<script>
		location.href = '../index.jsp';
	</script>
</body>
</html>