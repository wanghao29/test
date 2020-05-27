<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>重点产品</title>
</head>

<body>
	<style type="text/css">
.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
	height: 37px;
	margin-top: 5px;
}

.ui-jqgrid .ui-jqgrid-htable th {
	color: #607D8B;
}

.ui-jqgrid .ui-jqgrid-htable th {
	color: #607D8B;
}

.btn {
	display: inline-block;
	padding: 4px 6px;
}

.btn-lg, .btn-group-lg>.btn {
	padding: 10px 8px;
	font-size: 6px;
	line-height: 1;
	border-radius: 6px;
	float: right;
}
</style>
	<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
	<script	src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/cityKpi/zdKpiImptProdtIndex.js?"></script>
	<script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>
	
	<div class="row" style="padding-top: 30px;">
    	<div class="col-xs-2" align="left">
			<label>年份：</label>
			<input name="year" id="year" type="text" style="width:60%" readonly="readonly" class="form-text select currentYear"
						onClick="WdatePicker({dateFmt:'yyyy',maxDate:'%y',onpicked:pageInit})" />
		</div>
		<div class="col-xs-2" align="left">
			<span>季度：</span>
			<select name="quarter" id="quarter" class="select">
				<option value="">全部</option>
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
		
 	<div class="row" style="padding-top: 30px;">
		<div class="col-xs-12"  style="padding-left:10px;">
			<table id="list"></table>
			<div id=pager></div>
		</div>		
	</div> 	
		
<script type="text/javascript">
$(function(){
	$("#query").click(function(){
		jqgridReload();
	});
});

</script>




</body>
</html>