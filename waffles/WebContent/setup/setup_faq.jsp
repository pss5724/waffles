<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.waffles.vo.QuestionVO, com.waffles.dao.QuestionDAO, java.util.ArrayList" %>
<%
	request.setCharacterEncoding("utf-8");

	QuestionDAO dao = new QuestionDAO();
	ArrayList<QuestionVO> list = dao.getList();
	
	 String keyField = request.getParameter("keyField");
    String keyWord = request.getParameter("keyWord");
	
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창업안내 - 창업FAQ | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
<script>
	
	/* 제목, 글쓴이 검색 기능 */
	$(document).ready(function() {
		$("#btn_search").click(function() {
			var value = $("#search_input").val().toLowerCase();
			$("#tbody tr").hide();
			var select = $("#select_search").val();
			if (select == "title") {
				var value = $("#tbody td:nth-child(2):contains('" + value + "') ");
				$(value).parent().show();
			} else if (select = "writer"){
				var value = $("#tbody td:nth-child(3):contains('" + value + "') ");
				$(value).parent().show();
		        }
		});
	});
    


</script>

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
				<thead>
				<tr>
					<th> 번호 </th>
					<th> 제목 </th>
					<th> 글쓴이 </th>
					<th> 날짜 </th>
					<th> 조회수 </th>
				</tr>
				</thead>
				
				<tbody id = "tbody">
				
				<% for(QuestionVO vo : list) { %>
				<tr>
					<td><%= vo.getRno() %></td>
					<td><a href = "setup_faq_content.jsp?qid=<%= vo.getQid() %>&rno=<%= vo.getRno() %>"><%= vo.getQtitle() %></a></td>
					<td><%= vo.getQwriter() %></td>
					<td><%= vo.getQdate() %></td>
					<td><%= vo.getQhit() %></td>
				</tr>
				<% } %>
				
				</tbody>
				
				
			</table>
		</section>
		
		<section class = "setup_faq_search">
			<select class = "search" id = "select_search">
				<option value = "title" id = "title">제목</option>
				<option value = "writer" id = "writer">글쓴이</option>
			</select>
			
			<input type = "text" name = "search_text" id = "search_input" class = "search_text">
			<button type = "button" class = "btn_search" id = "btn_search" name = "btn_search">검색</button>
		</section>
		
	</div>	
	
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
	
</body>
</html>