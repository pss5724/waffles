<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.waffles.dao.*, com.waffles.vo.*"%>
<%
	request.setCharacterEncoding("utf-8");
	FaqDAO dao = new FaqDAO();
	String fid = request.getParameter("fid");
	
	FaqVO vo = dao.getContent(fid);
	
	String id = null;
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}
	String rno = request.getParameter("rno");
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 - 문의사항 - 게시물 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../../header.jsp">
	<jsp:param name="mainlabel" value="비밀번호 입력 " />
	<jsp:param name="sublabel" value=" Home > 고객센터 > 문의사항 > 게시물 "/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_setup_faq_content">
		<section>
			<img src = "">
			<div class = "line"></div>
		</section>
		
		<section>
			<form name = "faq_content_pass" action = "faq_content_pass_process.jsp" method = "post">
				<input type="hidden" name = "fid" value=<%= fid %>>
				<input type="hidden" name = "rno" value=<%= rno %>>
				<% if(vo.getBoardsequence()>0) { %>
				<div style="font-weight: 700;font-size: 20px;">비밀번호를 입력해주세요<p style="font-weight:200; font-size: 15px;">(답글 비밀번호는 원글과 같습니다.)</p></div>
				<% } else { %>
				<div style="font-weight: 700;font-size: 20px;">비밀번호를 입력해주세요</div>
				<% } %>
				<div>
				<input type="password" name="pass" id="pass"; style="width:300px; margin:20px 0 10px 0; float:left;">
				</div>
				<div style="display:inline-block; width:100%; height:10%;">
				<div style="margin:30px 0; height: 1px; background-color: gray; opacity: 0.5;"> </div>
				</div>
				<button type = "submit" class = "btn_setup_faq" id="passCheck">확인</button>
				<a href = "faq_list.jsp"><button type = "button" class = "btn_setup_faq">목록</button></a>
				<a href = "../../index.jsp"><button type = "button" class = "btn_setup_faq">홈으로</button></a>
			</form>	
		</section>
			
		
		
	</div>
	
	<!-- footer -->
	<jsp:include page = "../../footer.jsp"></jsp:include>
</body>
</html>