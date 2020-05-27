<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
    
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>各地市年度KPI指标</title>
</head>

<body>
<style type="text/css">
.title-no-border{
	color: #5bfdff;
	font-size: 18px;
	margin-left: 12px;
}
.conditions_select li{
	float: left;
	width: 16%;
	list-style: none;
}
.fieldGroup{
	color:#5bfdff;
	clear:both;
} 
.content div{
  color: #FFFFFF;
}
input[type="checkbox"], input[type="radio"] {
    height: 18px;
    width: 18px;
}
label {
    font-size: 20px;
}
.type {
	width: 200px;
}
.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
    height: 27px;
    margin-top: 15px;
}

th.ui-th-column div{
    white-space:normal !important;
    height:auto !important;
    padding:0px;
}
</style>
	<script type="text/javascript" src="<%=basePath%>resources/js/cityKpi/zdResultCitykpiQIndex.js?"></script>
	
	<div class="row" style="padding-top: 30px;">
    	<div class="col-xs-2" align="left">
			<label>年份：</label>
			<input name="year" id="year" type="text" style="width:60%" readonly="readonly" class="form-text select currentYear"
						onClick="WdatePicker({dateFmt:'yyyy',maxDate:'%y',onpicked:pageInit})" />
		</div>
		<div class="col-xs-2" align="left">
			<span>季度：</span>
			<select name="quarter" id="quarter" class="select">
				<option value="第一季度">第一季度</option>
				<option value="第二季度">第二季度</option>
				<option value="第三季度">第三季度</option>
				<option value="第四季度">第四季度</option>
			</select>
		</div>
		
		<div class="col-xs-2">
			<button class="btn btn-primary btn-lg" style="float:left;margin:0px 10px;" id="query">查询</button>
		</div>
	</div>
	
	<div  class="row" >
		<p><span class="title-no-border"><span style="background-color: #5bfdff;">|</span >&nbsp;可选条件</span></p>
		<div  class="col-xs-12">
			<div class="panel panel-default jqgrid_width">
				<div class="panel-body " id="all_field" >				       
	       		    <ul class="conditions_select" >	
	       		        <!-- <li class="fieldGroup"><label><input type="checkbox" class="type1_all" checked />&nbsp;指标选择：</label></li> -->
	       		        <li class="fieldGroup"><label><input type="checkbox" class="type1_all" checked />&nbsp;规模指标：</label></li>
	       		    	<li><label><input name="kpi" type="checkbox" value="xl" class="type1" checked />&nbsp;销量</label></li>
						<li><label><input name="kpi" type="checkbox" value="xse" class="type1" checked />&nbsp;销售额</label></li>
						<li><label><input name="kpi" type="checkbox" value="znyjsr" class="type1" checked />&nbsp;智能硬件收入</label></li>
						<li><label><input name="kpi" type="checkbox" value="zzppsjsr" class="type1" checked />&nbsp;自主品牌手机收入</label></li>
						<li><label><input name="kpi" type="checkbox" value="zzpppeznyjsr" class="type1" checked />&nbsp;自主品牌配额智能硬件收入</label></li>
						<li><label><input name="kpi" type="checkbox" value="zzppfpeznyjsr" class="type1" checked />&nbsp;自主品牌非配额智能硬件收入</label></li>
						<li><label><input name="kpi" type="checkbox" value="zdcpxl" class="type1" checked />&nbsp;重点产品销量</label></li>
						
						<li class="fieldGroup"><label><input type="checkbox" class="type3_all" checked />&nbsp;渠道指标：</label></li>
						<li><label><input name="kpi" type="checkbox" value="hykhmbz" class="type3" checked />&nbsp;活跃客户目标值</label></li>
						<li><label><input name="kpi" type="checkbox" value="kawxkhxl" class="type3" checked />&nbsp;KA维系客户销量</label></li>
						<li><label><input name="kpi" type="checkbox" value="zxhykhs" class="type3" checked />&nbsp;中小活跃客户数</label></li>
						
						<li class="fieldGroup"><label><input type="checkbox" class="type4_all" checked />&nbsp;运营效率指标：</label></li>
						<li><label><input name="kpi" type="checkbox" value="sgyyschyzzb" class="type4" checked />&nbsp;三个月以上存货原值占比</label></li>
						<li><label><input name="kpi" type="checkbox" value="sgyysyszkzb" class="type4" checked />&nbsp;三个月以上应收账款占比</label></li>
						
						<li class="fieldGroup"><label><input type="checkbox" class="type5_all" checked />&nbsp;加减分项指标：</label></li>
						<li><label><input name="kpi" type="checkbox" value="lscsqdxl" class="type5" checked />&nbsp;零售侧双渠道销量</label></li>
						<li><label><input name="kpi" type="checkbox" value="lscsqdjlr" class="type5" checked />&nbsp;零售侧双渠道净利润</label></li>
						<li><label><input name="kpi" type="checkbox" value="xlsmdyy" class="type5" checked />&nbsp;新零售门店运营</label></li>
						<li><label><input name="kpi" type="checkbox" value="shjl" class="type5" checked />&nbsp;售后净利</label></li>
						<li><label><input name="kpi" type="checkbox" value="zzppxsejfx" class="type5" checked />&nbsp;自主品牌销售额加分项</label></li>
						<li><label><input name="kpi" type="checkbox" value="znyjmll" class="type5" checked />&nbsp;智能硬件毛利率</label></li>
						<li><label><input name="kpi" type="checkbox" value="yhkhgmkfx" class="type5" checked />&nbsp;有效客户规模扣分项</label></li>
						
						<li class="fieldGroup"><label><input type="checkbox" class="type6_all" checked />&nbsp;重点扣分项指标：</label></li>
						<li><label><input name="kpi" type="checkbox" value="zdsxkfx" class="type6" checked />&nbsp;重大事项扣分项</label></li>
	       			</ul>
	       			<ul class="conditions_select" >	
	       		        <li class="fieldGroup"><label><input type="checkbox" class="type2_all" checked />&nbsp;字段选择：</label></li>
	       		    	<li><label><input name="field" type="checkbox" value="YGoal" class="type2" checked />&nbsp;全年目标值</label></li>
						<li><label><input name="field" type="checkbox" value="YValue" class="type2" checked />&nbsp;全年完成值</label></li>
						<li><label><input name="field" type="checkbox" value="YRate" class="type2" checked />&nbsp;全年累计完成率</label></li>
						<li><label><input name="field" type="checkbox" value="QGoal" class="type2" checked />&nbsp;季度目标值</label></li>
						<li><label><input name="field" type="checkbox" value="QValue" class="type2" checked />&nbsp;季度完成值</label></li>
						<li><label><input name="field" type="checkbox" value="QRate" class="type2" checked />&nbsp;季度完成率</label></li>
						<li><label><input name="field" type="checkbox" value="Progress" class="type2" checked />&nbsp;时间进度</label></li>
						<li><label><input name="field" type="checkbox" value="Score" class="type2" checked />&nbsp;得分</label></li>
	       			</ul>
	       		</div>
	       	</div>
		</div>
	</div>
		
 	<div class="row" >
		<div class="col-xs-12" style="padding-left:10px;">
			<table id="list"></table>
			 <div id="pager1"></div>
		</div>
		
	</div> 
		
	
	<!-- vagueQuery Modal start-->
	<div class="modal fade" id="vagueQueryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document" style="width:80%;height:80%;margin-top:10%">
	    <div class="modal-content">
		      <div class="modal-body">
				  	<div class="row" >
				       	<div class="col-xs-12" style="padding-left:18px;min-height:200px;" id="extraList_table_container">
				    	     <table id="extraList"></table> 
							 <div id="pager"></div>
						</div>   	  	
					</div>
		      </div>	       
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		      </div> 
	    </div>
	  </div>
	</div>
	<!-- vagueQuery Modal end-->

</body>
</html>