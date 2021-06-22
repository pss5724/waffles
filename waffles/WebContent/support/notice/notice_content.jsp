<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.waffles.dao.*, com.waffles.vo.*,java.util.*"%>
<%
	String nid = request.getParameter("nid");
	request.setCharacterEncoding("utf-8");
	
	NoticeDAO dao = new NoticeDAO();
	NoticeVO vo = dao.getContent(nid);

	if(vo != null) dao.getUpdateHit(nid);
	
	String id = null;
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}
	
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
			<img src = "../../images/setup/step1.PNG">
			<div class = "title">공지사항</div>
			<div class = "line"></div>
		</section>
		<section>
			<form name = "faq_content" action = "#" method = "get">
				<input type="hidden">
				<div><%=vo.getNtitle() %></div>
				<div>
					<div>작성자 <%=vo.getName() %></div>
					<div>	 
					조회 <%=vo.getNhit() %> 회 
					&nbsp;
					<%=vo.getNdate() %>
					</div>
				</div>
				<hr style="display:inline-block; width:100%;">
				<div style="white-space:pre-wrap; width:50%; text-align:center; margin:auto;"><%=vo.getNcontent() %>
				<% if(vo.getNsfile() != null){%>
						<br>
						<img src="http://localhost:9000/waffles/upload/<%=vo.getNsfile()%>" width="200px" height="200px">
						<%}%>
							
						</div>
				<hr>
				<%if(id != null) {%>
				<% if(vo.getName().equals(id) || id.equals("manager")) {%>
				<a href = "notice_update.jsp?nid=<%=vo.getNid()%>"><button type = "button" class = "btn_setup_faq">수정</button></a>
				<a href = "notice_delete.jsp?nid=<%=vo.getNid()%>"><button type = "button" class = "btn_setup_faq">삭제</button></a>
				<%}} %>
				<a href = "notice_list.jsp"><button type = "button" class = "btn_setup_faq">목록</button></a>
				<a href = "../../index.jsp"><button type = "button" class = "btn_setup_faq">홈으로</button></a>
			</form>	
		</section>
			
		
		
	</div>
	
	<!-- footer -->
	<jsp:include page = "../../footer.jsp"></jsp:include>
</body>
</html>