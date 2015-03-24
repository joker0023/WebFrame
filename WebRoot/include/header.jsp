<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
    	<title>首页</title>
    	<meta content="" name="description">
    	<meta content="" name="Keywords">
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/index.css">
	</head>
  
  	<body>
    	<div id="container">
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
				
				<ul class="nav js-nav">
					<li class="<c:if test="${data.menu == 'index'}">active</c:if>">
						<a href="${pageContext.request.contextPath }/index.do">首&nbsp;&nbsp;页</a>
					</li>
					<li class="<c:if test="${data.menu == 'about'}">active</c:if>">
						<a href="${pageContext.request.contextPath }/about.do">关于我们</a>
					</li>
					<li class="<c:if test="${data.menu == 'product'}">active</c:if>">
						<a href="${pageContext.request.contextPath }/product.do">产品介绍</a>
					</li>
					<li class="<c:if test="${data.menu == 'recruitment'}">active</c:if>">
						<a href="${pageContext.request.contextPath }/index.do">诚聘英才</a>
					</li>
					<li class="<c:if test="${data.menu == 'contact'}">active</c:if>">
						<a href="${pageContext.request.contextPath }/contact.do">联系我们</a>
					</li>
				</ul>
    		</div>