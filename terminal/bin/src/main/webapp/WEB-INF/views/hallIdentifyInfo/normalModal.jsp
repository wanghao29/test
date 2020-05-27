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
	 				<select name="areaname_normalModal" class="select" style="width: 100%;"  id="citySelect_normalModal">
		       		</select>
		    </div>
		    
			<div class="col-xs-2" style="margin-left:1%;">
			   	     <input name="smonth_normalModal"  type="text" style="width: 100%;" readonly="readonly"class="form-text select prevMonth_normalModal"
			   	  		onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M-1}'})" />
			</div>	
		    	        		
			<div class="col-xs-1" style="margin-left:1%;"> 
				<button type="button" onclick="jqgridReload()" class="btn btn-primary" style="width:100px"> 查询</button>
			</div> 						
        </div>  
        <div class="row" style="margin-left:5px;margin-top:5px;">  
            <div class="col-xs-2">
		        <div class="input-group">
		        	<span class="input-group-addon">厅店编码</span>
		            <input type="text" name="code_normalModal" class="form-control">		            
		        </div>	
		    </div>
            <div class="col-xs-2" style="margin-left:1%;">
		        <div class="input-group">
		        	<span class="input-group-addon">厅店名称</span>
		            <input type="text" name="name_normalModal" class="form-control">		            
		        </div>	
		    </div>
            <div class="col-xs-2" style="margin-left:1%;">
		        <div class="input-group">
		        	<span class="input-group-addon">联系人</span>
		            <input type="text" name="link_normalModal" class="form-control">		            
		        </div>	
		    </div>
            <div class="col-xs-2" style="margin-left:1%;">
		        <div class="input-group">
		        	<span class="input-group-addon">联系号码</span>
		            <input type="text" name="tel_normalModal" class="form-control">		            
		        </div>	
		    </div>
         </div>                            
	</div>        

      
    <div class="row">
	  	<span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;可选信息</span>
  	</div>
	<div  class="col-xs-12">
	    <div class="panel panel-default" style="  ">
	        <div class="panel-body" >
	       	    <div  class="col-xs-12" id="all_field">
	       		    <ul class="conditions_select" >
	       		        <li class="fieldGroup"><label><input type="checkbox" class="type1_all"/>&nbsp;基础信息：</label></li>	
	       		    	<li><label><input type="checkbox" value="statMonth"  class="type1" checked />&nbsp;月份</label></li>
	       		    	<li><label><input type="checkbox" value="cityCd"  class="type1"  checked />&nbsp;地市</label></li>
                        <li><label><input type="checkbox" value="hallName"  class="type1" checked />&nbsp;营业厅名称</label></li>	       		    	
	       		    	<li><label><input type="checkbox" value="hallBossCd"  class="type1" checked />&nbsp;BOSS系统编码</label></li>
	       		    	<li><label><input type="checkbox" value="linkman"  class="type1" checked />&nbsp;联系人姓名</label></li>
	       		    	<li><label><input type="checkbox" value="tel"  class="type1" checked />&nbsp;联系人电话</label></li>	       		    	       		    	
	       		    	<li><label><input type="checkbox" value="cntyCd"  class="type1" />&nbsp;县</label></li>
	       		    	<li><label><input type="checkbox" value="townCd"  class="type1" />&nbsp;镇</label></li>
	       		    	<li><label><input type="checkbox" value="longitude"  class="type1" />&nbsp;经度</label></li>
	       		    	<li><label><input type="checkbox" value="latitude"  class="type1" />&nbsp;纬度</label></li>
	       		    	
	       		    	<li><label><input type="checkbox" value="cntstock"  class="type1" />&nbsp;存量用户数</label></li>
	       		    	<li><label><input type="checkbox" value="cntdm"  class="type1" />&nbsp;DM窜货量</label></li>
	       		    	<li><label><input type="checkbox" value="kll"  class="type1" />&nbsp;客流量</label></li>
                        <li><label><input type="checkbox" value="cntmaybechg"  class="type1" />&nbsp;预计换机用户数</label></li>
                        <li><label><input type="checkbox" value="malecnt"  class="type1" />&nbsp;男性数量</label></li>
                        <li><label><input type="checkbox" value="femalecnt"  class="type1" />&nbsp;女性数量</label></li>
                        <li><label><input type="checkbox" value="arpu"  class="type1" />&nbsp;arpu</label></li>
                        <li><label><input type="checkbox" value="mou"  class="type1" />&nbsp;mou</label></li>
                        <li><label><input type="checkbox" value="dou"  class="type1" />&nbsp;dou</label></li>
                        
                        <li class="fieldGroup"><label><input type="checkbox" class="type2_all"/>&nbsp;用户年龄段：</label></li>
                        <li><label><input type="checkbox" value="agecnt0"  class="type2" />&nbsp;年龄未知</label></li>
                        <li><label><input type="checkbox" value="agecnt1"  class="type2" />&nbsp;年龄18以下</label></li>
                        <li><label><input type="checkbox" value="agecnt2"  class="type2" />&nbsp;年龄18-21</label></li>
                        <li><label><input type="checkbox" value="agecnt3"  class="type2" />&nbsp;年龄21-25</label></li>
                        <li><label><input type="checkbox" value="agecnt4"  class="type2" />&nbsp;年龄25-30</label></li>
                        <li><label><input type="checkbox" value="agecnt5"  class="type2" />&nbsp;年龄30-40</label></li>
                        <li><label><input type="checkbox" value="agecnt6"  class="type2" />&nbsp;年龄40-50</label></li>
                        <li><label><input type="checkbox" value="agecnt7"  class="type2" />&nbsp;年龄50+</label></li>
                        
                        <li class="fieldGroup"><label><input type="checkbox" class="type3_all"/>&nbsp;用户职业大类：</label></li>
                        <li><label><input type="checkbox" value="jobswcnt"  class="type3" />&nbsp;商务人士</label></li>
                        <li><label><input type="checkbox" value="jobblcnt"  class="type3" />&nbsp;白领人士</label></li>
                        <li><label><input type="checkbox" value="jobxycnt"  class="type3" />&nbsp;校园客户</label></li>
                        <li><label><input type="checkbox" value="jobnmcnt"  class="type3" />&nbsp;农民客户（个体户）</label></li>
                        <li><label><input type="checkbox" value="jobwlcnt"  class="type3" />&nbsp;外来人口</label></li>
                       <!--  <li><label><input type="checkbox" value="jobunknowcnt"  class="type3" />&nbsp;职业未知</label></li> -->
                      
                     </ul> 
                     <div  style="clear:left;"></div>
                     <a class="" data-toggle="collapse" data-target="#more" style="width:10%;"><span><<更多>></span></a>	
                     <div id="more" class="collapse">
                     <ul class="conditions_select" >	
                        <li class="fieldGroup"><label><input type="checkbox" class="type4_all"/>&nbsp;品牌销量：</label></li>
	       		    	<li><label><input type="checkbox" value="tbapplecnt"  class="type4" />&nbsp;苹果</label></li>
	       		    	<li><label><input type="checkbox" value="tbhwcnt"  class="type4" />&nbsp;华为</label></li>
	       		    	<li><label><input type="checkbox" value="tboppocnt"  class="type4" />&nbsp;OPPO</label></li>
	       		    	<li><label><input type="checkbox" value="tbvivocnt"  class="type4" />&nbsp;VIVO</label></li>
	       		    	<li><label><input type="checkbox" value="tbjlcnt"  class="type4" />&nbsp;金立</label></li>
	       		    	<li><label><input type="checkbox" value="tbsxcnt"  class="type4" />&nbsp;三星</label></li>
                        <li><label><input type="checkbox" value="tbkpcnt"  class="type4" />&nbsp;酷派</label></li>
                        <li><label><input type="checkbox" value="tbmicnt"  class="type4" />&nbsp;小米</label></li>
                        <li><label><input type="checkbox" value="tbztecnt"  class="type4" />&nbsp;中兴</label></li>
                        <li><label><input type="checkbox" value="tbmz"  class="type4" />&nbsp;魅族</label></li>
                        <li><label><input type="checkbox" value="tbyd"  class="type4" />&nbsp;中国移动</label></li>
                        <li><label><input type="checkbox" value="tbother"  class="type4" />&nbsp;其它品牌</label></li>
                        
                        <li class="fieldGroup"><label><input type="checkbox" class="type5_all"/>&nbsp;价格段位：</label></li>
                        <li><label><input type="checkbox" value="pricecnt0"  class="type5" />&nbsp;价位未知</label></li>
                        <li><label><input type="checkbox" value="pricecnt1"  class="type5" />&nbsp;价位0-99</label></li>
                        <li><label><input type="checkbox" value="pricecnt2"  class="type5" />&nbsp;价位100-299</label></li>
                        <li><label><input type="checkbox" value="pricecnt3"  class="type5" />&nbsp;价位300-399</label></li>
                        <li><label><input type="checkbox" value="pricecnt4"  class="type5" />&nbsp;价位400-499</label></li>
                        <li><label><input type="checkbox" value="pricecnt5"  class="type5" />&nbsp;价位500-599</label></li>
                        <li><label><input type="checkbox" value="pricecnt6"  class="type5" />&nbsp;价位600-699</label></li>
                        <li><label><input type="checkbox" value="pricecnt7"  class="type5" />&nbsp;价位700-799</label></li>
                        <li><label><input type="checkbox" value="pricecnt8"  class="type5" />&nbsp;价位800-899</label></li>
                        <li><label><input type="checkbox" value="pricecnt9"  class="type5" />&nbsp;价位900-999</label></li>
                        <li><label><input type="checkbox" value="pricecnt10"  class="type5" />&nbsp;价位1000-1099</label></li>
                        <li><label><input type="checkbox" value="pricecnt11"  class="type5" />&nbsp;价位1100-1499</label></li>
                        <li><label><input type="checkbox" value="pricecnt12"  class="type5" />&nbsp;价位1500-1699</label></li>
                        <li><label><input type="checkbox" value="pricecnt1"  class="type5" />&nbsp;价位1700-1999</label></li>
                        <li><label><input type="checkbox" value="pricecnt1"  class="type5" />&nbsp;价位2000-2999</label></li>                        
                        <li><label><input type="checkbox" value="pricecnt1"  class="type5" />&nbsp;价位3000-3999</label></li>
                        <li><label><input type="checkbox" value="pricecnt1"  class="type5" />&nbsp;价位4000-4999</label></li>
                        <li><label><input type="checkbox" value="pricecnt1"  class="type5" />&nbsp;价位5000+</label></li>
                        
                        <li class="fieldGroup"><label><input type="checkbox" class="type6_all"/>&nbsp;使用流量：</label></li>
<!--                    <li><label><input type="checkbox" value="gprscnt0" />&nbsp;流量<0</label></li>   -->   
                        <li><label><input type="checkbox" value="gprscnt1"  class="type6" />&nbsp;流量0M</label></li>
                        <li><label><input type="checkbox" value="gprscnt2"  class="type6" />&nbsp;流量0-10M</label></li>
                        <li><label><input type="checkbox" value="gprscnt3"  class="type6" />&nbsp;流量10-50M</label></li>
                        <li><label><input type="checkbox" value="gprscnt4"  class="type6" />&nbsp;流量50-100M</label></li>
                        <li><label><input type="checkbox" value="gprscnt5"  class="type6" />&nbsp;流量100-200M</label></li>
                        <li><label><input type="checkbox" value="gprscnt6"  class="type6" />&nbsp;流量200-300M</label></li>
                        <li><label><input type="checkbox" value="gprscnt7"  class="type6" />&nbsp;流量300-500M</label></li>
                        <li><label><input type="checkbox" value="gprscnt8"  class="type6" />&nbsp;流量500-1G</label></li>
                        <li><label><input type="checkbox" value="gprscnt9"  class="type6" />&nbsp;流量1-3G</label></li>
                        <li><label><input type="checkbox" value="gprscnt10"  class="type6" />&nbsp;流量3G+</label></li>
                        
                        <li class="fieldGroup"><label><input type="checkbox" class="type7_all"/>&nbsp;用户费用：</label></li>
<!--                    <li><label><input type="checkbox" value="usefeecnt0" />&nbsp;<0</label></li> 	   -->       		    	 
                        <li><label><input type="checkbox" value="usefeecnt1"  class="type7" />&nbsp;0元</label></li>
                        <li><label><input type="checkbox" value="usefeecnt2"  class="type7" />&nbsp;0-50元</label></li>
                        <li><label><input type="checkbox" value="usefeecnt3"  class="type7" />&nbsp;50-80元</label></li>
                        <li><label><input type="checkbox" value="usefeecnt4"  class="type7" />&nbsp;80-120元</label></li>
                        <li><label><input type="checkbox" value="usefeecnt5"  class="type7" />&nbsp;120+元</label></li>
                        
                        <li class="fieldGroup"><label><input type="checkbox" class="type8_all"/>&nbsp;通话时长：</label></li>
<!--                    <li><label><input type="checkbox" value="yycnt0"  class="type8" />&nbsp;<0分种</label></li>  -->   
                        <li><label><input type="checkbox" value="yycnt1"  class="type8" />&nbsp;0分种</label></li>
                        <li><label><input type="checkbox" value="yycnt2"  class="type8" />&nbsp;0-60分种</label></li>
                        <li><label><input type="checkbox" value="yycnt3"  class="type8" />&nbsp;60-120分种</label></li>
                        <li><label><input type="checkbox" value="yycnt4"  class="type8" />&nbsp;120-240分种</label></li>
                        <li><label><input type="checkbox" value="yycnt5"  class="type8" />&nbsp;240-360分种</label></li> 
                        <li><label><input type="checkbox" value="yycnt6"  class="type8" />&nbsp;360-600分种</label></li>
                        <li><label><input type="checkbox" value="yycnt7"  class="type8" />&nbsp;600+分种</label></li>
                        
                        <li class="fieldGroup"><label><input type="checkbox" class="type9_all"/>&nbsp;主套餐费用：</label></li>
                        <li><label><input type="checkbox" value="tcfeecnt0"  class="type9" />&nbsp;主套餐未知</label></li>
                        <li><label><input type="checkbox" value="tcfeecnt1"  class="type9" />&nbsp;主套餐<18</label></li>
                        <li><label><input type="checkbox" value="tcfeecnt2"  class="type9" />&nbsp;主套餐18-28</label></li>
                        <li><label><input type="checkbox" value="tcfeecnt3"  class="type9" />&nbsp;主套餐28-38</label></li> 
                        <li><label><input type="checkbox" value="tcfeecnt4"  class="type9" />&nbsp;主套餐38-48</label></li>
                        <li><label><input type="checkbox" value="tcfeecnt5"  class="type9" />&nbsp;主套餐48-58</label></li>
                        <li><label><input type="checkbox" value="tcfeecnt6"  class="type9" />&nbsp;主套餐58-88</label></li>
                        <li><label><input type="checkbox" value="tcfeecnt7"  class="type9" />&nbsp;主套餐88-138</label></li>
                        <li><label><input type="checkbox" value="tcfeecnt8"  class="type9" />&nbsp;主套餐138-158</label></li>
                        <li><label><input type="checkbox" value="tcfeecnt9"  class="type9" />&nbsp;主套餐158-188</label></li>    
                        <li><label><input type="checkbox" value="tcfeecnt10"  class="type9" />&nbsp;主套餐188-238</label></li>
                        <li><label><input type="checkbox" value="tcfeecnt11"  class="type9" />&nbsp;主套餐238-268</label></li> 	
                        <li><label><input type="checkbox" value="tcfeecnt12"  class="type9" />&nbsp;主套餐268-288</label></li> 	
                        <li><label><input type="checkbox" value="tcfeecnt13"  class="type9" />&nbsp;主套餐288-338</label></li> 	
                        <li><label><input type="checkbox" value="tcfeecnt14"  class="type9" />&nbsp;主套餐338-588</label></li> 	
                        <li><label><input type="checkbox" value="tcfeecnt15"  class="type9" />&nbsp;主套餐588+</label></li> 
                        
                        </div>	 		    		       		    		    
	       		    </ul> 
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
	       		     <ul class="conditions_select" id="choose_field">
	   		    
	       		     </ul> 
	       	    </div>				       
	        </div>
	     </div>
	</div>
      
  	<div class="row" >
  	  	<span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;查询结果</span>
       	<div class="col-xs-12" style="margin-left:9px;padding-right:15px;">
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
	$('.select_searchable_normalModal').searchableSelect();
	//时间控件设置初始时间
	$(".prevMonth_normalModal").val(getPrevMonthValue());
	//城市下拉框初始化
	citySelectInit($('#citySelect_normalModal'));


    //弹框初始化，同步搜索条件
    pageinit_normalModal();
    setTimeout("jqgridInit()",500); 
    
    //弹框前执行
    $('#normalModal').on('show.bs.modal', function () {
        pageinit_normalModal();
        jqgridReload();
    });   
    
    //给checkbox增加点击事件
    $("#all_field input:checkbox").change(function(){
    	$("#choose_field").html("");
    	$("#all_field ul li").each(function() {
    		var cla= $(this).attr("class");
    		var text = $(this).text();
    		var inputVal = $(this).children("label").children("input").val();
    		var inputIsChecked = $(this).children("label").children("input").prop("checked");
    		if(inputVal=="on"){
    			$("#choose_field").append('<li class="'+cla+'"><label>&nbsp;'+text+'</label></li>');
    		}else if(inputIsChecked==true){
    			$("#choose_field").append('<li class="'+cla+'"><label>&nbsp;'+text+'</label></li>');
    		}    		
    	});
    	
    	var isChecked = $(this).prop("checked");
    	var col = $(this).val();
    	if(isChecked){
    		jQuery("#list").setGridParam().showCol(col).trigger("reloadGrid");
    	}else{
    		jQuery("#list").setGridParam().hideCol(col).trigger("reloadGrid");
    	}
    	$("#list").setGridWidth(len);
    	setGroupHeaders();
    });
    $("#all_field input:checkbox")[0].click();
    $("#all_field input:checkbox")[0].click();

    //全选取消
    var arr = ['type1','type2','type3','type4','type5','type6','type7','type8','type9'];
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


var len;
function getparam_normalModal(){
	var data = {};
	data["areaname"] = $("select[name='areaname_normalModal']").val();
	data["smonth"] = $("input[name='smonth_normalModal']").val();
	data["code"] = $("input[name='code_normalModal']").val();
	data["name"] = $("input[name='name_normalModal']").val();
	data["link"] = $("input[name='link_normalModal']").val();
	data["tel"] = $("input[name='tel_normalModal']").val();
	return data;	
}

function jqgridReload(){
	$("#list").jqGrid('clearGridData'); 
	$("#list").jqGrid('setGridParam',{  
		  postData : getparam_normalModal(),
		  datatype:'json',
	      page:1
	}).trigger("reloadGrid");
};
/* 初始化表格 */
function jqgridInit(){
	  jQuery("#list").jqGrid({
	        url:"${basePath}hallIdentifyInfo/listHallNormal.do",
	        mtype:'post',
	        datatype: "json",
	        loadonce:true,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:getparam_normalModal(),
	        //scroll:1, 滚动加载
	        //datatype : "local",
	        
	        colNames : [ 
	                     '月份','地市','营业厅名称','BOSS系统编码','联系人姓名','联系人电话','县','镇','经度','纬度', //19
	                     '存量用户数','DM窜货量','客流量','预计换机用户数','男性数量','女性数量','arpu','mou','mou',  
	                     '年龄未知','年龄18以下','年龄18-21','年龄21-25','年龄25-30','年龄30-40','年龄40-50','年龄50+', //8
	                     '商务人士','白领人士','校园客户','农民客户（个体户）','外来人口', //6
	                     '苹果','华为','OPPO','VIVO','金立','三星','酷派','小米','中兴','魅族','中国移动','其它品牌', //12
	                     '价位未知','价位0-99','价位100-299','价位300-399','价位400-499','价位500-599','价位600-699','价位700-799','价位800-899','价位900-999', //18
	                     	'价位1000-1099','价位1100-1499','价位1500-1699','价位1700-1999','价位2000-2999','价位3000-3999','价位4000-4999','价位5000+',
	                     /*'流量<0',*/'流量0M','流量0-10M','流量10-50M','流量50-100M','流量100-200M','流量200-300M','流量300-500M','流量500-1G','流量1-3G','流量3G+', //10
	                     /*'<0',*/'0元','0-50元','50-80元','80-120元','120+元',  //5
	                     /*'<0分种',*/' 0分种',' 0-60分种','60-120分种','120-240分种','240-360分种','360-600分种','600+分种', //7
	                     '主套餐未知','主套餐<18','主套餐18-28','主套餐28-38','主套餐38-48','主套餐48-58','主套餐58-88','主套餐88-138','主套餐138-158','主套餐158-188',//16
	                     	'主套餐188-238','主套餐238-268','主套餐268-288','主套餐288-338','主套餐338-588','主套餐588+'
	                   ],
	        colModel : [ 
	                     //sortable : 默认true
	                     //search   : 默认true
	                     //sorttype : "float"、"int"
	                     //searchoptions:{sopt:['eq','bw']：op=、 eq=等于、ne=不等、lt=小于、le=小于等于、gt=大于、
	                     //ge=大于等于、bw=开始于、bn=不开始、in=在内、ni=不在内、ew=结束于、en=不结束于、cn=包含、nc=不包含
	                     {name : 'statMonth',index : 'statMonth',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
	                     {name : 'cityCd',index : 'cityCd',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'hallName',index : 'hallName',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'hallBossCd',index : 'hallBossCd',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},	
	                     {name : 'linkman',index : 'linkman',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tel',index : 'tel',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},	                     
	                     {name : 'cntyCd',index : 'cntyCd',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'townCd',index : 'townCd',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'longitude',index : 'longitude',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'latitude',index : 'latitude',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},

	                     {name : 'cntstock',index : 'cntstock',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'cntdm',index : 'cntdm',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'kll',index : 'kll',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'cntmaybechg',index : 'cntmaybechg',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'malecnt',index : 'malecnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'femalecnt',index : 'femalecnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'arpu',index : 'arpu',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'mou',index : 'mou',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'mou',index : 'mou',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
	                     
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
	                     {name : 'jobwlcnt',index : 'jobwlcnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     /* {name : 'jobunknowcnt',index : 'jobunknowcnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, */
	                     
	                     {name : 'tbapplecnt',index : 'tbapplecnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tbhwcnt',index : 'tbhwcnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tboppocnt',index : 'tboppocnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tbvivocnt',index : 'tbvivocnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tbjlcnt',index : 'tbjlcnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tbsxcnt',index : 'tbsxcnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tbkpcnt',index : 'tbkpcnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tbmicnt',index : 'tbmicnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tbztecnt',index : 'tbztecnt',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tbmz',index : 'tbmz',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
	                     {name : 'tbyd',index : 'tbyd',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
	                     {name : 'tbother',index : 'tbother',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},	                     
	                     
	                     {name : 'pricecnt0',index : 'pricecnt0',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'pricecnt1',index : 'pricecnt1',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'pricecnt2',index : 'pricecnt2',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'pricecnt3',index : 'pricecnt3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'pricecnt4',index : 'pricecnt4',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'pricecnt5',index : 'pricecnt5',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'pricecnt6',index : 'pricecnt6',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'pricecnt7',index : 'pricecnt7',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'pricecnt8',index : 'pricecnt8',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
	                     {name : 'pricecnt9',index : 'pricecnt9',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
	                     {name : 'pricecnt10',index : 'pricecnt10',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'pricecnt11',index : 'pricecnt11',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'pricecnt12',index : 'pricecnt12',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'pricecnt13',index : 'pricecnt13',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'pricecnt14',index : 'pricecnt14',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'pricecnt15',index : 'pricecnt15',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'pricecnt16',index : 'pricecnt16',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'pricecnt17',index : 'pricecnt17',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     
//	                     {name : 'gprscnt0',index : 'gprscnt0',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'gprscnt1',index : 'gprscnt1',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'gprscnt2',index : 'gprscnt2',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'gprscnt3',index : 'gprscnt3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'gprscnt4',index : 'gprscnt4',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'gprscnt5',index : 'gprscnt5',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'gprscnt6',index : 'gprscnt6',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'gprscnt7',index : 'gprscnt7',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'gprscnt8',index : 'gprscnt8',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
	                     {name : 'gprscnt9',index : 'gprscnt9',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
	                     {name : 'gprscnt10',index : 'gprscnt10',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
	                     
//	                     {name : 'usefeecnt0',index : 'usefeecnt0',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'usefeecnt1',index : 'usefeecnt1',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'usefeecnt2',index : 'usefeecnt2',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'usefeecnt3',index : 'usefeecnt3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'usefeecnt4',index : 'usefeecnt4',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'usefeecnt5',index : 'usefeecnt5',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},

//	                     {name : 'yycnt0',index : 'yycnt0',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},   
	                     {name : 'yycnt1',index : 'yycnt1',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'yycnt2',index : 'yycnt2',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
	                     {name : 'yycnt3',index : 'yycnt3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 	                     
	                     {name : 'yycnt4',index : 'yycnt4',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'yycnt5',index : 'yycnt5',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'yycnt6',index : 'yycnt6',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'yycnt7',index : 'yycnt7',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},

	                     {name : 'tcfeecnt0',index : 'tcfeecnt0',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tcfeecnt1',index : 'tcfeecnt1',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tcfeecnt2',index : 'tcfeecnt2',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tcfeecnt3',index : 'tcfeecnt3',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tcfeecnt4',index : 'tcfeecnt4',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
	                     {name : 'tcfeecnt5',index : 'tcfeecnt5',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},                     
	                     {name : 'tcfeecnt6',index : 'tcfeecnt6',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tcfeecnt7',index : 'tcfeecnt7',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tcfeecnt8',index : 'tcfeecnt8',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tcfeecnt9',index : 'tcfeecnt9',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tcfeecnt10',index : 'tcfeecnt10',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tcfeecnt11',index : 'tcfeecnt11',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tcfeecnt12',index : 'tcfeecnt12',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tcfeecnt13',index : 'tcfeecnt13',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
	                     {name : 'tcfeecnt14',index : 'tcfeecnt14',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
	                     {name : 'tcfeecnt15',index : 'tcfeecnt15',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},	                     

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
	        pager: '#pager',     //指定分页组件所在div id 
	        pagination: true,
	        caption : "",
	      });
	  len=$("#list").getGridParam("width");
	  setGroupHeaders();
	  //jQuery("#list").jqGrid('filterToolbar',{searchOperators : true});
	  //jQuery("#list").jqGrid('navGrid','#pager',{add:false,edit:false,del:false});	  
};

function setGroupHeaders(){
	  jQuery("#list").jqGrid('destroyGroupHeader');
	  //合并最顶表头
	  jQuery("#list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    {startColumnName: 'statMonth', numberOfColumns: 19, titleText: '基础信息'},
		    {startColumnName: 'agecnt0', numberOfColumns: 8, titleText: '用户年龄段'},
		    {startColumnName: 'jobswcnt', numberOfColumns: 6, titleText: '用户职业大类'},
		    {startColumnName: 'tbapplecnt', numberOfColumns: 12, titleText: '品牌销量'},
		    {startColumnName: 'pricecnt0', numberOfColumns: 18, titleText: '价格段位'},
		    {startColumnName: 'gprscnt1', numberOfColumns: 10, titleText: '使用流量'},
		    {startColumnName: 'usefeecnt1', numberOfColumns: 5, titleText: ' 用户费用'},
		    {startColumnName: 'yycnt1', numberOfColumns: 7, titleText: '通话时长'},
		    {startColumnName: 'tcfeecnt0', numberOfColumns: 16, titleText: '主套餐费用'},		    
		    ]  
	  });
}

//页面初始化
function pageinit_normalModal(){	
	$("select[name='areaname_normalModal']").val($("select[name='areaname']").val());
	$("input[name='smonth_normalModal']").val($("input[name='smonth']").val());
}

</script>
