package com.jns.common;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleMailAuth extends Authenticator {

	PasswordAuthentication pa;
	
	public GoogleMailAuth() {
		
		String mail_id = ""; // mail ID
		String mail_pw = ""; // mail PW
		
		pa = new PasswordAuthentication(mail_id, mail_pw);
	}
	
	public GoogleMailAuth(String sendMail, String sendPw) {
		
		System.out.println("GoogleMailAuth sendMail >>> : " + sendMail);
		System.out.println("GoogleMailAuth sendPw >>> : " + sendPw);
		
		// mail, pw (gmail)
		pa = new PasswordAuthentication(sendMail, sendPw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		
		return pa;
		
		/* 
		 * public PasswordAuthentication getPasswordAuthentication() {	
		 *		return pa;
		 * 
		 *  Authenticator�� ����ϱ� ���ؼ��� PasswordAuthenticator Ŭ�����κ��� 
		 *  �ν��Ͻ��� �����ϰ� getPasswordAuthentication �޼ҵ�� ���Ϲ޾ƾ� �Ѵ�.
		 *  PasswordAuthentication Ŭ������ ������� 
		 *  ***���̵�� �н����带 �Է¹޾� ��ȯ�ϵ��� �������Ѵ�.***
		 */	
	}
}
