<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 - 문의사항 - 글쓰기 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
<script>
	
	$(document).ready(function() {
		
		$("#faqwriteBtn").click(function() {
			
			if($("#ftitle").val() == "") {
				alert("제목을 입력해주세요");
				$("#ftitle").focus();
				return false;
			}else if($("#fcontent").val() == "") {
				alert("내용을 입력해주세요");
				$("#fcontent").focus();
				return false;
			}else {
				faq_write.submit();
			}
		});
	});
</script>
</head>
<body>

	<!-- header -->
	<jsp:include page = "../../header.jsp">
	<jsp:param name="mainlabel" value="문의사항 " />
	<jsp:param name="sublabel" value=" Home > 고객센터 > 문의사항 > 글쓰기 "/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_setup_faq_write">
		<section>
			<div class = "title">문의사항</div>
			<form name = "faq_write" action = "#" method = "get">
				<table class = "content_layout_setup_faq_write">
				
					<tr>
						<th>제목</th>
						<td><input type = "text" name = "ftitle" id = "ftitle"></td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td><textarea name = "fcontent" id = "fcontent"></textarea></td>
					</tr>
					
					<tr>
						<td colspan = "2">
							<button type = "button" id = "faqwriteBtn" class = "btn_setup_faq">글쓰기</button>
							<button type = "reset" class = "btn_setup_faq">초기화</button>
							<a href = "faq_board.jsp"><button type = "button" class = "btn_setup_faq">목록</button></a>
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