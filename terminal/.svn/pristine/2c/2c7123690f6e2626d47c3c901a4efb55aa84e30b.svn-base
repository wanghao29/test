$(document).ready(function() {
	   //带搜索的下拉框样式初始化
	   $('.select_searchable').searchableSelect({});
	   //时间控件设置初始时间
	 
	   
	   $(".prevMonth").val(getPrevMonthValue());
	  // $(".prevMonth").val("201901");
	   //城市下拉框初始化
	   citySelectInit($('#citySelect'));
	   //顶部菜单切换
	   $("#menu li").attr("class","drop");
	   $("#hallIdentityMap").attr("class","active"); 
	   
	   //	   
	   $("#citySelect").change(function(){
		   pageInit();
	   });
});

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

////坐标转换完之后的回调函数
//var returnPoint = [];
//translateCallback = function (data){
//   returnPoint = [];
//   if(data.status === 0) {	   
//	   for (var i = 0; i < data.points.length; i++) {
//	       returnPoint.push(data.points[i]);
//	   }
//   }
//}

/*地图开始*/ 
function showBMap(qudaos,vo){		
	var map = new BMap.Map("hotMapShow");    // 创建Map实例

	// 初始化地图,设置中心点坐标和地图级别
    if(!isEmptyObject(vo) && vo.longitude!=null && vo.longitude!=''){
		map.centerAndZoom(new BMap.Point(vo.longitude, vo.latitude), 16);
	}else{
		map.centerAndZoom(new BMap.Point("113.275210", "23.070360"), 8); 	
	}
	
	//控件
	map.addControl(new BMap.MapTypeControl({mapTypes:[BMAP_NORMAL_MAP,BMAP_HYBRID_MAP]})); //地图类型：地图、混合
	//功能
	map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
	
	//给每个位置创建标注
	$.each(qudaos, function(idx, qudao) {  		
		//信息窗口样式
		var opts = {
	        width : 220,     // 信息窗口宽度
		    height: 80,     // 信息窗口高度
		    title : "品牌:"+qudao.termBrnd , // 信息窗口标题
		    enableMessage:true,//设置允许信息窗发送短息
		    message:"销售量:1000"
		}	
		var infoWindow = new BMap.InfoWindow("厅店："+qudao.name, opts);  // 创建信息窗口对象 
		
		var point = new BMap.Point(qudao.longitude, qudao.latitude); 	
		var marker = new BMap.Marker(point);                                  // 创建标注 绑定该信息窗口
		map.addOverlay(marker);                                               // 在地图上添加该标注
		marker.setLabel(qudao.name);
		marker.addEventListener("click", function(){          
			map.openInfoWindow(infoWindow,point); //开启信息窗口
			$("#name").val(qudao.name).trigger("change");
		});   
    });   



}
/*地图结束*/ 

function showPortrays(portrays){	
	for(var i=0;i<portrays.length;i++){
		var portray = portrays[i];
		
		var id = i+1;
		id =  "portray"+id;
		$("#"+id+"_cnName").html(portray.cnName);	
		
		var tip = isEmptyObject(portray)?"":((portray.tip==null)?"":portray.tip);
		$("#"+id+"_cnName").attr("title",tip);

		resetDiv($("#"+id));		
		if(isEmptyObject(portray.detail) || isEmptyObject(portray.value)){  //
			continue;
		}
		
		var paint = initEcharts(echarts,id);		
	    if(portray.showType==2){ //曲线图	    	
	 	   var detail = (portray.detail).split(',');
		   var value = (portray.value).split(',');
		
		   var option = buildLineAreaChart2(); 
		   $.each(detail, function(idx, item) {
			   option.xAxis.data.push(item);
		   });
		   var index = getSeriesIndex(detail,$(".prevMonth").val());
		   $.each(value, function(idx, item) {
			   if(index==idx){
				   var obj = {value:item,label: {color: 'yellow', fontSize:'16',fontSize:'26'}};
				   option.series[0].data.push(obj);
			   }else{
				   option.series[0].data.push(item);
			   }	
		   });
		   paint.setOption(option);		   
		}
	    if(portray.showType==3){ //环形图
	 	   var detail = (portray.detail).split(',');
		   var value = (portray.value).split(',');
		   
		   var option = buildChartOptionAnnulus(); 
	       for(var j=0; j<detail.length;j++){
	    	   option.series[0].data.push({value:value[j], name:detail[j]});
	       }

	       option.series[0].center=['40%', '50%'];
	       paint.setOption(option);	   
		}
	    if(portray.showType==4){ 
	 	   var detail = (portray.detail).split(',');
		   var value = (portray.value).split(',');
		   
		   var option = oneBar();
		   $.each(detail, function(idx, item) {
			   option.xAxis[0].data.push(item);
		   });
		   $.each(value, function(idx, item) {
			   option.series[0].data.push(item);
		   });			   
		   option.series[0].barWidth=20;
	       paint.setOption(option);	   
		}	    
	}
	
}

/**
 * 以下查询下拉框
 */
//品牌
var isTermBrndClick;
function showTermBrnd(arr){
	isTermBrndClick = false; //是点击触发，而不是第一次加载触发
	var id = "termBrnd";
	var searchableSelect = $("#"+id);
	var name = searchableSelect.attr("name");
	var style = searchableSelect.attr("style");
	var parent = searchableSelect.parent();
	
	parent.html("");	
	parent.append('<select name="'+name+'" id="'+id+'"  style="'+style+'" >"</select>');
    $.each(arr,function(index,item){   	
    	$("#"+id).append("<option value='"+item+"'>"+item+"</option>"); 
    });

    $("#"+id).searchableSelect({
        afterSelectItem:function(){
        	clickbrand();
        	isTermBrndClick = true;
        }
    });
}

//机型
var isTermMdlClick;
function showTermMdl(arr){
	isTermMdlClick = false;
	var id = "termMdl";
	var searchableSelect = $("#"+id);
	var name = searchableSelect.attr("name");
	var style = searchableSelect.attr("style");
	var parent = searchableSelect.parent();
	
	parent.html("");	
	parent.append('<select name="'+name+'" id="'+id+'"  style="'+style+'" >"</select>');
	$("#"+id).append("<option value=''>全部机型</option>");
	
	if(!isEmptyObject(arr)){
	    $.each(arr,function(index,item){   	
	    	$("#"+id).append("<option value='"+item.termMdl+"'>"+item.termMdl+"</option>"); 
	    });
	}


    $("#"+id).searchableSelect({
        afterSelectItem:function(){
        	clickMdl();
        	isTermMdlClick = true;
        }
    });
}

//基站
function showName(list){
	$("#name").empty();
	$("#name").append("<option value=''>全部门店</option>"); 
	$("#name").select2({
		  data: list
	});
	
	//$("#name").on("select2:select",function(e){ 
	$("#name").on("select2:close",function(e){ 	
		clickName();
	});
}

