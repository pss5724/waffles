<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.waffles.dao.*, com.waffles.vo.*"%>
<%
	request.setCharacterEncoding("utf-8");
	FaqDAO dao = new FaqDAO();
	String fid = request.getParameter("fid");
	
	FaqVO vo = dao.getContent(fid);
	
	if(vo != null) dao.getUpdateHit(fid);
	
	String id = null;
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}
	
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
	<jsp:param name="mainlabel" value="문의사항 " />
	<jsp:param name="sublabel" value=" Home > 고객센터 > 문의사항 > 게시물 "/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_setup_faq_content">
		<section>
			<img src = "../../images/setup/step1.PNG">
			<div class = "title">문의사항</div>
			<div class = "line"></div>
		</section>
		
		<section>
			<form name = "faq_content" action = "#" method = "get">
				<input type="hidden">
				<div><%=vo.getFtitle() %></div>
				<div>
					<div>작성자 <%=vo.getName() %>	</div>
					<div>
					 조회  <%=vo.getFhit() %> 회
					 &nbsp;
					 <%=vo.getFdate() %>
					</div>
				</div>
				<div style="display:inline-block; width:100%; height: 600px;">
				<div style="margin:30px 0; height: 1px; background-color: gray; opacity: 0.5;"> </div>
				<div style="white-space:pre-wrap; width:100%; text-align:left; margin:auto;"> <%=vo.getFcontent() %></div>
				<% if(vo.getFsfile() != null){%>
					<img src="http://localhost:9000/waffles/upload/<%=vo.getFsfile()%>" style="width:200px; height:200px; float: left; margin: 50px;">
				<%} %>
						
						
				</div>
				<%if(id != null) {%>
				<%	if(id.equals("manager")) { %>
						<a href = "faq_reply.jsp?fid=<%=vo.getFid()%>"><button type = "button" class = "btn_setup_faq">답글</button></a>
						<a href = "faq_update.jsp?fid=<%=vo.getFid()%>"><button type = "button" class = "btn_setup_faq">수정</button></a>
						<a href = "faq_delete.jsp?fid=<%=vo.getFid()%>"><button type = "button" class = "btn_setup_faq">삭제</button></a>
				<% 	} else if(vo.getName().equals(id)) {%>
				<a href = "faq_update.jsp?fid=<%=vo.getFid()%>"><button type = "button" class = "btn_setup_faq">수정</button></a>
				<a href = "faq_delete.jsp?fid=<%=vo.getFid()%>"><button type = "button" class = "btn_setup_faq">삭제</button></a>
	         	<%	} 
				  } %>
				<a href = "faq_list.jsp"><button type = "button" class = "btn_setup_faq">목록</button></a>
				<a href = "../../index.jsp"><button type = "button" class = "btn_setup_faq">홈으로</button></a>
			</form>	
		</section>
			
		
		
	</div>
	
	<!-- footer -->
	<jsp:include page = "../../footer.jsp"></jsp:include>
</body>
</html>