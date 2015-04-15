<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
 		<meta charset="utf-8">
    	<title>站点设置</title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<style type="text/css">
  			.table {
  				width: 500px;
  			}
  			.table input, .uploadBtn, .saveBtn, .cancelBtn {
  				display: none;
  			}
  		</style>
  	</head>
  	<body>
  		<div class="container-fluid">
  			<form action="#" method="post" enctype="multipart/form-data">
  				<table class="table">
	  				<thead>
	  					<tr>
	  						<th colspan="2">首页基本信息设置</th>
	  					</tr>
	  				</thead>
	  			</table>
  			</form>
  		</div>
  		
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/utils.js"></script>
		<script type="text/javascript">
			$(function(){
				var saveResult = "${data.saveResult}";
	  			if(null != saveResult && saveResult == "true"){
	  				alert("保存成功");
	  			}else if(null != saveResult && saveResult == "false"){
	  				alert("保存失败");
	  			}
	  			
				
			});
		</script>
  	</body>
</html>