//根据电脑时间 获取上个月份
function getPrevMonthValue(){
	var myDate = new Date();	
	var year = myDate.getFullYear(); 
	var month = myDate.getMonth();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
	return year+""+month;
};

$(document).ready(function() {
	   //渠道客商 ----带搜索的下拉框
	   $('.select_searchable').searchableSelect();
	   //给时间控件设置初始时间
	   $(".prevMonth").val(getPrevMonthValue());
	
	   
	    var map = new BMap.Map("hotMapShow");    // 创建Map实例
		map.centerAndZoom(new BMap.Point(113.27, 23.13), 16);  // 初始化地图,设置中心点坐标和地图级别
		//添加地图类型控件
		map.addControl(new BMap.MapTypeControl({
			mapTypes:[
	            BMAP_NORMAL_MAP,
	            BMAP_HYBRID_MAP
	        ]})
		);	  
		map.setCurrentCity("广州");          // 设置地图显示的城市 此项是必须设置的
		map.enableScrollWheelZoom(true); 
		//创建小狐狸
	/*	var pt = new BMap.Point(113.270,23.130);
		var myIcon = new BMap.Icon("http://lbsyun.baidu.com/jsdemo/img/fox.gif", new BMap.Size(300,157));
		var marker2 = new BMap.Marker(pt,{icon:myIcon});  // 创建标注
		map.addOverlay(marker2);  */
		//加载海量点
	/*	if (document.createElement('canvas').getContext) {  // 判断当前浏览器是否支持绘制海量点
		        var points = [];  // 添加海量点数据
		        var j=0.0001;
		        for (var i = 0; i < 12; i++) {
		        	
		          points.push(new BMap.Point(113.270, 23.130+j));
		           j=j+0.001;
		        }
		        var options = {
		            size: 50,
		            shape: BMAP_POINT_SHAPE_STAR,
		            color: '#d340c3'
		        }
		        var pointCollection = new BMap.PointCollection(points, options);  // 初始化PointCollection
		        pointCollection.addEventListener('click', function (e) {
		          alert('单击点的坐标为：' + e.point.lng + ',' + e.point.lat);  // 监听点击事件
		        });
		        map.addOverlay(pointCollection);  // 添加Overlay
		    } else {
		        alert('请在chrome、safari、IE8+以上浏览器查看本示例');
		    }
		*/
		
	    // 创建标注
			
			 
			
	  function addMarker(point){
		  var marker = new BMap.Marker(point);
	      map.addOverlay(marker);
			  
	     /*
		  var label = new BMap.Label("门店",{offset:new BMap.Size(20,-10)});
		  marker.setLabel(label);*/
		  var opts = {
				  width : 200,     // 信息窗口宽度
				  height: 100,     // 信息窗口高度
				  title : "门店A" , // 信息窗口标题
				  enableMessage:true,//设置允许信息窗发送短息
				  message:"销售量:1000"
		  }
		 var infoWindow = new BMap.InfoWindow("地址：广州大学城信息枢纽楼", opts);  // 创建信息窗口对象 
			marker.addEventListener("click", function(){          
				map.openInfoWindow(infoWindow,point); //开启信息窗口
			});
			  
			  
	  }
			// 随机向地图添加25个标注
			var bounds = map.getBounds();
			var sw = bounds.getSouthWest();
			var ne = bounds.getNorthEast();
			var lngSpan = Math.abs(sw.lng - ne.lng);
			var latSpan = Math.abs(ne.lat - sw.lat);
			for (var i = 0; i < 25; i ++) {
				var point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7));
				addMarker(point);
			}
		
		
		
		
		
		
	   //初始化图表
	   var stockUserPaint = initEcharts(echarts,"stockUser");//存量用户数
	   var newVolumePaint = initEcharts(echarts,"newVolume");//新入盘量
	   var purchasePaint = initEcharts(echarts,"purchase");//供货平台销量
	   var byoShowPaint = initEcharts(echarts,"byoShow");///TOP5销售价格
	   var supplyPlatformPaint = initEcharts(echarts,"supplyPlatform");//供货平台销量
	   var sellPricePaint = initEcharts(echarts,"sellPrice");///TOP5销售价格
	   
	   //初始化图表参数
	   var stockUserOption = buildLineChart();//存量用户数
	   var newVolumeOption = buildLineChart();//新入盘量
	   var purchaseOption = buildLineChart();//移动购机入网
	   var byoShowOption = buildLineChart(); //自带机入网
	   var supplyPlatformOption = oneBar();//供货平台销量
	   var sellPriceOption = oneBar(); //TOP5销售价格
	   
	   //设置图表参数
	   stockUserOption.xAxis.data.push('7-11','7-12','7-13','7-14','7-15'); //存量用户数
	   stockUserOption.series[0].data.push('100','200','300','200','150'); //存量用户数
	   
	  
	   newVolumeOption.xAxis.data.push('7-11','7-12','7-13','7-14','7-15'); //新入盘量
	   newVolumeOption.series[0].data.push('300','280','230','200','250'); //新入盘量
	   
	   purchaseOption.xAxis.data.push('7-11','7-12','7-13','7-14','7-15'); //移动购机入网
	   purchaseOption.series[0].data.push('300','280','230','200','250'); //移动购机入网
	   
	   byoShowOption.xAxis.data.push('7-11','7-12','7-13','7-14','7-15'); //自带机入网
	   byoShowOption.series[0].data.push('300','280','230','200','250'); //自带机入网
	   
	 
	   
	   supplyPlatformOption.xAxis[0].data.push('OPPO','VIVO','苹果','华为','小米'); //供货平台销量
	   supplyPlatformOption.series[0].data.push('300','280','230','200','250'); //供货平台销量
	   supplyPlatformOption.series[0].barWidth=20;
	   
	   sellPriceOption.xAxis[0].data.push('华为荣耀','小米8 IPV','oppoV8','华为P9','华为P10'); //TOP5销售价格
	   sellPriceOption.series[0].data.push('300','280','230','200','250'); //TOP5销售价格
	   sellPriceOption.series[0].barWidth=20;
	   //显示图表
	   stockUserPaint.setOption(stockUserOption); //存量用户数
	   newVolumePaint.setOption(newVolumeOption); //新入盘量
	   purchasePaint.setOption(purchaseOption); //新入盘量
	   byoShowPaint.setOption(byoShowOption); //新入盘量
	   supplyPlatformPaint.setOption(supplyPlatformOption); //新入盘量
	   sellPricePaint.setOption(sellPriceOption); //新入盘量
	   
});