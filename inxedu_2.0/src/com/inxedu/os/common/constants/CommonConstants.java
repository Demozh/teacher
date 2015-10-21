package com.inxedu.os.common.constants;

import org.springframework.common.constants.CommonConstantsBase;

/**
 * @ClassName com.yizhilu.os.inxedu.common.entity.CommonConstant
 * @Create Date : 2015-3-17
 */
public class CommonConstants extends CommonConstantsBase{

    /**邮箱正则表达式*/
    public static String emailRegex="^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
    /**电话号码正则表达式*/
    public static String telRegex="^1[0-9]{10}$";
    /**后台用户登录名正则表达式*/
    public static String loginRegex="^([0-9]*[a-zA-Z]+[0-9]*){6,20}$";
    /**图片验证码Session的K*/
    public static final String RAND_CODE="COMMON_RAND_CODE";
}
