<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
    	<title>
    		<c:if test="${data.menu == 'index'}">首页</c:if>
    		<c:if test="${data.menu == 'about'}">关于我们</c:if>
    		<c:if test="${data.menu == 'product'}">产品介绍</c:if>
    		<c:if test="${data.menu == 'recruitment'}">诚聘英才</c:if>
    		<c:if test="${data.menu == 'contact'}">联系我们</c:if>
    	</title>
    	<meta content="" name="description">
    	<meta content="" name="Keywords">
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/index.css">
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
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