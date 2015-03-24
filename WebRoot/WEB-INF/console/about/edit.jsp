<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		  		<li><a href="${pageContext.request.contextPath }/console/about/aboutSetting.do">总览</a></li>
		  		<li class="active">${data.breadcrumb }</li>
			</ol>
  			<form action="#" class="form-horizontal" onsubmit="return false;">
  				<input type="hidden" name="aboutId" value="${null == data.about ? '' : data.about.id}">
  				<div class="form-group">
    				<label class="col-sm-2 control-label">标题</label>
   					<div class="col-sm-4">
     					<input type="text" name="tabName" class="form-control" placeholder="左侧标题" value="${null == data.about ? '' : data.about.tabName}">
   					</div>
  				</div>
  				<div class="form-group">
    				<label class="col-sm-2 control-label">排序</label>
   					<div class="col-sm-4">
     					<input type="text" name="sort" class="form-control" placeholder="填数字" value="${null == data.about ? '' : data.about.sort}">
   					</div>
  				</div>
  				<div class="form-group">
    				<label class="col-sm-2 control-label">是否展示</label>
   					<div class="col-sm-4">
     					<select class="form-control" name="showin">
     						<option value="1" <c:if test="${null != data.about && data.about.showIn}">selected="selected"</c:if>>是</option>
     						<option value="0" <c:if test="${null != data.about && !data.about.showIn}">selected="selected"</c:if>>否</option>
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
  						<textarea class="form-control" id="aboutHtml" name="aboutHtml" style="width:100%;height:600px;">${data.about.html }</textarea>
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
	            	editor = K.create('#aboutHtml', options);
	        	});
				
				$(".js-back").click(function(){
					window.history.back();
				});
				
				$(".js-save").click(function(){
					var id = $("input[name=aboutId]").val();
					var tabName = $("input[name=tabName]").val();
					var sort = $("input[name=sort]").val();
					var showin = $("select[name=showin]").val();
					var html = editor.html();
					
					if(null == tabName || "" == tabName){
						alert("请输入标题");
						return;
					}
					
					$.ajax({
						type: "post",
						url: "${pageContext.request.contextPath }/console/about/saveAbout.do",
						data: {
							id: id,
							tabName: tabName,
							sort: sort,
							showin: showin,
							html: html
						},
						dataType: "json",
						success: function(data){
							if(null != data && data.isSuccess){
								alert("保存成功");
								window.location.href = "${pageContext.request.contextPath }/console/about/aboutSetting.do";
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