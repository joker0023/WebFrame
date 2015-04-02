package com.jokerstation.webframe.action.api;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.jokerstation.webframe.action.BaseAction;
import com.jokerstation.webframe.data.Data;
import com.jokerstation.webframe.util.WebUtil;

/**
 * 对外开放的短信api
 * @author Joker
 *
 */
public class SmsAction extends BaseAction {

	private static final long serialVersionUID = -6564614438673107367L;

	private static final Logger logger = Logger.getLogger(SmsAction.class);
	
	/**
	 * 发送短信
	 */
	public void sendSms() {
		try{
			String sendMsg = request.getParameter("sendMsg");
			String mobile = request.getParameter("mobile");
			
			if(StringUtils.isNotBlank(sendMsg) && StringUtils.isNotBlank(mobile)){
				Map<String, String> params = new HashMap<String, String>();
				params.put("apikey", Data.smsAppKey);
				params.put("mobile", mobile.trim());
				params.put("text", sendMsg);
				String result = WebUtil.simpleDoPost(Data.smsApiUrl, params);
				setJSONAttribute("sendResut", result);
				flushJSONData(true);
			}
		}catch (Exception e) {
			logger.error("发送短信出错", e);
			setJSONAttribute("sendResult", e.getMessage());
		}
		
		flushJSONData(false);
	}
}
