<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="sharainy" tagdir="/WEB-INF/tags" %>  
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
<title>完成值模板</title>
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
	<script type="text/javascript" src="<%=basePath%>resources/js/cityKpi/zdKpiCompltValIndex.js?"></script>
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
		
		<div class="col-xs-2" align="left">
			<span>地市：</span>
			<select name="city" id="city" class="select">
				<shiro:hasPermission name="QS"><option value="">全部</option></shiro:hasPermission>
				<shiro:hasPermission name="QS"><option value="">全省</option></shiro:hasPermission>
				<shiro:hasPermission name="GZ"><option value="广州" selected="selected">广州</option></shiro:hasPermission>
				<shiro:hasPermission name="QY"><option value="清远">清远</option></shiro:hasPermission>
				<shiro:hasPermission name="ZQ"><option value="肇庆">肇庆</option></shiro:hasPermission>
				<shiro:hasPermission name="SQ"><option value="韶关">韶关</option></shiro:hasPermission>
				<shiro:hasPermission name="YF"><option value="云浮">云浮</option></shiro:hasPermission>
				<shiro:hasPermission name="FS"><option value="佛山">佛山</option></shiro:hasPermission>
				<shiro:hasPermission name="JM"><option value="江门">江门</option></shiro:hasPermission>
				<shiro:hasPermission name="MM"><option value="茂名">茂名</option></shiro:hasPermission>
				<shiro:hasPermission name="YJ"><option value="阳江">阳江</option></shiro:hasPermission>
				<shiro:hasPermission name="ZJ"><option value="湛江">湛江</option></shiro:hasPermission>
				<shiro:hasPermission name="SZ"><option value="深圳">深圳</option></shiro:hasPermission>
				<shiro:hasPermission name="ST"><option value="汕头">汕头</option></shiro:hasPermission>
				<shiro:hasPermission name="MZ"><option value="梅州">梅州</option></shiro:hasPermission>
				<shiro:hasPermission name="SW"><option value="汕尾">汕尾</option></shiro:hasPermission>
				<shiro:hasPermission name="YJ"><option value="揭阳">揭阳</option></shiro:hasPermission>
				<shiro:hasPermission name="CZ"><option value="潮州">潮州</option></shiro:hasPermission>
				<shiro:hasPermission name="DG"><option value="东莞">东莞</option></shiro:hasPermission>
				<shiro:hasPermission name="HZ"><option value="惠州">惠州</option></shiro:hasPermission>
				<shiro:hasPermission name="ZH"><option value="珠海">珠海</option></shiro:hasPermission>
				<shiro:hasPermission name="ZS"><option value="中山">中山</option></shiro:hasPermission>
				<shiro:hasPermission name="HY"><option value="河源">河源</option></shiro:hasPermission>
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
							<a style="color:white;" href="<%=basePath%>resources/tmpl/complt_tmpl.xls">模板下载</a>
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
      url: '../zdKpiCompltVal/upload.do',
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
	
/* 实现查询所有品牌的功能 */	
function selectDate2(){
	var formData = new FormData();
	var month=document.getElementById('month').value;
	var month2=document.getElementById('month2').value;
	formData.append("month",month);//这个地方可以传递多个参数
	formData.append("month2",month2);//这个地方可以传递多个参数
	$.ajax({
		url: '../uploadFilePrice/selectPrice.do',
	    type: 'POST',
	    datatype: 'json',
	    data: formData,
	    cache:false,
	    traditional: true,
	    contentType: false,
	    processData: false,
	    success: function (data) {
	    	if(data=="b"){
	    		alert("查询成功！"); 	
	    	}else{
	    		
	    	alert("无数据！");
	    	}
	   },
	   error: function () {
	    	  
	   }
   });
} 

function selectDate() {
	jqgridReload();
}

</script>




</body>
</html>