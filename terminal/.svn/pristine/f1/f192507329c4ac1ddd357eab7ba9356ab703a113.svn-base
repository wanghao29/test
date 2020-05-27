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
<style   type="text/css">
 	.absolute-div{
		width:100%;
	}
/* 	.content>div div {
	  	color: #FFFFFF !important;
	}  */
</style>

<script type="text/javascript" src="<%=basePath%>resources/js/storeBattleMap/cell_identity_map.js"></script>
  <!--在线地图-->
 <!--    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=F19q5OcuWjjkMN55MFhqBU1h3GFfW0S3"></script> -->

    
<div class="row" style=" ">
    <div class="col-xs-6">
       <div class="row">  
       		<div class="col-xs-2" style=" ">
	 				<select name="cityNam" class="select" style="width: 100%;"  id="citySelect">
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
			<div class="col-xs-2" style="margin-left:1%;" >
				<p style="position:absolute;"  class="absolute-div">
			        <select name="name" id="name" class="select_searchable"  style="float:left;width: 100%;" >
			            <option value="">全部基站</option>
			        </select>
	      		</p>
			</div>
       </div>
	   <div class="row" style="margin: 30px 20px 20px 20px ;border: 1px solid #558baf!important;padding: 5px 5px 5px 5px;"> 
	   
	        <div class="main-map" id="hotMapShow" style="height: 790px;">
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
		                <div class="box-head"><div class="title" id="portray2_cnName"></div></div>
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


<script type="text/javascript">

$(document).ready(function() {
	pageInit();	
	title_tip();
});

//页面初始化 或者 点击品牌
function pageInit(){	
	var data = {};
	data["cityNam"] = $("select[name='cityNam']").val();
	data["statMonth"] = $("input[name='statMonth']").val();
	$.ajax({
	    type: "post",
	    url:  "${basePath}/cellIdentityMap/initOrClickbrand.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
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
	//（控件加载，不属于点击，通过isTermBrndClick判断而不执行）
	if(!isTermBrndClick){
		return;
	}
	
	var data = {};
	data["cityNam"] = $("select[name='cityNam']").val();
	data["statMonth"] = $("input[name='statMonth']").val();
	data["termBrnd"] = $("select[name='termBrnd']").val();
	$.ajax({
	    type: "post",
	    url:  "${basePath}/cellIdentityMap/initOrClickbrand.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){		    	
	    	showPortrays(result.portrays);
	    	showBMap(result.list);
	    	showTermMdl(result.specs);	
	    	showName(result.list);
	    }
	});
};

// 点击机型
function clickMdl(){
	//（控件加载，不属于点击，通过isTermBrndClick判断而不执行）
	if(!isTermMdlClick){
		return;
	}
	
	var data = {};
	data["cityNam"] = $("select[name='cityNam']").val();
	data["statMonth"] = $("input[name='statMonth']").val();
	data["termBrnd"] = $("select[name='termBrnd']").val();
	data["termMdl"] = $("select[name='termMdl']").val();
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}/cellIdentityMap/clickMdlOrName.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){		    	
	    	showPortrays(result.portrays);
	    	showBMap(result.list);
	    	showName(result.list);
	    }
	});
}

function clickName(){	
	var data = {};
	data["cityNam"] = $("select[name='cityNam']").val();
	data["statMonth"] = $("input[name='statMonth']").val();
	data["termBrnd"] = $("select[name='termBrnd']").val();
	data["termMdl"] = $("select[name='termMdl']").val();
	data["name"] = $("select[name='name']").val();
	
	var selected = $("#name").select2("data");
	data["longitude"] = selected[0].longitude;
	data["latitude"] = selected[0].latitude;
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}/cellIdentityMap/clickMdlOrName.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){		    	
	    	showPortrays(result.portrays);
	    	showBMap(result.list,data);	    		    		    		    	
	    }
	});
}
</script>

</body>
</html>