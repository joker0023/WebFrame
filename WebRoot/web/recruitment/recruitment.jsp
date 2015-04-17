<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/recruitment.css">
   	<div class="main-content">
   		<div class="left-menu">
   			<ul class="js-left-nav">
   				<c:forEach items="${data.catList }" var="cat" varStatus="status">
   					<li class="${cat.id == data.curCat.id ? 'active' : ''}" >
   						<a href="${pageContext.request.contextPath }/recruitment.do?cat=${cat.id}">${cat.name }</a>
   					</li>
   				</c:forEach>
   			</ul>
   		</div>
   		<div class="right-content tab-content">
   			<div class="recruitment-list">
   				<c:if test="${null != data.list }">
	   				<div class="page-header">
						<h3>列表</h3>
					</div>
	   				<div class="list-group">
	   					<c:forEach items="${data.list }" var="recruitment" varStatus="status">
	   						<a class="list-group-item title" href="${pageContext.request.contextPath }/recruitment/detail.do?id=${recruitment.id}" target="_blank">${recruitment.title }</a>
	   					</c:forEach>
	   				</div>
	   				
		   			<%@ include file="/WEB-INF/console/pager.jsp" %>
   				</c:if>
   				<c:if test="${null == data.list }">
   					<div class="alert alert-warning alert-dismissible" role="alert">
   						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   						还没有相关数据!!
   					</div>
   				</c:if>
   			</div>
   		</div>
   	</div>
    	
<%@ include file="/include/footer.jsp" %>
<script type="text/javascript">
	$(function(){
		
	});
</script>
