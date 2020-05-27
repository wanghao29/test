<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
%>

<style type="text/css">
.conditions_select li{
float: left;
width: 16%;
list-style: none;
}

<%-- 全部字段中分组 --%>
.fieldGroup{
	color:#67f8ff;
	clear:both;
} 
<%-- 表格头部 --%>
.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
    height: 38px;
}

<%-- 表格分页栏：第  页 --%>
.ui-jqgrid .ui-pg-input, .ui-jqgrid .ui-jqgrid-toppager .ui-pg-input {
    text-align: center;
    color: #000000;
}

<%-- 表格tbody tr --%>
.ui-jqgrid tr.jqgrow, .ui-jqgrid-htable th.ui-th-ltr, .ui-jqgrid tr.ui-row-ltr td, .ui-jqgrid .ui-jqgrid-pager .ui-pager-control {
    border-left-width: 1px;
    border-left-color: inherit;
    border-left-style: solid;
}
</style>


<%-- modal-content start --%>
<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <h4 class="modal-title" id="myModalLabel">| 特征查询 </h4>
</div>

<%-- modal bady start--%>
<div class="modal-body" id="frame_type_all">
    <div class="row">        
	    <div class="row">
	  	    <span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;查询条件 &nbsp;</span>  	  	
	    </div>	    
        <div class="row" style="margin-left:5px;">  
       		<div class="col-xs-2" style=" ">
	 				<select name="areaname_dynamicModal" class="select" style="width: 100%;"  id="citySelect_dynamicModal">

		       		</select>
		    </div>
		    
			<div class="col-xs-4" style="margin-left:1%;">
			   	     <input name="startDay_dynamicModal" id="startDay_dynamicModal" type="text" style="width: 45%;" class="form-text select startDay"
			   	  		onClick="WdatePicker({dateFmt:'yyyyMMdd',maxDate:'#F{$dp.$D(\'endDay_dynamicModal\')}'})"  readonly="readonly"/>
			   	     &nbsp;至&nbsp;
			   	     <input name="endDay_dynamicModal" id="endDay_dynamicModal"   type="text" style="width: 45%;" class="form-text select endDay"
			   	  		onClick="WdatePicker({dateFmt:'yyyyMMdd',minDate:'#F{$dp.$D(\'startDay_dynamicModal\')}',maxDate:'%y-{%M-1}-%ld'})" readonly="readonly"/>			   	  		
			</div>		    


            <div class="col-xs-2" style="margin-left:1%;">
		        <div class="input-group">
		        	<span class="input-group-addon">客商编码</span>
		            <input type="text" name="code_dynamicModal" class="form-control">		            
		        </div>	
		    </div>
            <div class="col-xs-2" style="margin-left:1%;">
		        <div class="input-group">
		        	<span class="input-group-addon">客商名称</span>
		            <input type="text" name="name_dynamicModal" class="form-control">		            
		        </div>	
		    </div>	
						
			<div class="col-xs-1" style="margin-left:1%;"> 
				<button type="button" onclick="jqgridReload_dynamic()" class="btn btn-primary" style="width:100px"> 查询</button>
			</div> 
						
        </div>             
	</div>        

    <div class="row">
	  	<span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;可选信息</span>
  	</div>
	<div  class="col-xs-12">
	    <div class="panel panel-default" style="  ">
	        <div class="panel-body" >
	       	    <div  class="col-xs-12" id="all_field_dynamic">
	       		    <ul class="conditions_select" >
	       		        <li class="fieldGroup"><label><input type="checkbox" class="group base_all"/>&nbsp;基础信息：</label></li>
	       		    	<li><label><input type="checkbox" value="statDay"  checked class="group base"/>&nbsp;日期</label></li>
	       		    	<li><label><input type="checkbox" value="areaname"  checked class="group base"/>&nbsp;地市</label></li>
	       		    	<li><label><input type="checkbox" value="orgacode"  checked class="group base"/>&nbsp;渠道客户编码</label></li>
	       		    	<li><label><input type="checkbox" value="custname"  checked class="group base"/>&nbsp;渠道客户名称</label></li>
	       		    	<li><label><input type="checkbox" value="cntsi" class="group base"/>&nbsp;提货量</label></li>
	       		    	<li><label><input type="checkbox" value="cntso" class="group base"/>&nbsp;销量</label></li>
	       		    	<li><label><input type="checkbox" value="cntdepot" class="group base"/>&nbsp;库存量</label></li>
	       		    	<li><label><input type="checkbox" value="feezdb" class="group base"/>&nbsp;终端补贴金额</label></li>
	       		    	<li><label><input type="checkbox" value="feezdcj" class="group base"/>&nbsp;终端酬金金额</label></li>
	       		    	                       
	       		    	<li><label><input type="checkbox" value="cntnew" class="group base"/>&nbsp;新增入网数</label></li>
	       		    	<li><label><input type="checkbox" value="cntmaybechg" class="group base"/>&nbsp;预计换机客户数</label></li>
	       		    	<li><label><input type="checkbox" value="cntyd" class="group base"/>&nbsp;移动购机入网数</label></li>
	       		    	<li><label><input type="checkbox" value="cntself" class="group base"/>&nbsp;自带机入网数</label></li>
 	       		    	<li><label><input type="checkbox" value="cnt4gp" class="group base"/>&nbsp;4G+终端入网数</label></li>
	       		    	<li><label><input type="checkbox" value="cntother" class="group base"/>&nbsp;全网通入网终端数</label></li>
	       		    	<li><label><input type="checkbox" value="cellcnt" class="group base"/>&nbsp;覆盖基站数</label></li>
	       		    	<li><label><input type="checkbox" value="nonhealth" class="group base"/>&nbsp;不健康量占比</label></li>
                     
                        <li class="fieldGroup"><label><input type="checkbox" class="group pv_all"/>&nbsp;销售平台大类：</label></li>
	       		    	<li><label><input type="checkbox" value="pvzd" class="group pv"/>&nbsp;终端公司</label></li>
	       		    	<li><label><input type="checkbox" value="pvoppo" class="group pv"/>&nbsp;欧珀</label></li>
	       		    	<li><label><input type="checkbox" value="pvbbg" class="group pv"/>&nbsp;步步高</label></li>
	       		    	<li><label><input type="checkbox" value="pvjingl" class="group pv"/>&nbsp;金立</label></li>
 	       		    	<li><label><input type="checkbox" value="pvaishid" class="group pv"/>&nbsp;爱施德</label></li>
	       		    	<li><label><input type="checkbox" value="pvtianying" class="group pv"/>&nbsp;天音</label></li>
	       		    	<li><label><input type="checkbox" value="pvdouwei" class="group pv"/>&nbsp;朵唯</label></li>
	       		    	<li><label><input type="checkbox" value="pvhendahe" class="group pv"/>&nbsp;恒大和</label></li>
	       		    	<li><label><input type="checkbox" value="pvother" class="group pv"/>&nbsp;其他平台</label></li>
                      
                     </ul> 
                     <div  style="clear:left;"></div>
                     <a class="" data-toggle="collapse" data-target="#more_dynamic" style="width:10%;"><span><<更多>></span></a>	
                     <div id="more_dynamic" class="collapse">
                     <ul class="conditions_select" >	
                     
                        <li class="fieldGroup"><label><input type="checkbox" class="group chg_all"/>&nbsp;换机品牌大类：</label></li>
	       		    	<li><label><input type="checkbox" value="chgbrandtop1" class="group chg"/>&nbsp;TOP1换机品牌</label></li>
	       		    	<li><label><input type="checkbox" value="chgbrandtop2" class="group chg"/>&nbsp;TOP2换机品牌</label></li>
	       		    	<li><label><input type="checkbox" value="chgbrandtop3" class="group chg"/>&nbsp;TOP3换机品牌</label></li>
	       		    	<li><label><input type="checkbox" value="chgpricetop1" class="group chg"/>&nbsp;TOP1换机价位段</label></li>
 	       		    	<li><label><input type="checkbox" value="chgpricetop2" class="group chg"/>&nbsp;TOP2换机价位段</label></li>
	       		    	<li><label><input type="checkbox" value="chgpricetop3" class="group chg"/>&nbsp;TOP3换机价位段</label></li>
	       		    	<li><label><input type="checkbox" value="chgspectop1" class="group chg"/>&nbsp;TOP1换机机型</label></li>
	       		    	<li><label><input type="checkbox" value="chgspectop2" class="group chg"/>&nbsp;TOP2换机机型</label></li>
	       		    	<li><label><input type="checkbox" value="chgspectop3" class="group chg"/>&nbsp;TOP3换机机型</label></li>
	       		    	<li><label><input type="checkbox" value="chgspectop4" class="group chg"/>&nbsp;TOP4换机机型</label></li>
	       		    	<li><label><input type="checkbox" value="chgspectop5" class="group chg"/>&nbsp;TOP5换机机型</label></li>
                        
                        <li class="fieldGroup"><label><input type="checkbox" class="group so_all"/>&nbsp;销售品牌大类：</label></li>
	       		    	<li><label><input type="checkbox" value="sobrandtop1" class="group so"/>&nbsp;TOP1销售品牌</label></li>
	       		    	<li><label><input type="checkbox" value="sobrandtop2" class="group so"/>&nbsp;TOP2销售品牌</label></li>
	       		    	<li><label><input type="checkbox" value="sobrandtop3" class="group so"/>&nbsp;TOP3销售品牌</label></li>
	       		    	<li><label><input type="checkbox" value="sopricetop1" class="group so"/>&nbsp;TOP1销售价位段</label></li>
 	       		    	<li><label><input type="checkbox" value="sopricetop2" class="group so"/>&nbsp;TOP2销售价位段</label></li>
	       		    	<li><label><input type="checkbox" value="sopricetop3" class="group so"/>&nbsp;TOP3销售价位段</label></li>
	       		    	<li><label><input type="checkbox" value="sospectop1" class="group so"/>&nbsp;TOP1销售机型</label></li>
	       		    	<li><label><input type="checkbox" value="sospectop2" class="group so"/>&nbsp;TOP2销售机型</label></li>
	       		    	<li><label><input type="checkbox" value="sospectop3" class="group so"/>&nbsp;TOP3销售机型</label></li>
	       		    	<li><label><input type="checkbox" value="sospectop4" class="group so"/>&nbsp;TOP4销售机型</label></li>
	       		    	<li><label><input type="checkbox" value="sospectop5" class="group so"/>&nbsp;TOP5销售机型</label></li>   
	       		    	
	       		    	<li class="fieldGroup"><label><input type="checkbox" class="group si_all"/>&nbsp;提货品牌大类：</label></li>
	       		    	<li><label><input type="checkbox" value="sibrandtop1" class="group si"/>&nbsp;TOP1提货品牌</label></li>
	       		    	<li><label><input type="checkbox" value="sibrandtop2" class="group si"/>&nbsp;TOP2提货品牌</label></li>
	       		    	<li><label><input type="checkbox" value="sibrandtop3" class="group si"/>&nbsp;TOP3提货品牌</label></li>
	       		    	<li><label><input type="checkbox" value="sipricetop1" class="group si"/>&nbsp;TOP1提货价位段</label></li>
 	       		    	<li><label><input type="checkbox" value="sipricetop2" class="group si"/>&nbsp;TOP2提货价位段</label></li>
	       		    	<li><label><input type="checkbox" value="sipricetop3" class="group si"/>&nbsp;TOP3提货价位段</label></li>
	       		    	<li><label><input type="checkbox" value="sispectop1" class="group si"/>&nbsp;TOP1提货机型</label></li>
	       		    	<li><label><input type="checkbox" value="sispectop2" class="group si"/>&nbsp;TOP2提货机型</label></li>
	       		    	<li><label><input type="checkbox" value="sispectop3" class="group si"/>&nbsp;TOP3提货机型</label></li>
	       		    	<li><label><input type="checkbox" value="sispectop4" class="group si"/>&nbsp;TOP4提货机型</label></li>
	       		    	<li><label><input type="checkbox" value="sispectop5" class="group si"/>&nbsp;TOP5提货机型</label></li>                                          
                        </div>	 		    		       		    		    
	       		    </ul> 
	       	    </div>				       
	        </div>
	    </div>
	</div>
	</div>

	<div class="row">
		<span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;所选信息</span>
	</div>
	<div  class="col-xs-12">
	    <div class="panel panel-default" style="  ">
	        <div class="panel-body" >
	       	    <div  class="col-xs-12" id="query_conditions">
	       		     <ul class="conditions_select" id="choose_field_dynamic">
	   		    
	       		     </ul> 
	       	    </div>				       
	        </div>
	     </div>
	</div>
      
  	<div class="row" >
  	  	<span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;查询结果</span>
       	<div class="col-xs-12" style="margin-left:9px;padding-right:15px;">
    	     <table id="list_dynamic"></table> 
			 <div id="pager_dynamic"></div>
		</div>   	  	
	</div>

   <%-- modal bady end--%>
<!--    
   <div class="modal-footer">
       <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
       <button type="button" class="btn btn-primary" data-dismiss="" onclick="query_conditions_submit()">确定</button> 
   </div>
-->
</div>
<%-- modal-content end --%>

<script type="text/javascript">
$(document).ready(function() {
	//带搜索的下拉框样式初始化
	$('.select_searchable_dynamicModal').searchableSelect();
	//时间控件设置初始时间
	$(".prevMonth_dynamicModal").val(getPrevMonthValue());
	//城市下拉框初始化
	citySelectInit($('#citySelect_dynamicModal'));


    //弹框初始化，同步搜索条件
    pageinit_dynamicModal();
    setTimeout("jqgridInit_dynamic()",500); 
    
    //弹框前执行
    $('#normalModal').on('show.bs.modal', function () {
        pageinit_dynamicModal();
        jqgridReload_dynamic();
    });   
    
    //给checkbox增加点击事件
    $("#all_field_dynamic input:checkbox").change(function(){
    	$("#choose_field_dynamic").html("");
    	$("#all_field_dynamic ul li").each(function() {
    		var cla= $(this).attr("class");
    		var text = $(this).text();
    		var inputVal = $(this).children("label").children("input").val();
    		var inputIsChecked = $(this).children("label").children("input").prop("checked");
    		if(inputVal=="on"){
    			$("#choose_field_dynamic").append('<li class="'+cla+'"><label>&nbsp;'+text+'</label></li>');
    		}else if(inputIsChecked==true){
    			$("#choose_field_dynamic").append('<li class="'+cla+'"><label>&nbsp;'+text+'</label></li>');
    		}    		
    	});

    	
    	var isChecked = $(this).prop("checked");
    	var col = $(this).val();
    	if(isChecked){
    		jQuery("#list_dynamic").setGridParam().showCol(col).trigger("reloadGrid");
    	}else{
    		jQuery("#list_dynamic").setGridParam().hideCol(col).trigger("reloadGrid");
    	}
    	$("#list_dynamic").setGridWidth(len);
    	setGroupHeaders();
    });
    $("#all_field_dynamic input:checkbox")[0].click();
    $("#all_field_dynamic input:checkbox")[0].click();
    
    //全选取消
    var arr = ['base','pv','chg','so','si'];
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
    	if(isChecked){
        	$("."+type).each(function(){
        		jQuery("#"+jqgridId).setGridParam().showCol($(this).val()).trigger("reloadGrid");
        	});  		
    	}else{
        	$("."+type).each(function(){
        		jQuery("#"+jqgridId).setGridParam().hideCol($(this).val()).trigger("reloadGrid");
        	});    		
    	}
    	$("#"+jqgridId).setGridWidth(len);
    	setGroupHeaders();
	});
}

function choose_field(){
	$("#choose_field_dynamic").html("");
	$("#all_field_dynamic input:checkbox").each(function() {
	    var isChecked = $(this).prop("checked");
	    var value = $(this).val();
    	var parent = $(this).parent();
    	var cnName = parent.text();
    	console.log(value);
    	if(value==null || value==""){
    		alert(cnName);
    		$("#choose_field_dynamic").append('<li style="color:#67f8ff;clear:both;"><label>&nbsp;'+cnName+'</label></li>');
    	}	    
	});	
} 

var len;
function getparam_dynamicModal(){
	var data = {};
	data["areaname"] = $("select[name='areaname_dynamicModal']").val();
	data["startDay"] = $("input[name='startDay_dynamicModal']").val();
	data["endDay"] = $("input[name='endDay_dynamicModal']").val();
	data["code"] = $("input[name='code_dynamicModal']").val();
	data["name"] = $("input[name='name_dynamicModal']").val();	
	return data;
}

function jqgridReload_dynamic(){
	$("#list_dynamic").jqGrid('clearGridData'); 
	$("#list_dynamic").jqGrid('setGridParam',{  
		  postData : getparam_dynamicModal(),
		  datatype:'json',
	      page:1
	}).trigger("reloadGrid");
};
/* 初始化表格 */
function jqgridInit_dynamic(){
	  jQuery("#list_dynamic").jqGrid({
	        url:"${basePath}customerIdentifyInfo/listCustDynamic.do",
	        mtype:'post',
	        datatype: "json",
	        loadonce:true,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:getparam_dynamicModal(),      
	        colNames : [ 
	                     '日期','地市','渠道客户编码','渠道客户名称','提货量','销量','库存量','终端补贴金额','终端酬金金额',
	                     '新增入网数','预计换机客户数','移动购机入网数','自带机入网数','4G+终端入网数','全网通入网终端数','覆盖基站数','不健康量占比',
	                     '终端公司','欧珀','步步高','金立','爱施德','天音','朵唯','恒大和','其他平台',
	                     'TOP1换机品牌','TOP2换机品牌','TOP3换机品牌','TOP1换机价位段','TOP2换机价位段','TOP3换机价位段',
	                     	'TOP1换机机型','TOP2换机机型','TOP3换机机型','TOP4换机机型','TOP5换机机型',
	                     'TOP1销售品牌','TOP2销售品牌','TOP3销售品牌','TOP1销售价位段','TOP2销售价位段','TOP3销售价位段',
	                     	'TOP1销售机型','TOP2销售机型','TOP3销售机型','TOP4销售机型','TOP5销售机型',
	                     'TOP1提货品牌','TOP2提货品牌','TOP3提货品牌','TOP1提货价位段','TOP2提货价位段','TOP3提货价位段',
	                     	'TOP1提货机型','TOP2提货机型','TOP3提货机型','TOP4提货机型','TOP5提货机型',

	                   ],
	        colModel : [ 
	                     //sortable : 默认true
	                     //search   : 默认true
	                     //sorttype : "float"、"int"
	                     //searchoptions:{sopt:['eq','bw']：op=、 eq=等于、ne=不等、lt=小于、le=小于等于、gt=大于、
	                     //ge=大于等于、bw=开始于、bn=不开始、in=在内、ni=不在内、ew=结束于、en=不结束于、cn=包含、nc=不包含
	                     {name : 'statDay',index : 'statDay',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
	                     {name : 'areaname',index : 'areaname',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
	                     {name : 'orgacode',index : 'orgacode',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
	                     {name : 'custname',index : 'custname',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},                    
	                     {name : 'cntsi',index : 'cntsi',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
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
	                     {name : 'sospectop5',index : 'sospectop5',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     
	                     {name : 'sibrandtop1',index : 'sibrandtop1',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'sibrandtop2',index : 'sibrandtop2',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'sibrandtop3',index : 'sibrandtop3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'sipricetop1',index : 'sipricetop1',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'sipricetop2',index : 'sipricetop2',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'sipricetop3',index : 'sipricetop3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'sispectop1',index : 'sispectop1',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},	    
	                     {name : 'sispectop2',index : 'sispectop2',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'sispectop3',index : 'sispectop3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'sispectop4',index : 'sispectop4',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},	
	                     {name : 'sispectop5',index : 'sispectop5',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}	                     
	                   ],
	        rowNum:5,        
	        rowList : [5,10,30,50], 
	        rownumbers: true,    //行首添加顺序编码
	        rownumWidth: 60,     //行首添加顺序编码的列宽
	        autowidth: true,     //表格宽度 刚加载时自动适应父div   ,然后随列调整宽度
	        height : "100%",     //表格宽度自动适应行数
	        sortorder: "asc",    //指定列排序的次序
	        viewrecords : true,  //显示当前记录，和总记录数 
	        sortname: 'cityCd', //默认排序
	        repeatitems: true,   //是否可重复
	        shrinkToFit:true,     //可伸缩, true时使列宽可调整   false时设置的水平滚动才有效/也可能留出空白右侧
	        forceFit:true,
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
	        pager: '#pager_dynamic',     //指定分页组件所在div id 
	        pagination: true,
	        caption : "",
	      });
	  len=$("#list_dynamic").getGridParam("width");  
	  
	  setGroupHeaders();
};

function setGroupHeaders(){
	  //合并最顶表头
	  jQuery("#list_dynamic").jqGrid('destroyGroupHeader');
	  jQuery("#list_dynamic").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    {startColumnName: 'statDay', numberOfColumns: 17, titleText: '基础信息'},
		    {startColumnName: 'pvzd', numberOfColumns: 9, titleText: ' 销售平台大类'},
		    {startColumnName: 'chgbrandtop1', numberOfColumns: 11, titleText: '换机品牌大类'},
		    {startColumnName: 'sobrandtop1', numberOfColumns: 11, titleText: '销售品牌大类'}	    
		    ]  
	  });
}


//页面初始化
function pageinit_dynamicModal(){	
 	$("select[name='areaname_dynamicModal']").val($("select[name='areaname']").val());
	var yearMonth = $("input[name='smonth']").val();
	var year = yearMonth.substring(0,4);
	var month = yearMonth.substring(4,6);
	var startDay = year  + month  + '01';
	var day = new Date(year,month,0); 
	var endDay = year + month + day.getDate();
	$("#startDay_dynamicModal").val(startDay);
	$("#endDay_dynamicModal").val(endDay);
}

</script>
