$(document).ready(function() {	
	title_tip();
	//带搜索的下拉框样式初始化
	$('.select_searchable').select2();
	//时间控件设置初始时间
	$(".prevMonth").val(getPrevMonthValue());
	//城市下拉框初始化
	citySelectInit($('#citySelect'));
	//顶部菜单切换
	$("#menu li").attr("class","drop");
	$("#hallIdentityMap").attr("class","active"); 	
   
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
			//clickName();
		});   
    });   



}
/*地图结束*/ 

//左边两个echarts图
function showPortrays(portrays){
	//画像总数不够时
	for(var i=portrays.length+1;i<=6;i++){
		var id =  "portray"+i;			
		$("#"+id+"_cnName").html("&nbsp;");				
		$("#"+id+"_cnName").attr("title","");					
		resetDiv($("#"+id));
	}
	
	var ids = [];
	$("#all_field1 input:checkbox:checked").each(function() {
		var val = $(this).val();
		ids.push(val);
	});
	
	for(var m=0;m<ids.length;m++){
		for(var n=0;n<portrays.length;n++){			
			if(portrays[n].id==ids[m]){		
				var cusChan = portrays[n];
				
				var id = m+1;
				id =  "portray"+id;
				$("#"+id+"_cnName").html(cusChan.cnName);	
				
				var tip = isEmptyObject(cusChan)?"":((cusChan.tip==null)?"":cusChan.tip);
				$("#"+id+"_cnName").attr("title",tip);	
			
				resetDiv($("#"+id));		
				if(isEmptyObject(cusChan.detail) || isEmptyObject(cusChan.value)){  //
					continue;
				}
				
				var paint = initEcharts(echarts,id);		

                var curMonth = $("input[name='statMonth']").val();
                showThePortray(paint,cusChan,curMonth);
				
			}
		}
	}
	
	for(var i=0;i<portrays.length;i++){

	}
	
}

/**
 * 以下查询下拉框
 */
//品牌
function showTermBrnd(arr){	
	var id = "termBrnd";   
    $("#"+id).empty();     
    $("#"+id).select2({});
    
    arr = isEmptyObject(arr)?[]:arr;
    $.each(arr,function(index,item){   	
    	$("#"+id).append("<option value='"+item+"'>"+item+"</option>"); 
    });
    
    $("#"+id).off("select2:select").on("select2:select",function(e){ 
    	clickbrand();
	});
}

//机型
function showTermMdl(arr){	
	var id = "termMdl";   
    $("#"+id).empty();     
    $("#"+id).select2({});
    
    arr = isEmptyObject(arr)?[]:arr;
    $.each(arr,function(index,item){   	
    	$("#"+id).append("<option value='"+item.termMdl+"'>"+item.termMdl+"</option>"); 
    });
    
    $("#"+id).off("select2:select").on("select2:select",function(e){ 
    	clickMdl();
	});
}

//门店
function showName(list){	
	$("#name").empty();
	$("#name").append("<option value=''>全部门店</option>"); 
	$("#name").select2({
		  data: list
	});
	
	//$("#name").on("select2:select",function(e){ 
	$("#name").off("select2:close").on("select2:close",function(e){ 	
		clickName();
	});
	
}




