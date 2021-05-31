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
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/waffles_ss.css">
</head>
<body>
	<jsp:include page="../../header.jsp">
	<jsp:param name="mainlabel" value="와플대학스토리"/>
	<jsp:param name="sublabel" value=" Home > 고객센터 > 문의 게시판 > 게시물작성 " />
	</jsp:include>
	
	<!-- content -->
	<div class="notice_write_content">
	
		
		<section class="notice_content">
			<img src="../../images/setup/step1.PNG">
			<p> 문의 게시판 </p>
		</section>
		
		<section class="notice_write">
			<form name="notice_write" action="#" method="get">
			<table class="notice_write_table">
				<tr>
					<th>제목</th>
					<td><input type="text" name="ntitle" id="ntitle"></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td><textarea class="ncontent"></textarea></td>
				</tr>
			
				<tr>
					<th>파일</th>
					<td><input type="file" name="nfile"></td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="notice_content_submit">
						<button type="button" class="notice_submitbtn" >저장</button>
						<button type="reset" class="notice_resetbtn">취소</button>
						</div>
						<div class="notice_content_listbtn">
						<a href="faq_board.jsp"><button type="button" class="listbtn">목록</button></a>
						</div>
					</td>
				</tr>
			</table>
			</form>
		</section>	
	</div>
	<!-- content end -->
	
		<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>