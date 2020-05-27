<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>dialog</title>
	<style>
		.dialogContent div{
			color: #000000;
		}
		.modal-content{
			width:1200px;
		}
		.modal-body {
			background-color: #000033;
			 min-height:1500px;
		}
		.modal-footer{
			background-color:#1d7db1;
		}
		.modal-header{
			background-color: #337ab7;
			color:#fff;
		}
		table, th, td{
  			border: 1px solid blue;
  			height:30px;
  		}
  		label{
  			color:#fff;
  		}
	</style>
	
</head>
<body>
<div class="dialogContent">
	<div class='row'>
		<div class="col-xs-2"  align="left">
			<label style="color: #3eb8c5;font-size: 20px;margin-top: -10px;">平台份额</label>
		</div>
		<div class="col-xs-3"  align="center">
			 <label>&nbsp;&nbsp;&nbsp;开始时间:</label>
			 <input  id="startDay"  type="text" style="width:60%;" readonly="readonly"class="form-text select prevMonth"
					   	  		onClick="WdatePicker({dateFmt:'yyyyMMdd',maxDate:'%y-{%M}-%d'})" />&nbsp;&nbsp;&nbsp;
		</div>
		<div class="col-xs-3"  align="center">
			 <label>-&nbsp;&nbsp;&nbsp;结束时间:</label>
			 <input  id="stopDay"  type="text" style="width:60%;" readonly="readonly"class="form-text select prevMonth"
					   	  		onClick="WdatePicker({dateFmt:'yyyyMMdd',maxDate:'%y-{%M}-%d'})" />
		</div>
		<div></div>
		<div class="col-xs-3"  align="right">
	  		<div class="col-xs-2"> 
	  			<button type="button" onclick="queryShare();" class="btn btn-primary" style="width:200px" > 查询</button>
	  		</div>
		</div>
	</div>
	<br/>
	
		<div class="row"  style="width: 100%;height: 700px;">
			<div class="col-xs-2" align="center">
				<label>&nbsp;&nbsp;&nbsp;维度1:</label>
				<select class="select_square">
					<option>五线七口</option>
				</select>
			</div>
			<div class="col-xs-12"  align="center" style="height:700px;width: 100%;">
	 	  		<div class="panel panel-default" style="height:100%;width: 100%;">
				  <div class="panel-body" style="height:600px;width: 100%;">
				    <div  style="height:600px;width: 100%;">
				    	<div class="col-xs-6">
				    		<div  id='share_char' style='height:600px;width: 540px;'></div>
				    	</div>
				    	<div style='height:45px;width: 100%;padding-left: 40%;'>
				    		<input type="button" class="btn" value="上月" name="btn_share" onclick="selectMomOrYear(1);"/>
				    		<input type="button" class="btn" value="去年同期" name="btn_share"  onclick="selectMomOrYear(2);"/>
				    	</div>
				    	<div class="col-xs-6"  name="share_char_Year">
				    		<div  id='share_char_Year' style='height:550px;width: 540px;'></div>
				    	</div>
				    	<div class="col-xs-6" name="share_char_Mom">
				    		<div  id='share_char_Mom' style='height:550px;width: 540px;'></div>
				    	</div>
				    </div>
				  </div>
		 	 	</div>
			</div>
		</div>
		<div class="row"  style="width: 100%;height: 650px;">
			<div class="col-xs-2" align="center">
				<label>&nbsp;&nbsp;&nbsp;维度2:</label>
				<select class="select_square">
					<option>详情</option>
				</select>
			</div>
			<div class="col-xs-6">
				<input type="text" class="txt" id="share_text1" style="color:blue;"/>
			</div>
			<div class="col-xs-12"  align="center" style="height:600px;width: 100%;">
	 	  		<div class="panel panel-default" style="height:600px;width: 100%;">
				  <div class="panel-body" style="height:600px;width: 100%;">
				    <div style="height:600px;width: 100%;">
				    	<div  id="share_char_line" style='height:600px;width: 1100px;'></div>
				    </div>
				  </div>
		 	 	</div>
			</div>
		</div>
		
</div>
</body>
	<script type="text/javascript">
		$(function(){
			//初始化事时间
//			$("#startDay").val(getStartDayValue());
//			$("#stopDay").val(getStopDayValue());
			$("#startDay").val("20180101");
			$("#stopDay").val("20180108");
			//初始化  五线七口图
			initSharePie();
			//初始化话隐藏饼图的去年同期
			selectMomOrYear(1);
			
			//初始化波形图
			initShareLine();
		});
		//查询按钮
		function queryShare(){
			//时间校验
			checkDayShare();
			//初始化  五线七口图
			initSharePie();
			//初始化话隐藏饼图的去年同期
			selectMomOrYear(1);
			
			//初始化波形图
			initShareLine();
		};
		
		//根据电脑时间 获取上个月份
		function getStartDayValue(){
			var myDate = new Date();
			var year = myDate.getFullYear();
			var month = myDate.getMonth()+1;
			var day=myDate.getDay();
		    if (month >= 1 && month <= 9) {
		        month = "0" + month;
		    }
		    if (day >= 1 && day <= 9) {
		    	day = "0" + day;
		    }
			return year+""+month+""+day;
		};
		function getStopDayValue(){//获取一周前的时间
			var now = new Date();
			var myDate = new Date(now.getTime() - 7 * 24 * 3600 * 1000);
			var year = myDate.getFullYear(); 
			var month = myDate.getMonth()+1;
			var day=myDate.getDate();
		    if (month >= 1 && month <= 9) {
		        month = "0" + month;
		    }
		    if (day >= 1 && day <= 9) {
		    	day = "0" + day;
		    }
			return year+""+month+""+day;
		};
		
		//五线七口
		function initSharePie(){
			var sub_key="pie_char_show_share";
			var result_Data = queryCharData_Share(sub_key);
			var divId="share_char";
			pieChartShow_share(divId,result_Data);
		};
		
		//初始化波形图
		function initShareLine(){
			var sub_key="line_char_show_share";
			var result_Data = queryCharData_Share(sub_key);
			var divId="share_char_line";
			lineChartShow_share(divId,result_Data);
		};
		
		//获取数据
		function queryCharData_Share(sub_key){
			var paramObj=new Object();
			var result_Data ={};
			paramObj.startMonth=$("#startDay").val();
			paramObj.stopMonth=$("#stopDay").val();
			paramObj.dim_key = sub_key;
			var parent_key = "parent_dim_1";
			paramObj[parent_key]=$("#share_text1").val();
			
			$.ajax({
				type : 'post',
				url : basePath+'/amount/getCharData_share.do',
				dataType : 'json',
				data:paramObj,
				async: false,
				success : function(result, textStatus) {
					result_Data =result;
				},
				error : function(data) {
					console.log("--------------4、方法error：queryCharData");
				}
			});

			
			return result_Data;
			
		};
		
		function  pieChartShow_share(divId,result_data){
			var piePaint = initEcharts(echarts,divId);
			  var pieOption= buildChartOptionShare();
			  pieOption.title.text="当前";//我司销量
			  pieOption.series[0].name="";//我司销量
			  pieOption.series[0].data = result_data.data;
			  pieOption.legend.data=result_data.legend_data;

			  piePaint.setOption(pieOption);
			  
			  
			// 处理点击事件并且跳转到相应的百度搜索页面
			  piePaint.on('click', function (params) {
			      if($("#share_text1").val()==params.name){
			    	//取消维度选择
			    	  $("#share_text1").val(null);
			      }else{
			    	//维度选择
			    	  $("#share_text1").val(params.name);
			      }
			      initShareLine();
			  });
			  
			  var piePaint_Year = initEcharts(echarts,divId+"_Year");
			  var pieOption_Year = buildChartOptionShare();
			  pieOption_Year.title.text="去年同期";
//			  pieOption_Year.series[0].name="我司销量";
			  pieOption_Year.series[0].data =result_data.data_year;
			  pieOption.legend.data=result_data.legend_data;
			  piePaint_Year.setOption(pieOption_Year);
			  
			//环比
			  var piePaint_Mon = initEcharts(echarts,divId+"_Mom");
			  var pieOption_Mon = buildChartOptionShare(); 
			  pieOption_Mon.title.text="上月";
//			  pieOption_Mon.series[0].name="我司销量";
			  pieOption_Mon.series[0].data =result_data.data_mom;
			  pieOption.legend.data=result_data.legend_data;
			  piePaint_Mon.setOption(pieOption_Mon);
		};
		
		function lineChartShow_share(divId,result_data){
			var paint = initEcharts(echarts,divId);
			  var option = buildStandardLine(); 
			  	option.series[0].name="当前";
			  	option.xAxis[0].data=result_data.xAxis_data;
			    option.series[0].data= result_data.data;
			   
			   paint.setOption(option);
		};
		
		//选择显示上月   或者去年同期
		function selectMomOrYear(num){
			if(num==1){//上月
				$("input[name='btn_share']")[0].style.color="#fff";
				$("input[name='btn_share']").eq(0).addClass("changeColor");
				$("input[name='btn_share']")[1].style.color="block";
				$("input[name='btn_share']").eq(1).removeClass("changeColor");
				$("div[name='share_char_Year']")[0].style.display="none";
				$("div[name='share_char_Mom']")[0].style.display="block";
			}else{
				$("input[name='btn_share']")[1].style.color="#fff";
				$("input[name='btn_share']").eq(1).addClass("changeColor");
				$("input[name='btn_share']")[0].style.color="block";
				$("input[name='btn_share']").eq(0).removeClass("changeColor");
				$("div[name='share_char_Year']")[0].style.display="block";
				$("div[name='share_char_Mom']")[0].style.display="none";
			}
		};
		
		function checkDayShare(){
			
			var startDay=$("#startDay").val();
			var stopDay=$("#stopDay").val();
			if(Number(startDay)>Number(stopDay)){
				alert("开始时间大于结束时间，请确认！");
				return;
			}
			
			var star=startDay.substr(0,4)+"/"+startDay.substr(4,2)+"/"+startDay.substr(6,2);
			var stop=stopDay.substr(0,4)+"/"+stopDay.substr(4,2)+"/"+stopDay.substr(6,2);
			var s1= new Date(star);
			var s2= new Date(stop);
			//相差的天数
			var dayNum = (s2-s1)/(1000*3600*24);
			if(dayNum>=31){
				alert("请保证时间间隔在一个月以内");
				return;
			}
		};
		
	</script>
</html>
