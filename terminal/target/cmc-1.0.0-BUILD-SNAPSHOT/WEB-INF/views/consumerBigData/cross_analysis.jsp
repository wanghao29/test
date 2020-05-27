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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>交叉分析表</title>
</head>
<body>
<style type="text/css">
.mt ul li{
 margin-top: 25px; 
}
.mt ul li label{
    width: 130px;
}

.panel-height{
width: 100%;
height: 350px;
}
.panel-height-two{
width: 100%;
height: 350px;
}
.title-no-border{
	color: #5bfdff;
	font-size: 18px;
	margin-left: 12px;
}
.conditions_select{
  width: 100%;

}
.conditions_select  li:first-child{
   color: #5bfdff;
   font-weight: 800;
}
.conditions_select li{
	float: left;
	/* margin-right: 20px; */
	width: 21%;
	list-style: none;
}

.searchable-select,.searchable-select-dropdown{
	width:100%;
}
.mt ul li label {
    width: 170px;
} 
.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
    height: 27px;
    margin-top: 15px;
}
.ui-jqgrid .ui-common-table {
    padding-left: 2px;
}
.content div{
  color: #FFFFFF;
}


.slider.slider-horizontal ,.absolute-div{
    width: 36%;
}

input[type="radio"], input[type="checkbox"] {
    width: 16px;
    height: 16px;
}
th.ui-th-column div{
    white-space:normal !important;
    height:auto !important;
    padding:0px;
}
.ui-jqgrid tr.jqgrow td { white-space: normal !important; height:auto; } 

</style>
<link href="<%=basePath%>resources/css/cube.css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>resources/js/consumerBigData/cross_analysis.js"></script>
<h1>交叉分析表</h1>
     <div  class="row">	
			 	<form id="queryForm">
			 	<div class="row" style="">
			 	<div class="col-xs-1">
			 	</div>
			 	 				<div class="col-xs-1">
			 	 				   <p>
				 	 				   	<select name="tag1" class="select" style="width: 100%;" id="citySelect">
				 	 				   		       		<shiro:hasPermission name="GZ"><option value="广州">广州</option></shiro:hasPermission>
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
						       		</p>
			 	 				</div>
			
								<div class="col-xs-2" style="margin-left:1%;">
								   	   
		   	  		<input id="billcyc" class="form-text select startDay" name="datetime" type="text" style="width:200px" onClick="WdatePicker({dateFmt:'yyyyMM'})" readonly="readonly"class="form-text"/>
								</div>	
			 	 			
			 	 			<div class="col-xs-1"> <button type="button" id="searchBtn"  class="btn btn-primary" style="width:100%"> 查询</button></div>
			 	</div>
			 	</form>
 	</div>
 	<div  class="row"  style="margin-top: 100px;">	
        <p ><span class="title-no-border"><span style="background-color: #5bfdff;">|</span >&nbsp;查询结果</span></p>
    	<div class="col-xs-12" style="padding-left:8px;">
    	   <table id="list"></table> 
			   <div id="pager"></div>
		  </div> 	
 	</div>	
 	<div  class="row" >		
		<div  class="col-xs-12" style="margin-left:16px;padding-left:16px;">
			 
			     <table id="list" style="padding-left:16px;"></table> &nbsp;
			     <div id="pager"></div> 
		</div>
	</div> 
</body>
</html>