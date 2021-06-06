<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 - 문의사항 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
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
				
				<tr>
					<td>1</td>
					<td><a href = "notice_content.jsp">1번 문의사항입니다.</a></td>
					<td>테스터</td>
					<td>21/05/06</td>
					<td>2</td>
				</tr>
				
				
				
				
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
			
			<a href = "faq_write.jsp"><button type = "button" class = "btn_setup_faq_write">글쓰기</button></a>
		</section>
		
	</div>	
	
	
	<!-- footer -->
	<jsp:include page = "../../footer.jsp"></jsp:include>
	
	
</body>
</html>