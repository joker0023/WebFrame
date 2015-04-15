<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/dynamic.css">
   	<div class="main-content">
 		<div class="col-lg-9 col-md-10">
 			<div class="list-container">
 				<ol class="breadcrumb">
			  		<li><a href="${pageContext.request.contextPath }/">首页</a></li>
			  		<li class="active">动态</li>
				</ol>
				<div class="search-form-container">
					<form class="form-inline" onsubmit="return false;">
						<div class="form-group">
							<input type="text" class="form-control">
						</div>
						<button class="btn btn-primary">搜索</button>
					</form>
				</div>
				<ul class="list-unstyled dynamic-list">
					<c:forEach items="${data.list }" var="dynamic" varStatus="status">
						<li>
							<a href="${pageContext.request.contextPath }/dynamic/detail.do?id=${dynamic.id }" target="_blank" class="article ${dynamic.type==1 ? 'note' : '' }">
								${dynamic.title }
							</a>
							<span class="time"><fmt:formatDate value="${dynamic.modified }" pattern="yyyy-MM-dd"/></span>
						</li>
					</c:forEach>
				</ul>
 				<%@ include file="/WEB-INF/console/pager.jsp" %>
 				<div class="list-footer"></div>
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
