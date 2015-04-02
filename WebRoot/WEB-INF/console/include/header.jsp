<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
 	<head>
 		<meta charset="utf-8">
    	<title>Console</title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/console/console.css">
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script type="text/javascript">
			$(function(){
				$(".left-menu ul > li > a").click(function(){
					var $this = $(this);
					$this.parent().parent().find("li").removeClass("active");
					$this.parent().addClass("active");
	  				
					$this.parent().siblings().find(".sub-menu").slideUp();
	  				if($this.next(".sub-menu").length > 0){
	  					$this.next(".sub-menu").slideToggle();
	  				}
	  			});
				
				//回到顶部
				$("#goTop").hide();
		        $("#goTop").click(function(){ //当点击标签的时候,使用animate在200毫秒的时间内,滚到顶部
		        	$("#goTop").animate({bottom:"10px"},150,function(){
		        		$("#goTop").animate({bottom:"40px"},150);
		        	});
		        	$("#mainIframe").contents().find("html,body").animate({scrollTop:"0px"},400);
		        });
			});
			
			function loadComplete() {
				$(window.frames["mainIframe"]).scroll(function(){
					var scrollt = this.document.documentElement.scrollTop + this.document.body.scrollTop;
					if( scrollt > 200 ){  //判断滚动后高度超过200px,就显示  
		       			$("#goTop").css("display","block");
		            }else{      
		        		$("#goTop").css("display","none");
		            }
				});
				
				var clientHeight = document.documentElement.clientHeight;
		    	
		    	//初始化左侧菜单栏的高度
		    	$(".left-menu").height(clientHeight - 132);
		    	
		    	//初始化iframe的高度
		    	$("#mainIframe").height(clientHeight - 132 - 6);
		    	
				
		    	//初始化iframe的宽度
				var clientWidth = document.documentElement.clientWidth;
				$("#mainIframe").width(clientWidth - 180);
			}
		</script>
  	</head>
  
  	<body>
  		<!-- GOTOP START -->
		<div id="goTop"><img src="${pageContext.request.contextPath }/assets/img/gotop.png"></div>
		<!-- GOTOP END -->
		
  		<div id="container-fluid">
  			<div class="header">
    			<div class="header_top">
					<div class="logo">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath }/assets/img/console_logo.png" />
							<span>后台管理系统</span>
						</a>
					</div>
					<div class="collection">
						<div class="collapse navbar-collapse">
	  						<ul class="nav navbar-nav navbar-right">
	  							<li class="dropdown">
	  								<a class="dropdown-toggle" aria-expanded="false" role="button" data-toggle="dropdown" href="javascript:void(0);">
										<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu" role="menu">
										<li>
			  								<a href="${pageContext.request.contextPath}" target="_blank">前台</a>
			  							</li>
			  							<li>
			  								<a href="${pageContext.request.contextPath}/console/system/changePwd.do">修改密码</a>
			  							</li>
										<li class="divider"></li>
										<li>
											<a href="${pageContext.request.contextPath }/console_check/logout.do">退出</a>
										</li>
									</ul>
	  							</li>
	  						</ul>
	  					</div>
					</div>
				</div>
				
				<div class="nav-top"></div>
				<ul class="nav my-nav js-nav">
					<li class="first ${data.menu == 'websetting' ? 'active' : ''}">
						<a href="${pageContext.request.contextPath }/console/websetting/webSetting.do">全局设置</a>
					</li>
					<li class="${data.menu == 'webindex' ? 'active' : ''}">
						<a href="${pageContext.request.contextPath }/console/webindex/webIndex.do">首页设置</a>
					</li>
					<li class="${data.menu == 'about' ? 'active' : ''}">
						<a href="${pageContext.request.contextPath }/console/about/about.do">关于我们</a>
					</li>
					<li class="${data.menu == 'product' ? 'active' : ''}">
						<a href="${pageContext.request.contextPath }/console/product/product.do">产品介绍</a>
					</li>
					<li class="${data.menu == 'recruitment' ? 'active' : ''}">
						<a href="${pageContext.request.contextPath }/console/recruitment/recruitment.do">诚聘英才</a>
					</li>
					<li class="${data.menu == 'contact' ? 'active' : ''}">
						<a href="${pageContext.request.contextPath }/console/contact/contact.do">联系我们</a>
					</li>
					<li class="${data.menu == 'other' ? 'active' : ''} ${sessionScope.console_role.namespace == '/' ? '' : 'last' }">
						<a href="${pageContext.request.contextPath }/console/other/other.do">其他</a>
					</li>
					<c:if test="${sessionScope.console_role.namespace == '/' }">
						<li class="last ${data.menu == 'system' ? 'active' : ''}">
							<a href="${pageContext.request.contextPath }/console/system/system.do">系统</a>
						</li>
					</c:if>
				</ul>
				<div class="nav-bottom"></div>
    		</div>
			<div class="clear"></div>