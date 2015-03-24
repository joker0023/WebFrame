<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/console/include/header.jsp"%>
  			
	 		<div class="row">
	 			<div class="g-left">
	 				<ul class="nav nav-pills nav-stacked">
						<li class="active" role="presentation">
							<a href="${pageContext.request.contextPath }/console/contact/info.do" target="mainIframe">基本信息</a>
						</li>
						<li role="presentation">
							<a href="${pageContext.request.contextPath }/console/contact/map.do" target="mainIframe">地图设置</a>
						</li>
					</ul>
	 			</div>
	 			<div class="g-right">
					<iframe id="mainIframe" name="mainIframe" style="overflow-x: hidden;border: 0" width="60%" src="${pageContext.request.contextPath }/console/contact/info.do" onload="loadComplete();">
						
					</iframe>
				</div>
	 		</div>
	 		
	  	</div>
  	</body>
</html>
