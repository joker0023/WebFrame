<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<div class="clear"></div>
		<div class="footer">
			<p>
  				<a href="${pageContext.request.contextPath }/index.do">首页</a>|
				<a href="${pageContext.request.contextPath }/about.do">关于我们</a>|
				<a href="http://www.miitbeian.gov.cn" target="_blank">粤ICP备XXXXX号</a>
  			</p>
			<c:if test="${null != sessionScope.linkList }">
				<p class="link-p">
					友情链接: 
					<c:forEach items="${sessionScope.linkList }" var="link" varStatus="statuc">
						<a href="${link.url }" target="_blank">${link.name }</a>
					</c:forEach>
				</p>
			</c:if>
  			<p>
  				Copyright [c] 2015 By joker Allrights Reserved. 
  			</p>
  		</div>
  	</div>
  	
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function(){
			var clientHeight = document.documentElement.clientHeight;
			var height = clientHeight - 130 - 128;
			$(".main-content").css("min-height", height + "px");
			
			if($(".left-menu").length > 0 && $(".right-content").length > 0){
				if($(".left-menu").height() < $(".right-content").height()){
					$(".left-menu").height($(".right-content").height());
				}
				if($(".left-menu").height() < $(".main-content").height()){
					$(".left-menu").height($(".main-content").height());
				}
			}
		});
	</script>
	</body>
</html>