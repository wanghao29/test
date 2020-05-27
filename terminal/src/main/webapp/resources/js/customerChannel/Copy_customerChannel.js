$(document).ready(function() {	   
	   
	   var sexPaint = initEcharts(echarts,"sexShow");
	   var agePaint = initEcharts(echarts,"ageShow");
	   var sellPaint = initEcharts(echarts,"sellShow");
	   var guestFlowPaint = initEcharts(echarts,"guestFlowShow");
	   var retailTopPaint = initEcharts(echarts,"retailTopShow");
	
	   
	   var sexOption = buildChartOptionAnnulus();//性别分布
	   var ageOption = oneBar();//年龄分布
	   var sellOption = oneBar();///消费水平分布 
	   var guestFlowOption = buildLineAreaChart();//客流量趋势
	   var retailTopOprion = buildChartOptionTopBar();//门店零售TOP5
	 
	   
	   
	   
	   
	   sexOption.series[0].data.push({value:35, name:'线上'},{value:65, name:'65%'});
	   sexOption.series[0].center=['40%', '50%'];
 
	   ageOption.grid.x = '-10%';
	   ageOption.grid.x2 = '16%';
	   ageOption.grid.y = '10%';
	   ageOption.grid.y2 = '30px';
	   ageOption.xAxis[0].data.push('18岁以下','19-25','26-35','36-45','46-55','55以上');
	   ageOption.series[0].data.push(9.0, 26.4, 28.7, 70.7, 155.6,  48.7);
	   
	   sellOption.grid.x = '-20%';
	   sellOption.grid.y = '20%';
	   sellOption.xAxis[0].data.push('中高端','中端','低端');
	   sellOption.grid.y = '10%';
	   sellOption.grid.y2 = '30px';
	   sellOption.series[0].data.push(70.7, 155.6,  48.7);
	   
	   guestFlowOption.xAxis.data.push('07-01','07-02','07-03','07-04','07-05','07-06','07-07','07-08','07-09','07-10');
	   guestFlowOption.series[0].data.push(80,100, 120, 21, 54, 260,150, 830, 710, 700);
	   
	   
	   
	   retailTopOprion.yAxis.data.push('门店A',' 门店B',' 门店C','门店D','门店E')//升序
	   retailTopOprion.series[0].data.push(1, 1, 1, 1, 1);
	   retailTopOprion.series[1].data.push(0.111, 0.333, 0.444, 0.555, 0.777);//升序
	   retailTopOprion.series[1].label.normal.formatter = function(data) {
           return (retailTopOprion.series[1].data[data.dataIndex] ).toFixed(1) + '万台';
       };
       retailTopOprion.series[2].data.push(20000000, 30000000, 40000000, 50000000,91230000);//升序
       retailTopOprion.series[2].label.normal.formatter = function(data) {
           //富文本固定格式{colorName|这里填你想要写的内容}
           /*  return paiming[data.dataIndex] == 1 ? '{yellow|' + zongjine[data.dataIndex] / 10000 + '}{black|万元,已分配金额:}' + '{green|' + fenpeijine[data.dataIndex] / 10000 + '万元}' : ' {start2|}{black|' + paiming[data.dataIndex] + '  ' + city[data.dataIndex] + '}' + '{black|总金额:}{yellow|' + zongjine[data.dataIndex] / 10000 + '}{black|万元,已分配金额:}' + '{green|' + fenpeijine[data.dataIndex] / 10000 + '万元}';*/
             
      	   switch(  data.dataIndex){
			   case 4:  
				   return ' {yellow|TOP1' +retailTopOprion.yAxis.data[data.dataIndex]+'}';
			   	break;
			   case 3:  
				   return ' {yellow|TOP2' +retailTopOprion.yAxis.data[data.dataIndex]+'}';
			   	break;
			   case 2:  
				   return ' {yellow|TOP3' +retailTopOprion.yAxis.data[data.dataIndex]+'}';
			   	break;
			   case 1:  
				   return ' {yellow|TOP4' +retailTopOprion.yAxis.data[data.dataIndex]+'}';
			   	break;
			   case 0:  
				   return ' {yellow|TOP5' +retailTopOprion.yAxis.data[data.dataIndex]+'}';
			   	break;
      	   
      	   }
      	   
         };
       
       
       
	 
	   
	   
	   
	
	   sexPaint.setOption(sexOption);
	   agePaint.setOption(ageOption);
	   sellPaint.setOption(sellOption);
	   guestFlowPaint.setOption(guestFlowOption);
	   retailTopPaint.setOption(retailTopOprion);
});


 