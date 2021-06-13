<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.waffles.dao.*, com.waffles.vo.*,java.util.*"%>
      <%
	request.setCharacterEncoding("utf-8");
      MemberDAO dao = new MemberDAO();
      ArrayList<MemberVO> list = dao.getList();
      
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
</head>
<body>
	<jsp:include page="../../header.jsp">
	<jsp:param name="mainlabel" value="와플대학스토리"/>
	<jsp:param name="sublabel" value=" Home > 관리자 > 회원관리 " />
	</jsp:include>
	
	<!-- content -->
	<div class = "content_setup_faq">
	
		<section class = "section_setup_faq">
			<img src = "../../images/setup/step1.PNG">
			<div> 회원관리 </div>
			<div></div>
		</section>
	
		<section class ="setup_faq_list">
			<table class = "content_layout_setup_faq">
				
				<tr>
					<th> 번호 </th>
					<th> 아이디 </th>
					<th> 이름 </th>
					<th> 이메일 </th>
					<th> 가입날짜 </th>
					<th> 회원탈퇴 </th>
				</tr>
				<% for(MemberVO vo : list){ %>
				<tr>
					<td><%= vo.getRno() %></td>
					<td><%=vo.getId() %></td>
					<td><%= vo.getName() %></td>
					<td><%= vo.getEmail() %></td>
					<td><%= vo.getMdate() %></td>
					<td>
						<% if(vo.getChoice()==0){ %>
						<button type="button" disabled>신청</button>
						<%} else{ %>
						<button type="button">신청</button>
						<%} %>
					</td>
				</tr>
				<%} %>

				
			</table>
			
		</section>
	</div>
	<!-- content end -->
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>