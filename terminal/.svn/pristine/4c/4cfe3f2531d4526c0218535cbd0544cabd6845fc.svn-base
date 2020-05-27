function showThePortray(paint,cusChan,curMonth){
    if(cusChan.showType==2){ //曲线图
	   	   if(isEmptyObject(cusChan.detail)){
			   return;
		   }
		   if(isEmptyObject(cusChan.value)){
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
		   					   
		   //单位：万
		   if(wanMore(value)&&cusChan.cnName!="渠道销售平均DOU"){
			   unit = "万"+unit;
			   option.yAxis.axisLabel.formatter = '{value}'+unit;
			   option.series[0].label.formatter = '{c}'+unit;
		   }else if  (cusChan.cnName!="渠道销售平均DOU"){
			   option.yAxis.axisLabel.formatter = '{value}'+unit;
			   option.series[0].label.formatter = '{c}'+unit;	 
			   
		   }
		   
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
			  if(curMonth==detail[idx]){
				  item = {value:item,label: {color: 'yellow',fontSize:'22'}};
			  }			  
			  option.series[0].data.push(item);			   
		   });	   
		   paint.setOption(option);		    	  
	 }
    
    if(cusChan.showType==3){ //环形图
	   	   if(isEmptyObject(cusChan.detail)){
			   return;
		   }
		   if(isEmptyObject(cusChan.value)){
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

	       option.series[0].center=['50%', '50%'];
	       paint.setOption(option);		   
	   }
    
    if(cusChan.showType==4){ //柱状图
	   	   if(isEmptyObject(cusChan.detail)){
			   return;
		   }
		   if(isEmptyObject(cusChan.value)){
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
				  // item = {value:1,label:{formatter:item}};
			   }				 
			   if(cusChan.cnName=="单品促销能力"){
        		   var arr=[]; 
        		   var value1 = (cusChan.value1).split(',');//数值	     					     			  
 				   var setValue =(cusChan.value).split(',');//名称
 				   for(var j=0;j<setValue.length;j++){
 					  var tt=setValue[j];
 				  if(tt!='0' && tt!=null){
 					 var ll=getSetValue(tt);
  				    arr.push(ll);
 				    
 				   }else{
 					  arr.push(tt);   
 					   
 				   }
 				  }
 				  
 				  
 			   
 			  // var are= setBrandValue(cusChan.value);
        	   for(var i=0;i<value1.length;i++){
        		   item = {value:value1[i],label:{formatter:arr[i]}};
        		   option.series[0].data.push(item);
        		   //option.series[0].label.formatter.push(setValue[i]);
        	   }
        	  
        	   }else {
			   if(!isNaN(parseFloat(item)) && wanMore(value)){
				   item = toDecimal2(item);
			   }
			   option.series[0].data.push(item);
        	   }
		   });
		   
		   if(isNormal){
			   var unit = isEmptyObject(cusChan.unit)?"":cusChan.unit;	
			   
			   //单位：万
			   if(wanMore(value)&&cusChan.cnName!="渠道销售平均DOU"){
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
	   	   if(isEmptyObject(cusChan.detail)){
			   return;
		   }
		   if(isEmptyObject(cusChan.value)){
			   return;
		   }	   
		   var detail = (cusChan.detail).split(',');
		   var value = (cusChan.value).split(',');
		   
		   var option = buildChartOption2(); 
	       for(var i=0; i<detail.length;i++){
	    	   option.series[0].data.push({value:value[i], name:detail[i]});
	       }

	       option.series[0].center=['50%', '50%'];
	       paint.setOption(option);		   
	   }
    
    if(cusChan.showType==6){ //top图
	   	   if(isEmptyObject(cusChan.detail)){
			   return;
		   }
		   if(isEmptyObject(cusChan.value)){
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
			            smooth:true,
			            itemStyle: {normal: {areaStyle: {type: 'default'}}},
		                label: {
		                	color:'#ffffff',
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




function getSetValue(valueT){
	var ppt=[];
	 if(valueT.length>6){
		   var detPrev = valueT.substring(0,6);
		   var detNext = valueT.substring(6);
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
  	 valueT = detPrev +"\n"+detNext
	 
	   return valueT;
	   }
	
	
	
	
}





