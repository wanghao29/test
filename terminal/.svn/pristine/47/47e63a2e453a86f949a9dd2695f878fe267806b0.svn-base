<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
 <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>量</title>
</head> 

<body>
<style   type="text/css">
.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
    height: 37px;
    margin-top: 5px;
}

.ui-jqgrid .ui-jqgrid-htable th {
    color: #607D8B;
}


.ui-jqgrid .ui-jqgrid-htable th {
    color: #337ab7;
}

 .modal-body {
  position:absolute;
  left:100px;
  top:10px;
  }
/* 设置表格样式 */
.ui-jqgrid .ui-jqgrid-htable th {

text-align: center;
color: #607D8B;
/* background-color:#54abd6; */
 font-size:16px;


}

.ui-jqgrid-htable th.ui-th-column-header {

background-color:#54abd6;

}

.content div { 

color: #607D8B;

}
.ui-jqgrid tr.jqgrow td, .ui-jqgrid {

border: none;

}

.ui-jqgrid .ui-jqgrid-hbox {

border: none;
}
/* 关注维度框设置  */
.cation {
font-size: 15px;
margin-top: -10px;
margin-bottom: 30px;

 position: relative;
  left: 18px;
 
}

.select1 {

width: 100px;
background-color: #f5f5f5;
border-radius: 3px;
}

/* 返回按钮设置 */
.bt5 {
color:white;
width: 120px;
background-color: #337ab7;
border-radius: 3px;
 margin-left: 83%;

}
.jqg-first-row-header {

background-color: #337ab7;

}
#table5 tr td {
width:100px;
text-align: center;
/* padding-top:0px !important;
padding-bottom:0px !important; */

}
/*  #table5 td {
            font-size: 12px;
            width: 200px;
            height: 30px;
            text-align: center;
            background-color: #4f891e;
            color: #ffffff;
        } */
 /* 对超链接的样式进行设置  */
  a:link{text-decoration: none; color:white;font-size: 18px; font-family: 微软雅黑;}
       
        
</style>
<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
<script src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>

 <script type="text/javascript" src="<%=basePath%>resources/js/customerChannel/customerChannel.js?"></script>
 
     <!-- <link href="resources/css/main.css" rel="stylesheet">
    <script type="text/javascript" src="resources/js/plugin/jquery-3.3.1.min.js"></script> -->
  
   <link rel="stylesheet" href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap.css">
    <script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>
 
   
  <div class="row" style=" margin: 20px;z-index: 1000;">
		<!-- 表头控件 -->
	
			
			
			<div class="col-xs-3">
			<label style="font-size: 18px; color: white; font-weight: normal;">时间类型：
			</label>
			
			<select name="times" id="times" onchange ="changeTime()"
				style="border-color: #1addfa; width: 100px; color: white;
				 background-color: #00063c; height: 30px;border-radius: 16px; ">
				<option value="">请选择类型</option>				
				<option value="month">月指标</option>	
				<option value="day" >季指标</option>
				<option value="year">年指标</option>				
			</select>
			</div>		
			

	  <div class="col-xs-3" style="display:none"  id="dayes">
		<label
			 style="font-size: 18px; color: white; font-weight: normal;">&nbsp;&nbsp;&nbsp;季指标:
		</label> 
		<input name="day1" id="day1" 
			type="text" style="width:21%;height: 30px;  background-color: #00063c; 
			border-color: #1addfa; color: white;border-radius: 16px; " readonly="readonly"
			onClick="WdatePicker({dateFmt:'yyyy',maxDate:'%y-{%M}',onpicked:selectDate})" />
	
	
		<label
			 style="font-size: 18px; color: white; font-weight: normal;">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
		 </label>
		 <select name="times" id="tim"
				style="border-color: #1addfa; width: 100px; color: white;
				 background-color: #00063c; height: 30px;border-radius: 16px; ">
				<option value="">请选择季度</option>				
				<option value="one">第一季度</option>	
				<option value="two" >第二季度</option>
				<option value="three">第三季度</option>
				<option value="four">第四季度</option>				
			</select>
	     </div>
      <div class="col-xs-3"  id="mon">
		<label
			 style="font-size: 18px; color: white; font-weight: normal;">&nbsp;&nbsp;&nbsp;月指标:
		</label> 
			
			 <input name="month1" id="month1" 			  
			type="text" style="width:20%;height: 30px;  background-color: 
			#00063c; border-color: #1addfa; color: white;border-radius: 16px; " readonly="readonly"
			onClick="WdatePicker({dateFmt:'yyyy-MM',maxDate:'%y-{%M}',onpicked:selectDate})" />
	
		<label
			 font-size: 18px; color: white; font-weight: normal;">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</label>
		 
		 <input name="month2" id="month2"			 
			type="text" style="width:20%;height: 30px;  background-color: #00063c; 
			border-color: #1addfa; color: white;border-radius: 16px; " readonly="readonly"
			onClick="WdatePicker({dateFmt:'yyyy-MM',maxDate:'%y-{%M}',onpicked:selectDate})" />
	     </div>
	     <!--年指标控件  -->
	     
	     <div class="col-xs-3" style="display:none"  id="year">
		<label
			 style="font-size: 18px; color: white; font-weight: normal;">&nbsp;&nbsp;&nbsp;年指标:
		</label> 
			
			 <input name="month1" id="year1" 			  
			type="text" style="width:20%;height: 30px;  background-color: 
			#00063c; border-color: #1addfa; color: white;border-radius: 16px; " readonly="readonly"
			onClick="WdatePicker({dateFmt:'yyyy',maxDate:'%y-{%M}',onpicked:selectDate})" />
	
		<label
			 font-size: 18px; color: white; font-weight: normal;">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</label>
		 
		 <input name="month2" id="year2"			 
			type="text" style="width:20%;height: 30px;  background-color: #00063c; 
			border-color: #1addfa; color: white;border-radius: 16px; " readonly="readonly"
			onClick="WdatePicker({dateFmt:'yyyy',maxDate:'%y-{%M}',onpicked:selectDate})" />
	     </div>
	     
	     
	<div class="col-xs-3">
	
	
	<button id="customizationModalShow" class="select" name="btName"
			style="width: 55%;height:30px; background-color: #1addfa;border-radius: 16px;
			 margin-left: 5%;" onclick="btn()">
			查询</button>
	
	</div>
	

	</div>
	
   
   
   

<div class="row" style=" margin: 200px;z-index: 1000;">
<div class="col-xs-12">
<div id="container10" align="center" 
style="height: 438px; user-select: none; -webkit-tap-highlight-color: red; "> 
</div>

</div>	
</div>







<script type="text/javascript">
//首先执行的事件
$(document).ready(function(){
	
	documentOnload();
	
	
	
	
	
	
	
	
	
})






$(function(){// dom元素加载完毕
	  $('#list tbody tr:even').css("backgroundColor","#337ab7");
	  //获取id为tb的元素,然后寻找他下面的tbody标签，再寻找tbody下索引值是偶数的tr元素,
	  //改变它的背景色.
	 })

/* 返回事件  */

function goback(){
	
	
	window.history.go(-1);
	
	
}
  
//post提交
$.extend({
    StandardPost:function(url,args){
        var form = $("<form method='post'></form>"),
            input;
        form.attr({"action":url});
        form.attr({"target":"_blank"});
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


/* 时间类型绑定的事件  */

function changeTime(){
  var timed=$("#times").val();		
	
	if(timed=='day'){
		$("#dayes").show();
		$("#mon").hide();
		$("#year").hide();
	}else if(timed=='month'){
		$("#dayes").hide();
		$("#mon").show();
		$("#year").hide();
	}else if(timed=='year'){
		$("#dayes").hide();
		$("#mon").hide();
		$("#year").show();
	}
		
}
//日期控件的js 
function selectDate() {
	//jqgridReload();
}   
//图表控件显示的js
function getPaint10(container10,title,mapData){			
			var dom = document.getElementById(container10);
			var myChart10 = echarts.init(dom);
			var option = getOptions();			
			//option.title.text = text;
			option.legend.data = title;						
			
			option.xAxis[0].data = mapData[0];//2017
			//option.xAxis[1].data = mapData[3];//2018
			option.series[0].name = title[0];//2018
			option.series[1].name = title[1];//2017
			option.series[1].data = mapData[2];//2017
			option.series[0].data = mapData[1];//2018
			option.series[2].data = mapData[3];
			
			
			if (option && typeof option === "object") {
				myChart10.setOption(option, true);

			};
		}	




 function getOptions(){
		var colors = ['#5793f3', '#d14a61', '#675bba'];
		option = {
				textStyle : { //曲线图文字的显示颜色
					color : '#fff',
					fontSize : '25'

				},
			    tooltip: {
			        trigger: 'axis',
			        axisPointer: {
			            type: 'cross',
			            crossStyle: {
			                color: '#5793f3'
			            }
			        }
			    },
			    toolbox: {
			    	top:0,
			    	right:170, 
			    	itemSize:20,
			    	 itemGap:10,
			    	 backgroundColor:"#fff", 
			        feature: {
			            dataView: {show: true, readOnly: false},
			            magicType: {show: true, type: ['line', 'line','line']},
			            restore: {show: true},
			            saveAsImage: {show: true}
			        }
			    },
			    legend: {
			    	//backgroundColor : 'green',//设置背景颜色
			        data:['零售厅','自营代销厅','入柜商'],
			        icon: 'circle',
					 textStyle : { //详见textStyle
						color : 'white',
						fontSize:20

					}  
			    },
			    xAxis: [
			        {splitLine : {
						show : false
					},//去除网格线
			            type: 'category',
			            
			            data: [],
			            
			            axisPointer: {
			                type: 'shadow'
			            },
			            axisLine:{
	                        lineStyle:{
	                        	
	                            color:'#1addfa',
	                            width:1,//这里是为了突出显示加上的
	                        }
   
	                    },
	                    axisLabel:{ //调整x轴的lable  
                            textStyle:{
                                fontSize:18 // 让字体变大
                              }
                		     }

    
			        }
			    ],
			    yAxis: [
			        {splitLine : {
						show : false
					},//去除网格线
			            type: 'value',
			            name: '销量',
			            
			            min: 0,
			            axisLine: {
			                lineStyle: {
				                  fontSize: 25,
				                 fontWeight: 'bolder',
				                 color: '#1addfa'           
				                 
				                }
				            },
			           /*  max: 250,
			            interval: 50, */
			            axisLabel: {
			                formatter: '{value}',
			                textStyle:{
                                fontSize:18 // 让字体变大
                              }
			            }
			        },
			        {splitLine : {
						show : false
					},//去除网格线
			            type: 'value',
			            name: '销量',
			            min: 0,
			            /* max: 25,
			            interval: 5, */
			            axisLine: {
			                lineStyle: {
			                  fontSize: 250,
			                 fontWeight: 'bolder',
			                 color: '#1addfa'           
			                 
			                }
			            },
			            axisLabel: {
			                formatter: '{value}',
			                textStyle:{
                                fontSize:18 // 让字体变大
                              }
			            }
			        }
			    ],
			    series: [
			        {
			            //name:'零售厅',
			            color:'#1addfa',
			            type:'line',
			            data:[],
			            label: {
						      normal: {
						          show: true,
						          position: 'center',
						          textStyle: {
						            color: '#5bc0de'
						          }
						      }
						 },
			        },
			        {
			           // name:'自营代销厅',
			           color:'yellow',
			            type:'line',
			            yAxisIndex: 1,
			            data:[],
			            label: {
						      normal: {
						          show: true,
						          position: 'top',
						          textStyle: {
						            color: 'yellow'
						          }
						      }
						 }, 
			        },
			        {
				            name:'入柜商',
				           color:'green',
				            type:'line',
				            yAxisIndex: 1,
				            data:[],
				            label: {
							      normal: {
							          show: true,
							          position: 'top',
							          textStyle: {
							            color: 'green'
							          }
							      }
							 }, 
				        }
			    ]
			};

		
		return option;
		
		} 
  
  /* 点击查询按钮功能的实现  */
 function btn(){
	var text= $('#tim option:selected').text();//选中的文本  
	var times=$('#times').val();//时间类型的选择
	
	var day1=$('#day1').val();//季指标年的选择
	  
	var tim=$('#tim').val();//季指标季度的选择  
	
	var month1=$('#month1').val();//开始月
	
	var month2=$('#month2').val();//结束月
	  
    var year1=$('#year1').val();//开始年
	
	var year2=$('#year2').val();//结束年
	//对获取的数据进行非空判断   
	 if(times==""){
		
	 alert("请选择时间类型！"); 
	  return false;	 
	 }
	if(times=='day'){
	 if(day1==""){
			
	 alert("请选择年份！"); 
	  return false;	 
	 }
	 if(tim==""){
			
	 alert("请选择季度！"); 
      return false;	 
	 }else if(tim=='one'){
		tim='-01-03'; 
	 }else if(tim=='two'){
		tim='-04-06'; 
	 }else if(tim=='three'){
		tim='-07-09'; 
	 }else if(tim=='four'){
		tim='-10-12'; 
	 }
	 
	 $.ajax({  
	        url: "../contractPhoneAmount/sale.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'dodate':day1,'dodate1':tim,'text':text},
	        success: function (data) {   
	        	 if(!isEmptyObject(data)){
		        	
	        		 
	        		 //var colores=['#4472C5','#ED7C30','#80FF80','#FF8096'];	
	        		 var title = ['零售厅','自营代销厅','入柜商'];
	        		 
	        		    //text = '量 :  当前销量、规划销量、对标品销量与竞品销量对比曲线（台）                                                                                ';
	        		    getPaint10("container10",title,data); 	           
			        
		        		
		            	
		        	}else{
		        		$("#container10").hide();
		        	}
	        	
	        	
	        	 
	        
	        
	        }  
	    });
	

	}
	if(times=='month'){
	 if(month1==""){
			
	 alert("请选择开始月份！"); 
	  return false;	 
     }
	 if(month2==""){
			
	 alert("请选择结束月份！"); 
	 return false;	 
	 }
	 $.ajax({  
	        url: "../contractPhoneAmount/saleMonth.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'dodate':month1,'dodate1':month2},
	        success: function (data) {   
	        	 if(!isEmptyObject(data)){
		        	
	        		 
	        		 //var colores=['#4472C5','#ED7C30','#80FF80','#FF8096'];	
	        		 var title = ['零售厅','自营代销厅','入柜商'];
	        		 
	        		    //text = '量 :  当前销量、规划销量、对标品销量与竞品销量对比曲线（台）                                                                                ';
	        		    getPaint10("container10",title,data); 	           
			        
		        		
		            	
		        	}else{
		        		$("#container10").hide();
		        	}
	        	

	        }  
	    });
	
	}
	if(times=='year'){
	 if(year1==""){
			
	 alert("请选择开始年份！"); 
	 return false;	 
	 }
	 if(year2==""){
			
	 alert("请选择结束年份！"); 
	 return false;	 
	 }
	
	 $.ajax({  
	        url: "../contractPhoneAmount/saleYear.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'dodate':year1,'dodate1':year2},
	        success: function (data) {   
	        	 if(!isEmptyObject(data)){
		        	
	        		 
	        		 //var colores=['#4472C5','#ED7C30','#80FF80','#FF8096'];	
	        		 var title = ['零售厅','自营代销厅','入柜商'];
	        		 
	        		    //text = '量 :  当前销量、规划销量、对标品销量与竞品销量对比曲线（台）                                                                                ';
	        		    getPaint10("container10",title,data); 	           
			        
		        		
		            	
		        	}else{
		        		$("#container10").hide();
		        	}
	        	
	        	
	        	 
	        
	        
	        }  
	    });
	} 
  
	 
	
	
	
 
  }
 
 
//页面一加载就执行的js方法
 
 function documentOnload(){
	 
	 var month1='2018-01';//开始月
		
	 var month2='2018-03';//结束月 
	 
	 $.ajax({  
	        url: "../contractPhoneAmount/saleMonth.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'dodate':month1,'dodate1':month2},
	        success: function (data) {   
	        	 if(!isEmptyObject(data)){
		        	
	        		 
	        		 //var colores=['#4472C5','#ED7C30','#80FF80','#FF8096'];	
	        		 var title = ['零售厅','自营代销厅','入柜商'];
	        		 
	        		    //text = '量 :  当前销量、规划销量、对标品销量与竞品销量对比曲线（台）                                                                                ';
	        		    getPaint10("container10",title,data); 	           
			        
		        		
		            	
		        	}else{
		        		$("#container10").hide();
		        	}
	        	

	        }  
	    });
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
 }
 
 
 
 
 
 
 
  

</script>



</body>
</html>