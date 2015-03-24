<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="utf-8">
    <title>welcome</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
	<style type="text/css">
		@keyframes color-change{
			50%  {transform: rotateY(180deg) rotate(45deg); background-color: #3399CC}
			100% {transform: rotateY(360deg) rotate(45deg); background-color: #3399FF}
		}
		@-webkit-keyframes color-change{
			50%  {-webkit-transform: rotateY(180deg) rotate(45deg); background-color: #3399CC}
			100% {-webkit-transform: rotateY(360deg) rotate(45deg); background-color: #3399FF}
		}
		.ball {
			width: 100px;
			height: 100px;
			border-radius: 10px;
			background-color: #CCCCCC;
			background: linear-gradient(to top, #CCC, #666, #999, #CCC);
			margin: 200px auto;
			cursor: pointer;
			transform: rotate(45deg);
			-webkit-transform: rotate(45deg);
			animation: color-change 2s linear infinite;
			-webkit-animation: color-change 2s linear infinite;
		}
		.ball .content {
			font-weight: bold;
			transform: rotate(-45deg);
			-webkit-transform: rotate(-45deg);
			padding-top: 30px;
		}
		.g-container-body {
			background-color: #FFF;
		}
	</style>
  </head>
  
  <body>
	<div class="g-container">
		<div class="g-container-body">
			<div style="height: 400px;">
				<div class="ball">
					<div class="content"></div>
				</div>
			</div>
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
