package com.utils;

import javax.activation.MimetypesFileTypeMap;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * @Date: 2017/5/17 10:58
 * @Author: ybxu
 * @Version: 1.0
 * @Remark: 图片上传
 **/
public class HttpPostUploadUtil { 
   
    /**
     * @param args
     */ 
    public static void main(String[] args) { 
           
        String filepath="C:\\Users\\Administrator\\Desktop\\3b3d339a3e07478fa3335aa12f890db0.jpg"; 
           
        String urlStr = "https://192.168.3.222:7002/upload"; 
           
        Map<String, String> textMap = new HashMap<String, String>(); 
       
        textMap.put("sessionId", "adminf2803e00-04de-4fa7-8950-8842d0b0e360");
        textMap.put("serviceId ", "esb.ygt.fileupload");
        textMap.put("filename ", "filename");
        textMap.put("fqr ", "0");
   
        Map<String, String> fileMap = new HashMap<String, String>(); 
           
        fileMap.put("userfile", filepath); 
           
        String ret = formUpload(urlStr, textMap, fileMap); 
           
        System.out.println(ret); 
           
   
    } 
       
       
   
    /**
     * 上传图片
     * @return
     */ 
    public static String formUpload(String urlStr, Map<String, String> textMap, 
            Map<String, String> fileMap) { 
        String res = ""; 
        HttpURLConnection conn = null; 
        String BOUNDARY = "---------------------------123821742118716"; //boundary就是request头和上传文件内容的分隔符 
        try { 
            URL url = new URL(urlStr); 
            conn = (HttpURLConnection) url.openConnection(); 
            conn.setConnectTimeout(5000); 
            conn.setReadTimeout(30000); 
            conn.setDoOutput(true); 
            conn.setDoInput(true); 
            conn.setUseCaches(false); 
            conn.setRequestMethod("POST"); 
            conn.setRequestProperty("Connection", "Keep-Alive"); 
            /*conn 
                    .setRequestProperty("User-Agent", 
                            "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.6)"); */
            conn.setRequestProperty("Content-Type", 
                    "multipart/form-data; boundary=" + BOUNDARY); 
   
            OutputStream out = new DataOutputStream(conn.getOutputStream()); 
            // text 
            if (textMap != null) { 
                StringBuffer strBuf = new StringBuffer(); 
                Iterator iter = textMap.entrySet().iterator(); 
                while (iter.hasNext()) { 
                    Map.Entry entry = (Map.Entry) iter.next(); 
                    String inputName = (String) entry.getKey(); 
                    String inputValue = (String) entry.getValue(); 
                    if (inputValue == null) { 
                        continue; 
                    } 
                    strBuf.append("\r\n").append("--").append(BOUNDARY).append( 
                            "\r\n"); 
                    strBuf.append("Content-Disposition: form-data; name=\"" 
                            + inputName + "\"\r\n\r\n"); 
                    strBuf.append(inputValue); 
                } 
                out.write(strBuf.toString().getBytes()); 
            } 
   
            // file 
            if (fileMap != null) { 
                Iterator iter = fileMap.entrySet().iterator(); 
                while (iter.hasNext()) { 
                    Map.Entry entry = (Map.Entry) iter.next(); 
                    String inputName = (String) entry.getKey(); 
                    String inputValue = (String) entry.getValue(); 
                    if (inputValue == null) { 
                        continue; 
                    } 
                    File file = new File(inputValue); 
                    String filename = file.getName(); 
                    String contentType = new MimetypesFileTypeMap() 
                            .getContentType(file); 
                    if (filename.endsWith(".png")) { 
                        contentType = "image/png"; 
                    } 
                    if (contentType == null || contentType.equals("")) { 
                        contentType = "application/octet-stream"; 
                    } 
   
                    StringBuffer strBuf = new StringBuffer(); 
                    strBuf.append("\r\n").append("--").append(BOUNDARY).append( 
                            "\r\n"); 
                    strBuf.append("Content-Disposition: form-data; name=\"" 
                            + inputName + "\"; filename=\"" + filename 
                            + "\"\r\n"); 
                    strBuf.append("Content-Type:" + contentType + "\r\n\r\n"); 
   
                    out.write(strBuf.toString().getBytes()); 
   
                    DataInputStream in = new DataInputStream( 
                            new FileInputStream(file)); 
                    int bytes = 0; 
                    byte[] bufferOut = new byte[1024]; 
                    while ((bytes = in.read(bufferOut)) != -1) { 
                        out.write(bufferOut, 0, bytes); 
                    } 
                    in.close(); 
                } 
            } 
   
            byte[] endData = ("\r\n--" + BOUNDARY + "--\r\n").getBytes(); 
            out.write(endData); 
            out.flush(); 
            out.close(); 
   
            // 读取返回数据 
            StringBuffer strBuf = new StringBuffer(); 
            BufferedReader reader = new BufferedReader(new InputStreamReader( 
                    conn.getInputStream())); 
            String line = null; 
            while ((line = reader.readLine()) != null) { 
                strBuf.append(line).append("\n"); 
            } 
            res = strBuf.toString(); 
            reader.close(); 
            reader = null; 
        } catch (Exception e) { 
            System.out.println("发送POST请求出错。" + urlStr); 
            e.printStackTrace(); 
        } finally { 
            if (conn != null) { 
                conn.disconnect(); 
                conn = null; 
            } 
        } 
        return res; 
    } 
   
}