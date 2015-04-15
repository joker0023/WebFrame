<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/dynamic.css">
	<div class="main-content">
		<div class="col-lg-9 col-md-10">
			<div class="detail-container">
				<ol class="breadcrumb">
			  		<li><a href="${pageContext.request.contextPath }/">首页</a></li>
			  		<li><a href="${pageContext.request.contextPath }/dynamic/list.do">动态</a></li>
			  		<li class="active">详细</li>
				</ol>
				<div class="detail-title">
					<h3 class="${data.dynamic.type==1 ? 'note' : '' }">${data.dynamic.title}</h3>
					<span>${data.dynamic.modified }</span>
				</div>
				<div class="detail-content">
					${data.dynamic.content }
				</div>
			</div>
		</div>
		
		<div class="col-lg-3 col-md-2">
   			<div class="advertising-container">
   				
   			</div>
   		</div>
	</div>
<%@ include file="/include/footer.jsp" %>
<script type="text/javascript">
	$(function(){
		
	});
</script>