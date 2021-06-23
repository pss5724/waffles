<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.waffles.dao.*, com.waffles.vo.*, java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
	FaqDAO dao = new FaqDAO();

	
	String search_text = request.getParameter("search_text");
	String search = request.getParameter("search");
	
	
	String pageNumber = "1"; 
	if(request.getParameter("pageNumber") != null) {
		pageNumber = request.getParameter("pageNumber");
	}
	
	ArrayList<FaqVO> list = new ArrayList<FaqVO>(); 
	
	if(search_text == null || search_text.equals("null") || search_text.equals("")) {
		list = dao.getList(pageNumber);
	} else {
		list = dao.getList(pageNumber,search,search_text);
	}
	
	String id = null;
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}
	
	
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 - 문의사항 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<link rel="stylesheet" href="http://localhost:9000/waffles/css/bootstrap/bootstrap.css">
	<link rel="stylesheet" href="http://localhost:9000/waffles/css/bootstrap/custom.css">
	<link rel ="stylesheet" href ="http://localhost:9000/waffles/css/setupforcounsel.css">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
	<script src="http://localhost:9000/waffles/js/bootstrap.js"></script>
<style>
	table tr:first-child th {
		text-align:center;
		font-wegiht :1000;
		font-size : 16px;
	}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../../header.jsp">
	<jsp:param name="mainlabel" value="문의사항" />
	<jsp:param name="sublabel" value=" Home > 고객센터 > 문의사항 "/>
	</jsp:include>
	
	
	<!-- content -->
	<div class = "content_setup_faq">
	
		<section class = "section_setup_faq">
			<img src = "../../images/setup/step1.PNG">
			<div> 문의사항 </div>
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
				<% for(int i = 0; i<list.size(); i++) {%>
				<tr>
					<td><%= list.get(i).getRno() %></td>
					<td style="width: 500px; text-align: left; padding-left:10px;">
					<% if(list.get(i).getPass() == null || list.get(i).getPass().equals("")) { %>
						<% if(list.get(i).getBoardlevel() > 0) { %>
							<% for(int j =0;j<list.get(i).getBoardlevel();j++) { %>
								&nbsp;&nbsp;&nbsp;&nbsp;
							<% } %>
							↳&nbsp;(답글)
						<% } %>
						<a href="faq_content.jsp?fid=<%=list.get(i).getFid()%>&rno=<%=list.get(i).getRno()%>">
						<%=list.get(i).getFtitle() %>
						</a>
					<% } else { %>
						<% if(list.get(i).getBoardlevel() > 0) { %>
							<% for(int j =0;j<list.get(i).getBoardlevel();j++) { %>
								&nbsp;&nbsp;&nbsp;&nbsp;
							<% } %>
							↳&nbsp;(답글)
						<% } %>
							<%if(id == null || !id.equals("manager")) { %>
								<a href="faq_content_pass.jsp?fid=<%=list.get(i).getFid()%>&rno=<%=list.get(i).getRno()%>">
								(비밀글 입니다.)</a>
							<% } else { %>
								<a href="faq_content.jsp?fid=<%=list.get(i).getFid()%>&rno=<%=list.get(i).getRno()%>">
								(비밀글 입니다.)</a>
							<% } %>
					<% } %>
					</td>
					<td><%= list.get(i).getName() %></td>
					<td><%= list.get(i).getFdate() %></td>
					<td><%= list.get(i).getFhit() %></td>
				</tr>
				<%} %>
				<tr>
					<td colspan="5">
						<ul class = "pagination" style="margin: 0 auto;">
					<%
						int startPage = (Integer.parseInt(pageNumber) / 10) *10 +1; 
						if(Integer.parseInt(pageNumber) % 10 == 0) startPage -= 10;
						int targetPage =0;
						if(search_text == null || search_text.equals("")  || search_text.equals("null")) {
							targetPage = dao.targetPage(pageNumber);
						}else{
							targetPage = dao.targetPage(pageNumber, search, search_text);
						}
						if(startPage != 1) {
					%>
						<li><a href="faq_list.jsp?pageNumber=<%= startPage -1 %>&search=<%= search %>&search_text=<%= search_text %>"><span ><</span></a></li>
					<%
						} else {
					%>
						<li><span style="color: gray;"><</span></li>
					<%
						}
						for(int i = startPage; i < Integer.parseInt(pageNumber); i++) {
					%>
						<li><a href="faq_list.jsp?pageNumber=<%= i %>&search=<%= search %>&search_text=<%= search_text %>" style="color: #000000;"><%= i %></a></li>
					<%
						}
					%>
						<li class="active_page" ><a href="faq_list.jsp?pageNumber=<%= pageNumber %>&search=<%= search %>&search_text=<%= search_text %>" style="background-color: #3d2520;color: #ffffff;"><%= pageNumber %></a></li>
					<%
						for(int i = Integer.parseInt(pageNumber) + 1; i <= targetPage + Integer.parseInt(pageNumber); i++) {
							if(i < startPage +10) {
					%>
						<li><a href="faq_list.jsp?pageNumber=<%= i %>&search=<%= search %>&search_text=<%= search_text %>" style="color: #000000;"><%= i %></a></li>
					<%
							}
						}
						if(targetPage + Integer.parseInt(pageNumber) > startPage + 9){
					%>
						<li><a href="faq_list.jsp?pageNumber=<%= startPage + 10 %>&search=<%= search %>&search_text=<%= search_text %>"color: #000000;"><span>></span></a></li>
					<%
						} else {
					%>
						<li><span style="color: gray;">></span></li>
					<%		
						}
					%>
						</ul>	
					</td>
				</tr>
				
			</table>
		
		</section>
		
		<section class = "setup_faq_search">
			<form name = "faq_list" action="faq_list.jsp" method = "post">

			<select name="search" class = "search">
				<option value = "title">제목</option>
				<option value = "content">내용</option>
				<option value = "titleContent">제목+내용</option>
				<option value = "writer">글쓴이</option> 
			</select>
			<input type = "text" name = "search_text" class = "search_text">
			<button type = "submit" class = "btn_search">검색</button>
			</form>
			
			<a href = "faq_write.jsp"><button type = "button" class = "btn_setup_faq_write">글쓰기</button></a>
		</section>
		
	</div>	
	
	
	<!-- footer -->
	<jsp:include page = "../../footer.jsp"></jsp:include>
	
	
</body>
</html>