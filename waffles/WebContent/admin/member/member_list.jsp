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
	<jsp:param name="sublabel" value=" Home > 관리자 > 회원관리 " />
	</jsp:include>
	
	<!-- content -->
	<div class="content_member">
	
	
		<section class="member_content">
			<img src="../../images/setup/step1.PNG">
			<p> 회원관리 </p>
		</section>
	
		<section class="member_list">
		
			<table class="member_list_table">
				<tr>
					<th>번호</th>				
					<th>아이디</th>				
					<th>닉네임</th>				
					<th>이메일</th>				
					<th>이름</th>				
					<th>가입날짜</th>		
					<th>회원탈퇴</th>		
				</tr>
				<tr>
					<td>1</td>
					<td>test1234</td>
					<td>테스트</td>
					<td>test@test.com</td>
					<td>홍길동</td>
					<td>2021-05-27</td>
					<td><button type="button" disabled>신청</button></td>
				</tr>
				<tr>
					<td>1</td>
					<td>test1234</td>
					<td>테스트</td>
					<td>test@test.com</td>
					<td>홍길동</td>
					<td>2021-05-27</td>
					<td><button type="button" disabled>신청</button></td>
				</tr>
				<tr>
					<td>1</td>
					<td>test1234</td>
					<td>테스트</td>
					<td>test@test.com</td>
					<td>홍길동</td>
					<td>2021-05-27</td>
					<td><button type="button" disabled>신청</button></td>
				</tr>
				<tr>
					<td>1</td>
					<td>test1234</td>
					<td>테스트</td>
					<td>test@test.com</td>
					<td>홍길동</td>
					<td>2021-05-27</td>
					<td><button type="button" disabled>신청</button></td>
				</tr>
				<tr>
					<td>1</td>
					<td>test1234</td>
					<td>테스트</td>
					<td>test@test.com</td>
					<td>홍길동</td>
					<td>2021-05-27</td>
					<td><button type="button" disabled>신청</button></td>
				</tr>
				<tr>
					<td>1</td>
					<td>test1234</td>
					<td>테스트</td>
					<td>test@test.com</td>
					<td>홍길동</td>
					<td>2021-05-27</td>
					<td><button type="button" disabled>신청</button></td>
				</tr>
				<tr>
					<td>1</td>
					<td>test1234</td>
					<td>테스트</td>
					<td>test@test.com</td>
					<td>홍길동</td>
					<td>2021-05-27</td>
					<td><button type="button" disabled>신청</button></td>
				</tr>
				
			</table>
			<div class="notice_page">
			<button type="button" class="pagebtn">1</button>
			<button type="button" class="pagebtn">2</button>
			<button type="button" class="pagebtn">3</button>
			<button type="button" class="pagebtn">4</button>
			</div>
		</section>	
	</div>
	<!-- content end -->
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>