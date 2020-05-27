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
<title>费用进度均衡性</title>

</head>
<body>
<script type="text/javascript" src="<%=basePath%>resources/js/totalprofit/fee_progress_balance.js"></script>
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
  <li class="active">费用进度均衡性</li>
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
			      	 
			      	   <td >  <button id="btnSearch" type="button" class="btn btn-primary" style="width:100px">查询</button> </td>
			      	   <td >  <button id="modify_y" type="button" class="btn btn-primary" style="width:100px" onclick="adjustment();">调整</button> </td>
			      	   <td >  <button id="modify_log" type="button" class="btn btn-primary" style="width:100px" onclick="adjustLog();">调整日志</button> </td>
			      	</tr>
			    </table>
			 </div>
	    </div>
	    <div class="row">
		      <div class="col-xs-4">
		         <div class="panel panel-default" style=" width: 100%;">
					  <div class="panel-body" >
					     <p>本月考核费用</p>
					   	 <h1 id="hBykhfy" style="float: right;">4.19  </h1>
					  </div>
				  </div>
	     
	   		  </div>
		  	 <div class="col-xs-4">
		  	     <div class="panel panel-default" style=" width: 100%;">
					  <div class="panel-body" >
					  	 <p>本月进度</p>
					   	 <h1 id="hByjd">41.9%</h1>
					  </div>
				  </div>
		  	 
		  	 </div>
		  	 <div class="col-xs-4">
		  	     <div class="panel panel-default" style=" width: 100%;">
					  <div class="panel-body" >
					  	 <p>累计考核费用</p>
					   	 <h1 id="hLjkhfy">0.1亿元  </h1>
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

	    <div class="row"style="margin-bottom: 10px;">
	       <table id="grid"></table>
	    </div>

		  <div class="panel panel-default">
			  <div class="panel-body" style=" " >
				  <div id="char_bar" style="width: 100%;height: 500px;"/>
			  </div>
		  </div>

	   <input type="hidden" id="select_yf" /><!-- 选中行的月份 -->
		<input type="hidden" id="flag"  value="费用进度均衡性"/><!-- 标记所属的指标 --> 

	  </div>
 </div>
 
</div>

 


</body>
</html>