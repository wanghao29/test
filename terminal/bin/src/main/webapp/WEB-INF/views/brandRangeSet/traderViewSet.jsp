<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全生命周期监控</title>
</head>

<body>
	<style type="text/css">
.page_content .content div {
	border: 1px solid;
}

/* 按钮设置 */
#btSet {


position:absolute;right:700px;

}
#loading {    /*弹出层样式*/
    position: fixed;
    width: 150px;
    height: 50px;
    left: 50%;
    top: 50%;
    margin-left: -145px;
    margin-top: -45px;
    background-color: #ccc;
    border: 5px solid #eee;
    box-shadow: 7px 7px 10px #999;
    font-size: 20px;
    line-height: 50px;
    text-align: center;
    color: #333;
}
/*按钮点击特效  */

#customizationModalShow{ 

   text-transform: uppercase; 
   width: 100%; 
   background-color: #1addfa; 
   border-radius: 16px;
   margin-left: 10%;
    transform: translateZ(0px); 
    transition: all 0.5s ease 0s; 
    font-family: 'Microsoft YaHei','Lantinghei SC','Open Sans',Arial,'Hiragino Sans GB','STHeiti','WenQuanYi Micro Hei','SimSun',sans-serif; 
} 
#customizationModalShow:after{ 
    content: ""; 
    position: absolute; 
    top: 0; 
    left: 0; 
    bottom: 0; 
    right: 0; 
    border-radius: 16px;
    background: #4682B4; 
    z-index: -1; 
    transform: scaleX(0); 
    transform-origin: 100% 50% 0; 
    transition: all 0.5s ease-out 0s; 
} 
#customizationModalShow:hover:after{ 
    transform: scaleX(1); 
       border-radius: 16px;
    transition-timing-function: cubic-bezier(0.52, 1.64, 0.37, 0.66); 
} 
#customizationModalShow{ 
   width: 100%; background-color: #1addfa; border-radius: 16px;
	margin-left: 10%;
    transition: all 0.3s linear 0s; 
} 
/*点击按钮特效  selectStyle */

.selectStyle{ 

   text-transform: uppercase; 
   
   background-color: #1addfa; 
   border-radius: 16px;
  
    transform: translateZ(0px); 
    transition: all 0.5s ease 0s; 
    font-family: 'Microsoft YaHei','Lantinghei SC','Open Sans',Arial,'Hiragino Sans GB','STHeiti','WenQuanYi Micro Hei','SimSun',sans-serif; 
} 
.selectStyle:after{ 
    content: ""; 
    position: absolute; 
    top: 0; 
    left: 0; 
    bottom: 0; 
    right: 0; 
    border-radius: 16px;
    background: #1addfa; 
    z-index: -1; 
    transform: scaleX(0); 
    transform-origin: 100% 50% 0; 
    transition: all 0.5s ease-out 0s; 
} 
.selectStyle:hover:after{ 
     transform: scaleX(1); 
    transition-timing-function: cubic-bezier(0.52, 1.64, 0.37, 0.66); 
} 







</style>
	<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
	<%-- <link href="<%=basePath%>resources/js/plugin/select2/css/selectMy2.css" rel="stylesheet"> --%>
	<script
		src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/i18n/defaults-*.min.js"></script> -->
	<script type="text/javascript"
		src="<%=basePath%>resources/js/customerChannel/customerChannel.js?"></script>
	<script type="text/javascript"
		src="<%=basePath%>resources/js/brandRangeSet/tradeViewSet.js?"></script>
	<script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>




	<div class="row" style=" margin: 20px;z-index: 1000;">
		<!-- 表头控件 -->
		<div class="col-xs-2">
			
			<label style="font-size: 18px; color: white; font-weight: normal;">品牌：
			</label>
			
			<select name="term_brnd_nam" id="select1" class="select_searchableMy"
				style="border-color: #1addfa; width: 100px; height: 30px; color: white; 
				background-color: #00063c;">
				<option id="oneDate">${brand}</option>	
			    <option>苹果</option>
			    <option>华为</option>	
			    <option>三星</option>	
			    <option>中国移动</option>	
			    <option>小米</option>	
			    <option>魅族</option>	
			    <option>OPPO</option>
			    
			</select> 
			</div>
			
			
			<div class="col-xs-2">
			<label style="font-size: 18px; color: white; font-weight: normal;">竞品类型：
			</label>
			<select name="kind" id="kind" onchange="kindes()" 
				style="border-color: #1addfa; width: 100px; height: 30px; color: white;border-radius: 16px; 
				 background-color: #00063c;">
				<option value="">请选择类型</option>
				<option>合约机</option>
				<option>公开市场</option>	
			</select> 
			</div>		
			
	 <div class="col-xs-3">     
		<label
			style="font-size: 18px; color: white; font-weight: normal;">&nbsp;&nbsp;&nbsp;竞&nbsp;&nbsp;&nbsp;品：
		</label>
		<select name="COMPETBRANDNAME1"   id="COMPETBRANDNAME1" class="select_searchableMy"
			style="border-color: #1addfa; width: 100px; color: white; 
			background-color: #00063c; height: 30px; ">
			<option value="">请选择竞品</option>
		</select> 
		
		<select name="COMPETSPEC1"  id="COMPETSPEC1" class="select_searchableMy"
			style="border-color: #1addfa; width: 100px; color: white; 
			background-color: #00063c; height: 30px; ">
			<option value="">请选择型号</option>			
		</select>
	   </div>
			
	    
		

	  <div class="col-xs-3" style="display:none" id="dayes">
		<label
			 style="font-size: 18px; color: white; font-weight: normal;">&nbsp;&nbsp;&nbsp;日指标:
		</label> 
		<input name="day1" id="day1" 
			type="text" style="width:21%;height: 30px;  background-color: #00063c; 
			border-color: #1addfa; color: white;border-radius: 16px; " readonly="readonly"
			onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-{%M}',onpicked:selectDate})" />
	
	
		<label
			 style="font-size: 18px; color: white; font-weight: normal;">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
		 </label>
		 <input name="day2" id="day2"			 
			type="text" style="width:21%;height: 30px;  background-color: #00063c; 
			border-color: #1addfa; color: white;border-radius: 16px; " readonly="readonly"
			onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-{%M}',onpicked:selectDate})" />
	     </div>
      <div class="col-xs-3" id="mon">
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
	<div class="col-xs-2">
	
	
	<button id="customizationModalShow" class="select" name="btName"
			style="width: 55%;height:30px; background-color: #1addfa;border-radius: 16px;
			 margin-left: 5%;" onclick="btn()">
			查询</button>
	
	</div>
	
	
	
	
	
	
	
	</div>
	
	
	
	
	<div class="row"style=" margin: 20px;z-index: 1000;">
	
	      <div class="col-xs-2">
			<label style="font-size: 18px; color: white; font-weight: normal;">机型：
			</label>
			<select name="term_mdl_nam" id="select2" class="select_searchableMy"
				style="border-color: #1addfa; width: 100px; color: white;
				 background-color: #00063c; height: 30px; ">
				<option id="twoDate">${spec}</option>				
			</select>
            </div>
	
	
	   <div class="col-xs-2">
			<label style="font-size: 18px; color: white; font-weight: normal;">时间类型：</label>
			<select name="times" id="times" onchange ="changeTime()"
				style="border-color: #1addfa; width: 100px; color: white;
				 background-color: #00063c; height: 30px;border-radius: 16px; ">
				<option value="">请选择类型</option>
				<option value="day" >日指标</option>
				<option value="month">月指标</option>				
			</select>
            </div>
	
	<div class="col-xs-3">

		<label
			style="font-size: 18px; color: white; font-weight: normal;">&nbsp;&nbsp;&nbsp;对标品：
		</label>
		
		<select name="COMPETBRANDNAME2"   id="COMPETBRANDNAME2" class="select_searchableMy"
			style="border-color: #1addfa; width: 100px; color: white;
			 background-color: #00063c; height: 30px; ">
			<option value="">请选择竞品</option>
		</select> 
		
		<select name="COMPETSPEC2"  id="COMPETSPEC2" class="select_searchableMy"
			style="border-color: #1addfa; width: 100px; color: white; 
			background-color: #00063c; height: 30px; ">
			<option value="">请选择型号</option>
		</select>
       </div>
	
	<div class="col-xs-3">
	
	<!-- <button id="customizationModalShow" class="select" name="btName"
			style="width: 100%; background-color: #1addfa; border-radius: 1px;
			 margin-left: 10%;" onclick="btn()">
			查询</button> -->
	<label style="font-size: 18px; color: white; font-weight: normal;">&nbsp;&nbsp;&nbsp;品牌对比类型：</label>
			<select name="changed" id="changeModel"
				style="border-color: #1addfa; width: 120px; color: white;
				 background-color: #00063c; height: 30px;border-radius: 16px; ">
				<option value="">请选择对比类型</option>
				<option value="harry1">相对类型</option>
				<option value="harry2">绝对类型</option>				
			</select>		
			
	
	</div>
<div class="col-xs-2">
	
	<!-- <button id="customizationModalShow" class="select"
			style="width: 55%; background-color: #1addfa; border-radius: 1px;
			 margin-left: 5%; onclick="onclick="javascript:location.href='../quantitySet/index.do'">
			进入全生命周期</button> -->
	<button id="customizationModalShow" class="select"
			style="width: 55%; background-color: #1addfa; height:30px;border-radius: 16px;
			 margin-left: 5%;" href=""; onclick="btn1()">
			进入全生命周期</button>
	
	
	</div>
			
        </div>
<!---------------------------数据加载样式  -->        
 <div class="row" style=" margin: 20px;z-index: 1000;">
		
<div class="col-xs-12">       
 <div id="loading"><p>页面正在加载，请稍后····</p></div>   

        
</div>

<div class="col-xs-12"  >       
 <div id="backHome" style="color: #1addfa;font-size: 20px;display: none;">页面正在加载，请稍后····</div>   

        
</div>


</div>
<!-- <button id="customizationModalShow" class="select"
			style="width: 20%; background-color: #1addfa; border-radius: 1px; margin-left: 30%;">进入全生命周期</button> -->

<div class="row" style=" margin: 20px;z-index: 1000;">
		
		<div class="col-xs-1">
		<button id="bt1" class="selectStyle" onclick="saleProduct()"
			style="width: 140%; background-color: #4682B4; 
			border-radius: 16px; margin-top: 10%">销售
		</button>
		</div>
		
		<div class="col-xs-1">
		<button id="bt2" class="selectStyle" onclick="priceProduct()"
			style="width: 140%;margin-left:50%; background-color: #4682B4; 
			border-radius: 16px;margin-top: 10%" >价格
		</button>
		</div>
		
		<div class="col-xs-1">
		</div>		
		
		<div class="col-xs-1">
		<button id="bt3" class="selectStyle" onclick="incomeProduct()"
			style="width: 140%;margin-left:-10%; background-color: #4682B4;
			 border-radius: 16px;margin-top: 10%" >收入
		</button>
		</div>
		
		<div class="col-xs-1">
		<button id="bt4" class="selectStyle" onclick="stock()"
			style="width: 140%;margin-left:40%; background-color: #4682B4;
			 border-radius: 16px; margin-top: 10%">库存
		</button>
		</div>

		
		<div class="col-xs-1">
		<button id="bt5" class="selectStyle" onclick="profit()"
			style="width: 140%; margin-left:90%;background-color: #4682B4;
			 border-radius: 16px; margin-top: 10%"> 价差
		</button>
		</div>
			
			<div class="col-xs-1">
		    </div>
		
		<div class="col-xs-1">
		<button id="bt6" class="selectStyle" onclick="share()"
			style="width: 140%; margin-left:30%;background-color: #4682B4; 
			border-radius: 16px; margin-top: 10%">份额
		</button>
        </div>
		
		<div class="col-xs-1">
		<button id="bt7" class="selectStyle" onclick="cover()"
			style="width: 140%; margin-left:80%;background-color: #4682B4; 
			border-radius: 16px; margin-top: 10% ">覆盖
		</button>
          </div>
        
        <div class="col-xs-1">
		<button id="bt8" class="selectStyle" onclick="order()"
			style="width: 140%;margin-left:130%; background-color: #4682B4; 
			border-radius: 16px; margin-top: 10% ">秩序
		</button>
	   </div>
	   	
	   	
	   	<div class="col-xs-1">
		</div>
	   
	   </div>
<!-- -------------------------------------------------------------------------------------------------------------------- -->


<div class="row" style=" margin: 20px;z-index: 1000;">

     <div class="col-xs-6">
     <div id="container8"
		style=" height: 338px; user-select: none; 
		-webkit-tap-highlight-color: #1addfa; margin-top: 10%">
     </div>
     </div>


    <div class="col-xs-6">
       <div id="container9" style=" height: 338px; user-select: none; 
		-webkit-tap-highlight-color: #1addfa;margin-top: 10%">
		</div>
     </div>

</div>

<div class="row" style=" margin: 20px;z-index: 1000;">

    <div class="col-xs-6">
    <div id="container10"
		style=" height: 338px; user-select: none; 
		-webkit-tap-highlight-color: #1addfa;margin-top: 10%">
	</div>
    </div>

    <div class="col-xs-6">
       <div id="container11" style=" height: 338px; user-select: none; 
		-webkit-tap-highlight-color: #1addfa;margin-top: 10%">
		</div>
     </div>

</div>
<!------------------------------------------------------------------------------------------------------------------  -->	
	<div class="row"style=" margin: 20px;z-index: 1000;">
   
    <div class="col-xs-6">
	<div id="container" style="
		 height: 338px; user-select: none; -webkit-tap-highlight-color: #1addfa; ">
	 </div>
	 </div>
	
	<div class="col-xs-6">
	<div id="container1"
		style=" height: 338px; user-select: none; -webkit-tap-highlight-color: #1addfa; ">
	</div>
	 </div>
	 
	 </div>
	
	
	<div class="row"style=" margin: 20px;z-index: 1000;">
   
    <div class="col-xs-6">
	<div id="container2" style="
		 height: 338px; user-select: none; -webkit-tap-highlight-color: #1addfa; "> 
	 </div>
	 </div>
	
	<div class="col-xs-6">
	<div id="container3"
		style=" height: 338px; user-select: none; -webkit-tap-highlight-color: #1addfa; ">
	 </div>
	 </div>
	 
	 </div>
	
	
	<div class="row"style=" margin: 20px;z-index: 1000;">
    
    <div class="col-xs-6">
	<div id="container4" style="
		 height: 338px; user-select: none; -webkit-tap-highlight-color: #1addfa; "> 
	</div>
	 </div>
	
	<div class="col-xs-6">
	<div id="container5"
		style=" height: 338px; user-select: none; -webkit-tap-highlight-color: #1addfa; ">
	</div>
	 </div>
	 
	 </div>
	 
	 
	 
	 
	<div class="row"style=" margin: 20px;z-index: 1000;">
    
    <div class="col-xs-6">
	<div id="container6" style="
		 height: 338px; user-select: none; -webkit-tap-highlight-color: #1addfa; "> 
     </div>
	 </div>
	
	<div class="col-xs-6">
	<div id="container7"
		style=" height: 338px; user-select: none; -webkit-tap-highlight-color: #1addfa; ">
	 </div>
	 </div>
	 
	 </div>
	
	
	
	

	


  <!--  <div id="btSet">	
  <button type="button" style="width: 100px; background-color:#49c9dc" onclick="goSubmit()">查看周期</button>
  <button id="bt" type="button" onclick="goback()" style="width: 100px; background-color:#49c9dc ">返回</button>
	</div> -->


<script type="text/javascript">
window.onload=inpage();



/*判断对象是否为空   */
function isEmptyObject(e) {
	for (var t in e)
		return !1;
	return !0
};



/*数据加载中的样式。。。。。。。   */
function inpage(){
$("#loading").ajaxStart(function(){
        $(this).show();
    });

    $("#loading").ajaxStop(function(){
        $(this).hide();
    });
}
 /*    $("button[name='btName']").click(function(){    
        $.get("http://www.sohu.com", null, function(data){
            $("#content").text(data);
        });
    }); */    



/*返回按钮时间   */
function goback(){
	window.history.go(-1);	
}

function selectDate() {
	//jqgridReload();
} 

/*页面一加载就执行的js事件   */
window.onload=function(){
      //do something
	 //var timed=$("#times").val();//时间类型		
	var brand=$("#select1").val();
    var model=$("#select2").val();	  

	 var number="量";
	 /*  $.StandardPost(basePath+'/absolute1/important.do',{'BRANDNAME':brand,'SPEC':model});	 */
	 
		 var day1='2018-06-01';
	 	 var day2='2018-06-30';
	     var a={};
	 	 $.ajax({  
	        url:basePath+"/absolute1/important.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'BRANDNAME':brand,'SPEC':model},
	        success: function (data) {   
	        	if(!isEmptyObject(data)){
	        		text = '重点产品达成率',                                                                            
	        		
					getPaintDate("container9",text,data); 
	        		
	        	
	        	}else{
	        		$("#container9").hide();
	        	}
	        }  
	    });	     

	
	 /*销量趋势表取数据     */	
	 	
		$.ajax({  
	        url: "../absolute1/direction.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'number':number},
	        success: function (data) {   
	        	if(!isEmptyObject(data)){
	        		var title = ['2018 销量', '2017 销量'];
					text = '销量趋势',                                                                            
			
		        	getPaint10("container10",text,title,data); 	   
	        		
	            	
	        	}else{
	        		$("#container10").hide();
	        	}
	        	
	        	
	        	            
	        }  
	    });	    
		 
		
		
		/*各地市销量取数据     */	
		 
	 	$.ajax({  
	        url: "../absolute1/areaDay.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'number':number},
	        success: function (data) {   
	        	if(!isEmptyObject(data)){
	        		text = '各地市销量',                                                                            
	        		
		        	getPaint11("container11",text,data);       
	        		
	            	
	        	}else{
	        		$("#container11").hide();
	        	}
				      
	        }  
	    }); 	    	
		
		
		
	 	/*五线七口销量取数据      */	
		 
	 	$.ajax({  
	        url: "../absolute1/areaPortDay.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model},
	        success: function (data) {   
	        	if(!isEmptyObject(data)){
	        		text = '五线七口销量',                                                                            
					title = '', 
		        	 getPaint9("container8",text,title,data);        
	        		
	            	
	        	}else{
	        		$("#container8").hide();
	        	}
				    
	        }  
	    }); 	    	
	 
	 	$("#container9").show();
	 	$("#container8").show();
      
      


}
</script>

<script type="text/javascript">

/* var mapData1 = {"0":[ '06-01', '06-02', '06-03', '06-04', '06-05', '06-06','06-07', '06-08', '06-09', '06-10' ],
	       "1":[ 220, 182, 191, 234, 290, 330, 310, 182, 191, 234 ],
	       "2":[ 150, 232, 201, 154, 190, 330, 410, 182, 191, 234 ],
	       "3":[ 320, 332, 301, 334, 390, 330, 320, 182, 191, 234 ],
	       "4":[ 820, 932, 901, 934, 1290, 1330, 1320, 182, 191, 234 ]		
}; */


function getPaint(container,text,title,mapData){
	
}

		function getPaint1(container,text,title,mapData){			
			var dom = document.getElementById(container);
			var myChart = echarts.init(dom);
			var option = getOption();			
			option.title.text = text;
			option.legend.data = title;
			//title[0]=colores[0];
			option.xAxis.data = mapData[0];
			for(var i=1;i<Object.keys(mapData).length;i++){
				console.log(i);
				option.series[i-1].name = title[i-1];
				for(var j=0;j<mapData[i].length;j++){
					option.series[i-1].data.push(mapData[i][j]);
				}
			}
			if (option && typeof option === "object") {
				myChart.setOption(option, true);

			};
		}
		
		function getOption(){
			option = {
					/* color:['#1f67df'],里面曲线的显示颜色 */

					textStyle : { //曲线图文字的显示颜色
						color : '#fff',
						fontSize : '15'

					},
					title : {
						//text : //'量 :  当前销量、规划销量、对标品销量与竞品销量对比曲线（台）                                                                                ',
						backgroundColor : '#4682B4',//设置背景颜色
						top : '10%',
						textStyle : { //详见textStyle
							color : 'white'
							
		                    
						}

					},
					tooltip : {
						trigger : 'axis'
					},
					
					 //color:['#4472C5','#ED7C30','#80FF80','#FF8096'],
					legend : {
						//data :[{name: '当前销量'}, {name:'规划销量'}, {name:'对标品销量'},{name: '竞品销量'} ],
						top : '20%',
						icon: 'circle',
						 textStyle : { //详见textStyle
							color : 'white'

						}  

					},
					grid : {

						show : 'false',
						borderWidth : '0',
						top : '35%',
						left : '3%',
						right : '4%',
						bottom : '3%',
						containLabel : true,
						/*  show:'true',
						 borderWidth:'1',
						 */
						borderColor : '#1addfa'
					},

					xAxis : {
						splitLine : {
							show : false
						},//去除网格线
						type : 'category',
						boundaryGap : false,
						//data : //[ '06-01', '06-02', '06-03', '06-04', '06-05', '06-06',
								//'06-07', '06-08', '06-09', '06-10' ]
		                axisLine:{
		                    lineStyle:{
		                        color:'#fff',
		                    }
		                },

					},
					yAxis : {
						type : 'value',
						splitLine : {
							show : false
						},//去除网格线
		                axisLine: {
		                    show: true,
		                    lineStyle:{
		                        color:'#fff'
		                    }
		                },
					/* show:false, *///主要作用是去除y轴的数值标高
					},

					lineStyle : {
						// color: 随borderColor, // 主色，线色，优先级高于borderColor和color
						// width: 随borderWidth, // 优先于borderWidth
						type : 'solid',
					/* shadowColor : '#1addfa', //默认透明
					shadowBlur: 2,
					shadowOffsetX: 50,
					shadowOffsetY: 6 */
					},

					series : [						
					
						 {
		               /*  label: {
		                	color:'white',
		                	fontSize:20,
		                    show: true,
		                    formatter: '{c}'
		                },   */
						//name : '当前销量',
						smooth:true, 
						color:'red',
						type : 'line',
						stack : '总量',
						data :[]// [ 220, 182, 191, 234, 290, 330, 310, 182, 191, 234 ]
					}, {
						//name : '规划销量',
						 smooth:true, 
						color:'#00EE00',
						type : 'line',
						stack : '总量',
						data : []//[ 150, 232, 201, 154, 190, 330, 410, 182, 191, 234 ]
					}, {
						//name : '对标品销量',
						 smooth:true, 
						color:'yellow',
						type : 'line',
						stack : '总量',
						data : []//[ 320, 332, 301, 334, 390, 330, 320, 182, 191, 234 ]
					}, {
						//name : '竞品销量',
						 smooth:true, 
						color:'blue',
						type : 'line',
						stack : '总量',
						 data : []//[ 820, 932, 901, 934, 1290, 1330, 1320, 182, 191, 234 ]
					} ]
				};
			return option;
			
		}


		/*  价        表格-------------------------------------------------------------------------------------------------------- */

	

		/* var title = [ '本品价格', '本品二级市场价格',  '竞品二级市场价格' ];
		var mapData = {"0":[ '06-01', '06-02', '06-03', '06-04', '06-05', '06-06','06-07', '06-08', '06-09', '06-10' ],
			       "1":[ 220, 182, 191, 234, 290, 330, 310, 182, 191, 234 ],
			       "2":[ 150, 232, 201, 154, 190, 330, 410, 182, 191, 234 ],
			       "3":[ 320, 332, 301, 334, 390, 330, 320, 182, 191, 234 ],
			      		
		};
		text = '价 :  本品价格及本品竞品二级市场价格(元)   */                                                                            

		/* getPaint("container1",text,title,mapData); 	 */
		/* function getPaint0(container1,text,title,mapData){
	
} */
		
		function getPaint2(container1,text,title,mapData){			
			var dom = document.getElementById(container1);
			var myChart = echarts.init(dom);
			var option = getOption();			
			option.title.text = text;
			option.legend.data = title;						
			option.xAxis.data = mapData[0];
			for(var i=1;i<Object.keys(mapData).length;i++){
				console.log(i);
				option.series[i-1].name = title[i-1];
				for(var j=0;j<mapData[i].length;j++){
					option.series[i-1].data.push(mapData[i][j]);
				}
			}
			if (option && typeof option === "object") {
				myChart.setOption(option, true);

			};
		}
		
		/* 收入表---------------------------------------------------------------------------------------------------------   */

		function getPaint3(container2,text,title,mapData){			
			var dom = document.getElementById(container2);
			var myChart = echarts.init(dom);
			var option = getOption();			
			option.title.text = text;
			option.legend.data = title;						
			option.xAxis.data = mapData[0];
			for(var i=1;i<Object.keys(mapData).length;i++){
				console.log(i);
				option.series[i-1].name = title[i-1];
				for(var j=0;j<mapData[i].length;j++){
					option.series[i-1].data.push(mapData[i][j]);
				}
			}
			if (option && typeof option === "object") {
				myChart.setOption(option, true);

			};
		}
		
		
		
		
		
		/* var title = [ '当前收入', '规划收入', '对标品收入', '竞品收入' ];
		var mapData = {"0":[ '06-01', '06-02', '06-03', '06-04', '06-05', '06-06','06-07', '06-08', '06-09', '06-10' ],
			       "1":[ 220, 182, 191, 234, 290, 330, 310, 182, 191, 234 ],
			       "2":[ 150, 232, 201, 154, 190, 330, 410, 182, 191, 234 ],
			       "3":[ 320, 332, 301, 334, 390, 330, 320, 182, 191, 234 ],
			       "4":[ 320, 332, 301, 334, 390, 330, 320, 182, 191, 234 ]	
		};
		text = '收  : 当前收入、规划收入、对标品收入与竞品收入对比曲线（元）                                                                                        ';                                                                              

		getPaint("container2",text,title,mapData);  */
		
	
		/* 存----------------------------------------------------------------------------------------------------------  */
       /*  var title = [ '实际库存周数', '规划库存周数'];
		var mapData = {"0":[ '06-01', '06-02', '06-03', '06-04', '06-05', '06-06','06-07', '06-08', '06-09', '06-10' ],
			       "1":[ 220, 182, 191, 234, 290, 330, 310, 182, 191, 234 ],
			       "2":[ 150, 232, 201, 154, 190, 330, 410, 182, 191, 234 ]
			      
		};
		text = '存 : 库存周转对比周数(周)                                                                                               ',                                                                             
		
		getPaint("container3",text,title,mapData);  */
		
		function getPaint4(container3,text,title,mapData){			
			var dom = document.getElementById(container3);
			var myChart = echarts.init(dom);
			var option = getOption();			
			option.title.text = text;
			option.legend.data = title;						
			option.xAxis.data = mapData[0];
			for(var i=1;i<Object.keys(mapData).length;i++){
				console.log(i);
				option.series[i-1].name = title[i-1];
				for(var j=0;j<mapData[i].length;j++){
					option.series[i-1].data.push(mapData[i][j]);
				}
			}
			if (option && typeof option === "object") {
				myChart.setOption(option, true);

			};
		}
		
		
		/* 利-------------------------------------------------------------------------------------------------------------  */
		/* var title = [ '当前毛利', '规划毛利', '对标品毛利', '竞品毛利'];
		var mapData = {"0":[ '06-01', '06-02', '06-03', '06-04', '06-05', '06-06','06-07', '06-08', '06-09', '06-10' ],
			       "1":[ 220, 182, 191, 234, 290, 330, 310, 182, 191, 234 ],
			       "2":[ 150, 232, 201, 154, 190, 330, 410, 182, 191, 234 ],
			       "3":[ 320, 332, 301, 334, 390, 330, 320, 182, 191, 234 ],
			       "4":[ 320, 332, 301, 334, 390, 330, 320, 182, 191, 234 ]	
		};
	
		text = '利  : 当前毛利、规划毛利、对标品毛利与竞品毛利对比曲线（万元）                                                                   ',                                                                             

		getPaint("container4",text,title,mapData);  */
		
		function getPaint5(container4,text,title,mapData){			
			var dom = document.getElementById(container4);
			var myChart = echarts.init(dom);
			var option = getOption();			
			option.title.text = text;
			option.legend.data = title;						
			option.xAxis.data = mapData[0];
			for(var i=1;i<Object.keys(mapData).length;i++){
				console.log(i);
				option.series[i-1].name = title[i-1];
				for(var j=0;j<mapData[i].length;j++){
					option.series[i-1].data.push(mapData[i][j]);
				}
			}
			if (option && typeof option === "object") {
				myChart.setOption(option, true);

			};
		}
		
		
		
		
		
		
		/* 份------------------------------------------------------------------------------------------------------------------  */
		/*  var title = [ '当前份儿', '规划份儿'];
		var mapData = {"0":[ '06-01', '06-02', '06-03', '06-04', '06-05', '06-06','06-07', '06-08', '06-09', '06-10' ],
			       "1":[ 220, 182, 191, 234, 290, 330, 310, 182, 191, 234 ],
			       "2":[ 150, 232, 201, 154, 190, 330, 410, 182, 191, 234 ]
			      
		};

		text = '份  : 当前份额与规划份额对比曲线                                                                                                                                                            ',                           

		getPaint("container5",text,title,mapData);  */
		function getPaint6(container5,text,title,mapData){			
			var dom = document.getElementById(container5);
			var myChart = echarts.init(dom);
			var option = getOption();			
			option.title.text = text;
			option.legend.data = title;						
			option.xAxis.data = mapData[0];
			for(var i=1;i<Object.keys(mapData).length;i++){
				console.log(i);
				option.series[i-1].name = title[i-1];
				for(var j=0;j<mapData[i].length;j++){
					option.series[i-1].data.push(mapData[i][j]);
				}
			}
			if (option && typeof option === "object") {
				myChart.setOption(option, true);

			};
		}
		
		

		/*覆---------------------------------------------------------------------------------------------------------------   */

		/*  var title = [ '累计覆盖客户数', '规划累计覆盖客户数'];
		var mapData = {"0":[ '06-01', '06-02', '06-03', '06-04', '06-05', '06-06','06-07', '06-08', '06-09', '06-10' ],
			       "1":[ 220, 182, 191, 234, 290, 330, 310, 182, 191, 234 ],
			       "2":[ 150, 232, 201, 154, 190, 330, 410, 182, 191, 234 ]
			      
		};
		
		text = '覆 : 覆盖客户数对比曲线(个)                                                                                                             ',                           

		getPaint("container6",text,title,mapData);  */
		function getPaint7(container6,text,title,mapData){			
			var dom = document.getElementById(container6);
			var myChart = echarts.init(dom);
			var option = getOption();			
			option.title.text = text;
			option.legend.data = title;						
			option.xAxis.data = mapData[0];
			for(var i=1;i<Object.keys(mapData).length;i++){
				console.log(i);
				option.series[i-1].name = title[i-1];
				for(var j=0;j<mapData[i].length;j++){
					option.series[i-1].data.push(mapData[i][j]);
				}
			}
			if (option && typeof option === "object") {
				myChart.setOption(option, true);

			};
		}

		/* 秩---------------------------------------------------------------------------------------------------------------  */
		
		function getPaint8(container7,text,title,mapData){			
			var dom = document.getElementById(container7);
			var myChart = echarts.init(dom);
			var option = getOption();			
			option.title.text = text;
			option.legend.data = title;						
			option.xAxis.data = mapData[0];
			for(var i=1;i<Object.keys(mapData).length;i++){
				console.log(i);
				option.series[i-1].name = title[i-1];
				for(var j=0;j<mapData[i].length;j++){
					option.series[i-1].data.push(mapData[i][j]);
				}
			}
			if (option && typeof option === "object") {
				myChart.setOption(option, true);

			};
		}
		
		
		
		/* var title = [ 'DM本地激活率', 'DM异地激活率', '疑似套机率'];
		var mapData = {"0":[ '06-01', '06-02', '06-03', '06-04', '06-05', '06-06','06-07', '06-08', '06-09', '06-10' ],
			       "1":[ 220, 182, 191, 234, 290, 330, 310, 182, 191, 234 ],
			       "2":[ 150, 232, 201, 154, 190, 330, 410, 182, 191, 234 ],
			       "3":[ 320, 332, 301, 334, 390, 330, 320, 182, 191, 234 ]
			     
		};
		

		text = '秩 : DM本地激活率、DM异地激活率与疑似套机率对比(百分比)                                                                               ',                                                                            

		getPaint("container7",text,title,mapData);  */
		
		/* if (option && typeof option === "object") {
			myChart8.setOption(option, true);

		} */
/* 圆饼图------------------------------------------------------------------------------------------------------------  */
	
/* var dom8 = document.getElementById("container8");
		var myChart8 = echarts.init(dom8);
		 var app = {}; 
		option = null; */ 
	 	function getPaint9(container8,text,title,mapData){			
			var dom = document.getElementById(container8);
			var myChart8 = echarts.init(dom);
			var option = getmyOption();			
			
			option.title.text=text;
			$.each(mapData.innerMap, function(key, value) {
				var m = {};
				m['value'] = value;
				m['name'] = key;
				option.series[0].data.push(m);
			});
			
			$.each(mapData.outterMap, function(key, value) {
				var m = {};
				m['value'] = value;
				m['name'] = key;
				option.series[1].data.push(m);
			});
						

			if (option && typeof option === "object") {
				myChart8.setOption(option, true);

			};
		}	
		
	function getmyOption(){ 
		option = {
			    
				tooltip: {
			        trigger: 'item',
			        formatter: "{a} <br/>{b}: {c} ({d}%)"
			    },
			    title : {
					//text : '五线七口销量 ',
					backgroundColor : '#4682B4',//设置背景颜色
					
					 x: 'left',                 // 水平安放位置，默认为左对齐，可选为：
                     // 'center' ¦ 'left' ¦ 'right'
                     // ¦ {number}（x坐标，单位px）
                     y: '1px',
					textStyle : { //详见textStyle
						color : 'white'

					}

				},
			    

			    series: [
			        {
			            name:'访问来源',
			            type:'pie',
			            selectedMode: 'single',
			            radius: [0, '30%'],

			            label: {
			                normal: {			                	
			                    position: 'inner'
			                }
			            },
			            labelLine: {
			                normal: {
			                    show: false
			                }
			            },
			          data:[]/* [
			                {value:335, name:'家庭政企', selected:true},
			                {value:679, name:'自有渠道'},
			                {value:1548, name:'零售售后'},
			                {value:1948, name:'铁通'},
			                {value:1948, name:'社会渠道'},
			                {value:1948, name:'电子渠道'},
			                {value:1948, name:'零星采购'}
			                ] */
			        },
			        {
			           name:'',
			            type:'pie',
			            radius: ['30%', '55%'],
			            label: {
			                normal: {
			                    formatter: '{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
			                    backgroundColor: '#00063c',
			                    borderColor: 'white',
			                    borderWidth: 1,
			                    borderRadius: 4,
			                    // shadowBlur:3,
			                    // shadowOffsetX: 2,
			                    // shadowOffsetY: 2,
			                    // shadowColor: '#999',
			                    // padding: [0, 7],
			                    rich: {
			                        a: {
			                            color: '#999',
			                            lineHeight: 6,
			                            align: 'center'
			                        },
			                        // abg: {
			                        //     backgroundColor: '#333',
			                        //     width: '100%',
			                        //     align: 'right',
			                        //     height: 22,
			                        //     borderRadius: [4, 4, 0, 0]
			                        // },
			                        hr: {
			                            borderColor: '#aaa',
			                            width: '100%',
			                            borderWidth: 0.5,
			                            height: 0
			                        },
			                        b: {
			                            fontSize: 12,
			                            lineHeight: 12
			                        },
			                        per: {
			                            color: '#eee',
			                            backgroundColor: '#334455',
			                            padding: [2, 4],
			                            borderRadius: 2
			                        }
			                    }
			                }
			            },
			            data:[]/* [
			                 {value:335, name:'苹果'},
			                 {value:310, name:'三星'},
			                 {value:234, name:'华为'},
			                 {value:135, name:'中国移动'},
			                 {value:1048, name:'小米'},
			                 {value:251, name:'其他'},
			                 {value:147, name:'合作代理'},
			                 {value:102, name:'自由品牌多形态终端'},
			                 {value:109, name:'其他多形态终端'} 
			               
	                
			                ] */
			        }
			    ]
			};
	
	return option;
	
	}	

/* 长方形图例-----------------------------------------------------------------------  */

/* var dom9 = document.getElementById("container9");
		var myChart9 = echarts.init(dom9);
		var app = {};
		option = null; */
		
		function getPaintDate(container9,text,mapData){			
			var dom = document.getElementById(container9);
			var myChart9 = echarts.init(dom);
			var option = getOptionDate();			
			option.title.text = text;
			option.series[0].data =mapData.fish; 					
			option.xAxis[0].data = mapData.monthEnd;	
			
			
			if (option && typeof option === "object") {
				myChart9.setOption(option, true);

			};
		}
		
		
	 	
		
		
		
		function getOptionDate(){ 
		
		option = {
			    color: ['#3398DB'],
			    tooltip : {
			        trigger: 'axis',
			        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
			            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			        }
			   
			    
			    },
			    
			    title : {
					text : '重点产品达成率  ',
					backgroundColor : '#4682B4',//设置背景颜色
					
				 x: 'left',             // 水平安放位置，默认为左对齐，可选为：
                     // 'center' ¦ 'left' ¦ 'right'
                     // ¦ {number}（x坐标，单位px）
                    y: '10px',
					textStyle : { //详见textStyle
						color : 'white'

					}

				},
			    grid: {
			         left: '3%',
			        right: '4%',
			        bottom: '3%', 
			        containLabel: true,
			       
						color : 'white'

				
			    
			    
			    },
			    xAxis : [
			        {
			        	splitLine : {
							show : false
						},//去除网格线 
						
						
						type : 'category',
			            data : [], /* [ '华为畅享7', '华为畅享8S', '华为荣耀10'] */
			            axisTick: {
			                alignWithLabel: true
			            },
			            axisLine:{
                            lineStyle:{
                                color:'white',
                                width:'2px',
                            }
                        },
			        
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value',
			            	splitLine : {
								show : false
							},//去除网格线
							
							 axisLine:{
								 show:true,
				                    lineStyle:{
				                        color:'#fff'
				                    },
		                        },
			        
			        
			        }
			    ],
			    series : [
			        {
			            name:'数据来源',
			            type:'bar',
			            barWidth: '60%',
			            label: {
			                normal: {
			                    show: true,
			                    color:'white',
			                    position: 'top'
			                }
			            },
			            data:[]/* [298, 625, 800, 334, 390, 330, 220] */
			        }
			    ]
			};

		return option;
	

		}

/*销量趋势图 --------------------------------------------------------------------------------------         */

/* var dom10 = document.getElementById("container10");
		var myChart10 = echarts.init(dom10);
		var app = {};
		option = null; */
	/* 	if (option && typeof option === "object") {
			myChart10.setOption(option, true);

		} */
		 function getPaint10(container10,text,title,mapData){			
			var dom = document.getElementById(container10);
			var myChart10 = echarts.init(dom);
			var option = getOptions();			
			option.title.text = text;
			option.legend.data = title;						
			
			option.xAxis[0].data = mapData[0];//2017
			//option.xAxis[1].data = mapData[3];//2018
			option.series[0].name = title[0];//2018
			option.series[1].name = title[1];//2017
			option.series[0].data = mapData[1];//2017
			option.series[1].data = mapData[2];//2018

			
			
			if (option && typeof option === "object") {
				myChart10.setOption(option, true);

			};
		}	
		
	function getOptions(){
		var colors = ['#5793f3', '#d14a61', '#675bba'];
		option = {
			    color: colors,

			    tooltip: {
			        trigger: 'none',
			       
			        axisPointer: {
			            type: 'cross',
			            label: {
			                backgroundColor: '#1addfa'
			            }
			        }
			    },
			    legend: {
			       data:[], 
			    
			        textStyle : { //详见textStyle
						color : 'white'

					}
			    
			    },
			    title : {
					/* text : '销量趋势(千万)', */
					backgroundColor : '#4682B4',//设置背景颜色
					
					 x: 'left',                 // 水平安放位置，默认为左对齐，可选为：
                     // 'center' ¦ 'left' ¦ 'right'
                     // ¦ {number}（x坐标，单位px）
                     y: '1px',
					textStyle : { //详见textStyle
						color : 'white'

					}

				},
			    
			    
			    
			    grid: {
			        top: 70,
			        bottom: 50
			    },
			    xAxis: [
			        {
			            type: 'category',
			            axisTick: {
			                alignWithLabel: true
			            },
			            
/* 			            axisLine:{
                            lineStyle:{
                                color:'white',
                                width:'2px',
                            }
                        }, */
			            splitLine : {
							show : false
						},//去除网格线
			            axisLine: {
			                onZero: false,
			                lineStyle: {
			                    color: colors[1]
			                }
			            },
			            axisPointer: {
			                label: {
			                    formatter: function (params) {
			                        return '销量  ' + params.value
			                            + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
			                    }
			                }
			            },
			            data:[] /* ["2017-1", "2017-2", "2017-3", "2017-4", "2017-5", "2017-6", "2017-7", "2017-8", "2017-9", "2017-10", "2017-11", "2017-12"] */
			        },
			         {
			            type: 'category',
			            axisTick: {
			                alignWithLabel: true
			            }, 
			            axisLine: {
			                onZero: false,
			                lineStyle: {
			                    color: colors[0]
			                }
			            },
			            axisPointer: {
			                label: {
			                    formatter: function (params) {
			                        return '销量  ' + params.value
			                            + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
			                    }
			                }
			            },
			            data:[] /* ["2018-1", "2018-2", "2018-3", "2018-4", "2018-5", "2018-6", "2018-7", "2018-8", "2018-9", "2018-10", "2018-11", "2018-12"] */
			        }
			    ],
			    yAxis: [
			        {
			            type: 'value',
			           
			            splitLine : {
							show : false
						},//去除网格线
						axisLine:{
							 show:true,
			                    lineStyle:{
			                        color:'#fff'
			                    },
                        },
			        
			        },
			       
			         
			        ],
			    series: [
			        {
			          /*   name:'2017 销量', */
			            type:'line',
			            xAxisIndex: 1,
			            smooth: true,
			            data:[] /* [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3] */
			        },
			        {
			          /*   name:'2018 销量', */
			            type:'line',
			            smooth: true,
			            data:[] /* [3.9, 5.9, 11.1, 18.7, 48.3, 69.2, 231.6, 46.6, 55.4, 18.4, 10.3, 0.7] */
			        }
			    ]
			};
		
		return option;
		
		}	 
		

/* 各地市销量统计图----------------------------------------------------------------------------------------------------  */
/* if (option && typeof option === "object") {
			myChart11.setOption(option, true);

		}
 */
/* var dom11 = document.getElementById("container11");
		var myChart11 = echarts.init(dom11);
		var app = {};
		option = null; */
		
		
	  function getPaint11(container11,text,mapData){			
			var dom = document.getElementById(container11);
			var myChart11 = echarts.init(dom);
			var option = getOptioned();			
			option.title.text = text;

			option.xAxis[0].data = mapData[1];
			option.series[0].data = mapData[0];
		
			
			if (option && typeof option === "object") {
				myChart11.setOption(option, true);

			};
		}	
		
		
		
		
		
function getOptioned(){		
		
		option = {
			    color: ['#3398DB'],
			    tooltip : {
			        trigger: 'axis',
			        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
			            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			        }
			   
			    
		
		
		
		
			    },
			    
			    title : {
					 text : '各地市销量(千万) ', 
					backgroundColor : '#4682B4',//设置背景颜色
					
					 x: 'left',                 // 水平安放位置，默认为左对齐，可选为：
                     // 'center' ¦ 'left' ¦ 'right'
                     // ¦ {number}（x坐标，单位px）
                     y: '10px',
					textStyle : { //详见textStyle
						color : 'white'

					}

				},
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true,
			       
						color : 'white'

				
			    
			    
			    },
			    xAxis : [
			        {
			        	splitLine : {
							show : false
						},//去除网格线 
						
						
						type : 'category',
			            data : [] /* ['广州', '深圳', '佛山', '东莞', '中山', '珠海', '江门','河源','清远','云浮','韶关','惠州','梅州','汕头','汕尾','揭阳','潮州','茂名','湛江','阳江','肇庆'] */ ,
			            axisTick: {
			                alignWithLabel: true
			            },
			            axisLine:{
                            lineStyle:{
                                color:'white',
                                width:'2px',
                            }
                        },
			        
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value',
			            	splitLine : {
								show : false
							},//去除网格线
							
							 axisLine:{
								 show:true,
				                    lineStyle:{
				                        color:'#fff'
				                    },
		                        },
			        
			        
			        }
			    ],
			    series : [
			        {
			            name:'数据源',
			            type:'bar',
			            stack: '总量',
			            barWidth: '60%',
			            label: {
			                normal: {
			                    show: true,
			                    color:'white',
			                    position: 'top'
			                }
			            },
			            data:[],/* [298, 625, 800, 334, 390, 330, 220 , 334, 334, 334, 334, 334, 334, 334, 334, 334, 334, 334, 334, 334, 334] */
			        }
			    ]
			};

		return option;
		} 
/* ----------------------------------------------------------------------------------------------  */






/* 获取型号的js       */
$(document).ready(function(){
	//kindes();
	$('.select_searchableMy').select2();
	$.ajax({
	 		async: false,  //千万要记住加这个属性配置
	 		type: "post",
	 		datatype: 'json',
	 		url: "../brandEnty/brands.do",
	 		success: function(data) {
	 			for(var i=0; i < data.length; i++) {
                	$("#select1").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
	 			  
	 			   
	 			}
	 		}
	 	}); 


 	
 	$.ajax({
 		async: false,  //千万要记住加这个属性配置
 		type: "post",
 		datatype: 'json',
 		url: "../brandEnty/otherBrands.do",
 		success: function(data) {
 			for(var i=0; i < data.length; i++) {
            	$("#select1").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
 			   
 			    
 			}
 		}
 	}); 

 	kindes();	
 	
});
 
$("#select1").change(function(e){
	$(this).parent().next().trigger('click');
    var roleid=this.value;
    $.ajax({  
        url: "../brandEnty/doubles.do",  
        type: "post", 
        async: false,  
        cache: false,  
        dataType: "json",  
        data: {  
            roleid: roleid  //传入角色id，到后台获取json  
        },  
        success: function (result) {
        	$("#select2").empty();      
        	for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象  
            	$("#select2").append("<option value='"+result[i]+"'>"+result[i]+"</option>");           
            }            
        }  
    });
  
});
 
 
 

 /* 机型种类的选择  */
function kindes(){
var keys=$("#kind").val();	
var brand=$("#select1").val();
var model=$("#select2").val();	
	if(keys== '公开市场'){
		$("#COMPETBRANDNAME1").empty();
		$("#COMPETBRANDNAME2").empty();
		
		$.ajax({
	 		async: false,  //千万要记住加这个属性配置
	 		type: "post",
	 		data: {'BRANDNAME':brand,'SPEC':model},
	 		datatype: 'json',
	 		url: "../brandEnty/newBrandBI.do",
	 		success: function(data) {
	 			for(var i=0; i < data.length; i++) {
	            	//$("#select1").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
	 			    $("#COMPETBRANDNAME1").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
	 			    $("#COMPETBRANDNAME2").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
	 			   
	 			}
	 		}
	 	}); 
	
	
		

		$("#COMPETSPEC1").empty();

		 $("#COMPETBRANDNAME1").change(function(e){
				$(this).parent().next().trigger('click');
			    var roleid=this.value;
			    $.ajax({  
			        url: "../brandEnty/newModelBI.do",  
			        type: "post", 
			        async: false,  
			        cache: false,  
			        dataType: "json",  
			        data: {'BRANDNAME':brand,'SPEC':model,'roleid':roleid},  
			        success: function (result) {
			        	$("#COMPETSPEC1").empty();	  
			        	for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象  
			            	$("#COMPETSPEC1").append("<option value='"+result[i]+"'>"+result[i]+"</option>");
			            	
			            }            
			        }  
			    });

			});

		 
		 $("#COMPETSPEC2").empty();
		 
		 $("#COMPETBRANDNAME2").change(function(e){
				$(this).parent().next().trigger('click');
			    var roleid=this.value;
			    $.ajax({  
			        url: "../brandEnty/newModelBI.do",  
			        type: "post", 
			        async: false,  
			        cache: false,  
			        dataType: "json",  
			        data: {'BRANDNAME':brand,'SPEC':model,'roleid':roleid},  
			        success: function (result) {	       
			        	$("#COMPETSPEC2").empty();	        	
			        	for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象 
			            	$("#COMPETSPEC2").append("<option value='"+result[i]+"'>"+result[i]+"</option>");
			               
			            }            
			        }  
			    });

			});
	
	
	
	}else {
		$("#COMPETBRANDNAME1").empty();
		$("#COMPETBRANDNAME2").empty();
		 var brand=$("#select1").val();
		 var model=$("#select2").val();
		
		$.ajax({
	 		async: false,  //千万要记住加这个属性配置
	 		type: "post",
	 		datatype: 'json',
	 		data: {'BRANDNAME':brand,'SPEC':model},
	 		url: "../brandEnty/newBrand.do",
	 		success: function(data) {
	 			for(var i=0; i < data.length; i++) {
                	//$("#select1").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
	 			    $("#COMPETBRANDNAME1").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
	 			    $("#COMPETBRANDNAME2").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
	 			   
	 			}
	 		}
	 	}); 
		
	/* 	$("#select1").change(function(e){
			$(this).parent().next().trigger('click');
		    var roleid=this.value;
		    $.ajax({  
		        url: "../brandEnty/doubles.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {  
		            roleid: roleid  //传入角色id，到后台获取json  
		        },  
		        success: function (result) {
		        	$("#select2").empty();      
		        	for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象  
		            	$("#select2").append("<option value='"+result[i]+"'>"+result[i]+"</option>");           
		            }            
		        }  
		    });
		  
		}); */



		 $("#COMPETBRANDNAME1").change(function(e){
			 var brand=$("#select1").val();
			 var model=$("#select2").val();
			   $(this).parent().next().trigger('click');
			    var roleid=this.value;
			    $.ajax({  
			        url: "../brandEnty/newModel.do",  
			        type: "post", 
			        async: false,  
			        cache: false,  
			        dataType: "json",  
			        data: {'BRANDNAME':brand,'SPEC':model,'roleid':roleid},  
			        success: function (result) {
			        	$("#COMPETSPEC1").empty();	  
			        	for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象  
			            	$("#COMPETSPEC1").append("<option value='"+result[i]+"'>"+result[i]+"</option>");
			            	
			            }            
			        }  
			    });

			});

		 
		 
		 
		 $("#COMPETBRANDNAME2").change(function(e){
			    var brand=$("#select1").val();
			    var model=$("#select2").val();
			    $(this).parent().next().trigger('click');
			    var roleid=this.value;
			    $.ajax({  
			        url: "../brandEnty/newModel.do",  
			        type: "post", 
			        async: false,  
			        cache: false,  
			        dataType: "json",  
			        data: {'BRANDNAME':brand,'SPEC':model,'roleid':roleid},  
			        success: function (result) {	       
			        	$("#COMPETSPEC2").empty();	        	
			        	for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象 
			            	$("#COMPETSPEC2").append("<option value='"+result[i]+"'>"+result[i]+"</option>");
			               
			            }            
			        }  
			    });

			});
		
	}
	
}
/* 时间类型绑定的事件  */

  function changeTime(){
    var timed=$("#times").val();		
	
 	if(timed=='day'){
 		$("#dayes").show();
 		$("#mon").hide();
 	
	}else if(timed=='month'){
		$("#dayes").hide();
		$("#mon").show();
	}
		
}

/* 表头按钮的点击事件  */
function btn(){
	 $("#backHome").show();
	var changeModel=$("#changeModel").val();//品牌对比类型   harry1为相对类型  ，harry2为绝对类型
	 var timed=$("#times").val();//时间类型				
	 var kind=$("#kind").val(); //竞品类型
	 var day1=$("#day1").val();
	 var day2=$("#day2").val();	
	 var month1=$("#month1").val();
	 var month2=$("#month2").val();
	 var brand=$("#select1").val();
	 var model=$("#select2").val();
	 var COMPETBRANDNAME1=$("#COMPETBRANDNAME1").val();
	 var COMPETSPEC1=$("#COMPETSPEC1").val();
	 var COMPETBRANDNAME2=$("#COMPETBRANDNAME2").val();
	 var COMPETSPEC2=$("#COMPETSPEC2").val();
	
	 if(kind==''){
			
			alert("请选择竞品类型！");
			return false;
			
		}

     if(changeModel==''){
	
	   alert("请选择品牌对比类型！");
	   return false;	
     }
	 
     if(timed==''){
		
		alert("请选择时间类型！");
		return false;
		
	  }
      if(COMPETBRANDNAME1==''){
		
		alert("请选择竞品品牌！");
		return false;
		
	   }
      if(COMPETSPEC1==''){
	
	   alert("请选择竞品机型！");
	   return false;
	
       }
      if(COMPETBRANDNAME2==''){
	
	  alert("请选择对标品品牌！");
	  return false;
	
      }
      if(COMPETSPEC2==''){
	
	   alert("请选择对标品机型！");
	   return false;
	
       }
       if(timed=='day'){
		 
		if(day1==''){
			
			alert("请选择日期！");
			return false;
			
		 }

        if(day2==''){
			
			alert("请选择日期！");
			return false;
			
		}
        }
       if(timed=='month'){
	

	   if(month1==''){
		
		alert("请选择月份！");
		return false;
		
	    }

       if(month2==''){
		
		alert("请选择月份！");
		return false;
		
	    }


       }
	 
	 if(changeModel=='harry1'){
	      if(timed=='day'){
	 		var day1=$("#day1").val();
	 		var day2=$("#day2").val();
	 		
	 		$.ajax({  
		        url: "../absolute/liang.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	 if(!isEmptyObject(data)){
			        	
		        		 
		        		 //var colores=['#4472C5','#ED7C30','#80FF80','#FF8096'];	
		        		 var title = [ '当前销量', '规划销量', '竞品销量','对标品销量' ];
		        		 
		        		    text = '量 :  当前销量、规划销量、对标品销量与竞品销量对比曲线（台）                                                                                ';
				        	getPaint1("container",text,title,data); 	           
				        
			        		
			            	
			        	}else{
			        		$("#container").hide();
			        	}
		        	
		        	
		        	 
		        
		        
		        }  
		    });
	 		/* 价  表取数据   */
	 		$.ajax({  
		        url: "../absolute/jiaDay.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	 if(!isEmptyObject(data)){
			        		
		        		 var title = [ '本品价格', '本品二级市场价格',  '竞品二级市场价格' ];
				        	text = '价 :  本品价格及本品竞品二级市场价格(元)                                                                               ';
				        	getPaint2("container1",text,title,data); 
	
			        	}else{
			        		$("#container1").hide();
			        	}
		           
		                }  
		               });
	 /*收 表取数据  */		
	 		$.ajax({  
		        url: "../absolute1/shou.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
		        		  var title = [ '当前收入', '规划收入', '对标品收入', '竞品收入' ];
				        	text = '收  : 当前收入、规划收入、对标品收入与竞品收入对比曲线（元）                                                                                        ';  
				        	getPaint3("container2",text,title,data); 		
	
			        	}else{
			        		$("#container2").hide();
			        	}

		              }  
		    });	
	 
	 		 /*存  表取数据  */		
	 		$.ajax({  
		        url: "../absolute1/cun.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
		        		  var title = [ '实际库存周数', '规划库存周数']; 
				        	
				        	text = '存 : 库存周转对比周数(周)                                                                                               ',                                                                             
				    		
				        	getPaint4("container3",text,title,data); 	
	
			        	}else{
			        		$("#container3").hide();
			        	}
		        	
		        		               
		        }  
		    });	
	 
	 		 /*利  表取数据  */		
	 		$.ajax({  
		        url: "../absolute1/li.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = [ '当前毛利', '规划毛利', '对标品毛利', '竞品毛利'];
				    		text = '利  : 当前毛利、规划毛利、对标品毛利与竞品毛利对比曲线（万元）                                                                   ', 
				        	getPaint5("container4",text,title,data); 	
			            	
			        	}else{
			        		$("#container4").hide();
			        	}
		        	               
		        }  
		    });	
	 
	 
	 		
	 		 /*份   表取数据  */		
	 		$.ajax({  
		        url: "../absolute1/fen.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
		        		  var title = [ '当前份', '规划份'];
							text = '份  : 当前份额与规划份额对比曲线                                                                                                                                                            ', 
				        	getPaint6("container5",text,title,data); 		
	
			        	}else{
			        		$("#container5").hide();
			        	}
		        	
		        	               
		              }  
		    });	
	 		 
	 		 
	 		 /*覆   表取数据  */		
	 		$.ajax({  
		        url: "../absolute1/fu.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
		        		  var title = [ '累计覆盖客户数', '规划累计覆盖客户数'];
							text = '覆 : 覆盖客户数对比曲线(个)                                                                                                             ',                           
					 
				        	getPaint7("container6",text,title,data); 	
			        		
			            	
			        	}else{
			        		$("#container6").hide();
			        	}
		        	               
		        }  
		    });	 
	 	
	 		 /*秩   表取数据  */		
	 		$.ajax({  
		        url: "../absolute1/zhi.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = [ 'DM本地激活数', 'DM异地激活数', '疑似套机数'];
							text = '秩 : DM本地激活数、DM异地激活数与疑似套机数                                                                               ',                                                                            
					
				        	getPaint8("container7",text,title,data); 	
			        		
			            	
			        	}else{
			        		$("#container7").hide();
			        	}
		        	
		        	               
		        }  
		    });	  
	 		 
	 		
	 		
	 		
	 		
	 		
	 		
	 		 
	 		
	 }	 
		}else if(changeModel=='harry2'){
	//执行绝对值的逻辑。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。	
			  if(timed=='day'){
			 		var day1=$("#day1").val();
			 		var day2=$("#day2").val();
			 		
			 		$.ajax({  
				        url: "../absoluteNew/liang.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {   
				        	 if(!isEmptyObject(data)){
					        	
				        		 
				        		 //var colores=['#4472C5','#ED7C30','#80FF80','#FF8096'];	
				        		 var title = [ '当前销量','竞品销量','对标品销量' ];
				        		 
				        		    text = '量 :  当前销量、对标品销量与竞品销量对比曲线（台）                                                                                ';
						        	getPaint1("container",text,title,data); 	           
						        
					        		
					            	
					        	}else{
					        		$("#container").hide();
					        	}
				        	
				        	
				        	 
				        
				        
				        }  
				    });
			 		/* 价  表取数据   */
			 		$.ajax({  
				        url: "../absoluteNew/jiaDay.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {   
				        	 if(!isEmptyObject(data)){
					        		
				        		 var title = [ '当前价', '对标品价', '竞品价' ];
						        	text = '价 :  本品价格、对标品价格、竞品价格(元)                                                                               ';
						        	getPaint2("container1",text,title,data); 
			
					        	}else{
					        		$("#container1").hide();
					        	}
				           
				                }  
				               });
			 /*收 表取数据  */		
			 		$.ajax({  
				        url: "../absoluteNew/shou.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {   
				        	  if(!isEmptyObject(data)){
				        		  var title = [ '当前收入', '对标品收入', '竞品收入' ];
						        	text = '收  : 当前收入、对标品收入与竞品收入对比曲线（元）                                                                                        ';  
						        	getPaint3("container2",text,title,data); 		
			
					        	}else{
					        		$("#container2").hide();
					        	}

				              }  
				    });	
			 
			 		 /*存  表取数据  */		
			 		$.ajax({  
				        url: "../absoluteNew/cun.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {   
				        	  if(!isEmptyObject(data)){
				        		  var title = [ '实际库存周数', '规划库存周数']; 
						        	
						        	text = '存 : 库存周转对比周数(周)                                                                                               ',                                                                             
						    		
						        	getPaint4("container3",text,title,data); 	
			
					        	}else{
					        		$("#container3").hide();
					        	}
				        	
				        		               
				        }  
				    });	
			 
			 		 /*利  表取数据  */		
			 		$.ajax({  
				        url: "../absoluteNew/li.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {   
				        	  if(!isEmptyObject(data)){
					        		
				        		  var title = [ '当前毛利', '对标品毛利', '竞品毛利'];
						    		text = '利  : 当前毛利、对标品毛利与竞品毛利对比曲线（万元）                                                                   ', 
						        	getPaint5("container4",text,title,data); 	
					            	
					        	}else{
					        		$("#container4").hide();
					        	}
				        	               
				        }  
				    });	
			 
			 
			 		
			 		 /*份   表取数据  */		
			 		$.ajax({  
				        url: "../absoluteNew/fen.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {   
				        	  if(!isEmptyObject(data)){
				        		  var title = [ '当前份额'];
									text = '份  : 当前份额对比曲线                                                                                                                                                            ', 
						        	getPaint6("container5",text,title,data); 		
			
					        	}else{
					        		$("#container5").hide();
					        	}
				        	
				        	               
				              }  
				    });	
			 		 
			 		 
			 		 /*覆   表取数据  */		
			 		$.ajax({  
				        url: "../absoluteNew/fu.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {   
				        	  if(!isEmptyObject(data)){
				        		  var title = [ '累计覆盖客户数'];
									text = '覆 : 覆盖客户数曲线(个)                                                                                                             ',                           
							 
						        	getPaint7("container6",text,title,data); 	
					        		
					            	
					        	}else{
					        		$("#container6").hide();
					        	}
				        	               
				        }  
				    });	 
			 	
			 		 /*秩   表取数据  */		
			 		$.ajax({  
				        url: "../absoluteNew/zhi.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {   
				        	  if(!isEmptyObject(data)){
					        		
				        		  var title = [ 'DM本地激活数', 'DM异地激活数', '疑似套机数'];
									text = '秩 : DM本地激活数、DM异地激活数与疑似套机数                                                                               ',                                                                            
							
						        	getPaint8("container7",text,title,data); 	
					        		
					            	
					        	}else{
					        		$("#container7").hide();
					        	}
				        	
				        	               
				        }  
				    });		
			  }
	
			
		}
	 
	 if(changeModel=='harry1'){
	 if(timed=='month'){
			var month1=$("#month1").val();
			var month2=$("#month2").val();	
			/* 量 月指标取数据  */
			$.ajax({  
		        url: "../absolute/month.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {     	
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = [ '当前销量', '规划销量', '对标品销量', '竞品销量' ];
				        	text = '量 :  当前销量、规划销量、对标品销量与竞品销量对比曲线（台）                                                                                ';
				        	getPaint1("container",text,title,data);    
			        		
			        	}else{
			        		$("#container").hide();
			        	}
		        	
		        	        
		        }  
		    });			
		
		/*价 月指标取数据  */
			$.ajax({  
		        url: "../absolute/jiaMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1},
		        success: function (data) {     	
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = [ '当前价', '对标品价', '竞品价' ];
				        	text = '价 :  本品价格及本品竞品二级市场价格(元)                                                                               ';
				        	getPaint2("container1",text,title,data);   
			            	
			        	}else{
			        		$("#container1").hide();
			        	}
		        	     
		        }  
		    });	
		
			 /*收 表取数据  */		
	 		$.ajax({  
		        url: "../absolute1/shouMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = [ '当前收入', '规划收入', '对标品收入', '竞品收入' ];
				        	text = '收  : 当前收入、规划收入、对标品收入与竞品收入对比曲线（元）                                                                                        ';  
				        	getPaint3("container2",text,title,data); 	
			        		
			            	
			        	}else{
			        		$("#container2").hide();
			        	}
		        	           
		        }  
		    });	
		
	 		 /*存  表取数据  */		
	 		$.ajax({  
		        url: "../absolute1/cunMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = [ '实际库存周数', '规划库存周数']; 
				        	
				        	text = '存 : 库存周转对比周数(周)                                                                                               ',                                                                             
				    		
				        	getPaint4("container3",text,title,data); 	
			        		
			            	
			        	}else{
			        		$("#container3").hide();
			        	}
		        	               
		        }  
		    });	
			 
	 		 /*利  表取数据  */		
	 		$.ajax({  
		        url: "../absolute1/liMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
		        		  var title = [ '当前毛利', '规划毛利', '对标品毛利', '竞品毛利'];
				    		text = '利  : 当前毛利、规划毛利、对标品毛利与竞品毛利对比曲线（万元）                                                                   ', 
				        	getPaint5("container4",text,title,data); 
 	
			        	}else{
			        		$("#container4").hide();
			        	}
		        		               
		        }  
		    });	
	 		 
	 		 /*份   表取数据  */		
	 		$.ajax({  
		        url: "../absolute1/fenMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = [ '当前份', '规划份'];
							text = '份  : 当前份额与规划份额对比曲线                                                                                                                                                            ', 
				        	getPaint6("container5",text,title,data); 	 
			        		
			            	
			        	}else{
			        		$("#container5").hide();
			        	}
		        	               
		        }  
		    });		 
	 		
	 		 
	 		 /*覆   表取数据  */		
	 		$.ajax({  
		        url: "../absolute1/fuMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		   var title = [ '累计覆盖客户数', '规划累计覆盖客户数'];
							text = '覆 : 覆盖客户数对比曲线(个)                                                                                                             ',                           
					 
				        	getPaint7("container6",text,title,data); 	    
			        		
			            	
			        	}else{
			        		$("#container6").hide();
			        	}
		        	           
		        }  
		    });	  
	 		 
		
	 		 /*秩   表取数据  */		
	 		$.ajax({  
		        url: "../absolute1/zhiMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = [ 'DM本地激活数', 'DM异地激活数', '疑似套机数'];
							text = '秩 : DM本地激活数、DM异地激活数与疑似套机数                                                                                   ',                                                                            
					
				        	getPaint8("container7",text,title,data); 	 
			        		
			            	
			        	}else{
			        		$("#container7").hide();
			        	}
		        	               
		        }  
		    });	 
	 		 
	 		
	 		
	 		 
	 }
		}else if(changeModel=='harry2'){
	     //执行绝对值的逻辑.....................................................		
		
			 if(timed=='month'){
					var month1=$("#month1").val();
					var month2=$("#month2").val();	
					/* 量 月指标取数据  */
					$.ajax({  
				        url: "../absoluteNew/month.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {     	
				        	  if(!isEmptyObject(data)){
					        		
				        		  var title = [ '当前销量', '对标品销量', '竞品销量' ];
						        	text = '量 :  当前销量、对标品销量与竞品销量对比曲线（台）                                                                                ';
						        	getPaint1("container",text,title,data);    
					        		
					        	}else{
					        		$("#container").hide();
					        	}
				        	
				        	        
				        }  
				    });			
				
				/*价 月指标取数据  */
					$.ajax({  
				        url: "../absoluteNew/jiaMonth.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {     	
				        	  if(!isEmptyObject(data)){
					        		
				        		  var title = [ '当前价', '对标品价', '竞品价' ];
						        	text = '价 :  本品价格及本品竞品二级市场价格(元)                                                                               ';
						        	getPaint2("container1",text,title,data);   
					            	
					        	}else{
					        		$("#container1").hide();
					        	}
				        	     
				        }  
				    });	
				
					 /*收 表取数据  */		
			 		$.ajax({  
				        url: "../absoluteNew/shouMonth.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {   
				        	  if(!isEmptyObject(data)){
					        		
				        		  var title = [ '当前收入',  '对标品收入', '竞品收入' ];
						        	text = '收  : 当前收入、对标品收入与竞品收入对比曲线（元）                                                                                        ';  
						        	getPaint3("container2",text,title,data); 	
					        		
					            	
					        	}else{
					        		$("#container2").hide();
					        	}
				        	           
				        }  
				    });	
				
			 		 /*存  表取数据  */		
			 		$.ajax({  
				        url: "../absoluteNew/cunMonth.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {   
				        	  if(!isEmptyObject(data)){
					        		
				        		  var title = [ '实际库存周数']; 
						        	
						        	text = '存 : 库存周转对比周数(周)                                                                                               ',                                                                             
						    		
						        	getPaint4("container3",text,title,data); 	
					        		
					            	
					        	}else{
					        		$("#container3").hide();
					        	}
				        	               
				        }  
				    });	
					 
			 		 /*利  表取数据  */		
			 		$.ajax({  
				        url: "../absoluteNew/liMonth.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {   
				        	  if(!isEmptyObject(data)){
				        		  var title = [ '当前毛利', '对标品毛利', '竞品毛利'];
						    		text = '利  : 当前毛利、对标品毛利与竞品毛利对比曲线（万元）                                                                   ', 
						        	getPaint5("container4",text,title,data); 
		 	
					        	}else{
					        		$("#container4").hide();
					        	}
				        		               
				        }  
				    });	
			 		 
			 		 /*份   表取数据  */		
			 		$.ajax({  
				        url: "../absoluteNew/fenMonth.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {   
				        	  if(!isEmptyObject(data)){
					        		
				        		  var title = [ '当前份' ];
									text = '份  : 当前份额曲线                                                                                                                                                            ', 
						        	getPaint6("container5",text,title,data); 	 
					        		
					            	
					        	}else{
					        		$("#container5").hide();
					        	}
				        	               
				        }  
				    });		 
			 		
			 		 
			 		 /*覆   表取数据  */		
			 		$.ajax({  
				        url: "../absoluteNew/fuMonth.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {   
				        	  if(!isEmptyObject(data)){
					        		
				        		   var title = [ '累计覆盖客户数'];
									text = '覆 : 覆盖客户数曲线(个)                                                                                                             ',                           
							 
						        	getPaint7("container6",text,title,data); 	    
					        		
					            	
					        	}else{
					        		$("#container6").hide();
					        	}
				        	           
				        }  
				    });	  
			 		 
				
			 		 /*秩   表取数据  */		
			 		$.ajax({  
				        url: "../absoluteNew/zhiMonth.do",  
				        type: "post", 
				        async: false,  
				        cache: false,  
				        dataType: "json",  
				        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
				        success: function (data) {   
				        	  if(!isEmptyObject(data)){
					        		
				        		  var title = [ 'DM本地激活数', 'DM异地激活数', '疑似套机数'];
									text = '秩 : DM本地激活数、DM异地激活数与疑似套机数                                                                                   ',                                                                            
							
						        	getPaint8("container7",text,title,data); 	 
					        		
					            	
					        	}else{
					        		$("#container7").hide();
					        	}
				        	               
				        }  
				    });	 
	 
			 }
	
		}
	// $("#backHome").hide();
	     setTimeout(function(){//定时器 
		 $("#backHome").css("display","none");//将图片的display属性设置为none
	 },
	 3000);
}


/* 进入全生命周期事件  */

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




function btn1(){
	 var timed=$("#times").val();//时间类型		
	 var kind=$("#kind").val(); //竞品类型			
	 var day1=$("#day1").val();
	 var day2=$("#day2").val();	
	 var month1=$("#month1").val();
	 var month2=$("#month2").val();
	 var brand=$("#select1").val();
	 var model=$("#select2").val();
	 var COMPETBRANDNAME1=$("#COMPETBRANDNAME1").val();
	 var COMPETSPEC1=$("#COMPETSPEC1").val();
	 var COMPETBRANDNAME2=$("#COMPETBRANDNAME2").val();
	 var COMPETSPEC2=$("#COMPETSPEC2").val(); 	 		
	
	 if(kind==''){
			
			alert("请选择竞品类型！");
			return false;
			
		}
	 
if(timed==''){
		
		alert("请选择时间类型！");
		return false;
		
	}
if(COMPETBRANDNAME1==''){
		
		alert("请选择竞品品牌！");
		return false;
		
	}
if(COMPETSPEC1==''){
	
	alert("请选择竞品机型！");
	return false;
	
}
if(COMPETBRANDNAME2==''){
	
	alert("请选择对标品品牌！");
	return false;
	
}
if(COMPETSPEC2==''){
	
	alert("请选择对标品机型！");
	return false;
	
}
if(timed=='day'){
		 
		if(day1==''){
			
			alert("请选择日期！");
			return false;
			
		}

if(day2==''){
			
			alert("请选择日期！");
			return false;
			
		}


}
if(timed=='month'){
	

	if(month1==''){
		
		alert("请选择月份！");
		return false;
		
	}

if(month2==''){
		
		alert("请选择月份！");
		return false;
		
	}



}
	 
	 
	 
	 /*  var url=basePath+"/quantitySet/show.do?BRANDNAME="+brand+"&SPEC="+model+"&brand1="+COMPETBRANDNAME1
			 +"&model1="+COMPETSPEC1+"&brand2="+COMPETBRANDNAME2+ "&model2="+COMPETSPEC2;
	 location.href=url; */
	 
	 $.StandardPost(basePath+'/quantitySet/show.do',{'BRANDNAME':brand,'SPEC':model,
 		'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2});
	 
	 
	 /*  $.ajax({  
		        url: "../quantitySet/show.do",  
		        type: "post", 
		        async: false,   
		        cache: false,  
		        dataType: "json",  
		        data: {'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,
		        	'brand2':COMPETBRANDNAME2,'model2':
		        		COMPETSPEC2},
		        success: function (data) {   
		        	
		        }  
		    });	  
 */
	 // $(this).attr("href","../quantitySet/index.do")  

	 
	 
	 
} 
/* 销量 按钮事件的点击事件  */
function saleProduct(){
	/*  var brand=$("#oneDate").val();
	 var model=$("#twoDate").val(); */
	 var timed=$("#times").val();//时间类型		
	 var brand=$("#select1").val();
	 var model=$("#select2").val();
	 var COMPETBRANDNAME1=$("#COMPETBRANDNAME1").val();
	 var COMPETSPEC1=$("#COMPETSPEC1").val();
	 var COMPETBRANDNAME2=$("#COMPETBRANDNAME2").val();
	 var COMPETSPEC2=$("#COMPETSPEC2").val();
	 var number="量";
	 /*  $.StandardPost(basePath+'/absolute1/important.do',{'BRANDNAME':brand,'SPEC':model});	 */
	 if(timed=='day'){
		 var day1=$("#day1").val();
	 	 var day2=$("#day2").val();
	 $.ajax({  
	        url:basePath+"/absolute1/important.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'BRANDNAME':brand,'SPEC':model},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		  text = '重点产品达成率',                                                                            
	        			
	  				getPaintDate("container9",text,data); 	 
		        		
		            	
		        	}else{
		        		$("#container9").hide();
		        	}
				               
	        }  
	    });	     

	
	 /*销量趋势表取数据     */	
		 
		$.ajax({  
	        url: "../absolute1/direction.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        	    var title = ['2018 销量', '2017 销量'];
	  				text = '销量趋势',                                                                            
	  	        	getPaint10("container10",text,title,data); 	
	
		        	}else{
		        		$("#container10").hide();
		        	}
	        	               
	        }  
	    });	    
		 
		
		
		/*各地市销量取数据     */	
		 
	 	$.ajax({  
	        url: "../absolute1/areaDay.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		  text = '各地市销量',                                                                            
	        			
	  	        	getPaint11("container11",text,data);     
		        		
		            	
		        	}else{
		        		$("#container11").hide();
		        	}
	        	       
	        
	        }  
	    }); 	    	
		
		
		
	 	/*五线七口销量取数据      */	
		 
	 	$.ajax({  
	        url: "../absolute1/areaPortDay.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
	        		  text = '五线七口销量',                                                                            
	  				title = '', 
	  	        	 getPaint9("container8",text,title,data);
                      
		        		
		            	
		        	}else{
		        		$("#container8").hide();
		        	}
				      
	        }  
	    }); 	    	
	 
	 	$("#container9").show();
	 	$("#container8").show();
	 }else if(timed=='month'){
		    var month1=$("#month1").val();
			var month2=$("#month2").val();	
		 /*销量趋势表取数据     */	
 		 
	 		$.ajax({  
		        url: "../absolute1/directionMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = ['2018 销量', '2017 销量'];
							text = '销量趋势',                                                                            
					
				        	getPaint10("container10",text,title,data); 	
			        		
			            	
			        	}else{
			        		$("#container10").hide();
			        	}
		        	               
		        }  
		    });	    
		 /*五线七口月销量    */
		 
	 		$.ajax({  
		        url: "../absolute1/areaPortMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  text = '五线七口销量',                                                                            
							title = '', 
				        	 getPaint9("container8",text,title,data);     
			        		
			            	
			        	}else{
			        		$("#container8").hide();
			        	}
					 
		        }  
		    }); 	    	
		 /*各地市销量月指标   */
	 		$.ajax({  
		        url: "../absolute1/areaMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  text = '各地市销量',                                                                            
		      			
				        	getPaint11("container11",text,data);   
			        		
			            	
			        	}else{
			        		$("#container11").hide();
			        	}
					           
		        }  
		    }); 	    	
	 		
		 /* 重点产品达成率  */
		 $.ajax({  
	 	        url:basePath+"/absolute1/important.do",  
	 	        type: "post", 
	 	        async: false,  
	 	        cache: false,  
	 	        dataType: "json",  
	 	        data: {'BRANDNAME':brand,'SPEC':model},
	 	        success: function (data) {   
	 	        	  if(!isEmptyObject(data)){
	 		        		
	 	        		 text = '重点产品达成率',                                                                            
	 	    	 		
	 	 				getPaintDate("container9",text,data); 	     
	 		        		
	 		            	
	 		        	}else{
	 		        		$("#container9").hide();
	 		        	}
	 				            
	 	        }  
	 	    });	
		 
	 		$("#container9").show();
		 	$("#container8").show(); 
		 
	 }
	
	 
}

/* 价格按钮点击事件  */

function priceProduct(){
	
	 var timed=$("#times").val();//时间类型		
	 var brand=$("#select1").val();
	 var model=$("#select2").val();
	 var COMPETBRANDNAME1=$("#COMPETBRANDNAME1").val();
	 var COMPETSPEC1=$("#COMPETSPEC1").val();
	 var COMPETBRANDNAME2=$("#COMPETBRANDNAME2").val();
	 var COMPETSPEC2=$("#COMPETSPEC2").val();
	 var number="价";
	 /*  $.StandardPost(basePath+'/absolute1/important.do',{'BRANDNAME':brand,'SPEC':model});	 */
	 if(timed=='day'){
		 var day1=$("#day1").val();
	 	 var day2=$("#day2").val();
	

	
	 /*销量趋势表取数据     */	
		 
		$.ajax({  
	        url: "../absolute1/direction.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		var title = ['2018 销量', '2017 销量'];
	  				text = '销量趋势',                                                                            
	  		
	  	        	getPaint10("container10",text,title,data); 	    
		        		
		            	
		        	}else{
		        		$("#container10").hide();
		        	}
	        	            
	        }  
	    });	    
		 
		
		
		/*各地市销量取数据     */	
		 
	 	$.ajax({  
	        url: "../absolute1/areaDay.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		  text = '各地市销量',                                                                            
	        			
	  	        	 getPaint11("container11",text,data);     
		        		
		            	
		        	}else{
		        		$("#container11").hide();
		        	}
				       
	        }  
	    }); 	    	
		
		
		
	 	/*五线七口价格取数据      */	
		 
	 	$.ajax({  
	        url: "../absolute1/priceAreaPortDay.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		  text = '五线七口价格',                                                                            
	  				title = '', 
	  	        	 getPaint9("container8",text,title,data); 
		        		
		            	
		        	}else{
		        		$("#container8").hide();
		        	}
				     
	        }  
	    }); 	    	
	 
	 	$("#container9").hide();
	
	 	$("#container8").show();
	 }else if(timed=='month'){
		    var month1=$("#month1").val();
			var month2=$("#month2").val();	
		 /*销量趋势表取数据     */	
 		 
	 		$.ajax({  
		        url: "../absolute1/directionMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = ['2018 销量', '2017 销量'];
							text = '销量趋势',                                                                            
					
				        	getPaint10("container10",text,title,data); 	 
			        		
			            	
			        	}else{
			        		$("#container10").hide();
			        	}
		        	              
		        }  
		    });	    
		 /*五线七口月价格     */
		 
	 		$.ajax({  
		        url: "../absolute1/areaPricePortMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
		        		  text = '五线七口价格',                                                                            
							title = '', 
				        	 getPaint9("container8",text,title,data);  
                          
			        		
			            	
			        	}else{
			        		$("#container8").hide();
			        	}
					    
		        }  
		    }); 	    	
	 		/*各地市销量取数据     */	
			 
		 	$.ajax({  
		        url: "../absolute1/areaMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  text = '各地市销量',                                                                            
		      			
				        	getPaint11("container11",text,data);    
			        		
			            	
			        	}else{
			        		$("#container11").hide();
			        	}
					          
		        }  
		    }); 	    	
			$("#container9").hide();
			
		 	$("#container8").show();
	 
	 }
	
	

}
/*收入按钮点击事件   */

function incomeProduct(){
	
	 var timed=$("#times").val();//时间类型		
	 var brand=$("#select1").val();
	 var model=$("#select2").val();
	 var COMPETBRANDNAME1=$("#COMPETBRANDNAME1").val();
	 var COMPETSPEC1=$("#COMPETSPEC1").val();
	 var COMPETBRANDNAME2=$("#COMPETBRANDNAME2").val();
	 var COMPETSPEC2=$("#COMPETSPEC2").val();
	 var number="收";
	 /*  $.StandardPost(basePath+'/absolute1/important.do',{'BRANDNAME':brand,'SPEC':model});	 */
	 if(timed=='day'){
		 var day1=$("#day1").val();
	 	 var day2=$("#day2").val();
	

	
	 /*销量趋势表取数据     */	
		 
		$.ajax({  
	        url: "../absolute1/direction.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		var title = ['2018 销量', '2017 销量'];
	  				text = '销量趋势',                                                                            
	  		
	  	        	getPaint10("container10",text,title,data);  
		        		
		            	
		        	}else{
		        		$("#container10").hide();
		        	}
	        		               
	        }  
	    });	    
		 
		
		
		/*各地市销量取数据     */	
		 
	 	$.ajax({  
	        url: "../absolute1/areaDay.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		  text = '各地市销量',                                                                            
	        			
	  	        	getPaint11("container11",text,data);  
		        		
		            	
		        	}else{
		        		$("#container11").hide();
		        	}
				          
	        }  
	    }); 	    	
		
		
		
	 	/*五线七口收入 取数据      */	
		 
	 	$.ajax({  
	        url: "../absolute1/priceAreaPortDay.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		  text = '五线七口收入',                                                                            
	  				title = '', 
	  	        	 getPaint9("container8",text,title,data);      
		        		
		            	
		        	}else{
		        		$("#container8").hide();
		        	}
				  
	        }  
	    }); 	    	
	 
	 	$("#container9").hide();
	
	 	$("#container8").show();
	 }else if(timed=='month'){
		    var month1=$("#month1").val();
			var month2=$("#month2").val();	
		 /*销量趋势表取数据     */	
 		 
	 		$.ajax({  
		        url: "../absolute1/directionMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = ['2018 销量', '2017 销量'];
							text = '销量趋势',                                                                            
					
				        	getPaint10("container10",text,title,data); 
			        		
			            	
			        	}else{
			        		$("#container10").hide();
			        	}
		        		               
		        }  
		    });	    
		 /*五线七口月收入   */
		 
	 		$.ajax({  
		        url: "../absolute1/areaPricePortMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  text = '五线七口收入',                                                                            
							title = '', 
				        	 getPaint9("container8",text,title,data);  
			        		
			            	
			        	}else{
			        		$("#container8").hide();
			        	}
					      
		        }  
		    }); 	    	
		 
	 		/*各地市销量取数据     */	
			 
		 	$.ajax({  
		        url: "../absolute1/areaMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  text = '各地市销量',                                                                            
		      			
				        	getPaint11("container11",text,data);   
			        		
			            	
			        	}else{
			        		$("#container11").hide();
			        	}
					         
		        }  
		    }); 	    	
	 
			$("#container9").hide();
			
		 	$("#container8").show();
	 
	 }	
	
}
/* 库存 按钮的点击事件  */
function stock(){
	
	var timed=$("#times").val();//时间类型		
	 var brand=$("#select1").val();
	 var model=$("#select2").val();
	 var COMPETBRANDNAME1=$("#COMPETBRANDNAME1").val();
	 var COMPETSPEC1=$("#COMPETSPEC1").val();
	 var COMPETBRANDNAME2=$("#COMPETBRANDNAME2").val();
	 var COMPETSPEC2=$("#COMPETSPEC2").val();
	
	 /*  $.StandardPost(basePath+'/absolute1/important.do',{'BRANDNAME':brand,'SPEC':model});	 */
	 if(timed=='day'){
		 var day1=$("#day1").val();
	 	 var day2=$("#day2").val();
	

	
	 /*销量趋势表取数据     */	
		 
		$.ajax({  
	        url: "../absolute1/directionDayNow.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		  var title = ['2018 销量', '2017 销量'];
	  				text = '销量趋势',                                                                            
	  		
	  	        	getPaint10("container10",text,title,data); 	  
		        		
		            	
		        	}else{
		        		$("#container10").hide();
		        	}
	        	               
	        }  
	    });	    
		 
		
		
		/*各地市销量取数据     */	
		 
	 	$.ajax({  
	        url: "../absolute/cunAreaDay.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
	        		  text = '各地市销量',                                                                            
	        			
	  	        	getPaint11("container11",text,data);   	
                      
		        		
		            	
		        	}else{
		        		$("#container11").hide();
		        	}
				         
	        }  
	    }); 	    	
		
		
	    	
	 	$("#container8").hide();
	 	$("#container9").hide();
	 
	 }else if(timed=='month'){
		    var month1=$("#month1").val();
			var month2=$("#month2").val();	
		 /*销量趋势表取数据     */	
		 
	 		$.ajax({  
		        url: "../absolute1/directionMonthNow.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = ['2018 销量', '2017 销量'];
							text = '销量趋势',                                                                            
					
				        	getPaint10("container10",text,title,data); 
			        		
			            	
			        	}else{
			        		$("#container10").hide();
			        	}
		        		               
		        }  
		    });	    
		 	    	
	 		/*各地市销量取数据     */	
			 
		 	$.ajax({  
		        url: "../absolute/cunAreaMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
		        		   text = '各地市销量',                                                                            
		      			
				        	getPaint11("container11",text,data);     	
                          
			        		
			            	
			        	}else{
			        		$("#container11").hide();
			        	}
					       
		        }  
		    }); 	    	
		 	$("#container9").hide();
		 	$("#container8").hide();
	 }	
	
	
}
/* 价差按钮的点击事件  */
function profit(){
	
	var timed=$("#times").val();//时间类型		
	 var brand=$("#select1").val();
	 var model=$("#select2").val();
	 var COMPETBRANDNAME1=$("#COMPETBRANDNAME1").val();
	 var COMPETSPEC1=$("#COMPETSPEC1").val();
	 var COMPETBRANDNAME2=$("#COMPETBRANDNAME2").val();
	 var COMPETSPEC2=$("#COMPETSPEC2").val();
	 var number="利";
	 /*  $.StandardPost(basePath+'/absolute1/important.do',{'BRANDNAME':brand,'SPEC':model});	 */
	 if(timed=='day'){
		 var day1=$("#day1").val();
	 	 var day2=$("#day2").val();
	

	
	 /* 价差五线七口数据      */	
		 
		$.ajax({  
	        url: "../absolute1/priceAreaPortDay.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		  text = '五线七口价差',                                                                            
	  				title = '', 
	  	        	 getPaint9("container8",text,title,data);  
		        		
		            	
		        	}else{
		        		$("#container8").hide();
		        	}
				    
	        }  
	    }); 	    	
		 
		
		
		/*各地市销量取数据     */	
		 
	 	$.ajax({  
	        url: "../absolute1/areaDay.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		  text = '各地市销量',                                                                            
	        			
	  	        	getPaint11("container11",text,data);  
		        		
		            	
		        	}else{
		        		$("#container11").hide();
		        	}
				          
	        }  
	    }); 	    	
		
	 	 /*销量趋势表取数据     */	
		 
		$.ajax({  
	        url: "../absolute1/direction.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		  var title = ['2018 销量', '2017 销量'];
	  				text = '销量趋势',                                                                            
	  		
	  	        	getPaint10("container10",text,title,data); 	  
		        		
		            	
		        	}else{
		        		$("#container10").hide();
		        	}
	        	              
	        }  
	    });	    
		$("#container8").show(); 	
		$("#container9").hide();
	 
	 }else if(timed=='month'){
		    var month1=$("#month1").val();
			var month2=$("#month2").val();	
			/*五线七口月收入   */
			 
	 		$.ajax({  
		        url: "../absolute1/areaPricePortMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  text = '五线七口价差',                                                                            
							title = '', 
				        	 getPaint9("container8",text,title,data);  
			        		
			            	
			        	}else{
			        		$("#container8").hide();
			        	}
					    
		        }  
		    }); 	    	
		 	    	
	 		/*各地市销量取数据     */	
			 
		 	$.ajax({  
		        url: "../absolute1/areaMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  text = '各地市销量',                                                                            
		      			
				        	getPaint11("container11",text,data);    
			        		
			            	
			        	}else{
			        		$("#container11").hide();
			        	}
					        
		        }  
		    }); 	    	
		 	 /*销量趋势表取数据     */	
	 		 
	 		$.ajax({  
		        url: "../absolute1/directionMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2,'number':number},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = ['2018 销量', '2017 销量'];
							text = '销量趋势',                                                                            
					
				        	getPaint10("container10",text,title,data);  
			        		
			            	
			        	}else{
			        		$("#container10").hide();
			        	}
		        		               
		        }  
		    });	    	
	 		$("#container8").show(); 	
			$("#container9").hide();
	 }	
	
	
}
/*份额按钮点击事件   */
function share(){
	
	var timed=$("#times").val();//时间类型		
	 var brand=$("#select1").val();
	 var model=$("#select2").val();
	 var COMPETBRANDNAME1=$("#COMPETBRANDNAME1").val();
	 var COMPETSPEC1=$("#COMPETSPEC1").val();
	 var COMPETBRANDNAME2=$("#COMPETBRANDNAME2").val();
	 var COMPETSPEC2=$("#COMPETSPEC2").val();
	
	 /*  $.StandardPost(basePath+'/absolute1/important.do',{'BRANDNAME':brand,'SPEC':model});	 */
	 if(timed=='day'){
		 var day1=$("#day1").val();
	 	 var day2=$("#day2").val();
	

	
	 /*销量趋势表取数据     */	
		 
		$.ajax({  
	        url: "../absolute/showDayNow.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		  var title = ['2018 销量', '2017 销量'];
	  				text = '销量趋势',                                                                            
	  		
	  	        	getPaint10("container10",text,title,data); 	 
		        		
		            	
		        	}else{
		        		$("#container10").hide();
		        	}
	        	              
	        }  
	    });	    
		 
		
		
		/*各地市销量取数据     */	
		 
	 	$.ajax({  
	        url: "../absolute/fenAreaDay.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		  text = '各地市销量',                                                                            
	        			
	  	        	getPaint11("container11",text,data);     
		        		
		            	
		        	}else{
		        		$("#container11").hide();
		        	}
				       
	        }  
	    }); 	    	
		
		
	    	
	 	$("#container8").hide();
	 	$("#container9").hide();
	 
	 }else if(timed=='month'){
		    var month1=$("#month1").val();
			var month2=$("#month2").val();	
		 /*销量趋势表取数据     */	
		 
	 		$.ajax({  
		        url: "../absolute/showMonthNow.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = ['2018 销量', '2017 销量'];
							text = '销量趋势',                                                                            
					
				        	getPaint10("container10",text,title,data); 	
			        		
			            	
			        	}else{
			        		$("#container10").hide();
			        	}
		        	               
		        }  
		    });	    
		 	    	
	 		/*各地市销量取数据     */	
			 
		 	$.ajax({  
		        url: "../absolute/fenAreaMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  text = '各地市销量',                                                                            
		      			
				        	getPaint11("container11",text,data);  
			        		
			            	
			        	}else{
			        		$("#container11").hide();
			        	}
					          
		        }  
		    }); 	    	
		 	$("#container9").hide();
		 	$("#container8").hide();
	 }	
	
}
/*  覆盖按钮点击事件  */
function cover(){
	

	var timed=$("#times").val();//时间类型		
	 var brand=$("#select1").val();
	 var model=$("#select2").val();
	 var COMPETBRANDNAME1=$("#COMPETBRANDNAME1").val();
	 var COMPETSPEC1=$("#COMPETSPEC1").val();
	 var COMPETBRANDNAME2=$("#COMPETBRANDNAME2").val();
	 var COMPETSPEC2=$("#COMPETSPEC2").val();
	
	 /*  $.StandardPost(basePath+'/absolute1/important.do',{'BRANDNAME':brand,'SPEC':model});	 */
	 if(timed=='day'){
		 var day1=$("#day1").val();
	 	 var day2=$("#day2").val();
	

	
	 /*销量趋势表取数据     */	
		 
		$.ajax({  
	        url: "../absolute/coverDayNow.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		  var title = ['2018 销量', '2017 销量'];
	  				text = '销量趋势',                                                                            
	  		
	  	        	getPaint10("container10",text,title,data); 	 
		        		
		            	
		        	}else{
		        		$("#container10").hide();
		        	}
	        	              
	        }  
	    });	    
		 
		
		
		/*各地市销量取数据     */	
		 
	 	$.ajax({  
	        url: "../absolute/coverAreaDay.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		  text = '各地市销量',                                                                            
	        			
	  	        	getPaint11("container11",text,data);    
		        		
		            	
		        	}else{
		        		$("#container11").hide();
		        	}
				        
	        }  
	    }); 	    	
		
		
	    	
	 	$("#container8").hide();
	 	$("#container9").hide();
	 
	 }else if(timed=='month'){
		    var month1=$("#month1").val();
			var month2=$("#month2").val();	
		 /*销量趋势表取数据     */	
		 
	 		$.ajax({  
		        url: "../absolute/coverMonthNow.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = ['2018 销量', '2017 销量'];
							text = '销量趋势',                                                                            
					
				        	getPaint10("container10",text,title,data); 	
			        		
			            	
			        	}else{
			        		$("#container10").hide();
			        	}
		        	               
		        }  
		    });	    
		 	    	
	 		/*各地市覆盖销量取数据     */	
			 
		 	$.ajax({  
		        url: "../absolute/coverAreaMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  text = '各地市销量',                                                                            
		      			
				        	getPaint11("container11",text,data);  
			        		
			            	
			        	}else{
			        		$("#container11").hide();
			        	}
					           
		        }  
		    }); 	    	
		 	$("#container9").hide();
		 	$("#container8").hide();
	 }	
	
}

/* 秩按钮点击事件  */

function order(){
	
	var timed=$("#times").val();//时间类型		
	 var brand=$("#select1").val();
	 var model=$("#select2").val();
	 var COMPETBRANDNAME1=$("#COMPETBRANDNAME1").val();
	 var COMPETSPEC1=$("#COMPETSPEC1").val();
	 var COMPETBRANDNAME2=$("#COMPETBRANDNAME2").val();
	 var COMPETSPEC2=$("#COMPETSPEC2").val();
	
	 /*  $.StandardPost(basePath+'/absolute1/important.do',{'BRANDNAME':brand,'SPEC':model});	 */
	 if(timed=='day'){
		 var day1=$("#day1").val();
	 	 var day2=$("#day2").val();
	

	
	 /*销量趋势表取数据     */	
		 
		$.ajax({  
	        url: "../absolute/orderDayNow.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
	        		  var title = ['2018 销量', '2017 销量'];
	  				text = '销量趋势',                                                                            
	  		
	  	        	getPaint10("container10",text,title,data); 	 	
                      
		        		
		            	
		        	}else{
		        		$("#container10").hide();
		        	}
	        	              
	        }  
	    });	    
		 
		
		
		/*各地市销量取数据     */	
		 
	 	$.ajax({  
	        url: "../absolute/orderAreaDay.do",  
	        type: "post", 
	        async: false,  
	        cache: false,  
	        dataType: "json",  
	        data: {'start':day1,'end':day2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
	        success: function (data) {   
	        	  if(!isEmptyObject(data)){
		        		
	        		  text = '各地市销量',                                                                            
	        			
	  	        	getPaint11("container11",text,data);       
		        		
		            	
		        	}else{
		        		$("#container11").hide();
		        	}
				     
	        }  
	    }); 	    	
		
		
	    	
	 	$("#container8").hide();
	 	$("#container9").hide();
	 
	 }else if(timed=='month'){
		    var month1=$("#month1").val();
			var month2=$("#month2").val();	
		 /*销量趋势表取数据     */	
		 
	 		$.ajax({  
		        url: "../absolute/orderMonthNow.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  var title = ['2018 销量', '2017 销量'];
							text = '销量趋势',                                                                            
					
				        	getPaint10("container10",text,title,data); 	  
			        		
			            	
			        	}else{
			        		$("#container10").hide();
			        	}
		        	             
		        }  
		    });	    
		 	    	
	 		/*各地市覆盖销量取数据     */	
			 
		 	$.ajax({  
		        url: "../absolute/orderAreaMonth.do",  
		        type: "post", 
		        async: false,  
		        cache: false,  
		        dataType: "json",  
		        data: {'start':month1,'end':month2,'BRANDNAME':brand,'SPEC':model,'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2},
		        success: function (data) {   
		        	  if(!isEmptyObject(data)){
			        		
		        		  text = '各地市销量',                                                                            
		      			
				        	getPaint11("container11",text,data);  
			        		
			            	
			        	}else{
			        		$("#container11").hide();
			        	}
					          
		        }  
		    }); 	    	
		 	$("#container9").hide();
		 	$("#container8").hide();
	 }	
	
	
}

//品牌

function showTermBrnd(arr){
	var id = "select1";   
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






	</script>

</body>
</html>