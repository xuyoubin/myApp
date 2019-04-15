package com.utils;

import static com.utils.HttpContextUtil.getRequset;
import static com.utils.HttpContextUtil.getResponse;

import javax.servlet.http.Cookie;

public class CookieUtil {
	/**
	 * cookie存用户名称
	 */
	public static final String USER_NAME = "userName";
	/**
	 * cookie存用户密码
	 */
	public static final String USER_PWD = "userPwd";

	public static void creatCookie(String name,String value){
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(60*60*60*24*5);
		getResponse().addCookie(cookie);
	}
	
	public static void removeCookie(String name){
		Cookie cookies[] = getRequset().getCookies();
		if(cookies != null){
			for(int i=0;i<cookies.length;i++){
				if(name.equals(cookies[i].getName())){
					cookies[i].setMaxAge(0);
				}
				if(name.equals(cookies[i].getName())){
					cookies[i].setMaxAge(0);
				}
				getResponse().addCookie(cookies[i]);
			}
		}
	}
}
