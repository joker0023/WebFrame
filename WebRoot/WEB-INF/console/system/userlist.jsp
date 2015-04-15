<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
 		<meta charset="utf-8">
    	<title>用户列表</title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
  		<style type="text/css">
  			.container-fluid {
	    		padding-top: 30px;
	    	}
	    	.control-container {
	    		
	    	}
	    	.pagination {
	    		float: right;
	    		margin: 0;
	    	}
	    	.new-container {
	    		padding: 10px 0;
	    		visibility: hidden;
	    	}
	    	.new-container table td {
	    		padding-right: 10px;
	    	}
	    	.new-container input {
	    		width: 150px;
	    	}
	    	.table td {
	    		
	    	}
	    	.table td input[type='text'] {
	    		display: none;
	    		width: 100px;
	    		padding-top: 3px;
	    		padding-bottom: 3px;
	    		height: 30px;
	    	}
	    	.td-control a {
	    		margin-bottom: 5px;
	    	}
  		</style>
  	</head>
  	<body>
  		<div class="container-fluid">
  			<div class="control-container">
  				<form action="${pageContext.request.contextPath }/console/system/userList.do" method="post" class="form-inline js-search-form">
  					<div class="form-group">
    					<input type="text" class="form-control" name="keyWord" placeholder="关键词" value="${data.keyWord }">
  					</div>
  					<button type="submit" class="btn btn-primary">搜索</button> 
					<a href="javascript:void(0);" class="btn btn-primary" id="js-add">增加</a>
  				</form>
				
				<div class="new-container js-new">
					<table>
						<tr>
							<td style="width: 120px;">
								<input type="text" class="form-control js-addAccount" placeholder="账号" maxlength="100">
							</td>
							<td style="width: 120px;">
								<input type="text" class="form-control js-addPwd" placeholder="密码" maxlength="100">
							</td>
							<td style="width: 140px;">
								<a href="javascript:void(0);" class="btn btn-info js-addSave">保存</a>
								<a href="javascript:void(0);" class="btn btn-default js-addCancel">取消</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<table class="table table-hover table-striped table-bordered">
				<thead>
					<tr>
						<th style="width: 120px;">账号</th>
						<th style="width: 120px;">创建时间</th>
						<th style="width: 120px;">最后登录时间</th>
						<th style="width: 120px;">最后登录IP</th>
						<th style="width: 120px;">状态</th>
						<th style="width: 50px;">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.data.userList}" var="user">
						<tr>
							<td>
								<input type="hidden" name="id" value="${user.id }">
								${user.account }
							</td>
							<td>${user.createTime }</td>
							<td>${user.lastLoginTime }</td>
							<td>${user.lastLoginIp }</td>
							<td>
								<c:if test="${user.state == 1}">
									<span style="color:green;">正常</span>
								</c:if>
								<c:if test="${user.state == 2}">
									<span style="color:red;">禁用</span>
								</c:if>
							</td>
							<td class="td-control">
								<a href="javascript:void(0);" class="btn btn-danger btn-xs js-delete">删除</a>
								<c:if test="${user.state == 1}">
									<a href="javascript:void(0);" class="btn btn-danger btn-xs js-disable">禁用</a>
								</c:if>
								<c:if test="${user.state == 2}">
									<a href="javascript:void(0);" class="btn btn-info btn-xs js-staton">启用</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6" style="background-color: #EEE;"></td>
					</tr>
				</tfoot>
			</table>
			<%@ include file="/WEB-INF/console/pager.jsp"%>
  		</div>
  		
  		
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/utils.js"></script>
		<script type="text/javascript">
			$(function(){
				//弹出新增框
	  			$("#js-add").click(function(){
	  				$(".js-new input").val("");
	  				$(".js-new").css("visibility","visible");
	  			});
	  			//新增取消
				$(".js-new .js-addCancel").click(function(){
					$(".js-new").css("visibility", "hidden");
	  			});
				//新增保存
	  			$(".js-new .js-addSave").click(function(){
	  				var $tr = $(this).parents("tr");
	  				var account = $tr.find(".js-addAccount").val();
	  				var pwd = $tr.find(".js-addPwd").val();
	  				
	  				if(!account || !pwd){
	  					alert("账号和密码不能为空");
	  					return;
	  				}
	  				
	  				var url = "${pageContext.request.contextPath }/console/system/userAdd.do";
	  				var data = {
	  						account: account,
	  						pwd: pwd
	  					};
	  				
	  				ajax(url, data, "添加");
	  			});
				
				//删除
				$(".js-delete").click(function(){
					var id = $(this).parents("tr").find("input[name=id]").val();
					var url = "${pageContext.request.contextPath }/console/system/userDel.do";
					ajax(url, {id: id}, "删除");
				});
				//禁用
				$(".js-disable").click(function(){
					var id = $(this).parents("tr").find("input[name=id]").val();
					var url = "${pageContext.request.contextPath }/console/system/userUpdate.do";
					ajax(url, {id: id,stat: "off"}, "修改");
				});
				//启用
				$(".js-staton").click(function(){
					var id = $(this).parents("tr").find("input[name=id]").val();
					var url = "${pageContext.request.contextPath }/console/system/userUpdate.do";
					ajax(url, {id: id,stat: "on"}, "修改");
				});
				
				function ajax(url, data, msg){
					$.ajax({
	  					type: "post",
	  					url: url,
	  					data: data,
	  					dataType: "json",
	  					success: function(data){
	  						alert(msg + "成功");
	  						$(".js-search-form input[name=keyWord]").val("");
	  						$(".js-search-form").submit();
	  						
	  					},
	  					error: function(data, status ,e){
	  						alert(e);
	  					}
	  				});
				}
			});
		</script>
  	</body>
</html>