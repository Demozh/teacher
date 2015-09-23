package com.inxedu.os.common.service.email;

public interface EmailService {
	/**
	 * 发送邮箱件
	 * @param title 邮件标题
	 * @param context 内容
	 * @param email 接收邮箱号
	 */
	public void sendMail(String title,String context,String email) throws Exception;
}
