<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/console/include/header.jsp"%>
  			
	 		<div class="row">
	 			<div class="g-left">
	 				<ul class="nav nav-pills nav-stacked">
						<li class="active" role="presentation">
							<a href="${pageContext.request.contextPath }/console/websetting/comm.do" target="mainIframe">基本信息</a>
						</li>
						<li role="presentation">
							<a href="${pageContext.request.contextPath }/console/websetting/links.do" target="mainIframe">友情链接</a>
						</li>
						<!-- 废弃 
						<li role="presentation">
							<a href="${pageContext.request.contextPath }/console/websetting/titleSet.do" target="mainIframe">页面标题</a>
						</li>
						 废弃 -->
					</ul>
	 			</div>
	 			<div class="g-right">
					<iframe id="mainIframe" name="mainIframe" style="overflow-x: hidden;border: 0" width="60%" src="${pageContext.request.contextPath }/console/websetting/comm.do" onload="loadComplete();">
						
					</iframe>
				</div>
	 		</div>
	 		
	  	</div>
  	</body>
</html>
