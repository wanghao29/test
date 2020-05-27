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
<title>客商特征统计</title>
</head> 

<body class="container">
<style   type="text/css">
/* .absolute-div,.searchable-select,.searchable-select-dropdown,.searchable-select-holder*/
.absolute-div{
	width:50%;
}
.content>div div {
  	color: #FFFFFF !important;
}
.row-height{
	height:390px;
}
.box-content{
	height:390px;
}
</style>
 <script type="text/javascript" src="<%=basePath%>resources/js/customerIdentifyInfo/customerIdentifyCount.js?"></script>
<div class="row">
	<ol class="breadcrumb">
	  <li>客商特征</li>
	  <li class=" ">客商特征统计</li>
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
		    </div> 
	 </div>
</div> 


<div style="margin-top:30px;">
<div class="row row-height">
	<ul class="list-li-3 mt-20 clearfix">
		<li>
			<div class="box-head  ">
				<span class="title" style="width:245px;" title1="本月从终端公司进货的客商数" >终端公司覆盖客户数量</span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
	            <div class="box-content"  id="ZDCUSTAMOUNT">
	            </div>
	        </div>
	    </li>
		<li>
			<div class="box-head">
				<span class="title" title1="本月从终端公司进货的客商对应供货网点的零售量" style="width:245px;">终端公司覆盖客户零售量</span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
	            <div class="box-content"  id="ZDCUSTSOAMOUNT">
	            </div>
	        </div>
	    </li>	
		<li>
			<div class="box-head">
				<span class="title" title1="本月从终端公司进货的客商的进货量" style="width:245px;">终端公司覆盖客户提货量</span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;" >
	            <div class="box-content"  id="ZDCUSTSIAMOUNT">
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
				<span class="title" title1="本月从终端公司进货的客商所覆盖的铺货网点数" style="width:245px;" >终端公司客户覆盖网点数</span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
	            <div class="box-content"  id="ZDCUSTCUSTAMOUNT">
	            </div>
	        </div>
	    </li>		    
		<li>
			<div class="box-head">
				<span class="title" title1="本月由终端公司供货的门店的零售量" style="width:245px;">终端公司供货网点销量</span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
	            <div class="box-content"  id="ZDCUSTHALLSALL">
	            </div>
	        </div>
	    </li>	
		<li>
			<div class="box-head ">
				<span class="title" title1="和终端公司有合作关系的客商销量规模情况" style="width:245px;">终端公司客户覆盖存量用户数</span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
	            <div class="box-content"  id="ZDCUSTCNTSTOCK" >
	            </div>
	        </div>
	</ul>
</div>
</div>

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
	    url:  "${basePath}/customerIdentifyInfo/pageInit.do",
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