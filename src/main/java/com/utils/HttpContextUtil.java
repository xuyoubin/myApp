package com.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 该类封装着当前请求的HttpServletRequest对象和HttpServletResponse对象。
 * 
 */
public final class HttpContextUtil {
	private static final ThreadLocal<HttpContextUtil> LOCAL_HTPP_CONTEXT = new ThreadLocal<HttpContextUtil>();
	
	private static HttpServletRequest request;
	private static HttpServletResponse response;
	
	private HttpContextUtil(){
		
	}
	
	@SuppressWarnings("static-access")
	static void set(HttpServletRequest request, HttpServletResponse response){
		HttpContextUtil context = new HttpContextUtil();
		context.request = request;
		context.response = response;
		LOCAL_HTPP_CONTEXT.set(context);
	}
	
	static void remove(){
		LOCAL_HTPP_CONTEXT.remove();
	}
	@SuppressWarnings("static-access")
	public static HttpServletRequest getRequset(){
		return LOCAL_HTPP_CONTEXT.get().request;
	}
	@SuppressWarnings("static-access")
	public static HttpServletResponse getResponse(){
		return LOCAL_HTPP_CONTEXT.get().response;
	}
	
	

}
