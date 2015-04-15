<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<title>首页</title>
	</head>
  	<body>
	  	<%
	  		request.getRequestDispatcher("/index.do").forward(request, response);
	  		//response.sendRedirect(request.getContextPath() + "/index.do");
	  	%>
  	</body>
</html>
