package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Code;
import util.Gmail;

@WebServlet("/SendAuthEmail")
public class SendAuthEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String userID = request.getParameter("id");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String toEmail = email1 + "@" + email2;
		
		Code code = new Code();
		String checkCode =Code.getCode();
		
		// 사용자에게 보낼 메시지를 기입합니다.
		String host = "http://localhost:9000/waffles/";
		String from = "jsggo2001@gmail.com";
		String to = toEmail;
		String subject = "와플대학 가입을 위한 인증코드를 확인해 주세요.";
		String content = "다음 인증번호를 확인하여 회원가입을 진행하세요." + "<br>" + "인증번호: " + checkCode;

		// SMTP에 접속하기 위한 정보를 기입합니다.

		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "456");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(false);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF8");
			Transport.send(msg);

		} catch (Exception e) {
			e.printStackTrace();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다..');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}

		request.setAttribute("email", toEmail);
		request.setAttribute("name", name);
		request.setAttribute("id", userID);
		request.setAttribute("pass", pass);
		request.setAttribute("checkCode", checkCode);

		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/join/joinauthcheck.jsp"); // 넘길 페이지 주소
		dispatcher.forward(request, response);
	}

}
