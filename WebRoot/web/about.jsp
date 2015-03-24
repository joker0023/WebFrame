<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/about.css">
   	<div class="main-content">
   		<div class="left-menu">
   			<ul class="js-left-nav">
   				<c:forEach items="${data.list }" var="about" varStatus="status">
   					<li class="${status.index == 0 ? 'active' : ''}" >
   						<a href="#tab_${status.index}" data-toggle="tab">${about.tabName }</a>
   					</li>
   				</c:forEach>
   			</ul>
   		</div>
   		<div class="right-content tab-content">
   			<c:forEach items="${data.list }" var="about" varStatus="status">
   				<div id="tab_${status.index}" class="tab-pane fade ${status.index == 0 ? 'active in' : ''}">
   					${about.html }
   				</div>
   			</c:forEach>
   		</div>
   	</div>
    	
<%@ include file="/include/footer.jsp" %>
<script type="text/javascript">
	$(function(){
		
	});
</script>
