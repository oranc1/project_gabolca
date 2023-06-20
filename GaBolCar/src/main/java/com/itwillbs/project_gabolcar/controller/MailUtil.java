package com.itwillbs.project_gabolcar.controller;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

public class MailUtil {
	
	public static void sendMail(String email, String subject, String msg) {
		
		//메일 서버 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "gabolcar";
		String hostSMTPpwd = "rkqhfzk123!";
		
		//보내는 사람
		String fromEmail = "gabolcar@naver.com";
		String fromName = "GaBolCar";
		
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587);
			
			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setStartTLSEnabled(true);
			mail.addTo(email);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		} catch (EmailException e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	

}
