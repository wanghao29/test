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
<title>目标值模板</title>
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

th.ui-th-column div{
    white-space:normal !important;
    height:auto !important;
    padding:0px;
}
</style>
	<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
	<script	src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/customerChannel/customerChannel.js?"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/cityKpi/zdKpiGoalValIndex.js?"></script>
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
			<button class="btn btn-primary btn-lg" data-toggle="modal" style="float:left" data-target="#myModal">数据导入</button>
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel"></h4>
						</div>
					</div>
					
					<form id="uploadForm" enctype="multipart/form-data">
						<div class="modal-body">
							<input type="file" id="file" name="file" onchange="loadFile(this.files[0])" />
							<br/>
							<a style="color:white;" href="<%=basePath%>resources/tmpl/goal_tmpl.xls">模板下载</a>
						</div>
					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
							data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
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

function loadFile(file){
	
	$.ajax({
      url: '../zdKpiGoalVal/upload.do',
      type: 'POST',
      data: new FormData($('#uploadForm')[0]),
      datatype: 'json',
      cache:false,
      traditional: true,
      contentType: false,
      processData: false,
      success: function (data) {
    	if(data=="ok"){
    		alert("导入成功！"); 	
    	}else{
    		alert("导入失败，请导入正确的数据！");
    	}
      },
      error: function () {
    	  alert("导入失败，请导入正确的数据！");
      }
    });
}

</script>




</body>
</html>