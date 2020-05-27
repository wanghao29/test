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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>厅店特征统计</title>
</head> 

<body class="container">
<style   type="text/css">
/* .absolute-div,.searchable-select,.searchable-select-dropdown,.searchable-select-holder*/
.absolute-div{
	width:50%;
}
/* .content>div div {
  	color: #FFFFFF !important;
} */

.row-height{
	height:390px;
}
.box-content{
	height:390px;
}
</style>
 <script type="text/javascript" src="<%=basePath%>resources/js/hallIdentifyInfo/hallIdentifyCount.js?"></script>
<div class="row">
	<ol class="breadcrumb">
	  <li><a href="#">厅店特征</a></li>
	  <li class=" ">厅店特征统计</li>
	</ol>
</div>
 <div style="margin-left: 20px;margin-right: 20px;margin-bottom: 20px;"> 
	<div class="row" style="">	  
      		<div class="row top-select">
 	 				<div class="col-xs-1">
	 	 				   	<select name="areaname" class="select" style="width: 100%;" id="citySelect">
				       		</select>    		 
 	 				</div>
 	 				<div class="col-xs-1">	 				
				   	     <input name="startMonth" id="startMonth" type="text" style="width:100%" readonly="readonly" class="form-text select startMonth"
				   	  		onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'#F{$dp.$D(\'endMonth\')}',onpicked:pageInit})" value="${vo.startMonth}"/>			       	
 	 				</div>
 	 				<div class="col-xs-1"> 	 				
				   	     <input name="endMonth" id="endMonth" type="text" style="width:100%" readonly="readonly" class="form-text select prevMonth"
				   	  		onClick="WdatePicker({dateFmt:'yyyyMM',minDate:'#F{$dp.$D(\'startMonth\')}',maxDate:'%y-{%M-1}',onpicked:pageInit})" value="${vo.endMonth}"/>			       	
 	 				</div> 	 	 				

<!-- 	 				        		       
			        <div class="col-xs-1" >
			        	<a href="${basePath}/hallIdentifyInfo/normalModalShow.do" data-toggle="modal" data-target="#normalModal" style="height:100%;padding-left:20%;">常态特征查询</a>	         	
			        </div>
			        <div class="col-xs-1" >
			        	<a href="${basePath}/hallIdentifyInfo/dynamicModalShow.do" data-toggle="modal" data-target="#dynamicModal" style="height:100%;padding-left:20%;">动态特征查询</a>	         	
			        </div>	
 -->			        		        
		    </div> 
	 </div>
</div> 


<div style="margin-top:30px;">
<div class="row row-height">
	<ul class="list-li-3 mt-20 clearfix">
		<li>
			<div class="box-head">
				<span class="title" title1="TIMES系统登记有零售销量的所有门店数量" style="width:200px;">广东移动覆盖门店数量</span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
	            <div class="box-content"  id="GDYDHALLAMOUNT">
	            </div>
	        </div>
	    </li>			
		<li>
			<div class="box-head">
				<span class="title" title1="TIMES系统登记的门店的总销量" style="width:200px;">广东移动覆盖门店销量</span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
	            <div class="box-content"  id="GDYDHALLSALL">
	            </div>
	        </div>
	    </li>	
 		<li>
			<div class="box-head">
				<span class="title" title1="从省BI数据中统计门店覆盖的商圈的常在客户群数量" style="width:200px;">存量客户数</span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;" >
	            <div class="box-content"  id="CNTSTOCK">
	            </div>
	        </div>
	    </li>	   	    	
	</ul>
</div>

<div class="row"> 
	<p>
		<span  style="color: #67f8ff;">&nbsp;</span>
	</p>
</div>
<div class="row row-height">
	<ul class="list-li-3 mt-20 clearfix">
		<li>
			<div class="box-head">
				<span class="title" title1="TIMES系统登记有零售销量且由终端公司供货的门店数" style="width:200px;">终端公司覆盖门店数量</span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
	            <div class="box-content"  id="ZDHALLAMOUNT" >
	            </div>
	        </div>
	    </li>
		<li>
			<div class="box-head">
				<span class="title" title1="TIMES系统登记的由终端公司供货门店的总零售量" style="width:200px;">终端公司覆盖门店销量</span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
	            <div class="box-content"  id="ZDHALLSALL">
	            </div>
	        </div>
	    </li>	
		<li>
			<div class="box-head">
				<span class="title" title1="TIMES系统登记的非终端公司供货的门店零售量" style="width:200px;" >非终端公司供货门店零售量</span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
	            <div class="box-content"  id="KLL">
	            </div>
	        </div>
	    </li>		    	    	
	</ul>
</div>
</div>


<!-- 
<div class="modal fade" id="normalModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" style=" width: 70%;">
    <div class="modal-content">

    </div>
  </div>
</div>

<div class="modal fade" id="dynamicModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" style=" width: 70%;">
    <div class="modal-content">

    </div>
  </div>
</div>
-->


<script type="text/javascript">
$(document).ready(function() {
	pageInit();
});


//页面初始化
function pageInit(){
	var data = {};
	data["areaname"] = $("select[name='areaname']").val();
	data["startMonth"] = $("input[name='startMonth']").val();
	data["endMonth"] = $("input[name='endMonth']").val();
	$.ajax({
	    type: "post",
	    url:  "${basePath}/hallIdentifyInfo/pageInit.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){		    	
	    	showPortrays(result.portrays);
	    }
	});
	
};
</script>

</body>
</html>