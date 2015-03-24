<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
 	<head>
 		<meta charset="utf-8">
    	<title>Console</title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/console/console.css">
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script type="text/javascript">
			$(function(){
				loadComplete();
				
				$(".g-left .nav > li > a").click(function(){
	  				$(this).parents("ul").find("li").removeClass("active");
	  				$(this).parent().addClass("active");
	  			});
			});
			
			function loadComplete() {
				var clientHeight = document.documentElement.clientHeight;
		    	
		    	//初始化左侧菜单栏的高度
		    	$(".g-left").height(clientHeight - 130);
		    	
		    	//初始化iframe的高度
		    	$("#mainIframe").height(clientHeight - 130 - 5);
		    	
				
		    	//初始化iframe的宽度
				var clientWidth = document.documentElement.clientWidth;
				$("#mainIframe").width(clientWidth - 200);
			}
		</script>
  	</head>
  
  	<body>
  		<div class="container-fluid header-container">
  			<div class="row">
  				<nav class="navbar navbar-default">
	  				<div class="container-fluid">
	  					<div class="navbar-header">
	  						<a class="navbar-brand" href="javascript:void(0);">
					     		<img alt="Brand" src="${pageContext.request.contextPath }/assets/img/console_logo.png">
					      	</a>
					      	<p class="navbar-text">后台管理系统</p>
	  					</div>
	  					<div class="collapse navbar-collapse">
	  						<ul class="nav navbar-nav navbar-right">
	  							<li class="dropdown">
	  								<a class="dropdown-toggle" aria-expanded="false" role="button" data-toggle="dropdown" href="javascript:void(0);">
										<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu" role="menu">
										<li>
			  								<a href="${pageContext.request.contextPath}" target="_blank">前台</a>
			  							</li>
			  							<li>
			  								<a href="${pageContext.request.contextPath}/console/system/changePwd.do">修改密码</a>
			  							</li>
										<li class="divider"></li>
										<li>
											<a href="${pageContext.request.contextPath }/console_check/logout.do">退出</a>
										</li>
									</ul>
	  							</li>
	  						</ul>
	  					</div>
	  					<div class="navbar-left">
	  						<ul class="nav nav-pills main-nav">
	  							<li role="presentation" <c:if test="${data.menu=='websetting'}">class="active"</c:if>>
									<a href="${pageContext.request.contextPath }/console/websetting/webSetting.do">全局设置</a>
								</li>
		  						<li role="presentation" <c:if test="${data.menu=='webindex'}">class="active"</c:if>>
		  							<a href="${pageContext.request.contextPath }/console/webindex/webIndex.do">首页设置</a>
		  						</li>
								<li role="presentation" <c:if test="${data.menu=='about'}">class="active"</c:if>>
									<a href="${pageContext.request.contextPath }/console/about/about.do">关于我们</a>
								</li>
								<li role="presentation" <c:if test="${data.menu=='product'}">class="active"</c:if>>
									<a href="${pageContext.request.contextPath }/console/product/product.do">产品介绍</a>
								</li>
								<li role="presentation" <c:if test="${data.menu=='recruitment'}">class="active"</c:if>>
									<a href="${pageContext.request.contextPath }/console/recruitment/recruitment.do">诚聘英才</a>
								</li>
								<li role="presentation" <c:if test="${data.menu=='contact'}">class="active"</c:if>>
									<a href="${pageContext.request.contextPath }/console/contact/contact.do">联系我们</a>
								</li>
								<li role="presentation" <c:if test="${data.menu=='other'}">class="active"</c:if>>
									<a href="${pageContext.request.contextPath }/console/other/other.do">其他</a>
								</li>
								<c:if test="${sessionScope.console_role.namespace == '/' }">
									<li role="presentation" <c:if test="${data.menu=='system'}">class="active"</c:if>>
										<a href="${pageContext.request.contextPath }/console/system/system.do">系统</a>
									</li>
								</c:if>
		  					</ul>
	  					</div>
	  				</div>
	  			</nav>
  			</div>