<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
    	<title>首页</title>
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
				<ul class="nav">
					<li class="first active">
						<a href="#">首&nbsp;&nbsp;页</a>
					</li>
					<li>
						<a href="tpl2.jsp">关于我们</a>
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
    		
	    		<div class="index-content">
	    		
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