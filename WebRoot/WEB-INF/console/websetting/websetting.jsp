<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/console/include/header.jsp"%>
  			
	 		<div>
	 			<div class="left-menu">
	 				<ul>
						<li class="active">
							<a href="${pageContext.request.contextPath }/console/websetting/comm.do" target="mainIframe">基本信息</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/console/websetting/links.do" target="mainIframe">友情链接</a>
						</li>
						<!-- 废弃 
						<li>
							<a href="${pageContext.request.contextPath }/console/websetting/titleSet.do" target="mainIframe">页面标题</a>
						</li>
						 废弃 -->
					</ul>
	 			</div>
	 			<div class="right-content">
					<iframe id="mainIframe" name="mainIframe" style="overflow-x: hidden;border: 0" width="60%" src="${pageContext.request.contextPath }/console/websetting/comm.do" onload="loadComplete();">
						
					</iframe>
				</div>
	 		</div>
	 		
	  	</div>
  	</body>
</html>
