<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = null;
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 - 공지사항 - 글쓰기 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
<script>
	
	$(document).ready(function() {
		
		$("#faqwriteBtn").click(function() {
			
			if($("#ntitle").val() == "") {
				alert("제목을 입력해주세요");
				$("#ntitle").focus();
				return false;
			}else if($("#ncontent").val() == "") {
				alert("내용을 입력해주세요");
				$("#ncontent").focus();
				return false;
			}else {
				notice_write.submit();
			}
		});
	});
</script>
<style>
	input[type=file] { 
 		margin-left: 10px; 
 		border:none;
 	} 
</style>
</head>
<body>

	<!-- header -->
	<jsp:include page = "../../header.jsp">
	<jsp:param name="mainlabel" value="공지사항 " />
	<jsp:param name="sublabel" value=" Home > 고객센터 > 공지사항 > 글쓰기 "/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_setup_faq_write">
		<section>
			<div class = "title">공지사항</div>
			<form name = "notice_write" action="noticeWriteProcess.jsp" method = "post" enctype="multipart/form-data">
				<table class = "content_layout_setup_faq_write">
						<tr>
						<th>작성자</th>
						<td><input type = "text" name = "name" id = "name" value="와플대학관리자" readonly></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type = "text" name = "ntitle" id = "ntitle"></td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td><textarea name = "ncontent" id = "ncontent"></textarea></td>
					</tr>
					<tr>
						<th>파일</th>
						<td><input type="file" name="nfile"></td>
					</tr>
					<tr>
						<td colspan = "2">
							<button type = "button" id = "faqwriteBtn" class = "btn_setup_faq">글쓰기</button>
							<button type = "reset" class = "btn_setup_faq">초기화</button>
							<a href = "notice_list.jsp"><button type = "button" class = "btn_setup_faq">목록</button></a>
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