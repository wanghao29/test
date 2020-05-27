$(document).ready(function() {
	   title_tip();
	   //顶部菜单切换
	   $("#menu li").attr("class","drop");
	   $("#customerChannel").attr("class","active"); 
	   //城市选择框、改变事件
	   $("#citySelect").change(function(){
		   clickCity();
	   });
	   //初始化厂商select2
	    $("#cusOrgacode").select2({});
		$("#cusOrgacode").on("select2:select",function(e){ 
	    	clickCustomer();
		});

	   
		$("#customizationModalShow").click(function() {
			  $("#frame_type1").height(340);
			  $("#frame_type2").height(340);
			  $("#frame_type3").height(340);
			  $("#frame_type4").height(340);
			  $("#frame_type5").height(340);
			  $("#frame_type6").height(340);
			
			$('#customizationModal').modal('show');
			 
		});
    
	    
	    $(".typeOrder").click(function(){  
		    var order = $(this).attr("order");
		    order = parseInt(order) -1;
		    var opera = $(this).attr("opera");
		    if("prev"==opera){
		    	var obj = typeOrder[order];
		    	typeOrder[order] = typeOrder[order-1];
		    	typeOrder[order-1] = obj;
		    }else{
		    	var obj = typeOrder[order];
		    	typeOrder[order] = typeOrder[order+1];
		    	typeOrder[order+1] = obj;
		    }
		    
		    defaultIdentityCustomizationIds = [];
		    $("#frame_type_all input:checkbox:checked").each(function() {
		    	defaultIdentityCustomizationIds.push(parseInt($(this).attr("name")));
		    });
		    
		    lyoutFrame();
	    });

});

var defaultIdentityCustomizationIds;
var allUsefulField;

var typeNameMap={};
typeNameMap['1'] = "消费者特性分布";
typeNameMap['2'] = "流量特性";
typeNameMap['3'] = "流速特性";
typeNameMap['4'] = "流向特性";
typeNameMap['5'] = "提货偏好";
typeNameMap['6'] = "厂家信息";

var typeOrder;




//画像布局
function lyoutBody(data){
	var type1 = new Array();
	var type2 = new Array();
	var type3 = new Array();
	var type4 = new Array();
	var type5 = new Array();
	var type6 = new Array();
	
	$.each(data, function(idx, cusChan) {
	    if(cusChan.type==typeOrder[0]){
	    	type1.push(cusChan);
	    }else if(cusChan.type==typeOrder[1]){
	    	type2.push(cusChan);
	    }else if(cusChan.type==typeOrder[2]){
	    	type3.push(cusChan);
	    }else if(cusChan.type==typeOrder[3]){
	    	type4.push(cusChan);
	    }else if(cusChan.type==typeOrder[4]){
	    	type5.push(cusChan);
	    }else if(cusChan.type==typeOrder[5]){
	    	type6.push(cusChan);
	    }
	});
	
	if(shouldShowType(type1)){
		var len = addTitle(typeNameMap[typeOrder[0]],"type1");
		$.each(type1, function(idx, cusChan) {
            addShape("type1",cusChan,idx+len+1);
		});
		addButtonScorll("type1");
	}
	if(shouldShowType(type2)){
		var len = addTitle(typeNameMap[typeOrder[1]],"type2");
		$.each(type2, function(idx, cusChan) {
            addShape("type2",cusChan,idx+len+1);
		});
		addButtonScorll("type2");
	}
	if(shouldShowType(type3)){
		var len = addTitle(typeNameMap[typeOrder[2]],"type3");
		$.each(type3, function(idx, cusChan) {
            addShape("type3",cusChan,idx+len+1);
		});
		addButtonScorll("type3");
	}
	if(shouldShowType(type4)){
		var len = addTitle(typeNameMap[typeOrder[3]],"type4");
		$.each(type4, function(idx, cusChan) {
            addShape("type4",cusChan,idx+len+1);
		});
		addButtonScorll("type4");
	}
	if(shouldShowType(type5)){
		var len = addTitle(typeNameMap[typeOrder[4]],"type5");
		$.each(type5, function(idx, cusChan) {
            addShape("type5",cusChan,idx+1+len);
		});
		addButtonScorll("type5");
	}
	if(shouldShowType(type6)){
		var len = addTitle(typeNameMap[typeOrder[5]],"type6");
		$.each(type6, function(idx, cusChan) {
            addShape("type6",cusChan,idx+1+len);
		});
		addButtonScorll("type6");
	}
}

//至少存在一个showtype不等于1、0
function shouldShowType(type){
	if(type.length>0){
	    for(var i=0;i<type.length;i++){
	    	if(type[i].showType!=0 && type[i].showType!=1){
	    		return true;
	    	}
	    }
	}
	return false;
}

//追加标题栏，如基础特性;以及下面的一行div
function addTitle(name,rowType,id){
	   if($("#"+rowType).length > 0) {
		    return $("."+rowType).length;
	   }
	   if(id==null||id==""){
		   id="body";
	   } 
	   //$("#"+id).append('<div class="row"> <p>|'+name+'</p></div>');
	   $("#"+id).append('<div class="row"> <p><span id="'+rowType+'_title" style="color: #67f8ff;">||'+name+'</span><span style="color: #ffffff;"></span></p></div>');
	   $("#"+id).append('<div class="row" style="border: 1px solid #558baf;">'+
			   '<ul class="list-li-3 mt-20 clearfix"  style="height: 100%;" id="'+rowType+'"></ul></div>');	
	   return 0;
}	      

//在指定的row行中 展示对象对应的图形
function addShape(rowType,cusChan,idx){
	   if(cusChan.showType!=0 && cusChan.showType!=1){
		   var uuid = guid();   //作为row里面防止小图形的div的id，防止重复
		   var tip = isEmptyObject(cusChan)?"":((cusChan.tip==null)?"":cusChan.tip);
		   $("#"+rowType).append('<li id="'+rowType+'_'+idx+'" class="rowType '+rowType+'" cusChanId="'+cusChan.id+'"><div class="box"><div class="box-head"><div class="title" title="'+tip+'">'+cusChan.cnName+'</div></div>'+
	            '<div class="box-content" id="'+uuid+'" style="height: 340px;margin-top: 0px;"></div></div></li>');	   	  	   	   
		  var paint = initEcharts(echarts,uuid);	
		  
	      if(cusChan.showType==2){ //曲线图
		   	   if(isEmptyObject(cusChan.detail) || isEmptyObject(cusChan.value)){
		   		   if(idx>3){
		   			   $("#"+rowType+"_"+idx).hide();
		   		   }
				   return;
			   }

		 	   var detail = (cusChan.detail).split(',');
			   var value = (cusChan.value).split(',');

			   var option = buildLineAreaChart3(); 
			   $.each(detail, function(idx, item) {
				   option.xAxis.data.push(item);
			   });
			   
			   
			   //处理单位为天的、或求和
			   var unit = isEmptyObject(cusChan.unit)?"":cusChan.unit;		
			   
			   //求和的
			   var sum = 0;
			   $.each(value, function(idx, item) {
				   sum += parseFloat(item);			   
			   });			   
			   
			   //单位：万
			   if(wanMore(value)){
				   unit = "万"+unit;
				   sum = toDecimal2(sum)+'万';
			   }else if(String(sum).indexOf(".")!=-1){
				   sum = (sum/1).toFixed(2);
			   }
			   
			   option.title.text = "总计："+sum;
			   option.yAxis.axisLabel.formatter = '{value}'+unit;
			   option.series[0].label.formatter = '{c}'+unit;	
			   //当前月强调
			   $.each(value, function(idx, item) {
				   if(String(item).indexOf(".")!=-1){
					   item = (item/1).toFixed(2);
				   }
				   if(wanMore(value)){
					   item = toDecimal2(item);
				   }				  
				  option.series[0].data.push(item);			   
			   });	   
			   paint.setOption(option);		    	  
		   }
	      
	      if(cusChan.showType==3){ //环形图
		   	   if(isEmptyObject(cusChan.detail) || isEmptyObject(cusChan.value)){
		   		   if(idx>3){
		   			   $("#"+rowType+"_"+idx).hide();
		   		   }
				   return;
			   }
		   	   
			   var detail = (cusChan.detail).split(',');
			   var value = (cusChan.value).split(',');
			   
			   var option = buildChartOptionAnnulus(); 
		       for(var i=0; i<detail.length;i++){
		    	   
            	   var det = detail[i];
            	   if(det.length>9){
            		   var detPrev = det.substring(0,9);
            		   var detNext = det.substring(9);
            		   det = detPrev +"\n"+detNext
            	   }
		    	   
		    	   option.series[0].data.push({value:value[i], name:det});
		       }
	
		       option.series[0].center=['40%', '50%'];
		       paint.setOption(option);		   
		   }
	      
	      if(cusChan.showType==4){ //柱状图
		   	   if(isEmptyObject(cusChan.detail) || isEmptyObject(cusChan.value)){
		   		   if(idx>3){
		   			   $("#"+rowType+"_"+idx).hide();
		   		   }
				   return;
			   }
		   	   
		 	   var detail = (cusChan.detail).split(',');
			   var value = (cusChan.value).split(',');
			   
			   var option = oneBar();
			   $.each(detail, function(idx, item) {
				   option.xAxis[0].data.push(item);
			   });
			   
			   var isNormal = true;
			   $.each(value, function(idx, item) {
				   if (isNaN(parseFloat(item))){              //处理特殊柱状图  单点促销能力 
					   isNormal = false;
					   
					   option.xAxis[0].axisLabel.rotate=0;
					   option.xAxis[0].axisLabel.fontSize=16;
					   option.grid.y=60;
	            	   if(item.length>6){
	            		   var detPrev = item.substring(0,6);
	            		   var detNext = item.substring(6);
		            	   if(detNext.length>6){
		            		   var detPrev2 = detNext.substring(0,6);
		            		   var detNext2 = detNext.substring(6);
			            	   if(detNext2.length>6){
			            		   var detPrev3 = detNext2.substring(0,6);
			            		   var detNext3 = detNext2.substring(6);
				            	   if(detNext3.length>6){
				            		   var detPrev4 = detNext3.substring(0,6);
				            		   var detNext4 = detNext3.substring(6);
				            		   detNext3 = detPrev4 +"\n"+detNext4;
				            	   }
			            		   detNext2 = detPrev3 +"\n"+detNext3;
			            	   }
		            		   detNext = detPrev2 +"\n"+detNext2;
		            	   }
	            		   item = detPrev +"\n"+detNext
	            	   }
					   item = {value:1,label:{formatter:item}};
				   }				 
				   
				   if(!isNaN(parseFloat(item)) && wanMore(value)){
					   item = toDecimal2(item);
				   }
				   option.series[0].data.push(item);				   
			   });
			   
			   if(isNormal){
				   var unit = isEmptyObject(cusChan.unit)?"":cusChan.unit;	
				   
				   //单位：万
				   if(wanMore(value)){
					   //option.series[0].label.normal.formatter = '{c}万';
					   option.title.text = "单位：万"+unit;
					   option.tooltip.formatter = "{b} :<br/> {c}万"+unit;
				   }else{
					   option.title.text = "单位："+unit;
					   option.tooltip.formatter = "{b} :<br/> {c}"+unit;
				   }
			   }else{
				   option.grid.y=100;
			   }
			   
			   option.series[0].barWidth=20;
		       paint.setOption(option);	   
		  }
	      
	      if( cusChan.showType==5){ //饼图
		   	   if(isEmptyObject(cusChan.detail) || isEmptyObject(cusChan.value)){
		   		   if(idx>3){
		   			   $("#"+rowType+"_"+idx).hide();
		   		   }
				   return;
			   }	   
			   var detail = (cusChan.detail).split(',');
			   var value = (cusChan.value).split(',');
			   
			   var option = buildChartOption2(); 
		       for(var i=0; i<detail.length;i++){
		    	   option.series[0].data.push({value:value[i], name:detail[i]});
		       }
	
		       option.series[0].center=['40%', '50%'];
		       paint.setOption(option);		   
		   }
	      
	      if(cusChan.showType==6){ //top图
		   	   if(isEmptyObject(cusChan.detail) || isEmptyObject(cusChan.value)){
		   		   if(idx>3){
		   			   $("#"+rowType+"_"+idx).hide();
		   		   }
				   return;
			   }
		 	   var detail = (cusChan.detail).split(',');
			   var value = (cusChan.value).split(',');
			   
			   var option = echarts_top();
               for(var a=detail.length-1;a>=0;a--){
            	   var det = detail[a];
            	   if(det.length>12){
            		   var detPrev = det.substring(0,12);
            		   var detNext = det.substring(12);
            		   det = detPrev +"\n"+detNext
            	   }
            	   option.yAxis.data.push(det);
               }
               
               for(var b=value.length-1;b>=0;b--){
            	   option.series[0].data.push(Math.round(value[b]));
               }
			   
		       paint.setOption(option);	   
		  }

	   }
	   
	   if(idx>3){
		   $("#"+rowType+"_"+idx).hide();
	   }

	  
      if(cusChan.showType==1){ //键值对
    	  $("#"+rowType+"_title").next().append("&nbsp;&nbsp;<span style='color:#67f8ff;'>|</span>&nbsp;&nbsp;"+cusChan.cnName+":"+cusChan.value+"&nbsp;");
	   }	   
}

function addButtonScorll(rowType){
	
   if($("."+rowType+'_button').length > 0) {
	   $("."+rowType+'_div').remove();
   } 
	
   $("#"+rowType).prepend(
	   '<li style="width:1.5%;margin-right:0px;" class="'+rowType+'_div">'+
	        '<div class="box">'+
	        '<div class="box-head">&nbsp;</div>'+
			'<div class="box-content" style="height:340px;width:100%;">'+
				'<button type="button" opera="prev" class="left1_btn '+rowType+'_button" '+
				'style="width:80%;height:26%;margin-top:120px;"></button>'  + 			
			'</div>'+
			'</div>'+
		'</li>'
   );	 
   
   $("#"+rowType).append(
		   '<li style="width:1.5%;margin-right:0px;padding-right:0px;float: right;" class="'+rowType+'_div">'+
		        '<div class="box">'+
		        '<div class="box-head">&nbsp;</div>'+
				'<div class="box-content" style="height:340px;width:100%;">'+
					'<button type="button" opera="next" class="right1_btn '+rowType+'_button" '+
					'style="width:80%;height:26%;margin-top:120px;"></button>'  + 			
				'</div>'+
				'</div>'+
			'</li>'
	);	   
   
   $("."+rowType+"_button").click(function(){
	    var oper = $(this).attr("opera");
	    var length = $("."+rowType).length;
	    var lastShow;
	    var showNum = 0;
	    $("."+rowType).each(function(idx,item) {
	    	if(!$(this).is(":hidden")){
	    		lastShow = parseInt($(this).attr("id").substring(6)); 
	    		showNum = showNum+1;	
	    	}
	    });
        
        var fristShow = parseInt(lastShow-showNum+1);
        if("prev"==oper){        	
        	if(fristShow>1){
        		$("#"+rowType+"_"+(fristShow-1)).show();
        		$("#"+rowType+"_"+(lastShow)).hide();
        	}else{
        		return;
        		//alert("前面不存在画像");
        	}
        }else{
        	if(lastShow<length){
        		$("#"+rowType+"_"+(fristShow)).hide();
        		$("#"+rowType+"_"+(lastShow+1)).show();
        	}else{
        		return;
        		//alert("后面不存在画像");
        	}
        }
	});
  
}





//生成uuid
function guid() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
        return v.toString(16);
    });
}



//弹框
function lyoutFrame(){
	
	for(var i=1; i<typeOrder.length+1;i++){
		$("#frame_type"+i+"_title").text(typeNameMap[typeOrder[i-1]]);
	}
	
	$("#frame_type1").html("");
	$("#frame_type2").html("");
	$("#frame_type3").html("");
	$("#frame_type4").html("");
	$("#frame_type5").html("");
	$("#frame_type6").html("");
	
	
	$.each(allUsefulField, function(idx, cusChan) {
	    if(cusChan.type==typeOrder[0]){
	    	appendFrameLi("frame_type1",cusChan);
	    }else if(cusChan.type==typeOrder[1]){
	    	appendFrameLi("frame_type2",cusChan);
	    }else if(cusChan.type==typeOrder[2]){
	    	appendFrameLi("frame_type3",cusChan);
	    }else if(cusChan.type==typeOrder[3]){
	    	appendFrameLi("frame_type4",cusChan);
	    }else if(cusChan.type==typeOrder[4]){
	    	appendFrameLi("frame_type5",cusChan);
	    }else if(cusChan.type==typeOrder[5]){
	    	appendFrameLi("frame_type6",cusChan);
	    }
	});
 
    //弹框中复选框改变时更新表格
    $("#frame_type_all input[type='checkbox']").click(function(){  
	    var lessThree = lyoutTable();
	    if(lessThree==false){
	    	$(this).prop("checked",false);
	    	alert("每个特征分类最多选择三项");
	    }
    });
    
	lyoutTable();
}

function appendFrameLi(id,cusChan){
	if(defaultIdentityCustomizationIds.indexOf(cusChan.id)>-1){
		$("#"+id).append('<li><input type="checkbox" style="background-color:#3f6ba2;border: 1px solid #558baf!important;" '+
				'name="'+cusChan.id+'" value="'+cusChan.cnName+'" checked/>&nbsp;'+cusChan.cnName+'</li>');
		return true;
	}else{
		$("#"+id).append('<li><input type="checkbox" style="background-color:#3f6ba2;border: 1px solid #558baf!important;" '+
				'name="'+cusChan.id+'" value="'+cusChan.cnName+'"/>&nbsp;'+cusChan.cnName+'</li>');
		return false;
	}	
}

//动态展示弹框中的table
function lyoutTable(){
	
	$("#frame_tb_thead_tr").html("");
	for(var i=1; i<typeOrder.length+1;i++){		
		var title = typeNameMap[typeOrder[i-1]];
		$("#frame_tb_thead_tr").append('<td id="">'+title+'</td>');
	}
	
	var frame_tb_type1 = new Array();
	var frame_tb_type2 = new Array();
	var frame_tb_type3 = new Array();
	var frame_tb_type4 = new Array();
	var frame_tb_type5 = new Array();
	var frame_tb_type6 = new Array();
	
	$("#frame_type1 input:checkbox:checked").each(function() {
		var val = $(this).val();
		frame_tb_type1.push(val);
	});
	$("#frame_type2 input:checkbox:checked").each(function() {
		var val = $(this).val();
		frame_tb_type2.push(val);
	});
	$("#frame_type3 input:checkbox:checked").each(function() {
		var val = $(this).val();
		frame_tb_type3.push(val);
	});
	$("#frame_type4 input:checkbox:checked").each(function() {
		var val = $(this).val();
		frame_tb_type4.push(val);
	});
	$("#frame_type5 input:checkbox:checked").each(function() {
		var val = $(this).val();
		frame_tb_type5.push(val);
	});
	$("#frame_type6 input:checkbox:checked").each(function() {
		var val = $(this).val();
		frame_tb_type6.push(val);
	});
	
	var arr = new Array(frame_tb_type1.length,frame_tb_type2.length,frame_tb_type3.length,
				frame_tb_type4.length,frame_tb_type5.length,frame_tb_type6.length);
	var maxLen = 0;
	$.each(arr, function(idx, val) {
        if(maxLen<val){
        	maxLen = val;
        }
	});
	
//	if(maxLen>3){
//		return false;
//	}
	
	$("#frame_tb_tbody").html(''); 
	for(var i=0; i<maxLen; i++){
		$("#frame_tb_tbody").append('<tr id="frame_tb_tr'+i+'" ></tr>'); 
		
		$("#frame_tb_tr"+i).append('<td id="frame_tb_td1'+i+'"></td>'); //1
		if(frame_tb_type1.length>=i){
			$("#frame_tb_td1"+i).append(frame_tb_type1[i]);
		}
		
		$("#frame_tb_tr"+i).append('<td id="frame_tb_td2'+i+'"></td>'); //2
		if(frame_tb_type2.length>=i){
			$("#frame_tb_td2"+i).append(frame_tb_type2[i]);
		}
		
		$("#frame_tb_tr"+i).append('<td id="frame_tb_td3'+i+'"></td>'); //3
		if(frame_tb_type3.length>=i){
			$("#frame_tb_td3"+i).append(frame_tb_type3[i]);
		}
		
		$("#frame_tb_tr"+i).append('<td id="frame_tb_td4'+i+'"></td>'); //4
		if(frame_tb_type4.length>=i){
			$("#frame_tb_td4"+i).append(frame_tb_type4[i]);
		}
		
		$("#frame_tb_tr"+i).append('<td id="frame_tb_td5'+i+'"></td>'); //5
		if(frame_tb_type5.length>=i){
			$("#frame_tb_td5"+i).append(frame_tb_type5[i]);
		}
		
		$("#frame_tb_tr"+i).append('<td id="frame_tb_td6'+i+'"></td>'); //6
		if(frame_tb_type6.length>=i){
			$("#frame_tb_td6"+i).append(frame_tb_type6[i]);
		}
		
	}
	
}

//厂商
function showCusOrgacode(customers){	
	var id = "cusOrgacode";
    
    $("#"+id).empty();     
    $("#"+id).select2({    	
    	data:customers,    	
    });
    $("#"+id).off("select2:select");
    $("#"+id).on("select2:select",function(e){ 
    	clickCustomer();
	});
    

    //属性：    	
    //minimumResultsForSearch: Infinity, // 隐藏搜索框
	//minimumInputLength: 10,  //最小需要输入多少个字符才进行查询
	//multiple:false,
	//maximumSelectionLength: 3,  // 多选 - 设置最多可以选择多少项 (多选、不能有一项为空值，否则再清空时会出BUG   	
	//placeholder:'请选择',
    //$("#"+id).append("<option value=''>选择品牌</option>"); 
	//data:list<vo>,//vo中有属性id、text
	//language: "zh-CN",
	//width: "100%",   	
	//allowClear:true,  //是否允许清空选中
    //方法
    //$("#select2-id").select2("destroy"); //移除select2
    //$("#select2-id").empty();      //清空下拉框列表值
    //var selected = $("#"+id).select2("data");//选择项的整个选中的对象
    //$("#cusOrgacode").find("option:selected").text();
    //$("#select2-id").val(['value1','value2']).trigger("change"); //赋值、根据text
    //$("#id option:contains("值").attr("selected", true).trigger("change"); //赋值、根据text
    //$("#select2-id").append($("<option>", {value: 'value1', text: 'text1'}));  
    
}


function wanMore(values) { 
	var isMore = false;
	$.each(values, function(idx, x) {		
		if(!isNaN(x) && x>=10000){
			isMore =  true;
		}
	});
	return isMore;
}

function toDecimal2(x) { 
    if (x==0) { 
        return 0; 
    } 	
    var f = parseFloat(x); 
    if (isNaN(f)) { 
      return 0; 
    }     
    return (f/10000).toFixed(2);
}



//echarts top图
function echarts_top(){
	option = {
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'shadow'
		        }
		    },
		    grid: {
		    	top:'0%',
		        left: '3%',
		        right: '10%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis: {
		        type: 'value',
		        show:true,
		        splitLine:{show: false},//去除网格线
	            axisLabel:{
	                color:'#fff',
	                fontSize:20,
	            },
	            axisLine:{
	                lineStyle:{
	                    color:'#fff'
	                }
	            },
		    },
		    yAxis: {
		        type: 'category',
	            axisLabel:{
	                color:'#fff',
	                fontSize:16,
	            },
	            axisLine:{
	                lineStyle:{
	                    color:'#fff'
	                }
	            },
		        data: []
		    },
		    series: [
		             {
		                type: 'bar',
		                barWidth : 40,//柱图宽度
		                data: [],
		                itemStyle: {
		                    normal:{
		                    	color:'#67f8ff',//'#246cac',
		                    }
		                },
		                lineStyle:{
		                	show:false,
		                },
		         		label: {
		                    normal: {
		                        textStyle: {		                        	
		                            color: 'yellow',//'#fff', 
		                            fontSize:25,
		                        },
		                        show:true,
		                        position: 'right',
		                        formatter:' {c}',
		                    }
		                },
		             },
		         ]
		};
	return option;
}

//曲线图
function buildLineAreaChart3(){
	var option = {
			   title:{
				   text:'',
		           left:'center',
		           textStyle:{
		               //文字颜色
		               color:'#ccc',
		               //字体风格,'normal','italic','oblique'
		               fontStyle:'normal',
		               //字体粗细 'normal','bold','bolder','lighter',100 | 200 | 300 | 400...
		               fontWeight:'bold',
		               //字体系列
		               fontFamily:'sans-serif',
		               //字体大小
		               fontSize:18,
		           }
			   },
			   color: ['#3398DB'],
			   tooltip: {
		            trigger: 'axis',
		            axisPointer: {   //十字线鼠标浮动提示
		                type: 'cross',
		                label: {
		                    backgroundColor: '#6a7985',
		                    fontSize:18,
		                }
		            },
		            //formatter:'{b} <br/>{a}：{c}'
		            formatter:'{b}:<br/>{c}'
		        },
		        grid: {
		            left: '5%',
		            right: '10%',
		            bottom: '5%',
		            top:'15%',
		             
		            containLabel: true
		        },
			    xAxis :  {
			        	type: 'category',
			            boundaryGap: false,
			            axisLabel:{
			                color:'#fff',
			                fontSize:18,
			            },
			            axisLine:{
			                lineStyle:{
			                    color:'#fff'
			                }
			            },
			            data : []
			        } ,
			    yAxis : {
			         show:true,
			            type: 'value',
			            axisLabel:{
			                color:'#fff',
			                fontSize:18,
			            },
			            axisLine:{
			                lineStyle:{
			                    color:'#fff'
			                }
			            },
			            axisTick:{
			                show:false
			            },
			            splitLine:{
			                show:false
			            }
			    },
			    series : [
			        {
			            name:'人数',
			            type:'line',
			            smooth:true,//平滑曲线
			            itemStyle: {
			            	normal: {
			            		areaStyle: {
			            			type: 'default',
			            			color:'#aed4c2'
			            		}
			            	}
			            },
		                label: {
		                	color:'yellow',
		                	fontSize:20,
		                    show: true,
		                    formatter: '{c}'
		                }, 
		                markPoint: {
		                    data: [], //[{name: '当前月',value: '', xAxis: 6, yAxis: 0}]
		                    //symbol:'none',
		                },
			            data:[]  //data: [{value:820,label: {color: 'blue', fontSize:'16',fontSize:'26'}...},
			        }
			    ]
			};
	 return option;
}

//饼图
function buildChartOption2() {
    var option = {
      title : {
    		        text: ' ',
    		        subtext: ' ',
    		        x:'left',
    		        textStyle: {
    		            fontSize: 18,
    		            fontWeight: 'bolder',
    		            color: '#fff'
    		        }
    	},
        tooltip: {
            trigger: 'item',
            //formatter: "{a} <br/>{b} : {c}人 ({d}%)"
            formatter: "{b}:<br/>{d}%"
        },
        legend: {
            data: [],
            selected: {
                /*'降水量' : false*/
            } ,
        textStyle:{color: '#fff'}
        },
        //'#199ff4','#da9c00','#5760ff','#6f32cd','#9dff5c','#5bfdff'
        color:['#FFCC66','#FF9900','#FF9966','#CC3300','#996666','#FFCCCC','#FFFF33'],
        series: [
            {
                name: '人数',
                type: 'pie',
                radius: '60%',
                center: ['50%', '55%'],
                selectedMode: 'single',
                data: [],
                itemStyle: {
                    normal: {
                        labelLine: {
                            length: 1
                        },
                        label: {
                            show: true,
                            fontSize:18,
                            /*formatter: '{b}:{d}%'*/
                            formatter: '{b}:({d}%)',
                            textStyle: {
                                color: 'yellow',
                            }
                        }
                    },
                }
            }
        ]
    };
    return option;
};
 