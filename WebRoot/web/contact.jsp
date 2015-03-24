<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/contact.css">
   	<div class="main-content">
   		<div class="left-menu">
   			<ul class="js-left-nav">
   				<li class="active">
   					<a href="javascript:void(0);">联系我们</a>
   				</li>
   			</ul>
   		</div>
   		<div class="right-content">
   			<c:if test="${null != data.contact}">
   				<form class="form-horizontal contact-info">
   					<c:if test="${null != data.contact.compary}">
		 				<div class="form-group">
		 					<label class="col-sm-2 control-label">公司:</label>
						    <div class="col-sm-10">
						    	<p class="form-control-static">${data.contact.compary }</p>
						    </div>
		 				</div>
	 				</c:if>
	 				<c:if test="${null != data.contact.address}">
		 				<div class="form-group">
		 					<label class="col-sm-2 control-label">详细地址:</label>
						    <div class="col-sm-10">
						    	<p class="form-control-static">${data.contact.address }</p>
						    </div>
		 				</div>
	 				</c:if>
	 				<c:if test="${null != data.contact.phone}">
		 				<div class="form-group">
		 					<label class="col-sm-2 control-label">联系电话:</label>
						    <div class="col-sm-10">
						    	<p class="form-control-static">${data.contact.phone }</p>
						    </div>
		 				</div>
	 				</c:if>
	 				<c:if test="${null != data.other}">
		 				<div class="form-group">
		 					<label class="col-sm-2 control-label">其他信息:</label>
						    <div class="col-sm-10">
						    	<p class="form-control-static">${data.other}</p>
						    </div>
		 				</div>
	 				</c:if>
	 			</form>
	 			<c:if test="${null != data.contact.addrLng && null != data.contact.addrLat}">
	 				<div id="map-container"></div>
	 			</c:if>
   			</c:if>
   			
   		</div>
   	</div>
    	
<%@ include file="/include/footer.jsp" %>
<script src="http://api.map.baidu.com/api?v=1.5&ak=1LjhnIAGqQ1kwAWp1QHHv51D" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		try{
			var addrLng = "${data.contact.addrLng}";
			var addrLat = "${data.contact.addrLat}";
			if(null != addrLng && "" != addrLng && null != addrLat && "" != addrLat){
				var map = new BMap.Map("map-container");
				var point = new BMap.Point(addrLng, addrLat);	// 创建点坐标  
				var marker = new BMap.Marker(point);  		// 创建标注
				map.centerAndZoom(point, 15);				// 设置地图中心点
				map.enableScrollWheelZoom(true);			// 设置可滚轮缩放
				map.addControl(new BMap.NavigationControl());	//地图平移缩放控件
				map.addControl(new BMap.OverviewMapControl());	//缩略地图控件
				map.addControl(new BMap.ScaleControl());		//比例尺控件
				map.addOverlay(marker);				//添加标注
				marker.setTitle("${data.contact.compary}");
			}
		}catch (e) {
			//console.log(e);
		}
	});
</script>
