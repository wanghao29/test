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
		.modal-body {
			background-color: #ffffff;
		/* 	height:700px; */
	/* 		height:auto!important; */
			 min-height:200px;
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
	</style>
	<script type="text/javascript">
		$(function(){
			var zq_yf=$("#select_yf").val();
			var flag = $("#flag").val();
			
			//查询要调整的数据  并 初始化页面
			initData(zq_yf,flag);
			$("#zq_yf").val(zq_yf);
			$("#kpiName").val(flag);
		});
		
		function initData(zq_yf,flag){
			$.ajax({
	              type: "post",
	              url: basePath + "/provinceKpi/getColumns.do",
	              contentType: "application/json; charset=utf-8",
	              data: JSON.stringify({"month":zq_yf,"flag":flag}),
	              dataType: 'JSON',
	              success: function (data) {
	            	  var fieldIDs=data.fieldIDs;
	            	  var fieldNames=data.fieldNames;
	            	  var values=data.values;
	                 	for (var i = 0; i < data.size; i++) {
	                 		var tzz =fieldIDs[i]+'_tzz';//调整值id
	                 		var tzh =fieldIDs[i]+'_tzh';//调整后id
	                 		var bz = fieldIDs[i]+'_bz';//备注id
	                 		$("#adjust_y").append("<tr>"
		                 			+"<td color='red'>"+fieldNames[i]+"</td>"	//调整项
		                 			+"<td><input type='text' id='"+data.fieldIDs[i]+"' name='"+fieldIDs[i]+"' value='"+values[i]+"' readonly/></td>"		//调整前
		                 			+"<td><input type='text' id='"+tzz+"' name='"+tzz+"' value='0.0'  onchange=\"adjustValue(\'"+fieldIDs[i]+"\',\'"+tzz+"\',\'"+tzh+"\')\"/></td>"	//调整值
		                 			+"<td><input type='text' id='"+tzh+"' name='"+tzh+"' value='0' readonly/></td>"				//调整后
		                 			+"<td><input type='text' id='"+bz+"' name='"+bz+"'/></td>"	//备注
		                 			+"</tr>");
						}
	                 	$(".modal-body").css("height",$("#adjust_y").height()+20);
	                 	$(".bootstrap-dialog-body").css("height",$("#adjust_y").height()+20);
	                 	$(".bootstrap-dialog-message").css("height",$("#adjust_y").height()+20);
	                 	
	              },
	              error: function () {
	                  alert('跳转调整界面时获取数据失败');
	              },
	              complete: function () {

	              }
	          });
		}
		
		function adjustValue(tzq,tzz,tzh){
			var tzz_s=$("#"+tzz).val();
			var tzq_s=$("#"+tzq).val();
			
			
			var value_tzz=Number(tzz_s);
			var value_tzq=Number(tzq_s);
			//校验 输入的tzz
			//正则
			var reg=/^(\-){0,1}[0-9]{1,}(\.[0-9]{0,9})?$/;
			if(!reg.test(value_tzz)){
				alert("[调整值]必须为数字");
				$("#"+tzz).val(0);
				return false;
			}
			
			$("#"+tzh).val((value_tzz+value_tzq).toFixed(2));
		}
		
		function submit_adjust(){
			$.ajax({
	              type: "post",
	              url: basePath + "/provinceKpi/submitAdjust.do",
	              contentType: "application/json; charset=utf-8",
	              data:JSON.stringify($('#form_dialog').serializeObject()),
	              dataType: 'JSON',
	              async: false,
	              success: function (data) {
	            	  alert("调整成功，并记录！");
	              },
	              error: function () {
	                  alert('调整数据提交失败');
	              },
	              complete: function () {

	              }
	          });
		}
	</script>
</head>
<body>
<div class="dialogContent">
<div id="box_list">
	<form class="form-horizontal" id="form_dialog" method="post" >
	  <div class="form-group" style="margin-left: 5px">
	    <table id="adjust_y" class="table table-bordered" style="width:100%;height:100%;line-height: 20px;margin-bottom: 20px;padding-left: 20px;" >
	    	<tr>
	    		<td>账期:</td>
	    		<td><input type="text" id="zq_yf" name="zq_yf" readonly/></td>
	    		<td></td>
	    		<td></td>
	    		<td></td>
	    	</tr>
	    	<tr>
	    		<td>调整字项</td>
	    		<td>调整前	</td>
	    		<td>调整值	</td>
	    		<td>调整后	</td>
	    		<td>备注</td>
	    	</tr>
	    </table>
	  </div>
	  <input type="hidden"  id="kpiName" name="kpiName" style="color:black;"/>  <!-- 隐藏域，-->
	</form>
	</div>
</div>
</body>

</html>
