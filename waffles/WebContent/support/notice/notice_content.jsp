<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 - 공지사항 - 게시물 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../../header.jsp">
	<jsp:param name="mainlabel" value="공지사항 " />
	<jsp:param name="sublabel" value=" Home > 고객센터 > 공지사항 > 게시물 "/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_setup_faq_content">
		<section>
			<div class = "title">공지사항</div>
			<form name = "faq_content" action = "#" method = "get">
				<table class = "content_layout_setup_faq_content">
				
					<tr>
						<th>제목</th>
						<td>1번 공지사항입니다.</td>
						<th>작성일</th>
						<td>21/05/6</td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td colspan = "3">내용<br><br><br></td>
					</tr>
					
					<tr>
						<td colspan = "4">
							<a href = "notice_update.jsp"><button type = "button" class = "btn_setup_faq">수정</button></a>
							<button type = "button" class = "btn_setup_faq">삭제</button>
							<a href = "notice_board.jsp"><button type = "button" class = "btn_setup_faq">목록</button></a>
							<a href = "../../index.jsp"><button type = "button" class = "btn_setup_faq">홈으로</button></a>
						</td>	
					</tr>
			
				</table>
			</form>	
		</section>
		
	</div>
	
	<!-- footer -->
	<jsp:include page = "../../footer.jsp"></jsp:include>
</body>
</html>