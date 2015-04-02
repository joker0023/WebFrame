<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/console/include/header.jsp"%>
  			
	 		<div>
	 			<div class="left-menu">
	 				<ul>
						<li class="active">
							<a href="${pageContext.request.contextPath }/console/recruitment/category.do" target="mainIframe">招聘类目</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/console/recruitment/list.do" target="mainIframe">招聘详细</a>
						</li>
					</ul>
	 			</div>
	 			<div class="right-content">
					<iframe id="mainIframe" name="mainIframe" style="overflow-x: hidden;border: 0" width="60%" src="${pageContext.request.contextPath }/console/recruitment/category.do" onload="loadComplete();">
						
					</iframe>
				</div>
	 		</div>
	 		
	  	</div>
  	</body>
</html>
