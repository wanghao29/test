<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<title>量</title>
</head>

    

 
<body>
<style   type="text/css">
 .changeColor{
 background-color:blue;
 }
 .row{
 margin-bottom: 20px;
 }
 .ww{
 	color:#3eb8c5;
 }
</style>
<script type="text/javascript">
//进度效果
function blockImg(){
	$.blockUI({ message: '<h1><img src="${pageContext.request.contextPath}/resources/images/wait.gif" /> 加载中。。。。。</h1>' });
}
</script>
 
 
<script type="text/javascript" src="<%=basePath%>resources/js/plugin/circular-json.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/model/eightCharacters/amount.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/plugin/jquery.blockUI.js"></script>

<div class="row" style="padding-top: 5px;">
	<div class="col-xs-3"  align="left">
			<label style="color: #3eb8c5;font-size: 20px;margin-top: -10px;"><span id="type_8">${type_8}</span></label>
			<!-- <select id ="kpi"class="select_square">
				
			</select> -->
	</div>
 	<div class="col-xs-2"  align="center">
			 <label>&nbsp;&nbsp;&nbsp;开始时间:</label>
			 <input name="month" id="startMonth"  type="text" style="width:60%" readonly="readonly"class="form-text select prevMonth"
					   	  		onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M}'})" />&nbsp;&nbsp;&nbsp;
	</div>
	<div class="col-xs-2"  align="center" id="hiddiv1">
			 <label>-&nbsp;&nbsp;&nbsp;结束时间:</label>
			 <input name="month" id="stopMonth"  type="text" style="width:60%" readonly="readonly"class="form-text select prevMonth"
					   	  		onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M}'})" />
	</div>
	<div></div>
	<div class="col-xs-5"  align="right">
	  <div class="col-xs-2"> <button type="button" onclick="query()" class="btn btn-primary" style="width:100px" > 查询</button></div>
	</div>
	</br>
	<input type="hidden" id="hid_kpikey"><!-- 保存被选中的指标的id --> 
	<input type="hidden" id="stockAmount"><!-- 保存库龄库存量 -->
	<input type="hidden" id="stockMoney"><!-- 保存库龄库存金额 -->
	<input type="hidden" id="overview"><!-- 总览-->
	<input type="hidden" id="showRr"><!-- 退货率总览-->
	</br></br>
	<div id ="kpi" class="row">
	</div>
</div>

<div id="export_promotersExcel" class="row" style="padding-left: 50px;display:none;">
	<!-- 按钮触发模态框 -->
	<button class="btn btn-primary btn-lg" style="float:left" data-toggle="modal" data-target="#myModal">
	导入促销人员Excel文件
	</button> &nbsp;&nbsp;
	<button id="editPerson"  class="btn btn-default">  编辑</button>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						导入促销人员Excel文件 &nbsp;&nbsp;&nbsp;<span style="color:red;">(不可重复导入)</span>
					</h4>
					</div>
					<div class="modal-body">
						<div>
							<span style="color:red;">导入的格式规范：（Excel表第一行为表头）</span><br/>
							<span>导入促销人员：</span>&nbsp;&nbsp;<span style="color:red">8字类型|维度|月份|地市 |促销人员数</span>&nbsp;&nbsp;<span style="color:green;">例如：量|人均销量|201806|广州|21</span>
						</div>
						<form id="form1"  action="##" method="post" enctype="multipart/form-data">
							<input type="file"  name="uploadFile" id="uploadFile"  class="form-control" />
						</form>
					</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" id="btnOK" class="btn btn-primary" onclick="exportExcel()">
						开始导入
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
</div>

<div id="export_team_incomeExcel" class="row" style="padding-left: 50px;display:none;">
	<!-- 按钮触发模态框 -->
	<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal1">
	导入【售后团队收入】Excel文件
	</button>
	<button id="editTeam"  class="btn btn-default">  编辑</button>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel1">
						导入【售后团队收入】Excel文件 &nbsp;&nbsp;&nbsp;<span style="color:red;">(不可重复导入)</span>
					</h4>
					</div>
					<div class="modal-body">
						<div>
							<span style="color:red;">导入的格式规范：（Excel表第一行为表头）</span><br/>
							<span>导入售后团队收入：</span>&nbsp;&nbsp;<span style="color:red">月份|地市 |类型|收入</span>&nbsp;&nbsp;<span style="color:green;">例如：201806|广州|保内收入|200</span>
						</div>
						<form id="form2"  action="##" method="post" enctype="multipart/form-data">
							<input type="file"  name="uploadTeam" id="uploadTeam"  class="form-control" />
						</form>
					</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" id="btnOK1" class="btn btn-primary" onclick="exportTeamExcel()">
						开始导入
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
</div>

<div id="export_CostExcel" class="row" style="padding-left: 50px;display:none;">
	<!-- 按钮触发模态框 -->
	<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2">
	导入【净利的酬金和费用】Excel文件
	</button>
	<button id="editCost"  class="btn btn-default">  编辑</button>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel2">
						导入【净利的酬金和费用】Excel文件 &nbsp;&nbsp;&nbsp;<span style="color:red;">(不可重复导入)</span>
					</h4>
					</div>
					<div class="modal-body">
						<div>
							<span style="color:red;">导入的格式规范：（Excel表第一行为表头）</span><br/>
							<span>净利的酬金和费用：</span>&nbsp;&nbsp;<span style="color:red">维度|五大战区|月份|地市 |酬金|费用</span>&nbsp;&nbsp;<span style="color:green;">例如：净利|东莞运营中心|20180601|广州|123|200</span>
						</div>
						<form id="form3"  action="##" method="post" enctype="multipart/form-data">
							<input type="file"  name="uploadCost" id="uploadCost"  class="form-control" />
						</form>
					</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" id="btnOK2" class="btn btn-primary" onclick="exportCost()">
						开始导入
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
</div>

<div id="export_GrossExcel" class="row" style="padding-left: 50px;display:none;">
	<!-- 按钮触发模态框 -->
	<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal3">
	导入【毛利额-地市】Excel文件
	</button>
	<!-- <button id="editGross"  class="btn btn-default">  编辑</button>  -->
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel3">
						导入【毛利额】Excel文件 &nbsp;&nbsp;&nbsp;<span style="color:red;">(不可重复导入)</span>
					</h4>
					</div>
					<div class="modal-body">
						<div>
							<span style="color:red;">导入的格式规范：（Excel表第一行为表头）</span><br/>
							<span>毛利额:</span>&nbsp;&nbsp;<span style="color:red">账期|地市|毛利额(万)</span>&nbsp;&nbsp;<span style="color:green;">例如：201812|广州|20.0</span>
						</div>
						<form id="form4"  action="##" method="post" enctype="multipart/form-data">
							<input type="file"  name="uploadGross" id="uploadGross"  class="form-control" />
						</form>
					</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" id="btnOK3" class="btn btn-primary" onclick="exportGross()">
						开始导入
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
	<div id="export_GrossExcel_brand" class="row" style="padding-right: 50%;display:none;float:right;">
	<!-- 按钮触发模态框 -->
	<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal4">
	导入【毛利额-品牌】Excel文件
	</button>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel4">
						导入【毛利额】Excel文件 &nbsp;&nbsp;&nbsp;<span style="color:red;">(不可重复导入)</span>
					</h4>
					</div>
					<div class="modal-body">
						<div>
							<span style="color:red;">导入的格式规范：（Excel表第一行为表头）</span><br/>
							<span>毛利额:</span>&nbsp;&nbsp;<span style="color:red">账期|品牌|毛利额(万)</span>&nbsp;&nbsp;<span style="color:green;">例如：201812|华为|20.0</span>
						</div>
						<form id="form5"  action="##" method="post" enctype="multipart/form-data">
							<input type="file"  name="uploadGross_brand" id="uploadGross_brand"  class="form-control" />
						</form>
					</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" id="btnOK4" class="btn btn-primary" onclick="exportGross_brand()">
						开始导入
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	</div>
</div>


<div class="row"  style="width: 100%;height: 600px;">
	<div class="col-xs-2" align="center">
			<label>&nbsp;&nbsp;&nbsp;维度1:</label>
			<select id ="dim_one"class="select_square">
				
			</select>
	</div>
	<div class="col-xs-12"  align="center" style="height:100%;width: 100%;">
	 	  <div class="panel panel-default" style="height:100%;width: 100%;">
				  <div class="panel-body" style="height:600px;width: 100%;">
				    <div id ="char_row" style="height:100%;width: 100%;">
				    
				    </div>
				     
				  
				  </div>
		  </div>
	</div>
</div>

<div id="sub_dim" style="width: 100%;height: 450px;">


</div>
 
</body>
</html>