<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.asiainfo.cmc.utils.properties.JdbcConfig"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%
 
 WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());    
 JdbcConfig Config = (JdbcConfig)wac.getBean("jdbcConfig");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>门店作战地图</title>
</head>
 
<body>
  <script type="text/javascript" src="<%=Config.bdMapUrl%>/map_load.js"></script>  
<%--   <script type="text/javascript" src="<%=Config.bdMapUrl%>/js/apiv2.0.3.min.js"></script>   --%>
<style   type="text/css">
 	.absolute-div{
		 width:100%;  
	}
	
	.conditions_select li{
		float: left;
		width: 20%;
		list-style: none;
	}
	input[type="checkbox"], input[type="radio"] {
	    height: 18px;
	    width: 18px;
	}
	label {
	    font-size: 20px;
	}
	.fieldGroup{
		color:#5bfdff;
		clear:both;
	} 		
	
</style>
 
<script type="text/javascript" src="<%=basePath%>resources/js/storeBattleMap/map_portray.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/storeBattleMap/store_battle_map.js"></script>
<div class="row">
	<ol class="breadcrumb">
	  <li><a href="#">门店作战地图</a></li>
	 
	</ol>
</div>
 
<div class="row" style=" ">
    <div class="col-xs-6">
       <div class="row">  
       		<div class="col-xs-2" style="">
	 				<select name="tag1" class="select" style="width: 100%;"  id="citySelect">

		       		</select>
		     </div>
			<div class="col-xs-2" style="">
			   	     <input name="month"  type="text" style="width: 100%;" readonly="readonly"class="form-text select prevMonth"
			   	  		onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M-1}',onpicked:pageInit})" />
			</div>
			<div class="col-xs-2" style="" >
				<p style="position:absolute;"  class="absolute-div">
			        <select name="cusOrgacode" id="cusOrgacode" class="select_searchable" style="width: 100%;" >
			        </select>
	      		</p>
			</div>
			<div class="col-xs-2" style="margin-left:1%;" >
				<p style="position:absolute;"  class="absolute-div">
			        <select name="orgacode" id="orgacode" class="select_searchable"  style="float:left;width: 100%;" >
			            <option value="">全部门店</option>
			        </select>
	      		</p>
			</div>		
			
       </div>
       
       
	   <div class="row" style="margin: 30px 20px 20px 20px ;border: 1px solid #558baf!important;padding: 5px 5px 5px 5px;"> 
	   
	        <div class="main-map" id="hotMapShow" style="height: 790px;">
              <!--   <img  src="images/map_backgroud.png" width="100%"> -->
            </div>
	   
	   </div> 
	</div>
	<div class="col-xs-6">
		 <div class="row">
			<div class="col-xs-6"> 
					<div class="box">
		                <div class="box-head"><div class="title" id="portray1_cnName"></div></div>
		                <div class="box-content" id="portray1" style="border: 1px solid #558baf!important;height: 217px;margin-top: 10px;">
		                    <!--<img src="images/m21.png">-->
		                </div>
		            </div>
			</div>
			<div class="col-xs-6"> 
					<div class="box">
		                <div class="box-head">
		                	<div class="title" id="portray2_cnName"></div>
							<button   id="customizationModalShow" class="select"  data-toggle="modal" data-target="#modal"
								style="width:150px;  background-color:#083d5c;border-width:1px; position: absolute;right: 17px;top: 0px;">关注特征定制</button>			                
		                </div>
		                <div class="box-content" id="portray2" style="border: 1px solid #558baf!important;height: 217px;margin-top: 10px;">
		                    <!--<img src="images/m21.png">-->
		                </div>
		            </div>
			</div>
		</div>
		 <div class="row" style="margin-top: 25px;">
			<div class="col-xs-6"> 
					<div class="box">
		                <div class="box-head"><div class="title" id="portray3_cnName"></div></div>
		                <div class="box-content" id="portray3" style="border: 1px solid #558baf!important;height: 217px;margin-top: 10px;">
		                    <!--<img src="images/m21.png">-->
		                </div>
		            </div>
			</div>
			<div class="col-xs-6"> 
					<div class="box">
		                <div class="box-head"><div class="title" id="portray4_cnName"></div></div>
		                <div class="box-content" id="portray4" style="border: 1px solid #558baf!important;height: 217px;margin-top: 10px;">
		                    <!--<img src="images/m21.png">-->
		                </div>
		            </div>
			</div>
		</div>
		 <div class="row" style="margin-top: 25px;">
			<div class="col-xs-6"> 
					<div class="box">
		                <div class="box-head"><div class="title" id="portray5_cnName"></div></div>
		                <div class="box-content" id="portray5" style="border: 1px solid #558baf!important;height: 217px;margin-top: 10px;">
		                    <!--<img src="images/m21.png">-->
		                </div>
		            </div>
			</div>
			<div class="col-xs-6"> 
					<div class="box">
		                <div class="box-head"><div class="title" id="portray6_cnName"></div></div>
		                <div class="box-content" id="portray6" style="border: 1px solid #558baf!important;height: 217px;margin-top: 10px;">
		                    <!--<img src="images/m21.png">-->
		                </div>
		            </div>
			</div>
		</div>
	</div>	
</div>



<!-- Modal start-->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" style="width:70%;margin-top:5%;">
    <div class="modal-content">
	      <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	          <h4 class="modal-title" id="myModalLabel">
				  <ul id="myTab" class="nav nav-pills">
					  <li class="active"><a href="#cust" data-toggle="tab">客商定制</a></li>
					  <li><a href="#hall" data-toggle="tab">门店定制</a></li>
				  </ul>	          
	           </h4>
	      </div>   
	      <div class="modal-body" id="all_field">
			  <div id="myTabContent" class="tab-content">
				  <div class="tab-pane fade in active" id="cust">
					  
					    <div class="row">
					    	<div  class="col-xs-12">
							  	<span class=" " style="color: yellow;" ><span >&nbsp;*</span>&nbsp;可选信息</span>
							</div>						  	
							<div  class="col-xs-12">
							    <div class="panel panel-default" style="  ">
							        <div class="panel-body" >
							       	    <div  class="col-xs-12" id="all_field_cust">
							       		    <ul class="conditions_select" >	
							       		        <div id="all_field_cust1"></div><div  style="clear:left;"></div>
							       		        <div id="all_field_cust2"></div><div  style="clear:left;"></div>
							       		        <div id="all_field_cust3"></div>      		    							                      
						                     </ul> 
						                     <div  style="clear:left;"></div>
						                     <a class="" data-toggle="collapse" data-target="#more_cust" style="width:10%;color:blue;"><span><<更多>></span></a>	
						                     <div id="more_cust" class="collapse">
							                     <ul class="conditions_select" >	
							                         <div id="all_field_cust4"></div><div  style="clear:left;"></div>
							                         <div id="all_field_cust5"></div><div  style="clear:left;"></div>
							                         <div id="all_field_cust6"></div>					                                                	 		    		       		    		    
								       		    </ul> 
							       		    </div>
							       	    </div>				       
							        </div>
							    </div>
							</div>
						</div>
					
						<div class="row">
							<div  class="col-xs-12">
								<div style="color:yellow;"><span>&nbsp;*</span>&nbsp;所选信息</div>	
							</div>					
							<div  class="col-xs-12">
							    <div class="panel panel-default" style="  ">
							        <div class="panel-body" >
							       	    <div  class="col-xs-12" id="query_conditions">
							       		     <ul class="conditions_select" id="choose_field_cust">
					   		    
							       		     </ul> 
							       	    </div>				       
							        </div>
							     </div>
							</div>	
						</div>									  
			<div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
 	          <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="submitByCust();">确定</button>
	      </div>
				  </div>
 				  <div class="tab-pane fade" id="hall">

					    <div class="row">
					    	<div  class="col-xs-12">
							  	<span class=" " style="color: yellow;" ><span >&nbsp;*</span>&nbsp;可选信息</span>
							</div>						  	
							<div  class="col-xs-12">
							    <div class="panel panel-default" style="  ">
							        <div class="panel-body" >
							       	    <div  class="col-xs-12" id="all_field_hall">
							       		    <ul class="conditions_select" >	
							       		        <div id="all_field_hall1"></div><div  style="clear:left;"></div>
							       		        <div id="all_field_hall2"></div><div  style="clear:left;"></div>
							       		        <div id="all_field_hall3">       		    							                      
						                     </ul> 
						                     <div  style="clear:left;"></div>
						                     <a class="" data-toggle="collapse" data-target="#more_hall" style="width:10%;color:blue;"><span><<更多>></span></a>	
						                     <div id="more_hall" class="collapse">
							                     <ul class="conditions_select" >	
							                        <div id="all_field_hall4"></div><div  style="clear:left;"></div>
							                        <div id="all_field_hall5"></div><div  style="clear:left;"></div>
							                        <div id="all_field_hall6">							                                                	 		    		       		    		    
								       		    </ul> 
							       		    </div>
							       	    </div>				       
							        </div>
							    </div>
							</div>
						</div>
					
						<div class="row">
							<div  class="col-xs-12">
								<div style="color:yellow;"><span>&nbsp;*</span>&nbsp;所选信息</div>	
							</div>					
							<div  class="col-xs-12">
							    <div class="panel panel-default" style="  ">
							        <div class="panel-body" >
							       	    <div  class="col-xs-12" id="query_conditions">
							       		     <ul class="conditions_select" id="choose_field_hall">
						   		    
							       		     </ul> 
							       	    </div>				       
							        </div>
							     </div>
							</div>	
						</div>	
          <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
 	          <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="submitByHall();">确定</button>
	      </div>
				  </div> 
			  </div>			  			  
	      </div>	       
	      <!-- <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
 	          <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="submitByHall();">确定</button>
	      </div>  -->
    </div>
  </div>
</div>
<!-- Modal end-->


<script type="text/javascript">
$(document).ready(function() {	
	modalInit();
	pageInit();
	title_tip();	
});

//模态框初始化
function modalInit(){	
	var data = {};
	$.ajax({
	    type: "post",
	    url:  "${basePath}/storeBattleMap/modalInit.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: false,
	    success: function(result){	    		        
	    	modalLayout(result.custs,result.halls,result.typeOrder,result.channelSelectdIds)
	    }
	});
}
//页面初始化
function pageInit(){	
	var data = {};
	data["ids"] = [];
	data["tag1"] = $("select[name='tag1']").val();
	data["month"] = $("input[name='month']").val();
	data["cusOrgacode"] = $("select[name='cusOrgacode']").val();
	$.ajax({
	    type: "post",
	    url:  "${basePath}storeBattleMap/listHallOfCustomer.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: false,
	    success: function(result){	    		        
	    	showPortrays(result.portrays);
			showCusOrgacode(result.customers);
			//showHallInCus(result.halls);
			showBMap(result.halls,result.otherlist);
	    }
	});
	
	 data["ids"] = [];
	data["tag1"] = $("select[name='tag1']").val();
	data["month"] = $("input[name='month']").val();
	data["cusOrgacode"] = $("select[name='cusOrgacode']").val();
	$.ajax({
	    type: "post",
	    url:  "${basePath}storeBattleMap/listHallOfCustomer.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: false,
	    success: function(result){	    		        
	    	showPortrays(result.portrays);
			//showCusOrgacode(result.customers);
			showHallInCus(result.halls);
			showBMap(result.halls,result.otherlist);
	    }
	}); 
	
	
	
	
	
	
	
	
}

//点击品牌
function clickBrand(){	
	var data = {};	
	data["tag1"] = $("select[name='tag1']").val();
	data["month"] = $("input[name='month']").val();
	data["cusOrgacode"] = $("select[name='cusOrgacode']").val();
	var ids = [];
	$("#all_field input:checkbox:checked").each(function() {
		var val = $(this).val();
		ids.push(val);
	});
	data["ids"] = ids;
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}storeBattleMap/listHallOfCustomer.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: false,
	    success: function(result){	 
	    	showPortrays(result.portrays);
			showHallInCus(result.halls);
	        showBMap(result.halls,result.otherlist);
	    }
	});
}
/* 处理客商复选框请求的确定事件  */

function submitByCust(){	
	var data = {};
	var ids = [];
	$("#all_field input:checkbox:checked").each(function() {
		var val = $(this).val();
		ids.push(val);
	});
	data["ids"] = ids;
	data["tag1"] = $("select[name='tag1']").val();
	data["month"] = $("input[name='month']").val();
	data["cusOrgacode"] = $("select[name='cusOrgacode']").val();
	data["orgacode"] = $("select[name='orgacode']").val();
	var selected = $("#orgacode").select2("data");
	data["longitude"] = selected[0].longitude;
	data["latitude"] = selected[0].latitude;
	 
  
	$.ajax({
	    type: "post",
	    url:  "${basePath}storeBattleMap/listHallOfCustomer.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: false,
	    success: function(result){	    		        
	    	showPortrays(result.portrays);    
	    	
	    	var  orgacode = $("select[name='orgacode']").val();
	    	if(orgacode != ""){
	    		 $.each(otherMarkers,function(index,item){   
	    			 item.show(); 
	    		 });
	    	}else{
	    		 $.each(otherMarkers,function(index,item){   
	    			 item.hide(); 
	    		 });
	    	}	
	    	showBMap(result.halls,result.otherlist,result.vo);
	    }
	});
}




/* 处理厅店复选框的确定事件  */
function submitByHall(){	
	var data = {};
	var ids = [];
	$("#all_field input:checkbox:checked").each(function() {
		var val = $(this).val();
		ids.push(val);
	});
	data["ids"] = ids;
	data["tag1"] = $("select[name='tag1']").val();
	data["month"] = $("input[name='month']").val();
	data["cusOrgacode"] = $("select[name='cusOrgacode']").val();
	data["orgacode"] = $("select[name='orgacode']").val();
	var selected = $("#orgacode").select2("data");
	data["longitude"] = selected[0].longitude;
	data["latitude"] = selected[0].latitude;
	 
  
	$.ajax({
	    type: "post",
	    url:  "${basePath}storeBattleMap/listHallOfCustomer.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: false,
	    success: function(result){	    		        
	    	if(result.portrays!=null){
	    	showPortrays(result.portrays);    
	    	}
	    	var  orgacode = $("select[name='orgacode']").val();
	    	if(orgacode != ""){
	    		 $.each(otherMarkers,function(index,item){   
	    			 item.show(); 
	    		 });
	    	}else{
	    		 $.each(otherMarkers,function(index,item){   
	    			 item.hide(); 
	    		 });
	    	}	
	    	showBMap(result.halls,result.otherlist,result.vo);
	    }
	});
}

function submitByHall_click(id,cusOrgacode){	
		var data = {};
		var ids = [];
		$("#all_field input:checkbox:checked").each(function() {
			var val = $(this).val();
			ids.push(val);
		});
		data["ids"] = ids;
		data["tag1"] = $("select[name='tag1']").val();
		data["month"] = $("input[name='month']").val();
		//
		data["cusOrgacode"] = $("select[name='cusOrgacode']").val();
		data["orgacode"] = $("select[name='orgacode']").val();
	   if(id != null ){
		   data["orgacode"] = id;
		}else{
			data["orgacode"] = $("select[name='orgacode']").val();
		}
		$.ajax({
		    type: "post",
		    url:  "${basePath}/storeBattleMap/listHallAndGetOneHallOther.do",
		    contentType: 'application/json',
		    data: JSON.stringify(data),
		    dataType: "json",
		    async: false,
		    success: function(result){	    	
		        //showBMap(result.list,result.otherlist);
		    	showPortrays(result.portrays);    		
		    }
		});
	}

</script>

</body>
</html>