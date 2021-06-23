<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "com.waffles.dao.CounselDAO, com.waffles.vo.CounselVO, java.util.ArrayList" %>
<%
	request.setCharacterEncoding("utf-8");

	String id = null;
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}
	if(id != null){
			
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="test/html; charset=UTF-8">
	<meta name ="viewport" content="width=device-width, initial-scale=1">
	<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
	<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
	<script>
		
		/* 폼체크 */
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
	<jsp:include page = "../../header.jsp">
	<jsp:param name="mainlabel" value="문의사항 " />
	<jsp:param name="sublabel" value=" Home > 고객센터 > 문의사항 > 글쓰기 "/>
	</jsp:include>
	<div class = "content_setup_faq_write">
		<section>
			<div class = "title">문의하기</div>
	
			<form name = "faq_write" action = "faqWriteProcess.jsp" method = "post" class = "content_layout_setup_counsel" enctype="multipart/form-data">
				<ul>
					<li>
						<label> 작성자 </label>
						<input type = "text" name = "name" id = "name" value="<%=id %>" readonly>
						<input style="float: right; margin-right: 80px;" type = "password" name = "pass" id = "name">
						<label style="float: right; width:100px;"> 비밀번호 </label>
						<div></div>
					</li>
					<li>
						<label> 제목 </label>
						<input type = "text" name = "ftitle" id = "ftitle" style="width:800px; height: 30px;">
						<div></div>
					</li>
					
					<li>
						<label style="position: relative; top:-280px;"> 문의 내용 </label>
						<textarea name="fcontent" id="fcontent" style="width:800px; height: 300px; resize:none;"></textarea>
						<div></div>
					</li>
					<li style=" height: 50px;">
						<label style="float:left;"> 이미지파일</label>
						<input type="file" name="ffile" id="image" style="float:left;">
					</li>
					<li style="text-align:center; display: block;">
						<button type = "button" id = "faqwriteBtn" class = "btn_setup_faq">글쓰기</button>
						<button type = "reset" class = "btn_setup_faq">초기화</button>
						<a href = "faq_list.jsp"><button type = "button" class = "btn_setup_faq">목록</button></a>
						<a href = "../../index.jsp"><button type = "button" class = "btn_setup_faq">홈으로</button></a>
					</li>
				
				</ul>
				
			
			</form>
			</section>
		
	</div>
	<jsp:include page = "../../footer.jsp"></jsp:include>
</body>
</html>
<% }else{%>
	<script>
		window.alert("로그인 후 사용이 가능합니다.");
		location.href="http://localhost:9000/waffles/login/login.jsp";
	</script>
<% }%>