$(document).ready(function() {
	   //带搜索的下拉框样式初始化
	   $('.select_searchable').select2();
	   //时间控件设置初始时间
	   $(".prevMonth").val(getPrevMonthValue());
	   //城市下拉框初始化
	   citySelectInit($('#citySelect'));
	   //顶部菜单切换
	   $("#menu li").attr("class","drop");
	   $("#shopCover").attr("class","active");
	   title_tip();
	   //	   
	   $("#citySelect").change(function(){
		   pageInit();
	   });
});

function showNumCnt(months,cnts,nums){
	if(isEmptyObject(cnts)){
		cnts = "0";
		for(var i=1; i<months.length; i++){
			cnts = cnts +",0";
		}
	}	
	if(isEmptyObject(nums)){
		nums = "0";
		for(var i=1; i<months.length; i++){
			nums = nums +",0";
		}
	}	
	cnts = cnts.split(',');
	nums = nums.split(',');
	showCnts(months,cnts);
	showNums(months,nums)	
}
function showCnts(months,cnts){
	  var hallCntPaint = initEcharts(echarts,"hall_count"); 
	  var hallCntOption = buildLineChart();	  
	  $.each(months, function(idx, item) {
		  hallCntOption.xAxis.data.push(item);
	  });
	  var index = getSeriesIndex(months,$(".prevMonth").val());
	  $.each(cnts, function(idx, item) {
		   if(index==idx){
			   var obj = {value:item,label: {color: 'yellow', fontSize:'16',fontSize:'26'}};
			   hallCntOption.series[0].data.push(obj);
		   }else{
			   hallCntOption.series[0].data.push(item);
		   }	
	  });	  
	  hallCntPaint.setOption(hallCntOption);
	  
}
function showNums(months,nums){  
	  var numPaint = initEcharts(echarts,"customer_num"); 
	  var numOption = buildLineAreaChart2();
	  $.each(months, function(idx, item) {
		  numOption.xAxis.data.push(item);
	  });
	  var index = getSeriesIndex(months,$(".prevMonth").val());
	  numOption.series[0].label.color="";
	  $.each(nums, function(idx, item) {
		   if(index==idx){
			   var obj = {value:item,label: {color: 'yellow', fontSize:'16',fontSize:'26'}};
			   numOption.series[0].data.push(obj);
		   }else{
			   numOption.series[0].data.push(item);
		   }	
	  });
	  numPaint.setOption(numOption);
	  
      

}

function brndFfff(brndFfff){
	resetDiv($("#store_coverage"));
	resetDiv($("#store_customer_number"));
	 if(isEmptyObject(brndFfff)){
		 return;
	 }
	
	 var names = new Array('高覆盖','中高覆盖','中覆盖','中低覆盖','低覆盖','超低覆盖','零覆盖');
	 var rete = new Array(brndFfff.rete01,brndFfff.rete03,brndFfff.rete05,brndFfff.rete07,brndFfff.rete09,brndFfff.rete11,brndFfff.rete13);
	 var customerRete = new Array(brndFfff.rete02,brndFfff.rete04,brndFfff.rete06,brndFfff.rete08,brndFfff.rete10,brndFfff.rete12,brndFfff.rete14);
	 
	   var baseStationCoveragePaint = initEcharts(echarts,"store_coverage");
	   var option = oneBar2();
	   option.xAxis[0].data = names;
	   $.each(rete, function(idx, item) {
		   item = Math.round(item*100);
		   option.series[0].data.push(item);
	   });
	   baseStationCoveragePaint.setOption(option);	 	 

	   var storeCustomerNumberPaint = initEcharts(echarts,"store_customer_number");
	   var option = oneBar2();
	   option.xAxis[0].data = names;
	   $.each(customerRete, function(idx, item) {
		   item = parseInt(item*100);
		   option.series[0].data.push(item);
	   });
	   storeCustomerNumberPaint.setOption(option);	
}	

function brndTttt(brndTttt){
	resetDiv($("#store_coverage2"));
	resetDiv($("#store_customer_number2"));
	 if(isEmptyObject(brndTttt)){
		 return;
	 }
	
	 var names = new Array('T1','T2','T3','T4','T5','T6');
	 var rete = new Array(brndTttt.rete01,brndTttt.rete03,brndTttt.rete05,brndTttt.rete07,brndTttt.rete09,brndTttt.rete11);
	 var customerRete = new Array(brndTttt.rete02,brndTttt.rete04,brndTttt.rete06,brndTttt.rete08,brndTttt.rete10,brndTttt.rete12);
	 
	   var baseStationCoveragePaint = initEcharts(echarts,"store_coverage2");
	   var option = oneBar2();
	   option.xAxis[0].data = names;
	   $.each(rete, function(idx, item) {
		   item = parseInt(item*100);
		   option.series[0].data.push(item);
	   });
	   baseStationCoveragePaint.setOption(option);	 	 

	   var storeCustomerNumberPaint = initEcharts(echarts,"store_customer_number2");
	   var option = oneBar2();
	   option.xAxis[0].data = names;
	   $.each(customerRete, function(idx, item) {
		   item =  Math.round(item*100);
		   option.series[0].data.push(item);
	   });
	   storeCustomerNumberPaint.setOption(option);
	   
}

//品牌

function showTermBrnd(arr){
	var id = "termBrndNam";   
    $("#"+id).empty();     
    $("#"+id).select2({});
    
    arr = isEmptyObject(arr)?[]:arr;
    $.each(arr,function(index,item){   	
    	$("#"+id).append("<option value='"+item+"'>"+item+"</option>"); 
    });
    
    $("#"+id).off("select2:select").on("select2:select",function(e){ 
    	querySubmit();
	});
}


var oneBar2 = function () {
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
            x2: 20,
            y: 20,
            y2:-10,
            containLabel: true
        },
        tooltip: {
            trigger: 'item',
            formatter: "{b} :<br/> {c}%"
        },
        xAxis: [{
            type: 'category',
            data: [],
            axisLabel: {
                interval: 0,
                interval:0,
                rotate:15,
                margin: 10,
                textStyle: {
                    color: '#fff',
                    align: 'center',
                    fontSize:16,
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
                    formatter: "{c}%"
                }
            },
            data: []
        }]
    };
    return option;
};


