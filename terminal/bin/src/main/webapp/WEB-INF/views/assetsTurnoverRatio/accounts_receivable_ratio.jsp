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
<title>三个月以上应收账款占比</title>

</head>
<body>
<script type="text/javascript" src="<%=basePath%>resources/js/assetsTurnoverRatio/accounts_receivable_ratio.js"></script>
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
  <li class="active">三个月以上应收账款占比</li>
 
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
			      	</tr>
			    </table>
			 </div>
	    </div>
	    <div class="row">
		      <div class="col-xs-3">
		         <div class="panel panel-default" style=" width: 100%;">
					  <div class="panel-body" >
					     <p>90（不含）-180天（含）应收账款占比</p>
					   	 <h1 id="hYszkzb90" style="float: right;">4.19  </h1>
					  </div>
				  </div>
	     
	   		  </div>
		  	 <div class="col-xs-3">
		  	     <div class="panel panel-default" style=" width: 100%;">
					  <div class="panel-body" >
					  	 <p>90（不含）-180天（含）应收账款得分</p>
					   	 <h1 id="hYszkdf90">41.9%</h1>
					  </div>
				  </div>
		  	 
		  	 </div>
		  	 <div class="col-xs-3">
		  	     <div class="panel panel-default" style=" width: 100%;">
					  <div class="panel-body" >
					  	 <p>180天（不含）以上应收账款占比</p>
					   	 <h1 id="hYszkzb180">0.1亿元  </h1>
					  </div>
				  </div>
		  	 
		  	 </div>
			<div class="col-xs-3">
				<div class="panel panel-default" style=" width: 100%;">
					<div class="panel-body" >
						<p>180天（不含）以上应收账款得分</p>
						<h1 id="hYszkdf180">0.1亿元  </h1>
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
	       <div id="toolbar"></div>
	    </div>

		  <div class="panel panel-default">
			  <div class="panel-body" style="height: 1000px" >
			  <div> 月份： <span id="yf" style="color:blue;"></span></div>
				  <div id="char_bar" style="width: 100%;height:500px;"></div>
				  <div id="char_bar2" style="width: 100%;height: 500px;"></div>
				<!--   <div id="char_bar3" style="width: 100%;height: 500px;"></div> -->
			  </div>
		  </div>

	    <%--<div class="row" style="margin-top: 10px;">--%>
	       <%--<div class="col-xs-12">--%>
		    <%----%>
		    <%--</div>--%>

			<%--&lt;%&ndash;<div class="col-xs-4">&ndash;%&gt;--%>
				<%--&lt;%&ndash;<div class="panel panel-default" style=" width: 100%;height: 500px;">&ndash;%&gt;--%>
					<%--&lt;%&ndash;<div class="panel-body" style=" " >&ndash;%&gt;--%>
						<%--&lt;%&ndash;<div id="char_bar2" style="width: 50%;height: 500px;"/>&ndash;%&gt;--%>
					<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
				<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
			<%--&lt;%&ndash;</div>&ndash;%&gt;--%>

			<%--&lt;%&ndash;<div class="col-xs-4">&ndash;%&gt;--%>
				<%--&lt;%&ndash;<div class="panel panel-default" style=" width: 100%;height: 500px;">&ndash;%&gt;--%>
					<%--&lt;%&ndash;<div class="panel-body" style=" " >&ndash;%&gt;--%>
						<%--&lt;%&ndash;<div id="char_bar3" style="width: 50%;height: 500px;"/>&ndash;%&gt;--%>
					<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
				<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
			<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
	    <%--</div>--%>
		  <%--<div id="char_bar" style="width: 100%;height: 500px;"/>--%>
		  <%--<div id="jqmeter-container"></div>--%>

	  </div>
 </div>
 
</div>

 


</body>
</html>