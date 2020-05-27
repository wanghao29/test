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
<title>厅店动态特征</title>

</head>
<body>
<style type="text/css">
.title-no-border{
	color: #5bfdff;
	font-size: 18px;
	margin-left: 12px;
}
.conditions_select li{
	float: left;
	width: 16%;
	list-style: none;
}
.fieldGroup{
	color:#5bfdff;
	clear:both;
} 
.content div{
  color: #FFFFFF;
}
input[type="checkbox"], input[type="radio"] {
    height: 18px;
    width: 18px;
}
label {
    font-size: 20px;
}
.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
    height: 27px;
    margin-top: 15px;
}
</style>
<div class="row">
	<ol class="breadcrumb">
	  <li><a href="#">厅店特征</a></li>
	  <li class=" ">厅店动态特征</li>
	</ol>
</div>
 	<form id="queryForm">
 	<div class="row" style="">
       		<div class="col-xs-1" style=" ">
	 				<select name="areaname_dynamicModal" class="select" style="width: 100%;"  id="citySelect_dynamicModal">

		       		</select>
		    </div>
		    
			<div class="col-xs-2" style="margin-left:1%;">
			   	     <input name="startDay_dynamicModal" id="startDay_dynamicModal" type="text" style="width: 40%;" class="form-text select startDay"
			   	  		onClick="WdatePicker({dateFmt:'yyyyMMdd',maxDate:'#F{$dp.$D(\'endDay_dynamicModal\')}'})"  readonly="readonly"/>
			   	     &nbsp;至&nbsp;
			   	     <input name="endDay_dynamicModal" id="endDay_dynamicModal"   type="text" style="width: 40%;" class="form-text select endDay"
			   	  		onClick="WdatePicker({dateFmt:'yyyyMMdd',minDate:'#F{$dp.$D(\'startDay_dynamicModal\')}',maxDate:'%y-{%M-1}-%ld'})" readonly="readonly"/>			   	  		
			</div>		    
			<div class="col-xs-1" >
 	 				   <div style="width:100%;position:absolute;">
					        <select name="cusOrgacode" id="cusOrgacode" style="float:left;width: 100%;border-radius:22px;background-color:#00063a;height: 30px;border:1px solid #558baf;" class="">
								<%-- <c:forEach var="item" items="${customers}">
								         <option value="${item.id}" <c:if test="${item.cusOrgacode==vo.cusOrgacode}"></c:if>
								         	<c:out value="${item.text}" />
								         </option>
								</c:forEach> 		 --%>			        
					        </select>
			       		</div>
 	 				</div>        	
            <div class="col-xs-2" style="margin-left:1%;">
		        <div class="input-group">
		        	<span class="input-group-addon">厅店编码</span>
		            <input type="text" name="code_dynamicModal" class="form-control">		            
		        </div>	
		    </div>
            <div class="col-xs-2" style="margin-left:1%;">
		        <div class="input-group">
		        	<span class="input-group-addon">厅店名称</span>
		            <input type="text" name="name_dynamicModal" class="form-control">		            
		        </div>	
		    </div>			
						
			<div class="col-xs-1" style="margin-left:1%;"> 
				<button type="button" onclick="jqgridReload_dynamic()" class="btn btn-primary" style="width:100%"> 查&nbsp;&nbsp;询</button>
			</div> 	
			<div class="col-xs-1" style="margin-left:1%;"> 
				<button type="button" 
					onclick="exportExcel('list_dynamic','厅店动态特征')" 
					class="btn btn-primary" style="width:100%" > 导出EXCEL</button>
			</div>							
 	</div>
 	

	<div  class="row" >
		<p><span class="title-no-border"><span style="background-color: #5bfdff;">|</span >&nbsp;可选条件</span></p>
		<div  class="col-xs-12">
			<div class="panel panel-default jqgrid_width">
				  <div class="panel-body"id="all_field_dynamic" >				       

	       		    <ul class="conditions_select" >
	       		        <li class="fieldGroup"><label><input type="checkbox" class="type1_all"/>&nbsp;基础信息：</label></li>
	       		    	<li><label><input type="checkbox" value="statDay"  class="type1" checked />&nbsp;日期</label></li>
	       		    	<li><label><input type="checkbox" value="areaname"  class="type1" checked />&nbsp;地市</label></li>
	       		    	<li><label><input type="checkbox" value="hallBossCd"  class="type1" checked />&nbsp;BOSS系统编码</label></li>
	       		    	<li><label><input type="checkbox" value="hallName"  class="type1" checked />&nbsp;营业厅名称</label></li>
	       		    	<li><label><input type="checkbox" value="cntimport" class="type1" />&nbsp;进货量</label></li>
	       		    	<li><label><input type="checkbox" value="cntso" class="type1" />&nbsp;销量</label></li>
	       		    	<li><label><input type="checkbox" value="cntdepot" class="type1" />&nbsp;库存量</label></li>
	       		    	<li><label><input type="checkbox" value="feezdb" class="type1" />&nbsp;终端补贴金额</label></li>
	       		    	<li><label><input type="checkbox" value="feezdcj" class="type1" />&nbsp;终端酬金金额</label></li>
	       		    	                       
	       		    	<li><label><input type="checkbox" value="cntnew" class="type1" />&nbsp;新增入网数</label></li>
	       		    	<li><label><input type="checkbox" value="cntmaybechg" class="type1" />&nbsp;预计换机客户数</label></li>
	       		    	<li><label><input type="checkbox" value="cntyd" class="type1" />&nbsp;移动购机入网数</label></li>
	       		    	<li><label><input type="checkbox" value="cntself" class="type1" />&nbsp;自带机入网数</label></li>
 	       		    	<li><label><input type="checkbox" value="cnt4gp" class="type1" />&nbsp;4G+终端入网数</label></li>
	       		    	<li><label><input type="checkbox" value="cntother" class="type1" />&nbsp;全网通入网终端数</label></li>
	       		    	<li><label><input type="checkbox" value="cellcnt" class="type1" />&nbsp;覆盖基站数</label></li>
	       		    	<li><label><input type="checkbox" value="nonhealth" class="type1" />&nbsp;不健康量占比</label></li>
                     
                        <li class="fieldGroup"><label><input type="checkbox" class="type2_all"/>&nbsp;销售平台大类：</label></li>
	       		    	<li><label><input type="checkbox" value="pvzd" class="type2" />&nbsp;终端公司</label></li>
	       		    	<li><label><input type="checkbox" value="pvoppo" class="type2" />&nbsp;欧珀</label></li>
	       		    	<li><label><input type="checkbox" value="pvbbg" class="type2" />&nbsp;步步高</label></li>
	       		    	<li><label><input type="checkbox" value="pvjingl" class="type2" />&nbsp;金立</label></li>
 	       		    	<li><label><input type="checkbox" value="pvaishid" class="type2" />&nbsp;爱施德</label></li>
	       		    	<li><label><input type="checkbox" value="pvtianying" class="type2" />&nbsp;天音</label></li>
	       		    	<li><label><input type="checkbox" value="pvdouwei" class="type2" />&nbsp;朵唯</label></li>
	       		    	<li><label><input type="checkbox" value="pvhendahe" class="type2" />&nbsp;恒大和</label></li>
	       		    	<li><label><input type="checkbox" value="pvother" class="type2" />&nbsp;其他平台</label></li>

                        <li class="fieldGroup"><label><input type="checkbox" class="type3_all"/>&nbsp;换机品牌大类：</label></li>
	       		    	<li><label><input type="checkbox" value="chgbrandtop1" class="type3" />&nbsp;TOP1换机品牌</label></li>
	       		    	<li><label><input type="checkbox" value="chgbrandtop2" class="type3" />&nbsp;TOP2换机品牌</label></li>
	       		    	<li><label><input type="checkbox" value="chgbrandtop3" class="type3" />&nbsp;TOP3换机品牌</label></li>
	       		    	<li><label><input type="checkbox" value="chgpricetop1" class="type3" />&nbsp;TOP1换机价位段</label></li>
 	       		    	<li><label><input type="checkbox" value="chgpricetop2" class="type3" />&nbsp;TOP2换机价位段</label></li>
	       		    	<li><label><input type="checkbox" value="chgpricetop3" class="type3" />&nbsp;TOP3换机价位段</label></li>
	       		    	<li><label><input type="checkbox" value="chgspectop1" class="type3" />&nbsp;TOP1换机机型</label></li>
	       		    	<li><label><input type="checkbox" value="chgspectop2" class="type3" />&nbsp;TOP2换机机型</label></li>
	       		    	<li><label><input type="checkbox" value="chgspectop3" class="type3" />&nbsp;TOP3换机机型</label></li>
	       		    	<li><label><input type="checkbox" value="chgspectop4" class="type3" />&nbsp;TOP4换机机型</label></li>
	       		    	<li><label><input type="checkbox" value="chgspectop5" class="type3" />&nbsp;TOP5换机机型</label></li>                      
                     </ul> 
                     <div  style="clear:left;"></div>
                     <a class="" data-toggle="collapse" data-target="#more_dynamic" style="width:10%;"><span><<更多>></span></a>	
                     <div id="more_dynamic" class="collapse">
                     <ul class="conditions_select" >	
                        
                        <li class="fieldGroup"><label><input type="checkbox" class="type4_all"/>&nbsp;销售品牌大类：</label></li>
	       		    	<li><label><input type="checkbox" value="sobrandtop1"  class="type4" />&nbsp;TOP1销售品牌</label></li>
	       		    	<li><label><input type="checkbox" value="sobrandtop2"  class="type4" />&nbsp;TOP2销售品牌</label></li>
	       		    	<li><label><input type="checkbox" value="sobrandtop3"  class="type4" />&nbsp;TOP3销售品牌</label></li>
	       		    	<li><label><input type="checkbox" value="sopricetop1"  class="type4" />&nbsp;TOP1销售价位段</label></li>
 	       		    	<li><label><input type="checkbox" value="sopricetop2"  class="type4" />&nbsp;TOP2销售价位段</label></li>
	       		    	<li><label><input type="checkbox" value="sopricetop3"  class="type4" />&nbsp;TOP3销售价位段</label></li>
	       		    	<li><label><input type="checkbox" value="sospectop1"  class="type4" />&nbsp;TOP1销售机型</label></li>
	       		    	<li><label><input type="checkbox" value="sospectop2"  class="type4" />&nbsp;TOP2销售机型</label></li>
	       		    	<li><label><input type="checkbox" value="sospectop3"  class="type4" />&nbsp;TOP3销售机型</label></li>
	       		    	<li><label><input type="checkbox" value="sospectop4"  class="type4" />&nbsp;TOP4销售机型</label></li>
	       		    	<li><label><input type="checkbox" value="sospectop5"  class="type4" />&nbsp;TOP5销售机型</label></li>  
                        </div>	 		    		       		    		    
	       		    </ul> 
				       				       
				  </div>
			</div>
		</div>
	</div>
	
<!-- 
	<div  class="row" >
		<p ><span class="title-no-border"><span style="background-color: #5bfdff;">|</span >&nbsp;可选条件</span></p>
		<div  class="col-xs-12">
			<div class="panel panel-default" style="  ">
				  <div class="panel-body"  id="query_conditions">

	       		     <ul class="conditions_select" id="choose_field">
	   		    
	       		     </ul> 
			       
				  </div>
			</div>
		</div>
	</div>
 --> 		

    <div  class="row">	
        <p ><span class="title-no-border"><span style="background-color: #5bfdff;">|</span >&nbsp;查询结果</span></p>
    	<div class="col-xs-12" style="padding-left:10px;min-height:250px;">
    	     <table id="list_dynamic"></table> 
			 <div id="pager_dynamic"></div>
		  </div> 	
 	</div>	


<script type="text/javascript">
$(document).ready(function() {
	//时间控件设置初始时间	
	var yearMonth = getPrevMonthValue();
	var year = yearMonth.substring(0,4);
	var month = yearMonth.substring(4,6);
	//var startDay = year  + month  + '01';
	var startDay = "20191001";
	var day = new Date(year,month,0); 
	//var endDay = year + month + day.getDate();
	var endDay = "20191031";
	$("#startDay_dynamicModal").val(startDay);
	$("#endDay_dynamicModal").val(endDay);
	//城市下拉框初始化
	citySelectInit($('#citySelect_dynamicModal'));
	clickCity();
	$("#citySelect_dynamicModal").change(function(){
		   clickCity();
	   });
	
	
		
	//顶部菜单切换
	$("#menu li").attr("class","drop");
	$("#hallIdentifyInfo").attr("class","active");	

	jqgridInit_dynamic()
    
    //给checkbox增加点击事件
    $("#all_field_dynamic input:checkbox").change(function(){    	
    	var isChecked = $(this).prop("checked");
    	var col = $(this).val();
    	if(isChecked){
    		jQuery("#list_dynamic").setGridParam().showCol(col).trigger("reloadGrid");
    	}else{
    		jQuery("#list_dynamic").setGridParam().hideCol(col).trigger("reloadGrid");
    	}
    	jqgrid_colChange("list_dynamic");
    });
    $("#all_field_dynamic input:checkbox")[0].click();
    $("#all_field_dynamic input:checkbox")[0].click();

    //全选取消
    var arr = ['type1','type2','type3','type4'];
    for(var h=0; h<arr.length; h++){
    	var cls = arr[h];
    	var all_cls = cls+"_all";
    	quanxuan(all_cls,cls);
    }   
});

//全选取消
function quanxuan(type_all,type){
	$("."+type_all).click(function(){
		var isChecked = $(this).prop("checked");
		$("."+type).prop("checked",isChecked);
		
    	var jqgridId = "list_dynamic";
     	var cols = [];
    	$("."+type).each(function(){
         	var col = $(this).val();
         	cols.push(col);
    	});  

    	if(isChecked){
       		jQuery("#"+jqgridId).setGridParam().showCol(cols).trigger("reloadGrid");		
    	}else{
       		jQuery("#"+jqgridId).setGridParam().hideCol(cols).trigger("reloadGrid");		
    	} 
	});
}

var len_dynamic;
function getparam_dynamicModal(){
	var data = {};
	data["areaname"] = $("select[name='areaname_dynamicModal']").val();
	data["startDay"] = $("input[name='startDay_dynamicModal']").val();
	data["endDay"] = $("input[name='endDay_dynamicModal']").val();
	data["code"] = $("input[name='code_dynamicModal']").val();
	data["name"] = $("input[name='name_dynamicModal']").val();	
	var cusOrgacode =$('#cusOrgacode option:selected');
	 var pp=cusOrgacode.text();
	 if(data["name"]!="" && pp=="全部门店"){
			data["name"]=data["name"];	
		}else if(data["name"]=="" && pp=="全部门店"){
			
			data["name"]=pp;		
		}else if(data["name"]==pp){
			data["name"]=data["name"];
			
			
		}else if(data["name"]!=pp && data["name"]!="" ){
			data["name"]=88988;
			
			
		}else if(data["name"]=="" && pp!="" ){
			data["name"]=pp;
			
			
		}
	
	return data;
}

function jqgridReload_dynamic(){
	jqgrid_reload("list_dynamic",getparam_dynamicModal());
};
/* 初始化表格 */
function jqgridInit_dynamic(){
    var colNames = [ 
                '日期','地市','BOSS系统编码','营业厅名称','进货量','销量','库存量','终端补贴金额','终端酬金金额', //17
                '新增入网数','预计换机客户数','移动购机入网数','自带机入网数','4G+终端入网数','全网通入网终端数','覆盖基站数','不健康量占比',
                '终端公司','欧珀','步步高','金立','爱施德','天音','朵唯','恒大和','其他平台',                    //9
                'TOP1换机品牌','TOP2换机品牌','TOP3换机品牌','TOP1换机价位段','TOP2换机价位段','TOP3换机价位段', //11
                	'TOP1换机机型','TOP2换机机型','TOP3换机机型','TOP4换机机型','TOP5换机机型',
                'TOP1销售品牌','TOP2销售品牌','TOP3销售品牌','TOP1销售价位段','TOP2销售价位段','TOP3销售价位段', //11
                	'TOP1销售机型','TOP2销售机型','TOP3销售机型','TOP4销售机型','TOP5销售机型'

              ]	;
    var colModel = [ 
                {name : 'statDay',index : 'statDay',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                {name : 'areaname',index : 'areaname',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                {name : 'hallBossCd',index : 'hallBossCd',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                {name : 'hallName',index : 'hallName',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},                    
                {name : 'cntimport',index : 'cntimport',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'cntso',index : 'cntso',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'cntdepot',index : 'cntdepot',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'feezdb',index : 'feezdb',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'feezdcj',index : 'feezdcj',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},

                {name : 'cntnew',index : 'cntnew',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'cntmaybechg',index : 'cntmaybechg',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'cntyd',index : 'cntyd',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'cntself',index : 'cntself',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'cnt4gp',index : 'cnt4gp',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'cntother',index : 'cntother',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'cellcnt',index : 'cellcnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},	    
                {name : 'nonhealth',index : 'nonhealth',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},    
                
                {name : 'pvzd',index : 'pvzd',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'pvoppo',index : 'pvoppo',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'pvbbg',index : 'pvbbg',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'pvjingl',index : 'pvjingl',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'pvaishid',index : 'pvaishid',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'pvtianying',index : 'pvtianying',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'pvdouwei',index : 'pvdouwei',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},	    
                {name : 'pvhendahe',index : 'pvhendahe',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'pvother',index : 'pvother',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                
                {name : 'chgbrandtop1',index : 'chgbrandtop1',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'chgbrandtop2',index : 'chgbrandtop2',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'chgbrandtop3',index : 'chgbrandtop3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'chgpricetop1',index : 'chgpricetop1',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'chgpricetop2',index : 'chgpricetop2',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'chgpricetop3',index : 'chgpricetop3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'chgspectop1',index : 'chgspectop1',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},	    
                {name : 'chgspectop2',index : 'chgspectop2',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'chgspectop3',index : 'chgspectop3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'chgspectop4',index : 'chgspectop4',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},	
                {name : 'chgspectop5',index : 'chgspectop5',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},	
                
                {name : 'sobrandtop1',index : 'sobrandtop1',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'sobrandtop2',index : 'sobrandtop2',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'sobrandtop3',index : 'sobrandtop3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'sopricetop1',index : 'sopricetop1',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'sopricetop2',index : 'sopricetop2',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'sopricetop3',index : 'sopricetop3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'sospectop1',index : 'sospectop1',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},	    
                {name : 'sospectop2',index : 'sospectop2',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'sospectop3',index : 'sospectop3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                {name : 'sospectop4',index : 'sospectop4',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},	
                {name : 'sospectop5',index : 'sospectop5',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}
              ];	
	jqgrid_init("list_dynamic","pager_dynamic","${basePath}hallIdentifyInfo/listHallDynamic.do",{},colNames,colModel,"orgacode");
}

function list_dynamic_setGroupHeaders(){
	  jQuery("#list_dynamic").jqGrid('destroyGroupHeader');
	  //合并最顶表头
	  jQuery("#list_dynamic").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    {startColumnName: 'statDay', numberOfColumns: 17, titleText: '基础信息'},
		    {startColumnName: 'pvzd', numberOfColumns: 9, titleText: ' 销售平台大类'},
		    {startColumnName: 'chgbrandtop1', numberOfColumns: 11, titleText: '换机品牌大类'},
		    {startColumnName: 'sobrandtop1', numberOfColumns: 11, titleText: '销售品牌大类'}	,
		    {startColumnName: 'sibrandtop1', numberOfColumns: 11, titleText: '提货品牌大类'}	
		    ]  
	  });
}


//新增搜索门店功能的实现
function clickCity(){	

	var data = {};
	data["areaname"] = $("select[name='areaname_dynamicModal']").val();
	data["startMonth"] = $("input[name='startDay_dynamicModal']").val();
	data["endMonth"] = $("input[name='endDay_dynamicModal']").val();
	//data["subtype"] = "1";
	//data["cusOrgacode"] = $("#cusOrgacode").val();
	

	$.ajax({
	    type: "post",
	    url:  "${basePath}customerChannel/clickCityHall.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	  $("#cusOrgacode").empty(); 
	    	 for(var i=0;i<result.length;i++){
           	  showCusOrgacode(result);
	    		//$("#cusOrgacode").append("<option value='"+result[i]+"'>"+result[i]+"</option>");
	    		
	    	}         
	    }
	});
}
//厂商
function showCusOrgacode(customers){	
	var id = "cusOrgacode";
    
    $("#"+id).empty();
    $("#cusOrgacode").append("<option value=''>全部门店</option>"); 
    $("#"+id).select2({    	
    	data:customers,    	
    });
    $("#"+id).off("select2:select");
    $("#"+id).on("select2:select",function(e){ 
    	//clickCustomer();
	});
}




</script>



	
</body>
</html>