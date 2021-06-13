<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.waffles.dao.*, com.waffles.vo.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String fid = request.getParameter("fid");
	FaqDAO dao = new FaqDAO();
	FaqVO vo = dao.getContent(fid);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 - 문의사항 - 게시물 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../../header.jsp">
	<jsp:param name="mainlabel" value="문의사항 " />
	<jsp:param name="sublabel" value=" Home > 고객센터 > 문의사항 > 게시물 "/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_setup_faq_content">
		<section>
			<img src = "../../images/setup/step1.PNG">
			<div class = "title">문의사항</div>
			<div class = "line"></div>
		</section>
		<section>
			<form name = "faq_content" action = "#" method = "get">
				<h3><%=vo.getRno() %></h3>
				<div>작성자 <%=vo.getName() %>		작성날짜  <%=vo.getFdate() %> 조회수  <%=vo.getFhit() %></div>
				<hr>
				<div>내용 <%=vo.getFcontent() %></div>
				<hr>
				<a href = "faq_update.jsp"><button type = "button" class = "btn_setup_faq">수정</button></a>
				<button type = "button" class = "btn_setup_faq">삭제</button>
				<a href = "faq_list.jsp"><button type = "button" class = "btn_setup_faq">목록</button></a>
				<a href = "../../index.jsp"><button type = "button" class = "btn_setup_faq">홈으로</button></a>
			</form>	
		</section>
			
		
		
	</div>
	
	<!-- footer -->
	<jsp:include page = "../../footer.jsp"></jsp:include>
</body>
</html>