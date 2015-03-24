<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/console/include/header.jsp"%>
  			
	 		<div class="row">
	 			<form action="${pageContext.request.contextPath }/console/system/updatePwd.do" method="post" class="form-horizontal js-change-form" style="width: 650px; margin-top: 20px;">
					<div class="form-group" style="height: 30px">
						<div class="col-sm-4"></div>
						<div class="errLabel col-sm-6" style="display: none;height: 30px;color: #a94442;line-height: 30px;">
							<label class="control-label">Input with error</label>
						</div>
					</div>
	 				<div class="form-group">
	 					<label class="col-sm-4 control-label">密码</label>
	 					<div class="col-sm-6">
      						<input type="password" class="form-control" name="old_pwd" placeholder="旧密码">
    					</div>
	 				</div>
	 				<div class="form-group">
	 					<label class="col-sm-4 control-label">新密码</label>
	 					<div class="col-sm-6">
      						<input type="password" class="form-control" name="new_pwd" placeholder="新密码">
    					</div>
	 				</div>
	 				<div class="form-group">
	 					<label class="col-sm-4 control-label">确认密码</label>
	 					<div class="col-sm-6">
      						<input type="password" class="form-control" name="confirm_pwd" placeholder="确认密码">
    					</div>
	 				</div>
	 				<div class="form-group">
	 					<div class="col-sm-4"></div>
	 					<div class="col-sm-6">
	 						<button type="button" class="btn btn-primary js-change">确定</button>
	 					</div>
	 				</div>
	 			</form>	
	 		</div>
	 		
	  	</div>
	  	
	  	<script type="text/javascript">
	  		$(function(){
	  			var errMsg = "${data.errMsg}";
	  			if(!!errMsg){
	  				if(errMsg == "0"){
	  					alert("修改成功,请重新登录");
	  					window.location.href = "${pageContext.request.contextPath }/console_check/logout.do";
	  					return;
	  				}
	  				$(".errLabel > label").text(errMsg);
	  				$(".errLabel").show();
	  			}
	  			
	  			$("input").click(function(){
	  				$(".errLabel").hide();
	  			});
	  			
	  			$(".js-change").click(function(){
	  				var old_pwd = $("input[name=old_pwd]").val();
	  				var new_pwd = $("input[name=new_pwd]").val();
	  				var confirm_pwd = $("input[name=confirm_pwd]").val();
	  				
	  				if(!old_pwd){
	  					$(".errLabel > label").text("请输入旧密码");
		  				$(".errLabel").show();
		  				return;
	  				}
	  				
	  				if(!new_pwd){
	  					$(".errLabel > label").text("请输入新密码");
		  				$(".errLabel").show();
		  				return;
	  				}
	  				
	  				if(new_pwd != confirm_pwd){
	  					$(".errLabel > label").text("两次密码不一致");
		  				$(".errLabel").show();
		  				return;
	  				}
	  				
	  				$(".js-change-form").submit();
	  			});
	  		});
	  	</script>
  	</body>
</html>
