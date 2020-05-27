$(document).ready(function() {
    //顶部菜单切换
    $("#menu li").attr("class","drop");
    $("#xfzzlBigData").attr("class","active"); 
	$(".select").select2();
	title_tip();
	
	//标签打开后触发
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		//e.relatedTarget 前一个激活的标签页
		var curTab = e.target; // 激活的标签页
		var href = curTab.href;
		var index = href.indexOf("#");
		var curId = href.substr(index + 1,href.length);
		
		if('xfz'==curId && isReloadXfz==true){
			listPortray();
			isReloadXfz = false;
		}
		if('zdtz'==curId && isReloadZdtz==true){
			listPortrayZdtz();
			isReloadZdtz = false;
		}  
		if('jlfx'==curId && isReloadJlfx==true){
			listPortrayJlfx();
			isReloadJlfx = false;
		}  
	});
	cmccCntyNamReload();
	cmBrandReload();
});

//是否重新加载要打开的标签页
var isReloadXfz = false;
var isReloadZdtz = true;
var isReloadJlfx = true;

function query(){
	blockImg();//弹出旋转进度
	var $curTab = $(".tab-pane.fade.in.active");
	var curId = $curTab.attr("id");
	
	if('xfz'==curId){
		listPortray();
		isReloadXfz = false;
		isReloadZdtz = true;
		isReloadJlfx = true;
	}
	if('zdtz'==curId){
		listPortrayZdtz();
		isReloadZdtz = false;
		isReloadXfz = true;
		isReloadJlfx = true;
	}  
	if('jlfx'==curId){
		listPortrayJlfx();
		isReloadJlfx = false;
		isReloadXfz = true;
		isReloadZdtz = true;
	}  
	 setTimeout(function () {$.unblockUI(); }, 1000);//细微延迟后关闭进度效果
	
}

//点击地市
function clickCmccBranchCd(){
	cmccCntyNamReload();
	cmBrandReload();
}

//区县cmccCntyNam
function cmccCntyNam(cmccCntyNams){	
	var id = "cmccCntyNam";    
    $("#"+id).empty();
    $("#"+id).append("<option value=''>全部</option>"); 
	$.each(cmccCntyNams, function(idx, item) {
		$("#"+id).append("<option value='"+item.id+"'>"+item.text+"</option>");
	});   
}

//当前终端品牌cmBrand 
function cmBrand(cmBrands){	
	var id = "cmBrand";
	
	var value = $("#"+id).val();
    $("#"+id).empty();
    $("#"+id).append("<option value=''>全部</option>");
    $("#"+id).select2({    	
    	data:cmBrands,    	
    });
    if(!isEmptyObject(value) && isContain(cmBrands,value)){  //加载列表并设置成然来的值,而当前终端机型不变
    	$("#"+id).val(value).trigger("change");
    }else{
    	cmTerType([]);
    }
    $("#"+id).off("select2:select").on("select2:select",function(e){ 
    	cmTerTypeReload();
	});
}

function isContain(cmBrands,value){
	$.each(cmBrands, function(idx, item) {
		if(item.id==value){
			return true
		}
	});  
	return false;
}

//当前终端型号cmTerType 
function cmTerType(cmTerTypes){	
	var id = "cmTerType";

    $("#"+id).empty();
    $("#"+id).append("<option value=''>全部</option>");
    $("#"+id).select2({    	
    	data:cmTerTypes,    	
    });
}


function showPortrays(portrays,prefix,ids,shapeId,func){	
	if(ids==null || ids.length==0){
		$.each(portrays, function(index, cusChan) {
			var shapeId = prefix+(index+1);			
			$("#"+shapeId+"_text").text(cusChan.cnName);
			var tip = isEmptyObject(cusChan)?"":((cusChan.tip==null)?"":cusChan.tip);
			$("#"+shapeId+"_text").attr("title",tip);
			
			//加载某个画像
			var ids = [cusChan.id];
			func(ids,shapeId);		     
		});	
	}else{
		  var paint = initEcharts(echarts,shapeId);
		  var cusChan = portrays[0];
		
	      if(cusChan.showType==4){ //柱状图
		   	   if(isEmptyObject(cusChan.detail)){
			   		paint.clear();
			   		paint.dispose();
			   		return;
				}
		   	   if(isEmptyObject(cusChan.value)){
			   		paint.clear();
			   		paint.dispose();
			   		return;
				}	
	    	  
		 	   var detail = (cusChan.detail).split(',');
			   var value = (cusChan.value).split(',');
			   
			   var option = oneBar();
			   $.each(detail, function(idx, item) {
				   option.xAxis[0].data.push(item);
			   });
			   
			   var newValues = [];
			   $.each(value, function(idx, item) {
				   if(wanMore(value)){
					   item = toDecimal2(item);
				   }else{
					   item = parseFloat(item).toFixed(2);
				   }
				   newValues.push(item);				   			   
			   });
			   option.series[0].data = newValues;	
			   
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
			   
			   //option.series[0].barWidth=20;
		       paint.setOption(option);	   
		  }	
	      
	      if( cusChan.showType==5){ //饼图
		   	   if(isEmptyObject(cusChan.detail)){
			   		paint.clear();
			   		paint.dispose();
			   		return;
			   }
		   	   if(isEmptyObject(cusChan.value)){
			   		paint.clear();
			   		paint.dispose();
			   		return;
				}	
	    	  
			   var detail = (cusChan.detail).split(',');
			   var value = (cusChan.value).split(',');
			   
			   var option = buildChartOption2(); 
			   //单位：万
			   if(wanMore(value)){
				   option.tooltip.formatter = "{b}:({d}%)<br/>{c}万";
				   option.series[0].itemStyle.normal.label.formatter='{b}:({d}%)\n{c}万';
				   var newValues = [];
				   $.each(value, function(idx, item) {
					   if(wanMore(value)){
						   item = toDecimal2(item);
					   }else{
						   item = parseFloat(item).toFixed(2);
					   }
					   newValues.push(item);				   			   
				   });
				   value = newValues;
			   }
		       for(var i=0; i<detail.length;i++){
		    	   option.series[0].data.push({value:value[i], name:detail[i]});
		       }
	
		       option.series[0].center=['50%', '50%'];
		       paint.setOption(option);		   
		  }	
	      
	      if( cusChan.showType==44){
		   	   if(isEmptyObject(cusChan.detail)){
		   		paint.clear();
		   		paint.dispose();
		   		return;
			   }
			   var detail = (cusChan.detail).split(';');
			   var detail_pre = detail[0];
			   var name1 = detail_pre.split(',')[0];
			   var name2 = detail_pre.split(',')[1];
			   var details = detail[1].split(',');
			   
			   var value = (cusChan.value).split(';');
			   var values1 = value[0].split(',');
			   var values2 = value[1].split(',');
			   
			   var option = oneBar2();
			   
			   option.xAxis[0].data = details;
			   
			   option.series[0].name = name1;	
			   option.series[0].data = values1;	
			   
			   option.series[1].name = name2;	
			   option.series[1].data = values2;	
			   
			   option.legend.data=[name1,name2];
			   paint.setOption(option);		
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
            formatter: "{b}:({d}%)<br/>{c}"
        },
        grid: {
        	containLabel: true
        },
        legend: {
            data: [],
            selected: {
                /*'降水量' : false*/
            } ,
        textStyle:{color: '#fff'}
        },
        //  '#FFCC66','#FF9900','#FF9966','#CC3300','#996666','#FFCCCC','#FFFF33'
        color:['#199ff4','#da9c00','#6f32cd','#FFCC66','#9dff5c','#5bfdff'],
        series: [
            {
                name: '人数',
                type: 'pie',
                radius: '50%',
                center: ['50%', '50%'],
                selectedMode: 'single',
                data: [],
                itemStyle: { 
                    normal: {
                        labelLine: {
                            length: 1
                        },
	                    label: {
	                        show: true,
	                        //position:"inner",
	                        fontSize:16,
	                        formatter: '{b}:\n{c}({d}%)',
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
           data:[],
           textStyle:{
        	   color: '#fff'
           }
       },    		
       color: ['#1ADDF9'],
       grid: {
            borderWidth: 0,
            x: 0,
            x2: 0,
            y: 20,
            y2: 10,
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
                margin: 15,
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
        series: [
        {
            name: '',
            type: 'bar',
            //stack:'same',           
            barWidth: 30,
            label:{
                normal:{
                    show:true,
                    fontSize:17,
                    position:'top',
                    color:'yellow',
                    formatter: "{c}"
                }
            },
            data: []
        },{
            name:'',
            type:'bar',
            //stack:'same', 
            color:'#aed4c2',
            barWidth: 30,
            label:{
                normal:{
                    show:true,
                    fontSize:17,
                    position:'top',
                    color:'yellow',
                    formatter: "{c}"
                }
            },            
            data:[]
        }]
    };
    return option;
};








