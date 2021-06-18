<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.waffles.vo.QuestionVO, com.waffles.dao.QuestionDAO" %>
<%
	request.setCharacterEncoding("utf-8");

	String qid = request.getParameter("qid");
	String rno = request.getParameter("rno");
	
	QuestionDAO dao = new QuestionDAO();
	QuestionVO vo = dao.getContent(qid);
	if(vo != null) dao.getUpdateHit(qid);
	
	String content = vo.getQcontent().replace("\r\n", "<br>");
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 창업FAQ - 글 내용 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="창업 FAQ " />
	<jsp:param name="sublabel" value=" Home > 창업안내 > 창업 FAQ > 내용보기 "/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_setup_faq_content">
		<section>
			<img src = "../images/setup/step1.PNG">
			<div class = "title">FAQ 내용보기</div>
			<div class = "line"></div>
		</section>
	
		<section>
			<form name = "faq_content" action = "#" method = "get">
				<input type = "hidden" name = "qid" value = "<%= qid %>">
				<div><%= vo.getQtitle() %></div>
				<div>
					<div>작성자 <%= vo.getQwriter()%>	</div>
					<div>
					조회 <%=vo.getQhit() %> 회
					&nbsp&nbsp&nbsp
					<%=vo.getQdate()%>
					</div>
				</div>
				<hr style="display: inline-block; width: 100%;">
				<div><%= content %></div>
				<hr>
				<a href = "setup_faq.jsp"><button type = "button" class = "btn_setup_faq">목록</button></a>
				<a href = "../index.jsp"><button type = "button" class = "btn_setup_faq">홈으로</button></a>
			</form>	
		</section>
		
	</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
</body>
</html>