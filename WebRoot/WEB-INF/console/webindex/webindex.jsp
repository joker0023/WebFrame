<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/console/include/header.jsp"%>
  			
	 		<div>
	 			<div class="left-menu">
	 				<ul>
						<li class="active">
							<a href="${pageContext.request.contextPath }/console/webindex/setting.do" target="mainIframe">基本设置</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/console/webindex/carousel.do" target="mainIframe">轮播图</a>
						</li>
					</ul>
	 			</div>
	 			<div class="right-content">
					<iframe id="mainIframe" name="mainIframe" frameborder="no" border="0" style="overflow-x: hidden;border: 0" width="60%" src="${pageContext.request.contextPath }/console/webindex/setting.do" onload="loadComplete();">
						
					</iframe>
				</div>
	 		</div>
		</div>
  	</body>
</html>