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
<title>三个月以上存货占比</title>

</head>
<body>
<script type="text/javascript" src="<%=basePath%>resources/js/assetsTurnoverRatio/threemonth_stock_ratio.js"></script>
<input type="hidden" id = "billcyc" value="${billcyc}">
<style type="text/css">
table tr td{
  margin-right: 10px;
}
h1{
 float: right ;
}

</style>
 
<div class="row">
<ol class="breadcrumb">
  <li><a href="#">基础项</a></li>
  <li class="active">三个月以上存货占比</li>
 
</ol>
 
</div>
<div class="row">
  <div class="panel panel-default" style=" width: 100%;">
	  <div class="panel-body" >
	  <div class="row"  style="margin-bottom: 10px;" >
	      <div class="col-xs-12">
			    <table style=" width: 50%;">
			      	<tr>
			      	  <td > 开始时间:</td>
			      	  <td> <input name="startMonth" type="text" style="width:130px" onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-%M'})" readonly="readonly"class="form-text select"/></td>
			           
			          <td > 结束时间:</td>
			      	  <td> <input name="endMonth" id="endMonth" type="text" style="width:130px" onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-%M'})" readonly="readonly"class="form-text select"/></td>
			      	 
			      	   <td >  <button id="btnSearch" type="button" class="btn btn-primary" style="width:100px">查询</button> </td>
			      	   <td >  <button id="btn_set_up_exemption_model"  onclick="set_up_exemption_model()"  type="button" class="btn btn-primary" style="width:120px">设置免考核机型</button> </td>
			      	</tr>
			    </table>
			 </div>
	    </div>
	    <div class="row">
		      <div class="col-xs-4">
		         <div class="panel panel-default" style=" width: 100%;">
					  <div class="panel-body" >
					     <p>考核库龄段90-180天金额</p>
					   	 <h1 id="hKhkld90" style="float: right;">  </h1>
					  </div>
				  </div>
	     
	   		  </div>
		  	 <div class="col-xs-4">
		  	     <div class="panel panel-default" style=" width: 100%;">
					  <div class="panel-body" >
					  	 <p>考核库龄段180-360天金额</p>
					   	 <h1 id="hKhkld180"> </h1>
					  </div>
				  </div>
		  	 
		  	 </div>
		  <div class="col-xs-4">
				<div class="panel panel-default" style=" width: 100%;">
					<div class="panel-body" >
						<p>考核库龄段360天以上金额</p>
						<h1 id="hKhkld360">  </h1>
					</div>
				</div>

			</div>
		  	</div>
		  	  <div class="row"> 
		  	 
		  	 <div class="col-xs-4">
		  	     <div class="panel panel-default" style=" width: 100%;">
					  <div class="panel-body" >
					  	 <p>考核库龄段90-180天占比</p>
					   	 <h1 id="hKhkldzb90">   </h1>
					  </div>
				  </div>
		  	 
		  	 </div>
			<div class="col-xs-4">
				<div class="panel panel-default" style=" width: 100%;">
					<div class="panel-body" >
						<p>考核库龄段180-360天占比</p>
						<h1 id="hKhkldzb180">   </h1>
					</div>
				</div>

			</div>
			<div class="col-xs-4">
				<div class="panel panel-default" style=" width: 100%;">
					<div class="panel-body" >
						<p>考核库龄段360天以上占比</p>
						<h1 id="hKhkldzb360">  </h1>
					</div>
				</div>

			</div>
	    </div>

 

	    <div class="row"style="margin-bottom: 10px;">
	       <table id="grid"></table>
	    </div>

		  <div class="panel panel-default">
			  <div class="panel-body" style="height: 1500px" >
			  <div> 月份： <span id="yf" style="color:blue;"></span></div>
				  <div id="char_bar" style="width: 100%;height:500px;"></div>
				  <div id="char_bar2" style="width: 100%;height: 500px;"></div>
				  <div id="char_bar3" style="width: 100%;height: 500px;"></div>
			  </div>
		  </div>

 

	  </div>
 </div>
 
</div>



 
<div class="modal fade" id="myModal"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
						aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					设置免考核机型
				</h4>
			</div>
			<div class="modal-body">
				     <form class="form-horizontal" id="addForm">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">月份：</label>
						    <div class="col-sm-3">
						      <input name="month"  id="month" type="text" style="width:130px;color:#fff"  onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-%M'})"  readonly="readonly"class="form-text select"/>
						    </div>
						     <label for="inputPassword3" class="col-sm-2 control-label">品牌：</label>
						    <div class="col-sm-3">
						          <select name="brand_desc" id="brand_desc" multiple="multiple" style="float:left;width: 100%;" class="">
						          </select>
						    </div>
						  </div>
						   <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">机型：</label>
						    <div class="col-sm-3">
						         <select name="model_desc" id="model_desc"  multiple="multiple" style="float:left;width: 100%;" class="">
						          </select>
						    </div>
						     <label for="inputPassword3" class="col-sm-2 control-label">配置：</label>
						    <div class="col-sm-3">
						          <select name="configure_desc" id="configure_desc" multiple="multiple" style="float:left;width: 100%;" class="">
						          </select>
						    </div>
						  </div>
				   </form>
				 
				 
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" 
						data-dismiss="modal">取消
				</button>
				<button id="submitBtn"  type="button" class="btn btn-primary">
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>