<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
 		<meta charset="utf-8">
    	<title>添加/修改 </title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<style type="text/css">
  			form {
  				margin-top: 20px;
  			}
  			textarea {
				display: block;
			}
			.my-btn {
				width: 100px;
			}
  		</style>
  		<script type="text/javascript">
  			window.contextPath = "${pageContext.request.contextPath }";
  		</script>
  	</head>
  	<body>
  		<div class="container-fluid">
  			<ol class="breadcrumb">
		  		<li><a href="${pageContext.request.contextPath }/console/other/dynamic/list.do">列表</a></li>
		  		<li class="active">${data.breadcrumb }</li>
			</ol>
  			<form action="#" class="form-horizontal" onsubmit="return false;">
  				<input type="hidden" name="id" value="${null == data.dynamic ? '' : data.dynamic.id}">
  				<div class="form-group">
    				<label class="col-sm-2 control-label">标题</label>
   					<div class="col-sm-4">
     					<input type="text" name="title" class="form-control" placeholder="标题" value="${null == data.dynamic ? '' : data.dynamic.title}">
   					</div>
  				</div>
  				<div class="form-group">
    				<label class="col-sm-2 control-label">类型</label>
   					<div class="col-sm-4">
     					<select class="form-control" name="type">
     						<option value="1" <c:if test="${null != data.dynamic && data.dynamic.type == 1}">selected="selected"</c:if>>公告</option>
     						<option value="2" <c:if test="${null != data.dynamic && data.dynamic.type == 2}">selected="selected"</c:if>>文章</option>
     					</select>
   					</div>
  				</div>
  				<div class="form-group">
  					<div class="col-sm-1"></div>
  					<div class="col-sm-10">
  						<button type="button" class="btn btn-primary my-btn js-save">保存</button>
  						<button type="button"  class="btn btn-default my-btn js-back">返回</button>
  					</div>
  				</div>
  				<div class="form-group">
  					<div class="col-sm-1"></div>
  					<div class="col-sm-10">
  						<textarea class="form-control" id="content" name="content" style="width:100%;height:600px;">${data.dynamic.content }</textarea>
  					</div>
  					<div class="col-sm-1"></div>
  				</div>
  			</form>
  		</div>
  		
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/utils.js"></script>
		<script charset="utf-8" src="${pageContext.request.contextPath }/assets/plugins/kindeditor-4.1.10/kindeditor.js"></script>
		<script charset="utf-8" src="${pageContext.request.contextPath }/assets/plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>
		<script type="text/javascript">
			$(function(){
				var editor;
				KindEditor.ready(function(K) {
					var options = dataUtil.kindEditorOption;
	            	editor = K.create('#content', options);
	        	});
				
				$(".js-back").click(function(){
					window.history.back(-1);
				});
				
				$(".js-save").click(function(){
					var id = $("input[name=id]").val();
					var title = $("input[name=title]").val();
					var type = $("select[name=type]").val();
					var content = editor.html();
					
					if(null == title || "" == title){
						alert("请输入标题");
						return;
					}
					
					if(title.length > 100){
						alert("标题太长了");
						return;
					}
					
					$.ajax({
						type: "post",
						url: "${pageContext.request.contextPath }/console/other/dynamic/save.do",
						data: {
							id: id,
							title: title,
							type: type,
							content: content
						},
						dataType: "json",
						success: function(data){
							if(null != data && data.isSuccess){
								alert("保存成功");
								window.location.href = "${pageContext.request.contextPath }/console/other/dynamic/list.do";
							}else{
								console.log(data);
							}
						},
						error: function(data, status, e){
							alert(e);
						}
					});
				});
			});
		</script>
  	</body>
</html>