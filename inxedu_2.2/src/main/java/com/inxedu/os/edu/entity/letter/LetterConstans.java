package com.inxedu.os.edu.entity.letter;

/**
 * @author : qinggang.liu 305050016@qq.com
 * @ClassName com.inxedu.os.sns.entity.constans.LetterConstans
 * @description 站内信常量
 * @Create Date : 2014-3-26 上午9:59:09
 * @author www.inxedu.com
 */
public class LetterConstans {
    /**
     * Letter站内信字典常量定义
     */
    public static final int LETTER_TYPE_SYSTEMINFORM = 1;// 系统通知
    public static final int LETTER_TYPE_MESSAGE = 2;// 站内信
    public static final int LETTER_STATUS_UNREAD = 0;// 站内信状态未读
    public static final int LETTER_STATUS_READ = 1;// 站内信状态已读
    public static final int LETTER_STATUS_ACCEPT = 2;// 站内信状态接受
    public static final int LETTER_STATUS_REFUSE = 3;// 站内信状态拒绝
    public static final int LETTER_STATUS_DELETEINBOX = 5;// 站内信收件箱删除
    public static final int LETTER_STATUS_DELETEOUTBOX = 6;// 站内信发件箱删除
}
