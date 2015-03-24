var EventUtil = {
		addHandler: function(element, type, handler){
			if(element.addEventListener){
				element.addEventListener(type, handler, false);
			}else if(element.attachEvent){
				element.attachEvent(type, handler);
			}else{
				element["on" + type] = handler;
			}
		},

		removeHandler: function(element, type, handler){
			if(element.removeEventListener){
				element.removeEventListener(type, handler, false);
			}else if(element.detachEvent){
				element.detachEvent(type, handler);
			}else{
				element["on" + type] = null;
			}
		},
		
		getEvent: function(event){
			return event ? event : window.event;
		},
		
		getTarget: function(event){
			return event.target || event.srcElement;
		},
		
		preventDefault: function(event){
			if(event.preventDefault){
				event.preventDefault();
			}else{
				event.returnValue = false;
			}
		},
		
		stopPropagation: function(event){
			if(event.stopPropagation){
				event.stopPropagation();
			}else{
				event.cancelBubble = true;
			}
		},
		
		getCharCode : function(event){
			if(typeof event.charCode == "number"){
				return event,charCode;
			}else{
				return evnet.keyCode;
			}
		},
		
		getClipboardText: function(event){
			var clipboardData = (event.clipboardData || window.clipboardData);
			return clipboardData.getData("text");
		},
		
		setClipboardText: function(event, value){
			if(event.clipboardData){
				return event.clipboardData.setData("text/plain", value);
			}else if(window.clipboardData){
				return window.clipboardData.setData("text", value);
			}
		}
};

var browserClient = function(){
	//引擎
	var engine = {
		ie:0,
		gecko: 0,
		webkit: 0,
		khtml: 0,
		opera: 0,
		
		ver: null
	};
	
	//浏览器
	var browser = {
		ie: 0,
		firefox: 0,
		safari: 0,
		konq: 0,
		opera: 0,
		chrome: 0,
		
		ver: null
	};
	
	//平台,设备和操作系统
	var system = {
		win: false,
		mac: false,
		X11: false,
		//移动设备
		iphone: false,
		ipod: false,
		ipad: false,
		ios: false,
		android: false,
		nokiaN: false,
		winMobile: false,
		//游戏设备
		wii: false,
		ps: false
	};
	
	//检测引擎和浏览器
	var ua = navigator.userAgent;
	if(window.opera){
		engine.ver = browser.ver = window.opera.version();
		engine.opera = browser.opera = parseFloat(engine.ver);
	}else if(/AppleWebkit\/(\S+)/.test(ua)){
		engine.ver = RegExp["$1"];
		engine.webkit = parseFloat(engine.ver);
		
		//确定是chrome还是safari
		if(/Chrome\/(\S+)/.test(ua)){
			browser.ver = RegExp["$1"];
			browser.chrome = parseFloat(browser.ver);
		}else if(/Version\/(\S+)/.test(ua)){
			browser.ver = RegExp["$1"];
			browser.safari = parseFloat(browser.ver);
		}else{
			var safariVersion = 1;
			if(engine.webkit < 100){
				safariVersion = 1;
			}else if(engine.webkit < 312){
				safariVersion = 1.2;
			}else if(engine.webkit < 412){
				safariVersion = 1.3;
			}else{
				safariVersion = 2;
			}
			
			browser.safari = browser.ver = safariVersion;
		}
	}else if(/KHTML\/(\S+)/.test(ua)){
		engine.ver = browser.ver = RegExp["$1"];
		engine.khtml = browser.konq = parseFloat(engine.ver);
	}else if(/rv:([^\)]+)\) Gecko\/\d{8}/.test(ua)){
		engine.ver = RegExp["$1"];
		engine.gecko = parseFloat(engine.ver);
		
		//确定是不是firefox
		if(/FireFox\/(\S+)/.test(ua)){
			engine.ver = RegExp["$1"];
			engine.firefox = parseFloat(browser.ver);
		}
	}else if(/MSIE ([^;]+)/.test(ua)){
		engine.ver = browser.ver = RegExp["$1"];
		engine.ie = browser.ie = parseFloat(engine.ver);
	}
	
	//检测平台
	var p = navigator.platform;
	system.win = p.indexOf("Win") == 0;
	system.mac = p.indexOf("Mac") == 0;
	system.X11 = (p == "X11") || (p.indexOf("Linux") == 0);
	
	//检测Windows操作系统
	if(system.win){
		if(/Win(?:dows)?([^do]{2})\s?(\d+\.\d+)?/.test(ua)){
			if(RegExp["$1"] == "NT"){
				switch (RegExp["$2"]) {
				case "5.0":
					system.win = "2000";
					break;
				case "5.1":
					system.win = "XP";
					break;
				case "6.0":
					system.win = "Vista";
					break;
				case "6.1":
					system.win = "7";
					break;
				default:
					system.win = "NT";
					break;
				}
			}else if(RegExp["$1"] == "9x"){
				system.win = "ME";
			}else{
				system.win = RegExp["$1"];
			}
		}
	}
	
	//移动设备
	system.iphone = ua.indexOf("iphone") > -1;
	system.ipod = ua.indexOf("ipod") > -1;
	system.ipad = ua.indexOf("ipad") > -1;
	system.nokiaN = ua.indexOf("nokiaN") > -1;

	if(system.win == "CE"){
		system.winMobile = system.win;
	}else if(system.win == "Ph"){
		if(/Windows Phone OS (\d+\.\d+)/.test(ua)){
			system.win = "Phone";
			system.winMobile = parseFloat(RegExp["$1"]);
		}
	}
	
	//检测iOS版本
	if(system.mac && ua.indexOf("Mobile") > -1){
		if(/CPU (?:iphone)?OS (\d+_\d+)/.test(ua)){
			system.ios = parseFloat(RegExp.$1.replace("_", "."));
		}else{
			system.ios = 2;
		}
	}
	
	//检测Android版本
	if(/Android (\d+\.\d+)/.test(ua)){
		system.android = parseFloat(RegExp.$1);
	}
	
	//游戏系统
	system.wii = ua.indexOf("Wii") > -1;
	system.ps = /playstation/i.test(ua);
	
	return {
		engine: engine,
		browser: browser,
		system: system
	};
}();

var FileUtil = {
	getImgURL: function(file){
		 var url;
		 if(window.URL){
			 url = window.URL.createObjectURL(file);
		 }else if(window.webkitURL){
			 url = window.webkitURL.createObjectURL(file);
		 }else{
			 var reader = new FileReader();
			 reader.readAsDataURL(file);
			 reader.onload = function(){
				 url = reader.result;
	         }
		 }
		 return url;
	}
};

var documentUtil = {
	showLoading: function(){
		var $loading = $("#loading");
		if($loading && $loading.length > 0){
			$loading.show();
		}else{
			$loading = $("<div id='loading'><img src='/WebFrame/assets/img/loading.gif'></div>");
			$(document.body).append($loading);
			$loading.show();
		}
	},
	
	hideLoading: function(){
		$("#loading").hide();
	}
};

var dataUtil = {
		kindEditorOption: {colorTable: [['#000000','#000033','#000066','#000099','#0000CC','#0000FF','#003300','#003333','#003366','#003399','#0033CC','#0033FF','#006600','#006633','#006666','#006699','#0066CC','#0066FF'],
			                            ['#009900','#009933','#009966','#009999','#0099CC','#0099FF','#00CC00','#00CC33','#00CC66','#00CC99','#00CCCC','#00CCFF','#00FF00','#00FF33','#00FF66','#00FF99','#00FFCC','#00FFFF'],
			                            ['#330000','#330033','#330066','#330099','#3300CC','#3300FF','#333300','#333333','#333366','#333399','#3333CC','#3333FF','#336600','#336633','#336666','#336699','#3366CC','#3366FF'],
			                            ['#339900','#339933','#339966','#339999','#3399CC','#3399FF','#33CC00','#33CC33','#33CC66','#33CC99','#33CCCC','#33CCFF','#33FF00','#33FF33','#33FF66','#33FF99','#33FFCC','#33FFFF'],
			                            ['#660000','#660033','#660066','#660099','#6600CC','#6600FF','#663300','#663333','#663366','#663399','#6633CC','#6633FF','#666600','#666633','#666666','#666699','#6666CC','#6666FF'],
			                            ['#669900','#669933','#669966','#669999','#6699CC','#6699FF','#66CC00','#66CC33','#66CC66','#66CC99','#66CCCC','#66CCFF','#66FF00','#66FF33','#66FF66','#66FF99','#66FFCC','#66FFFF'],
			                            ['#990000','#990033','#990066','#990099','#9900CC','#9900FF','#993300','#993333','#993366','#993399','#9933CC','#9933FF','#996600','#996633','#996666','#996699','#9966CC','#9966FF'],
			                            ['#999900','#999933','#999966','#999999','#9999CC','#9999FF','#99CC00','#99CC33','#99CC66','#99CC99','#99CCCC','#99CCFF','#99FF00','#99FF33','#99FF66','#99FF99','#99FFCC','#99FFFF'],
			                            ['#CC0000','#CC0033','#CC0066','#CC0099','#CC00CC','#CC00FF','#CC3300','#CC3333','#CC3366','#CC3399','#CC33CC','#CC33FF','#CC6600','#CC6633','#CC6666','#CC6699','#CC66CC','#CC66FF'],
			                            ['#CC9900','#CC9933','#CC9966','#CC9999','#CC99CC','#CC99FF','#CCCC00','#CCCC33','#CCCC66','#CCCC99','#CCCCCC','#CCCCFF','#CCFF00','#CCFF33','#CCFF66','#CCFF99','#CCFFCC','#CCFFFF'],
			                            ['#FF0000','#FF0033','#FF0066','#FF0099','#FF00CC','#FF00FF','#FF3300','#FF3333','#FF3366','#FF3399','#FF33CC','#FF33FF','#FF6600','#FF6633','#FF6666','#FF6699','#FF66CC','#FF66FF'],
			                            ['#FF9900','#FF9933','#FF9966','#FF9999','#FF99CC','#FF99FF','#FFCC00','#FFCC33','#FFCC66','#FFCC99','#FFCCCC','#FFCCFF','#FFFF00','#FFFF33','#FFFF66','#FFFF99','#FFFFCC','#FFFFFF']],
			                fontSizeTable: ['9px', '10px', '12px', '14px', '16px', '18px', '24px', '32px', '48', '64', '80'],
			                items: ['source', '|', 'undo', 'redo', '|', 'preview', 'code', 'cut', 'copy', 'paste',
			                        'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
			                        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
			                        'superscript', 'clearhtml', 'quickformat', 'selectall', '/', 
			                        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
			                        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
			                        'table', 'hr', 'emoticons', 'baidumap', 'pagebreak', 'link', 'unlink', 'fullscreen', ],
			         		allowImageUpload : true,
			         		fileManagerJson : (null == window.contextPath ? '' : window.contextPath) + '/console/fileManager.do',
							allowFileManager : true}
};
function showTipAndReload(data, tip){
	if(null == data){
		return;
	}
	if(data.isSuccess){
		if($("#alert-tip").length < 1){
			var showTipHtml = '<div id="alert-tip">' +
			'<span class="glyphicon glyphicon-ok"></span>' +
			'<span>保存成功</span>'
			'</div>';

			$(document.body).prepend(showTipHtml);
		}
		$("#alert-tip").find("span").last().text(tip + "成功");
		$("#alert-tip").show();
		setTimeout(function(){
			$("#alert-tip").hide();
			window.location.reload();
		}, 1000);
	}else{
		alert(tip + "失败: " + data.errMsg);
	}
}