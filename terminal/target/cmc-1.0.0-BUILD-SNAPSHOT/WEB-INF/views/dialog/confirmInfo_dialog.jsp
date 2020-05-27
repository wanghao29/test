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
	var hid_kpikey = $("#hid_kpikey").val();
	var kpiName;
	var type8=$("#type_8").text();
	if(type8!=null && type8!=''){
		kpiName= $("#"+hid_kpikey+" h3").text();
		$("strong[name='type1']").text(type8+"--");
	}else{
		kpiName=$("ol li:eq(1)").text();
	}
	$("input[name='kpi_id1']").val(kpiName);
	$("input[name='month1']").val(month);
	//查询确认日志   补充数据信息-【最近一次】 和【备注】
	var confirmInfo = confirm_log(month,hid_kpikey);
	if(confirmInfo!=null){//有确认过的记录
		var person=confirmInfo.person;
		var confirmTime =confirmInfo.confirmTime;
		var bz = confirmInfo.remarks;
		$("input[name='confirmTime1']").val(confirmTime);
		$("input[name='person1']").val(person);
		$("#remarks").val(bz);
	}
});

function confirm_log(month,kpiKey){
	var confirmInfo;
	$.ajax({
        //几个参数需要注意一下
            type: 'post',//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: basePath + "/amount/confirm_log.do",//url
            data: JSON.stringify({'month':month,'kpiKey':kpiKey}),
            async: false,
            contentType: 'application/json',  
            processData: false, 
            success: function (result) {
            	confirmInfo=result;
            	
            },
            error : function() {
            	alert('false');
            	return;
            }
        });
	return confirmInfo;
}

</script>
</head>
<body>
	<table style='' class='table table-hover'>
		<tr>
			<td>指标：&nbsp;&nbsp;&nbsp;<strong name='type1' style='color:green;float:right;'></strong></td>
			<td>
				<input type='text' name='kpi_id1' style='color:green;' readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td>确认账期：</td>
			<td>
				<input type='text' name = 'month1' style='color:green;' readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td>最近一次确认人：</td>
			<td>
				<input type='text' name='person1' style='color:green;' readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td>最近一次确认时间：</td>
			<td>
				<input type='text' name='confirmTime1' style='color:green;' readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td>确认状态：</td>
			<td>
				<select id='state' style='color:green;'>
					<option value='1'>已确认</option>
					<option value='0'>请核查</option>
		   		</select>
			</td>
		</tr>
		<tr>
			<td>备注：</td>
			<td>
				<textarea id='remarks' class="form-control" rows="6" style='color:green;background-color:#fff;'></textarea>
			</td>
		</tr>
	</table>
	<input type="hidden" id='error_dialog' value="true"/><!-- 与error_dialog.jsp的相呼应 -->
</body>
</html>