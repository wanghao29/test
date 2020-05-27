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
<title>回款预测准确度</title>
</head>

<body>
 
<script type="text/javascript" src="<%=basePath%>resources/js/gfKpi/operateEfficiency/backForecastAccuracy.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/plugin/jquery.validate.js"></script>
	<style type="text/css">
	table tr td{
	  margin-right: 10px;
	}
	
	h1{
	 float: right ;
	}
	.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
    height: 27px;
    margin-top: 15px;
	}
	.ui-jqgrid .ui-common-table {
	    padding-left: 2px;
	}
	</style>
	    <input type="hidden" id="select_yf" /><!-- 选中行的月份 -->
	     <input type="hidden" id="flag"  value="回款预测准确度_19"/><!-- 标记所属的指标 -->
	     <input type="hidden" id="billcyc"  value="${billcyc}"/>
	<div class="row">
		<ol class="breadcrumb">
		 <li> 经分监控 </li>
		  <li> 基础项 </li>
		  <li class=" ">回款预测准确度</li>
		</ol>
	</div>

	<div class="row">
		  <div class="panel panel-default" style=" width: 100%;">
				  <div class="panel-body" >
				  <div class="row"  style="margin-bottom: 10px;" >
				      <div class="col-xs-8">
						    <table style=" width: 100%;">
						      	<tr>
						      	  <td > 开始时间:</td>
						      	  <td> <input id="startMonth"  name="startMonth" type="text" style="width:90%" onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-%M'})" readonly="readonly"class="form-text select"/></td>
						           
						          <td > 结束时间:</td>
						      	  <td> <input id="endMonth" name="endMonth" type="text" style="width:90%" onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-%M'})" readonly="readonly"class="form-text select"/></td>
						      	 
						      	   <td >  <button id="btnSearch" type="button" class="btn btn-primary" style="width:100px">查询</button> </td>
								    <td > <shiro:hasPermission name="provinceKpi:*"> <button id="addBtn" type="button" class="btn btn-primary" style="width:100px"  data-toggle="modal" data-target="#myModal"  >新增</button></shiro:hasPermission> </td>
								   <td > <shiro:hasPermission name="provinceKpi:*"> <button id="modify_y" type="button" class="btn btn-primary" style="width:100px" onclick="adjustment();">调整</button></shiro:hasPermission> </td>
								  <td >  <button id="modify_log" type="button" class="btn btn-primary" style="width:100px" onclick="adjustLog();">调整日志</button> </td>
						      	</tr>
						    </table>
							
						 </div>
						 
				    <div class="col-xs-4" style="float:right;">
				    	<div class="panel panel-default" style=" width: 100%;" >
				    		<h4><span style='color:#3eb8c5' id="infoPerson" >数据来源:</span></h4>
				    		<h4><span style='color:#3eb8c5' id="confirm" >确认人:</span></h4>
				    		<div style="width:100%;" id="kpiConfirmInfo"></div>
				    	</div>
				    	<input type="hidden" id="hid_kpikey" value="backForecastAccuracy"/><!-- 和权限有关  慎改 -->
				    </div>
				    
				    </div>
<!-- 				    <div class="row">
					      <div class="col-xs-4">
					         <div class="panel panel-default" style=" width: 100%;">
								  <div class="panel-body" style="display: flex;align-items:center;justify-content: center;">
									  <span style="font-size: 20px;">实际回款</span>
								   	  <span id="sjhk" style="margin-left: 100px; font-size: 40px;"> </span>  
								   	   <span style="font-size: 20px;">亿</span>
								  </div>
							  </div>
				     
				   		  </div>
					  	 <div class="col-xs-4">
					  	     <div class="panel panel-default" style=" width: 100%;">
								  <div class="panel-body" style="display: flex;align-items:center;justify-content: center;">
										  <span style="font-size: 20px;">回款预测准确度</span>
										  <span id="hkyczqd" style="margin-left: 100px; font-size: 55px;"> </span>
								  </div>
							  </div>
					  	 
					  	 </div>
					  	 <div class="col-xs-4">
					  	     <div class="panel panel-default" style=" width: 100%;">
								  <div class="panel-body" style="display: flex;align-items:center;justify-content: center;">
									  <span style="font-size: 20px;">回款预测准确度得分</span>
								   	 <span id="df" style="margin-left: 100px; font-size: 55px;">   </span>
								   	 <span style="font-size: 20px;">亿</span>
								  </div>
							  </div>
					  	 
					  	 </div>
				   </div> -->
				   
				   	 <div class="row">
					            <div class="col-sm-4">
					                <div class="ibox float-e-margins">
					           
					                    <div class="ibox-content">
					                        <h1 class="no-margins" id="sjhk" > </h1>
					                    <!--     <div class="stat-percent font-bold text-navy">20% <i class="fa fa-level-up"></i>
					                        </div> -->
					                        <small>实际回款</small>
					                    </div>
					                </div>
					            </div>
					            <div class="col-sm-4">
					                <div class="ibox float-e-margins">
					                
					                    <div class="ibox-content">
					                        <h1 class="no-margins  " id="hkyczqd" > </h1>
					                      <!--   <div class="stat-percent font-bold text-info">40% <i class="fa fa-level-up"></i>
					                        </div> -->
					                        <small>回款预测准确度</small>
					                    </div>
					                </div>
					            </div>
					            <div class="col-lg-4">
					                <div class="ibox float-e-margins">
					                
					                    <div class="ibox-content">
					                        <h1 class="no-margins   " id="df" > </h1>
					                       <!--  <div class="stat-percent font-bold text-warning">16% <i class="fa fa-level-up"></i>
					                        </div> -->
					                        <small>回款预测准确度得分</small>
					                    </div>
					                </div>
					            </div>
					 </div>
				    <div class="row">
				    		<div  class="col-xs-12" style="">
			 
								     <table id="grid" style=""></table> 
								     <div id="pager"></div> 
							</div>
				    </div>
			</div>
		</div>
	</div>
	
	
	<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">网内战略型手机销量占比</h4>
            </div>
            <div class="modal-body">
				<form id="addForm" class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="firstname" class="col-sm-4 control-label">月份</label>
				    <div class="col-sm-4">
				 
				      <input id="month" name="month" type="text" style="width:90%" onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-%M'})" readonly="readonly"class="form-text select"/>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-4 control-label">实际回款</label>
				    <div class="col-sm-4">
				      <input type="text" class="form-control" id="sjhk_input" name="sjhk_input" placeholder="请输入实际回款">
				    </div>
				   
				  </div>
				  <div class="form-group">
				    <label for="firstname" class="col-sm-4 control-label">计划回款</label>
				    <div class="col-sm-4">
				      <input type="text" class="form-control" id="jhhk_input" id="jhhk_input" placeholder="请输入计划回款">
				    </div>
				 
				  </div>
<!--    				  <div class="form-group">
				    <label for="firstname" class="col-sm-4 control-label">激励目标值</label>
				    <div class="col-sm-4">
				      <input type="text" class="form-control" id="jlmbz" name ="jlmbz" placeholder="请输入激励目标值"> 
				    </div>
				      <label style="margin-top: 10px;">%</label>
				  </div> -->
 
				</form>
			
			</div>
			<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id = "submitBtn" class="btn btn-primary">提交</button>
            </div>
			
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
	
	
</body>
</html>