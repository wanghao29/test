var initEcharts = function (echarts,objNewStr) {
   /* if (objOld != null && objOld != "" && objOld != undefined) {
      //  objOld.dispose();
    }*/
    return echarts.init(document.getElementById(objNewStr));
};






//当父div只有当前这个子div时可用，重新获取div，清除echarts属性
function resetDiv(obj){
	var parent = obj.parent();
	var cla = obj.attr("class");
	var id = obj.attr("id");
	var style = obj.attr("style");
	var name = obj.attr("name");
	//parent.empty(obj);
	//parent.html("");
	obj.remove();
	parent.append('<div id="'+id+'" name="'+name+'" class="'+cla+'" style="'+style+'"></div> ');
};

//判断对象是否为空
function isEmptyObject(e) {
	for (var t in e)
		return !1;
	return !0
};

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
function getStartMonthValue(num){
	var myDate = new Date();
	myDate.setMonth(myDate.getMonth()-num);
	var year = myDate.getFullYear(); 
	var month = myDate.getMonth();//+1;
    while (month > 12) {
    	year++;
    	month -= 12;
    }
    if(month == 0){
    	year--;
    	month = 12;
    }
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
	return year+""+month;
}

//广东地市
var cityNameArray = new Array('广州','全省','深圳','韶关','珠海','汕头','佛山','江门','湛江','茂名','肇庆',
            '惠州','梅州','汕尾','河源','阳江','清远','东莞','中山','潮州','揭阳','云浮');
function citySelectInit(selectObj){
	$.ajax({
	    type: "post",
	    url:  basePath+"/queryCityList.do",
	    contentType: 'application/json',
	    dataType: "json",
	    async: false,
	    success: function(data){
	    	 $.each(data,function(index,item){
	    	    	selectObj.append("<option value='"+item.value+"'>"+item.value+"</option>"); 
	    	    });
	    }
	});
	
	
/*    $.each(cityNameArray,function(index,city){
    	selectObj.append("<option value='"+city+"'>"+city+"</option>"); 
    });	*/	
	
	
}

function indexOf(arr,item){
    for(var i=0;i<arr.length;i++){
	    if(arr[i]===item)
	    return i;
    }
    return -1;
}

function getSeriesIndex(arr,value){
	//var value = $(".prevMonth").val();
    var value_ = value.substring(0,4) +"-"+ value.substring(4);
    
    var item=indexOf(arr,value);
    if(item>-1){
    	return item;
    }

    var item_=indexOf(arr,value_)
    if(item_>-1){
    	return item_;
    }
}
//曲线图
function buildLineAndBarChart(){
	option = {
	        tooltip : {
	            trigger: 'axis',
	        },
	        grid: [
	            {x: '3%', y: '7%', width: '94%', height: '80%',x2:'1%', y2: '3%'},
	            ],
	        legend: {
	            data:['收入','累计进度'],
	            textStyle:{
	                color: '#fff',
	                fontSize:18
	            }
	        },
	        xAxis : [
	            {
	                type : 'category',
	                nameTextStyle:{
	                    fontSize:20
	                },
	                axisLabel:{
	               	
	                    textStyle:{
	                        color:'#fff',
	                        fontSize:12
	                    }
	                },
	                axisLine:{
	                    lineStyle:{
	                        color:'#fff',
	                        type:'dotted'
	                    }
	                },
	                //data : ["201801", "201802", "201803", "201804", "201805", "201806", "201807", "201808", "201809"]//months
	                data : []//months
	            }
	        ],
	        yAxis : [
	            {
	                type : 'value',
	                name : '收入(亿)',
	                nameTextStyle:{
	                    fontSize:12
	                },
	                axisLine: {
	                    show: true,
	                    lineStyle:{
	                        color:'#fff'
	                    }
	                },
	                splitLine: {
	                    show: false
	                },
	                axisLabel:{
	                    align:'left',
	                    margin:40,
	                    formatter: function (value) {
	                    	//"(百万)"
	                    	return value/100000000;
	                    },
	                    textStyle:{
	                        color:'#fff',
	                        fontSize:12
	                    }
	                }
	            },
	            {
	                type : 'value',
	                name : '累计进度(百分比)',
	                nameTextStyle:{
	                    fontSize:12
	                },
	                axisLine: {
	                    show: true,
	                    lineStyle:{
	                        color:'#fff'
	                    }
	                },
	                splitLine: {
	                    show: false
	                },
	                axisLabel:{
	                    align:'left',
	              /*      margin:20,*/
	                    // formatter: '{value} °C',
	                 /*   formatter: '{value} %',*/
	                    formatter: function (value) {
	                    	//"(百万)"
	                    	return value*100+"%";
	                    },
	                    textStyle:{
	                        color:'#fff',
	                        fontSize:12
	                    }
	                }
	            }
	        ],
	        series : [
	            {
	                name:'收入',
	                type:'bar',
	                barWidth: '15', //统计条宽度
	                itemStyle: {
	                    normal: {
	                        barBorderRadius: 15,
	                        color: '#61A8FF'
	                    },
	                },
	                data:[]//qnwcsrs
	            },
	            {
	                name:'累计进度',
	                type:'line',
	                yAxisIndex: 1,
	                itemStyle: {
	                    normal: {
	                        barBorderRadius: 15,
	                        color: '#61A8FF'
	                    },
	                },
	                data:[]//qnwcds
	            }
	        ]
	 };

	return option;
}






//三个仪表盘
function threeGauge(currentMonthWcqkzb,lastMonthWcqkzb,lastYearWcqkzb){
   var option = {
        tooltip : {
            formatter: "{a} <br/>{b} : {c}%"
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        series : [
            {
                name:'个性化仪表盘',
                type:'gauge',
                center : ['50%', '50%'],    // 默认全局居中
                // radius : [0, '120px'],
                startAngle: 140,
                endAngle : -140,
                min: 0,                     // 最小值
                max: 100,                   // 最大值
                precision: 0,               // 小数精度，默认为0，无小数点
                splitNumber: 10,             // 分割段数，默认为5
                axisLine: {            // 坐标轴线
                    show: true,        // 默认显示，属性show控制显示与否
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: [[0.2, 'lightgreen'],[0.4, 'orange'],[0.8, 'skyblue'],[1, '#ff4500']],
                        width: 30
                    }
                },
                axisTick: {            // 坐标轴小标记
                    show: true,        // 属性show控制显示与否，默认不显示
                    splitNumber: 5,    // 每份split细分多少段
                    length :8,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: '#eee',
                        width: 1,
                        type: 'solid'
                    }
                },
                axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                    show: true,
                    formatter: function(v){
                        switch (v+''){
                            case '10': return '弱';
                            case '30': return '低';
                            case '60': return '中';
                            case '90': return '高';
                            default: return '';
                        }
                    },
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#ffffff'
                    }
                },
                splitLine: {           // 分隔线
                    show: true,        // 默认显示，属性show控制显示与否
                    length :30,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                        color: '#eee',
                        width: 2,
                        type: 'solid'
                    }
                },
                pointer : {
                    length : '80%',
                    width : 8,
                    color : 'auto'
                },
                title : {
                    show : true,
                    offsetCenter: ['-65%', -25],       // x, y，单位px
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#ffffff',
                        fontSize : 16
                    }
                },
                detail : {
                    show : true,
                    backgroundColor: 'rgba(0,0,0,0)',
                    borderWidth: 0,
                    borderColor: '#ccc',
                    width: 100,
                    height: 40,
                    offsetCenter: ['-60%', 10],       // x, y，单位px
                    formatter:'{value}%',
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: 'auto',
                        fontSize : 30
                    }
                },
                data:[{value: currentMonthWcqkzb, name: '本月完成情况占比'}]
            },
            {
                name:'个性化仪表盘',
                type:'gauge',
                center : ['20%', '50%'],    // 默认全局居中
                // radius : [0, '100px'],
                startAngle: 140,
                endAngle : -140,
                min: 0,                     // 最小值
                max: 100,                   // 最大值
                precision: 0,               // 小数精度，默认为0，无小数点
                splitNumber: 10,             // 分割段数，默认为5
                axisLine: {            // 坐标轴线
                    show: true,        // 默认显示，属性show控制显示与否
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: [[0.2, 'lightgreen'],[0.4, 'orange'],[0.8, 'skyblue'],[1, '#ff4500']],
                        width: 30
                    }
                },
                axisTick: {            // 坐标轴小标记
                    show: true,        // 属性show控制显示与否，默认不显示
                    splitNumber: 5,    // 每份split细分多少段
                    length :8,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: '#eee',
                        width: 1,
                        type: 'solid'
                    }
                },
                axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                    show: true,
                    formatter: function(v){
                        switch (v+''){
                            case '10': return '弱';
                            case '30': return '低';
                            case '60': return '中';
                            case '90': return '高';
                            default: return '';
                        }
                    },
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#ffffff'
                    }
                },
                splitLine: {           // 分隔线
                    show: true,        // 默认显示，属性show控制显示与否
                    length :30,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                        color: '#eee',
                        width: 2,
                        type: 'solid'
                    }
                },
                pointer : {
                    length : '80%',
                    width : 8,
                    color : 'auto'
                },
                title : {
                    show : true,
                    offsetCenter: ['-65%', -25],       // x, y，单位px
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#ffffff',
                        fontSize : 16
                    }
                },
                detail : {
                    show : true,
                    backgroundColor: 'rgba(0,0,0,0)',
                    borderWidth: 0,
                    borderColor: '#ccc',
                    width: 100,
                    height: 40,
                    offsetCenter: ['-60%', 10],       // x, y，单位px
                    formatter:'{value}%',
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: 'auto',
                        fontSize : 30
                    }
                },
                data:[{value: lastMonthWcqkzb, name: '上月完成情况占比'}]
            },
            {
                name:'个性化仪表盘',
                type:'gauge',
                center : ['80%', '50%'],    // 默认全局居中
                // radius : [0, '100px'],
                startAngle: 140,
                endAngle : -140,
                min: 0,                     // 最小值
                max: 100,                   // 最大值
                precision: 0,               // 小数精度，默认为0，无小数点
                splitNumber: 10,             // 分割段数，默认为5
                axisLine: {            // 坐标轴线
                    show: true,        // 默认显示，属性show控制显示与否
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: [[0.2, 'lightgreen'],[0.4, 'orange'],[0.8, 'skyblue'],[1, '#ff4500']],
                        width: 30
                    }
                },
                axisTick: {            // 坐标轴小标记
                    show: true,        // 属性show控制显示与否，默认不显示
                    splitNumber: 5,    // 每份split细分多少段
                    length :8,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: '#eee',
                        width: 1,
                        type: 'solid'
                    }
                },
                axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                    show: true,
                    formatter: function(v){
                        switch (v+''){
                            case '10': return '弱';
                            case '30': return '低';
                            case '60': return '中';
                            case '90': return '高';
                            default: return '';
                        }
                    },
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#ffffff'
                    }
                },
                splitLine: {           // 分隔线
                    show: true,        // 默认显示，属性show控制显示与否
                    length :30,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                        color: '#eee',
                        width: 2,
                        type: 'solid'
                    }
                },
                pointer : {
                    length : '80%',
                    width : 8,
                    color : 'auto'
                },
                title : {
                    show : true,
                    offsetCenter: ['-65%', -25],       // x, y，单位px
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#ffffff',
                        fontSize : 16
                    }
                },
                detail : {
                    show : true,
                    backgroundColor: 'rgba(0,0,0,0)',
                    borderWidth: 0,
                    borderColor: '#ccc',
                    width: 100,
                    height: 40,
                    offsetCenter: ['-60%', 10],       // x, y，单位px
                    formatter:'{value}%',
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: 'auto',
                        fontSize : 30
                    }
                },
                data:[{value: lastYearWcqkzb, name: '去年同期完成情况占比'}]
            }
        ]
    };
    return option;
}

//标题不固定的三个仪表盘
function threeGauge2(currentMonthWcqkzb,lastMonthWcqkzb,lastYearWcqkzb,title){
    var option = {
        tooltip : {
            formatter: "{a} <br/>{b} : {c}%"
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        series : [
            {
                name:'个性化仪表盘',
                type:'gauge',
                center : ['50%', '50%'],    // 默认全局居中
                // radius : [0, '120px'],
                startAngle: 140,
                endAngle : -140,
                min: 0,                     // 最小值
                max: 100,                   // 最大值
                precision: 0,               // 小数精度，默认为0，无小数点
                splitNumber: 10,             // 分割段数，默认为5
                axisLine: {            // 坐标轴线
                    show: true,        // 默认显示，属性show控制显示与否
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: [[0.2, 'lightgreen'],[0.4, 'orange'],[0.8, 'skyblue'],[1, '#ff4500']],
                        width: 30
                    }
                },
                axisTick: {            // 坐标轴小标记
                    show: true,        // 属性show控制显示与否，默认不显示
                    splitNumber: 5,    // 每份split细分多少段
                    length :8,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: '#eee',
                        width: 1,
                        type: 'solid'
                    }
                },
                axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                    show: true,
                    formatter: function(v){
                        switch (v+''){
                            case '10': return '弱';
                            case '30': return '低';
                            case '60': return '中';
                            case '90': return '高';
                            default: return '';
                        }
                    },
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#ffffff'
                    }
                },
                splitLine: {           // 分隔线
                    show: true,        // 默认显示，属性show控制显示与否
                    length :30,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                        color: '#eee',
                        width: 2,
                        type: 'solid'
                    }
                },
                pointer : {
                    length : '80%',
                    width : 8,
                    color : 'auto'
                },
                title : {
                    show : true,
                    offsetCenter: ['-65%', -25],       // x, y，单位px
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#ffffff',
                        fontSize : 16
                    }
                },
                detail : {
                    show : true,
                    backgroundColor: 'rgba(0,0,0,0)',
                    borderWidth: 0,
                    borderColor: '#ccc',
                    width: 100,
                    height: 40,
                    offsetCenter: ['-60%', 10],       // x, y，单位px
                    formatter:'{value}%',
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: 'auto',
                        fontSize : 30
                    }
                },
                data:[{value: currentMonthWcqkzb, name: '本月' + title}]
            },
            {
                name:'个性化仪表盘',
                type:'gauge',
                center : ['20%', '50%'],    // 默认全局居中
                // radius : [0, '100px'],
                startAngle: 140,
                endAngle : -140,
                min: 0,                     // 最小值
                max: 100,                   // 最大值
                precision: 0,               // 小数精度，默认为0，无小数点
                splitNumber: 10,             // 分割段数，默认为5
                axisLine: {            // 坐标轴线
                    show: true,        // 默认显示，属性show控制显示与否
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: [[0.2, 'lightgreen'],[0.4, 'orange'],[0.8, 'skyblue'],[1, '#ff4500']],
                        width: 30
                    }
                },
                axisTick: {            // 坐标轴小标记
                    show: true,        // 属性show控制显示与否，默认不显示
                    splitNumber: 5,    // 每份split细分多少段
                    length :8,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: '#eee',
                        width: 1,
                        type: 'solid'
                    }
                },
                axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                    show: true,
                    formatter: function(v){
                        switch (v+''){
                            case '10': return '弱';
                            case '30': return '低';
                            case '60': return '中';
                            case '90': return '高';
                            default: return '';
                        }
                    },
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#ffffff'
                    }
                },
                splitLine: {           // 分隔线
                    show: true,        // 默认显示，属性show控制显示与否
                    length :30,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                        color: '#eee',
                        width: 2,
                        type: 'solid'
                    }
                },
                pointer : {
                    length : '80%',
                    width : 8,
                    color : 'auto'
                },
                title : {
                    show : true,
                    offsetCenter: ['-65%', -25],       // x, y，单位px
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#ffffff',
                        fontSize : 16
                    }
                },
                detail : {
                    show : true,
                    backgroundColor: 'rgba(0,0,0,0)',
                    borderWidth: 0,
                    borderColor: '#ccc',
                    width: 100,
                    height: 40,
                    offsetCenter: ['-60%', 10],       // x, y，单位px
                    formatter:'{value}%',
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: 'auto',
                        fontSize : 30
                    }
                },
                data:[{value: lastMonthWcqkzb, name: '上月' + title}]
            },
            {
                name:'个性化仪表盘',
                type:'gauge',
                center : ['80%', '50%'],    // 默认全局居中
                // radius : [0, '100px'],
                startAngle: 140,
                endAngle : -140,
                min: 0,                     // 最小值
                max: 100,                   // 最大值
                precision: 0,               // 小数精度，默认为0，无小数点
                splitNumber: 10,             // 分割段数，默认为5
                axisLine: {            // 坐标轴线
                    show: true,        // 默认显示，属性show控制显示与否
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: [[0.2, 'lightgreen'],[0.4, 'orange'],[0.8, 'skyblue'],[1, '#ff4500']],
                        width: 30
                    }
                },
                axisTick: {            // 坐标轴小标记
                    show: true,        // 属性show控制显示与否，默认不显示
                    splitNumber: 5,    // 每份split细分多少段
                    length :8,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: '#eee',
                        width: 1,
                        type: 'solid'
                    }
                },
                axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                    show: true,
                    formatter: function(v){
                        switch (v+''){
                            case '10': return '弱';
                            case '30': return '低';
                            case '60': return '中';
                            case '90': return '高';
                            default: return '';
                        }
                    },
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#ffffff'
                    }
                },
                splitLine: {           // 分隔线
                    show: true,        // 默认显示，属性show控制显示与否
                    length :30,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                        color: '#eee',
                        width: 2,
                        type: 'solid'
                    }
                },
                pointer : {
                    length : '80%',
                    width : 8,
                    color : 'auto'
                },
                title : {
                    show : true,
                    offsetCenter: ['-65%', -25],       // x, y，单位px
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#ffffff',
                        fontSize : 16
                    }
                },
                detail : {
                    show : true,
                    backgroundColor: 'rgba(0,0,0,0)',
                    borderWidth: 0,
                    borderColor: '#ccc',
                    width: 100,
                    height: 40,
                    offsetCenter: ['-60%', 10],       // x, y，单位px
                    formatter:'{value}%',
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: 'auto',
                        fontSize : 30
                    }
                },
                data:[{value: lastYearWcqkzb, name: '去年同期' + title}]
            }
        ]
    };
    return option;
}

//柱状图
function barOption(months,qnwcsrs) {
    var option = {
        tooltip : {
            trigger: 'axis',
        },
        legend: {
            data:['销量占比'],
            textStyle:{
                color: '#fff'
            }
        },
        xAxis : [
            {
                type : 'category',
                axisLabel:{
                    textStyle:{
                        color:'#fff'
                    }
                },
                axisLine:{
                    lineStyle:{
                        color:'#fff'
                    }
                },
                data : months

            }
        ],
        yAxis : [
            {
                type : 'value',
                name : '收入',
                axisLine: {
                    show: true,
                    lineStyle:{
                        color:'#fff'
                    }
                },
                splitLine: {
                    show: false
                },
                axisLabel:{
                    align:'left',
                    margin:40,
                    formatter: '{value}',
                    textStyle:{
                        color:'#fff'
                    }
                }
            }
        ],
        series : [
            {
                name:'收入',
                type:'bar',
                barWidth: '15', //统计条宽度
                itemStyle: {
                    normal: {
                        barBorderRadius: 15,
                        color: '#61A8FF'
                    },
                },
                data:qnwcsrs
            }
        ]
    };
    return option;
}

//曲线图
function buildLineAreaChart2(){
	var option = {
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
		            top:'18%',
		             
		            containLabel: true
		        },
			    xAxis :  {
			        	type: 'category',
			            boundaryGap: false,
			            axisLabel:{
			                color:'#fff',
			                fontSize:12,
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
			                fontSize:12,
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
		                	color:'yellow',
		                	fontSize:20,
		                    show: true,
		                    formatter: '{c}'
		                }, 
		                markPoint: {
		                    data: [], //[{name: '当前月',value: '', xAxis: 6, yAxis: 0}]
		                    //symbol:'none',
		                },
			            data:[]  //data: [{value:820,label: {color: 'blue', fontSize:'16',fontSize:'26'}},
			        }
			    ]
			};
	 return option;
}

//标注柱状图
function buildStandardBar(){
	var option = {
		      color: ['#00FFCC','#999933','#66FF00'],//'#00FFCC','#999933','#66FF00'
		    title : {
		        textStyle: {
		            color: '#fff'
		        }   
		    },
		    grid: [
		            {x: '3%', y: '10%', width: '94%', height: '80%',x2:'1%', y2: '3%'},
		          ],
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		    	 textStyle: {
		                color: '#fff',
		                fontSize:15
		            },
		            selected:{
			        	'上月':false,
			        	'去年同期':false
			        },
		        data:['当前','上月','去年同期']
		        
		    },
		    calculable : true,
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap: true,
		            axisLabel:{
		                color:'#fff',
		                interval:0,
		                rotate:15,//倾斜度 -90 至 90 默认为0
		                textStyle:{
		                	fontSize:15,
		                }
		            },
		            axisLine:{
		                lineStyle:{
		                    color:'#fff'
		                }
		            },
		            data : [ ]
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisLabel:{
		                color:'#fff',
		                rotate:-50,//倾斜度 -90 至 90 默认为0
		                textStyle:{
		                	fontSize:15,
		                },
		                formatter: function(value,index){//纵坐标单位转换
		                    if(Math.abs(value/100000000)>=1){
		                    return (value/100000000).toFixed(0)+" 亿";
		                    }else if(Math.abs(value/10000000)>=1){
		                    return (value/10000000).toFixed(0)+"千万";
		                    }else if(Math.abs(value/1000000)>=1){
		                    return (value/1000000).toFixed(0)+"百万";
		                    }else if(Math.abs(value/10000)>=1){
		                    return (value/10000).toFixed(0)+" 万";
		                    }else{
		                    return value;
		                    }
		                   }
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
		        }
		    ],
		    series : [
		        {
		            name:'当前',
		            type:'bar',
		            data:[],
		            barCategoryGap:'10%',
		            barGap:'40%',
			        itemStyle : {
						normal : {
							label: {
						          show: true,
						          position: 'top',
						          textStyle: {
						            color: '#FFFF00',
						            fontSize:15
						      }
						   },
						},

			        }
		        },
		        {
		            name:'去年同期',
		            type:'bar',
		            data:[ ],
		            barCategoryGap:'10%',
		            barGap:'40%',
		            itemStyle : {
						normal : {
							label: {
						          show: true,
						          position: 'top',
						          textStyle: {
						            color: '#FFFF00',
						            fontSize:15
						      }
						   }
						},

			        }
		           
		        },
		        {
		            name:'上月',
		            type:'bar',
		            data:[ ],
		            barCategoryGap:'10%',
		            barGap:'40%',
		            itemStyle : {
						normal : {
							label: {
						          show: true,
						          position: 'top',
						          textStyle: {
						            color: '#FFFF00',
						            fontSize:15
						      }
						   }
						},

			        }
		           
		        }
		    ]
		};
	return option;
}

//
function buildStandardBarLine(){
	var option = {
		      color: ['#00FFCC','#996600'],//柱状  折线#996600
		    title : {
		        textStyle: {
		            color: '#fff'
		        }   
		    },
		    grid: [
		            {x: '3%', y: '10%', width: '94%', height: '80%',x2:'1%', y2: '3%'},
		          ],
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		    	 textStyle: {
		                color: '#fff',
		                fontSize:15
		            },
		        data:['发货量','退货率']
		    },
		    calculable : true,
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap: true,
		            axisLabel:{
		                color:'#fff',
		                interval:0,
		                rotate:15,//倾斜度 -90 至 90 默认为0
		                textStyle:{
		                	fontSize:15,
		                }
		            },
		            axisLine:{
		                lineStyle:{
		                    color:'#fff'
		                }
		            },
		            data : [ ]
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisLabel:{
		                color:'#fff',
		                rotate:-50,//倾斜度 -90 至 90 默认为0
		                textStyle:{
		                	fontSize:15,
		                },
		                formatter: function(value,index){//纵坐标单位转换
		                    if((value/100000000)>=1){
		                    return (value/100000000).toFixed(0)+" 亿";
		                    }else if((value/10000000)>=1){
		                    return (value/10000000).toFixed(0)+"千万";
		                    }else if((value/1000000)>=1){
		                    return (value/1000000).toFixed(0)+"百万";
		                    }else if((value/10000)>=1){
		                    return (value/10000).toFixed(0)+" 万";
		                    }else{
		                    return value;
		                    }
		                   }
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
		        {
		        	type : 'value',
		        	axisLabel : {
			                formatter: '{value} %'
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
		        }
		    ],
		    series : [
		        {
		            name:'发货量',
		            type:'bar',
		            data:[],
		            barCategoryGap:'5%',
		            barGap:'40%',
		            barWidth:'20px',	
			        itemStyle : {
						normal : {
							label: {
						          show: true,
						          position: 'top',
						          textStyle: {
						            color: '#FFFF00',
						            fontSize:15,
						            
						      }
						   },
						},

			        }
		        },
		        {  name:'退货率',
		            type:'line',
		            yAxisIndex: 1,
		            stack: '总量',
		            lineStyle:{
		            	normal:{
		            		color:'#5ab1ef',
		            		width:2
		            	},
		            },
		            itemStyle:{
	                    normal:{
	                        color:'#fff'
	                    }             
	                },
	                label: {
	                    show: true,
	                    fontSize:20,
	                    formatter: '{c}%'
	                },
		            data:[]
		       }
		    ]
		};
	return option;
}

function buildStandardLine(){
	var option = {
		      color: ['#00FFCC'],//柱状  折线#996600,'#996600'
		    title : {
		        textStyle: {
		            color: '#fff'
		        }   
		    },
		    grid: [
		            {x: '5%', y: '10%', width: '94%', height: '80%',x2:'2%', y2: '3%'},
		          ],
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		    	 textStyle: {
		                color: '#fff',
		                fontSize:15
		            },
		        data:["当前"]
		    },
		    calculable : true,
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap: true,
		            axisLabel:{
		                color:'#fff',
		                interval:0,
		                rotate:15,//倾斜度 -90 至 90 默认为0
		                textStyle:{
		                	fontSize:15,
		                }
		            },
		            axisLine:{
		                lineStyle:{
		                    color:'#fff'
		                }
		            },
		            data : [ ]
		        }
		    ],
		    yAxis : [
		        {
		        	type : 'value',
		        	axisLabel : {
			                formatter: '{value} %'
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
		        }
		    ],
		    series : [
		        {  name:'',
		            type:'line',
		            stack: '总量',
		            lineStyle:{
		            	normal:{
		            		color:'#5ab1ef',
		            		width:2
		            	},
		            },
		            itemStyle:{
	                    normal:{
	                        color:'#fff'
	                    }             
	                },
	                label: {
	                    show: true,
	                    fontSize:20,
	                    formatter: '{c}%'
	                },
		            data:[]
		       }
		    ]
		};
	return option;
}

//无偏移的画像echarts结束

function buildChartOptionBar() {
    var option = {
        color: ['#1ADDF9'],
        grid: {
            borderWidth: 0,
            x: 50,
            y: 0,
            y2: 10
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b} : {c}万人"
        },
        xAxis: {
            type: 'value',
            axisLabel:{
                textStyle:{
                    color:'#fff'
                }
            },
            axisLabel: {
                show: false
            },
            splitLine: {
                show: false
            },
            axisLine: {
                show: false
            },
            axisTick: {
                show: false
            }
        },
        yAxis: [{
            type: 'category',
            axisLabel:{
                align:'left',
                margin:40,
                textStyle:{
                    color:'#fff'
                }
            },
            axisLine: {
                show: false
            },
            splitLine: {
                show: false
            },
            axisTick: {
                show: false
            }, data: []
        }],
        series: [{
            type: 'bar',
            barWidth: 15,
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        position:'right',
                        formatter:' {c}',
                        color:'#fff'
                    },
                    barBorderRadius: 10,
                    color: ""
                }
            },
            data: []
        }]
    };
    return option;
};

//横向TOP 柱状图
function buildChartOptionTopBar(){
	var option = {
		       color: ['#61A8FF'], //进度条颜色
		       /* grid: {
		            left: '-10%',  //如果离左边太远就用这个......
		            //right: '14%',
		            bottom: '5%',
		            top: '5%',
		            containLabel: true
		        },*/
		       grid: {
		            borderWidth: 1,
		            x: 90,
		            y: 0,
		            y2: 0,
		          
		        },
		       xAxis: [{
		               show: false,
		           },
		           //由于下边X轴已经是百分比刻度了,所以需要在顶部加一个X轴,刻度是金额,也隐藏掉
		           {
		               show: false,
		           }
		       ],
		       yAxis: {
		           type: 'category',
		           axisLabel: {
		               show: false, //让Y轴数据不显示
		               align:'left',
		               margin:180,
		           },
		           itemStyle: {

		           },
		           axisTick: {
		               show: false, //隐藏Y轴刻度
		           },
		           axisLine: {
		               show: false, //隐藏Y轴线段
		           },
		           data: [],//yAxisTitle,
		       },
		       series: [
		           //背景色--------------------我是分割线君------------------------------//
		           {
		               show: true,
		               type: 'bar',
		             /*  barGap: '-100%',*/
		               barWidth: '15', //统计条宽度 
		               itemStyle: {
		                   normal: {
		                       barBorderRadius: 15,
		                       color: 'rgba(102, 102, 102,0.5)'
		                   },
		               },
		               z:1,
		               data: [],//grayBar,
		           },
		           //蓝条--------------------我是分割线君------------------------------//
		           {
		               show: true,
		               type: 'bar',
		              /* barGap: '-100%',*/
		               barWidth: '15', //统计条宽度
		               itemStyle: {
		                   normal: {
		                       barBorderRadius: 10, //统计条弧度
		                   },
		               },
		               max: 1,
		               label: {
		                   normal: {
		                       show: true,
		                       textStyle: {
		                           color: '#fff', //百分比颜色
		                       },
		                       position: 'inside',
		                       //百分比格式
		                       formatter: function(data) {
		                           return '';
		                       },
		                   }
		               },
		               labelLine: {
		                   show: false,
		               },
		               z:2,
		               data: [],//baifenbi,
		           },


		       ]
		   };
	
	   return option;
}

 


var labelOption = {
	    normal: {
	        show: true,
	        position: 'insideBottom',
	        distance: 15,
	        align: 'left',
	        verticalAlign: 'middle',
	        rotate: 90,
	        formatter: '{c}',
	        fontSize: 18,
	        color:'yellow',
	        rich: {
	            name: {
	                textBorderColor: 'yellow'
	            }
	        }
	    }
	};


function oneBar(){
    var option = {
       title: {
           text: '',
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
       legend: {
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
           },
           data:[]
       },    		
       color: ['#14c7e0'],
       grid: {
            borderWidth: 0,
            x: 0,
            x2: 0,
            y: 40,//距离顶部
            y2: 0,//距离底部
            containLabel: true
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b} :<br/> {c}"
        },
        xAxis: [{
            type: 'category',
            data: [],
            axisLabel: {
                interval: 0,
                interval:0,
                rotate:25,
                margin: 15, //x轴文字与轴线距离
                textStyle: {
                    color: '#fff',
                    align: 'center'
                },
            }
        }],
        yAxis: [{
            show: false,
            axisLabel:{
                textStyle:{
                    color:'#fff'
                },
                name:'(万人)',
                nameTextStyle:{
                    color:'#fff'
                }
            }
        }],
        series: [{
            name: name,
            type: 'bar',
            barWidth: 30,
            label: labelOption,
          /*  label:{
                normal:{
                    show:true,
                    fontSize:17,
                    position:'top',
                    color:'yellow',
                    formatter: "{c}"
                }
            },*/
            data: []
        }]
    };
    return option;
};

//年龄分布柱状图展示百分比
function  oneBar_year() {
    var option = {
       title: {
           text: '',
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
       legend: {
           data:[]
       },    		
       color: ['#1ADDF9'],
       grid: {
            borderWidth: 0,
            x: 0,
            x2: 0,
            y: 40,//距离顶部
            y2: 0,//距离底部
            containLabel: true
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b} :<br/> {c}({d}%)"
        },
        xAxis: [{
            type: 'category',
            data: [],
            axisLabel: {
                interval: 0,
                interval:0,
                rotate:25,
                margin: 15, //x轴文字与轴线距离
                textStyle: {
                    color: '#fff',
                    align: 'center'
                },
            }
        }],
        yAxis: [{
            show: false,
            axisLabel:{
                textStyle:{
                    color:'#fff'
                },
                name:'(万人)',
                nameTextStyle:{
                    color:'#fff'
                }
            }
        }],
        series: [{
            name: name,
            type: 'bar',
            barWidth: 30,
            label:{
                normal:{
                    show:true,
                    fontSize:17,
                    position:'top',
                    color:'yellow',
                    formatter: function(params){
                    	 //计算总数
    			        var sum=0;
    			        var arr=option.series[0].data;
    			        for(var i=0;i<arr.length;i++){
    			            sum+=Number(arr[i]);
    			        }
    			        //计算百分比
    			        return params.value+"\n("+(params.value/sum*100).toFixed(2)+"%)";
                    }
                }
            },
            data: []
        }]
    };
    return option;
};

//区域折线图
function buildLineAreaChart(){
	var option = {
			   color: ['#3398DB'],
			   tooltip: {
		            trigger: 'axis',
		            formatter:'{b}:<br/>{c}'
		            //formatter:'{b} <br/>{a}：{c}万'
		        },
		        grid: {
		            left: '20%',
		            right: '10%',
		            bottom: '10%',
		            top:'10%',
		             
		            containLabel: true
		        },
			    xAxis :  {
			        	type: 'category',
			            boundaryGap: false,
			            axisLabel:{
			                color:'#fff'
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
			                color:'#fff'
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
		                	color:'#fff',
		                	fontSize:20,
		                    show: true,
		                    formatter: '{c}'
		                }, 
			            data:[]
			        }
			    ]
			};
	 return option;
}
//折线图
function buildLineChart(){
    var option = {
        tooltip: {
            trigger: 'axis',
            //formatter:'{b} <br/>{a}：{c}万'
            formatter:'{b}:<br/>{c}'
        },
        grid: {
            left: '5%',
            right: '10%',
            bottom: '3%',
            top:'10%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            axisLabel:{
                color:'#fff'
            },
            axisLine:{
                lineStyle:{
                    color:'#fff'
                }
            },
            data: []
        },
        yAxis: {
            show:true,
            type: 'value',
            axisLabel:{
                color:'#fff',
                formatter: '{value}'
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
        series: [
            {
                name:'人数',
                type:'line',
                stack: '总量',
                smooth:true,
                lineStyle:{
                    normal:{
                        color:'#1ADDF9'
                    }
                },
                itemStyle:{
                    normal:{
                        color:'#fff'
                    }             
                },
                label: {
                    show: true,
                    fontSize:20,
                    formatter: '{c}'
                },                
                data:[]
            }
        ]
    };
    return option;
}

function buildChartOption() {
    var option = {
      title : {
    		        text: ' ',
    		        subtext: ' ',
    		        x:'center',
    		        y:'bottom',
    		        textStyle: {
    		            fontSize:18,//同比环比的字体
    		            fontWeight: 'bolder',
    		            color: '#fff'
    		        }
    	},
        tooltip: {
            trigger: 'item',
            //formatter: "{a} <br/>{b} : {c}人 ({d}%)"
            formatter: "{b}:<br/>{c}({d}%)"
        },
        legend: {
            data: [],
            selected: {
                /*'降水量' : false*/
            } ,
        textStyle:{
        	color: '#fff',
        	fontSize:18   //各扇区的菜单
        }
        },
        //'#199ff4','#da9c00','#5760ff','#6f32cd','#9dff5c','#5bfdff'
      //  #99CCFF	#9933FF	#330099	#6699FF	#006699	#3300CC	#003366
        color:['#99CCFF','#9933FF','#330099','#003366','#006699','#3300CC','#6699FF'],
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
                    	borderWidth:2,
		        		borderColor:'#fff',
                        labelLine: {
                            length: 1
                        },
                        label: {
                            show: true,
                            fontSize:22,
                            /*formatter: '{b}:{d}%'*/
                            formatter:"{b}:\n{c}\n({d}%)",
//                            	function(e){
//                         	   var newStr=" ";
//						            var start,end;
//						             var name_len=e.name.length; //每个内容名称的长度
//						            var max_name=3;//每行最多显示的字数
//						            var new_row = Math.ceil(name_len / max_name);// 最多能显示几行，向上取整比如2.1就是3行
//						            if(name_len>max_name){//如果长度大于每行最多显示的字数
//						            for(var i=0;i<new_row;i++){//循环次数就是行数
//						            var old=''; //每次截取的字符
//						            start=i*max_name; //截取的起点
//						            end=start+max_name;//截取的终点
//						            if(i==new_row-1){//最后一行就不换行了
//						            old=e.name.substring(start);
//						            }else{
//						            	old=e.name.substring(start,end)+"\n";    
//						                 }
//						                 newStr+=old;//拼接字符串
//						                 }
//						                 }else{ //如果小于每行最多显示的字数就返回原来的字符串
//						                 newStr=e.name;
//						                 }
//						                 return newStr+'\n'+e.value;          
//							}  ,
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
//库龄库存的饼图
function buildInventoryOption() {
	var option = {
		      title : {
		    		        text: ' ',
		    		        subtext: ' ',
		    		        x:'center',
		    		        y:'bottom',
		    		        textStyle: {
		    		            fontSize:18,//同比环比的字体
		    		            fontWeight: 'bolder',
		    		            color: '#fff'
		    		        }
		    	},
		        tooltip: {
		            trigger: 'item',
		            //formatter: "{a} <br/>{b} : {c}人 ({d}%)"
		            formatter: "{b}:<br/>{c}({d}%)"
		        },
		        legend: {
		            data: [],
		            selected: {
		                /*'降水量' : false*/
		            } ,
		        textStyle:{
		        	color: '#fff',
		        	fontSize:18   //各扇区的菜单
		        }
		        },
		        //'#199ff4','#da9c00','#5760ff','#6f32cd','#9dff5c','#5bfdff'
		      //  #99CCFF	#9933FF	#330099	#6699FF	#006699	#3300CC	#003366
		        color:['#99CCFF','#9933FF','#330099','#003366','#006699','#3300CC','#6699FF'],
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
		                    	borderWidth:2,
				        		borderColor:'#fff',
		                        labelLine: {
		                            length: 1
		                        },
		                        label: {
		                            show: true,
		                            fontSize:22,
		                            /*formatter: '{b}:{d}%'*/
		                            formatter:function(e){
								                 return e.name+'天\n'+e.value;          
									}  ,
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

//嵌套饼图
function nestPieChart(){
	var option = {
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d})"
		    },
		    title : {
		        text: ' ',
		        subtext: ' ',
		        x:'center',
		        y:'bottom',
		        textStyle: {
		            fontSize: 18,
		            fontWeight: 'bolder',
		            color: '#fff'
		        }
		    },
		    legend: {
		   /*     orient : 'vertical',*/
		        x : 'left',
		        data:[],
		        textStyle:{color: '#fff'}
		    },
		    grid: {
		    	 y:'40%'
	        },
		    calculable : false,//'#FFCC66','#FF9900','#00CC00','#FF9966','#33FF00','#FFCCCC','#FFFF33'
		     color:['#339900','#3366FF','#6633CC','#669999','#99FFFF','#66FF66','#CC9933'],
		    series : [
		        {
		            name:' ',
		            type:'pie',
		            selectedMode: 'single',
		            radius : [0, '40%'],
		            
		            // for funnel
		            x: '20%',
		            width: '40%',
		            funnelAlign: 'right',
		            max: 1548,
		            
		            itemStyle : {
		                normal : {
		                	borderWidth:2,
			        		borderColor:'#fff',
		                    label : {
		                        position : 'inner',
		                        textStyle:{
				                	fontSize:12
				                },
		                        formatter:'{b}:\n({d}%)'
		                        	
		                    },
		                    labelLine : {
		                        show : false
		                    }
		                }
		            },
		            data:[]
		        },
		        {
		            name:' ',
		            type:'pie',
		            radius : ['40%', '60%'],
		            selectedMode: 'single',
		            // for funnel
		            x: '60%',
		            width: '35%',
		            funnelAlign: 'left',
		            max: 1048,
		            itemStyle : {
		                normal : {
		                	borderWidth:2,
			        		borderColor:'#fff',
		                    label : {
		                        position : 'inner',
		                        position:'outer',
				                formatter:'{b}:\n{c}({d}%)',
				                textStyle:{
				                	fontSize:18
				                },
		                    },
		                    labelLine : {
		                        show : true,
		                        length:15,
		                    	lineStyle:{
		                    		type:'solid'
		                    	},
		                    },
		                },
		            },
		            data:[]
		        }
		    ]
		};
	return option;
}




function  buildMigrateSeries() {
    var series = [
        {
            name: '',
            type: 'lines',
            zlevel: 1,
            effect: {
            show: true,
                period: 6,
                trailLength: 0.7,
                color: '#fff',
                symbolSize: 3
        },
            lineStyle: {
                normal: {
                    color: '#f4e925',
                        width: 0,
                        curveness: 0.2
                }
            },
            data: []
        },
        {
            name:'',
            type: 'lines',
            zlevel: 2,
            symbol: ['none', 'arrow'],
            symbolSize: 10,
            effect: {
            show: true,
                period: 6,
                trailLength: 0,
                symbol: 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z',
                symbolSize: 15
        },
            lineStyle: {
                normal: {
                    color: '#f4e925',
                        width: 1,
                        opacity: 0.6,
                        curveness: 0.2
                }
            },
            data: []
        },
        {name: '',
            type: 'effectScatter',
            coordinateSystem: 'geo',
            zlevel: 2,
            rippleEffect: {
                brushType: 'stroke'
            },
            label: {
                normal: {
                    show: true,
                    position: 'right',
                    formatter: '{b}'
                }
            },
            tooltip:{
                formatter: function(val){
                    var usrCnt = val.value;
                    return val.name+':'+usrCnt[2]+'万人';
                }
            },
            symbolSize:function (val) {
                return symbolSection0_1w(val);
            },
            itemStyle: {
                normal: {
                    color: '#f4e925',
                    shadowBlur: 10,
                    shadowColor: '#333'
                }
            },
            data: []
        }
    ]
    return series;

}


var symbolSection0_1w = function (val) {
    //默认区间1w - 0w
    if (val[2] < 0.2) {
        return 10;
    } else if (val[2] < 0.3) {
        return 12;
    } else if (val[2] < 0.4) {
        return 14;
    } else if (val[2] < 0.5) {
        return 16;
    } else if (val[2] < 0.6) {
        return 18;
    } else if (val[2] < 0.7) {
        return 20;
    } else if (val[2] < 0.8) {
        return 22;
    } else {
        return 24;
    }
}
var symbolSection0_10w = function (val) {
    //默认区间10w - 0w
    if(val[2]<1){
        return 10;
    }else if(val[2]<2){
        return 12;
    }else if(val[2]<3){
        return 14;
    }else if(val[2]<4){
        return 16;
    }else if(val[2]<5){
        return 18;
    }else if(val[2]<6){
        return 20;
    }else if(val[2]<7){
        return 22;
    }else{
        return 24;
    }
}
var symbolSection1_8w = function (val) {
    //默认区间8w - 1w
    if(val[2]<1){
        return 10;
    }else if(val[2]<2){
        return 12;
    }else if(val[2]<3){
        return 14;
    }else if(val[2]<4){
        return 16;
    }else if(val[2]<5){
        return 18;
    }else if(val[2]<6){
        return 20;
    }else if(val[2]<7){
        return 22;
    }else{
        return 24;
    }
}
var symbolSection7_50w = function (val) {
    //默认区间50w - 7w
    if(val[2]<7){
        return 10;
    }else if(val[2]<14){
        return 12;
    }else if(val[2]<21){
        return 14;
    }else if(val[2]<28){
        return 16;
    }else if(val[2]<35){
        return 18;
    }else if(val[2]<42){
        return 20;
    }else if(val[2]<49){
        return 22;
    }else{
        return 24;
    }
}
var symbolSection5_50w = function (val) {
    //默认区间50w - 5w
    if(val[2]<5){
        return 10;
    }else if(val[2]<12){
        return 12;
    }else if(val[2]<19){
        return 14;
    }else if(val[2]<26){
        return 16;
    }else if(val[2]<33){
        return 18;
    }else if(val[2]<40){
        return 20;
    }else if(val[2]<47){
        return 22;
    }else{
        return 24;
    }
}
var symbolSection8_60w = function (val) {
    //默认区间60w - 10w
    if(val[2]<10){
        return 10;
    }else if(val[2]<18){
        return 12;
    }else if(val[2]<26){
        return 14;
    }else if(val[2]<34){
        return 16;
    }else if(val[2]<42){
        return 18;
    }else if(val[2]<50){
        return 20;
    }else if(val[2]<58){
        return 22;
    }else{
        return 24;
    }
}

var symbolSection50_350w = function (val) {
    //默认区间350w - 50w
    if(val[2]<50){
        return 10;
    }else if(val[2]<100){
        return 12;
    }else if(val[2]<150){
        return 14;
    }else if(val[2]<200){
        return 16;
    }else if(val[2]<250){
        return 18;
    }else if(val[2]<300){
        return 20;
    }else if(val[2]<350){
        return 22;
    }else{
        return 24;
    }
}

var symbolSection25_175w = function (val) {
    //默认区间175w - 25w
    if(val[2]<25){
        return 10;
    }else if(val[2]<50){
        return 12;
    }else if(val[2]<75){
        return 14;
    }else if(val[2]<100){
        return 16;
    }else if(val[2]<125){
        return 18;
    }else if(val[2]<150){
        return 20;
    }else if(val[2]<175){
        return 22;
    }else{
        return 24;
    }
}

function  buildMigrateOption() {
    var option = {
        // backgroundColor: '#404a59',
        title : {
            left: 'center',
            textStyle : {
                color: '#fff'
            }
        },
        tooltip : {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            top: 'bottom',
            left: 'right',
            data:[],
            textStyle: {
                color: '#fff'
            },
            selectedMode: 'single'
        },
        geo: {
            map: '',
            label: {
                emphasis: {
                    show: false
                }
            },
            zoom:1.2,
            roam: true,
            itemStyle: {
                normal: {
                    areaColor: '#323c48',
                    borderColor: '#111'
                },
                emphasis: {
                    areaColor: '#2a333d'
                }
            }
        },
        series: []
    };
    return option;
}

function buildScatterOption(){
  var  option = {
        // backgroundColor: '#404a59',
        title: {
            left: 'center',
            textStyle: {
                color: '#fff'
            }
        },
        tooltip : {
            trigger: 'item'
        },
        geo: {
            map: '',
            label: {
                emphasis: {
                    show: false
                }
            },
            tooltip : {
                trigger: 'item',
                formatter: function(val){
                    return 000;
                }
            },
            zoom:1.2,
            roam: true,
            itemStyle: {
                normal: {
                    areaColor: '#323c48',
                    borderColor: '#111'
                },
                emphasis: {
                    areaColor: '#2a333d'
                }
            }
        },
        series : [
            {
                name: '游客分布',
                type: 'scatter',
                coordinateSystem: 'geo',
                data: [],
                tooltip:{
                    formatter: function(val){
                        var usrCnt = val.value;
                        return val.name+':'+usrCnt[2]+'万人';
                    }
                },
                symbolSize: {},
                label: {
                    normal: {
                        formatter: '{b}',
                        position: 'right',
                        show: false
                    },
                    emphasis: {
                        show: true
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#ddb926'
                    }
                }
            },
            {
                name: '游客分布人数前5名',
                type: 'effectScatter',
                coordinateSystem: 'geo',
                data: [],
                tooltip:{
                    formatter: function(val){
                        var usrCnt = val.value;
                        return "人数排名前5名地市<br/>"+val.name+':'+usrCnt[2]+'万人';
                    }
                },
                symbolSize:{},
                showEffectOn: 'render',
                rippleEffect: {
                    brushType: 'stroke'
                },
                hoverAnimation: true,
                label: {
                    normal: {
                        formatter: '{b}',
                        position: 'right',
                        show: true
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#f4e925',
                        shadowBlur: 10,
                        shadowColor: '#333'
                    }
                },
                zlevel: 1
            },
            {
                name: '游客分布人数',
                type: 'map',
                geoIndex: 0,
                data:[]
            }
        ]
    };
    return option;
}

function buildChartOptionPie() {
    var option = {
        color:['#1ADDF9','#F09501','#00C399','#FBC503','#00C399'],
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c}万人 ({d}%)"
        },
        legend: {
            orient: 'horizontal',
            bottom:20,
            textStyle:{
                color:'#fff'
            },
            padding:10,
            data: []
        },
        series: [
            {
                name: '人数',
                type: 'pie',
                radius : '55%',
                center: ['50%', '40%'],
                data: [],
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                label:{
                    normal:{
                        show:false
                    }
                },
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    return option;
};

function buildBarPileOption() {
    var option = {
        color:['#1ADDF9','#F09501','#00C399','#FBC503','#00C399'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            textStyle:{
                color:'#fff'
            },
            data: []
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '0',
            containLabel: true
        },
        xAxis:  {
            type: 'value',
            splitLine:{
                show:false
            }
        },
        yAxis: {
            type: 'category',
            name:'',
            nameTextStyle:{
                color:'#fff'
            },
            axisLabel:{
                color:'#fff'
            },
            data: []
        },
        series: [
        //     {
        //     name: '自驾',
        //     type: 'bar',
        //     stack: '人数',
        //     barMinHeight:'10%',
        //     label: {
        //         normal: {
        //             color:'#fff',
        //             show: false,
        //             position: 'top'
        //         }
        //     },
        //     data: []
        // },
            {
                name: '飞机',
                type: 'bar',
                stack: '人数',
                barMinHeight:'10%',
                label: {
                    normal: {
                        color:'#fff',
                        show: false,
                        position: 'top'
                    }
                },
                data: []
            },
            {
                name: '高铁',
                type: 'bar',
                stack: '人数',
                barMinHeight:'10%',
                label: {
                    normal: {
                        color:'#fff',
                        show: false,
                        position: 'top'
                    }
                },
                data: []
            },
            {
                name: '火车',
                type: 'bar',
                stack: '人数',
                barWidth:'40%',
                barMinHeight:'10%',
                label: {
                    normal: {
                        color:'#fff',
                        show: false,
                        position: 'top'
                    }
                },
                data: []
            }]
    };
    return option;
}



function buildChartOptionLine() {
    var option = {
        color: ['#3398DB'],
        grid: {
            y: 5
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: ''
            }
        },
        xAxis: [
            {
                type: '',
                boundaryGap: false,
                data: []
            }
        ],
        yAxis: [
            {
                name: '',
                type: '',
                data: []
            }
        ],
        series: [
            {
                name: '人数',
                type: 'line',
                label: {
                    normal: {
                        show: true,
                        position: 'right'
                    }
                },
                barWidth: 15,
                data: []
            }
        ]
    };

    return option;
};

function buildChartOptionLineN() {
    var option = {
        tooltip: {
            trigger: 'axis'
        },
        grid: {
            borderWidth: 0,
            x: 50
        },
        title: {
            left: 'center',
            text: '游客数量趋势',
            textStyle:{
                color:'#fff'
            }
        },
        xAxis: {
            type: 'category',
            axisLabel:{
                textStyle:{
                    color:'#fff'
                }
            },
            boundaryGap: false,
            data: []
        },
        yAxis: {
            type: 'value',
            min:function(value) {
                return value.min;
            },
            max:function(value) {
                return value.max;
            },
            splitLine:{
                show:false
            },
            axisLabel:{
                textStyle:{
                    color:'#fff'
                }
            },
            boundaryGap: [0, '100%']
        },
        dataZoom: [{
            type: 'inside',
            start: 0,
            end: 100
        }, {
            type:'slider',
            bottom:10,
            start: 0,
            end: 100,
            height:5,
            showDetail: false,//拖拽的时候是否显示详细信息
            handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
            handleSize: 15,
            handleStyle: {
                color: '#fff',
                shadowBlur: 3,
                shadowColor: 'rgba(0, 0, 0, 0.6)',
                shadowOffsetX: 2,
                shadowOffsetY: 2
            }
        }],
        series: [
            {
                name:'游客数量',
                type:'line',
                smooth:false,
                symbolSize:10,
                sampling: 'average',
                itemStyle: {
                    normal: {
                        color: 'rgb(10, 172, 255)'
                    }
                },
                areaStyle: {
                    normal: {
                       color:{}
                    }
                },
                data: []
            }
        ]
    };
    return option;
}

function buildChartOptionLineD() {
    var option = {
        color: ['#CEEFF6'],
        tooltip: {
            trigger: 'axis',
            formatter: '{b}：{c}万人'
        },
        calculable: true,
        xAxis: [{
            type: 'category',
            data: [],
            boundaryGap: false,
            splitLine: {
                show: false,
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false
            },
            axisLabel: {
                margin: 10,
            }
        }],
        yAxis: [{
            type: 'value',
            splitLine: {
                lineStyle: {
                    color: ['#D4DFF5']
                }
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false,
                lineStyle: {
                    color: '#609ee9'
                }
            }
        }],
        series: [{
            name: '',
            type: 'line',
            smooth: true,
            data: [],
            itemStyle: {
                normal: {
                    color: '#74CBDF',
                    borderWidth: 5,//球
                    areaStyle: {
                        type: 'default',
                    },
                    lineStyle: {
                        color: '#74CBDF',
                        width: 4,//线
                    }
                }
            }

        }]
    };
    return option;
}

function buildChartOptionBarLine() {
    var option = {
        tooltip: {
            trigger: 'axis'
            // axisPointer: {
            //     type: 'cross',
            //     crossStyle: {
            //         color: '#999'
            //     }
            // }
        },
        grid: {
            borderWidth: 0,
            x: '-2%',
            y: '10%'
        },
        legend: {
            data: [],
            textStyle:{
                color:"#fff"
            }
        },
        xAxis: [
            {
                type: 'category',
                data: [],
                axisPointer: {
                    type: 'shadow'
                },
                axisLabel:{
                    color:'#fff'
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '人数',
                splitLine:{
                    show:false
                },
                axisLabel: {
                    formatter: '{value} '
                    // color:'#fff'
                }
            },
            {
                type: 'value',
                name: '增长率',
                splitLine:{
                    show:false
                },
                axisLabel: {
                    formatter: '{value} %'
                }
            }
        ],
        series: [
            {
                name: '',
                type: 'bar',
                itemStyle:{
                    normal:{
                        color:'#1ADDF9'
                    }
                },
                data: []
            },
            {
                name: '',
                type: 'bar',
                itemStyle:{
                    normal:{
                        color:'#6BFF83'
                    }
                },
                data: []
            },
            {
                name: '',
                type: 'line',
                yAxisIndex: 1,
                itemStyle: {
                    normal: {
                        label: {
                            show: false,
                            position:'top',
                            formatter:' {c} %',
                            color:'#fff'
                        },
                        color:'#D48404'
                    }
                },
                data: []
            }
        ]
    };

    return option;
}

function buildChartOptionAnnulus() {
    //环形
  var  option = {
      tooltip: {
          trigger: 'item',
          formatter: "{b}<br/>比率：{d}%"
          //formatter: "{a} <br/>{b}: {c} 万人({d}%)"
      },
      color:['#F09501','#00C399','#1ADDF9','#FBC503','#00C399'],
      series: [
          {
              name:'性别分布',
              type:'pie',
              label: {
                  normal: {
                      textStyle: {
                          color: 'yellow',
                          align:"left",
                      }
                  },
                  formatter:"{b}: {d}%"
              },
              labelLine: {
                  normal: {
                      lineStyle: {
                          color: '#fff'
                      },
                      // smooth: 0.2,
                      length: 10,
                      length2: 20
                  }
              },
              itemStyle: {
                  normal: {
                      labelLine: {
                          length: 1
                      },
                      label: {
                          show: true,
                          fontSize:20,
                          formatter: '{b}:{d}%'
                      }
                  },
              },              
              center:['50%', '50%'],
              radius: ['40%', '60%'],
              avoidLabelOverlap: false,
              data:[]
          }
      ]
  };
    return option;

}

function  buildHotMapOption() {
    var option = {
        animation: false,
        bmap: {
            center: [],
            zoom: 14,
            roam: true
        },
        visualMap: {
            show: false,
            top: 'top',
            min: 0,
            max: 5,
            seriesIndex: 0,
            calculable: true,
            inRange: {
                color: ['blue', 'blue', 'green', 'yellow', 'red']
            }
        },
        series: [{
            type: 'heatmap',
            coordinateSystem: 'bmap',
            data: [],
            pointSize: 5,
            blurSize: 6
        }]
    }
    return option;
}

function buildChartOptionNDGR() {
    var option = {
        title : {
            text: '',
            textStyle:{
                color:'#fff'
            },
            x:'center'
        },
        color:['#F09501','#00C399','#1ADDF9','#FBC503','#00C399'],
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} 万人({d}%)",
            position:"top"
        },
        calculable : true,
        series : [
            {
                name:'',
                type:'pie',
                label: {
                    normal: {
                        textStyle: {
                            color: '#fff'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        lineStyle: {
                            color: '#fff'
                        },
                        // smooth: 0.2,
                        length: 10,
                        length2: 20
                    }
                },
                radius : [20, 60],
                center : ['50%', '50%'],
                roseType : 'radius',
                data:[]
            }
        ]
    };
    return option;

}

/*迁徙图所需线路数据*/
var convertDataMigrate = function (data,trvlAreaName,type) {
    var res = [];
    for (var i = 0; i < data.length; i++) {
        var dataItem = data[i];
        var fromCoord = geoCoordMapAll[dataItem.name];
        var toCoord= geoCoordMapAll[trvlAreaName];
        var coords;
        if (type == 'in'){
            coords = [fromCoord,toCoord];
        }else {
            coords = [toCoord,fromCoord];
        }
        if (fromCoord && toCoord) {
            res.push({
                fromName: dataItem.name,
                toName: trvlAreaName,
                coords: coords
            });
        }
    }
    return res;
};
/*迁徙图所需打点数量数据*/
var convertDataMigrate2 = function  (data) {
    var res = [];
    for (var i = 0; i < data.length; i++) {
        var dataItem = data[i];
        var geoCoord = geoCoordMapAll[dataItem.name];
        var count = [dataItem.value];
        if(geoCoord&&count){
            var value = geoCoord .concat(count);
            res.push({
                name:dataItem.name,
                value:value
            })
        }
    }
    return res;
}


/*散点图所需打点数量数据*/
var convertData = function (data) {
    var res = [];
    for (var i = 0; i < data.length; i++) {
        var name = data[i].name;
        var geoCoord = geoCoordMapAll[name];
        if (geoCoord) {
            res.push({
                name: name,
                value: geoCoord.concat(data[i].value)
            });
        }
    }
    return res;
};

/*经纬度map*/
var geoCoordMapAll = {
    /*省份对应经纬度  以省会城市代替*/
    '西藏':[91.11,29.97],
    '青海':[101.74,36.56],
    '宁夏':[106.27,38.47],
    '内蒙古':[111.65,40.82],
    '天津':[117.2,39.13],
    '新疆':[87.68,43.77],
    '甘肃':[103.73,36.03],
    '吉林':[126.57,43.87],
    '山西':[112.53,37.87],
    '黑龙江':[126.63,45.75],
    '辽宁':[125.35,43.88],
    '海南':[110.35,20.02],
    '河北':[114.48,38.03],
    '陕西':[108.95,34.27],
    '安徽':[117.27,31.86],
    '上海':[121.48,31.22],
    '山东':[117,36.65],
    '云南':[102.73,25.04],
    '重庆':[106.54,29.59],
    '北京':[116.46,39.92],
    '江苏':[120.62,31.32],
    '贵州':[106.71,26.57],
    '福州':[119.3,26.08],
    '浙江':[120.19,30.26],
    '河南':[113.65,34.76],
    '湖北':[114.31,30.52],
    '江西':[118.78,32.04],
    '四川':[104.06,30.67],
    '广西':[108.33,22.84],
    '湖南':[113,28.21],
    '广东':[113.23,23.16],
    /*主要城市经纬度*/
    '上海': [121.4648,31.2891],
    '东莞': [113.8953,22.901],
    '东营': [118.7073,37.5513],
    '中山': [113.4229,22.478],
    '临汾': [111.4783,36.1615],
    '临沂': [118.3118,35.2936],
    '丹东': [124.541,40.4242],
    '丽水': [119.5642,28.1854],
    '乌鲁木齐': [87.9236,43.5883],
    '佛山': [112.8955,23.1097],
    '保定': [115.0488,39.0948],
    '兰州': [103.5901,36.3043],
    '包头': [110.3467,41.4899],
    '北京': [116.4551,40.2539],
    '北海': [109.314,21.6211],
    '南京': [118.8062,31.9208],
    '南宁': [108.479,23.1152],
    '南昌': [116.0046,28.6633],
    '南通': [121.1023,32.1625],
    '厦门': [118.1689,24.6478],
    '台州': [121.1353,28.6688],
    '合肥': [117.29,32.0581],
    '呼和浩特': [111.4124,40.4901],
    '咸阳': [108.4131,34.8706],
    '哈尔滨': [127.9688,45.368],
    '唐山': [118.4766,39.6826],
    '嘉兴': [120.9155,30.6354],
    '大同': [113.7854,39.8035],
    '大连': [122.2229,39.4409],
    '天津': [117.4219,39.4189],
    '太原': [112.3352,37.9413],
    '威海': [121.9482,37.1393],
    '宁波': [121.5967,29.6466],
    '宝鸡': [107.1826,34.3433],
    '宿迁': [118.5535,33.7775],
    '常州': [119.4543,31.5582],
    '广州': [113.5107,23.2196],
    '廊坊': [116.521,39.0509],
    '延安': [109.1052,36.4252],
    '张家口': [115.1477,40.8527],
    '徐州': [117.5208,34.3268],
    '德州': [116.6858,37.2107],
    '惠州': [114.6204,23.1647],
    '成都': [103.9526,30.7617],
    '扬州': [119.4653,32.8162],
    '承德': [117.5757,41.4075],
    '拉萨': [91.1865,30.1465],
    '无锡': [120.3442,31.5527],
    '日照': [119.2786,35.5023],
    '昆明': [102.9199,25.4663],
    '杭州': [119.5313,29.8773],
    '枣庄': [117.323,34.8926],
    '柳州': [109.3799,24.9774],
    '株洲': [113.5327,27.0319],
    '武汉': [114.3896,30.6628],
    '汕头': [117.1692,23.3405],
    '江门': [112.6318,22.1484],
    '沈阳': [123.1238,42.1216],
    '沧州': [116.8286,38.2104],
    '河源': [114.917,23.9722],
    '泉州': [118.3228,25.1147],
    '泰安': [117.0264,36.0516],
    '泰州': [120.0586,32.5525],
    '济南': [117.1582,36.8701],
    '济宁': [116.8286,35.3375],
    '海口': [110.3893,19.8516],
    '淄博': [118.0371,36.6064],
    '淮安': [118.927,33.4039],
    '深圳': [114.5435,22.5439],
    '清远': [112.9175,24.3292],
    '温州': [120.498,27.8119],
    '渭南': [109.7864,35.0299],
    '湖州': [119.8608,30.7782],
    '湘潭': [112.5439,27.7075],
    '滨州': [117.8174,37.4963],
    '潍坊': [119.0918,36.524],
    '烟台': [120.7397,37.5128],
    '玉溪': [101.9312,23.8898],
    '珠海': [113.7305,22.1155],
    '盐城': [120.2234,33.5577],
    '盘锦': [121.9482,41.0449],
    '石家庄': [114.4995,38.1006],
    '福州': [119.4543,25.9222],
    '秦皇岛': [119.2126,40.0232],
    '绍兴': [120.564,29.7565],
    '聊城': [115.9167,36.4032],
    '肇庆': [112.1265,23.5822],
    '舟山': [122.2559,30.2234],
    '苏州': [120.6519,31.3989],
    '莱芜': [117.6526,36.2714],
    '菏泽': [115.6201,35.2057],
    '营口': [122.4316,40.4297],
    '葫芦岛': [120.1575,40.578],
    '衡水': [115.8838,37.7161],
    '衢州': [118.6853,28.8666],
    '西宁': [101.4038,36.8207],
    '西安': [109.1162,34.2004],
    '贵阳': [106.6992,26.7682],
    '连云港': [119.1248,34.552],
    '邢台': [114.8071,37.2821],
    '邯郸': [114.4775,36.535],
    '郑州': [113.4668,34.6234],
    '鄂尔多斯': [108.9734,39.2487],
    '重庆': [107.7539,30.1904],
    '金华': [120.0037,29.1028],
    '铜川': [109.0393,35.1947],
    '银川': [106.3586,38.1775],
    '镇江': [119.4763,31.9702],
    '长春': [125.8154,44.2584],
    '长沙': [113.0823,28.2568],
    '长治': [112.8625,36.4746],
    '阳泉': [113.4778,38.0951],
    '青岛': [120.4651,36.3373],
    '韶关': [113.7964,24.7028],
    /*广州市*/
    '茂名': [110.9140,21.6717],
    '阳江':[111.9626,21.8568],
    '潮州':[116.6265,23.6636],
    '汕尾':[115.4338,22.8200],
    '云浮':[112.0348,22.9129],
    '湛江':[110.3741,21.2799],
    '梅州':[116.1243,24.3289],
    '揭阳':[116.3733,23.5674],
    /*国外*/
    '香港':[114.1726,22.2803],
    '澳门':[113.5477,22.1974],
    '台湾':[120.8068,23.9793],
    '美国':[-74.3264,40.8417],
    '泰国':[100.4294,13.8150],
    '日本':[139.6709,35.8165],
    '马来西亚':[139.6709,35.8165],
    '越南':[105.7785,21.0977],
    '新加坡':[103.9019,1.2969],
    '澳大利亚':[133.0065,-26.8416],
    '英国':[-0.5946,51.6608],
    '印度尼西亚':[106.9191,-6.2476],
    '法国':[2.7168,48.9760],
    '俄罗斯':[37.8556,55.7606],
    '加拿大':[-116.1664,59.5625],
    '德国':[10.5925,51.0967],
    '阿联酋':[56.0707,25.4977],
    '韩国':[127.4522,36.4990],
    '柬埔寨':[104.9339,11.6795],
    '意大利':[12.6898,41.9053],
    '菲律宾':[121.0499,14.6719],
    '瑞士':[7.4282,46.9877],
    '奥地利':[16.3877,48.1949],
    '新西兰':[174.7884,-41.1928],
    '土耳其':[32.7613,39.8599],
    '荷兰':[4.7974,52.3478],
    '挪威':[10.831756,59.956972]

};
var geoScenicCoordMap = {
    /*景区经纬度*/
    'GZ_CLLYDJQ':[113.328722,23.007393],
    'ZH_ZHCLHYWG':[113.551148,22.103192],
    'SZ_DBHQC':[114.298278,22.631801],
    'FS_XQSFJMSQ':[112.985315,22.932944],
    'SG_DXS':[113.742999,25.037404],
    'ZQ_DHS':[112.559443,23.168612],
    'MZ_YNFJQ':[116.378317,24.386517],
    'QY_LZDXH':[112.331487,25.009768],
    'GZ_GZFJC':[113.3100,23.3946],
    'GZ_PYCL':[113.328722,23.007393],
    'SZ_SZFJC':[113.8232,22.6276],
    'YJ_HLD':[111.8794,21.5900],
    'HZ_XLW':[114.7623,22.6965],
    'JM_SXCD':[112.6990,21.8540],
    'GZ_GZHCZ':[113.2640,23.1550],
    'GZ_BYS':[113.3120,23.1841],
    'GZ_LNYXY':[113.4126,23.0423],
    'SZ_SZGTZ':[114.0355,22.6151],
    'SZ_SZHCZ':[114.1236,22.5379],
    'ZH_CLHYGY':[113.551148,22.103192],
    'GZ_GDKXZX':[113.368967,23.045284],
    'GZ_GZGTZ':[113.275872,22.995057],
    'GZ_GZDWY':[113.309834,23.148899],
    'GZ_GZT':[113.331084,23.112223],
    'GZ_HNZWY':[113.374057,23.187749]
};
var hotMapTestData = [
    {"lng":116.421191,"lat":39.926572,"count":1},
    {"lng":116.419612,"lat":39.917119,"count":9},
    {"lng":116.418237,"lat":39.921337,"count":54},
    {"lng":116.423776,"lat":39.921919,"count":26},
    {"lng":116.417694,"lat":39.92536,"count":17},
    {"lng":116.415377,"lat":39.914137,"count":19},
    {"lng":116.417434,"lat":39.914394,"count":43},
    {"lng":116.42588,"lat":39.922622,"count":27},
    {"lng":116.418345,"lat":39.919467,"count":8},
    {"lng":116.426883,"lat":39.917171,"count":3},
    {"lng":116.423877,"lat":39.916659,"count":34},
    {"lng":116.415712,"lat":39.915613,"count":14},
    {"lng":116.419869,"lat":39.931416,"count":12},
    {"lng":116.416956,"lat":39.925377,"count":11},
    {"lng":116.42066,"lat":39.925017,"count":38},
    {"lng":116.416244,"lat":39.920215,"count":91},
    {"lng":116.41929,"lat":39.915908,"count":54},
    {"lng":116.422116,"lat":39.919658,"count":21},
    {"lng":116.4183,"lat":39.925015,"count":15},
    {"lng":116.421969,"lat":39.913527,"count":3},
    {"lng":116.422936,"lat":39.921854,"count":24},
    {"lng":116.41905,"lat":39.929217,"count":12},
    {"lng":116.424579,"lat":39.914987,"count":57},
    {"lng":116.42076,"lat":39.915251,"count":70},
    {"lng":116.425867,"lat":39.918989,"count":8}];


//8type=‘份’时，结果数据要交‘%’的标注柱状图
function buildStandardBarShare(){
	var option = {
			color: ['#00FFCC','#999933','#66FF00'],
		    title : {
		        text: ' ',
		        subtext: ' '
		    },
		    grid: [
		            {x: '3%', y: '10%', width: '94%', height: '80%',x2:'1%', y2: '3%'},
		          ],
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		    	 textStyle: {
		                color: '#fff',
		                fontSize:15
		            },
		            selected:{
			        	'上月':false,
			        	'去年同期':false
			        },
		        data:['当前','上月','去年同期']
		    },
		    calculable : true,
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap: true,
		            axisLabel:{
		                color:'#fff',
		                interval:0,
		                rotate:15,//倾斜度 -90 至 90 默认为0
		                textStyle:{
		                	fontSize:15,
		                }
		            },
		            axisLine:{
		                lineStyle:{
		                    color:'#fff'
		                }
		            },
		            data : [ ]
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisLabel:{
		                color:'#fff',
		                rotate:-50,//倾斜度 -90 至 90 默认为0
		                textStyle:{
		                	fontSize:15,
		                },
		                formatter: function(value,index){//纵坐标单位转换
		                    return value+'%';
		                   }
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
		        }
		    ],
		    series : [
		        {
		            name:'当前',
		            type:'bar',
		            data:[],
		            barCategoryGap:'10%',
		            barGap:'40%',
			        itemStyle : {
						normal : {
							label: {
						          show: true,
						          position: 'top',
						          formatter:function(e){
						        	  return e.value+'%'
						          },
						          textStyle: {
						            color: '#FFFF00',
						            fontSize:15
						      }
						   },
						},

			        }
		        },
		        {
		            name:'去年同期',
		            type:'bar',
		            data:[ ],
		            barCategoryGap:'10%',
		            barGap:'40%',
		            itemStyle : {
						normal : {
							label: {
						          show: true,
						          position: 'top',
						          formatter:function(e){
						        	  return e.value+'%'
						          },
						          textStyle: {
						            color: '#FFFF00',
						            fontSize:15
						      }
						   }
						},

			        }
		           
		        },
		        {
		            name:'上月',
		            type:'bar',
		            data:[ ],
		            barCategoryGap:'10%',
		            barGap:'40%',
		            itemStyle : {
						normal : {
							label: {
						          show: true,
						          position: 'top',
						          formatter:function(e){
						        	  return e.value+'%'
						          },
						          textStyle: {
						            color: '#FFFF00',
						            fontSize:15
						      }
						   }
						},

			        }
		           
		        }
		    ]
		};
	return option;
}

//8type=‘销’ and 指标为  品牌忠诚度时，结果数据要交‘*100%’的标注柱状图
function buildStandardBarLoyalty(){
	var option = {
			color: ['#00FFCC','#999933','#66FF00'],
		    title : {
		        text: ' ',
		        subtext: ' '
		    },
		    grid: [
		            {x: '3%', y: '10%', width: '94%', height: '80%',x2:'1%', y2: '3%'},
		          ],
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		    	 textStyle: {
		                color: '#fff',
		                fontSize:15
		            },
		            selected:{
			        	'上月':false,
			        	'去年同期':false
			        },
		        data:['当前','上月','去年同期']
		    },
		    calculable : true,
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap: true,
		            axisLabel:{
		                color:'#fff',
		                interval:0,
		                rotate:15,//倾斜度 -90 至 90 默认为0
		                textStyle:{
		                	fontSize:15,
		                }
		            },
		            axisLine:{
		                lineStyle:{
		                    color:'#fff'
		                }
		            },
		            data : [ ]
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisLabel:{
		                color:'#fff',
		                rotate:-50,//倾斜度 -90 至 90 默认为0
		                textStyle:{
		                	fontSize:15,
		                },
		                formatter: function(value,index){//纵坐标单位转换
		                    return value*100+'%';
		                   }
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
		        }
		    ],
		    series : [
		        {
		            name:'当前',
		            type:'bar',
		            data:[],
		            barCategoryGap:'10%',
		            barGap:'40%',
			        itemStyle : {
						normal : {
							label: {
						          show: true,
						          position: 'top',
						          formatter:function(e){
						        	  return (e.value*100).toFixed(0)+'%'
						          },
						          textStyle: {
						            color: '#FFFF00',
						            fontSize:15
						      }
						   },
						},

			        }
		        },
		        {
		            name:'去年同期',
		            type:'bar',
		            data:[ ],
		            barCategoryGap:'10%',
		            barGap:'40%',
		            itemStyle : {
						normal : {
							label: {
						          show: true,
						          position: 'top',
						          formatter:function(e){
						        	  return (e.value*100).toFixed(0)+'%'
						          },
						          textStyle: {
						            color: '#FFFF00',
						            fontSize:15
						      }
						   }
						},

			        }
		           
		        },
		        {
		            name:'上月',
		            type:'bar',
		            data:[ ],
		            barCategoryGap:'10%',
		            barGap:'40%',
		            itemStyle : {
						normal : {
							label: {
						          show: true,
						          position: 'top',
						          formatter:function(e){
						        	  return (e.value*100).toFixed(0)+'%'
						          },
						          textStyle: {
						            color: '#FFFF00',
						            fontSize:15
						      }
						   }
						},

			        }
		           
		        }
		    ]
		};
	return option;
}

function buildChartOptionShare() {
    var option = {
      title : {
    		        text: ' ',
    		        subtext: ' ',
    		        x:'center',
    		        y:'bottom',
    		        textStyle: {
    		            fontSize:18,//同比环比的字体
    		            fontWeight: 'bolder',
    		            color: '#fff'
    		        }
    	},
        tooltip: {
            trigger: 'item',
            //formatter: "{a} <br/>{b} : {c}人 ({d}%)"
            formatter: "{b}:<br/>{c}({d}%)"
        },
        legend: {
            data: [],
            selected: {
                /*'降水量' : false*/
            } ,
        textStyle:{
        	color: '#fff',
        	fontSize:18   //各扇区的菜单
        }
        },
        //'#199ff4','#da9c00','#5760ff','#6f32cd','#9dff5c','#5bfdff'
        // '#FFCC66','#FF9900','#FF9966','#CC3300','#33FF00','#FFCCCC','#FFFF33'
        color:['#99CCFF','#9933FF','#330099','#003366','#006699','#3300CC','#6699FF'],
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
                    	borderWidth:2,
		        		borderColor:'#fff',
                        labelLine: {
                            length: 1
                        },
                        label: {
                            show: true,
                            fontSize:22,
                            /*formatter: '{b}:{d}%'*/
                            formatter:function(e){
                         	   var newStr=" ";
						            var start,end;
						             var name_len=e.name.length; //每个内容名称的长度
						            var max_name=3;//每行最多显示的字数
						            var new_row = Math.ceil(name_len / max_name);// 最多能显示几行，向上取整比如2.1就是3行
						            if(name_len>max_name){//如果长度大于每行最多显示的字数
						            for(var i=0;i<new_row;i++){//循环次数就是行数
						            var old=''; //每次截取的字符
						            start=i*max_name; //截取的起点
						            end=start+max_name;//截取的终点
						            if(i==new_row-1){//最后一行就不换行了
						            old=e.name.substring(start);
						            }else{
						            	old=e.name.substring(start,end)+"\n";    
						                 }
						                 newStr+=old;//拼接字符串
						                 }
						                 }else{ //如果小于每行最多显示的字数就返回原来的字符串
						                 newStr=e.name;
						                 }
						                 return newStr+'\n'+e.value+'%';          
							}  ,
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

//标注柱状图-收
function buildStandardBarIncome(){
	var option = {
		      color: ['#00FFCC','#999933','#66FF00'],//'#00FFCC','#999933','#66FF00'
		    title : {
		        textStyle: {
		            color: '#fff'
		        }   
		    },
		    grid: [
		            {x: '3%', y: '10%', width: '94%', height: '80%',x2:'1%', y2: '3%'},
		          ],
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		    	 textStyle: {
		                color: '#fff',
		                fontSize:15
		            },
		        data:['当前','上月','去年同期'],
		        selected:{
		        	'上月':false,
		        	'去年同期':false
		        }
		    },
		    calculable : true,
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap: true,
		            axisLabel:{
		                color:'#fff',
		                interval:0,
		                rotate:15,//倾斜度 -90 至 90 默认为0
		                textStyle:{
		                	fontSize:15,
		                }
		            },
		            axisLine:{
		                lineStyle:{
		                    color:'#fff'
		                }
		            },
		            data : [ ]
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisLabel:{
		                color:'#fff',
		                rotate:-50,//倾斜度 -90 至 90 默认为0
		                textStyle:{
		                	fontSize:15,
		                },
		                formatter: function(value,index){//纵坐标单位转换
		                    if(Math.abs(value/10000)>=1){
		                    return (value/10000).toFixed(0)+" 亿";
		                    }else if(Math.abs(value/1000)>=1){
		                    return (value/1000).toFixed(0)+"千万";
		                    }else if(Math.abs(value/100)>=1){
		                    return (value/100).toFixed(0)+"百万";
		                    }else if(Math.abs(value)>=1){
		                    return (value).toFixed(0)+" 万";
		                    }else{
		                    return value;
		                    }
		                   }
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
		        }
		    ],
		    series : [
		        {
		            name:'当前',
		            type:'bar',
		            data:[],
		            barCategoryGap:'10%',
		            barGap:'40%',
			        itemStyle : {
						normal : {
							label: {
						          show: true,
						          position: 'top',
						          textStyle: {
						            color: '#FFFF00',
						            fontSize:15
						      }
						   },
						},

			        }
		        },
		        {
		            name:'去年同期',
		            type:'bar',
		            data:[ ],
		            barCategoryGap:'10%',
		            barGap:'40%',
		            itemStyle : {
						normal : {
							label: {
						          show: true,
						          position: 'top',
						          textStyle: {
						            color: '#FFFF00',
						            fontSize:15
						      }
						   }
						},

			        }
		           
		        },
		        {
		            name:'上月',
		            type:'bar',
		            data:[ ],
		            barCategoryGap:'10%',
		            barGap:'40%',
		            itemStyle : {
						normal : {
							label: {
						          show: true,
						          position: 'top',
						          textStyle: {
						            color: '#FFFF00',
						            fontSize:15
						      }
						   }
						},

			        }
		           
		        }
		    ]
		};
	return option;
}