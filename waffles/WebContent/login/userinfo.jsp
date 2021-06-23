<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.waffles.dao.MemberDAO, com.waffles.vo.MemberVO" %>
<%
	request.setCharacterEncoding("utf-8");

	//회원 정보 받아오기
	String id = (String) session.getAttribute("id");
	
	
	MemberDAO dao = new MemberDAO();
	MemberVO vo = dao.getInfo(id);
	
	String emaillist[] = vo.getEmail().split("@");
	String email1 = emaillist[0];
	String email2 = emaillist[1];
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
		/* 폼체크 - 정보수정 (이메일, 비밀번호) */
		$("#modifyBtn").click(function() {
			if ($("#name").val() == "") {
				alert("이름을 입력해주세요");
				$("#name").focus();
				return false;
			} else if($("#email1").val() == "") {
				alert("email1을 입력해주세요");
				$("#email1").focus();
				return false;
			} else if ($("#email2").val() == "") {
				alert("email2,3을 입력해주세요");
				$("#email3").focus();
				return false;
			} else if ($("#pass").val() == "") {
				alert("새 비밀번호를 입력해주세요");
				$("#pass").focus();
				return false;
			} else if ($("#cpass").val() == "") {
				alert("새 비밀번호 확인을 입력해주세요");
				$("#cpass").focus();
				return false;	
			} else {
				modify_form.submit();
			}

		});
		
		
		/* 이메일 체크 */
		$("#email3").change(function() {
			if($("#email3").val() == "선택") {
				alert("주소 선택해주세요");
				$("#email2").val("");
				$("#email3").focus();
				return false;
			} else {
				$("#email2").val($("#email3").val());
			}
		});
		
		/* 패스워드 체크 */
		$("#ncpass").blur(function() {
			if($("#npass").val() != "" && $("#ncpass").val() != "") {
				if($("#npass").val() == $("#ncpass").val()) {
					$("#msg").text("패스워드가 동일합니다").css("color", "blue");
					return true;
				}else {
					$("#msg").text("패스워드가 다릅니다").css("color", "red");
					$("#npass").val("");
					$("#ncpass").val("").focus();
					return false;
				}
			}	
		});	
	});


</script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="회원정보수정" />
	<jsp:param name="sublabel" value=" Home > 회원정보수정"/>
	</jsp:include>
	
	<!-- content -->
	<div class = "content_modify">
		<section>
			<div class = "title"> 회원정보수정 </div>
			<div class = "hr"></div>
			<form name = "modify_form" action = "modifyProcess.jsp" method = "post" class = "content_layout_modify">
				<ul>
					<li>
						<label> 아이디 </label>
						<input type = "text" name = "id" class = "id" value = "<%= vo.getId() %>" readonly>
						<div class = "line"></div>
					</li>
					
					<li>
						<label> 이름 </label>
						<input type = "text" name = "name" class = "name" value = "<%= vo.getName() %>">
						<div class = "line"></div>
					</li>
					
					<li>
						<label> 이메일 </label>
						<input type = "text" name = "email1" id = "email1" class = "email1" value = "<%= email1 %>"> @ 
						<input type = "text" name = "email2" id = "email2" class = "email2" value = "<%= email2 %>">
						<select id = "email3" class = "email3">
							<option value = "choice">선택</option>
							<option value = "naver.com">naver.com</option>
							<option value = "daum.net">daum.net</option>
							<option value = "hanmail.net">hanmail.net</option>
							<option value = "gmail.com">gmail.com</option>
						</select>
						<div class = "line"></div>
					</li>

					<li>
						<label> 비밀번호 </label>
						<input type = "password" name = "pass" id = "pass" class = "pass" placeholder = "변경할 비밀번호를 입력해주세요">
						<div class = "line"></div>
					</li>
					
					<li>
						<label> 비밀번호 확인 </label>
						<input type = "password" name = "cpass" id = "cpass" class = "cpass">
						<div id = "msg"></div>
						<div class = "line"></div>
					</li>
					
					
					<li>
						<button type = "button" id = "modifyBtn" class = "btn_modify_2">정보수정</button>
						<%if(vo.getChoice() == 0){ %>
						<a href = "signOutProcess.jsp?id=<%=id%>"><button type = "button" class = "btn_modify_2">탈퇴신청</button></a>
						<%}else{ %>
						<a href = "signOutCanselProcess.jsp?id=<%=id%>"><button type = "button" class = "btn_modify_2">탈퇴취소</button></a>
						<%} %>
						<a href = "../index.jsp"><button type = "button" class = "btn_modify_1">홈으로</button></a>
					</li>
				
				</ul>
				
			
			</form>
		
		
		
		
		
		
		
		</section>
	</div>
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
</body>
</html>