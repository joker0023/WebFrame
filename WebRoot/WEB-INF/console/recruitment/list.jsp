<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
 		<meta charset="utf-8">
    	<title>招聘信息设置</title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
  		<style type="text/css">
  			.control-container {
  				margin-top: 10px;
  				margin-bottom: 10px;
  				padding-bottom: 20px;
  				border-bottom: 1px #ccc solid;
  			}
  			.table, .pager-container, form {
  				width: 650px;
  			}
  			.td-title {
  				width: 230px;
  				overflow: hidden;
  				white-space: nowrap;
  				text-overflow: ellipsis;
  			}
  			.glyphicon {
  				margin-left: 10px;
  				cursor: pointer;
  				opacity: 0.5;
  			}
  			.glyphicon:HOVER {
				opacity: 0.9;
			}
			.glyphicon-pencil, .glyphicon-remove {
				filter:alpha(opacity=40);
			}
			.glyphicon-pencil:HOVER, .glyphicon-remove:HOVER {
				filter:alpha(opacity=80);
			}
  		</style>
  	</head>
  	<body>
  		<div class="container-fluid">
  			<div class="control-container ">
  				<form action="${pageContext.request.contextPath }/console/recruitment/list.do" method="post" class="form-inline js-search-form">
					<div class="form-group">
	    				<label>类目</label>
	    				<select name="catId" class="form-control">
	    					<option value="">全部</option>
	    					<c:forEach items="${data.catList }" var="cat">
	    						<option value="${cat.id }">${cat.name }</option>
	    					</c:forEach>
	    				</select>
	  				</div>
	  				<div class="form-group">
	  					<label>是否显示</label>
	  					<select name="showIn" class="form-control">
	  						<option value="">全部</option>
	  						<option value="true">是</option>
	  						<option value="false">否</option>
	  					</select>
	  				</div>
	  				<button class="btn btn-info" type="submit">搜索</button>
	  				<a href="${pageContext.request.contextPath }/console/recruitment/add.do" class="btn btn-primary" id="js-add" style="float: right;">增加</a>
				</form>
  			</div>
			<c:if test="${null != data.recruitmentList }">
				<table class="table table-hover table-striped table-bordered">
					<thead>
						<tr>
							<th style="width: 120px;">名称</th>
							<th style="width: 60px;">显示</th>
							<th style="width: 200px;">修改日期</th>
							<th style="width: 80px;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${data.recruitmentList }" var="recruitmen">
							<tr>
								<td>
									<input type="hidden" name="id" value="${recruitmen.id }">
									<div class="td-title">${recruitmen.title }</div>
								</td>
								<td>
									<c:if test="${recruitmen.showIn}"><span style="color: green;">是</span></c:if>
									<c:if test="${!recruitmen.showIn}"><span style="color: red;">否</span></c:if>
								</td>
								<td>${recruitmen.modified }</td>
								<td>
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="pager-container">
					<%@ include file="/WEB-INF/console/pager.jsp"%>
				</div>
			</c:if>
			<c:if test="${null == data.recruitmentList }">
				还没有数据
			</c:if>
  		</div>
  		
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/utils.js"></script>
		<script type="text/javascript">
			$(function(){
				try{
					var _catId = "${data.catId}";
					var _showIn = "${data.showIn}";
					if(!!_catId){
						$(".js-search-form").find("select[name=catId]").val(_catId);
					}
					if(!!_showIn){
						$(".js-search-form").find("select[name=showIn]").val(_showIn);
					}
				}catch (e) {
					
				}
				
				$(".glyphicon-pencil").click(function(){
					var id = $(this).parents("tr").find("input[name=id]").val();
					if(null == id){
						return;
					}
					window.location.href = "${pageContext.request.contextPath }/console/recruitment/edit.do?id=" + id;
				});
				
				$(".glyphicon-remove").click(function(){
					var id = $(this).parents("tr").find("input[name=id]").val();
					if(null == id){
						return;
					}
					if(confirm("确定删除?")){
						$.ajax({
							type: "post",
							url: "${pageContext.request.contextPath }/console/recruitment/del.do",
							data: {
								id: id
							},
							dataType: "json",
							success: function(data){
								if(null != data && data.isSuccess){
									alert("删除成功");
									$(".js-search-form").submit();
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