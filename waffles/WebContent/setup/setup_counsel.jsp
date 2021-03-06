<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창업안내 - 창업상담 | 와플대학</title>
<link rel = "stylesheet" href = "http://localhost:9000/waffles/css/setup.css">
<script src="http://localhost:9000/waffles/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
		/* 폼체크 */
		$("#counselBtn").click(function() {
			if($("input[name = 'initial_check']:checked").length == 0) {
				alert("개인정보수집 및 이용에 동의해주세요");
				$("input[name = 'initial_check']").focus();
				return false;
			} else if($("#name").val() == "") {
				alert("이름을 입력해주세요");
				$("#name").focus();
				return false;
			} else if ($("#hp1").val() == "choice") {
				alert("핸드폰 번호를 입력해주세요");
				$("#hp1").focus();
				return false;
			} else if($("#hp2").val() == "") {
				alert("핸드폰 번호를 입력해주세요");
				$("#hp2").focus();
				return false;
			} else if($("#hp3").val() == "") {
				alert("핸드폰 번호를 입력해주세요");
				$("#hp3").focus();
				return false;	
			} else if($("#email1").val() == "") {
				alert("email을 입력해주세요");
				$("#email1").focus();
				return false;
			} else if ($("#email2").val() == "") {
				alert("email을 입력해주세요");
				$("#email3").focus();
				return false;
			} else if($("#local").val() == "") {
				alert("창업 희망 지역을 입력해주세요");
				$("#local").focus();
				return false;
			} else {
				setup_counsel_form.submit();
			}
		});
		
		/* 이메일 체크 */
		$("#email3").change(function() {
			if($("#email3").val() == "선택") {
				alert("이메일 주소를 선택해주세요");
				$("#email2").val("");
				$("#email3").focus();
				return false;
			} else {
				$("#email2").val($("#email3").val());
			}
		});
			

	});

</script>
</head>
<body>
	<!-- header -->
	<jsp:include page = "../header.jsp">
	<jsp:param name="mainlabel" value="창업상담" />
	<jsp:param name="sublabel" value=" Home > 창업안내 > 창업상담 "/>
	</jsp:include>
	
	
	<!-- content -->
	<div class = "content_setup_counsel">
		<section>
			<img src = "../images/setup/step1.PNG">
			<div> 창업상담 </div>
			<div></div><div> Keep in Touch</div><div></div>
		</section>
	
		<section class = "setup_counsel">
			<h3> 개인정보수집 및 이용에 대한 안내 </h3>
			
			<textarea class = "initial" disabled> 
	와플대학은 주문을 위하여 아래와 같이 개인정보를 수집·이용하는 내용을 관계 법령에 따라 알리오니, 동의해 주시기를 바랍니다.

	■ 개인정보의 수집·이용 항목
	회사는 온라인예약을 위해 아래와 같은 개인정보를 수집하고 있습니다.
	
	수집항목 : 이름, 연락처, 이메일, 거주지, 창업희망지역, 문의내용
	개인정보 수집방법 : 창업상담
	
	■ 수집하는 개인정보 항목 및 수집방법
	와플대학는 최초 회원가입을 하실 때 서비스 제공을 위해 가장 필수적인 개인정보를 받고 있습니다. 
	회원가입 시에 받는 정보는 회원님의 이름, 성별, 생년월일,우편번호 등입니다.
	이 이외에 특정 서비스를 제공하기 위하여 추가적인 정보제공을 요청하고 있습니다. 
	실명확인을 위한 휴대폰번호, 기타 서비스제공에 필요한 추가정보의 기재를 요청하게 됩니다. 
	또한 설문조사나 이벤트 시에 집단적인 통계분석을 위해서나 경품발송을 위한 목적으로도 개인정보 기재를 요청할 수 있습니다. 
	이때에도 기입하신 정보는 해당서비스 제공이나 회원님께 사전에 밝힌 목적 이외의 다른 어떠한 목적으로도 사용되지 않음을 알려드립니다.
	
	서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
	구매 및 요금 결제, 물품배송 또는 청구지 등 발송
	
	■ 개인정보의 보유 및 폐기
	귀하가 와플대학의 회원으로서 와플대학이 제공하는 서비스를 받는 동안 회원님의 개인정보는 와플대학에서 계속 보유하며 서비스 제공을 위해 이용하게 됩니다. 
	다만 와플대학의 회원이 아래의 '7. 자신의 개인정보 열람, 정정 및 삭제'에서 설명한 절차에 따라 ID를 삭제하거나 가입해지를 요청한 경우와 회원님께 사전에 알려드린 
	개인정보를	제공받은 목적이 달성된 경우에 수집된 개인의 정보는 재생할 수 없는 방법에 의하여 하드디스크에서 완전히 삭제되며 어떠한 용도로도 열람 또는 이용할 수 
	없도록 처리됩니다.
	
	■ 개인정보의 제공 및 공유
	원칙적으로 와플대학 회원님의 개인정보를 타인 또는 타기업·기관에 공개하지 않습니다. 다만 회원님이 공개에 동의한 경우 또는 와플대학의 서비스 이용약관을 위배하는 
	사람이나 와플대학의 서비스를 이용하여 타인에게 법적인 피해를 주거나 미풍양속을 해치는 행위를 한 사람 등에게 법적인 조치를 취하기 위하여 개인정보를 공개해야
	한다고 판단되는 충분한 근거가 있는 경우는 예외로 합니다.
	와플대학는 보다 나은 서비스 제공을 위해 회원님의 개인정보를 비즈니스 파트너와 공유할 수 있습니다. 이 경우에도 정보수집 또는 정보제공 이전에 회원님께 비즈니스
	파트너가 누구인지, 어떤 정보가 왜 필요한지, 그리고 언제까지 어떻게 보호/관리되는지 알려드리고 동의를 구하는 절차를 거치게 되며, 회원님께서 동의하지 않는 경우에는 
	추가적인 정보를 수집하거나 비즈니스 파트너와 공유하지 않습니다. 성별, 연령별 기타 특정 조건의 집단에 대한 광고 게재 및 발송 시(예, 20대 여자)에도 회원님 개인의 
	정보는 광고를 의뢰한 개인이나 단체에 제공되지 않습니다. 기타 통계처리, 학술연구, 시장조사를 위하여 필요한 경우에는 특정한 개인을 식별할 수 없는 형태로만 정보가 
	제공됩니다.
	
	■ 쿠키(cookie)의 운용 및 활용
	회원님 개개인에게 개인화되고(personalized) 맞춤화된(customized) 서비스를 제공하기 위해서 와플대학는 회원님의 정보를 저장하고 
	수시로 불러오는 '쿠키(cookie)'를 사용합니다. 쿠키는 웹사이트를 운영하는데 이용되는 서버가 사용자의 브라우저에게 보내는 조그마한 데이터 꾸러미로 회원님 컴퓨터의
	하드디스크에 저장됩니다.
	회원님께서 와플대학 에 접속한 후 로그인(log-in)하여 개인화된 서비스나 맞춤화된 서비스를 이용하시기 위해서는 쿠키를 허용하여야 합니다. 
	와플대학는 회원님께 적합하고 보다 유용한 서비스를 제공하기 위해서 쿠키를 이용하여 회원님의 아이디에 대한 정보를 찾아냅니다. 
	와플대학에 접속하는 이용자의 브라우저에 고유한 쿠키를 부여함으로써 회원 및 비회원들의 와플대학사이트 이용빈도나 
	전체 이용자수 등과 같은 이용자 규모를 파악하는데도 이용됩니다. 또한 와플대학쇼핑에서 상품구매 시 인증을 위해서나 상품구매를 돕기 위해서도 쿠키 정보를 이용하며, 
	기타 이벤트나 설문조사에서 회원님의 참여 경력을 확인하기 위해서 쿠키를 이용하게 됩니다.
	쿠키를 이용하여 회원님께서 방문한 와플대학서비스의 방문 및 이용형태를 파악함으로써 더 유용하고 이용하기 편리한 서비스를 만들어 제공할 수 있게 됩니다.
	회원님은 쿠키에 대한 선택권을 가지고 있습니다. 회원님의 웹브라우저에서 옵션을 선택함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 
	모든 쿠키의 저장을 거부할 수 있습니다. 단, 쿠키의 저장을 거부하실 경우 로그인이 필요한 와플대학의 모든 서비스는 이용하실 수 없게됩니다.
	
	■ 개인정보보호를 위한 기술적/제도적 관리
	회원님의 개인정보는 비밀번호에 의해 보호되고 있습니다. 회원님 계정의 비밀번호는 오직 본인만이 알 수 있으며, 개인정보의 확인 및 변경도 비밀번호를 알고 있는 
	본인에 의해서만 가능합니다. 따라서 회원님의 비밀번호는 누구에게도 알려주면 안됩니다. 또한 작업을 마치신 후에는 로그아웃(log-out)하시고 웹브라우저를 종료하는 
	것이 바람직합니다. 특히 다른 사람과 컴퓨터를 공유하여 사용하거나 공공장소에서 이용한 경우 개인정보가 다른 사람에게 알려지는 것을 막기 위해서 
	이와 같은 절차가 더욱 필요하다고 하겠습니다.
	와플대학는 백신프로그램을 이용하여 컴퓨터바이러스에 의한 피해를 방지하기 위한 조치를 취하고 있습니다. 백신프로그램은 주기적으로 업데이트 되며 갑작스런 
	바이러스가 출현할 경우 백신이 나오는 즉시 이를 제공함으로써 개인정보가 훼손되는 것을 방지하고 있습니다. 
	해킹 등에 의해 회원의 개인정보가 유출되는 것을 막기 위해 현재 외부로부터의 침입을 차단하는 장치를 이용하여 외부로부터의 공격, 해킹 등을 막고 있으며, 
	각 서버마다 침입탐지시스템을 설치하여 24시간 침입을 감시하고 있습니다. 
	기타 회원 개인정보의 훼손에 대비해서 시스템과 데이터를 백업하여 만약의 사태에 대비하고 있습니다.
	와플대학는 개인정보 취급 직원을 최소한으로 제한하고 담당직원에 대한 수시 교육을 통하여 본 정책의 준수를 강조하고 있으며, 
	감사위원회의 감사를 통하여 본 정책의 이행사항 및 담당직원의 준수여부를 확인하여 문제가 발견될 경우 바로 시정조치하고 있습니다.
	
	■ 자신의 개인정보 열람, 정정 및 삭제
	회원님은 언제든지 등록되어 있는 회원님의 개인정보를 열람하거나 정정하실 수 있으며, 아이디(ID) 삭제를 요청하실 수 있습니다.
	개인정보와 관련하여 불만이나 의견이 있으신 분은 개인정보 관리담당자에게 메일 (waffleuniv@waffleuniv.com) 로 의견을 주시면 접수 즉시 조치하고 
	처리결과를 통보해 드리겠습니다.
	
	■ 어린이의 개인정보보호
	만14세 미만의 어린이는 자신에 대한 정보를 다른 사람에게 함부로 보내면 안되며, 보내기 전에 반드시 부모님의 허락을 받아야 합니다.
	회원님 계정의 비밀번호에 대한 보안을 유지할 책임은 회원님 자신에게 있습니다. 와플대학에서 메일 또는 기타 방법으로 회원님께 비밀번호를 질문하는 경우는 
	절대 없으므로 어떠한 경우에도 비밀번호를 알려주지 마십시오. 로그온(log-on)한 상태에서는 주위의 다른 사람에게 개인정보가 유출되지 않도록 
	특별히 주의를 기울이시기 바랍니다.
	
	■ 개인정보 관리담당자
	이름 : 조진택
	TEL : 02-2285-0031
	이메일 : waffleuniv@waffleuniv.com
	이상의 변경된 와플대학의 개인정보보호정책은 2007년 01월 01일부터 시행합니다.
			</textarea>
				
			<div> <input type = "checkbox" name = "initial_check"> 개인정보수집 및 이용에 동의합니다. </div>
			<div> * 표시는 필수 입력사항입니다.</div>
			<div class = "line"></div>
			
			<form name = "setup_counsel_form" action = "http://localhost:9000/waffles/CounselWriteServlet" method = "post" class = "content_layout_setup_counsel">
				<ul>
					<li>
						<label> 이름 * </label>
						<input type = "text" name = "name" id = "name">
						<div></div>
					</li>
					
					<li>
						<label> 핸드폰 * </label>
						<select name = "hp1" id = "hp1">
							<option value = "choice">선택</option>
							<option value = "010">010</option>
							<option value = "011">011</option>
							<option value = "016">016</option>
							<option value = "017">017</option>
						</select>
						- <input type = "text" name = "hp2" maxlength = "4" class = "i2" id = "hp2">
						- <input type = "text" name = "hp3" maxlength = "4" class = "i2" id = "hp3">
						<div></div>
					</li>
					
					<li>
						<label> 이메일 * </label>
						<input type = "text" name = "email1" id = "email1"> @ 
						<input type = "text" name = "email2" id = "email2">
						<select id = "email3">
							<option value = "choice">선택</option>
							<option value = "naver.com">naver.com</option>
							<option value = "daum.net">daum.net</option>
							<option value = "hanmail.net">hanmail.net</option>
							<option value = "gmail.com">gmail.com</option>
						</select>
						<div></div>
					</li>
					
					<li>
						<label> 와플대학 인지 경로 </label>
						<input type = "checkbox" name = "route" value = "뉴스 기사">뉴스 기사
						<input type = "checkbox" name = "route" value = "검색">검색
						<input type = "checkbox" name = "route" value = "지인 추천">지인 추천
						<input type = "checkbox" name = "route" value = "가맹점 방문">가맹점 방문
						<input type = "checkbox" name = "route" value = "기타">기타
						<div></div>
					</li>
					
					<li>
						<label> 창업 희망 지역 * </label>
						<input type = "text" name = "local" id = "local">
						<div></div>
					</li>
					
					<li>
						<label> 기타 문의사항 </label>
						<textarea name="etc"></textarea>
						<div></div>
					</li>
					
					
					<li>
						<a href = "setup_main.jsp"><button type = "button" class = "btn_counsel_1">취소</button></a>
						<button type = "submit" id = "counselBtn" class = "btn_counsel_2">확인</button>
					</li>
				
				</ul>
				
			
			</form>
		
		
		</section>

	
	</div>
	
	
	<!-- footer -->
	<jsp:include page = "../footer.jsp"></jsp:include>
	
</body>
</html>