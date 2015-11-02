package com.inxedu.os.common.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.util.Enumeration;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asual.lesscss.LessEngine;
import com.inxedu.os.common.constants.CommonConstants;

import nl.bitwalker.useragentutils.Browser;
import nl.bitwalker.useragentutils.OperatingSystem;
import nl.bitwalker.useragentutils.UserAgent;

/**
 * @author www.inxedu.com
 *
 */
public class WebUtils {
	public static void main(String[] args) {
		// Instantiates a new LessEngine
		LessEngine engine = new LessEngine();

		try {
			engine.compile(new File("/home/yzl268/桌面/workspace/inxedu/demo_inxedu/demo_inxedu_1.2/inxedu_2.0/WebRoot/static/inxweb/css/less/theme.less"), 
			               new File("/home/yzl268/桌面/workspace/inxedu/demo_inxedu/demo_inxedu_1.2/inxedu_2.0/WebRoot/static/inxweb/css/theme.css"));
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	public static String MYDOMAIN = CommonConstants.MYDOMAIN;
	public static void setCookie(HttpServletResponse response, String key, String value, int days) {
		setCookie(response, key, value, days, MYDOMAIN);
	}

	/**设置Cookie值*/
	public static void setCookie(HttpServletResponse response, String key, String value, int days, String domain) {
		if ((key != null) && (value != null)) {
			Cookie cookie = new Cookie(key, value);
			cookie.setMaxAge(days * 24 * 60 * 60);
			cookie.setPath("/");
			if (org.apache.commons.lang.StringUtils.isNotEmpty(domain)) {
				cookie.setDomain(domain);
			}
			response.addCookie(cookie);
		}
	}

	/**获取Cookie值*/
	public static String getCookie(HttpServletRequest request, String key) {
		Cookie[] cookies = request.getCookies();
		String resValue = "";
		if ((cookies != null) && (cookies.length > 0)) {
			for (int i = 0; i < cookies.length; i++) {
				if ((!key.equalsIgnoreCase(cookies[i].getName()))
						|| (!org.apache.commons.lang.StringUtils
								.isNotEmpty(cookies[i].getValue())))
					continue;
				resValue = cookies[i].getValue();
			}

		}
		return resValue;
	}

	/**删除默认域名下的*/
	public static void deleteCookie(HttpServletRequest request,
			HttpServletResponse response, String name) {
		deleteCookieDomain(request, response, name, MYDOMAIN);
	}

	/**删除某域下的Cookie*/
	public static void deleteCookieDomain(HttpServletRequest request,
			HttpServletResponse response, String name, String domain) {
		Cookie[] cookies = request.getCookies();
		if ((cookies != null) && (cookies.length > 0))
			for (int i = 0; i < cookies.length; i++) {
				if (!name.equalsIgnoreCase(cookies[i].getName()))
					continue;
				Cookie ck = new Cookie(cookies[i].getName(), null);
				ck.setPath("/");
				if (org.apache.commons.lang.StringUtils.isNotEmpty(domain)) {
					ck.setDomain(domain);
				}
				ck.setMaxAge(0);
				response.addCookie(ck);
				return;
			}
	}


	/**获取请求IP地址*/
	public static String getIpAddr(HttpServletRequest request) {
		String ipAddress = null;
		ipAddress = request.getHeader("x-forwarded-for");
		if ((ipAddress == null) || (ipAddress.length() == 0)
				|| ("unknown".equalsIgnoreCase(ipAddress))) {
			ipAddress = request.getHeader("Proxy-Client-IP");
		}
		if ((ipAddress == null) || (ipAddress.length() == 0)
				|| ("unknown".equalsIgnoreCase(ipAddress))) {
			ipAddress = request.getHeader("WL-Proxy-Client-IP");
		}
		if ((ipAddress == null) || (ipAddress.length() == 0)
				|| ("unknown".equalsIgnoreCase(ipAddress))) {
			ipAddress = request.getRemoteAddr();
			if (ipAddress.equals("127.0.0.1")) {
				InetAddress inet = null;
				try {
					inet = InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
				ipAddress = inet.getHostAddress();
			}

		}
		if ((ipAddress != null) && (ipAddress.length() > 15)) {
			if (ipAddress.indexOf(",") > 0) {
				ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
			}
		}
		return ipAddress;
	}


	/**获取请求URL*/
	public static String getServletRequestUrlParms(HttpServletRequest request) {
		StringBuffer sbUrlParms = request.getRequestURL();
		sbUrlParms.append("?");
		@SuppressWarnings("unchecked")
		Enumeration<String> parNames = request.getParameterNames();
		while (parNames.hasMoreElements()) {
			String parName = parNames.nextElement().toString();
			try {
				sbUrlParms.append(parName).append("=")
						.append(URLEncoder.encode(request.getParameter(parName), "UTF-8"))
						.append("&");
			} catch (UnsupportedEncodingException e) {
				return "";
			}
		}
		return sbUrlParms.toString();
	}
	/**获取请求URI*/
	public static String getServletRequestUriParms(HttpServletRequest request) {
		StringBuffer sbUrlParms = new StringBuffer(request.getRequestURI());
		sbUrlParms.append("?");
		@SuppressWarnings("unchecked")
		Enumeration<String> parNames = request.getParameterNames();
		while (parNames.hasMoreElements()) {
			String parName = parNames.nextElement().toString();
			try {
				sbUrlParms.append(parName).append("=")
				.append(URLEncoder.encode(request.getParameter(parName), "UTF-8"))
				.append("&");
			} catch (UnsupportedEncodingException e) {
				return "";
			}
		}
		return sbUrlParms.toString();
	}
	
	/**后台用户登录号验证*/
	public static boolean checkLoginName(String value){
		return value.matches(CommonConstants.loginRegex);
	}

	/**正则表达试验证邮箱号*/
	public static boolean checkMobile (String value) {
		return (value.matches(CommonConstants.telRegex));
	}
	/**正则表达试验证邮箱号*/
	public static boolean checkEmail(String value, int length) {
		if (length == 0) {
			length = 40;
		}
		return (value.matches(CommonConstants.emailRegex)) && (value.length() <= length);
	}

	/**正则表达试验证密码*/
	public static boolean isPasswordAvailable(String password) {
		String partten = "^[_0-9a-zA-Z]{6,}$";
		boolean flag = (password.matches(partten)) && (password.length() >= 6) && (password.length() <= 16);
		return flag;
	}

	/**判断如果是ajax请求*/
	public static boolean isAjaxRequest(HttpServletRequest request) {
		String her = request.getHeader("x-requested-with");

		return org.apache.commons.lang.StringUtils.isNotEmpty(her);
	}
	/**判断如果不是ajax请求*/
	public static boolean isNotAjaxRequest(HttpServletRequest request) {
		return !isAjaxRequest(request);
	}
	
	/**获取用户访问浏览器信息*/
	public static String getUserAgent(HttpServletRequest request) {
    	String uabrow = request.getHeader("User-Agent");//获取浏览器信息
    	UserAgent userAgent =UserAgent.parseUserAgentString(uabrow);
    	Browser browser = userAgent.getBrowser();
        OperatingSystem os = userAgent.getOperatingSystem();
    	return browser.getName().toLowerCase()+";"+os.getName().toLowerCase();
    }
    /**去html*/
    public static String replaceTagHTML(String src) {
        String regex = "\\<(.+?)\\>";
        return org.apache.commons.lang.StringUtils.isNotEmpty(src)?src.replaceAll(regex, ""):"";
    }
}