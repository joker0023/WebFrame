<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
 		<meta charset="utf-8">
    	<title>友情链接</title>
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
	    	.newLink {
	    		padding: 10px 0;
	    		visibility: hidden;
	    	}
	    	.newLink table {
	    		
	    	}
	    	.newLink table td {
	    		padding-right: 10px;
	    	}
	    	.field-addName {
	    		width: 150px;
	    	}
	    	.field-addUrl {
	    		width: 250px;
	    	}
	    	.table .cancel, .table .save {
	    	}
	    	.table td {
	    		height: 48px;
	    	}
	    	.table td input[type='text'] {
	    		display: none;
	    		width: 100px;
	    		padding-top: 3px;
	    		padding-bottom: 3px;
	    		height: 30px;
	    	}
  		</style>
  	</head>
  	<body>
  		<div class="container-fluid">
  			<div class="control-container">
				<a href="javascript:void(0);" class="btn btn-primary" id="js-addLink">增加</a>
				<a href="javascript:void(0);" class="btn btn-primary" id="js-batchDel">批量删除</a>
				<div class="newLink js-newLink">
					<table>
						<tr>
							<td style="width: 120px;">
								<input type="text" class="form-control field-addName js-addName" placeholder="名称" maxlength="100">
							</td>
							<td style="width: 120px;">
								<input type="text" class="form-control field-addUrl js-addUrl" placeholder="url" maxlength="100">
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
						<th style="width: 40px;"><input type="checkbox" class="select-all"></th>
						<th style="width: 40px;">Id</th>
						<th style="width: 120px;">名称</th>
						<th style="width: 120px;">url</th>
						<th style="width: 120px;">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.data.linkList}" var="link">
						<tr>
							<td><input type="checkbox" class="linkId-checkbox" value="${link.id}"></td>
							<td>${link.id}</td>
							<td class="editTd" >
								<span>${link.name}</span>
								<input type="text" class="form-control name" value="${link.name}"  maxlength="100">
							</td>
							<td class="editTd">
								<span>${link.url}</span>
								<input type="text" class="form-control url" value="${link.url}"  maxlength="100">
							</td>
							<td>
								<a href="javascript:void(0);" class="btn btn-info btn-xs js-update">修改</a>
								<a href="javascript:void(0);" class="btn btn-info btn-xs save js-save">保存</a>
								<a href="javascript:void(0);" class="btn btn-default btn-xs cancel js-cancel">取消</a>
								<a href="javascript:void(0);" class="btn btn-danger btn-xs js-delete">删除</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" style="background-color: #EEE;"></td>
					</tr>
				</tfoot>
			</table>
			<%@ include file="/WEB-INF/console/pager.jsp"%>
  		</div>
  		
  		
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/utils.js"></script>
		<script type="text/javascript">
			$(function(){
				$(".js-save").hide();
  				$(".js-cancel").hide();
  				
				$(".select-all").click(function(){
					if($(this).is(":checked")) {
						$(this).parents("table").find("input:checkbox.linkId-checkbox").each(function(){
			  				this.checked = true;
			  			});
					} else {
						$(this).parents("table").find("input:checkbox.linkId-checkbox").each(function(){
			  				this.checked = false;
			  			});
					}
				});
				
				//弹出新增框
	  			$("#js-addLink").click(function(){
	  				$(".js-newLink input").val("");
	  				$(".js-newLink").css("visibility","visible");
	  			});
				
	  			//新增保存
	  			$(".js-newLink .js-addSave").click(function(){
	  				var $tr = $(this).parents("tr");
	  				var name = $tr.find(".js-addName").val();
	  				var url = $tr.find(".js-addUrl").val();
	  				
	  				if(null == url || url == "" || null == name || name == ""){
	  					alert("名称和url不能为空");
	  					return;
	  				}
	  				
	  				$.ajax({
	  					type: "post",
	  					url: "${pageContext.request.contextPath }/console/websetting/linkAdd.do",
	  					data: {
	  						name: name,
	  						url: url
	  					},
	  					dataType: "json",
	  					success: function(data){
	  						showTipAndReload(data, "保存");
	  					},
	  					error: function(data, status ,e){
	  						alert(e);
	  					}
	  				});
	  			});
	  			
	  			//新增取消
				$(".js-newLink .js-addCancel").click(function(){
					$(".js-newLink").css("visibility", "hidden");
	  			});
	  			
				//修改按钮
	  			$(".js-update").click(function(){
	  				var $this = $(this);
	  				$this.parent().find(".js-save").show();
	  				$this.parent().find(".js-cancel").show();
	  				$this.parent().find(".js-update").hide();
	  				$this.parent().find(".js-delete").hide();
	  				
	  				$this.parents("tr").find(".editTd > input[type='text']").each(function(){
	  					$(this).val($(this).prev("span").text());
	  					$(this).show();
	  					$(this).prev("span").hide();
	  				});
	  			});
				
	  			//修改保存
	  			$(".js-save").click(function(){
	  				var $tr = $(this).parents("tr");
	  				var id = $tr.find("input[type='checkbox']").val();
	  				var name = $tr.find(".name").val();
	  				var url = $tr.find(".url").val();
	  				
	  				if(null == url || url == "" || null == name || name == ""){
	  					alert("名称和url不能为空");
	  					return;
	  				}
	  				
	  				$.ajax({
	  					type: "post",
	  					url: "${pageContext.request.contextPath }/console/websetting/linkUpdate.do",
	  					data: {
	  						id: id,
	  						name: name,
	  						url: url
	  					},
	  					dataType: "json",
	  					success: function(data){
	  						showTipAndReload(data,"修改");
	  					},
	  					error: function(data, status ,e){
	  						alert(e);
	  					}
	  				});
	  			});
	  			
	  			//修改取消
	  			$(".js-cancel").click(function(){
	  				var $this = $(this);
	  				$this.parent().find(".js-update").show();
	  				$this.parent().find(".js-delete").show();
	  				$this.parent().find(".js-save").hide();
	  				$this.parent().find(".js-cancel").hide();
	  				
	  				$this.parents("tr").find(".editTd > input[type='text']").hide();
	  				$this.parents("tr").find(".editTd > span").show();
	  			});
	  			
	  			//删除按钮
	  			$(".js-delete").click(function(){
	  				if(confirm("确认删除?")){
	  					var id = $(this).parents("tr").find("input[type='checkbox']").val();
	  	  				
	  	  				$.ajax({
	  	  					type: "post",
	  	  					url: "${pageContext.request.contextPath }/console/websetting/linkDel.do",
	  	  					data: {
	  	  						id: id
	  	  					},
	  	  					dataType: "json",
	  	  					success: function(data){
	  	  						showTipAndReload(data,"删除");
	  	  					},
	  	  					error: function(data, status ,e){
	  	  						alert(e);
	  	  					}
	  	  				});
	  				}
	  			});
	  			
	  			$("#js-batchDel").click(function(){
	  				if(confirm("确定删除选中项?")){
	  					var ids = "";
		  				$(".linkId-checkbox:checked").each(function(){
		  					ids += $(this).val();
		  					ids += ",";
		  				});
		  				
		  				if(ids == ""){
		  					alert("至少勾选一个选项");
		  					return;
		  				}
		  				
		  				$.ajax({
	  	  					type: "post",
	  	  					url: "${pageContext.request.contextPath }/console/websetting/batchDel.do",
	  	  					data: {
	  	  						ids: ids
	  	  					},
	  	  					dataType: "json",
	  	  					success: function(data){
	  	  						showTipAndReload(data,"批量删除");
	  	  					},
	  	  					error: function(data, status ,e){
	  	  						alert(e);
	  	  					}
	  	  				});
	  				}
	  			});
			});
		</script>
  	</body>
</html>