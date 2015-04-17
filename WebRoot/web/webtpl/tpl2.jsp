<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
    	<title>关于我们</title>
    	<meta content="" name="description">
    	<meta content="" name="Keywords">
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<link rel="stylesheet" href="${null == requestScope.s? 's1' : requestScope.s}.css">
  		<style type="text/css">
  			
  		</style>
	</head>
  	<body>
    	<div id="container-fluid">
    		<div class="header">
    			<div class="header_top">
					<div class="logo">
						<a href="${pageContext.request.contextPath }/index.do">
							<img src="${pageContext.request.contextPath }/assets/img/logo.png" />
						</a>
					</div>
					<div class="collection">
						<a href="${pageContext.request.contextPath }/index.do">
							<img src="${pageContext.request.contextPath }/assets/img/home.png" />
						</a>
					</div>
				</div>
				
				<div class="nav-top"></div>
				<ul class="nav my-nav">
					<li class="first">
						<a href="tpl.jsp">首&nbsp;&nbsp;页</a>
					</li>
					<li class="active">
						<a href="#">关于我们</a>
					</li>
					<li>
						<a href="#">产品介绍</a>
					</li>
					<li>
						<a href="#">诚聘英才</a>
					</li>
					<li class="last">
						<a href="#">联系我们</a>
					</li>
				</ul>
				<div class="nav-bottom"></div>
    		</div>
    		<div class="clear"></div>
    		
    		<div class="main-content">
    		
	    		<div class="left-menu">
		   			<ul>
		   				<li class="active">
	   						<a href="#tab_0" data-toggle="tab">简介</a>
	   					</li>
	   					<li>
	   						<a href="#tab_1" data-toggle="tab">其他</a>
	   					</li>
	   					<li>
	   						<a href="#tab_2" data-toggle="tab">其他2</a>
	   					</li>
	   					<li>
	   						<a href="#tab_3" data-toggle="tab">其他3</a>
	   					</li>
		   			</ul>
   				</div>
		   		<div class="right-content tab-content">
		   			<div id="tab_0" class="tab-pane fade active in">
		   				<h1 align="center">
							<span style="font-family:KaiTi_GB2312;">简介</span>
						</h1>
	   					<p style="text-align: center;">
	   						&nbsp;&nbsp;这里是模板的简介,所以没什么东西写,就写几个字吧,好歹也撑一下页面,看去没有那么空
	   						<br>
	   						好吧,换了一行继续写,但是还是不知道写什么好,所以继续撑.
	   						<br>
	   						终于到第三行了,好像看去终于有一点东西了,感觉不错
	   						<br>
	   						好了,第四行,感觉已经很充满了
	   						<br>
	   						踏入第五行,感觉我是时候收手了,5行应该也够展示了
	   						<br>
	   						不行,我要再加一行,第六行从此诞生,哈哈哈~~
	   						<br>
	   						我居然还能写到第七行,看来我还是太低估自己了,在换一行,准备结束了
	   						<br>
	   						好的,真的要结束了,End.....
	   					</p>
	   				</div>
	   				<div id="tab_1" class="tab-pane fade">
	   					<p>其他信息01</p>
	   				</div>
	   				<div id="tab_2" class="tab-pane fade">
	   					<p>其他信息02</p>
	   				</div>
	   				<div id="tab_3" class="tab-pane fade">
	   					<p>其他信息03</p>
	   				</div>
		   		</div>
    		</div>
    		
    		<div class="clear"></div>
	    	<div class="footer">
				<p class="link-p">
					友情链接: 
					<a href="http://www.w3school.com.cn/" target="_blank">W3C教堂</a>
					<a href="http://v3.bootcss.com" target="_blank">bootstrap</a>
					<a href="http://sae.sina.com.cn" target="_blank">新浪SAE</a>
					<a href="http://www.aliyun.com/" target="_blank">阿里云</a>
				</p>
	  			<p>
	  				Copyright [c] 2015 By joker Allrights Reserved. 
	  			</p>
	  		</div>
  		</div>
  	<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function(){
			if($(".left-menu").length > 0 && $(".right-content").length > 0){
				if($(".left-menu").height() < $(".right-content").height()){
					$(".left-menu").height($(".right-content").height());
				}
			}
		});
	</script>
	</body>
</html>