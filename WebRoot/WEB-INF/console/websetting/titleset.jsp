<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
 		<meta charset="utf-8">
    	<title>标题设置</title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<style type="text/css">
  			form {
  				width: 400px;
  				margin-top: 50px;
  			}
  		</style>
  	</head>
  	<body>
  		<!-- 暂时废弃吧 -->
  		<div class="container-fluid">
  			<form action="${pageContext.request.contextPath }/console/websetting/saveTitle.do" method="post" class="form-horizontal" onsubmit="return false;">
  				<div class="form-group">
  					<label for="inputEmail3" class="col-sm-4 control-label">页面: </label>
  					<div class="col-sm-8">
	  					<select class="form-control js-pageId">
		  					<option value="index">首页</option>
		  					<option value="about">关于我们</option>
		  					<option value="product">产品介绍</option>
		  					<option value="recruitment">诚聘英才</option>
		  					<option value="contact">联系我们</option>
		  				</select>
		  			</div>
  				</div>
  				<div class="form-group">
  					<label class="col-sm-4 control-label">标题: </label>
  					<div class="col-sm-8">
  						<input type="text" class="form-control js-title" value="${data.indexPage.title }" placeholder="标题"  maxlength="200">
  					</div>
  				</div>
  				<div class="form-group">
  					<label class="col-sm-4 control-label">关键字: </label>
  					<div class="col-sm-8">
  						<input type="text" class="form-control js-keyword" value="${data.indexPage.keyWord }" placeholder="关键字,逗号分隔"  maxlength="200">
  					</div>
  				</div>
  				<div class="form-group">
  					<label class="col-sm-4 control-label">描述: </label>
  					<div class="col-sm-8">
  						<input type="text" class="form-control js-description" value="${data.indexPage.description }" placeholder="描述"  maxlength="500">
  					</div>
  				</div>
  				<div class="form-group">
  					<div class="col-sm-4"></div>
  					<div class="col-sm-8">
  						<button type="button" class="btn btn-primary js-save">保存</button>
  					</div>
  				</div>
  			</form>
  		</div>
  		
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/utils.js" ></script>
		<script type="text/javascript">
			$(function(){
				$(".js-pageId").change(function(){
					var pageId = $(this).val();
					var url = "${pageContext.request.contextPath }/console/websetting/getPageSetting.do";
					
					documentUtil.showLoading();
					
					$.ajax({
						type: "post",
						url: url,
						data: {
							pageId: pageId
						},
						dataType: "json",
						success: function(data){
							documentUtil.hideLoading();
							if(null != data && data.webPageSetting){
								var webPageSetting = data.webPageSetting;
								$(".js-title").val(webPageSetting.title);
								$(".js-keyWord").val(webPageSetting.keyWord);
								$(".js-description").val(webPageSetting.description);
							}else{
								console.log(data);
							}
						},
						error: function(data, status, e){
							documentUtil.hideLoading();
							alert(e);
						}
					});
				});
				
				$(".js-save").click(function(){
					var url = "${pageContext.request.contextPath }/console/websetting/saveTitle.do";
					var pageId = $(".js-pageId").val();
					var title = $(".js-title").val();
					var keyWord = $(".js-keyWord").val();
					var description = $(".js-description").val();
					
					documentUtil.showLoading();
					
					$.ajax({
						type: "post",
						url: url,
						data: {
							pageId: pageId,
							title: title,
							keyWord: keyWord,
							description: description
						},
						dataType: "json",
						success: function(data){
							documentUtil.hideLoading();
							if(null != data && data.isSuccess){
								alert("设置成功");
								
							}else{
								console.log(data);
							}
						},
						error: function(data, status, e){
							documentUtil.hideLoading();
							alert(e);
						}
					});
				});
			});
		</script>
  	</body>
</html>