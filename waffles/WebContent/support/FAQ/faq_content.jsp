<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%
	request.setCharacterEncoding("utf-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "http://localhost:9000/test/css/waffles_ss.css">
</head>
<body>
<!-- header -->
	<jsp:include page="../../header.jsp">
	<jsp:param name="mainlabel" value="와플대학스토리"/>
	<jsp:param name="sublabel" value=" Home > 고객센터 > 문의 게시판 > 게시물 " />
	</jsp:include>
<!-- header end -->
	
<!-- content  -->
	<div class="content_notice">
	
		<section class="notice_content">
			<img src="../../images/setup/step1.PNG">
			<p> 문의 게시판 </p>
		</section>
		
		<section class="notice_board_content">
			<table class="notice_content_table">
				<tr>
					<th colspan="4" class="notice_content_title">관리자님 문의 사항입니다~~~~</th>
				</tr>
				<tr>
					<th>작성자 ㅁㄴㅇ</th>
					<th>21-05-29 15:00</th>
					<th>조회120회</th>
					<th>댓글0건</th>
				</tr>
				<tr>
					<td colspan="4">와플 맛있나요 <br><br><br><br><br><br> <td>
				</tr>	
				
			</table>
			
			<div class="notice_content_deletebtn">
			<button type="button" class="deletebtn">삭제</button>
			</div>
			<div class="notice_content_listbtn">
			<a href="http://localhost:9000/test/support/FAQ/faq_board.jsp"><button type="button" class="listbtn">목록</button></a>
			</div>
		</section>
	</div>
<!-- content end -->

<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
<!-- footer end -->	
</body>
</html>