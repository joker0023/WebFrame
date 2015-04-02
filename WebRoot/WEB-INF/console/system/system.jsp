<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/console/include/header.jsp"%>
  			
	 		<div>
	 			<div class="left-menu">
	 				<ul>
	 					<li class="active">
							<a href="${pageContext.request.contextPath }/console/system/userList.do" target="mainIframe">用户列表</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/console/system/actionList.do" target="mainIframe">用户行为</a>
						</li>
	 					<li>
							<a href="${pageContext.request.contextPath }/console/system/getInfoLog.do" target="mainIframe">查看日记</a>
						</li>
						<!-- 子菜单测试代码
						<li>
							<a href="javascript:void(0);">测试</a>
							<ul class="sub-menu">
								<li>
									<a href="javascript:void(0);">子菜单1</a>
								</li>
								<li>
									<a href="javascript:void(0);">子菜单2</a>
								</li>
							</ul>
						</li>
						-->
					</ul>
	 			</div>
	 			<div class="right-content">
					<iframe id="mainIframe" name="mainIframe" style="overflow-x: hidden;border: 0" width="60%" src="${pageContext.request.contextPath }/console/system/userList.do" onload="loadComplete();">
						
					</iframe>
				</div>
	 		</div>
	 		
	  	</div>
	  	
  	</body>
</html>
