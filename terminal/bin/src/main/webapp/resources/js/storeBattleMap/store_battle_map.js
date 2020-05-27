var otherMarkers=[];

$(document).ready(function() {
	title_tip();
	//带搜索的下拉框样式初始化
	//$('.select_searchable').searchableSelect();
	//时间控件设置初始时间
	$(".prevMonth").val(getPrevMonthValue());
	//城市下拉框初始化
	citySelectInit($('#citySelect'));
    //顶部菜单切换
    $("#menu li").attr("class","drop");
	$("#storeBattleMap").attr("class","active"); 
	
    //	   
    $("#citySelect").change(function(){
	    pageInit();
    });
    
    //弹框前执行
    $('#modal').on('show.bs.modal', function () {
    	var orgacode = $("select[name='orgacode']").val();
    	if(orgacode==null || orgacode==""){
    		$('#myTab a[href="#cust"]').tab('show')
    	}else{
    		$('#myTab a[href="#hall"]').tab('show')
    	}
    });  
    
});

/*地图开始*/ 
function showBMap(qudaos,other_hall,vo){		
	var map = new BMap.Map("hotMapShow");    // 创建Map实例
	
	// 初始化地图,设置中心点坐标和地图级别
    if(!isEmptyObject(vo) &&vo.orgacode!=null && vo.orgacode!=''){
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
	        width : 200,     // 信息窗口宽度
		    height: 60,     // 信息窗口高度
		    title : "客商:"+$("select[name='cusOrgacode']").text(), // 信息窗口标题
		    enableMessage:true,//设置允许信息窗发送短息
		    message:"销售量:1000"
		} 	;
		var infoWindow = new BMap.InfoWindow("厅店:"+qudao.hallname, opts);  // 创建信息窗口对象 
		
		var point = new BMap.Point(qudao.longitude, qudao.latitude); 	
		var marker = new BMap.Marker(point);                                  // 创建标注 绑定该信息窗口
		map.addOverlay(marker);                                               // 在地图上添加该标注
		marker.setLabel(qudao.hallname);
		//marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
		marker.addEventListener("click", function(){    
			var id=qudao.orgacode;
			map.openInfoWindow(infoWindow,point); //开启信息窗口
			 
			//$("#orgacode").val(id).select2();
			$("#orgacode").val(id).trigger("change");
			submitByHall_click(id,$("select[name='cusOrgacode']").val());
		});   

    });   
	$.each(other_hall, function(idx, qudao) {  		
		//信息窗口样式
		var opts = {
	        width : 200,     // 信息窗口宽度
		    height: 50,     // 信息窗口高度
		    title : "客商: 其他厂商" , // 信息窗口标题
		    enableMessage:true,//设置允许信息窗发送短息
		    message:"销售量:1000"
		} 	;
		var infoWindow = new BMap.InfoWindow("厅店:"+qudao.hallname, opts);  // 创建信息窗口对象 
 
		//创建覆盖物
		var pt = new BMap.Point(qudao.longitude, qudao.latitude);
		var myIcon = new BMap.Icon($("#bdMapUrl").val()+"/images/marker_blue.png", new BMap.Size(20,26));
		var marker2 = new BMap.Marker(pt,{icon:myIcon});  // 创建标注
		map.addOverlay(marker2);              // 将标注添加到地图中
		marker2.addEventListener("click", function(){    
			var id=qudao.orgacode;
			map.openInfoWindow(infoWindow,pt); //开启信息窗口
			submitByHall_click(id,null);
		});  
		marker2.hide(); 
		otherMarkers.push(marker2);
    });   


}
/*地图结束*/ 

function showPortrays(portrays){	
	//按关注特性定制的顺序展示画像
	var ids = [];
	$("#all_field input:checkbox:checked").each(function() {
		var val = $(this).val();
		ids.push(val);
	});
	
	//画像总数不够时
	for(var i=portrays.length+1;i<=6;i++){
		var id =  "portray"+i;			
		$("#"+id+"_cnName").html("&nbsp;");				
		$("#"+id+"_cnName").attr("title","");					
		resetDiv($("#"+id));
	}
	
	var id_num = 1;//用于记录展示第几个图形div
	for(var m=0;m<ids.length;m++){
		for(var n=0;n<portrays.length;n++){			
			if(portrays[n].id==ids[m]){				
				var cusChan = portrays[n];				
				var id =  "portray"+id_num;
				id_num = id_num +1;				
				$("#"+id+"_cnName").html(cusChan.cnName);				
				var tip = isEmptyObject(cusChan)?"":((cusChan.tip==null)?"":cusChan.tip);
				$("#"+id+"_cnName").attr("title",tip);					
				resetDiv($("#"+id));		
				if(isEmptyObject(cusChan.detail) || isEmptyObject(cusChan.value)){  //
					continue;
				}

				var paint = initEcharts(echarts,id);	
				
                var curMonth = $("input[name='month']").val();
                showThePortray(paint,cusChan,curMonth);

			      			     
				
			}
		}
	}
		
}


//厂商 searchableSelect
function showCusOrgacode(customers){
	$("#cusOrgacode").empty();
	$("#cusOrgacode").select2({
		  data: customers
	});
	$("#cusOrgacode").off("select2:select");
	$("#cusOrgacode").on("select2:select",function(e){ 				
		clickBrand();
	});
	
}

//门店 searchableSelect
function showHallInCus(hallInCus){
	$("#orgacode").empty();
	$("#orgacode").append("<option value=''>全部门店</option>"); 
	$("#orgacode").select2({
		  data: hallInCus
	});
	
	$("#orgacode").off("select2:close");
    $("#orgacode").on("select2:close",function(e){ 
    	submitByHall();
    	var  orgacode = $("select[name='orgacode']").val();
    	if(orgacode != ""){
    		 $.each(otherMarkers,function(index,item){   
    			 item.show(); 
    		 });
    	}else{
    		 $.each(otherMarkers,function(index,item){   
    			 item.hide(); 
    		 });
    	}
    	
	});	
}



function modalLayout(custs,halls,typeOrder,channelSelectdIds){
	//添加标题
	var typeNameMap={};
	typeNameMap['1'] = "消费者特性分布";
	typeNameMap['2'] = "流量特性";
	typeNameMap['3'] = "流速特性";
	typeNameMap['4'] = "流向特性";
	typeNameMap['5'] = "提货偏好";
	typeNameMap['6'] = "厂家信息";		
	for(var i=1; i<typeOrder.length+1;i++){
		var title = typeNameMap[typeOrder[i-1]];
		$("#all_field_cust"+i).append('<li class="fieldGroup"><label>&nbsp;'+title+'：</label></li>');
		$("#all_field_hall"+i).append('<li class="fieldGroup"><label>&nbsp;'+title+'：</label></li>');
	}

	
	$.each(custs, function(idx, cusChan) {
		var type = cusChan.type;
		var index = typeOrder.indexOf(type);
		var position = index+1;
		appendFrameLi("all_field_cust"+position,cusChan,channelSelectdIds);
	});
	
	$.each(halls, function(idx, cusChan) {
		var type = cusChan.type;
		var index = typeOrder.indexOf(type);
		var position = index+1;
		appendFrameLi("all_field_hall"+position,cusChan,channelSelectdIds);
	});
	
	//添加点击事件
    $("#all_field_cust input:checkbox").change(function(){   	
    	if($("#all_field_cust input:checkbox:checked").length>6){
    		alert("最多勾选6个关注特征");
    		$(this).click();
    		return;
    	}
    	$("#choose_field_cust").html("");
    	$("#all_field_cust input:checkbox:checked").each(function() {
        	var parent = $(this).parent();
        	var cnName = parent.text();
    	    $("#choose_field_cust").append('<li><label>&nbsp;'+cnName+'</label></li>');
    	});
    });
	$("#all_field_cust input:checkbox:checked").each(function() {
    	var parent = $(this).parent();
    	var cnName = parent.text();
	    $("#choose_field_cust").append('<li><label>&nbsp;'+cnName+'</label></li>');
	});

    
    $("#all_field_hall input:checkbox").change(function(){
    	if($("#all_field_hall input:checkbox:checked").length>6){
    		alert("最多勾选6个关注特征");
    		$(this).click();
    		return;
    	}
    	$("#choose_field_hall").html("");
    	$("#all_field_hall input:checkbox:checked").each(function() {
        	var parent = $(this).parent();
        	var cnName = parent.text();
    	    $("#choose_field_hall").append('<li><label>&nbsp;'+cnName+'</label></li>');
    	});
    });
	$("#all_field_hall input:checkbox:checked").each(function() {
    	var parent = $(this).parent();
    	var cnName = parent.text();
	    $("#choose_field_hall").append('<li><label>&nbsp;'+cnName+'</label></li>');
	});

	
}

function appendFrameLi(id,cusChan,channelSelectdIds){
	if(isEmptyObject(channelSelectdIds) || channelSelectdIds.length==0){
		if(cusChan.choice==1){
			$("#"+id).append('<li><label><input type="checkbox" value="'+cusChan.id+'" checked />&nbsp;'+cusChan.cnName+'</label></li>');
		}else{
			$("#"+id).append('<li><label><input type="checkbox" value="'+cusChan.id+'"/>&nbsp;'+cusChan.cnName+'</label></li>');
		}	
	}else{
		if(channelSelectdIds.indexOf(cusChan.id)>-1){
			$("#"+id).append('<li><label><input type="checkbox" value="'+cusChan.id+'" checked />&nbsp;'+cusChan.cnName+'</label></li>');
		}else{
			$("#"+id).append('<li><label><input type="checkbox" value="'+cusChan.id+'"/>&nbsp;'+cusChan.cnName+'</label></li>');
		}	
	}
}





 