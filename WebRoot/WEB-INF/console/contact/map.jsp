<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
	<head>
 		<meta charset="utf-8">
    	<title>联系地图设置</title>
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
  		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/base.css">
  		<style type="text/css">
  			label {
  				max-width: none;
  			}
  			#allmap {
  				width: 100%;
  				height: 100%;
  				overflow: hidden;
  				margin:0;
  				font-family:"微软雅黑";
  			}
  			#map-container {
  				border: 1px solid #ccc;
  				width: 800px;
  				height: 500px;
  			}
  			#map-container div, #map-container span {
				box-sizing: content-box;
			}
  			.control {
  				padding: 10px 0;
  			}
  		</style>
  	</head>
  	<body>
  		<div class="container-fluid">
  			<h1>联系地址地图设置</h1>
  			<div id="map-container"></div>
  			<div class="control">
  				<button type="button" class="btn btn-primary js-save">保存</button>
  				<button type="button" class="btn btn-info js-marker">标注</button>
  			</div>
  		</div>
  		
  		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.min.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/utils.js"></script>
		<script src="http://api.map.baidu.com/api?v=1.5&ak=1LjhnIAGqQ1kwAWp1QHHv51D" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){
				//初始化地图
				var addrLng = "${data.addrLng}";
				var addrLat = "${data.addrLat}";
				var bdmap = new BDmap("map-container", addrLng, addrLat);
				bdmap.init();
				
				$(".js-save").click(function(){
					var p = bdmap.marker.getPosition();       //获取marker的位置
					var lng = p.lng;
					var lat = p.lat;
					
					var url = "${pageContext.request.contextPath }/console/contact/saveContact.do";
					$.ajax({
						type: "post",
						url: url,
						data: {
							addrLng: lng,
							addrLat: lat
						},
						dataType: "json",
						success: function(msg){
							if(null != msg && msg.isSuccess){
								alert("保存成功!");
							}else{
								console.log(msg);
							}
						},
						error: function(msg, status, e){
							alert(e);
						}
					});
				});
				
				$(".js-marker").click(function(){
					bdmap.resetMarker();
				});
			});
			
			function BDmap(divId, lng, lat){
				this.lng = 113.341522;
				this.lat = 23.138647;
				if(null != lng && null != lat && "" != lng && "" != lat){
					this.lng = parseFloat(lng);
					this.lat = parseFloat(lat);
				}
				
				this.map = new BMap.Map(divId);
				this.point = new BMap.Point(this.lng, this.lat);	// 创建点坐标  
				this.marker = new BMap.Marker(this.point);  		// 创建标注
				
				this.init = function() {
					this.map.centerAndZoom(this.point, 15);
					this.map.enableScrollWheelZoom(true);		//设置可滚轮缩放
					
					this.map.addControl(new BMap.NavigationControl());	//地图平移缩放控件
					this.map.addControl(new BMap.OverviewMapControl());	//缩略地图控件
					this.map.addControl(new BMap.ScaleControl());		//比例尺控件
					//map.addControl(new BMap.MapTypeControl());		//地图类型控件
					//map.addControl(new BMap.CopyrightControl());	//版权控件
					//map.addControl(new BMap.GeolocationControl());	//定位控件
					
					this.map.addOverlay(this.marker);	//添加标注
					//var label = new BMap.Label("标注联系地址", {offset: new BMap.Size(20,-10)});	//文字标注
					//this.marker.setLabel(label);
					this.marker.enableDragging();	//设置标注可拖动
					this.marker.setTitle("标注可移动");
				};
				
				this.resetMarker = function() {
					var center = this.map.getCenter();
					this.point = new BMap.Point(center.lng, center.lat);
					this.marker.setPosition(this.point);
				}
				
			}
		</script>
  	</body>
</html>