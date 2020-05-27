<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>渠道厅店画像</title>
</head> 

<body>
<style   type="text/css">
.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
    height: 27px;
    margin-top: 15px;
}
.content div{
  color: #FFFFFF;
  
}

.list-li-3 li {
    width: 31%;
}

</style>
 <script type="text/javascript" src="<%=basePath%>resources/js/customerChannel/customerChannel.js?"></script>
 
<div class="row">
	<ol class="breadcrumb">
	  <li><a href="#">渠道厅店画像</a></li>
	</ol>
</div>
 <div style="margin-left: 20px;margin-right: 20px;margin-bottom: 20px;"> 
	<div class="row" style="">
	  
      		<div class="row top-select">
 	 				<div class="col-xs-1">
	 	 				   	<select name="cityNam" class="select" style="width: 100%;" id="citySelect">
	 	 				   	
	 	 				   								<shiro:hasPermission name="QS"><option value="">全省</option></shiro:hasPermission>  
				 	 				   		       		<shiro:hasPermission name="GZ"><option value="广州" selected="selected">广州</option></shiro:hasPermission>
														<shiro:hasPermission name="QY"><option value="清远">清远</option></shiro:hasPermission>
														<shiro:hasPermission name="ZQ"><option value="肇庆">肇庆</option></shiro:hasPermission>
														<shiro:hasPermission name="SG"><option value="韶关">韶关</option></shiro:hasPermission>
														<shiro:hasPermission name="YF"><option value="云浮">云浮</option></shiro:hasPermission>
														<shiro:hasPermission name="FS"><option value="佛山">佛山</option></shiro:hasPermission>
														<shiro:hasPermission name="JM"><option value="江门">江门</option></shiro:hasPermission>
														<shiro:hasPermission name="MM"><option value="茂名">茂名</option></shiro:hasPermission>
														<shiro:hasPermission name="YJ"><option value="阳江">阳江</option></shiro:hasPermission>
														<shiro:hasPermission name="ZJ"><option value="湛江">湛江</option></shiro:hasPermission>
														<shiro:hasPermission name="SZ"><option value="深圳" >深圳</option></shiro:hasPermission>
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
						<%-- 		<c:forEach var="item" items="${citys}">
								         <option value="${item}" <c:if test="${item==vo.tag1}">selected="selected"</c:if>>
								         	<c:out value="${item}" />
								         </option>
								</c:forEach>  --%>	 	 				   	 	 				   	
				       		</select>    		 
 	 				</div>
 	 				<div class="col-xs-1">	 				
				   	     <input name="startMonth" id="startMonth" type="text" style="width:100%" readonly="readonly" class="form-text select"
				   	  		onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'#F{$dp.$D(\'endMonth\')}',onpicked:clickMonth})" value="${vo.startMonth}"/>			       	
 	 				</div>
 	 				<div class="col-xs-1"> 	 				
				   	     <input name="endMonth" id="endMonth" type="text" style="width:100%" readonly="readonly" class="form-text select"
				   	  		onClick="WdatePicker({dateFmt:'yyyyMM',minDate:'#F{$dp.$D(\'startMonth\')}',maxDate:'%y-{%M-1}',onpicked:clickMonth})" value="${vo.endMonth}"/>			       	
 	 				</div> 
 	 				
 	 				<div class="col-xs-1" >
 	 		    
<select name="tbrandname" class="select" id="selectSeven" onchange="myFunction()" style="border-color: #ffffff;
    border: 1px solid #558baf;
    border-radius: 22px;
    font: 14px/30px "微软雅黑";
    height: 30px;
    line-height: 30px;
    outline: medium none;
    padding: 0 5px;
    margin-bottom: 0;
    background: none;
    color: #fff;
    z-index: 100; 
    width:100%;> 
		<option value="" selected="selected">全部厅店属性</option>
		<option value="0">普通网点</option>
		<option value="6">零售厅</option>
		<option value="7">省电商</option>
		<option value="8">地市电商</option>
		<option value="9">非times网点</option>
		<option value="10">ECP网点</option>
		<option value="13">零售铺货厅</option>
		<option value="14">零售售后厅</option>
		<option value="17">自营代销厅</option>
		<option value="19">铁通普通厅</option>
		<option value="20">铁通零售厅</option>
		<option value="21">铁通和包厅</option>
		
</select>
			       		
 	 				</div>	         		 				
 	 				<div class="col-xs-1" >
 	 				   <div style="width:100%;position:absolute;">
					        <select name="cusOrgacode" id="cusOrgacode" style="float:left;width: 100%;" class="">
								<c:forEach var="item" items="${customers}">
								         <option value="${item.id}" <c:if test="${item.cusOrgacode==vo.cusOrgacode}">selected="selected"</c:if>>
								         	<c:out value="${item.text}" />
								         </option>
								</c:forEach> 					        
					        </select>
			       		</div>
 	 				</div>	         
		       
		            <div class="col-xs-2" style="margin-left:1%;">
				        <div class="input-group">
				        	<span class="input-group-addon">(搜索)厅店名称</span>
				            <input type="text" id="custValue" name="custnameInput" class="form-control">		            
				        </div>	
				    </div>
		            <div class="col-xs-2" style="margin-left:1%;">
				        <div class="input-group">
				        	<span class="input-group-addon">(搜索)厅店编码</span>
				            <input type="text" id="custValueCode" name="cusOrgacodeInput" class="form-control">		            
				        </div>	
				    </div>	
				    
					<div class="col-xs-1" style="margin-left:1%;"> 
						<button type="button" onclick="vagueQuery()" class="btn btn-primary" style="width:100px">搜索</button>
					</div> 			
					<button   id="customizationModalShow" class="select" style="width:150px;  background-color:#083d5c;border-width:1px; position: absolute;right: 17px;top: 55px;">关注特征定制</button>		    
		    </div> 
		      <!-- data-toggle="modal" data-target="#customizationModal" -->
	  		
	 </div>
 </div> 
<div  id="body" style="min-height:768px;">
</div>


<!-- Button trigger modal -->
 

<!-- Modal start-->
<div class="modal fade" id="customizationModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="">
  <div class="modal-dialog" role="document" style=" width: 80%;margin-top:5px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">| 关注特征定制 </h4>
      </div>
      <div class="modal-body" id="frame_type_all" style="">
          <div class="row" style="">
          		<div class="col-xs-2"style="" >
          		  <div class="panel panel-default" style="">
						  <div class="panel-body" >
						    <span class=" " ><span style="background-color: yellow;">|</span>&nbsp; <span id="frame_type1_title"></span></span>
						    <br/>
						    <button type="button" order="1" opera="prev" class="btn btn-default btn-xs typeOrder" disabled="disabled"><</button>
						    <button type="button" order="1" opera="next" class="btn btn-default btn-xs typeOrder">></button>
						    <ul style="list-style: none;" id="frame_type1">
                            	<li></li>
						    </ul>
						      					    
						  </div>
				   </div>
          		
          		</div>
          		<div class="col-xs-2">
          			<div class="panel panel-default" style="">
						  <div class="panel-body" >
						    <span class=" "><span style="background-color: yellow;">|</span>&nbsp; <span id="frame_type2_title"></span></span>
						    <br/>
						    <button type="button" order="2" opera="prev" class="btn btn-default btn-xs typeOrder"><</button>
						    <button type="button" order="2" opera="next" class="btn btn-default btn-xs typeOrder">></button>						    
						    <ul style="list-style: none;" id="frame_type2">
						    </ul>
						      
						  </div>
				   </div>
          		
          		</div>
          		<div class="col-xs-2">
          			<div class="panel panel-default" style=" width: 100%;">
						  <div class="panel-body" >
						   	<span class=" "><span style="background-color: yellow;">|</span>&nbsp; <span id="frame_type3_title"></span></span>
						   	<br/>
						    <button type="button" order="3" opera="prev" class="btn btn-default btn-xs typeOrder"><</button>
						    <button type="button" order="3" opera="next" class="btn btn-default btn-xs typeOrder">></button>						   	
						    <ul style="list-style: none;" id="frame_type3">

						    </ul>
						      
						  </div>
				   </div>
          		</div>
          		<div class="col-xs-2">
          			<div class="panel panel-default" style=" width: 100%;">
						  <div class="panel-body" >
						   	<span class=" "><span style="background-color: yellow;">|</span>&nbsp; <span id="frame_type4_title"></span></span>
						   	<br/>
						    <button type="button" order="4" opera="prev" class="btn btn-default btn-xs typeOrder"><</button>
						    <button type="button" order="4" opera="next" class="btn btn-default btn-xs typeOrder">></button>						   	
						    <ul style="list-style: none;" id="frame_type4">

						    </ul>
						      
						  </div>
				   </div>
          		</div>
          		<div class="col-xs-2">
          			<div class="panel panel-default" style=" width: 100%;">
						  <div class="panel-body" >
						   	<span class=" "><span style="background-color: yellow;">|</span>&nbsp; <span id="frame_type5_title"></span></span>
						   	<br/>
						    <button type="button" order="5" opera="prev" class="btn btn-default btn-xs typeOrder"><</button>
						    <button type="button" order="5" opera="next" class="btn btn-default btn-xs typeOrder">></button>						   	
						    <ul style="list-style: none;" id="frame_type5">

						    </ul>
						       
						  </div>
				   </div>
          		</div>
          		<div class="col-xs-2">
          			<div class="panel panel-default" style=" width: 100%;">
						  <div class="panel-body" >
						   	<span class=" "><span style="background-color: yellow;">|</span>&nbsp; <span id="frame_type6_title"></span></span>
						   	<br/>
						    <button type="button" order="6" opera="prev" class="btn btn-default btn-xs typeOrder"><</button>
						    <button type="button" order="6" opera="next" class="btn btn-default btn-xs typeOrder" disabled="disabled">></button>						   	
						    <ul style="list-style: none;" id="frame_type6">

						    </ul>
						       <!-- <a><span class=" ">更多></span></a> -->
						  </div>
				   </div>
          		</div>
          </div>
      	  <div class="row">
      	  	<span class=" " style="color: yellow; margin-left: 12px;" ><span >*</span>&nbsp;每个特征分类最多选择三项</span>
      	  </div>
      	  <div>
      	  	<table class="table table-hover" style="border-top:1px solid #558baf!important;  border-left: 1px solid #558baf!important;border-bottom:1px solid #558baf!important;border-right: 1px solid #558baf!important; ">
      	  	   <thead style="background-color:#384f76 ;">
      	  	   		<tr id="frame_tb_thead_tr">

      	  	   		</tr>
      	  	   </thead>
      	  	   <tbody id="frame_tb_tbody">

      	  	   </tbody>			 
			</table>
      	  </div>
         
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="submit()">确定</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal end-->


<!-- vagueQuery Modal start-->
<div class="modal fade" id="vagueQueryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" style="width:50%;margin-top:10%;">
    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">|请选择厅店 </h4>
	      </div>   
	      <div class="modal-body">
			  	<div class="row" >
			       	<div class="col-xs-12" style="padding:auto;min-height:400px;">
			    	     <table id="list"></table> 
						 <div id="pager"></div>
					</div>   	  	
				</div>
	      </div>	       
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
<!-- 	        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="submit()">确定</button>-->
	      </div> 
    </div>
  </div>
</div>
<!-- vagueQuery Modal end-->

<script type="text/javascript">

$(document).ready(function() {
	pageInit();
	title_tip();
	
});

function lyoutBody2(){		
	var data = {};
	data["tag1"] = $("select[name='cityNam']").val();
	data["startMonth"] = $("input[name='startMonth']").val();
	data["endMonth"] = $("input[name='endMonth']").val();
	data["cusOrgacode"] = $("#cusOrgacode").val();
	var ids = [];
	$("#frame_type_all input:checkbox:checked").each(function() {
		var val = $(this).attr("name");
		ids.push(val);
	});
	ids=ids.length==0?defaultIdentityCustomizationIds:ids;
	$(".rowType").each(function() {
		var id = $(this).attr("cusChanId");
		ids.splice(jQuery.inArray(id,ids),1); 
	});
	data["ids"] = ids;
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}customerChannel/listHallChanPortray.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: false,
	    success: function(result){
	    	
              lyoutBody(result.portrays);
             
              
              
              
	    }
	});
}

function pageInit(){		
	var data = {};
	data["tag1"] = $("select[name='cityNam']").val();
	data["startMonth"] = $("input[name='startMonth']").val();
	data["endMonth"] = $("input[name='endMonth']").val();
	data["cusOrgacode"] = $("#cusOrgacode").val();
	data["orgacode"] ="";
	data["portCode"]="";
	var ids = [];
	$("#frame_type_all input:checkbox:checked").each(function() {
		var val = $(this).attr("name");
		ids.push(val);
	});
	data["ids"] = ids;
	$.ajax({
	    type: "post",
	    url:  "${basePath}customerChannel/hallPort.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){
	
	
	
	    }
	});
	
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}customerChannel/listHallChanPortray.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){
	     	/*  for (var i = 0; i < result.customers.length; i++) {
					
					
					$("#cusOrgacode").append(
							"<option value='"+result.customers[i].custname+"'>"
									+ result.customers[i].custname + "</option>");
							 showCusOrgacode(data); 				
											
											

						}  
	    	 */
	    	
	    	  typeOrder = result.typeOrder;
              //lyoutBody(result.portrays);
              defaultIdentityCustomizationIds = result.defaultIdentityCustomizationIds;
              allUsefulField = result.allUsefulField;
              lyoutFrame();
              clickCustomer();
             // setTimeout('lyoutBody2()', 1000);
	    }
	});
}

function clickMonth(){	
	
	var data = {};
	data["portCode"] = $("#selectSeven option:selected").val();
	data["tag1"] = $("select[name='cityNam']").val();
	data["startMonth"] = $("input[name='startMonth']").val();
	data["endMonth"] = $("input[name='endMonth']").val();
	data["cusOrgacode"] = $("#cusOrgacode").val();
	data["custname"] =  $("#cusOrgacode").find("option:selected").text();
	var ids = [];
	$("#frame_type_all input:checkbox:checked").each(function() {
		var val = $(this).attr("name");
		ids.push(val);
	});
	data["ids"] = ids;
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}customerChannel/listHallChanPortray.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	  $("#body").html("");
              lyoutBody(result.portrays);
              showCusOrgacode(result.customers);             
              $("#cusOrgacode").val(data["cusOrgacode"]).trigger("change");
	    }
	});
}

function clickCity(){	
	
	var data = {};
	data["portCode"] = $("#selectSeven option:selected").val();
	data["tag1"] = $("select[name='cityNam']").val();
	data["startMonth"] = $("input[name='startMonth']").val();
	data["endMonth"] = $("input[name='endMonth']").val();
	data["cusOrgacode"] = $("#cusOrgacode").val();
	data["custname"] =  $("#cusOrgacode").find("option:selected").text();
	var ids = [];
	$("#frame_type_all input:checkbox:checked").each(function() {
		var val = $(this).attr("name");
		ids.push(val);
	});
	data["ids"] = ids;
	if(data["cusOrgacode"]="null"){
		data["cusOrgacode"]="";
		
		
	    }
	/* $.ajax({
	    type: "post",
	    url:  "${basePath}customerChannel/clickCityHallNew.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	  $("#body").html("");
              lyoutBody(result.portrays);
            
              showCusOrgacode(result.customers);             
	    }
	}); */

	$.ajax({
		url : "${basePath}customerChannel/hallPort.do",
		type : "post",
		async : false,
		cache : false,
		contentType : "application/json",
		data: JSON.stringify(data),						   
		success : function(result) {	
			$("#cusOrgacode").empty();
			   if(data["portCode"] ==""){
				data["cusOrgacode"] ="";
				
				 if(result.length){
					 $("#cusOrgacode").append("<option text='"+'全部'+"'>"+ '全部' + "</option>");
					 for (var i = 0; i < result.length; i++) { //循环生成option，并且连接成String对象  
							
						    if(result[i].custName==null){
						    	
						    continue;	
						    }
							
							$("#cusOrgacode").append("<option value='"+result[i].orgacode+"'>"
									+ result[i].custName + "</option>");
							
						
						}
					 $.ajax({
						    type: "post",
						    url:  "${basePath}customerChannel/listHallChanPortray.do",
						    contentType: 'application/json',
						    data: JSON.stringify(data),
						    dataType: "json",
						    async: true,
						    success: function(result){
						    	  $("#body").html("");
					              lyoutBody(result.portrays);
						    }
						});
					 
					 
						
					}else{
						
					alert("无数据！");	
						
					}	
				
				
			}else{
				
				 if(result.length){
					 $("#cusOrgacode").append("<option text='"+'全部'+"'>"+ '全部' + "</option>");
					 for (var i = 0; i < result.length; i++) { //循环生成option，并且连接成String对象  
							
						    if(result[i].custName==null){
						    	
						    continue;	
						    }
							
							$("#cusOrgacode").append("<option value='"+result[i].orgacode+"'>"
									+ result[i].custName + "</option>");
							
						
						}
					 $.ajax({
						    type: "post",
						    url:  "${basePath}customerChannel/listHallChanPortray.do",
						    contentType: 'application/json',
						    data: JSON.stringify(data),
						    dataType: "json",
						    async: true,
						    success: function(result){
						    	  $("#body").html("");
					              lyoutBody(result.portrays);
						    }
						});
					 
					 
						
					}else{
						
					alert("无数据！");	
						
					}	
				
				
				
				
			}
			
			
			
			
			
		}
	});









}

function clickCustomer(){	//id="custValueCode" name="cusOrgacodeInput"	
	var data = {};
	
	data["tag1"] = $("select[name='cityNam']").val();
	data["cusOrgacode"] = $("select[name='cusOrgacode']").val();
	data["orgacode"] = $("select[name='cusOrgacode']").val();
     var mm=$("select[name='cusOrgacode']").val();
	 var ss=test(mm);
	 if(data["tag1"] =="" && ss=="中文"){
		   
		   data["cusOrgacode"] ="全省";
	   }
	 if(ss=="中文"){
		   
		   data["cusOrgacode"] ="";
		   data["orgacode"] ="";
	   }
	 
	 
if(data["cusOrgacode"]=="全部" || data["orgacode"]=="全部"){
	    data["orgacode"]=""
		data["cusOrgacode"]="";
	}
if(data["portCode"]=="全部"){
		
		data["portCode"]="";
	}
	
data["portCode"] = $("#selectSeven option:selected").val();
	
	
	//data["cusOrgacode"] = $("#custValueCode").val();
	data["startMonth"] = $("input[name='startMonth']").val();
	data["endMonth"] = $("input[name='endMonth']").val();
	var ids = [];
	$("#frame_type_all input:checkbox:checked").each(function() {
		var val = $(this).attr("name");
		ids.push(val);
	});
	data["ids"] = ids;
	
	if(data["portCode"]=="" && data["orgacode"]==""){
		
		$.ajax({
		    type: "post",
		    url:  "${basePath}customerChannel/hallPort.do",
		    contentType: 'application/json',
		    data: JSON.stringify(data),
		    dataType: "json",
		    async: true,
		    success: function(result){
		    	$.ajax({
		    	    type: "post",
		    	    url:  "${basePath}customerChannel/listHallChanPortray.do",
		    	    contentType: 'application/json',
		    	    data: JSON.stringify(data),
		    	    dataType: "json",
		    	    async: true,
		    	    success: function(result){
		    	    	
		    	    	  $("#body").html("");
		    	    	  lyoutBody(result.portrays);
		    	    	
		    	    }
		    	}); 
		    }
		});
		
		
		
		
		
		
		
		
		
	}else{
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}customerChannel/listHallChanPortray.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	  $("#body").html("");
	    	 
	    	 // $("#cusOrgacode").append("<option text='"+'请选择'+"'>"+ '请选择' + "</option>");  
	    	  
              lyoutBody(result.portrays);
	    }
	});
	}
}

/*搜索厅店加载厅店维度   */

function clickCustomer1(){	//id="custValueCode" name="cusOrgacodeInput"	
	var data = {};
	
	data["tag1"] = $("select[name='cityNam']").val();
	//data["cusOrgacode"] = $("select[name='cusOrgacode']").val();
	data["cusOrgacode"] = $("#custValueCode").val();
	data["startMonth"] = $("input[name='startMonth']").val();
	data["endMonth"] = $("input[name='endMonth']").val();
	var ids = [];
	$("#frame_type_all input:checkbox:checked").each(function() {
		var val = $(this).attr("name");
		ids.push(val);
	});
	data["ids"] = ids;
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}customerChannel/listHallChanPortray.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	  $("#body").html("");
              lyoutBody(result.portrays);
	    }
	});
}




function submit(){	
	var data= {};
	var ids = [];
	$("#frame_type_all input:checkbox:checked").each(function() {
		var val = $(this).attr("name");
		ids.push(val);
	});
	data["tag1"] = $("select[name='cityNam']").val();
	data["cusOrgacode"] = $("select[name='cusOrgacode']").val();
	data["startMonth"] = $("input[name='startMonth']").val();
	data["endMonth"] = $("input[name='endMonth']").val();
	data["ids"] = ids;
	data["typeOrder"] = typeOrder;      
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}customerChannel/listHallChanPortray.do",
	    contentType : 'application/json;charset=utf-8',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(data){
	    	  $("#body").html("");
              lyoutBody(data.portrays);
	    }
	});
}

function vagueQuery(){	
	var data = {};
	data["tag1"] = $("select[name='cityNam']").val();
	data["startMonth"] = $("input[name='startMonth']").val();
	data["endMonth"] = $("input[name='endMonth']").val();
	data["custname"] = $("input[name='custnameInput']").val();
	data["cusOrgacode"] = $("input[name='cusOrgacodeInput']").val();
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}customerChannel/vagueQueryTing.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	if(result.length==0){
	    		alert("当前月份和地市下，搜索的厅店不存在");
	    		return;
	    	}
	    	$('#vagueQueryModal').modal('show');
	    	if(frist){
	    		jqgridInit(result);
	    		frist = false;
	    	}else{
	    		jqgridReload(result);
	    	} 	
	    }
	});
}

var frist = true;
function jqgridReload(newdata){
	$("#list").jqGrid('clearGridData');  //清空表格
	$("#list").jqGrid('setGridParam',{  // 重新加载数据
	      datatype:'local',
	      data : newdata,   //  newdata 是符合格式要求的需要重新加载的数据 
	      page:1
	}).trigger("reloadGrid");
};
/* 初始化表格 */
function jqgridInit(data){
	  jQuery("#list").jqGrid({	        
	        datatype : "local",
	        data:data, 
	        colNames : [ 
	                    '月份','地市','客商名称','客商编码','选择客商'
	               ],
	        colModel : [ 
	                 {name : 'month',index : 'month',sorttype : "string"}, 
	                 {name : 'tag1',index : 'tag1',sorttype : "string"}, 
	                 {name : 'custname',index : 'custname',sorttype : "string"},
	                 {name : 'cusOrgacode',index : 'cusOrgacode',sorttype : "string"},
	                 {name:'chooce',index:'chooce',sortable: false, search:false,formatter: choose_cust},
	               ],		                   
 	        rowNum:10,        
	        rowList : [10,30,50], 
	        pager: '#pager',     //指定分页组件所在div id 
	        rownumbers: true,    //行首添加顺序编码
	        rownumWidth: 60,     //行首添加顺序编码的列宽
	        autowidth: false,     //表格宽度 刚加载时自动适应父div   ,然后随列调整宽度
	        height : "100%",     //表格宽度自动适应行数
	        width:"90%",
	        sortorder: "asc",    //指定列排序的次序
	        viewrecords : true,  //显示当前记录，和总记录数 
	        sortname: 'cityCd', //默认排序
	        repeatitems: true,   //是否可重复
	        shrinkToFit:true,     //可伸缩, true时使列宽可调整   false时设置的水平滚动才有效/也可能留出空白右侧
	        forceFit:false,
	        autoScroll: true,
	        jsonReader: {        //描述json 数据格式的数组,需修改
	        	root: 'list',
 		    	page: 'current',           // json中代表当前页码的数据
		    	total: "pages",         // json中代表页码总数的数据
		    	records: "total",       // json中代表数据行总数的数据
		    	repeatitems: false,     // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
		    	cell: "cell",
		    	id: "fRoleId",
		    	userdata: "userdata", 
		    }, 	        
	        pagination: true,
	        caption : "", 
	      });	
	  $("#list").setGridWidth($(window).width()*0.47);
	  
	  function choose_cust(cellValue, options, rowdata, action){  //rowdata.orgacode
		    return "<a href='#' onclick=\"choosedCust('"+rowdata.month+"','"+rowdata.tag1+"','"+rowdata.cusOrgacode+"','"+rowdata.custname+"')\" style='color:yellow;'>选择</a>";
	  };
};

function choosedCust(month, tag1, cusOrgacode,custname){
	$("#cusOrgacode").val(cusOrgacode).trigger("change");
	//var set=$("#cusOrgacode").val();
	$("#custValueCode").val(cusOrgacode).trigger("change");
	$("#custValue").val(custname).trigger("change");
	//document.getElementById('custValue').innerHTML = custname;
	$('#vagueQueryModal').modal('hide');
	clickCustomer1();
}



/*给厅店名称绑定onchange事件   */

/* function myFunction(){
	    var data = {};
	    data["tag1"] = $("select[name='cityNam']").val();
		//data["cusOrgacode"] = $("select[name='cusOrgacode']").val();
		data["cusOrgacode"] = $("select[name='cusOrgacode']").val();
		data["portCode"] = $("#selectSeven option:selected").val();
		data["startMonth"] = $("input[name='startMonth']").val();
		data["endMonth"] = $("input[name='endMonth']").val(); 
		var ids = [];
		$("#frame_type_all input:checkbox:checked").each(function() {
			var val = $(this).attr("name");
			ids.push(val);
		});
		data["ids"] = ids; 
		if(data["cusOrgacode"]=="全部厅店"){
        	   data["cusOrgacode"]=""; 
        	   
        	   
           }
           if(data["cusOrgacode"]=="全部"){
        	   data["cusOrgacode"]=""; 
        	   
        	   
           }
		$.ajax({
			url : "${basePath}customerChannel/hallPort.do",
			type : "post",
			async : false,
			cache : false,
			contentType : "application/json",
			data: JSON.stringify(data),						   
			success : function(result) {	
				$("#cusOrgacode").empty();
				
				if(data["portCode"]=="" && data["cusOrgacode"]==""){
					
					 if(result.length){
						 $("#cusOrgacode").append("<option text='"+'全部'+"'>"+ '全部' + "</option>");
						 for (var i = 0; i < result.length; i++) { //循环生成option，并且连接成String对象  
								
							    if(result[i].custName==null){
							    	
							    continue;	
							    }
								
								$("#cusOrgacode").append("<option value='"+result[i].orgacode+"'>"
										+ result[i].custName + "</option>");
								
							
							}	
							
						 $.ajax({
							    type: "post",
							    url:  "${basePath}customerChannel/listHallChanPortray.do",
							    contentType: 'application/json',
							    data: JSON.stringify(data),
							    dataType: "json",
							    async: true,
							    success: function(result){
							    	  $("#body").html("");
						              lyoutBody(result.portrays);
							    }
							});
					 
					 
					 
					 
					 }else{
							
						alert("无数据！");	
							
						}
					
				}else{
					
					 if(result.length){
						 $("#cusOrgacode").append("<option text='"+'全部'+"'>"+ '全部' + "</option>");
						 for (var i = 0; i < result.length; i++) { //循环生成option，并且连接成String对象  
								
							    if(result[i].custName==null){
							    	
							    continue;	
							    }
								
								$("#cusOrgacode").append("<option value='"+result[i].orgacode+"'>"
										+ result[i].custName + "</option>");
								
							
							}
						 
						 $.ajax({
							    type: "post",
							    url:  "${basePath}customerChannel/hallPort.do",
							    contentType: 'application/json',
							    data: JSON.stringify(data),
							    dataType: "json",
							    async: true,
							    success: function(result){
							    	$.ajax({
							    	    type: "post",
							    	    url:  "${basePath}customerChannel/listHallChanPortray.do",
							    	    contentType: 'application/json',
							    	    data: JSON.stringify(data),
							    	    dataType: "json",
							    	    async: true,
							    	    success: function(result){
							    	    	  $("#body").html("");
							    	    	  lyoutBody(result.portrays);
							    	    	
							    	    }
							    	}); 
							    }
							});
					 
							
						}else{
							
						alert("无数据！");	
							
						}	
					
					
				}
				
				
				
				
			}
		});



} */



function myFunction(){
    var data = {};
    data["tag1"] = $("select[name='cityNam']").val();
	//data["cusOrgacode"] = $("select[name='cusOrgacode']").val();
	data["cusOrgacode"] = $("select[name='cusOrgacode']").val();
	data["portCode"] = $("#selectSeven option:selected").val();
	data["startMonth"] = $("input[name='startMonth']").val();
	data["endMonth"] = $("input[name='endMonth']").val(); 
	var ids = [];
	if(data["cusOrgacode"]=="全部"){
		data["cusOrgacode"]="";
	}
	$("#frame_type_all input:checkbox:checked").each(function() {
		var val = $(this).attr("name");
		ids.push(val);
	});
	data["ids"] = ids;
	$.ajax({
		url : "${basePath}customerChannel/hallPort.do",
		type : "post",
		async : false,
		cache : false,
		contentType : "application/json",
		data: JSON.stringify(data),						   
		success : function(result) {	
			$("#cusOrgacode").empty();
			   if(data["portCode"] ==""){
				data["cusOrgacode"] ="";
				
				 if(result.length){
					 $("#cusOrgacode").append("<option text='"+'全部'+"'>"+ '全部' + "</option>");
					 for (var i = 0; i < result.length; i++) { //循环生成option，并且连接成String对象  
							
						    if(result[i].custName==null){
						    	
						    continue;	
						    }
							
							$("#cusOrgacode").append("<option value='"+result[i].orgacode+"'>"
									+ result[i].custName + "</option>");
							
						
						}
					 $.ajax({
						    type: "post",
						    url:  "${basePath}customerChannel/listHallChanPortray.do",
						    contentType: 'application/json',
						    data: JSON.stringify(data),
						    dataType: "json",
						    async: true,
						    success: function(result){
						    	  $("#body").html("");
					              lyoutBody(result.portrays);
						    }
						});
					 
					 
						
					}else{
						
					alert("无数据！");	
						
					}	
				
				
			}else{
				
				 if(result.length){
					 $("#cusOrgacode").append("<option text='"+'全部'+"'>"+ '全部' + "</option>");
					 for (var i = 0; i < result.length; i++) { //循环生成option，并且连接成String对象  
							
						    if(result[i].custName==null){
						    	
						    continue;	
						    }
							
							$("#cusOrgacode").append("<option value='"+result[i].orgacode+"'>"
									+ result[i].custName + "</option>");
							
						
						}
					 $.ajax({
						    type: "post",
						    url:  "${basePath}customerChannel/listHallChanPortray.do",
						    contentType: 'application/json',
						    data: JSON.stringify(data),
						    dataType: "json",
						    async: true,
						    success: function(result){
						    	  $("#body").html("");
					              lyoutBody(result.portrays);
						    }
						});
					 
					 
						
					}else{
						
					alert("无数据！");	
						
					}	
				
				
				
				
			}
			
			
			
			
			
		}
	});



}

/* 判断输入的字符是中文还是英文  */  



function test(t) {

	var a = [

	{'reg':/^[\u0391-\uFFE5]+$/, 'name':'中文'},

	

	{'reg':/^[a-zA-Z]+$/, 'name':'英文'},

	];

	for (var i = 0; i < a.length; i++) {

	if (a[i].reg.test(t)) {

	return a[i].name;

	}

	}

	return name;

	} 






</script>

</body>
</html>