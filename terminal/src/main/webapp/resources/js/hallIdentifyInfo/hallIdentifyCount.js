$(document).ready(function() {
	   title_tip();
	   //带搜索的下拉框样式初始化
	   $('.select_searchable').searchableSelect();
	   //时间控件设置初始时间
	  // $(".prevMonth").val(getPrevMonthValue());
	   $("#startMonth").val("201904");
	   $("#endMonth").val("201910");
	   //城市下拉框初始化
	   citySelectInit($('#citySelect'));
	   //顶部菜单切换
	   $("#menu li").attr("class","drop");
	   $("#hallIdentifyInfo").attr("class","active");  
	   
	   //	   
	   $("#citySelect").change(function(){
		   pageInit();
	   });

});

function showPortrays(portrays){	
	for(var i=0;i<portrays.length;i++){
		var portray = portrays[i];		
		var id = portray.name;		
		resetDiv($("#"+id));		
		if(isEmptyObject(portray.detail) || isEmptyObject(portray.value)){  //
			continue;
		}

		var paint = initEcharts(echarts,id);		
	    if(portray.showType==2){ //曲线图	    	
	 	   var detail = (portray.detail).split(',');
		   var value = (portray.value).split(',');

		   var index = getSeriesIndex(detail,$(".prevMonth").val());
		   var option = buildLineAreaChart2(); 
		   $.each(detail, function(idx, item) {
			   option.xAxis.data.push(item);
		   });
		   
		   //单位：万
		   if(wanMore(value)){
			   option.yAxis.axisLabel.formatter = '{value}万';
			   option.series[0].label.formatter = '{c}万';			   
		   }
		   //当前月强调
		   $.each(value, function(idx, item) {
			   if(wanMore(value)){
				   item = toDecimal2(item);
			   }
			   
			   if(index==idx){
				   var obj = {value:item,label: {color: 'yellow', fontSize:'16',fontSize:'26'}};
				   option.series[0].data.push(obj);
			   }else{
				   option.series[0].data.push(item);
			   }			   
		   });	   
		   paint.setOption(option);			   		   
/*	    	
 		   paint.dispatchAction({
		    	  type: 'showTip',
		    	  seriesIndex: 1,
		    	  dataIndex: index,
		   });
*/
		} 
	}	
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
	     