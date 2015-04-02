<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/home.css">
    	<div class="main-content">
    		<c:if test="${null != data.carouselList}">
	    		<div id="carousel-generic" class="carousel slide" data-ride="carousel">
				  	<ol class="carousel-indicators">
				  		<c:forEach items="${data.carouselList }" var="carousel" varStatus="status">
				  			<li data-target="#carousel-generic" data-slide-to="${status.index }" class="${status.index==0 ? 'active' : '' }"></li>
				  		</c:forEach>
					</ol>
				
					<div class="carousel-inner" role="listbox">
						<c:forEach items="${data.carouselList }" var="carousel" varStatus="status">
							<div class="item <c:if test='${status.index==0}'>active</c:if>">
					    		<a href="${carousel.url }" target="_blank" title="${carousel.title }">
					    			<img src="${pageContext.request.contextPath }${carousel.pic}" alt="">
						      		<div class="carousel-caption">
						        		<h3>${carousel.title }</h3>
						        		<p>${carousel.content }</p>
						      		</div>
					    		</a>
					    	</div>
						</c:forEach>
				  	</div>
				
				  	<a class="left carousel-control" href="#carousel-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
				  	</a>
				 	<a class="right carousel-control" href="#carousel-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				 		<span class="sr-only">Next</span>
					</a>
				</div>
    		</c:if>
    		
    		<div class="index-content">
    			<div class="container-fluid">
    				<div class="row">
    					<div class="dynamic-container col-xs-6 col-sm-6 col-md-5">
    						<h4>最新动态:</h4>
    						<table class="table">
    							<c:forEach items="${data.dynamicList }" var="dynamic" varStatus="status">
    								<tr>
    									<td>
    										<a href="javascript:void(0);" title="${dynamic.title }" class="${dynamic.type == 1 ? 'note' : ''}">${dynamic.title }</a>
    									</td>
    								</tr>
    							</c:forEach>
    						</table>
    					</div>
    					<div class="more-content col-xs-6 col-sm-6 col-md-7">
    						<div>
    						</div>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    	<script type="text/javascript">
    		$(function(){
    			$(".dynamic-container td a").width($(".dynamic-container").width() - 50);
    		});
    	</script>
<%@ include file="/include/footer.jsp" %>