package com.inxedu.os.common.service.email;

public interface EmailService {
	/**
	 * 鍙戦�侀偖绠变欢
	 * @param title 閭欢鏍囬
	 * @param context 鍐呭
	 * @param email 鎺ユ敹閭鍙�
	 * @author www.inxedu.com
	 */
	public void sendMail(String title,String context,String email) throws Exception;

	void sendBatchMail(String[] var1, String var2, String var3);

	void sendMailWithFile(String var1, String var2, String var3, String[] var4) throws Exception;

	void sendBatchMailWithFile(String[] var1, String var2, String var3, String[] var4) throws Exception;

}
