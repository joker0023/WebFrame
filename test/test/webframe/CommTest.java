package test.webframe;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CommTest {

	public static void main(String[] args) {
		try{
			String uri = "/WebFrame/console/index.do";
			String uri2 = "/WebFrame/console/contact/index.do";
			
			System.out.println(uri.indexOf("/", uri.indexOf("/console/") + 9));
			System.out.println(uri2.indexOf("/", uri2.indexOf("/console/") + 9));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
