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

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>目标值模板</title>


<style type="text/css">
.btn-group-lg > .btn {
  padding: 5px 10px;
  font-size: 10px;
  line-height: 1.3333333;
  border-radius: 6px;
}
.table > tbody > tr > td{
 	 font-size: 18px;
 	 border-top: 1px solid #037abd;
 	 border-left: 1px solid #037abd;
 	 vertical-align: middle;
 	 first-child:none;
 	}
 	
.ww{
 	color:#fff;
 }


 	
</style>

</head>







<body style="overflow-x:hidden;min-width: 1508px;">

    <script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/bootstrap_3.3.7/bootstrap.min.js?"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/cityKpi/layer.js?"></script>
    <link href="https://cdn.bootcss.com/multiple-select/1.2.0/multiple-select.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/multiple-select/1.2.0/multiple-select.min.js"></script>
	<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
	<script	src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/cityKpi/model_internetRote.js?"></script> 
	<script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>
	<script src="<%=basePath%>resources/js/plugin/table2excel.js"></script>	
	<script src="<%=basePath%>resources/js/plugin/echart/echarts.min.js"></script>
	<script src="<%=basePath%>resources/js/plugin/jqGrid/js/jquery.jqGrid.min.js"></script>
	<script src="<%=basePath%>resources/js/plugin/jqGrid/js/i18n/grid.locale-cn.js"></script>
	<div class="row">
	<div class="col-xs-12" style="margin-left: 10px;background-color:#36648B" align="left">
	<span style="color: #33ffff;font-size: 20px;">经分监控   / 利 / 互联网利润</span>
	</div>
	</div>
	<div class="row" style="padding-top: 30px;">
    	<!-- <div class="col-xs-2" style="margin-left: 0.1%;" align="left">
			<span>指标名称：</span>
			<input type="text"  align="top" 
			id="kind1" name="kind1" style="color: blue;text-align: center;border-radius: 6px;"
			/>
		</div> -->
		<div class="col-xs-5" align="left" id="allTime">
			<span>时间类型：</span>
			<select onchange="changeMonth()" id="model_DURATION2" name="datetype" style="border-radius: 6px;text-align: center;width: 130px;color: blue;text-align-last: center;height: 24px;">
									
									<option value="1">月份</option>
									<option value="2">日期</option>
									
									</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									
								    开始时间：<input name="datevalue" id="month_1" runat="server" type="text"
	                                style="width: 20%;text-align: center; height: 30px; background-color: #00063c; border-color: #1addfa; color: white; border-radius: 16px;"
                                     readonly="readonly"
                                     onClick="WdatePicker({dateFmt:'yyyy-MM',maxDate:'%y-{%M}',onpicked:selectDate})" />
								 
								     <input name="datevalue" id="day_1" runat="server" readonly="readonly"
	                                 type="text"
	                                 style="display: none;text-align: center;width: 20%; height: 30px; background-color: #00063c; border-color: #1addfa; color: white; border-radius: 16px;"
                                     onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-{%M}',onpicked:selectDate})" />
								 
								   结束时间：<input name="datevalue" id="month_2" runat="server" type="text"
	                                style="width: 20%;text-align: center; height: 30px; background-color: #00063c; border-color: #1addfa; color: white; border-radius: 16px;"
                                     readonly="readonly"
                                     onClick="WdatePicker({dateFmt:'yyyy-MM',maxDate:'%y-{%M}',onpicked:selectDate})" />	
									
								 	<input name="datevalue" id="day_2" runat="server" readonly="readonly"
	                                 type="text"
	                                 style="display: none;text-align: center;width: 20%; height: 30px; background-color: #00063c; border-color: #1addfa; color: white; border-radius: 16px;"
                                     onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-{%M}',onpicked:selectDate})" />
		</div>

<div class="col-xs-5" align="right" style="display: none;" id="portTime">
 时间：<input name="datevalue" id="day_port" runat="server" type="text"
 style="text-align: center;width: 20%; height: 30px; background-color: #00063c; border-color: #1addfa; color: white; border-radius: 16px;"
onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-{%M}',onpicked:selectDate})" />
						
</div>








                                    
		
<div class="col-xs-3" id="allSearch">
<button class="btn btn-primary btn-lg" 
style=" padding: 1px 16px;font-size: 18px;line-height: 1.3333333;
border-radius: 6px;float:left;margin:0px 10px;" 
id="query" onclick="selelctAll()">查询
</button>
</div>

<!-- <div class="col-xs-3" style="display: none;" id="partSearch">
<button class="btn btn-primary btn-lg" 
style=" padding: 1px 16px;font-size: 18px;line-height: 1.3333333;
border-radius: 6px;float:left;margin:0px 10px;" 
id="queryPort" onclick="selelctPort()">查询
</button>
</div> -->



</div>
 
 	
 	
 	<!-- 显示总销量，总覆盖店铺等总量的显示框-->
 <div class="row" style="margin-top:50px;">
 <div class='col-xs-3' onclick="chooseDemon()"> 
		<div class="panel panel-default" style="width: 100%;"> 
			<div class='panel-body' >
	 			<!-- <p style="text-align:center;color:#33ffff"><font size="3">互联网销量(KPI完成情况)</font></p> -->
	 			<h3 class="ww">互联网销量(KPI完成情况)</h3>
	 			<!-- <p style="text-align: center;color:#33ffff"><font size="3">数据来源:SCM系统和ECSS系统</font></p> -->
	 			<h4><span style="color:#3eb8c5">数据来源:SCM系统和ECSS系统</span></h4>
	 			<!-- <p style="text-align: center;color:#33ffff"><font size="3">确认人:互联网-郭慧</font></p> -->
	 			<h4><span style="color:#3eb8c5">确认人:互联网-郭慧</span></h4>
				<h1  style='float: right;' id="zwtcyhs">&nbsp;</h1>
			</div>
		</div>
	</div>
	<div class='col-xs-3' onclick="chooseDemon()"> 
		<div class='panel panel-default' style="width: 100%;"> 
			<div class='panel-body' >
	 			<h3 class="ww">互联网销量KPI考核指标 </h3>
	 			<h4><span style="color:#3eb8c5">数据来源:SCM系统和ECSS系统</span></h4>
	 			<h4><span style="color:#3eb8c5">确认人:互联网-郭慧</span></h4>
				<h1  style='float: right;' id="zsrz">&nbsp;</h1>
				
			</div>
		</div>
	</div>
	<div class='col-xs-3' onclick="chooseDemon()"> 
		<div class='panel panel-default' style='width: 100%;'> 
			<div class='panel-body' >
			<h3 class="ww">互联网销量KPI完成进度 </h3>
	 			<h4><span style="color:#3eb8c5">数据来源:SCM系统和ECSS系统</span></h4>
	 			<h4><span style="color:#3eb8c5">确认人:互联网-郭慧</span></h4>
				<h1  style='float: right;' id="zfgz">&nbsp;</h1>
	 			
			</div>
		</div>
	</div>
	
	<!-- <div class='col-xs-3' onclick="chooseDim()"> 
		<div class='panel panel-default' style='width: 100%;'> 
			<div class='panel-body' >
			<h3 class="ww">互联网库存周转报表 </h3>
	 			<h4><span style="color:#3eb8c5">数据来源:SCM系统</span></h4>
	 			<h4><span style="color:#3eb8c5">确认人:互联网-郭慧</span></h4>
				<h1  style='float: right;' id="yyz">&nbsp;</h1>
	 			
			</div>
		</div>
	</div> -->
	
	
 </div>
 
 <!--扇形图互联网kpi品牌  -->
 
 	<div class="row"  style="width: 100%;height: 650px;" id="dim_div">
	<div class="col-xs-2" align="left">
	        <label id="kpi_one_title" > </label>
			<!-- <label>&nbsp;&nbsp;&nbsp;维度1:</label> -->
			<select id ="recordSet" class="select_square" onchange="textBigPicture()">
				
			</select>
	</div>
	
	
	
	<div class="col-xs-12"  align="center" style="height:100%;width: 100%;">
	 	  <div class="panel panel-default" style="height:100%;width: 100%;">
				  <div class="panel-body" style="height:600px;width: 100%;">
				    <div id ="char_row" style="height:100%;width: 100%;">
				    
				    <div class="col-xs-6" style="height:100%;">
				    <div id="pie_char" style="height: 100%; width: 100%; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;" >

				    </div>
				    
				    </div>
			<!--全年同期  -->	    
				<div class="col-xs-6" style="height:100%;">
				<div class="tabbable" id="tabs-412104" style=" padding-top:-10px;">
				<ul class='nav nav-tabs' style='padding-left:40%'>
				<li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #333e5e;" onclick="getRoundDate('1')" data-toggle='tab'>去年同期</button>
				</li>                                                                                                    
				<li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #168deb;" onclick="getRoundDate('2')" data-toggle='tab'>上月同期</button>
				</li>
				</ul>
				<div class='tab-content' style='height:550px;width: 770px;'>
				<div class='tab-pane' id='panel-346414' style='height:560px;width: 770px;'>
				<div  id='pie_char_Year' style='height:560px;width: 770px;'>
				</div>
				</div>
				<div class='tab-pane active' id='panel-905934'style='height:560px;width: 770px;'>
				<div  id='pie_char_Mom' style='height:560px;width: 770px;'>
				</div>
				</div>
				</div>				
				</div>				
				</div>
				    </div>				     				  
				  </div>
		  </div>
	</div>
</div>
 
 
 <!--柱形图  -->
 
 <div id="sub_dim" style="width: 100%;height: 500px;display:block;">
  <div class="row" id="dim_row_2" style="width: 100%;height: 100%;">
  <div class="col-xs" align="left" >
  <label id="kpi_title2">互联网销量(KPI完成情况)-大类-品牌</label>
  <select class="select_square" id="selectBrand" onchange="getOneBrand()"></select>
  <!-- <input type="text" id="nameport" style="color:blue;"/> -->
  </div>
  <div class="col-xs-12"  align="center" style="height:100%;width: 100%;">
	 	  <div class="panel panel-default" style="height:100%;width: 100%;">
				  <div class="panel-body" style="height:100%;width: 100%;">
				   <ul class='nav nav-tabs' style='padding-left:40%'>
                <li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #333e5e;" onclick="getFontDate('1')" data-toggle='tab'>当前数据</button>
				</li>   
				<li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #245580;" onclick="getFontDate('2')" data-toggle='tab'>上月数据</button>
				</li>                                                                                                    
				<li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #168deb;" onclick="getFontDate('3')" data-toggle='tab'>去年同期</button>
				</li>
				</ul>
                <div id ="sub_char_row2" style="height:100%;width: 100%;">
                <!--中间点击事件  -->
               
                <div id="bar_char2" style="height: 100%; width: 100%; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;">
                
                
                <div style="position: relative; overflow: hidden; width: 1802px; height: 468px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">     
                </div>
                <div style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 14px / 21px "Microsoft YaHei"; padding: 5px; left: 449px; top: 328px;"></div>
                 <span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#00FFCC;"></span><span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#00FFCC;"></span>        
                 </div>
                 </div>
                 </div>
                 </div>
                 </div>
                 </div>           
                 </div>  

   <!-- 大类 机型 -->                   
    
  <div id="sub_dim3" style="width: 100%;height: 500px;display:block;">
  <div class="row" id="dim_row_3" style="width: 100%;height: 100%;">
  <div class="col-xs" align="left" >
  <label id="kpi_title2">互联网销量(KPI完成情况)-大类-机型</label>
  <select class="select_square" id="selectSpec" onchange="getOneSpec()"></select>
 <!--  <input type="text" id="portname3" style="color:blue;"/> -->
  </div>
  <div class="col-xs-12"  align="center" style="height:100%;width: 100%;">
	 	  <div class="panel panel-default" style="height:100%;width: 100%;">
				  <div class="panel-body" style="height:100%;width: 100%;">
                   <ul class='nav nav-tabs' style='padding-left:40%'>
                <li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #333e5e;" onclick="getFontSpec('1')" data-toggle='tab'>当前数据</button>
				</li>   
				<li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #245580;" onclick="getFontSpec('2')" data-toggle='tab'>上月数据</button>
				</li>                                                                                                    
				<li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #168deb;" onclick="getFontSpec('3')" data-toggle='tab'>去年同期</button>
				</li>
				</ul>
                  <div id ="sub_char_row3" style="height:100%;width: 100%;">
                <div id="bar_char3" style="height: 100%; width: 100%; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;">
                <div style="position: relative; overflow: hidden; width: 1802px; height: 468px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">     
                </div>
                <div style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 14px / 21px "Microsoft YaHei"; padding: 5px; left: 449px; top: 328px;"></div>
                 <span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#00FFCC;"></span><span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#00FFCC;"></span>        
                 </div>
                 </div>
                 </div>
                 </div>
                 </div>
                 </div>           
                 </div> 
  
 
 <!-- 大类  配置 -->	
 	
 	<div id="sub_dim4" style="width: 100%;height: 500px;display:block;">
  <div class="row" id="dim_row_4" style="width: 100%;height: 100%;">
  <div class="col-xs" align="left" >
  <label id="kpi_title2">互联网销量(KPI完成情况)-大类-配置</label>
  <select class="select_square" id="selectPZ" onchange="selectAllPZ()"></select>
  <!-- <input type="text" id="portname4" style="color:blue;"/> -->
  </div>
  <div class="col-xs-12"  align="center" style="height:100%;width: 100%;">
	 	  <div class="panel panel-default" style="height:100%;width: 100%;">
				  <div class="panel-body" style="height:100%;width: 100%;">
				   <ul class='nav nav-tabs' style='padding-left:40%'>
                <li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #333e5e;" onclick="getFontPZ('1')" data-toggle='tab'>当前数据</button>
				</li>   
				<li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #245580;" onclick="getFontPZ('2')" data-toggle='tab'>上月数据</button>
				</li>                                                                                                    
				<li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #168deb;" onclick="getFontPZ('3')" data-toggle='tab'>去年同期</button>
				</li>
				</ul>
                  <div id ="sub_char_row4" style="height:100%;width: 100%;">
                <div id="bar_char4" style="height: 100%; width: 100%; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;">
                <div style="position: relative; overflow: hidden; width: 1802px; height: 468px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">     
                </div>
                <div style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 14px / 21px "Microsoft YaHei"; padding: 5px; left: 449px; top: 328px;"></div>
                 <span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#00FFCC;"></span><span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#00FFCC;"></span>        
                 </div>
                 </div>
                 </div>
                 </div>
                 </div>
                 </div>           
                 </div> 
 	
 <!--大类 颜色  -->	
 	<div id="sub_dim5" style="width: 100%;height: 500px;display:block;">
  <div class="row" id="dim_row_5" style="width: 100%;height: 100%;">
  <div class="col-xs" align="left" >
  <label id="kpi_title5">互联网销量(KPI完成情况)-大类-颜色</label>
  <select class="select_square" id="selectColor" onchange="selectOnColor()"></select>
  <!-- <input type="text" id="portname5" style="color:blue;"/> -->
  </div>
  <div class="col-xs-12"  align="center" style="height:100%;width: 100%;">
	 	  <div class="panel panel-default" style="height:100%;width: 100%;">
				  <div class="panel-body" style="height:100%;width: 100%;">
				<ul class='nav nav-tabs' style='padding-left:40%'>
                <li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #333e5e;" onclick="getFontColor('1')" data-toggle='tab'>当前数据</button>
				</li>   
				<li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #245580;" onclick="getFontColor('2')" data-toggle='tab'>上月数据</button>
				</li>                                                                                                    
				<li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #168deb;" onclick="getFontColor('3')" data-toggle='tab'>去年同期</button>
				</li>
				</ul>
                  <div id ="sub_char_row5" style="height:100%;width: 100%;">
                <div id="bar_char5" style="height: 100%; width: 100%; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;">
                <div style="position: relative; overflow: hidden; width: 1802px; height: 468px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">     
                </div>
                <div style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 14px / 21px "Microsoft YaHei"; padding: 5px; left: 449px; top: 328px;"></div>
                 <span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#00FFCC;"></span><span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#00FFCC;"></span>        
                 </div>
                 </div>
                 </div>
                 </div>
                 </div>
                 </div>           
                 </div> 
 	
 <!--大类渠道  -->
 <div id="sub_dim6" style="width: 100%;height: 500px;display:block;">
  <div class="row" id="dim_row_6" style="width: 100%;height: 100%;">
  <div class="col-xs" align="left" >
  <label id="kpi_title6">互联网销量(KPI完成情况)-大类-渠道</label>
  <select style="display: none;" class="select_square" id="selectQD" onchange="selectOnQD()"></select> 
  <!-- <input type="text" id="portname6" style="color:blue;"/> -->
  </div>
  <div class="col-xs-12"  align="center" style="height:100%;width: 100%;">
	 	  <div class="panel panel-default" style="height:100%;width: 100%;">
				  <div class="panel-body" style="height:100%;width: 100%;">
				  <ul class='nav nav-tabs' style='padding-left:40%'>
                <li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #333e5e;" onclick="getFontQD('1')" data-toggle='tab'>当前数据</button>
				</li>   
				<li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #245580;" onclick="getFontQD('2')" data-toggle='tab'>上月数据</button>
				</li>                                                                                                    
				<li>
				<button style="margin-right: 2px;line-height: 30px;border: 1px solid transparent;border-radius: 0px 0px 0 0;color: #ffffff; background-color: #168deb;" onclick="getFontQD('3')" data-toggle='tab'>去年同期</button>
				</li>
				</ul>
                  <div id ="sub_char_row6" style="height:100%;width: 100%;">
                <div id="bar_char6" style="height: 100%; width: 100%; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;">
                <div style="position: relative; overflow: hidden; width: 1802px; height: 468px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">     
                </div>
                <div style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 14px / 21px "Microsoft YaHei"; padding: 5px; left: 449px; top: 328px;"></div>
                 <span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#00FFCC;"></span><span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#00FFCC;"></span>        
                 </div>
                 </div>
                 </div>
                 </div>
                 </div>
                 </div>           
                 </div> 
 
 <!--库存周转表格  -->
  <div id="sub_dim8" style="width: 100%;height: 500px;display: none;">
 <div class="row" style="width: 100%;height: 100%;">
  <label id="kpi_title6">互联网库存周转表</label>
    <div style="height:100%;width: 100%;">
	<div class="col-xs-12" style="height:100%;width: 100%;">
		<table id="list" class="table table-bordered" ></table>
		<div id=pager></div>
</div>
</div>
</div>
</div>  
 
 
 
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
<script type="text/javascript">
//**********************************数据导出功能的实现 ********************************************************************* 
//月份时间开始
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

 //发送请求的方法
 
 function sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text){

		$.ajax({
			url : url,
			type : "post",
			async : false,
			cache : false,
			dataType : "json",
			data :data,
			success : function(data) {
			 var loadReapt=echarts.init(document.getElementById(id));
			 //document.getElementById("sub_dim").style.display="";//显示
			 document.getElementById(div1).style.display="none";//隐藏
			 document.getElementById(div2).style.display="none";//隐藏
			 document.getElementById(div3).style.display="none";//隐藏
			 document.getElementById(div4).style.display="none";//隐藏

				if (!isEmptyObject(data)) {
				//var	text = text;
             document.getElementById(div4).style.display="";//隐藏
				   getPaint11(id, text,data);
				  
				   $(id2).empty();
				   
				   
				   for (var i = 0; i < data.nowList.length; i++) {
						$(id2).append(
								"<option value='"+data.nowList[i]+"'>"
										+ data.nowList[i] + "</option>");	
					}
				}else{
					
					alert("当前日期无数据展示。");
					
					 document.getElementById(div4).style.display="";//隐藏
					
				}
			     
              
			}
		});	

 
	 
 }
 
 
 
//圆形select框改变事件

function textBigPicture(){
var obj="";		
var type=$("#recordSet").val();
//document.getElementById("nameport").value =type;
document.getElementById("sub_dim").style.display="";//显示	
var pp=	$("#model_DURATION2").val();
var url="../InternetRote/takeBrand.do";
var id="sub_char_row2";
var div1="sub_dim3";
var div2="sub_dim4";
var div3="sub_dim5";
var div4="sub_dim";
var text="互联网销量(KPI完成情况)-大类-品牌";
var id2="#selectBrand";
document.getElementById("sub_dim6").style.display="none";//显示	
if(pp == "1"){
	var month1=$("#month_1").val();
	var month2= $("#month_2").val();		
    var start=rondStart(month1);	
    var end=rondEnd(month2);	
    var data={'start' : start,'end' : end,'type':type,'pp':pp};
    sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);

}if (pp == "2") {
	//日期;

	var start =$("#day_1").val();
	
	var end = $("#day_2").val();
	 var data={'start' : start,'end' : end,'type':type,'pp':pp};
	 sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);

}	
	
	
	
	
	
	
}
 
 
 
 
 
 
 
 
 
 
 

//圆形图点击获取名称事件

var dom=echarts.init(document.getElementById("pie_char"));


dom.on("click",function(params){
	var type = params.name;   //大类名称
	 document.getElementById("recordSet").value =type;
	 document.getElementById("sub_dim").style.display="";//显示
		var obj="";		
		var pp=	$("#model_DURATION2").val();
        var url="../InternetRote/takeBrand.do";
	    var id="sub_char_row2";
	    var div1="sub_dim3";
	    var div2="sub_dim4";
	    var div3="sub_dim5";
	    var div4="sub_dim";
	    var text="互联网销量(KPI完成情况)-大类-品牌";
	    var id2="#selectBrand";
	    document.getElementById("sub_dim6").style.display="none";//显示
	    if(pp == "1"){
	    	var month1=$("#month_1").val();
			var month2= $("#month_2").val();		
		    var start=rondStart(month1);	
		    var end=rondEnd(month2);	
		    var data={'start' : start,'end' : end,'type':type,'pp':pp};
		    sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);

	    }if (pp == "2") {
			//日期;

			var start =$("#day_1").val();
			
			var end = $("#day_2").val();
			 var data={'start' : start,'end' : end,'type':type,'pp':pp};
			 sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);

	    }

		
	})


 
function selectDate() {
	//jqgridReload();
}
 
/* 时间控件调取。。。。。。。。  */
function changeMonth(){
	
var pp=	$("#model_DURATION2").val();
	if (pp == "1") {
		//月份;

		$("#month_1").show();
		$("#month_2").show();
		$("#day_1").hide();
		$("#day_2").hide();
	}	
	
	if (pp == "2") {
		//月份;

		$("#day_1").show();
		$("#day_2").show();
		$("#month_1").hide();
		$("#month_2").hide();
	}		
	
}

//长方形品牌 select事件
function getOneBrand(){
	
	var type=$("#recordSet").val();
	document.getElementById("sub_dim3").style.display="";//显示
	var brand = $("#selectBrand").val();   //大类名称 	selectBrand
	 //document.getElementById("portname3").value =brand;		

		var obj="";		
		var pp=	$("#model_DURATION2").val();
        var url="../InternetRote/takeSpec.do";
	    var id="sub_char_row3";
	    var div1="sub_dim6";
	    var div2="sub_dim4";
	    var div3="sub_dim5";
	    var div4="sub_dim3";
	    var text="互联网销量(KPI完成情况)-大类-型号";
	    var id2="#selectSpec";
	    
	    if(pp == "1"){
	    	var month1=$("#month_1").val();
			var month2= $("#month_2").val();		
		    var start=rondStart(month1);	
		    var end=rondEnd(month2);	
		    var data={'start' : start,'end' : end,'type':type,'brand':brand,'pp':pp};
		    sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
	    }if (pp == "2") {
			//日期;

			var start =$("#day_1").val();
			
			var end = $("#day_2").val();
			 var data={'start' : start,'end' : end,'type':type,'brand':brand,'pp':pp};
			 sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text); 
	    }	

}



function getOneSpec(){
	
    var type=$("#recordSet").val();
	
	document.getElementById("sub_dim4").style.display="";//显示
	var brand = $("#selectBrand").val();   //大类名称 	
	
	var spec=$("#selectSpec").val();
	//document.getElementById("portname3").value =brand;		

		var obj="";		
		var pp=	$("#model_DURATION2").val();
        var url="../InternetRote/takePZ.do";
	    var id="sub_char_row4";
	    var div1="sub_dim5";
	    var div2="sub_dim5";
	    var div3="sub_dim6";
	    var div4="sub_dim4";
	    var text="互联网销量(KPI完成情况)-大类-型号";
	    var id2="#selectPZ";
	    
	    if(pp == "1"){
	    	var month1=$("#month_1").val();
			var month2= $("#month_2").val();		
		    var start=rondStart(month1);	
		    var end=rondEnd(month2);	
		    var data={'start' : start,'end' : end,'type':type,'brand':brand,'spec':spec,'pp':pp};
		    sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
	    }if (pp == "2") {
			//日期;

			var start =$("#day_1").val();
			
			var end = $("#day_2").val();
			 var data={'start' : start,'end' : end,'type':type,'brand':brand,'spec':spec,'pp':pp};
			 sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
	    }	
	
	
	
	
	
}







/*长方形 型号 点击图形显示   */
//初始化长方形品牌数据

//var timeKind=obj;
var dom1=echarts.init(document.getElementById("sub_char_row2"));

dom1.on("click",function(params){
	
	var type=$("#recordSet").val();
	
	document.getElementById("sub_dim3").style.display="";//显示
	var brand = params.name;   //大类名称 	
	 document.getElementById("selectBrand").value =brand;		

		var obj="";		
		var pp=	$("#model_DURATION2").val();
        var url="../InternetRote/takeSpec.do";
	    var id="sub_char_row3";
	    var div1="sub_dim4";
	    var div2="sub_dim6";
	    var div3="sub_dim5";
	    var div4="sub_dim3";
	    var text="互联网销量(KPI完成情况)-大类-型号";
	    var id2="#selectSpec";
	    
	    if(pp == "1"){
	    	var month1=$("#month_1").val();
			var month2= $("#month_2").val();		
		    var start=rondStart(month1);	
		    var end=rondEnd(month2);	
		    var data={'start' : start,'end' : end,'type':type,'brand':brand,'pp':pp};
		    sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
	    }if (pp == "2") {
			//日期;

			var start =$("#day_1").val();
			
			var end = $("#day_2").val();
			 var data={'start' : start,'end' : end,'type':type,'brand':brand,'pp':pp};
			 sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
	    }

}) 

//机型 去年同期当月点击事件
function getFontSpec(obj){
	var timeKind=obj;
	var type=$("#recordSet").val();
	var brand=$("#selectBrand").val();
	var timeKind=obj;		
	var pp=	$("#model_DURATION2").val();
 
    if (pp == "1") {
		//月份;
		    var month1=$("#month_1").val();
			var month2= $("#month_2").val();		
		    var start=rondStart(month1);	
		    var end=rondEnd(month2);	
		
	$.ajax({
		url : "../InternetRote/takeSpec.do",
		type : "post",
		async : false,
		cache : false,
		dataType : "json",
		data : {
			'start' : start,
			'end' : end,
			'brand':brand,
			'type':type,
			'timeKind':timeKind,
			'pp':pp
		},
		success : function(data) {
		 var loadReapt=echarts.init(document.getElementById("sub_char_row3"));		
		 document.getElementById("sub_dim4").style.display="none";//隐藏
		 document.getElementById("sub_dim5").style.display="none";//隐藏
		 document.getElementById("sub_dim6").style.display="none";//隐藏

			if (!isEmptyObject(data)) {
			var	text = '互联网销量(KPI完成情况)-大类-型号' ;
			
			//var	title =['配件','手机','智能硬件','功能机']; 
		
			   getPaint11(
						"sub_char_row3", text,data);
				/*getPaint9(
						"pie_char_Mom", text1, title, data.dateList1);*/

			}else{
				
				
				alert("当前日期无数据展示。");
				}

		}
	});	

	}	if (pp == "2") {
		//日期;

		var start =$("#day_1").val();
		
		var end = $("#day_2").val();
			$.ajax({
				url : "../InternetRote/takeSpec.do",
				type : "post",
				async : false,
				cache : false,
				dataType : "json",
				data : {
					'start' : start,
					'end' : end,
					'brand':brand,
					'type':type,
					'timeKind':timeKind,
					'pp':pp
				},
				success : function(data) {
				 var loadReapt=echarts.init(document.getElementById("sub_char_row3"));
				
				 document.getElementById("sub_dim4").style.display="none";//隐藏
				 document.getElementById("sub_dim5").style.display="none";//隐藏
				 document.getElementById("sub_dim6").style.display="none";//隐藏

					if (!isEmptyObject(data)) {
					var	text = '互联网销量(KPI完成情况)-大类-型号' ;
					
					//var	title =['配件','手机','智能硬件','功能机']; 
				
					   getPaint11(
								"sub_char_row3", text,data);
						/*getPaint9(
								"pie_char_Mom", text1, title, data.dateList1);*/

					}else{
						
						
						alert("当前日期无数据展示。");
						}

				}
			});
			
			
			
			
			
			
			
			
		}
	
	
	
}
/* 对配置Select事件进行取数  */
function selectAllPZ(){
	
	var type=$("#recordSet").val();
	var brand=$("#selectBrand").val();
	var spec=$("#selectSpec").val();
	document.getElementById("sub_dim5").style.display="";//显示
	var memory=$("#selectPZ").val();
	//var spec = params.name;   //大类名称 	
	 //document.getElementById("portname4").value =spec;		
      
		var obj="";		
		var pp=	$("#model_DURATION2").val();
        var url="../InternetRote/takeColor.do";
	    var id="sub_char_row5";
	    var div1="sub_dim6";
	    var div2="sub_dim6";
	    var div3="sub_dim6";
	    var div4="sub_dim5";
	    var text="互联网销量(KPI完成情况)-大类-颜色";
	    var id2="#selectColor";
	    if(pp == "1"){
	    	var month1=$("#month_1").val();
			var month2= $("#month_2").val();		
		    var start=rondStart(month1);	
		    var end=rondEnd(month2);	
		    var data={'start' : start,'end' : end,'type':type,'brand':brand,'spec':spec,'memory':memory,'pp':pp};
		    sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
	    }if (pp == "2") {
			//日期;

			var start =$("#day_1").val();
			
			var end = $("#day_2").val();
			 var data={'start' : start,'end' : end,'type':type,'brand':brand,'spec':spec,'memory':memory,'pp':pp};
			 sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
	    }	
	
	
	
	
	
	
}



/* 对配置进行取数  */
var dom2=echarts.init(document.getElementById("sub_char_row3"));

dom2.on("click",function(params){
	
	var type=$("#recordSet").val();
	var brand=$("#selectBrand").val();
	//var brand=$("#selectSpec").val();
	
	document.getElementById("sub_dim4").style.display="";//显示
	var spec = params.name;   //大类名称 	
	 document.getElementById("selectSpec").value =spec;		
      
		var obj="";		
		var pp=	$("#model_DURATION2").val();
        var url="../InternetRote/takePZ.do";
	    var id="sub_char_row4";
	    var div1="sub_dim5";
	    var div2="sub_dim5";
	    var div3="sub_dim6";
	    var div4="sub_dim4";//必须隐藏-值如果为空
	    var text="互联网销量(KPI完成情况)-大类-配置";
	    var id2="#selectPZ";
	    if(pp == "1"){
	    	var month1=$("#month_1").val();
			var month2= $("#month_2").val();		
		    var start=rondStart(month1);	
		    var end=rondEnd(month2);	
		    var data={'start' : start,'end' : end,'type':type,'brand':brand,'spec':spec,'pp':pp};
		    sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
	    }if (pp == "2") {
			//日期;

			var start =$("#day_1").val();
			
			var end = $("#day_2").val();
			 var data={'start' : start,'end' : end,'type':type,'brand':brand,'spec':spec,'pp':pp};
			 sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
	    }

}) 

//配置  去年同期当月点击事件
function getFontPZ(obj){
	var type=$("#recordSet").val();
	var brand=$("#selectBrand").val();
	var spec=$("#selectSpec").val();
	var timeKind=obj;		
	var pp=	$("#model_DURATION2").val();
  
    if (pp == "1") {
		//月份;
		    var month1=$("#month_1").val();
			var month2= $("#month_2").val();		
		    var start=rondStart(month1);	
		    var end=rondEnd(month2);	
		
	$.ajax({
		url : "../InternetRote/takePZ.do",
		type : "post",
		async : false,
		cache : false,
		dataType : "json",
		data : {
			'start' : start,
			'end' : end,
			'brand':brand,
			'spec':spec,
			'type':type,
			'timeKind':timeKind,
			'pp':pp
		},
		success : function(data) {
		 var loadReapt=echarts.init(document.getElementById("sub_char_row4"));		
		
		 document.getElementById("sub_dim5").style.display="none";//隐藏
		 document.getElementById("sub_dim6").style.display="none";//隐藏

			if (!isEmptyObject(data)) {
			var	text = '互联网销量(KPI完成情况)-大类-配置' ;
			
			//var	title =['配件','手机','智能硬件','功能机']; 
		
			   getPaint11(
						"sub_char_row4", text,data);
				/*getPaint9(
						"pie_char_Mom", text1, title, data.dateList1);*/

			}else{
				
				
				alert("当前日期无数据展示。");
				}

		}
	});	

	}	if (pp == "2") {
		//日期;

		var start =$("#day_1").val();
		
		var end = $("#day_2").val();
			$.ajax({
				url : "../InternetRote/takePZ.do",
				type : "post",
				async : false,
				cache : false,
				dataType : "json",
				data : {
					'start' : start,
					'end' : end,
					'brand':brand,
					'spec':spec,
					'type':type,
					'timeKind':timeKind,
					'pp':pp
				},
				success : function(data) {
				 var loadReapt=echarts.init(document.getElementById("sub_char_row4"));
				
				 
				 document.getElementById("sub_dim5").style.display="none";//隐藏
				 document.getElementById("sub_dim6").style.display="none";//隐藏

					if (!isEmptyObject(data)) {
					var	text = '互联网销量(KPI完成情况)-大类-配置' ;
					
					//var	title =['配件','手机','智能硬件','功能机']; 
				
					   getPaint11(
								"sub_char_row4", text,data);
						/*getPaint9(
								"pie_char_Mom", text1, title, data.dateList1);*/

					}else{
						
						
						alert("当前日期无数据展示。");
					}

				}
			});
			
			
			
			
			
			
			
			
		}
	
	
	
}
/* 对颜色select进行取数  */
function selectOnColor(){
	var type=$("#recordSet").val();
	var brand=$("#selectBrand").val();
	var spec=$("#selectSpec").val();
	var memory=$("#selectPZ").val();
	var id2="#selectQD";
	document.getElementById("sub_dim5").style.display="";//显示
	var obj="";		
	var pp=	$("#model_DURATION2").val();
    var url="../InternetRote/takeColor.do";
    var id="sub_char_row5";
    var div1="sub_dim6";
    var div2="sub_dim6";
    var div3="sub_dim6";
    var div4="sub_dim5";
    var text="互联网销量(KPI完成情况)-大类-颜色";
    if(pp == "1"){
    	var month1=$("#month_1").val();
		var month2= $("#month_2").val();		
	    var start=rondStart(month1);	
	    var end=rondEnd(month2);	
	    var data={'start' : start,'end' : end,'type':type,'brand':brand,'spec':spec,'memory':memory,'pp':pp};
	    sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
    }if (pp == "2") {
		//日期;

		var start =$("#day_1").val();
		
		var end = $("#day_2").val();
		 var data={'start' : start,'end' : end,'type':type,'brand':brand,'spec':spec,'memory':memory,'pp':pp};
		 sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
    }
	
}




/* 对颜色进行取数  */
var dom3=echarts.init(document.getElementById("sub_char_row4"));

dom3.on("click",function(params){
	
	var type=$("#recordSet").val();
	var brand=$("#selectBrand").val();
	var spec=$("#selectSpec").val();
	//var memory=$("#portname5").val();
	document.getElementById("sub_dim5").style.display="";//显示
	var memory = params.name;   //大类名称 	
	 document.getElementById("selectPZ").value =memory;		

		var obj="";		
		var pp=	$("#model_DURATION2").val();
        var url="../InternetRote/takeColor.do";
	    var id="sub_char_row5";
	    var div1="sub_dim6";
	    var div2="sub_dim6";
	    var div3="sub_dim6";
	    var div4="sub_dim5";
	    var text="互联网销量(KPI完成情况)-大类-颜色";
	    var id2="#selectColor";
	    if(pp == "1"){
	    	var month1=$("#month_1").val();
			var month2= $("#month_2").val();		
		    var start=rondStart(month1);	
		    var end=rondEnd(month2);	
		    var data={'start' : start,'end' : end,'type':type,'brand':brand,'spec':spec,'memory':memory,'pp':pp};
		    sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
	    }if (pp == "2") {
			//日期;

			var start =$("#day_1").val();
			
			var end = $("#day_2").val();
			 var data={'start' : start,'end' : end,'type':type,'brand':brand,'spec':spec,'memory':memory,'pp':pp};
			 sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
	    }

}) 

//颜色  去年同期当月点击事件
function getFontColor(obj){
	var type=$("#recordSet").val();
	var brand=$("#selectBrand").val();
	var spec=$("#selectSpec").val();
	var memory=$("#selectPZ").val();
	var timeKind=obj;		
	var pp=	$("#model_DURATION2").val();
  
    if (pp == "1") {
		//月份;
		    var month1=$("#month_1").val();
			var month2= $("#month_2").val();		
		    var start=rondStart(month1);	
		    var end=rondEnd(month2);	
		
	$.ajax({
		url : "../InternetRote/takeColor.do",
		type : "post",
		async : false,
		cache : false,
		dataType : "json",
		data : {
			'start' : start,
			'end' : end,
			'brand':brand,
			'spec':spec,
			'memory':memory,
			'type':type,
			'timeKind':timeKind,
			'pp':pp
		},
		success : function(data) {
		 var loadReapt=echarts.init(document.getElementById("sub_char_row5"));		
		
		 
		 document.getElementById("sub_dim6").style.display="none";//隐藏

			if (!isEmptyObject(data)) {
			var	text = '互联网销量(KPI完成情况)-大类-颜色' ;
			
			//var	title =['配件','手机','智能硬件','功能机']; 
		
			   getPaint11(
						"sub_char_row5", text,data);
				/*getPaint9(
						"pie_char_Mom", text1, title, data.dateList1);*/

			}else{
				
				
				alert("当前日期无数据展示。");
				}

		}
	});	

	}	if (pp == "2") {
		//日期;

		var start =$("#day_1").val();
		
		var end = $("#day_2").val();
			$.ajax({
				url : "../InternetRote/takeColor.do",
				type : "post",
				async : false,
				cache : false,
				dataType : "json",
				data : {
					'start' : start,
					'end' : end,
					'brand':brand,
					'spec':spec,
					'memory':memory,
					'type':type,
					'timeKind':timeKind,
					'pp':pp
				},
				success : function(data) {
				 var loadReapt=echarts.init(document.getElementById("sub_char_row5"));
				
				 
				
				 document.getElementById("sub_dim6").style.display="none";//隐藏

					if (!isEmptyObject(data)) {
					var	text = '互联网销量(KPI完成情况)-大类-配置' ;
					
					//var	title =['配件','手机','智能硬件','功能机']; 
				
					   getPaint11(
								"sub_char_row5", text,data);
						/*getPaint9(
								"pie_char_Mom", text1, title, data.dateList1);*/

					}else{
						
						
						alert("当前日期无数据展示。");
					}

				}
			});
			
			
			
			
			
			
			
			
		}
	
	
	
} 
/* 对渠道select进行取数  */

function selectOnColor(){
	
	var type=$("#recordSet").val();
	var brand=$("#selectBrand").val();
	var spec=$("#selectSpec").val();
	var memory=$("#selectPZ").val();
	document.getElementById("sub_dim6").style.display="";//显示
	var color=$("#selectColor").val();
	 //document.getElementById("portname6").value =color;	 
		var obj="";		
		var pp=	$("#model_DURATION2").val();
        var url="../InternetRote/takeQD.do";
	    var id="sub_char_row6";
	    var div1="sub_dim8";
	    var div2="sub_dim8";
	    var div3="sub_dim8";
	    var div4="sub_dim6";
	    var text="互联网销量(KPI完成情况)-大类-渠道";
	    var id2="#selectQD";
	    if(pp == "1"){
	    	var month1=$("#month_1").val();
			var month2= $("#month_2").val();		
		    var start=rondStart(month1);	
		    var end=rondEnd(month2);	
		    var data={'start' : start,'end' : end,'type':type,'brand':brand,'spec':spec,'memory':memory,'color':color,'pp':pp};
		    sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
	    }if (pp == "2") {
			//日期;

			var start =$("#day_1").val();
			
			var end = $("#day_2").val();
			 var data={'start' : start,'end' : end,'type':type,'brand':brand,'spec':spec,'memory':memory,'color':color,'pp':pp};
			 sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
	    }	
	
	
	
	
	
	
	
}



/* 对渠道进行取数  */
 var dom3=echarts.init(document.getElementById("sub_char_row5"));

dom3.on("click",function(params){
	
	var type=$("#recordSet").val();
	var brand=$("#selectBrand").val();
	var spec=$("#selectSpec").val();
	var memory=$("#selectPZ").val();
	//var color=$("#portname6").val();	
	document.getElementById("sub_dim6").style.display="";//显示
    var color = params.name;   //大类名称 	
	 document.getElementById("selectColor").value =color;	 
		var obj="";		
		var pp=	$("#model_DURATION2").val();
        var url="../InternetRote/takeQD.do";
	    var id="sub_char_row6";
	    var div1="sub_dim8";
	    var div2="sub_dim8";
	    var div3="sub_dim8";
	    var div4="sub_dim6";
	    var text="互联网销量(KPI完成情况)-大类-渠道";
	    var id2="#selectQD";
	    if(pp == "1"){
	    	var month1=$("#month_1").val();
			var month2= $("#month_2").val();		
		    var start=rondStart(month1);	
		    var end=rondEnd(month2);	
		    var data={'start' : start,'end' : end,'type':type,'brand':brand,'spec':spec,'memory':memory,'color':color,'pp':pp};
		    sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
	    }if (pp == "2") {
			//日期;

			var start =$("#day_1").val();
			
			var end = $("#day_2").val();
			 var data={'start' : start,'end' : end,'type':type,'brand':brand,'spec':spec,'memory':memory,'color':color,'pp':pp};
			 sentSendAllHttp(obj,pp,url,data,id,id2,div1,div2,div3,div4,text);
	    }

}) 

//渠道  去年同期当月点击事件
function getFontQD(obj){
	var type=$("#recordSet").val();
	var brand=$("#selectBrand").val();
	var spec=$("#selectSpec").val();
	var memory=$("#selectPZ").val();
	var color=$("#selectColor").val();
	var timeKind=obj;		
	var pp=	$("#model_DURATION2").val();
    var url="../InternetRote/takeQD.do";
    var id="sub_char_row6";
    var div1="sub_dim8";
    var div2="sub_dim8";
    var div3="sub_dim8";
    var div4="sub_dim6";
    var text="互联网销量(KPI完成情况)-大类-渠道";
    if (pp == "1") {
		//月份;
		    var month1=$("#month_1").val();
			var month2= $("#month_2").val();		
		    var start=rondStart(month1);	
		    var end=rondEnd(month2);	
		
	$.ajax({
		url : "../InternetRote/takeQD.do",
		type : "post",
		async : false,
		cache : false,
		dataType : "json",
		data : {
			'start' : start,
			'end' : end,
			'brand':brand,
			'spec':spec,
			'memory':memory,
			'color':color,
			'type':type,
			'timeKind':timeKind,
			'pp':pp
		},
		success : function(data) {
		 var loadReapt=echarts.init(document.getElementById("sub_char_row6"));		
	

			if (!isEmptyObject(data)) {
			var	text = '互联网销量(KPI完成情况)-大类-渠道' ;
			
			//var	title =['配件','手机','智能硬件','功能机']; 
		
			   getPaint11(
						"sub_char_row6", text,data);
				/*getPaint9(
						"pie_char_Mom", text1, title, data.dateList1);*/

			}else{
				
				
				alert("当前日期无数据展示。");
				}

		}
	});	

	}	if (pp == "2") {
		//日期;

		var start =$("#day_1").val();
		
		var end = $("#day_2").val();
			$.ajax({
				url : "../InternetRote/takeQD.do",
				type : "post",
				async : false,
				cache : false,
				dataType : "json",
				data : {
					'start' : start,
					'end' : end,
					'brand':brand,
					'spec':spec,
					'memory':memory,
					'color':color,
					'type':type,
					'timeKind':timeKind,
					'pp':pp
				},
				success : function(data) {
				 var loadReapt=echarts.init(document.getElementById("sub_char_row6"));
				
				 
				
				
					if (!isEmptyObject(data)) {
					var	text = '互联网销量(KPI完成情况)-大类-配置' ;
					
					//var	title =['配件','手机','智能硬件','功能机']; 
				
					   getPaint11(
								"sub_char_row6", text,data);
						/*getPaint9(
								"pie_char_Mom", text1, title, data.dateList1);*/

					}else{
						
						
						alert("当前日期无数据展示。");
					}

				}
			});
			
			
			
			
			
			
			
			
		}
	
	
	
}




 
 
 

</script>




</body>
</html>