<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<title>
    		${data.webTitle}
    	</title>
    	<meta content="${data.description}" name="description">
    	<meta content="${data.keywords}" name="keywords">
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/index.css">
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
  		<style type="text/css">
	  		
  		</style>
	</head>
  
  	<body>
    	<div id="container-fluid">
    		<div class="header">
    			<div class="header_top">
					<div class="logo">
						<a href="${pageContext.request.contextPath }/">
							JOKERSTATION
							<!-- 
							<img src="${pageContext.request.contextPath }/assets/img/logo.png" />
							-->
						</a>
					</div>
					<div class="collection">
						<a href="${pageContext.request.contextPath }/index.do">
							<img src="${pageContext.request.contextPath }/assets/img/home.png" />
						</a>
					</div>
				</div>
				
				<div class="nav-top"></div>
				<ul class="my-nav">
					<li class="first ${data.menu == 'index' ? 'active' : ''}">
						<a href="${pageContext.request.contextPath }/index.do">首&nbsp;&nbsp;页</a>
					</li>
					<li class="${data.menu == 'about' ? 'active' : ''}">
						<a href="${pageContext.request.contextPath }/about.do">关于我们</a>
					</li>
					<li class="${data.menu == 'product' ? 'active' : ''}">
						<a href="${pageContext.request.contextPath }/product.do">产品介绍</a>
					</li>
					<li class="${data.menu == 'recruitment' ? 'active' : ''}">
						<a href="${pageContext.request.contextPath }/recruitment.do">诚聘英才</a>
					</li>
					<li class="last ${data.menu == 'contact' ? 'active' : ''}">
						<a href="${pageContext.request.contextPath }/contact.do">联系我们</a>
					</li>
				</ul>
				<div class="nav-bottom"></div>
    		</div>
    		<div class="clear"></div>