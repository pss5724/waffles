<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.waffles.dao.*, com.waffles.vo.*"%>
<%
	request.setCharacterEncoding("utf-8");

	String nid = request.getParameter("nid");
	
	NoticeDAO dao = new NoticeDAO();
	NoticeVO vo = dao.getContent(nid);	
	String content = vo.getNcontent().replace("<br>","\r\n");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 - 공지사항 - 수정하기 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
<style>
 	span#fname { 
 		height:24px;
 		width:110px; 
 		display:inline-block; 
 		font-size:12px; 
 		margin-left:-680px; 
 		background-color:white;
 	} 
 	input[type=file] { 
 		width:187px; 
 		display:inline-block; 
 		margin-left: 10px; 
 		float:left;
 		border:none;
 	} 
</style>
<script>
	$(document).ready(function(){
		
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

	<!-- header -->
	<jsp:include page = "../../header.jsp">
	<jsp:param name="mainlabel" value="공지사항 수정하기 " />
	<jsp:param name="sublabel" value=" Home > 공지사항 > 게시물 > 수정하기 "/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_setup_faq_write">
		<section>
			<div class = "title">공지사항 수정하기</div>
			<form name = "faq_update" action = "noticeUpdateProcess.jsp" method = "post" enctype="multipart/form-data">
				<input type="hidden" name="nid" value="<%= nid %>">
				<input type="hidden" name="nsfile_old" value="<%= vo.getNsfile()%>">
				<table class = "content_layout_setup_faq_write">
				
					<tr>
						<th>제목</th>
						<td><input type = "text" name = "ntitle" value = "<%=vo.getNtitle()%>"></td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td><textarea name = "ncontent"><%=content %></textarea></td>
					</tr>
					<tr>
						<th>파일</th>
						<td>
							<% if(vo.getNfile() != null){ %>
							<input type="file" name="nfile"><span id="fname"><%=vo.getNfile() %></span>
							<%} else { %>
							<input type="file" name="nfile">
							<span id="fname"></span>
							<%} %>
						</td>
					</tr>
					<tr>
						<td colspan = "2">
							<button type = "submit" class = "btn_setup_faq">수정하기</button>
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