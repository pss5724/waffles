<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.waffles.vo.QuestionVO, com.waffles.dao.QuestionDAO, java.util.ArrayList" %>
<%
	request.setCharacterEncoding("utf-8");

	QuestionDAO dao = new QuestionDAO();
	ArrayList<QuestionVO> list = dao.getList();
	
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창업안내 - 창업FAQ | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="창업 FAQ" />
	<jsp:param name="sublabel" value=" Home > 창업안내 > 창업 FAQ "/>
	</jsp:include>
	
	
	<!-- content -->
	<div class = "content_setup_faq">
	
		<section class = "section_setup_faq">
			<img src = "../images/setup/step1.PNG">
			<div> 창업FAQ </div>
			<div></div>
		</section>
		
		<section class ="setup_faq_list">
			<table class = "content_layout_setup_faq">
				
				<tr>
					<th> 번호 </th>
					<th> 제목 </th>
					<th> 글쓴이 </th>
					<th> 날짜 </th>
					<th> 조회수 </th>
				</tr>
				
				<% for(QuestionVO vo : list) { %>
				<tr>
					<td><%= vo.getRno() %></td>
					<td><a href = "setup_faq_content.jsp?qid=<%= vo.getQid() %>%rno=<%= vo.getRno() %>"><%= vo.getQtitle() %></a></td>
					<td><%= vo.getQwriter() %></td>
					<td><%= vo.getQdate() %></td>
					<td><%= vo.getQhit() %></td>
				</tr>
				<% } %>
				
				
			</table>
		</section>
		
		<section class = "setup_faq_search">
			<select class = "search">
				<option value = "title">제목</option>
				<option value = "content">내용</option>
				<option value = "title+content">제목+내용</option>
				<option value = "writer">글쓴이</option>
			</select>
			
			<input type = "text" name = "search_text" class = "search_text">
			<button type = "button" class = "btn_search">검색</button>
		</section>
		
	</div>	
	
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
	
</body>
</html>