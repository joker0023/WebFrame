<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
		<div class="footer">
  			<p>
  				<a href="${pageContext.request.contextPath }/index.do">首页</a>|
				<a href="${pageContext.request.contextPath }/index.do">关于我们</a>|
				<a href="http://www.miitbeian.gov.cn" target="_blank">粤ICP备XXXXX号</a>
  			</p>
  			<p>
  				Copyright [c] 2015 By joker Allrights Reserved. 
  			</p>
  		</div>
  	</div>
  	
  	<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function(){
			if($(".left-menu").length > 0 && $(".right-content").length > 0){
				if($(".left-menu").height() < $(".right-content").height()){
					$(".left-menu").height($(".right-content").height());
				}
			}
			
			/*
			$(".js-left-nav > li > a").click(function(){
				$(this).parents(".js-left-nav").find("li").removeClass("active");
				$(this).parent().addClass("active");
			});
			*/
		});
	</script>
	</body>
</html>