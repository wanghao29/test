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
<title>渠道客户画像</title>
</head>
 
<body>
<style type="text/css">
	 .conditions_select li{
		float: left;
		width: 16%;
		list-style: none;
	 }
 	.absolute-div{
		width:100%;
	}
	
	input[type="checkbox"], input[type="radio"] {
	    height: 18px;
	    width: 18px;
	}
	label {
	    font-size: 20px;
	}	
</style>
<script type="text/javascript" src="<%=basePath%>resources/js/storeBattleMap/map_portray.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/storeBattleMap/hall_identity_map.js"></script>
 
<div class="row" style=" ">
    <div class="col-xs-6">
       <div class="row">  
       		<div class="col-xs-2" style=" ">
	 				<select name="cityNam" class="select" style="width: 100%;"  id="citySelect" onchange="pageInit()">

		       		</select>
		     </div>
			<div class="col-xs-2" style=" ">
			   	     <input name="statMonth"  type="text" style="width: 100%;" readonly="readonly"class="form-text select prevMonth"
			   	  		onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M-1}',onpicked:pageInit})" />
			</div>
			<div class="col-xs-2" style=" " >
				<p style="position:absolute;"  class="absolute-div">
			        <select name="termBrnd" id="termBrnd" class="select_searchable" style="float:left;width: 100%;" >
			        </select>
	      		</p>
			</div>
			<div class="col-xs-2" style="margin-left:1%;" >
				<p style="position:absolute;"  class="absolute-div">
			        <select name="termMdl" id="termMdl" class="select_searchable"  style="float:left;width: 100%;" >
			            <option value="">全部机型</option>
			        </select>
	      		</p>
			</div>
			<div class="col-xs-2" style="margin-left:1%;">
				<p style="position:absolute;"  class="absolute-div">
			        <select name="name" id="name" class="select_searchable_T"  style="float:left;width: 100%;" >
			            <option value="">全部门店</option>
			        </select>
	      		</p>
			</div>
			
	        <div style="margin-left:89%;" >
                <a id="hallModalShow" href="${basePath}/hallIdentityMap/modalShow.do" data-toggle="modal" data-target="#hallModal" style="height:100%;">明细查询</a>	         	
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
		                <div class="box-content" id="portray1" style="border: 1px solid #558baf!important;height: 200px;margin-top: 10px;">
		                    <!--<img src="images/m21.png">-->
		                </div>
		            </div>
			</div>
			<div class="col-xs-6"> 
					<div class="box">
		                <div class="box-head">
		                	<div class="title" id="portray2_cnName"></div>
							<button   id="modalShow" class="select"  data-toggle="modal" data-target="#modal"
								style="width:150px;  background-color:#083d5c;border-width:1px; position: absolute;right: 17px;top: 0px;">关注特征定制</button>		                	
		                </div>
		                <div class="box-content" id="portray2" style="border: 1px solid #558baf!important;height: 200px;margin-top: 10px;">
		                    <!--<img src="images/m21.png">-->
		                </div>
		            </div>
			</div>
		</div>
		 <div class="row" style="margin-top: 25px;">
			<div class="col-xs-6"> 
					<div class="box">
		                <div class="box-head"><div class="title" id="portray3_cnName"></div></div>
		                <div class="box-content" id="portray3" style="border: 1px solid #558baf!important;height: 200px;margin-top: 10px;">
		                    <!--<img src="images/m21.png">-->
		                </div>
		            </div>
			</div>
			<div class="col-xs-6"> 
					<div class="box">
		                <div class="box-head"><div class="title" id="portray4_cnName"></div></div>
		                <div class="box-content" id="portray4" style="border: 1px solid #558baf!important;height: 200px;margin-top: 10px;">
		                    <!--<img src="images/m21.png">-->
		                </div>
		            </div>
			</div>
		</div>
		 <div class="row" style="margin-top: 25px;">
			<div class="col-xs-6"> 
					<div class="box">
		                <div class="box-head"><div class="title" id="portray5_cnName"></div></div>
		                <div class="box-content" id="portray5" style="border: 1px solid #558baf!important;height: 250px;margin-top: 10px;">
		                    <!--<img src="images/m21.png">-->
		                </div>
		            </div>
			</div>
			<div class="col-xs-6"> 
					<div class="box">
		                <div class="box-head"><div class="title" id="portray6_cnName"></div></div>
		                <div class="box-content" id="portray6" style="border: 1px solid #558baf!important;height: 250px;margin-top: 10px;">
		                    <!--<img src="images/m21.png">-->
		                </div>
		            </div>
			</div>
		</div>
	</div>	
</div>



<!-- 关注特性定制 Modal start-->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" style="width:80%;margin-top:5%;">
    <div class="modal-content">
	      <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	          <h4 class="modal-title" id="myModalLabel">
				  厂商门店定制	          
	           </h4>
	      </div>   
	      <div class="modal-body">
			  <div id="myTabContent" class="tab-content">				  
					  
					    <div class="row">
					    	<div  class="col-xs-12">
							  	<span class=" " style="color: yellow;" ><span >&nbsp;*</span>&nbsp;可选信息</span>
							</div>						  	
							<div  class="col-xs-12">
							    <div class="panel panel-default" style="  ">
							        <div class="panel-body" >
							       	    <div  class="col-xs-12">
							       		    <ul class="conditions_select" id="all_field1">	
     		    							                      
						                     </ul> 
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
							       		     <ul class="conditions_select" id="choose_field1">
					   		    
							       		     </ul> 
							       	    </div>				       
							        </div>
							     </div>
							</div>	
						</div>									  

			  </div>			  			  
	      </div>	       
	      <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
 	          <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="modalSubmit();">确定</button>
	      </div> 
    </div>
  </div>
</div>
<!-- 关注特性定制 Modal end-->


<!-- Modal start-->
<div class="modal fade" id="hallModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="">
  <div class="modal-dialog" role="document" style=" width: 80%;">
    <div class="modal-content">

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
	    url:  "${basePath}/hallIdentityMap/modalInit.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: false,
	    success: function(result){	  
	    	var portrays = result.portrays;
	    	var hallQudaoM = result.hallQudaoM;
	    	for(var i=0; i<portrays.length;i++){
	    		var cusChan = portrays[i];
		    	if(isEmptyObject(hallQudaoM)){
		    		if(cusChan.choice==1){
		    			$("#all_field1").append('<li><label><input type="checkbox" value="'+cusChan.id+'" checked />&nbsp;'+cusChan.cnName+'</label></li>');
		    		}else{
		    			$("#all_field1").append('<li><label><input type="checkbox" value="'+cusChan.id+'"/>&nbsp;'+cusChan.cnName+'</label></li>');
		    		}	
		    	}else{
		    		if(hallQudaoM.indexOf(cusChan.id)>-1){
		    			$("#all_field1").append('<li><label><input type="checkbox" value="'+cusChan.id+'" checked />&nbsp;'+cusChan.cnName+'</label></li>');
		    		}else{
		    			$("#all_field1").append('<li><label><input type="checkbox" value="'+cusChan.id+'"/>&nbsp;'+cusChan.cnName+'</label></li>');
		    		}	
		    	}
	    	}
	    	
	    	$("#all_field1 input:checkbox:checked").each(function() {
	        	var parent = $(this).parent();
	        	var cnName = parent.text();
	    	    $("#choose_field1").append('<li><label>&nbsp;'+cnName+'</label></li>');
	    	});
	    	
	    	//添加点击事件
	        $("#all_field1 input:checkbox").change(function(){   	
	        	if($("#all_field1 input:checkbox:checked").length>6){
	        		alert("最多勾选6个关注特征");
	        		$(this).click();
	        		return;
	        	}
	        	$("#choose_field1").html("");
	        	$("#all_field1 input:checkbox:checked").each(function() {
	            	var parent = $(this).parent();
	            	var cnName = parent.text();
	        	    $("#choose_field1").append('<li><label>&nbsp;'+cnName+'</label></li>');
	        	});
	        });
	    }
	});
}
function modalSubmit(){	
	var data = {};
	data["cityNam"] = $("select[name='cityNam']").val();
	data["statMonth"] = $("input[name='statMonth']").val();
	data["termBrnd"] = $("select[name='termBrnd']").val();
	data["termMdl"] = $("select[name='termMdl']").val();
	var ids = [];
	$("#all_field1 input:checkbox:checked").each(function() {
		var val = $(this).val();
		ids.push(val);
	});
	data["ids"] = ids;
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}/hallIdentityMap/modalSubmit.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: false,
	    success: function(result){	
	    	showPortrays(result.portrays);
	    }
	});
}

//页面初始化
function pageInit(){
	var data = {};
	data["cityNam"] = $("select[name='cityNam']").val();
	data["statMonth"] = $("input[name='statMonth']").val();
	$.ajax({
	    type: "post",
	    url:  "${basePath}/hallIdentityMap/initOrClickbrand.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: false,
	    success: function(result){		    	
	    	showPortrays(result.portrays);
	    	showBMap(result.list);
	    	showTermBrnd(result.brands);
	    	showTermMdl(result.specs);	
	    	showName(result.list);
	    }
	});
	
};

//点击品牌
function clickbrand(){
	var data = {};
	data["cityNam"] = $("select[name='cityNam']").val();
	data["statMonth"] = $("input[name='statMonth']").val();
	data["termBrnd"] = $("select[name='termBrnd']").val();
	var ids = [];
	$("#all_field1 input:checkbox:checked").each(function() {
		var val = $(this).val();
		ids.push(val);
	});
	data["ids"] = ids;
	$.ajax({
	    type: "post",
	    url:  "${basePath}/hallIdentityMap/initOrClickbrand.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: false,
	    success: function(result){		    	
	    	showPortrays(result.portrays);
	    	showBMap(result.list);
	    	showTermMdl(result.specs);	
	    	showName(result.list);
	    }
	});
};

//点击机型
function clickMdl(){
	var data = {};
	data["cityNam"] = $("select[name='cityNam']").val();
	data["statMonth"] = $("input[name='statMonth']").val();
	data["termBrnd"] = $("select[name='termBrnd']").val();
	data["termMdl"] = $("select[name='termMdl']").val();
	var ids = [];
	$("#all_field1 input:checkbox:checked").each(function() {
		var val = $(this).val();
		ids.push(val);
	});
	data["ids"] = ids;
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}/hallIdentityMap/clickMdlOrName.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: false,
	    success: function(result){		    	
	    	showPortrays(result.portrays);
	    	showBMap(result.list);
	    	showName(result.list);
	    }
	});
}

//点击门店
function clickName(){
	var data = {};
	data["cityNam"] = $("select[name='cityNam']").val();
	data["statMonth"] = $("input[name='statMonth']").val();
	data["termBrnd"] = $("select[name='termBrnd']").val();
	data["termMdl"] = $("select[name='termMdl']").val();
	data["name"] = $("select[name='name']").val();
	var ids = [];
	$("#all_field1 input:checkbox:checked").each(function() {
		var val = $(this).val();
		ids.push(val);
	});
	data["ids"] = ids;
	
	var selected = $("#name").select2("data");
	data["longitude"] = selected[0].longitude;
	data["latitude"] = selected[0].latitude;
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}/hallIdentityMap/clickMdlOrName.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: false,
	    success: function(result){		    	
	    	showPortrays(result.portrays);
	    	showBMap(result.list,data);
	    }
	});
}

</script>

</body>
</html>