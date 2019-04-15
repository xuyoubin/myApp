package com.utils;

import  static com.utils.HttpContextUtil.getRequset;
public final class GetIp {
	
	 /** 
     * 获取用户真实IP地址，不使用request.getRemoteAddr()的原因是有可能用户使用了代理软件方式避免真实IP地址, 
     * 可是，如果通过了多级反向代理的话，X-Forwarded-For的值并不止一个，而是一串IP值 
     *  
     * @return ip
     */
	public static String getIpAddr() {
        String ip = getRequset().getHeader("x-forwarded-for"); 
        if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {  
            // 多次反向代理后会有多个ip值，第一个ip才是真实ip
            if( ip.indexOf(",")!=-1 ){
                ip = ip.split(",")[0];
            }
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = getRequset().getHeader("Proxy-Client-IP"); 
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = getRequset().getHeader("WL-Proxy-Client-IP"); 
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = getRequset().getHeader("HTTP_CLIENT_IP"); 
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = getRequset().getHeader("HTTP_X_FORWARDED_FOR"); 
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = getRequset().getHeader("X-Real-IP"); 
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = getRequset().getRemoteAddr();  
        } 
        return ip;  
    }

}
