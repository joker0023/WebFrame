<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
	<head>
 		<meta charset="utf-8">
    	<title>联系信息设置</title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<style type="text/css">
  			.js-contact-form {
  				width: 600px;
  			}
  		</style>
  	</head>
  	<body>
  		<div class="container-fluid">
  			<h2>联系信息设置</h2>
  			<form action="#" method="post" class="form-horizontal js-contact-form" onsubmit="return false;">
  				<div class="form-group">
  					<label class="col-sm-3 control-label">公司: </label>
  					<div class="col-sm-9">
  						<input type="text" name="compary" class="form-control js-compary" value="${data.contact.compary }" placeholder="公司名字" maxlength="100">
  					</div>
  				</div>
  				<div class="form-group">
  					<label class="col-sm-3 control-label">详细地址: </label>
  					<div class="col-sm-9">
  						<input type="text" name="address" class="form-control js-address" value="${data.contact.address }" placeholder="详细地址" maxlength="200">
  					</div>
  				</div>
  				<div class="form-group">
  					<label class="col-sm-3 control-label">联系电话: </label>
  					<div class="col-sm-9">
  						<input type="text" name="phone" class="form-control js-phone" value="${data.contact.phone }" placeholder="联系电话,逗号分隔" maxlength="100">
  					</div>
  				</div>
  				<div class="form-group">
  					<label class="col-sm-3 control-label">其他信息: </label>
  					<div class="col-sm-9">
  						<textarea class="form-control js-other" name="other" placeholder="其他一些信息" maxlength="500">${data.contact.other }</textarea>
  					</div>
  				</div>
  				<div class="form-group">
  					<div class="col-sm-3"></div>
  					<div class="col-sm-9">
  						<button type="button" class="btn btn-primary js-save">保存</button>
  					</div>
  				</div>
  			</form>
  		</div>
  		
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/utils.js"></script>
		<script type="text/javascript">
			$(function(){
				$(".js-save").click(function(){
					var url = "${pageContext.request.contextPath }/console/contact/saveContact.do";
					var data = $(".js-contact-form").serialize();
					
					if(null != data && "" != data){
						$.ajax({
							type: "post",
							url: url,
							data: data,
							dataType: "json",
							success: function(msg){
								if(null != msg && msg.isSuccess){
									alert("保存成功!");
									window.location.reload();
								}else{
									console.log(msg);
								}
							},
							error: function(msg, status, e){
								alert(e);
							}
						});
					}
				});
			});
		</script>
  	</body>
</html>