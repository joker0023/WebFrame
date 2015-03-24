<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/console/include/header.jsp"%>
  			
	 		<div class="row">
	 			<div class="g-left">
	 				<ul class="nav nav-pills nav-stacked">
	 					<li class="active" role="presentation">
							<a href="${pageContext.request.contextPath }/console/system/userList.do" target="mainIframe">用户列表</a>
						</li>
						<li role="presentation">
							<a href="${pageContext.request.contextPath }/console/system/actionList.do" target="mainIframe">用户行为</a>
						</li>
	 					<li role="presentation">
							<a href="${pageContext.request.contextPath }/console/system/getInfoLog.do" target="mainIframe">查看日记</a>
						</li>
					</ul>
	 			</div>
	 			<div class="g-right">
					<iframe id="mainIframe" name="mainIframe" style="overflow-x: hidden;border: 0" width="60%" src="${pageContext.request.contextPath }/console/system/userList.do" onload="loadComplete();">
						welcome to system page!!
					</iframe>
				</div>
	 		</div>
	 		
	  	</div>
	  	
  	</body>
</html>
