package test.webframe;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpConnection;
import org.apache.struts2.components.Password;

import com.jokerstation.webframe.data.Data;
import com.jokerstation.webframe.util.ApiRequestUtils;
import com.jokerstation.webframe.util.PasswordUtil;
import com.jokerstation.webframe.util.WebUtil;

public class CommTest {

	public static void main(String[] args) {
		try{
			System.out.println(200.0/22 * 8);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void unicodeTest() {
		try{

//			System.out.println(CommTest.class.getSimpleName());
			
//			URL url = new URL("http://localhost/WebFrame/123");
//			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
//			
//			InputStreamReader in = new InputStreamReader(conn.getInputStream());
//			char[] c = new char[1024];
//			in.read(c);
//			
//			System.out.println(new String(c));
			
			String str = "中文"; // \u4e2d \u6587
			
			char[] arr = str.toCharArray();
			for(char c : arr){
				System.out.println("\\u" + Integer.toHexString(c));
			}
			
			System.out.println('\u4e2d');
			System.out.println('\u6587');
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
