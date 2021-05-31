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
<!-- header -->
	<jsp:include page="../../header.jsp">
	<jsp:param name="mainlabel" value="와플대학스토리"/>
	<jsp:param name="sublabel" value=" Home > 고객센터 > 공지사항 " />
	</jsp:include>
<!-- header end -->
	
<!-- content  -->
	<div class="content_notice">
	
		<section class="notice_board">
			<img src="../../images/setup/step1.PNG">
			<p> 공지사항 </p>
		</section>
		
		<section class="notice_board_list">
			<table class="notice_table">
				<tr>
					<th class="notice_table_num">번호</th>
					<th class="notice_table_title">제목</th>
					<th class="notice_table_hits">조회</th>
				</tr>		
				<tr>
					<td>1</td>
					<td><a href = "http://localhost:9000/test/support/notice/notice_content.jsp">1번 공지사항 입니다 ㅁㄴㅇㅁㄴㅇㅂㅈㄷㅂㅈㄷ</a></td>
					<td>10</td>
				</tr>	
				<tr>
					<td>2</td>
					<td><a href = "#">2번 공지사항 입니다 ㅁㄴㅇㅁㄴㅇㅂㅈㄷㅂㅈㄷ</a></td>
					<td>10</td>
				</tr>	
				<tr>
					<td>3</td>
					<td><a href = "#">3번 공지사항 입니다 ㅁㄴㅇㅁㄴㅇㅂㅈㄷㅂㅈㄷ</a></td>
					<td>10</td>
				</tr>	
				<tr>
					<td>4</td>
					<td><a href = "#">4번 공지사항 입니다 ㅁㄴㅇㅁㄴㅇㅂㅈㄷㅂㅈㄷ</a></td>
					<td>10</td>
				</tr>	
				<tr>
					<td>5</td>
					<td><a href = "#">5번 공지사항 입니다 ㅁㄴㅇㅁㄴㅇㅂㅈㄷㅂㅈㄷ</a></td>
					<td>10</td>
				</tr>	
				<tr>
					<td>6</td>
					<td><a href = "#">6번 공지사항 입니다 ㅁㄴㅇㅁㄴㅇㅂㅈㄷㅂㅈㄷ</a></td>
					<td>10</td>
				</tr>	
				<tr>
					<td>7</td>
					<td><a href = "#">7번 공지사항 입니다 ㅁㄴㅇㅁㄴㅇㅂㅈㄷㅂㅈㄷ</a></td>
					<td>10</td>
				</tr>	
				<tr>
					<td>8</td>
					<td><a href = "#">8번 공지사항 입니다 ㅁㄴㅇㅁㄴㅇㅂㅈㄷㅂㅈㄷ</a></td>
					<td>10</td>
				</tr>		
			</table>
			
			<div class="notice_search">
			<select>
				<option value="제목">제목
				<option value="내용">내용
				<option value="제목+내용">제목+내용
				<option value="회원아이디">회원아이디
				<option value="글쓴이">글쓴이
			</select>
			<input type="text" class="input_text">
			<button type="button" class="searchbtn">검색</button>
			<div class="notice_board_writebtn">
				<a href="http://localhost:9000/test/support/notice/notice_write.jsp"><button type="button" class="writebtn">글쓰기</button></a>
			</div>
			</div>
			<div class="notice_page">
			<button type="button" class="pagebtn">1</button>
			<button type="button" class="pagebtn">2</button>
			<button type="button" class="pagebtn">3</button>
			<button type="button" class="pagebtn">4</button>
			</div>
		</section>
	</div>
<!-- content end -->

<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
<!-- footer end -->	
</body>
</html>