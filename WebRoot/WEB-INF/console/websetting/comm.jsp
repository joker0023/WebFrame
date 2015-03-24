<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
	<head>
 		<meta charset="utf-8">
    	<title>站点设置</title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<style type="text/css">
  			.table {
  				width: 500px;
  			}
  			.table input, .uploadBtn, .saveBtn, .cancelBtn {
  				display: none;
  			}
  		</style>
  	</head>
  	<body>
  		<div class="container-fluid">
  			<form action="${pageContext.request.contextPath }/console/websetting/saveSetting.do" method="post" enctype="multipart/form-data">
  				<table class="table">
	  				<thead>
	  					<tr>
	  						<th colspan="2">站点基本信息</th>
	  					</tr>
	  				</thead>
	  				<tbody>
	  					<tr>
	  						<td>站点名字: </td>
	  						<td>
	  							<span>${null != data.webSetting ? data.webSetting.webName : ''}</span>
	  							<input type="text" name="webName" class="form-control" value="${null != data.webSetting ? data.webSetting.webName : ''}" maxlength="100">
	  						</td>
	  					</tr>
	  					<tr>
	  						<td>站点logo: </td>
	  						<td>
	  							<img class="js-logo-img" alt="" src="${pageContext.request.contextPath }/favicon.ico" title="ico格式的文件" oldSrc="${pageContext.request.contextPath }/favicon.ico">
	  							<button class="btn btn-primary uploadBtn js-upload" title="请上传ico格式的文件" type="button">上传文件</button>
	  							<input type="file" name="logo" style="display: none;">
	  						</td>
	  					</tr>
	  					<tr>
	  						<td>网站域名: </td>
	  						<td>
	  							<span>${null != data.webSetting ? data.webSetting.domain : ''}</span>
	  							<input type="text" name="domain" class="form-control" value="${null != data.webSetting ? data.webSetting.domain : ''}" maxlength="100">
	  						</td>
	  					</tr>
	  					<tr>
	  						<td>关键字: </td>
	  						<td>
	  							<span>${null != data.webSetting ? data.webSetting.keyWord : ''}</span>
	  							<input type="text" name="keyWord" class="form-control" value="${null != data.webSetting ? data.webSetting.keyWord : ''}" placeholder="用逗号隔开" maxlength="200">
	  						</td>
	  					</tr>
	  					<tr>
	  						<td>描述: </td>
	  						<td>
	  							<span>${null != data.webSetting ? data.webSetting.description : ''}</span>
	  							<input type="text"  name="description" class="form-control" value="${null != data.webSetting ? data.webSetting.description : ''}" maxlength="200">
	  						</td>
	  					</tr>
	  					<tr>
	  						<td>ICP备案: </td>
	  						<td>
	  							<span>${null != data.webSetting ? data.webSetting.icp : ''}</span>
	  							<input type="text" name="icp" class="form-control" value="${null != data.webSetting ? data.webSetting.icp : ''}" maxlength="50">
	  						</td>
	  					</tr>
	  				</tbody>
	  			</table>
	  			<button class="btn btn-primary editBtn js-edit" type="button">修改</button>
  				<button class="btn btn-primary saveBtn js-save" type="submit">保存</button>
  				<button class="btn btn-default cancelBtn js-cancel" type="button">取消</button>
  			</form>
  		</div>
  		
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/utils.js"></script>
		<script type="text/javascript">
			$(function(){
				var saveResult = "${data.saveResult}";
	  			if(null != saveResult && saveResult == "true"){
	  				alert("保存成功");
	  			}else if(null != saveResult && saveResult == "false"){
	  				alert("保存失败");
	  			}
	  			
				$(".js-upload").click(function(){
					$(this).next("input").click();
				});
				
				$(".js-edit").click(function(){
					$(".table td span").hide();
					$(".table td input[type=text]").show();
					$(".js-upload").show();
					$(".js-save").show();
					$(".js-cancel").show();
					$(".js-edit").hide();
				});
				
				$(".js-cancel").click(function(){
					$(".table td span").show();
					$(".table td input").hide();
					$(".js-upload").hide();
					$(".js-save").hide();
					$(".js-cancel").hide();
					$(".js-edit").show();
					$(".js-logo-img").attr("src", $(".js-logo-img").attr("oldSrc"));
				});
				
				$("input[name=logo]").change(function(){
					if(this.files){
			       		var file = this.files[0];
			       		if(/\.ico$/.test(file.name)){
			       			var url = FileUtil.getImgURL(file);
			       			$(this).parent().find("img").attr("src", url);
						}else{
							alert("请选择.ico格式文件");
						}
					}
				});
			});
		</script>
  	</body>
</html>