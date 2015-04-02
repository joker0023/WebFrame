package com.jokerstation.webframe.util;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

public class ApiRequestUtils {

	//api项目所在服务器路径
	public static String apiurl = null;
	//签名的key
	private static final String KEY = "JOKERSTATION0023";
	//编码
	public static final String CHARSET = "UTF-8";
	//发送短信api路径
	private static final String sendSmsPath = "/api/sms/sendSms.do";
	
	static {
		try{
			Properties prop = new Properties();
			InputStream in = ApiRequestUtils.class.getClassLoader().getResourceAsStream("distribution.properties");
			prop.load(in);
			apiurl = prop.getProperty("apiurl");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 对请求参数签名
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public static String sign(Map<String, String> params) throws Exception {
		params = filter(params);
		String prestr = "";
		
		List<String> keys = new ArrayList<String>(params.keySet());
		Collections.sort(keys);
		
		for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            String value = params.get(key);
            
            if (i == keys.size() - 1) {//拼接时，不包括最后一个&字符
                prestr = prestr + key + "=" + value;
            } else {
                prestr = prestr + key + "=" + value + "&";
            }
        }
		
		prestr += KEY;
		
		String sign = PasswordUtil.MD5(prestr);
		
		return sign;
	}
	
	/**
	 * 校验请求是否合法
	 * @param request
	 * @param charset
	 * @return
	 * @throws Exception
	 */
	public static boolean checkRequest(HttpServletRequest request, String charset) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		
		String key = null;
		String[] values = null;
		String valueStr = null;
		String val = null;
		for(Entry<String, String[]> entry : requestParams.entrySet()){
			key = entry.getKey();
			values = entry.getValue();
			valueStr = "";
			
			if(key.equals("sign")){
				continue;
			}
			
			for (int i = 0; i < values.length; i++) {
				if(null != charset){
					val = new String(values[i].getBytes("ISO-8859-1"), charset);
				}else{
					val = values[i];
				}
				
				valueStr = (i == values.length - 1) ? valueStr + val : valueStr + val + ",";
			}
			
			params.put(key, valueStr);
		}
		
		String sign = request.getParameter("sign");
		String mySign = sign(params);
		
		if(mySign.equals(sign)){
			return true;
		}
		
		return false;
		
	}
	
	/**
	 * 过滤空属性
	 * @param params
	 * @return
	 * @throws Exception
	 */
	private static Map<String, String> filter(Map<String, String> params) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		
		if(null == params || params.size() == 0){
			return result;
		}
		
		 for (String key : params.keySet()) {
            String value = params.get(key);
            if (StringUtils.isBlank(value)) {
                continue;
            }
            result.put(key, value);
        }

        return result;
	}
	
	/**
	 * 发送短信
	 * @param sendMsg
	 * @param mobile
	 * @return
	 * @throws Exception
	 */
	public static String sendSms(String sendMsg, String mobile) throws Exception {
		if(null == apiurl){
			throw new Exception("api url is null!!");
		}
		Map<String, String> params = new HashMap<String, String>();
		params.put("sendMsg", sendMsg);
		params.put("mobile", mobile);
		params.put("timestamp", Long.toString(System.currentTimeMillis()));
		String sign = sign(params);
		params.put("sign", sign);
		
		String url = apiurl + sendSmsPath;
		
		String result = WebUtil.simpleDoPost(url, params);

		return result;
	}
	
}
