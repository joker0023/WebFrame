<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
 		<meta charset="utf-8">
    	<title>动态设置</title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
  		<style type="text/css">
  			.container-fluid {
	    		padding-top: 30px;
	    		min-height: 400px;
	    		min-width: 700px;
	    	}
	    	.control-container {
	    		margin-bottom: 30px;
	    	}
	    	.pagination {
	    		float: right;
	    		margin: 0;
	    	}
	    	.glyphicon {
	    		cursor: pointer;
	    	}
	    	.td-title span {
	    		white-space: nowrap;
	    		overflow: hidden;
	    		text-overflow: ellipsis;
	    		width: 400px;
	    		display: block;
	    	}
  		</style>
  	</head>
  	<body>
  		<div class="container-fluid">
  			<h3>动态列表</h3>
  			<div class="control-container ">
  				<form action="${pageContext.request.contextPath }/console/other/dynamic/list.do" method="post" class="form-inline js-search-form">
  					<div class="form-group">
    					<input type="text" class="form-control" name="keyWord" placeholder="标题关键字" value="${requestScope.data.keyWord }">
  					</div>
  					<button type="submit" class="btn btn-primary">搜索</button>
					<a href="${pageContext.request.contextPath }/console/other/dynamic/add.do" class="btn btn-primary">增加</a>
  				</form>
  			</div>
  			<c:if test="${null != data.list }">
  				<table class="table table-hover table-striped table-bordered">
  					<thead>
						<tr>
							<th style="width: 60px;">类型</th>
							<th style="width: 300px;">标题</th>
							<th style="width: 200px;">修改日期</th>
							<th style="width: 80px;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${data.list }" var="dynamic">
							<tr>
								<td>
									<input type="hidden" value="${dynamic.id }" name="id">
									<span style="font-weight: bold; ${dynamic.type == 1 ? 'color:red' : 'color:green' }">${dynamic.type == 1 ? '公告' : '文章' }</span>
								</td>
								<td title="${dynamic.title }" class="td-title">
									<span>${dynamic.title }</span>
								</td>
								<td>
									${dynamic.modified }
								</td>
								<td>
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								</td>
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
  			</c:if>
  		</div>
  		
  		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/utils.js"></script>
		<script type="text/javascript">
			$(function(){
				$(".glyphicon-pencil").click(function(){
					var id = $(this).parents("tr").find("input[name=id]").val();
					if(null == id){
						return;
					}
					window.location.href = "${pageContext.request.contextPath }/console/other/dynamic/edit.do?id=" + id;
				});
				
				$(".glyphicon-remove").click(function(){
					var id = $(this).parents("tr").find("input[name=id]").val();
					if(null == id){
						return;
					}
					if(confirm("确定删除?")){
						$.ajax({
							type: "post",
							url: "${pageContext.request.contextPath }/console/other/dynamic/del.do",
							data: {
								id: id
							},
							dataType: "json",
							success: function(data){
								if(null != data && data.isSuccess){
									alert("删除成功");
									$("#page-form").submit();
								}else{
									console.log(data);
								}
							},
							error: function(data, status, e){
								alert(e);
							}
						});
					}
				});
			});
		</script>
  	</body>
</html>