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
<title>KA客户销量目标值</title>

</head>
<body>
<script type="text/javascript" src="<%=basePath%>resources/js/socialChannelExpand/customer_sales_target_value.js"></script>
  <script type="text/javascript" src="<%=basePath%>resources/js/plugin/jquery.validate.js"></script> 
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
  <li class="active">KA客户销量目标值</li>
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
			      	  <td> <input name="endMonth" type="text" style="width:130px" onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-%M'})" readonly="readonly"class="form-text select"/></td>
			      	 
			      	   <td > <button id="btnSearch" type="button" class="btn btn-primary" style="width:100px">查询</button> <button id="btnAdd" type="button" class="btn btn-primary" style="width:100px">新增</button> </td>
			      	</tr>
			    </table>
			 </div>
	    </div>
	    <div class="row">
		      <div class="col-xs-3">
		         <div class="panel panel-default" style=" width: 100%;">
					  <div class="panel-body" >
					     <p>KA客户销售累计</p>
					   	 <h1 id="hKakhxslj" style="float: right;">   </h1>
					  </div>
				  </div>
	     
	   		  </div>
		  	 <div class="col-xs-3">
		  	     <div class="panel panel-default" style=" width: 100%;">
					  <div class="panel-body" >
					  	 <p>完成情况占比</p>
					   	 <h1 id="hWcqkzb">  </h1>
					  </div>
				  </div>
		  	 
		  	 </div>
		  	 <div class="col-xs-3">
		  	     <div class="panel panel-default" style=" width: 100%;">
					  <div class="panel-body" >
					  	 <p>得分</p>
					   	 <h1 id="hDf">   </h1>
					  </div>
				  </div>
		  	 
		  	 </div>
			<div class="col-xs-3">
				<div class="panel panel-default" style=" width: 100%;">
					<div class="panel-body" >
						<p>时间进度</p>
						<h1 id="hSjjd">    </h1>
					</div>
				</div>

			</div>
	    </div>

	  <%--<div id="toolbar">--%>
		  <%--<div class="btn-group">--%>
			  <%--<button class="btn btn-default">--%>
				  <%--<i class="glyphicon glyphicon-plus"></i>--%>
			  <%--</button>--%>
			  <%--<button class="btn btn-default">--%>
				  <%--<i class="glyphicon glyphicon-heart" id="heartBtn"></i>--%>
			  <%--</button>--%>
			  <%--<button class="btn btn-default">--%>
				  <%--<i class="glyphicon glyphicon-trash"></i>--%>
			  <%--</button>--%>
		  <%--</div>--%>
	  <%--</div>--%>
<!--  <button type="button" class="btn btn-success dropdown-toggle" id="addRowbtn">
           <span class="glyphicon glyphicon  glyphicon-plus" aria-hidden="true"></span>增加
         </button> -->
	    <div class="row"style="margin-bottom: 10px;">
	       <table id="grid"></table>
	       <div id="pager"></div>
	    </div>

		  <div class="panel panel-default">
			  <div class="panel-body" style=" " >
				  <div id="char_bar" style="width: 100%;height: 500px;"/>
			  </div>
		  </div>

	  </div>
 </div>
 
</div>

<div class="modal fade" id="addModal"  role="dialog" aria-labelledby="addModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
						aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="addModalLabel">
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
						     <label for="inputPassword3" class="col-sm-2 control-label">KA客户销量目标值:</label>
						    <div class="col-sm-3">
						            <input id="customer_sales" name ="customer_sales" class="form-text select" >
						    </div>
						  </div>
						   <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">KA客户代码:</label>
						    <div class="col-sm-3">
						          <select name="customer_code" id="customer_code"  multiple="multiple" style=" width: 100%;" class="">
						          </select>
						    </div>
						     <label for="inputPassword3" class="col-sm-2 control-label">目标效率:</label>
						    <div class="col-sm-3">
						          <input id="target_efficiency" name ="target_efficiency" class="form-text select" >
						    </div>
						  </div>
				   </form>
				 
				 
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" 
						data-dismiss="modal">取消
				</button>
				<button id="submitBtn"  type="button" class="btn btn-primary">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal --> 


</body>
</html>