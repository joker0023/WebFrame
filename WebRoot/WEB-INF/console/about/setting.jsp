<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
 		<meta charset="utf-8">
    	<title>关于我们设置</title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<style type="text/css">
  			.control-container {
  				margin-top: 10px;
  				margin-bottom: 10px;
  			}
  			.table {
  				width: 700px;
  			}
  			.glyphicon {
  				margin-left: 10px;
  				cursor: pointer;
  				opacity: 0.5;
  			}
  			.glyphicon:HOVER {
				opacity: 0.9;
			}
  		</style>
  	</head>
  	<body>
  		<div class="container-fluid">
  			<h3>"关于我们"页面设置</h3>
  			<div class="control-container">
				<a href="${pageContext.request.contextPath }/console/about/addAbout.do" class="btn btn-primary" id="js-add">增加</a>
			</div>
			<c:if test="${null != data.aboutList }">
				<table class="table table-hover table-striped table-bordered">
					<thead>
						<tr>
							<th style="width: 120px;">名称</th>
							<th style="width: 60px;">排序</th>
							<th style="width: 60px;">展示</th>
							<th style="width: 200px;">修改日期</th>
							<th style="width: 80px;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${data.aboutList }" var="about">
							<tr>
								<td>
									<input type="hidden" name="id" value="${about.id }">
									${about.tabName }
								</td>
								<td>${about.sort }</td>
								<td>
									<c:if test="${about.showIn}"><span style="color: green;">是</span></c:if>
									<c:if test="${!about.showIn}"><span style="color: red;">否</span></c:if>
								</td>
								<td>${about.modified }</td>
								<td>
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
  		</div>
  		
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/utils.js"></script>
		<script type="text/javascript">
			$(function(){
				$(".glyphicon-pencil").click(function(){
					var id = $(this).parents("tr").find("input[name=id]").val();
					if(null == id){
						return;
					}
					window.location.href = "${pageContext.request.contextPath }/console/about/editAbout.do?id=" + id;
				});
				
				$(".glyphicon-remove").click(function(){
					var id = $(this).parents("tr").find("input[name=id]").val();
					if(null == id){
						return;
					}
					if(confirm("确定删除?")){
						$.ajax({
							type: "post",
							url: "${pageContext.request.contextPath }/console/about/delAbout.do",
							data: {
								id: id
							},
							dataType: "json",
							success: function(data){
								if(null != data && data.isSuccess){
									alert("删除成功");
									window.location.reload();
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