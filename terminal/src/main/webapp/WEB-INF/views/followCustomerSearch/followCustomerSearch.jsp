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
<title>关注客户搜索</title>

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

</style>
    <script type="text/javascript" src="<%=basePath%>resources/js/followCustomerSearch/followCustomerSearch.js?"></script>
    
    <div class="row">
		<ol class="breadcrumb">
		  <li><a href="#">关注客户搜索</a></li>
		</ol>
	</div>
    
 	<form id="queryForm">
 	<div class="row" style="">

 	 				<div class="col-xs-1">
 	 				   <p>
<!-- 	 				   	<label>查询地市:</label>  -->	 
	 	 				   	<select name="tag1" class="select" style="width: 100%;" id="citySelect">
				       		</select>
			       		</p>
 	 				</div>

					<div class="col-xs-2" style="margin-left:1%;">
					   	     <input name="startDay" id="startDay" type="text" style="width: 40%;" class="form-text select startDay"
					   	  		onClick="WdatePicker({dateFmt:'yyyyMMdd',maxDate:'#F{$dp.$D(\'endDay\')}',onpicked:getMaxValue})"  readonly="readonly"/>
					   	     &nbsp;至&nbsp;
					   	     <input name="endDay" id="endDay"   type="text" style="width: 40%;" class="form-text select endDay" value="${vo.endDay}"
					   	  		onClick="WdatePicker({dateFmt:'yyyyMMdd',minDate:'#F{$dp.$D(\'startDay\')}',maxDate:'%y-{%M-1}-%ld',onpicked:getMaxValue})" readonly="readonly"/>			   	  		
					</div>	
 	 			
 	 			<div class="col-xs-1"> <button type="button" onclick="query()" class="btn btn-primary" style="width:100%"> 查询</button></div>

 	 	
 	 	

<!-- 	
 	 		<div class="col-xs-2"> <button type="button" class="btn btn-primary" style="width:100px"> 创建查询模板</button></div>
 	 		<div class="col-xs-2"> <button type="button" class="btn btn-success" style="width:100px"> 保存模板</button></div>
 	 		<div class="col-xs-3"> <button type="button" class="btn btn-warning" style="width:100px"> 导入模板</button></div>
 --> 	  	 		
 		

 	
 	</div>
 	
 	<div  class="row" >
 	    <!-- 第一行第一个 -->
 	    <p ><span class="title-no-border"><span style="background-color: #5bfdff;">|</span >&nbsp;搜索范围</span></p>
		<div  class="col-xs-3">
 			<div class="panel panel-default panel-height" style="  ">
				  <div class="panel-body mt" >
				   	    <p><span class=" "><span style="background-color: yellow;">|</span>&nbsp;营销活动筛选<span style="color: #5bfdff;">(天)</span></span><span style="float: right;"> <input type="checkbox" class="cb_parent" style=" "></span></p>
					    <ul style="list-style: none;"   id="type1">
					    	<li> 
					    	    <label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;新增换机数</label>
					    		<input id="cntnew" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
					    	</li>
					    	<li> 
					    	    <label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;全网通终端入网数</label>
					    		<input id="cntother" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
					    	</li>
							<li>
								<label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;4g+终端入网数</label>
							 <!--    <b>  10</b>  -->
							    <input id="cnt4gp" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
							   <!--  <b> 1000</b> -->
							</li>
				<!-- 			<li>
								<label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;移动购机入网数</label>
							    <b>  10</b> 
							    <input id="cntyd" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
							    <b> 1000</b>
							</li> -->
							<li>
							 <label style="">	<input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;自带机入网数</label>
							 <!--    <b>  10</b>  -->
							    <input id="cntself" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
							   <!--  <b> 1000</b> -->
							</li>							 
					   </ul>				        
				  </div>
		    </div>				
 	    </div> 	    
 	    
 		
 		<div  class="col-xs-3">
 			<div class="panel panel-default panel-height" style="  ">
				  <div class="panel-body mt" >
				   	<p><span class=" "><span style="background-color: yellow;">|</span>&nbsp;引入产品适销情况<span style="color: #5bfdff;">(天)</span></span><span style="float: right;"> <input type="checkbox" class="cb_parent" style=" "></span></p>
				    <ul style="list-style:none;"id="type2">
				    	<li style="position:relative;"> 
				    	    <label style="float:left;"><input type="checkbox" class="cb_child cb_select" style=" ">&nbsp;选择品牌</label>
				    	    <div style="float:left;">
				    	        <div style="position:absolute;" class="absolute-div">
				    				<select id = "brandname" class="select" style="width: 100%;float:left;" >
				    				
				    				
				    				</select>
				    			</div>
					        </div>
					        <div style="clear:both"></div>
				    	</li>
				    	<li style="position:relative;"> 
				    	    <label style="float:left;"><input type="checkbox" class="cb_child cb_select" style=" ">&nbsp;选择机型</label>
				    	    <div style="float:left;">
				    	        <div style="position:absolute;"  class="absolute-div">
				    				<select id = "spec"  class="select" style="width: 100%;float:left;" >
				    				
				    				</select>
				    			</div>
					        </div>
					        <div style="clear:both"></div>
				    	</li>				    	
					
						<li>
						 <label style="">	<input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;分销量</label>
						 <!--    <b>  10</b>  -->
						    <input id="amoutSi" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
						   <!--  <b> 1000</b> -->
						</li>								 
				    </ul>						        
				 </div>
			</div> 				
 		</div>
		<div  class="col-xs-3">
 			<div class="panel panel-default panel-height" style="  ">
				<div class="panel-body mt" >
				   	<p><span class=" "><span style="background-color: yellow;">|</span>&nbsp;提货偏好</span><span style="float: right;"> <input type="checkbox" class="cb_parent" style=" "></span></p>
				    <ul style="list-style: none;"  id="type3" >
				    	<li style="position:relative;"> 
				    	    <label style="float:left;"><input type="checkbox" class="cb_child cb_select" style=" ">&nbsp;品牌偏好</label>
				    	    <div style="float:left;">
				    	        <div style="position:absolute;" class="absolute-div">
				    				<select id = "tag11"  class="select" style="width: 100%;float:left;" ></select>
				    			</div>
					        </div>
					        <div style="clear:both"></div>
				    	</li>
				    	<li style="position:relative;"> 
				    	    <label style="float:left;"><input type="checkbox" class="cb_child cb_select" style=" ">&nbsp;机型偏好</label>
				    	    <div style="float:left;">
				    	        <div style="position:absolute;"  class="absolute-div"">
				    				<select id = "tag12"  class="select" style="width:100%;float:left;" ></select>
				    			</div>
					        </div>
					        <div style="clear:both"></div>
				    	</li>					    
						<li>
							<label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;提货数量</label>
						 <!--    <b>  10</b>  -->
						    <input id="tag21" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
						   <!--  <b> 1000</b> -->
						</li>
						<li>
							<label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;提货次数</label>
						 <!--    <b>  10</b>  -->
						    <input id="tag16" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
						   <!--  <b> 1000</b> -->
						</li>
						<li>
						 <label style="">	<input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;提货金额</label>
						 <!--    <b>  10</b>  -->
						    <input id="tag20" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
						   <!--  <b> 1000</b> -->
						</li>								 
				    </ul>						        
				</div>
			</div>		 		
 		</div>
 		
 				<div  class="col-xs-3">
 			<div class="panel panel-default panel-height" style="  ">
				  <div class="panel-body mt" >
				   	    <p><span class=" "><span style="background-color: yellow;">|</span>&nbsp;DM流向</span><span style="float: right;"> <input type="checkbox" class="cb_parent" style=" "></span></p>
					    <ul style="list-style: none;"   id="type7">
					    	<li style="margin-top:10px;"> 
					    	    <label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;DM串货率</label>
					    	    <input id="dmStockRate" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/>
					    	</li>
<!-- 					    	<li style="margin-top:10px;"> 
					    	    <label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;异网渗透率</label>
					    	    <input id="diffNetRate" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
					    	</li> -->
							<li style="margin-top:10px;">
								<label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;入网占比</label>
							<!--  
							    <input id="diff_net_rate" type="text" class="span2_no" data-slider-min="0" data-slider-max="1000" data-slider-step="5" data-slider-value="[250,450]"/>
							--> 
							    <input id="netInRatio" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
							</li>
						<!-- 	<li style="margin-top:10px;">
								<label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;黑名单客户占比</label>
							    <b>  10</b> 
							    <input id="blackCustRatio" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
							    <b> 1000</b>
							</li>
							<li >
							 <label style="">	<input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;疑似养卡客户占比</label>
							    <b>  10</b> 
							    <input id="susCarkRatio" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
							    <b> 1000</b>
							</li>	
							<li style="margin-top:10px;">
							 <label style="">	<input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;一号三机客户占比</label>
							    <b>  10</b> 
							    <input id="oneThreeRatio" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
							    <b> 1000</b>
							</li>	 -->													 
					   </ul>				        
				  </div>
		    </div>				
 	    </div>	 
 		
 		
<!-- 		<div  class="col-xs-3">
 			<div class="panel panel-default panel-height" style="  ">
				  <div class="panel-body mt" >
				   	    <p><span class=" "><span style="background-color: yellow;">|</span>&nbsp;PSI流速</span><span style="float: right;"> <input type="checkbox" class="cb_parent" style=" "></span></p>
					    <ul style="list-style: none;"   id="type4">					    	
					    	<li style="position:relative;"> 
					    	    <label style="float:left;"><input type="checkbox" class="cb_child cb_select" style=" ">&nbsp;品牌偏好</label>
					    	    <div style="float:left;">
					    	        <div style="position:absolute;" class="absolute-div">
					    				<select id = ""  class="select" style="width: 100%;float:left;" >
					    				    <option value="">苹果</option>
					    				</select>
					    			</div>
						        </div>
						        <div style="clear:both"></div>
					    	</li>
					    	<li style="position:relative;"> 
					    	    <label style="float:left;"><input type="checkbox" class="cb_child cb_select" style=" ">&nbsp;机型偏好</label>
					    	    <div style="float:left;">
					    	        <div style="position:absolute;"  class="absolute-div"">
					    				<select id = ""  class="select" style="width:100%;float:left;" ></select>
					    			</div>
						        </div>
						        <div style="clear:both"></div>
					    	</li>						    	
					    	
							<li>
								<label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;SI分销量</label>
							    <b>  10</b> 
							    <input id="" type="text" class="span2_no" value="" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
							    <b> 1000</b>
							</li>
							<li>
								<label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;DM激活率</label>
							    <b>  10</b> 
							    <input id="" type="text" class="span2_no" value="" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
							    <b> 1000</b>
							</li>
							<li>
							 <label style="">	<input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;市场库存匹配度</label>
							    <b>  10</b> 
							    <input id="" type="text" class="span2_no" value="" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
							    <b> 1000</b>
							</li>							 
					   </ul>				        
				  </div>
		    </div>				
 	    </div> -->
 	</div>
 	
 	<div  class="row" >
 	    <!-- 第二行第一个 -->
 		<div  class="col-xs-3 ">
 			<div class="panel panel-default panel-height" style=" ">
						  <div class="panel-body mt" >
						   	<p>
						   		<span class=" "><span style="background-color: yellow;">|</span>&nbsp;客流量信息</span>
						   		<span style="float: right;"> 
						   			<input type="checkbox" class="cb_parent" style="hehhe">
						   		</span>
						   	</p>
						    <ul style="list-style: none;" id="type5">
								<li  >
									<label style="">
										<input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;存量用户数
									</label>
								    <input id="cntstock" name="" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/>
								 <!--  <input id="cntstock" name="" type="text" class="span2"  data-slider-min="0" data-slider-max="1000" data-slider-step="5" data-slider-value="[250,450]"/>  --> 
								</li>
								<li >
									<label style=""><input type="checkbox"  class="cb_child cb_slider" style=" ">&nbsp;入网量</label>
								 <!--    <b>  10</b>  -->
								    <input id="netinVal" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
								   <!--  <b> 1000</b> -->
								</li>
								<li >
									<label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;客流量</label>
								 <!--    <b>  10</b>  -->
								    <input id="passengerVol" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
								   <!--  <b> 1000</b> -->
								</li>
								<li  >
									<label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;存量客户群</label>
								 <!--    <b>  10</b>  -->
								    <input id="usrNbrStock" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
								   <!--  <b> 1000</b> -->
								</li>
						    </ul>
						        
						  </div>
			</div>
 		</div>
 	    
		<div  class="col-xs-6">
 			<div class="panel panel-default panel-height" style="  ">
				  <div class="panel-body mt" >
				   	    <p><span class=" "><span style="background-color: yellow;">|</span>&nbsp;厅店扩展</span><span style="float: right;"> <input type="checkbox" class="cb_parent" style=" "></span></p>
					    <ul style="list-style: none;"  id="type6" >
					    	<li> 
					    	    <label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;覆盖门店数</label>
					    		<input id="count" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
					    	</li>
					    		<li>
							<label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;我司零售量</label>
						 <!--    <b>  10</b>  -->
						    <input id="amoutSoZd1" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
						   <!--  <b> 1000</b> -->
						</li>
						<li>
							<label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;零售量</label>
						 <!--    <b>  10</b>  -->
						    <input id="amoutSo" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/> 
						   <!--  <b> 1000</b> -->
						</li>
					    	
						<!-- 	<li>
								<label style=""><input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;厅店客流量</label>
									<input id="usrNbrHallVal" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/>
							</li>
							<li>
							 <label style="">	<input type="checkbox" class="cb_child cb_slider" style=" ">&nbsp;厅店覆盖客户数</label>
							 	<input id="usrNbrHall" type="text" class="span2" data-slider-min="0" data-slider-max="0" data-slider-step="0" data-slider-value="[0,0]"/>
							</li>	 -->						 
					   </ul>				        
				  </div>
		    </div>				
 	    </div>
 	    

 	</div>	 
 	</form>
 	
	<div  class="row" >
		<p ><span class="title-no-border"><span style="background-color: #5bfdff;">|</span >&nbsp;所选条件</span></p>
		<div  class="col-xs-12">
			<div class="panel panel-default" style="  ">
				  <div class="panel-body" >
				       	<div  class="col-xs-12" id="query_conditions">
<!-- 				       		<ul class="conditions_select">
				       		   <li >客流量信息1</li>
				       		   <li>存量用户数: <span>100 </span>-<span>200</span></li>
				       		   <li>存量用户数: <span>100 </span>-<span>200</span></li>				       		    
				       		</ul> -->
				       	</div>
				       
				  </div>
			</div>
		</div>
	</div>

    <div  class="row">	
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




<script type="text/javascript">
$(document).ready(function() {
	//时间控件设置初始时间
	var yearMonth =getPrevMonthValue();
	//var yearMonth ="201901";
	var year = yearMonth.substring(0,4);
	var month = yearMonth.substring(4,6);
	var startDay = year  + month  + '01';
	var day = new Date(year,month,0); 
	var endDay = year + month + day.getDate();
	$("#startDay").val('20191001');
	$("#endDay").val('20191031');
	
	pageInit();	
});


function jqgridReload(){
	$("#list").jqGrid('clearGridData'); 
	$("#list").jqGrid('setGridParam',{  
		  postData : $("form").serialize(),
		  datatype:'json',
	      page:1
	}).trigger("reloadGrid");
};
function jqgridInit(){
	  jQuery("#list").jqGrid(
	      {
	        url:"${basePath}followCustomerSearch/query.do",
	        mtype:'post',
	        datatype: "json",
	        loadonce:true,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:$("form").serialize(),
	        //scroll:1, 滚动加载
	        //datatype : "local",
	        
	        colNames : [ '客商编码', 'SCM编码', '客商名称', '客商类型', '客商子类型','所属地市','注册地市', '客户画像' , '常态特征','动态特征'],
	        colModel : [ 
	                   //sortable : 默认true
	                   //search   : 默认true
	                   //sorttype : "float"、"int"
	                   //searchoptions:{sopt:['eq','bw']：op=、 eq=等于、ne=不等、lt=小于、le=小于等于、gt=大于、
	                   //ge=大于等于、bw=开始于、bn=不开始、in=在内、ni=不在内、ew=结束于、en=不结束于、cn=包含、nc=不包含
	                     {name : 'orgacode',index : 'orgacode',sorttype : "string",searchoptions:{sopt:['cn']}}, 
	                     {name : 'tag3',index : 'tag3',sorttype : "string",searchoptions:{sopt:['eq','lt','le','gt','ge','ne']}}, 
	                     {name : 'tag2',index : 'tag2',sorttype : "string",searchoptions:{sopt:['cn']}}, 
	                     {name : 'tag6',index : 'tag6',sorttype : "string",searchoptions:{sopt:['cn']}}, 
	                     {name : 'tag7',index : 'tag7',sorttype : "string",searchoptions:{sopt:['cn']}}, 
	                     {name : 'tag1',index : 'tag1',sorttype : "string",searchoptions:{sopt:['cn']}}, 
	                     {name : 'month',index : 'month',sorttype : "string",hidden:true,searchoptions:{sopt:['cn']}}, 
	                     {name:'custPort',index:'custPort',sortable: false, search:false,formatter: custPortLink},
	                     {name:'normalIdentify',index:'normalIdentify',sortable: false,search:false, formatter: normalIdentifyLink},
	                     {name:'dynamicIdentify',index:'dynamicIdentify',sortable: false, search:false,formatter: dynamicIdentifyLink}
	                   ],
	                   
	                   gridComplete:function(){//表格加载执行 
	                	   $("#list").setGridWidth($(window).width()*0.965);
	                  	 
	                  	   $(window).resize(function(){  
	                  		 $("#list").setGridWidth($(window).width()*0.965);
	                       });
	                 	},             
 	        rowNum:10,        
	        rowList : [10,20,50,100], 
	        rownumbers: true,    //行首添加顺序编码
	        rownumWidth: 60,     //行首添加顺序编码的列宽
	        autowidth: true,     //表格宽度自动适应父div
	        height : "100%",     //表格宽度自动适应行数
	        sortorder: "asc",    //指定列排序的次序
	        viewrecords : true,  //显示当前记录，和总记录数 
	        sortname: 'invdate', //默认排序
	        repeatitems: true,   //是否可重复
	        forceFit: true,
	        shrinkToFit:true,
	        autoScroll: true,
	        pager: '#pager',     //指定分页组件所在div id
	        jsonReader: {        //描述json 数据格式的数组,需修改
	        	root: 'list',
		    	page: "current",        // json中代表当前页码的数据
		    	total: "pages",         // json中代表页码总数的数据
		    	records: "total",       // json中代表数据行总数的数据
		    	repeatitems: false,     // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
		    	cell: "cell",
		    	id: "fRoleId",
		    	userdata: "userdata",
		    },               
	        caption : "",
	      });
	  
	  //jQuery("#list").jqGrid('filterToolbar',{searchOperators : true});
	  //jQuery("#list").jqGrid('navGrid','#pager',{add:false,edit:false,del:false});

};
function custPortLink(cellValue, options, rowdata, action){  //rowdata.orgacode
    var url = "<%=basePath%>customerChannel/index.do";
	var startMonth = $("input[name='startDay']").val().substring(0,6);
	var endMonth =  $("input[name='endDay']").val().substring(0,6);
    return "<a href='#' style='color: #5bfdff;' onclick=\"$.StandardPost('"+url+"',{'custname':'"+rowdata.tag2+"','startMonth':'"+startMonth+"','endMonth':'"+endMonth+
    	"','tag1':'"+rowdata.tag1+"','cusOrgacode':'"+rowdata.orgacode+"'})\">查看</a>";
};
function normalIdentifyLink(cellValue, options, rowdata, action){ 
    var url = "<%=basePath%>customerIdentifyInfo/customerIdentifyNormal.do";
	var startMonth = $("input[name='startDay']").val().substring(0,6);
	var endMonth =  $("input[name='endDay']").val().substring(0,6);
    return "<a href='#' style='color: #5bfdff;' onclick=\"$.StandardPost('"+url+"',{'startMonth':'"+startMonth+"','endMonth':'"+endMonth+"','areaname':'"+rowdata.tag1+
    	"','code':'"+rowdata.orgacode+"','name':'"+rowdata.tag2+"'})\">查看</a>";
};
function dynamicIdentifyLink(cellValue, options, rowdata, action){ 
    var url = "<%=basePath%>customerIdentifyInfo/customerIdentifyDynamic.do";
	var startDay = $("input[name='startDay']").val();
	var endDay =  $("input[name='endDay']").val();
    return "<a href='#' style='color: #5bfdff;' onclick=\"$.StandardPost('"+url+"',{'startDay':'"+startDay+"','endDay':'"+endDay+"','areaname':'"+rowdata.tag1+
    	"','code':'"+rowdata.orgacode+"','name':'"+rowdata.tag2+"'})\">查看</a>";
};

//post提交

$.extend({
    StandardPost:function(url,args){
        var form = $("<form method='post'></form>"),
            input;
        form.attr({"action":url});
        form.attr({"target":"_blank"});
        $.each(args,function(key,value){
            input = $("<input type='hidden'>");
            input.attr({"name":key});
            input.val(value);
            form.append(input);
        });
        form.prependTo(document.body);
        form.submit();
        document.body.removeChild(form[0]);
    }
});

function pageInit(){
	var data = {};
	data['startDay']= $("input[name='startDay']").val();
	data['endDay']= $("input[name='endDay']").val();
	data['tag1'] = $("select[name='tag1']").val();
	if(data['tag1']=='全省'){
		
		data['tag1']='';
	}
	
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}/followCustomerSearch/pageInit.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(data){
	    	showSolider(data.maxValue);
	    	showBrands2(data.brands);
	    	showBrands3(data.brands);
	    	//showSpecs2(data.specs);
	    	//showSpecs3(data.specs);
	    }
	});
}

function getMaxValue(){
	var data = {};
	data['startDay']= $("input[name='startDay']").val();
	data['endDay']= $("input[name='endDay']").val();
	data['tag1'] = $("select[name='tag1']").val();
if(data['tag1']=='全省'){
		
		data['tag1']='';
	}
	$.ajax({
	    type: "post",
	    url:  "${basePath}/followCustomerSearch/getMaxValue.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(data){
	    	showSolider(data.maxValue);
	    	showQueryCondition();
	    }
	});
}

function getSpecsByBrand2(){
	var data = {};
	var brand = $("#brandname").val();
	data["brand"] = brand;
	$.ajax({
	    type: "post",
	    url:  "${basePath}/followCustomerSearch/getSpecsByBrand.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	showSpecs2(result);
	    }
	});
}
function getSpecsByBrand3(){
	var data = {};
	var brand = $("#tag11").val();
	data["brand"] = brand;
	$.ajax({
	    type: "post",
	    url:  "${basePath}/followCustomerSearch/getSpecsByBrand.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	showSpecs3(result);
	    }
	});
}

var fristQuery = true;
function query(){	
	if(fristQuery){
		jqgridInit();
		fristQuery = false;		
	}else{
		jqgridReload();
	}
	
}
</script>



	
</body>
</html>