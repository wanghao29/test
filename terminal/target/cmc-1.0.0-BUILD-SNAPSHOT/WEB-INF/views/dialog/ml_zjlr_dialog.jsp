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
<title>数据确认</title>
<style type="text/css">
	.modal-body {
		 	height:400px; 
		}
</style>

<script type="text/javascript" >
$(function(){
	//初始化页面数据
	var month =$("#startMonth").val();
	$("#month_lr").val(month);
	//赋值
	var remarks = getProfitRemarks();
	var kpiId =$("#ml_zjlr").val();
	if(kpiId=='ml'){
		$("#kpiId_lr").val('毛利');
		$("#remarks_lr").val(remarks.ml);
	}else if(kpiId=='zjlr'){
		$("#kpiId_lr").val('利润');
		$("#remarks_lr").val(remarks.zjlr);
	}else{
		$("#kpiId_lr").val('费用');
		$("#remarks_lr").val(remarks.fy);
	}
	
});


</script>
</head>
<body>
	<table style='' class='table table-hover'>
		<tr>
			<td>指标:&nbsp;&nbsp;&nbsp;</td>
			<td>
				<input type='text' id='kpiId_lr' style='color:green;' readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td>月份：</td>
			<td>
				<input  id="month_lr"  type="text" style="width:60%" readonly="readonly"class="form-text select prevMonth"
					   	  		onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M}'})" />
			</td>
		</tr>
		<tr>
			<td>备注：</td>
			<td>
				<textarea id='remarks_lr' class="form-control" rows="6" style='color:green;background-color:#fff;'></textarea>
			</td>
		</tr>
	</table>
</body>
</html>