
//页面一加载就执行的js事件

window.onload = function() {
	
	
	document.getElementById("month_1").value ="2020-01";
	document.getElementById("month_2").value ="2020-02";
	selelctAll();
	getRoundDate();	//加载圆形图表
	//getFontDate();
	//jqgridInit();
	 document.getElementById("sub_dim").style.display="none";//隐藏
	 document.getElementById("sub_dim3").style.display="none";//隐藏
	 document.getElementById("sub_dim4").style.display="none";//隐藏
	 document.getElementById("sub_dim5").style.display="none";//隐藏
	 document.getElementById("sub_dim6").style.display="none";//隐藏
}











$.extend({
    StandardPost:function(url,args){
        var form = $("<form method='post'></form>"),
            input;
        form.attr({"action":url});
        form.attr({"target":"_self"});
        $.each(args,function(key,value){
            input = $("<input type='hidden'>");
            input.attr({"name":key});
            input.val(value);
            form.append(input);
        });
        form.prependTo(document.body);
        form.submit();
        document.body.removeChild(form[0]);
    }
});  

function rondStart(month1){
    var month0 = month1.substring(0,4);     //年  
    var month01= month1.substring(5,7);     //月  
    var d = new Date(month0, month01, 0);   //Wed Mar 31 00:00:00 UTC+0800 2010  
    var daysCount = d.getDate();
    //var start=month1+"-"+daysCount;
    var start=month1+"-"+"01";	

    return start;

}
//月份结束时间 
function rondEnd(month2){
    var month3 = month2.substring(0,4);     //年  
    var month03= month2.substring(5,7);     //月  
    var f = new Date(month3, month03, 0);   //Wed Mar 31 00:00:00 UTC+0800 2010  
    var tt = f.getDate();
	var end=month2+"-"+tt;
    return end;
}

// 查询功能的实现

function selelctAll(){
	 document.getElementById("sub_dim").style.display="none";//隐藏
	 document.getElementById("sub_dim3").style.display="none";//隐藏
	 document.getElementById("sub_dim4").style.display="none";//隐藏
	 document.getElementById("sub_dim5").style.display="none";//隐藏
	 document.getElementById("sub_dim6").style.display="none";//隐藏
	//时间类型
	var timeKind=$("#model_DURATION2").val();
	var pp=$("#model_DURATION2").val();
	var lsltype="1";
	var datetype="1";
	if(timeKind=="1"){
		//代表是月份
		var datevalue =$("#month_1").val();
		var endMonth=$("#month_2").val();
		var month1=$("#month_1").val();
		var month2= $("#month_2").val();
		var start=rondStart(datevalue);	
	    var end=rondEnd(endMonth);	
		
		
		
		//var kind="2";
		//$.StandardPost(basePath+'/InternetRote/deleteModel.do',{'lsltype':lsltype,'datetype':datetype,'datevalue':datevalue ,'endMonth':endMonth,'kind':kind});
	
		 $.ajax({  
		        type: "post",  
		        url: "../InternetRote/deleteModel.do",  
		       data:{'lsltype':lsltype,'datetype':datetype,'datevalue':start ,'endMonth':end,'pp':pp,'month1':datevalue,'month2':endMonth},
		        dataType: 'json',  
		        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
		        success: function(result) {  
		        	$("#zwtcyhs").html(result.selectDate);
					$("#zsrz").html(result.dateI);
					$("#zfgz").html(result.baifen);
		        	if(result.tip!=null){
		          	   
		           	  alert(result.tip); 
		           	 
		              
		              } 
		        
		        }  
		    });
		
		 $.ajax({
				url : "../InternetRote/takeOver.do",
				type : "post",
				async : false,
				cache : false,
				dataType : "json",
				data : {
					'start' : start,
					'end' : end,
					 'pp':pp
					 
				},
				success : function(data) {
				 var loadReapt=echarts.init(document.getElementById("pie_char_Mom"));
					
					
					if (!isEmptyObject(data)) {
					var	text = '互联网销量(KPI完成情况)-大类' ;
					var text1="";
					//var	title =['配件','手机','智能硬件','功能机']; 
					var	title =data.nameList;
						getPaint9(
								"pie_char", text, title, data.dateList);
						getPaint9(
								"pie_char_Mom", text1, title, data.dateList1);

					} else {
						alert("当前日期无数据展示。");
					}

				}
			});
		 
		 
		 
		
		
		
		
		
	
	}else if(timeKind=="2"){
	//代表是日期	
		var datevalue =$("#day_1").val();
		var endMonth=$("#day_2").val();
		var kind="1";
		//$.StandardPost(basePath+'/InternetRote/deleteModel.do',{'lsltype':lsltype,'datetype':datetype,'datevalue':datevalue ,'endMonth':endMonth,'kind':kind});	
		 $.ajax({  
		        type: "post",  
		        url: "../InternetRote/deleteModel.do",  
		       data:{'lsltype':lsltype,'datetype':datetype,'datevalue':datevalue ,'endMonth':endMonth,'pp':pp,'month1':datevalue,'month2':endMonth},
		        dataType: 'json',  
		        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
		        success: function(result) {
		        	$("#zwtcyhs").html(result.selectDate);
					$("#zsrz").html(result.dateI);
					$("#zfgz").html(result.baifen);
		        	
		        	
		        	 if(result.tip!=null){
		          	   
		           	  alert(result.tip); 
		           	 
		              
		              } 
		        
		        }  
		    });
	
	
		 $.ajax({
				url : "../InternetRote/takeOver.do",
				type : "post",
				async : false,
				cache : false,
				dataType : "json",
				data : {
					'start' : datevalue,
					'end' : endMonth,
					 'pp':pp
				},
				success : function(data) {
				 var loadReapt=echarts.init(document.getElementById("pie_char_Mom"));
					
					
					if (!isEmptyObject(data)) {
					var	text = '互联网销量(KPI完成情况)-大类' ;
					var text1="";
					//var	title =['配件','手机','智能硬件','功能机']; 
					var	title =data.nameList;
						getPaint9(
								"pie_char", text, title, data.dateList);
						getPaint9(
								"pie_char_Mom", text1, title, data.dateList1);

					} else {
						alert("当前日期无数据展示。");
					}

				}
			});
	
	
	
	
	
	
	
	
	
	
	
	}
	
	
	
	
	
	
	
} 	 

//get提交的方式
$.extend({
    StandardGet:function(url,args){
        var form = $("<form method='get'></form>"),
            input;
        form.attr({"action":url});
        form.attr({"target":"_self"});
        $.each(args,function(key,value){
            input = $("<input type='hidden'>");
            input.attr({"name":key});
            input.val(value);
            form.append(input);
        });
        form.prependTo(document.body);
        form.submit();
        document.body.removeChild(form[0]);
    }
});


//--------------------------------------------圆饼图demo----------------------------------------



//查询按钮的点击事件  










//获取后台数据显示到圆图上面
function getRoundDate(obj){
	var timeKind=obj;//查询类型
	var pp=	$("#model_DURATION2").val();//时间类型
	if (pp == "1") {
		//月份;
//		var month1=$("#month_1").val();
//		var month2= $("#month_2").val();
	var month1=$("#month_1").val();
	var month2= $("#month_2").val();
	var start=rondStart(month1);	
    var end=rondEnd(month2);	
		
	$.ajax({
		url : "../InternetRote/takeOver.do",
		type : "post",
		async : false,
		cache : false,
		dataType : "json",
		data : {
			'start' : start,
			'end' : end,
			 'timeKind':timeKind,
			 'pp':pp
			 
		},
		success : function(data) {
		 var loadReapt=echarts.init(document.getElementById("pie_char_Mom"));
			
			
			if (!isEmptyObject(data)) {
			var	text = '互联网销量(KPI完成情况)-大类' ;
			var text1="";
			//var	title =['配件','手机','智能硬件','功能机']; 
			var	title =data.nameList;
				getPaint9(
						"pie_char", text, title, data.dateList);
				getPaint9(
						"pie_char_Mom", text1, title, data.dateList1);
				
				for (var i = 0; i < data.nameList.length; i++) {
					$("#recordSet").append(
							"<option value='"+data.nameList[i]+"'>"
									+ data.nameList[i] + "</option>");	
				}

			} else {
				alert("当前日期无数据展示。");
			}

		}
	});	

	}	
	
	if (pp == "2") {
		//月份;

	var start=$("#day_1").val();
	var end=$("#day_2").val();
		
		$.ajax({
			url : "../InternetRote/takeOver.do",
			type : "post",
			async : false,
			cache : false,
			dataType : "json",
			data : {
				'start' : start,
				'end' : end,
				 'timeKind':timeKind,
				 'pp':pp
				 
			},
			success : function(data) {
			 var loadReapt=echarts.init(document.getElementById("pie_char_Mom"));
				
				
				if (!isEmptyObject(data)) {
				var	text = '互联网销量(KPI完成情况)-大类' ;
				var text1="";
				//var	title =['配件','手机','智能硬件','功能机']; 
				var	title =data.nameList;
					getPaint9(
							"pie_char", text, title, data.dateList);
					getPaint9(
							"pie_char_Mom", text1, title, data.dateList1);

				} else {
					alert("当前日期无数据展示。");
				}

			}
		});	
		
		
		
		
	}		
	//var brand = $("#select1").val();
	//var model = $("#select2").val();
	
}





//获取数据显示在长方形上


function getFontDate(obj){
	var timeKind=obj;
	var type=$("#recordSet").val();
	var pp=	$("#model_DURATION2").val();
	if (pp == "1") {
		//月份;
		var month1=$("#month_1").val();
		var month2= $("#month_2").val();
		var start=rondStart(month1);	
	    var end=rondEnd(month2);	
		
	$.ajax({
		url : "../InternetRote/takeBrand.do",
		type : "post",
		async : false,
		cache : false,
		dataType : "json",
		data : {
			'start' : start,
			'end' : end,
			'type':type,
			'timeKind':timeKind,
			'pp':pp
		},
		success : function(data) {
		 var loadReapt=echarts.init(document.getElementById("sub_char_row2"));
		 document.getElementById("sub_dim3").style.display="none";//隐藏
		 document.getElementById("sub_dim4").style.display="none";//隐藏
		 document.getElementById("sub_dim5").style.display="none";//隐藏
		 document.getElementById("sub_dim6").style.display="none";//隐藏

			if (!isEmptyObject(data)) {
			var	text = '互联网销量(KPI完成情况)-大类-品牌' ;
			
			//var	title =['配件','手机','智能硬件','功能机']; 
		
			   getPaint11(
						"sub_char_row2", text,data);
				/*getPaint9(
						"pie_char_Mom", text1, title, data.dateList1);*/

			}else{
				
				
				alert("当前日期无数据展示。");
				}

		}
	});	

	}	
	
	if (pp == "2") {
		//日期;

	var start =$("#day_1").val();
	
	var end = $("#day_2").val();
		$.ajax({
			url : "../InternetRote/takeBrand.do",
			type : "post",
			async : false,
			cache : false,
			dataType : "json",
			data : {
				'start' : start,
				'end' : end,
				'type':type,
				'timeKind':timeKind,
				'pp':pp
			},
			success : function(data) {
			 var loadReapt=echarts.init(document.getElementById("sub_char_row2"));
			 document.getElementById("sub_dim3").style.display="none";//隐藏
			 document.getElementById("sub_dim4").style.display="none";//隐藏
			 document.getElementById("sub_dim5").style.display="none";//隐藏
			 document.getElementById("sub_dim6").style.display="none";//隐藏

				if (!isEmptyObject(data)) {
				var	text = '互联网销量(KPI完成情况)-大类-品牌' ;
				
				//var	title =['配件','手机','智能硬件','功能机']; 
			
				   getPaint11(
							"sub_char_row2", text,data);
					/*getPaint9(
							"pie_char_Mom", text1, title, data.dateList1);*/

				}else{
					
					
					alert("当前日期无数据展示。");
					}

			}
		});
		
		
		
		
		
		
		
		
	}		
	//var brand = $("#select1").val();
	//var model = $("#select2").val();
	
}















//圆形图 demo
function getPaint9(takeid, text, title, mapData) {
	var dom = document.getElementById(takeid);
	var myChart8 = echarts.init(dom);
	var option = getmyOption();

	
	
	
	
	
	
	option.title.text = text;
	option.legend.data = title;
//	$.each(mapData.dateList, function(key, value) {
//		var m = {};
//		m['value'] = value;
//		m['name'] = key;
//			 value : value.value; 
//			 text : value.text;
//			 //option.series[0] : data.baifenbi,
//			 //option.series[1] : data.dateList
//			 option.series[0].data.push(m);
//		    // option.series[1].data.push(mapData.dateList);
//			      
//		 });     
	$.each(mapData, function(key, value) {
		var m = {};
		m['value'] = value;
		m['name'] = key;
		option.series[1].data.push(m);
	});

	//$.each(mapData.outterMap, function(key, value) {
		/*var m = {};
		m['value'] = value;
		m['name'] = key;*/
		//option.series[1].data.push(mapData.dateList);
	//});

	if (option && typeof option === "object") {
		myChart8.setOption(option, true);

	}
	;
}

function getmyOption() {
	option = {
	color:['#4472C5','#ED7C30','#80FF80','#33ffff','#800080'],
		tooltip : {
			trigger : 'item',
			formatter : "{a} <br/>{b}: {c} ({d}%)"
		},
		legend : {
			//data :[{name: '当前销量'}, {name:'规划销量'}, {name:'对标品销量'},{name: '竞品销量'} ],
			top : '5%',
			icon : 'rect',
			textStyle : { //详见textStyle
				color : 'white'

			}

		},
		toolbox: {
	    	top:0,
	    	right:0, 
	    	itemSize:15,
	    	 itemGap:10,
	    	 backgroundColor:"#063b68", 
	        show: true,
	        feature: {
	            dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: {}
	        },
	      iconStyle:{
                normal:{
                  color:'#33ffff',//设置颜色
                  
                }
            }
		
		
	    },
		title : {
			//text : '五线七口销量 ',
			backgroundColor : '#4682B4',//设置背景颜色

			x : 'left', // 水平安放位置，默认为左对齐，可选为：
			// 'center' ¦ 'left' ¦ 'right'
			// ¦ {number}（x坐标，单位px）
			y : '1px',
			textStyle : { //详见textStyle
				color : 'white'

			}

		},

		series : [ {
			name : '数据来源',
			type : 'pie',
			selectedMode : 'single',
			radius : [ 0, '30%' ],

			label : {
				normal : {
					position : 'inner'
				}
			},
			labelLine : {
				normal : {
					show : false
				}
			},
			data : []
		/* [
					                {value:335, name:'家庭政企', selected:true},
					                {value:679, name:'自有渠道'},
					                {value:1548, name:'零售售后'},
					                {value:1948, name:'铁通'},
					                {value:1948, name:'社会渠道'},
					                {value:1948, name:'电子渠道'},
					                {value:1948, name:'零星采购'}
					                ] */
		}, {
			name : '',
			type : 'pie',
			radius : [ '30%', '55%' ],
			label : {
				normal : {
					formatter : '{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
					backgroundColor : '#00063c',
					borderColor : 'white',
					borderWidth : 1,
					borderRadius : 4,
					// shadowBlur:3,
					// shadowOffsetX: 2,
					// shadowOffsetY: 2,
					// shadowColor: '#999',
					// padding: [0, 7],
					rich : {
						a : {
							color : '#999',
							lineHeight : 6,
							align : 'center'
						},
						// abg: {
						//     backgroundColor: '#333',
						//     width: '100%',
						//     align: 'right',
						//     height: 22,
						//     borderRadius: [4, 4, 0, 0]
						// },
						hr : {
							borderColor : '#aaa',
							width : '100%',
							borderWidth : 0.5,
							height : 0
						},
						b : {
							fontSize : 12,
							lineHeight : 12
						},
						per : {
							color : '#eee',
							backgroundColor : '#334455',
							padding : [ 2, 4 ],
							borderRadius : 2
						}
					}
				}
			},
			data : []
		
		} ]
	};

	return option;

}



//长方形demo

function getPaint11(container11, text, mapData) {
	var dom = document.getElementById(container11);
	var myChart11 = echarts.init(dom);
	var option = getOptioned();
	option.title.text = text;

	option.xAxis[0].data = mapData.nowList;
	option.series[0].data = mapData.nowAmount;

	if (option && typeof option === "object") {
		myChart11.setOption(option, true);

	}
	;
}

function getOptioned() {

	option = {
		color : [ '#3398DB' ],
		tooltip : {
			trigger : 'axis',
			axisPointer : { // 坐标轴指示器，坐标轴触发有效
				type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
			}

		},
		

		title : {
			text : '各地市销量(千万) ',
			backgroundColor : '#4682B4',//设置背景颜色

			x : 'left', // 水平安放位置，默认为左对齐，可选为：
			// 'center' ¦ 'left' ¦ 'right'
			// ¦ {number}（x坐标，单位px）
			y : '10px',
			textStyle : { //详见textStyle
				color : 'white'

			}

		},
		toolbox: {
	    	top:0,
	    	right:0, 
	    	itemSize:20,
	    	 itemGap:10,
	    	 backgroundColor:"#063b68", 
	        show: true,
	        feature: {
	            dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: {}
	        },
	      iconStyle:{
                normal:{
                  color:'#33ffff',//设置颜色
                  
                }
            }
		
		
	    },
		grid : {
			left : '3%',
			right : '4%',
			bottom : '3%',
			containLabel : true,

			color : 'white'

		},
		xAxis : [ {
			splitLine : {
				show : false
			},//去除网格线 

			type : 'category',
			data : [] /* ['广州', '深圳', '佛山', '东莞', '中山', '珠海', '江门','河源','清远','云浮','韶关','惠州','梅州','汕头','汕尾','揭阳','潮州','茂名','湛江','阳江','肇庆'] */,
			axisTick : {
				alignWithLabel : true
			},
			axisLine : {
				lineStyle : {
					color : 'white',
					width : '2px',
				}
			},

		} ],
		yAxis : [ {
			type : 'value',
			splitLine : {
				show : false
			},//去除网格线

			axisLine : {
				show : true,
				lineStyle : {
					color : '#fff'
				},
			},

		} ],
		series : [ {
			name : '数据源',
			type : 'bar',
			stack : '总量',
			barWidth : '60%',
			label : {
				normal : {
					show : true,
					color : 'white',
					position : 'top'
				}
			},
			data : [],/* [298, 625, 800, 334, 390, 330, 220 , 334, 334, 334, 334, 334, 334, 334, 334, 334, 334, 334, 334, 334, 334] */
		} ]
	};

	return option;
}




//其他三个框的点击事件
function chooseDemon(){
	//隐藏全部查询的部分  
	document.getElementById("dim_div").style.display="";//显示	
	document.getElementById("allSearch").style.display="";//显示
	document.getElementById("allTime").style.display="";//显示
	//显示局部查询的部分
	document.getElementById("portTime").style.display="none";//显示
	document.getElementById("partSearch").style.display="none";//显示
	
	
	
	
	
	
	
}






