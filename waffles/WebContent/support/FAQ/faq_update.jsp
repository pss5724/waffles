<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.waffles.dao.*, com.waffles.vo.*"%>
<%
	request.setCharacterEncoding("utf-8");

	String fid = request.getParameter("fid");
	
	FaqDAO dao = new FaqDAO();
	FaqVO vo = dao.getContent(fid);	
	if(vo.getPass() == null) {
		vo.setPass("");
	}
	String content = vo.getFcontent().replace("<br>","\r\n");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 - 문의사항 - 수정하기 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		
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
		
		
		$("input[type=file]").on('change',function(){
			
			if(window.FileReader){
				var filename = $(this)[0].files[0].name;
				$("#fname").text("").text(filename);
			}
			
		});
		
	});
</script>
</head>
<body>
	<!-- content -->
	<jsp:include page = "../../header.jsp">
	<jsp:param name="mainlabel" value="문의사항 " />
	<jsp:param name="sublabel" value=" Home > 고객센터 > 문의사항 > 글쓰기 "/>
	</jsp:include>
	<div class = "content_setup_faq_write">
		<section>
			<div class = "title">문의수정</div>
	
			<form name = "faq_write" action = "faqUpdateProcess.jsp" method = "post" class = "content_layout_setup_counsel" enctype="multipart/form-data">
				<input type="hidden" name= "fid" value=<%= fid %>>
				<ul>
					<li>
						<label> 작성자 </label>
						<input type = "text" name = "name" id = "name" value="<%=vo.getName() %>" readonly>
						<input style="float: right; margin-right: 80px;" type = "password" name = "pass" id = "name" value=<%= vo.getPass() %>>
						<label style="float: right; width:100px;"> 비밀번호 </label>
						<div></div>
					</li>
					<li>
						<label> 제목 </label>
						<input type = "text" name = "ftitle" id = "ftitle" style="width:800px; height: 30px;" value = '<%= vo.getFtitle() %>'>
						<div></div>
					</li>
					
					<li>
						<label style="position: relative; top:-280px;"> 문의 내용 </label>
						<textarea name="fcontent" id="fcontent" style="width:800px; height: 300px; resize:none;"><%= vo.getFcontent() %></textarea>
						<div></div>
					</li>
					<li style=" height: 50px;">
						<label style="float:left;"> 이미지파일 </label>
						<input type="file" name="ffile" id="image" style="float:left;">
					</li>
					<li style="text-align:center; display: block;">
						<button type = "submit" class = "btn_setup_faq">수정하기</button>
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