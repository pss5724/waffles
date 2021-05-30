<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창업안내 - 창업FAQ - 글 내용 | 와플대학</title>
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
			<div class = "title">FAQ 내용보기</div>
			<form name = "faq_content" action = "#" method = "get">
				<table class = "content_layout_setup_faq_content">
				
					<tr>
						<th>제목</th>
						<td>setup_faq_제목</td>
						<th>작성일</th>
						<td>21/05/30</td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td colspan = "3">setup_faq_내용jdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
						ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
						ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
						ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
						ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</td>
					</tr>
					
					<tr>
						<td colspan = "4">
							<a href = "setup_faq_update.jsp"><button type = "button" class = "btn_setup_faq">수정</button></a>
							<button type = "button" class = "btn_setup_faq">삭제</button>
							<a href = "setup_faq.jsp"><button type = "button" class = "btn_setup_faq">목록</button></a>
							<a href = "../index.jsp"><button type = "button" class = "btn_setup_faq">홈으로</button></a>
						</td>	
					</tr>
			
				</table>
			</form>	
		</section>
		
	</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
</body>
</html>