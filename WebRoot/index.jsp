<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> -->
    	<title>首页</title>
    	<link rel="shortcut icon" href="${pageContext.request.contextPath }/favicon.ico">
	</head>
  	<body>
	  	<%
	  		//request.getRequestDispatcher("/index.do").forward(request, response);
	  		request.getRequestDispatcher("/star.jsp").forward(request, response);
	  	%>
  	</body>
</html>
