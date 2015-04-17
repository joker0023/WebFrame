<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<title>首页</title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<style type="text/css">
  			#container {
  				min-width: 992px;
  			}
  			.navbar-default {
  				background-color: #184b80;
  			}
  			.navbar-default .navbar-collapse .navbar-nav {
  				margin-right: 20px;
  			}
  			.navbar-default .navbar-brand, .navbar-default .navbar-brand:HOVER, .navbar-default .navbar-collapse .navbar-nav li a {
  				color: #b8e7f9;
  			}
  			.navbar-default .navbar-collapse .navbar-nav .active a, .navbar-default .navbar-collapse .navbar-nav .active a:HOVER {
  				background-color: #003366;
  				background: linear-gradient(to left, #0a2540, #003366, #0a2540);
  				color: #FFFFCC;
  			}
  			.navbar-default .navbar-collapse .navbar-nav li a:HOVER {
  				background-color: rgba(0,0,0,0.2);
  				color: #FFFFCC;
  			}
	  		.marketing .col-md-4 {
	  			text-align: center;
	  		}
	  		.marketing .col-md-4 .img-circle {
	  			height: 60px;
	  		}
	  		.jumbotron {
	  			height: 400px;
	  			/*
	  			background-image: url('${pageContext.request.contextPath }/assets/img/jumbotron.jpg');
	  			*/
	  		}
	  		
	  		.footer {
			    font-size: 10px;
			    height: 50px;
			    padding-top: 28px;
			    text-align: center;
			    color: #999;
			}
			.footer p {
			    font-size: 14px;
			    margin-bottom: 6px;
			}
  		</style>
	</head>
  
  	<body>
  		<div id="container">
	  		<nav class="navbar navbar-default navbar-fixed-top">
	 			<div class="container">
	 				<div class="navbar-header">
				    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-menu-collapse">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
				     	</button>
				      	<a class="navbar-brand" href="${pageContext.request.contextPath }/index.do">
				      		JOKERSTATION
				      	</a>
				    </div>
				    <div class="collapse navbar-collapse" id="main-menu-collapse">
				    	<form class="navbar-form navbar-right" role="search" onsubmit="return false;">
	        				<div class="form-group">
	          					<input type="text" class="form-control" placeholder="Search">
				        	</div>
				        	<button type="button" class="btn btn-primary">
				        		<span class="glyphicon glyphicon-search"></span>
				        	</button>
				      	</form>
				      	<ul class="nav navbar-nav navbar-right">
				    		<li>
				    			<a href="${pageContext.request.contextPath }/index.do">首&nbsp;&nbsp;页</a>
				    		</li>
				    		<li>
				    			<a href="${pageContext.request.contextPath }/about.do">关于我们</a>
				    		</li>
				    		<li>
				    			<a href="${pageContext.request.contextPath }/product.do">产品介绍</a>
				    		</li>
				    		<li>
				    			<a href="${pageContext.request.contextPath }/recruitment.do">诚聘英才</a>
				    		</li>
				    		<li>
				    			<a href="${pageContext.request.contextPath }/contact.do">联系我们</a>
				    		</li>
				    	</ul>
				    </div>
	 			</div>
	 		</nav>
	 		<div class="jumbotron">
	 			<div class="container">
	 				<div class="col-xs-6">
	 					<h1>大大的巨幕</h1>
		  				<p>
		  					this is content,just is test.
		  					this is content,just is test.
		  					this is content,just is test.
		  				</p>
		  				<p><a class="btn btn-primary btn-lg" href="#" role="button">more</a></p>
	 				</div>
	 				<div class="col-xs-6">
	 				
	 				</div>
	 			</div>
		  	</div>
		  	<div class="container marketing">
		  		<div class="row">
		  			<div class="col-md-4">
	  					<img class="img-circle" src="${pageContext.request.contextPath }/assets/img/gotop.png" alt="...">
						<h2>TOP</h2>
						<p>gotop.png</p>
		  			</div>
		  			<div class="col-md-4">
	  					<img class="img-circle" src="${pageContext.request.contextPath }/assets/img/loading.gif" alt="...">
	  					<h2>LOADDING</h2>
	  					<p>loading.gif</p>
		  			</div>
		  			<div class="col-md-4">
		  				<img class="img-circle" src="${pageContext.request.contextPath }/assets/img/console_logo.png" alt="...">
		  				<h2>LOGO</h2>
		  				<p>logo.png</p>
		  			</div>
		  		</div>
		  		<hr class="featurette-divider">
		  	</div>
		  	<div class="footer">
	  			<p>
	  				Copyright [c] 2015 By joker Allrights Reserved. 
	  			</p>
	  		</div>
  		</div>
  		
  	
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
	  	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script type="text/javascript">
			$(function(){
				
			});
		</script>
  	</body>
</html>