<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
    	<div class="main-content">
    		<c:if test="${null != data.carouselList}">
	    		<div id="carousel-generic" class="carousel slide" data-ride="carousel">
				  	<ol class="carousel-indicators">
				    	<li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
				    	<li data-target="#carousel-generic" data-slide-to="1"></li>
				    	<li data-target="#carousel-generic" data-slide-to="2"></li>
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
    		
    		</div>
    	</div>
    	
<%@ include file="/include/footer.jsp" %>