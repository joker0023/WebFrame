<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/product.css">
   	<div class="main-content">
   		<div class="container marketing">
   			<div class="row">
   				<div class="col-md-4">
   					<img class="img-circle" src="${pageContext.request.contextPath }/assets/img/marketing1.png">
   					<h2>简洁</h2>
   					<p>简洁的页面风格</p>
   				</div>
   				<div class="col-md-4">
   					<img class="img-circle" src="${pageContext.request.contextPath }/assets/img/marketing2.png">
   					<h2>后台</h2>
   					<p>支持后台式的编辑</p>
   				</div>
   				<div class="col-md-4">
   					<img class="img-circle" src="${pageContext.request.contextPath }/assets/img/marketing3.png">
   					<h2>定制</h2>
   					<p>可自定义的外观与功能</p>
   				</div>
   			</div>
   			<hr class="featurette-divider">
   			<div class="row pro-content">
   				<div class="col-md-7">
   					<h2>控制台</h2>
   					<p>控制台式的页面布局设计</p>
   				</div>
   				<div class="col-md-5">
   					<a href="${pageContext.request.contextPath }/web/webtpl/tpl.jsp" target="_blank">
   						<img src="${pageContext.request.contextPath }/assets/img/pro01.jpg">
   					</a>
   				</div>
   			</div>
   			<hr class="featurette-divider">
   			<div class="row pro-content">
   				<div class="col-md-7 col-md-push-5">
   					<h2>Bootstrap</h2>
   					<p>Bootstrap风格的设计</p>
   				</div>
   				<div class="col-md-5 col-md-pull-7">
   					<a href="${pageContext.request.contextPath }/web/webtpl/tpl3.jsp" target="_blank">
   						<img src="${pageContext.request.contextPath }/assets/img/pro02.jpg">
   					</a>
   				</div>
   			</div>
   			<hr class="featurette-divider">
   		</div>
   	</div>
    	
<%@ include file="/include/footer.jsp" %>
<script type="text/javascript">
	$(function(){
		
	});
</script>
