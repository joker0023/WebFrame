<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
 		<meta charset="utf-8">
    	<title>轮播图设置</title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<style type="text/css">
  			.ui-state-highlight {
				background-color: whitesmoke;
				height: 200px;
				margin-bottom: 20px;
			}
			.uploadImg-form {
				margin-top: 10px;
			}
			.carousel-ul {
				list-style: none;
			}
			.carousel-ul li {
				display: block;
				width: 640px;
				margin-top: 10px;
				border: 1px solid #ccc;
				overflow: hidden;
			}
			.carousel-ul li img {
				height: 200;
			}
			.control {
				padding: 5px;
				display: none;
			}
			.control input, .control textarea {
				margin-bottom: 5px;
			}
  		</style>
  	</head>
  	<body>
  		<div class="container-fluid">
  			<div>
  				<form class="uploadImg-form js-uploadImg-form" action="${pageContext.request.contextPath }/console/webindex/addCarousel.do" method="post" enctype="multipart/form-data">
  					<input type="file" name="carouselImg" class="js-imgupload" style="display: none;">
  					<button class="btn btn-primary js-add" type="button">增加</button>
  					<button class="btn btn-primary js-save" type="button" title="保存展示顺序">保存</button>
  				</form>
  			</div>
  			<ul class="carousel-ul">
  				<c:forEach items="${data.carouselList}" var="carousel">
	  				<li>
	  					<button type="button" class="close js-close">
	  						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
	  					</button>
	  					<button type="button" class="close btn-xs js-edit">
	  						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;
	  					</button>
	  					<div><img src="${pageContext.request.contextPath}${carousel.pic}" alt=""></div>
	  					<div class="control">
	  						<input type="hidden" value="${carousel.id}" class="js-carouselId-field">
	  						<input type="text" name="url" class="form-control" value="${carousel.url}" oldVal="${carousel.url}" placeholder="跳转链接"  maxlength="100">
	  						<input type="text" name="title" class="form-control" value="${carousel.title}" oldVal="${carousel.title}" placeholder="标题" maxlength="100">
	  						<textarea name="content" class="form-control" placeholder="内容" oldVal="${carousel.content}"  maxlength="500">${carousel.content}</textarea>
	  						<button type="button" class="btn btn-primary btn-xs js-content-save">保存</button>
	  						<button type="button" class="btn btn-default btn-xs js-content-cancel">取消</button>
	  					</div>
	  				</li>
  				</c:forEach>
  			</ul>
  		</div>
	  		
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath }/assets/plugins/jquery-ui/jquery.ui.core.js"></script>
		<script src="${pageContext.request.contextPath }/assets/plugins/jquery-ui/jquery.ui.widget.js"></script>
		<script src="${pageContext.request.contextPath }/assets/plugins/jquery-ui/jquery.ui.mouse.js"></script>
		<script src="${pageContext.request.contextPath }/assets/plugins/jquery-ui/jquery.ui.sortable.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/utils.js" ></script>
		<script type="text/javascript">
			$(function(){
				var saveResult = "${data.saveResult}";
				if(saveResult == "true"){
					alert("保存成功!");
				}
				
				$(".carousel-ul").sortable({
					opacity: 0.6,
					placeholder: 'ui-state-highlight'
				});
				
				$(".js-add").click(function(){
					$(this).prev("input").click();
				});
				
				$(".js-imgupload").change(function(){
					if(this.files){
			       		var file = this.files[0];
			       		if(!/image/.test(file.type)){
			       			alert("请选择图片文件");
						}else{
							$(".js-uploadImg-form").submit();
						}
					}
				});
				
				$(".js-save").click(function(){
					var ids = "";
					$(".js-carouselId-field").each(function(){
						ids += $(this).val() + ","
					});
					if(ids == ""){
						return;
					}
					
					documentUtil.showLoading();
					window.location.href = "${pageContext.request.contextPath }/console/webindex/saveSort.do?ids=" + ids;
				});
				
				$(".js-close").click(function(){
					if(confirm("确认删除?")){
						documentUtil.showLoading();
						var id = $(this).parents("li").find(".control > .js-carouselId-field").val();
						window.location.href = "${pageContext.request.contextPath }/console/webindex/delCarousel.do?id=" + id;
					}
				});
				
				$(".js-edit").click(function(){
					var $controlDiv = $(this).parents("li").find(".control");
					//$controlDiv.slideToggle();
					$controlDiv.toggle();
					$controlDiv.find("input[name=url]").text($controlDiv.find("input[name=url]").attr("oldVal"));
					$controlDiv.find("input[name=title]").text($controlDiv.find("input[name=title]").attr("oldVal"));
					$controlDiv.find("textarea[name=content]").text($controlDiv.find("textarea[name=content]").attr("oldVal"));
				});
				
				$(".js-content-cancel").click(function(){
					//$(this).parents("li").find(".control").slideUp();
					$(this).parents("li").find(".control").hide();
				});
				
				$(".js-content-save").click(function(){
					var $this = $(this);
					var $parent = $this.parent();
					var id = $parent.find(".js-carouselId-field").val();
					var url = $parent.find("input[name=url]").val();
					var title = $parent.find("input[name=title]").val();
					var content = $parent.find("textarea[name=content]").val();
					
					documentUtil.showLoading();
					
					$.ajax({
						type: "post",
						url: "${pageContext.request.contextPath }/console/webindex/updateCarousel.do",
						data: {
							id: id,
							url: url,
							title: title,
							content: content
						},
						dataType: "json",
						success: function(data){
							documentUtil.hideLoading();
							if(null != data && data.isSuccess){
								alert("修改成功");
								$this.parents("li").find(".control").hide();
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