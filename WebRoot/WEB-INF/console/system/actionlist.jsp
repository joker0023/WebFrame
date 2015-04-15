<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
 		<meta charset="utf-8">
    	<title>用户行为列表</title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/plugins/jquery-ui/jquery-ui.css">
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
  		<style type="text/css">
  			.container-fluid {
	    		padding-top: 30px;
	    		min-height: 400px;
	    	}
	    	.control-container {
	    		margin-bottom: 30px;
	    	}
	    	
	    	.pagination {
	    		float: right;
	    		margin: 0;
	    	}
  		</style>
  	</head>
  	<body>
  		<div class="container-fluid">
  			<div class="control-container">
  				<form action="${pageContext.request.contextPath }/console/system/actionList.do" method="post" class="form-inline js-search-form">
  					<div class="form-group">
  						<input type="text" class="form-control" placeholder="开始时间" name="start" value="${requestScope.data.start }">
  					</div>
  					<div class="form-group">
  						<input type="text" class="form-control" placeholder="结束时间" name="end" value="${requestScope.data.end }">
  					</div>
  					<div class="form-group">
    					<input type="text" class="form-control" name="account" placeholder="账号" value="${requestScope.data.account }">
  					</div>
  					<button type="submit" class="btn btn-primary">搜索</button> 
  				</form>
			</div>
			<table class="table table-hover table-striped table-bordered">
				<thead>
					<tr>
						<th style="width: 120px;">账号</th>
						<th style="width: 120px;">操作时间</th>
						<th style="width: 120px;">操作类型</th>
						<th style="width: 200px;">详细</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.data.list}" var="action">
						<tr>
							<td>${action.account }</td>
							<td>${action.time }</td>
							<td>${action.action }</td>
							<td>${action.detail }</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4" style="background-color: #EEE;"></td>
					</tr>
				</tfoot>
			</table>
			<%@ include file="/WEB-INF/console/pager.jsp"%>
  		</div>
  		
  		
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/utils.js"></script>
		<script src="${pageContext.request.contextPath }/assets/plugins/jquery-ui/jquery.ui.core.js"></script>
		<script src="${pageContext.request.contextPath }/assets/plugins/jquery-ui/jquery.ui.widget.js"></script>
		<script src="${pageContext.request.contextPath }/assets/plugins/jquery-ui/jquery.ui.datepicker.js"></script>
		<script type="text/javascript">
			$(function(){
				$("input[name='start']").datepicker({
					altField: "input[name='start']",
					altFormat: "yy-mm-dd"
				});
				
				$("input[name='end']").datepicker({
					altField: "input[name='end']",
					altFormat: "yy-mm-dd"
				});
			});
		</script>
  	</body>
</html>