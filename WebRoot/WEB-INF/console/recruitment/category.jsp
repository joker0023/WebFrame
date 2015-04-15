<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
 		<meta charset="utf-8">
    	<title>招聘类目</title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
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
	    	.newCat {
	    		padding: 10px 0;
	    		visibility: hidden;
	    	}
	    	.newCat table td {
	    		padding-right: 10px;
	    	}
	    	.field-addName {
	    		width: 150px;
	    	}
	    	.table {
	    		width: 650px;
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
	    	.table td select {
	    		display: none;
	    	}
  		</style>
  	</head>
  	<body>
  		<div class="container-fluid">
  			<div class="control-container">
				<a href="javascript:void(0);" class="btn btn-primary" id="js-add">增加</a>
				<div class="newCat js-newCat">
					<table>
						<tr>
							<td style="width: 120px;">
								<input type="text" class="form-control field-addName js-addName" placeholder="名称" maxlength="100">
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
						<th style="width: 40px;">Id</th>
						<th style="width: 120px;">名称</th>
						<th style="width: 120px;">排序</th>
						<th style="width: 120px;">显示</th>
						<th style="width: 120px;">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.data.list}" var="cat">
						<tr>
							<td><input type="hidden" name="catId" class="linkId-checkbox" value="${cat.id}">${cat.id}</td>
							<td class="editTd" >
								<span>${cat.name}</span>
								<input type="text" class="form-control" name="name" value="${cat.name}"  maxlength="100">
							</td>
							<td class="editTd">
								<span>${cat.sort}</span>
								<input type="text" class="form-control" name="sort" value="${cat.sort}"  maxlength="100" placeholder="填数字">
							</td>
							<td class="editTd">
								<span showInVal="${cat.showIn ? '1' : '0' }">${cat.showIn ? "是" : "否"}</span>
								<select class="form-control" name="showIn">
		     						<option value="1">是</option>
		     						<option value="0">否</option>
		     					</select>
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
  		</div>
  		
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/utils.js"></script>
		<script type="text/javascript">
			$(function(){
				$(".js-save").hide();
  				$(".js-cancel").hide();
  				
				//弹出新增框
	  			$("#js-add").click(function(){
	  				$(".js-newCat input").val("");
	  				$(".js-newCat").css("visibility","visible");
	  			});
				
	  			//新增保存
	  			$(".js-newCat .js-addSave").click(function(){
	  				var $tr = $(this).parents("tr");
	  				var name = $tr.find(".js-addName").val();
	  				
	  				if(null == name || name == ""){
	  					alert("名称不能为空");
	  					return;
	  				}
	  				
	  				$.ajax({
	  					type: "post",
	  					url: "${pageContext.request.contextPath }/console/recruitment/saveCat.do",
	  					data: {
	  						name: name
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
				$(".js-newCat .js-addCancel").click(function(){
					$(".js-newCat").css("visibility", "hidden");
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
	  				
	  				$this.parents("tr").find(".editTd > select").each(function(){
	  					var val = $(this).prev("span").attr("showInVal");
	  					$(this).val(val);
	  					$(this).show();
	  					$(this).prev("span").hide();
	  				});
	  			});
				
	  			//修改保存
	  			$(".js-save").click(function(){
	  				var $tr = $(this).parents("tr");
	  				var id = $tr.find("input[name='catId']").val();
	  				var name = $tr.find("input[name='name']").val();
	  				var sort = $tr.find("input[name='sort']").val();
	  				var showIn = $tr.find("select[name='showIn']").val();
	  				
	  				if(null == name || name == ""){
	  					alert("名称不能为空");
	  					return;
	  				}
	  				if(isNaN(sort) || "" == sort){
	  					return;
	  				}
	  				
	  				$.ajax({
	  					type: "post",
	  					url: "${pageContext.request.contextPath }/console/recruitment/saveCat.do",
	  					data: {
	  						id: id,
	  						name: name,
	  						sort: sort,
	  						showIn: showIn
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
	  				$this.parents("tr").find(".editTd > select").hide();
	  				$this.parents("tr").find(".editTd > span").show();
	  			});
	  			
	  			//删除按钮
	  			$(".js-delete").click(function(){
	  				if(confirm("确认删除?")){
	  					var id = $(this).parents("tr").find("input[name='catId']").val();
	  	  				
	  	  				$.ajax({
	  	  					type: "post",
	  	  					url: "${pageContext.request.contextPath }/console/recruitment/delCat.do",
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
			});
		</script>
  	</body>
</html>