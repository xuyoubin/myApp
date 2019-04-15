package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import  static com.utils.HttpContextUtil.getResponse;

public class BaseController {
	private static final Logger log = Logger.getLogger(BaseController.class);
	
	protected void printJSON(HttpServletResponse response,JSONObject json){
		PrintWriter out = null;
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			out = response.getWriter();
			out.print(JSON.toJSONString(json, SerializerFeature.DisableCircularReferenceDetect));
		} catch (IOException e) {
			log.error(e.getMessage());
		}finally{
			out.close();
		}
		
	}
	
	
	public String jsonSuccess(JSONObject json){
		json.put("success", true);
		printJSON(getResponse(),json);
		return null;
	}
	public String jsonFail(String msg){
		JSONObject obj = new JSONObject(2);
		obj.put("success", false);
		obj.put("note", msg);
		printJSON(getResponse(), obj);
		return null;
	}
	

}
