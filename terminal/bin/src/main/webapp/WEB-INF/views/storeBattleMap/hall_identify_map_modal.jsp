<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
%>

<style type="text/css">
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
  <h4 class="modal-title" id="myModalLabel">| 定制查询 </h4>
</div>

<%-- modal bady start--%>
<div class="modal-body" id="frame_type_all">
    <div class="row">        
	    <div class="row">
	  	    <span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;查询条件 &nbsp;</span>  	  	
	    </div>	    
        <div class="row" style="margin-left:5px;">  
       		<div class="col-xs-2" style=" ">
	 				<select name="cityNam_modal" class="select" style="width: 100%;"  id="citySelect_modal" onchange="pageResetInit_modal()">

		       		</select>
		    </div>
			<div class="col-xs-2" style="">
			   	     <input name="statMonth_modal"  type="text" style="width: 100%;" readonly="readonly"class="form-text select prevMonth_modal"
			   	  		onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M-1}',onpicked:pageResetInit_modal})" />
			</div>
			<div class="col-xs-2" style="padding-" >
				<p style="position:absolute;"  class="absolute-div">
			        <select name="termBrnd_modal" id="termBrnd_modal" class="select_searchable_modal" style="float:left;width: 96%;" >
			        </select>
	      		</p>
			</div>
			<div class="col-xs-2" style="">
				<p style="position:absolute;"  class="absolute-div">
			        <select name="termMdl_modal" id="termMdl_modal" class="select_searchable_modal"  style="float:left;width: 96%;" >
			            <option value="">全部机型</option>
			        </select>
	      		</p>
			</div>
			<div class="col-xs-2" style="" >
				<p style="position:absolute;"  class="absolute-div">
			        <select name="name_modal" id="name_modal" class="select_searchable_modal"  style="float:left;width: 96%;" >
			            <option value="">全部门店</option>
			        </select>
	      		</p>
			</div>		
			
			<div class="col-xs-1" style=""> 
				<button type="button" onclick="jqgrid_reload('list',getparam_modal())" class="btn btn-primary" style="width:100%"> 查询</button>
			</div> 
			
		    <div class="col-xs-1" style=""> 
				<button type="button" 
					onclick="exportExcel('list','厂商门店信息')" 
					class="btn btn-primary" style="width:100%" > 导出EXCEL</button>
			</div>
						
        </div>             
	</div>        

      
    <div class="row">
	  	<span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;可选信息</span>
  	</div>
	<div  class="col-xs-12">
	    <div class="panel panel-default jqgrid_width" style="  ">
	        <div class="panel-body" >
	       	    <div  class="col-xs-12" id="query_conditions">
	       		    <ul class="conditions_select" id="all_field">
	       		    	<li class="fieldGroup"><label><input type="checkbox" class="type1_all"/>&nbsp;基本信息：</label></li>	
	       		    	<li><label><input type="checkbox" value="statMonth"  checked class="type1" />&nbsp;月份</label></li> 
	       		    	<li><label><input type="checkbox" value="cityCd"  checked class="type1" />&nbsp;地市</label></li>  
	       		    	<li><label><input type="checkbox" value="termBrnd" checked class="type1" />&nbsp;品牌</label></li> 
	       		    	<li><label><input type="checkbox" value="termMdl" checked class="type1" />&nbsp;型号</label></li> 
	       		    	<li><label><input type="checkbox" value="a4gPlusInd"   checked class="type1" />&nbsp;是否4G+</label></li> 
	       		    	<li><label><input type="checkbox" value="cnthCd" class="type1" />&nbsp;县</label></li> 
	       		    	<li><label><input type="checkbox" value="cnthCd" class="type1" />&nbsp;镇</label></li> 
	       		    	<li><label><input type="checkbox" value="hallNam"    class="type1" />&nbsp;厅店名称</label></li>  
	       		    	<li><label><input type="checkbox" value="hallLongitude" class="type1" />&nbsp;厅店经度</label></li> 
	       		    	<li><label><input type="checkbox" value="hallLatitude" class="type1" />&nbsp;厅店纬度</label></li> 
	       		    	<li><label><input type="checkbox" value="cntstock"    class="type1" />&nbsp;存量用户数</label></li> 
	       		    	<li><label><input type="checkbox" value="cntnew"    class="type1" />&nbsp;新入网量</label></li> 
	       		    	<li><label><input type="checkbox" value="cntmaybechg"  class="type1" />&nbsp;预计换机客户数</label></li> 
	       		    	<li><label><input type="checkbox" value="cntyd"  class="type1" />&nbsp;移动购机入网数</label></li> 
	       		    	<li><label><input type="checkbox" value="cntself"  class="type1" />&nbsp;自带机入网数</label></li> 
	       		    	<li><label><input type="checkbox" value="cntin" class="type1" />&nbsp;换入用户数</label></li> 
	       		    	<li><label><input type="checkbox" value="cntout" class="type1" />&nbsp;换出用户数</label></li> 
	       		    	<li><label><input type="checkbox" value="loyalty" class="type1" />&nbsp;品牌忠诚度</label></li> 
	       		    	<li><label><input type="checkbox" value="malecnt" class="type1" />&nbsp;男性数量</label></li> 
	       		    	<li><label><input type="checkbox" value="femalecnt" class="type1" />&nbsp;女性数量</label></li> 

	       		    	<li><label><input type="checkbox" value="arpu" class="type1" />&nbsp;arpu</label></li> 
	       		    	<li><label><input type="checkbox" value="mou" class="type1" />&nbsp;mou</label></li> 
	       		    	<li><label><input type="checkbox" value="dou" class="type1" />&nbsp;dou</label></li> 	
	       		    	
	       		    	<li class="fieldGroup"><label><input type="checkbox" class="type2_all"/>&nbsp;供货平台销量：</label></li>
	       		    	<li><label><input type="checkbox" value="pvzd" class="type2" />&nbsp;终端公司</label></li> 
	       		    	<li><label><input type="checkbox" value="pvoppo" class="type2" />&nbsp;欧珀</label></li> 
	       		    	<li><label><input type="checkbox" value="pvbbg" class="type2" />&nbsp;步步高</label></li> 
	       		    	<li><label><input type="checkbox" value="pvjingli" class="type2" />&nbsp;金立</label></li> 
	       		    	<li><label><input type="checkbox" value="pvaishide" class="type2" />&nbsp;爱施德</label></li> 
	       		    	<li><label><input type="checkbox" value="pvtianying" class="type2" />&nbsp;天音</label></li> 
	       		    	<li><label><input type="checkbox" value="pvdouwei" class="type2" />&nbsp;朵唯</label></li> 
	       		    	<li><label><input type="checkbox" value="pvhendahe" class="type2" />&nbsp;恒大和</label></li> 
	       		    	<li><label><input type="checkbox" value="pvother" class="type2"  />&nbsp;其他平台</label></li>  
	       		    	
	       		    	<li class="fieldGroup"><label><input type="checkbox" class="type3_all"/>&nbsp;用户年龄段：</label></li>
	       		    	<li><label><input type="checkbox" value="agecnt0" class="type3" />&nbsp;年龄未知</label></li> 
	       		    	<li><label><input type="checkbox" value="agecnt1" class="type3" />&nbsp;年龄<18</label></li> 
	       		    	<li><label><input type="checkbox" value="agecnt2" class="type3" />&nbsp;年龄18-21</label></li> 
	       		    	<li><label><input type="checkbox" value="agecnt3" class="type3" />&nbsp;年龄21-25</label></li> 
	       		    	<li><label><input type="checkbox" value="agecnt4" class="type3" />&nbsp;年龄25-30</label></li> 
	       		    	<li><label><input type="checkbox" value="agecnt5" class="type3" />&nbsp;年龄30-40</label></li> 	       		    	
	       		    	<li><label><input type="checkbox" value="agecnt6" class="type3" />&nbsp;年龄40-50</label></li> 
	       		    	<li><label><input type="checkbox" value="agecnt7" class="type3" />&nbsp;年龄50+</label></li> 
	       		    	
	       		    	<li class="fieldGroup"><label><input type="checkbox" class="type4_all"/>&nbsp;用户职业大类：</label></li>
	       		    	<li><label><input type="checkbox" value="jobswcnt" class="type4" />&nbsp;商务人士</label></li> 
	       		    	<li><label><input type="checkbox" value="jobblcnt" class="type4" />&nbsp;白领人士</label></li> 
	       		    	<li><label><input type="checkbox" value="jobxycnt" class="type4" />&nbsp;校园客户</label></li> 
	       		    	<li><label><input type="checkbox" value="jobnmcnt" class="type4" />&nbsp;农民客户（个体户）</label></li> 	
	       		    	<li><label><input type="checkbox" value="jobwlcnt" class="type4" />&nbsp;外来人口</label></li> 
	       		    	<!-- <li><label><input type="checkbox" value="jobunknowcnt" class="type4" />&nbsp;职业未知</label></li>  -->      		    		       		    		    
	       		    </ul> 
	       	    </div>				       
	        </div>
	    </div>
	</div>

<!-- 	<div class="row">
		<span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;所选信息</span>
	</div>
	<div  class="col-xs-12">
	    <div class="panel panel-default" style="  ">
	        <div class="panel-body" >
	       	    <div  class="col-xs-12" id="query_conditions">
	       		     <ul class="conditions_select" id="choose_field">
	   		    
	       		     </ul> 
	       	    </div>				       
	        </div>
	     </div>
	</div> -->
      
  	<div class="row" >
  	  	<span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;查询结果</span>
       	<div class="col-xs-12" style="margin-left:6px;padding-right:15px;">
    	     <table id="list"></table> 
			 <div id="pager"></div>
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
	$('.select_searchable_modal').select2();
	//城市下拉框初始化
	citySelectInit($('#citySelect_modal'));


    //弹框初始化，同步搜索条件
    pageinit_modal();
    setTimeout(function(){jqgridInit()},200);

    //弹框
    $('#hallModal').on('show.bs.modal', function () {
        pageinit_modal();
        setTimeout(function(){jqgrid_reload("list",{})},200);
    });   
    
    //给checkbox增加点击事件
    $("#all_field input:checkbox").click(function(){
/*     	$("#choose_field").html("");
    	$("#all_field input:checkbox:checked").each(function() {
        	var parent = $(this).parent();
        	var cnName = parent.text();
    	    $("#choose_field").append('<li><label>&nbsp;'+cnName+'</label></li>');
    	}); */
    	
    	var isChecked = $(this).prop("checked");
    	var col = $(this).val();
    	if(isChecked){
    		jQuery("#list").setGridParam().showCol(col).trigger("reloadGrid");
    	}else{
    		jQuery("#list").setGridParam().hideCol(col).trigger("reloadGrid");
    	}
    	jqgrid_colChange("list");
    });
/*     $("#all_field input:checkbox")[0].click();
    $("#all_field input:checkbox")[0].click(); */

    
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
		
     	var jqgridId = "list";
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

function getparam_modal(){
	var data = {};
	data["cityNam"] = $("select[name='cityNam_modal']").val();
	data["statMonth"] = $("input[name='statMonth_modal']").val();
	data["termBrnd"] = $("select[name='termBrnd_modal']").val();
	data["termMdl"] = $("select[name='termMdl_modal']").val();
	data["name"] = $("select[name='name_modal']").val();
	return data;
}

/* 初始化表格 */
function jqgridInit(){
    var colNames = [ '月份', '地市', '品牌', '型号', '是否4G+','县', '镇' , '厅店名称','厅店经度','厅店纬度',
                 '存量用户数','新入网量','预计换机客户数','移动购机入网数','自带机入网数','换入用户数','换出用户数','品牌忠诚度','男性数量','女性数量',
                 'arpu','mou','dou',	                     
                 '终端公司','欧珀','步步高','金立','爱施德','天音','朵唯','恒大和','其他平台',
                 '年龄未知','年龄<18','年龄18-21','年龄21-25','年龄25-30','年龄30-40','年龄40-50','年龄50+',
                 '商务人士','白领人士','校园客户','农民客户（个体户）','外来人口'
               ];
    var colModel = [ 
                 {name : 'statMonth',index : 'statMonth',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'cityCd',index : 'cityCd',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'termBrnd',index : 'termBrnd',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'termMdl',index : 'termMdl',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'a4gPlusInd',index : 'a4gPlusInd',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'cnthCd',index : 'cnthCd',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'townCd',index : 'townCd',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'hallNam',index : 'hallNam',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'hallLongitude',index : 'hallLongitude',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'hallLatitude',index : 'hallLatitude',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 
                 {name : 'cntstock',index : 'cntstock',hidden:true,sorttype:"int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 	                     
                 {name : 'cntnew',index : 'cntnew',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'cntmaybechg',index : 'cntmaybechg',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'cntyd',index : 'cntyd',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'cntself',index : 'cntself',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'cntin',index : 'cntin',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'cntout',index : 'cntout',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'loyalty',index : 'loyalty',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'malecnt',index : 'malecnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 	                     
                 {name : 'femalecnt',index : 'femalecnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
                 
                 {name : 'arpu',index : 'arpu',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'mou',index : 'mou',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'dou',index : 'dou',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 
                 {name : 'pvzd',index : 'pvzd',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'pvoppo',index : 'pvoppo',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'pvbbg',index : 'pvbbg',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'pvjingli',index : 'pvjingli',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'pvaishide',index : 'pvaishide',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'pvtianying',index : 'pvtianying',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'pvdouwei',index : 'pvdouwei',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'pvhendahe',index : 'pvhendahe',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'pvother',index : 'pvother',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 
                 {name : 'agecnt0',index : 'agecnt0',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'agecnt1',index : 'agecnt1',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'agecnt2',index : 'agecnt2',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'agecnt3',index : 'agecnt3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'agecnt4',index : 'agecnt4',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'agecnt5',index : 'agecnt5',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'agecnt6',index : 'agecnt6',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'agecnt7',index : 'agecnt7',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 
                 {name : 'jobswcnt',index : 'jobswcnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'jobblcnt',index : 'jobblcnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'jobxycnt',index : 'jobxycnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'jobnmcnt',index : 'jobnmcnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'jobwlcnt',index : 'tag3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}
                 /* {name : 'jobunknowcnt',index : 'jobunknowcnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']} */
               ];
	jqgrid_init("list","pager","${basePath}hallIdentityMap/listAllHallQudao.do",{},colNames,colModel,"cityCd");
};

function list_setGroupHeaders(){
	  jQuery("#list").jqGrid('destroyGroupHeader');
	  //合并最顶表头
	  jQuery("#list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    {startColumnName: 'statMonth', numberOfColumns: 23, titleText: '基础信息'},
		    {startColumnName: 'pvzd', numberOfColumns: 9, titleText: '供货平台销量'},
		    {startColumnName: 'agecnt0', numberOfColumns: 8, titleText: '用户年龄段'},
		    {startColumnName: 'tbapplecnt', numberOfColumns:6, titleText: '用户职业大类'},	    
		    ]  
	  });
}

//页面初始化
function pageinit_modal(){	   
	var termBrnds = getAllOption("#termBrnd");
	var termBrnd = $("select[name='termBrnd']").val();
    $("#termBrnd_modal").empty().select2({data: termBrnds});
    $("#termBrnd_modal").val(termBrnd).trigger("change");    

	var termMdls = getAllOption("#termMdl");
	var termMdl = $("select[name='termMdl']").val();
    $("#termMdl_modal").empty().select2({data: termMdls});
    $("#termMdl_modal").val(termMdl).trigger("change");

	var names =  getAllOption("#name");
	var name = $("select[name='name']").val();
    $("#name_modal").empty().select2({data: names});
    $("#name_modal").val(name).trigger("change");

	$("select[name='cityNam_modal']").val($("select[name='cityNam']").val());
	$("input[name='statMonth_modal']").val($("input[name='statMonth']").val());
}

function getAllOption(id){
	var options = [];
	$(id+" option").each(function(i, selected) {
		var map = {};
		map["id"] = $(this).val()
		map["text"] = $(this).text();
		options.push(map);
	});
	return options;
}

//条件选择框联动开始
//页面初始化
function pageResetInit_modal(){
	var data = {};
	data["cityNam"] = $("select[name='cityNam_modal']").val();
	data["statMonth"] = $("input[name='statMonth_modal']").val();
	$.ajax({
	    type: "post",
	    url:  "${basePath}/hallIdentityMap/selectOnclick_modal.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){		    	
	    	showTermBrnd_modal(result.brands);
	    	showTermMdl_modal(result.specs);	
	    	showName_modal(result.list);
	    }
	});
	
};

//点击品牌
function clickbrand_modal(){
	var data = {};
	data["cityNam"] = $("select[name='cityNam_modal']").val();
	data["statMonth"] = $("input[name='statMonth_modal']").val();
	data["termBrnd"] = $("select[name='termBrnd_modal']").val();
	$.ajax({
	    type: "post",
	    url:  "${basePath}/hallIdentityMap/selectOnclick_modal.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){		    	
	    	showTermMdl_modal(result.specs);	
	    	showName_modal(result.list);
	    }
	});
};

// 点击机型
function clickMdl_modal(){
	var data = {};
	data["cityNam"] = $("select[name='cityNam_modal']").val();
	data["statMonth"] = $("input[name='statMonth_modal']").val();
	data["termBrnd"] = $("select[name='termBrnd_modal']").val();
	data["termMdl"] = $("select[name='termMdl_modal']").val();
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}/hallIdentityMap/selectOnclick_modal.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){		    	
	    	showName_modal(result.list);
	    }
	});
}
//条件选择框联动结束


//条件选择框重构开始
//品牌
function showTermBrnd_modal(arr,value){	
	var id = "termBrnd_modal";   
    $("#"+id).empty();     
    $("#"+id).select2({});
    
    arr = isEmptyObject(arr)?[]:arr;
    $.each(arr,function(index,item){   	
    	$("#"+id).append("<option value='"+item+"'>"+item+"</option>"); 
    });
    
    if(!isEmptyObject(value)){
    	$("#"+id).val(value).trigger("change");
    }
    
    $("#"+id).off("select2:select").on("select2:select",function(e){ 
    	clickbrand_modal();
	});
}


//机型
function showTermMdl_modal(arr,value){	
	var id = "termMdl_modal";   
    $("#"+id).empty();     
    $("#"+id).select2({});
    
    arr = isEmptyObject(arr)?[]:arr;
    $.each(arr,function(index,item){   	
    	$("#"+id).append("<option value='"+item.termMdl+"'>"+item.termMdl+"</option>"); 
    });
    
    if(!isEmptyObject(value)){
    	$("#"+id).val(value).trigger("change");
    }
    
    $("#"+id).off("select2:select").on("select2:select",function(e){ 
    	clickMdl_modal();
	});
}


//门店
function showName_modal(arr,value){	
	var id = "name_modal";   
    $("#"+id).empty();     
    $("#"+id).select2({});
    
    arr = isEmptyObject(arr)?[]:arr;
    $("#"+id).append("<option value=''>全部门店</option>"); 
    $.each(arr,function(index,item){   	
    	$("#"+id).append("<option value='"+item.name+"'>"+item.name+"</option>"); 
    });
    
    if(!isEmptyObject(value)){
    	$("#"+id).val(value).trigger("change");
    }

}

</script>
