<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창업안내 - 창업FAQ | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="창업 FAQ" />
	<jsp:param name="sublabel" value=" Home > 창업안내 > 창업 FAQ "/>
	</jsp:include>
	
	
	<!-- content -->
	<div class = "content_setup_faq">
	
		<section class = "section_setup_faq">
			<img src = "../images/setup/step1.PNG">
			<div> 창업FAQ </div>
			<div></div>
		</section>
		
		<section class ="setup_faq_list">
			<table class = "content_layout_setup_faq">
				
				<tr>
					<th> 번호 </th>
					<th> 제목 </th>
					<th> 글쓴이 </th>
					<th> 날짜 </th>
					<th> 조회수 </th>
				</tr>
				
				<tr>
					<td>1</td>
					<td><a href = "setup_faq_content.jsp">푸드트럭 및 1톤 트럭으로 와플대학 창업이 가능한가요?</a></td>
					<td>와플대학관리자</td>
					<td>21/05/06</td>
					<td>2</td>
				</tr>
				
				<tr>
					<td>2</td>
					<td><a href = "#">가맹 계약부터 오픈까지 얼마나 소요되나요? </a></td>
					<td>와플대학관리자</td>
					<td>21/05/06</td>
					<td>55</td>
				</tr>
				<tr>
					<td>3</td>
					<td><a href = "#">매장경험이 없는데 창업 및 매장 운영이 힘들거나 어렵지 않을까요?</a></td>
					<td>와플대학관리자</td>
					<td>21/05/06</td>
					<td>334</td>
				</tr>
				<tr>
					<td>4</td>
					<td><a href = "#">와플대학 창업 불가 지역 또는 추천 지역이 있나요?</a></td>
					<td>와플대학관리자</td>
					<td>21/05/06</td>
					<td>44</td>
				</tr>
				<tr>
					<td>5</td>
					<td><a href = "#">점포 양도 및 인수가 가능한가요?</a></td>
					<td>와플대학관리자</td>
					<td>21/05/06</td>
					<td>77</td>
				</tr>
				<tr>
					<td>6</td>
					<td><a href = "#">가맹 계약 없이 와플 반죽 등 재료만 별도 계약하여 받아 볼 수 있나요?</a></td>
					<td>와플대학관리자</td>
					<td>21/05/06</td>
					<td>0</td>
				</tr>
				<tr>
					<td>7</td>
					<td><a href = "#">최소 매장 규모는 얼마 인가요?</a></td>
					<td>와플대학관리자</td>
					<td>21/05/06</td>
					<td>932</td>
				</tr>
				<tr>
					<td>8</td>
					<td><a href = "#">와플대학을 창업하는데 비용이 얼마나 드나요?</a></td>
					<td>와플대학관리자</td>
					<td>21/05/06</td>
					<td>1</td>
				</tr>
				<tr>
					<td>9</td>
					<td><a href = "#">와플대학 매장 영업 시간이 정해져 있나요??</a></td>
					<td>와플대학관리자</td>
					<td>21/05/06</td>
					<td>2</td>
				</tr>
				<tr>
					<td>10</td>
					<td><a href = "#">라라라라라라라ㅏ</a></td>
					<td>와플대학관리자</td>
					<td>21/05/06</td>
					<td>2</td>
				</tr>
				
				
			</table>
		</section>
		
		<section class = "setup_faq_search">
			<select class = "search">
				<option value = "title">제목</option>
				<option value = "content">내용</option>
				<option value = "title+content">제목+내용</option>
				<option value = "writer">글쓴이</option>
			</select>
			
			<input type = "text" name = "search_text" class = "search_text">
			<button type = "button" class = "btn_search">검색</button>
		</section>
		
	</div>	
	
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
	
</body>
</html>