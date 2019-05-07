package com.utils;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.URLDecoder;

/**
 * @Date: 2019/5/7 10:58
 * @Author: ybxu
 * @Version: 1.0
 * @Remark: 流的形式获取数据
 **/
public class StreamUtils {

    public static JSONObject getRequestInputStream(HttpServletRequest request){
        JSONObject result = new JSONObject();
        try {
            request.setCharacterEncoding("UTF-8");
            BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream(),"utf-8") );
            String line = null;
            StringBuffer sb = new StringBuffer();
            while ((line = br.readLine()) != null){
                sb.append(line);
            }
            String str = sb.toString();
            str = URLDecoder.decode(str,"utf-8");
            if(str != null && "".equals(str)){
                result = JSONObject.parseObject(str);
            }

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
     return result;
    }
}
