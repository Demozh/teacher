package com.inxedu.os.common.service.email;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailsenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.internet.*;
import java.util.ArrayList;

/**
 * @author www.inxedu.com
 *
 */
@Service("emailService")
public class EmailServiceImpl implements EmailService{
	@Autowired
	private JavaMailsenderImpl javaMailsender;
	private static final Log logger = LogFactory.getLog(EmailServiceImpl.class);

	public void sendMail(String title,String context, String email) throws Exception {
	 	MimeMessage mimeMessage = this.javaMailsender.createMimeMessage();
	    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

	    messageHelper.setFrom(new InternetAddress(this.javaMailsender.getUsername()));
	    messageHelper.setSubject(title);
	    messageHelper.setText(context, true);
	    messageHelper.setTo(new InternetAddress(email));
	    mimeMessage = messageHelper.getMimeMessage();

	    EmailThread et = new EmailThread(mimeMessage);
	    et.start();
	}
	
	class EmailThread extends Thread {
		private final MimeMessage mimeMessage;

		public EmailThread(MimeMessage mimeMessage) {
			this.mimeMessage = mimeMessage;
		}

		public void run() {
			EmailServiceImpl.this.javaMailsender.send(this.mimeMessage);
		}
	}


	public void sendBatchMail(String[] mailto, String text, String title) {
		for(int i = 0; i < mailto.length; ++i) {
			try {
				this.sendMail(mailto[i], text, title);
			} catch (Exception var6) {
				logger.error("+++ sendBatchMail error email:" + mailto[i]);
			}
		}

	}

	public void sendMailWithFile(String mailto, String text, String title, String[] filePath) throws Exception {
		MimeMessage mimeMessage = this.javaMailsender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
		messageHelper.setFrom(new InternetAddress(this.javaMailsender.getUsername()));
		messageHelper.setSubject(title);
		messageHelper.setText(text, true);
		messageHelper.setTo(new InternetAddress(mailto));
		mimeMessage = messageHelper.getMimeMessage();
		if(filePath != null) {
			MimeBodyPart et = new MimeBodyPart();
			et.setContent(text, "text/html;charset=UTF-8");
			MimeMultipart mm = new MimeMultipart();
			mm.addBodyPart(et);

			for(int j = 0; j < filePath.length; ++j) {
				MimeBodyPart filePart = new MimeBodyPart();
				FileDataSource filedatasource = new FileDataSource(filePath[j]);
				filePart.setDataHandler(new DataHandler(filedatasource));

				try {
					filePart.setFileName(MimeUtility.encodeText(filedatasource.getName()));
				} catch (Exception var13) {
					var13.printStackTrace();
				}

				mm.addBodyPart(filePart);
			}

			mimeMessage.setContent(mm);
		}

		EmailServiceImpl.EmailThread var14 = new EmailServiceImpl.EmailThread(mimeMessage);
		var14.start();
	}

	public void sendBatchMailWithFile(String[] mailto, String text, String title, String[] filePath) throws Exception {
		MimeMessage mimeMessage = this.javaMailsender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
		messageHelper.setFrom(new InternetAddress(MimeUtility.encodeText(this.javaMailsender.getUsername())));
		messageHelper.setSubject(title);
		if(filePath != null) {
			MimeBodyPart list = new MimeBodyPart();
			list.setContent(text, "text/html;charset=UTF-8");
			MimeMultipart address = new MimeMultipart();
			address.addBodyPart(list);

			for(int j = 0; j < filePath.length; ++j) {
				MimeBodyPart et = new MimeBodyPart();
				FileDataSource filedatasource = new FileDataSource(filePath[j]);
				et.setDataHandler(new DataHandler(filedatasource));

				try {
					et.setFileName(MimeUtility.encodeText(filedatasource.getName()));
				} catch (Exception var13) {
					var13.printStackTrace();
				}

				address.addBodyPart(et);
			}

			mimeMessage.setContent(address);
		} else {
			messageHelper.setText(text, true);
		}

		ArrayList var14 = new ArrayList();

		for(int var15 = 0; var15 < mailto.length; ++var15) {
			var14.add(new InternetAddress(mailto[var15]));
		}

		InternetAddress[] var16 = (InternetAddress[])var14.toArray(new InternetAddress[var14.size()]);
		mimeMessage.setRecipients(Message.RecipientType.TO, var16);
		mimeMessage = messageHelper.getMimeMessage();
		EmailServiceImpl.EmailThread var17 = new EmailServiceImpl.EmailThread(mimeMessage);
		var17.start();
	}




}
