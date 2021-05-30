<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창업안내 - 창업FAQ - 수정하기 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
</head>
<body>

	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="FAQ 글수정하기 " />
	<jsp:param name="sublabel" value=" Home > 창업안내 > 창업 FAQ > 수정하기 "/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_setup_faq_write">
		<section>
			<div class = "title">FAQ 수정하기</div>
			<form name = "faq_update" action = "#" method = "get">
				<table class = "content_layout_setup_faq_write">
				
					<tr>
						<th>제목</th>
						<td><input type = "text" name = "utitle" value = "FAQ 수정하기 "></td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td><textarea name = "fcontent">dpdpdppqjpdqdjpq 수정하기 내용 어머베제엦</textarea></td>
					</tr>
					
					<tr>
						<td colspan = "2">
							<button type = "button" class = "btn_setup_faq">수정하기</button>
							<button type = "reset" class = "btn_setup_faq">초기화</button>
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