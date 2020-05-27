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
    <script type="text/javascript" src="<%=basePath%>resources/js/cityKpi/model_setIn.js?"></script> 
	<script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>
	<script src="<%=basePath%>resources/js/plugin/table2excel.js"></script>	
	<script src="<%=basePath%>resources/js/plugin/echart/echarts.min.js"></script>
	<script src="<%=basePath%>resources/js/plugin/jqGrid/js/jquery.jqGrid.min.js"></script>
	<script src="<%=basePath%>resources/js/plugin/jqGrid/js/i18n/grid.locale-cn.js"></script>
	<div class="row">
	<div class="col-xs-12" style="margin-left: 10px;background-color:#36648B" align="left">
	<span style="color: #33ffff;font-size: 20px;">经分监控   / 存 / 互联网库存报表</span>
	</div>
	</div>
	<div class="row" style="padding-top: 30px;">
    	<!-- <div class="col-xs-2" style="margin-left: 0.1%;" align="left">
			<span>指标名称：</span>
			<input type="text"  align="top" 
			id="kind1" name="kind1" style="color: blue;text-align: center;border-radius: 6px;"
			/>
		</div> -->
		<div class="col-xs-5" align="right" id="allTime">
			
									
								   时间：								 
								     <input name="datevalue" id="day_1" runat="server" readonly="readonly"
	                                 type="text"
	                                 style="text-align: center;width: 20%; height: 30px; background-color: #00063c; border-color: #1addfa; color: white; border-radius: 16px;"
                                     onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-{%M}',onpicked:selectDate})" />
				
		</div>
                            		
<div class="col-xs-3" id="allSearch">
<button class="btn btn-primary btn-lg" 
style=" padding: 1px 16px;font-size: 18px;line-height: 1.3333333;
border-radius: 6px;float:left;margin:0px 10px;" 
id="query" onclick="selelctPort()">查询
</button>
</div>


</div>
  

 <!--库存周转表格  -->
 <div id="sub_dim8" style="width: 100%;height: 500px;display:block;margin-top: 50px;">
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

 
function selectDate() {
	//jqgridReload();
}
 
/* 时间控件调取。。。。。。。。  */





 
 
 

</script>




</body>
</html>