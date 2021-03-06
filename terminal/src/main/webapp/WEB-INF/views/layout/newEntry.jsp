<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>终端大数据营销平台<sitemesh:title/></title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <meta http-equiv="Cache-Control" content="no-store" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <link href="<%=basePath%>resources/css/main.css" rel="stylesheet">
    <link href="<%=basePath%>resources/css/entry.css" rel="stylesheet">
    <link href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap.css" rel="stylesheet">
    <link href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap-theme.css" rel="stylesheet">
    <link href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap-dialog.css" rel="stylesheet">
    <link href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/datepicker3.css" rel="stylesheet">
    <link href="<%=basePath%>resources/js/plugin/searchableSelect/jquery.searchableSelect.css" rel="stylesheet">
    <link href="<%=basePath%>resources/js/plugin/slider/bootstrap-slider.css" rel="stylesheet">
    <link href="<%=basePath%>resources/js/plugin/bootstrap_table/bootstrap-table.css" rel="stylesheet">

    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/jqGrid/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/plugin/jqmeter.min.js"></script>
 	<script type="text/javascript" src="<%=basePath%>resources/js/plugin/jquery_ba_resize/jquery.ba-resize.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/bootstrap_3.3.7/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/datepicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/echart/echarts.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/echart/macarons.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/common/echarsOption.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/searchableSelect/jquery.searchableSelect.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/slider/bootstrap-slider.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/plugin/bootstrap_table/bootstrap-table.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/bootstrap_table/locale/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/common.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/default.js"></script>
 
	<script type="text/javascript" src="<%=basePath%>resources/js/plugin/bootstrap-editable/bootstrap-editable.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/plugin/bootstrap_table/bootstrap-table-editable.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/plugin/bootstrap-dialog/bootstrap-dialog.js"></script>

    <%-- 需要jquery支持 --%>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/jqGrid/js/i18n/grid.locale-cn.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/jqGrid/js/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/common/myJqgrid.js"></script>
    
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/select2/js/select2.full.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/select2/js/i18n/zh-CN.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/jquery.form.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/bootbox.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/entry/editTable.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/entry/newEntry.js"></script>

<%--     <script type="text/javascript" src="<%=basePath%>resources/js/plugin/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/jqmeter.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/jquery_ba_resize/jquery.ba-resize.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/bootstrap_3.3.7/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/echart/echarts.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/echart/macarons.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/common/echarsOption.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/common.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/searchableSelect/jquery.searchableSelect.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/datepicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/entry/editTable.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/entry/newEntry.js"></script> --%>
	
    <sitemesh:head/>

</head>
<style>

  .a{
    color:#FFFFFF;
} 
 	.table > tbody > tr > td{
 	 font-size: 18px;
 	 border-top: 1px solid #037abd;
 	 border-left: 1px solid #037abd;
 	 vertical-align: middle;
 	}
 	
 	 	.table > thead > tr > td{
 	 	    border-top-width:1px;
 	 	    border-top-style: initial;
    border-top-color: initial;
 	 font-size: 18px;
 	  border-top: 1px solid #037abd;
 	 border-left: 1px solid #000534;
 	 vertical-align: middle;
 	}
 	textarea {
    -webkit-appearance: textarea;
    background-color: #037abd00;
    -webkit-rtl-ordering: logical;
    flex-direction: column;
    resize: auto;
    cursor: text;
    white-space: pre-wrap;
    overflow-wrap: break-word;
    border-width: 1px;
    border-style: solid;
    border-color: initial;
    border-image: initial;
    padding: 2px;
}
 
</style>
<body style="overflow-x:hidden;min-width: 1389px;">
 <c:set var="special" scope="session" value="${special}"/> 
<div class="header" >
    <div class="row ">
        <div class="col-xs-5" style="border-color: green;float: left;min-width: 550px;">
         <ul class=" " style="width: 100%;">
             <%-- <shiro:hasPermission name="entry:list">
             	<a class="a" href="<%=basePath%>entry/index.do?special=MONITOR" style="font-size:24px;">18年重点KPI全景</a>&nbsp;&nbsp;&nbsp;&nbsp;
             </shiro:hasPermission>
             <shiro:hasPermission name="entry:list">
             	<a class="a active " href="<%=basePath%>entry/newIndex.do?special=MONITOR" style="font-size:24px; color: #1addfa;">19年重点KPI全景</a>&nbsp;&nbsp;&nbsp;&nbsp;
             </shiro:hasPermission> --%>
               	<li class="drop" id="cellIdentifyInfo"><a  class="a" href="#" style="font-size:24px;" >重点KPI全景</a> 
					        	 <ul class="subnav">
					                <shiro:hasPermission name="entry:list"> 
					                	<li><a class="a" href="<%=basePath%>entry/index.do?special=MONITOR" style="font-size:20px;color: #1addfa;">18年重点KPI全景</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					                </shiro:hasPermission>
					                <shiro:hasPermission name="entry:list"> 
					                	<li><a class="a" href="<%=basePath%>entry/newIndex.do?special=MONITOR" style="font-size:20px;">19年重点KPI全景</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					                </shiro:hasPermission>
					            
					             </ul>
					 </li>	
             <shiro:hasPermission name="zdResultCitykpiQ:list">
             	<%-- <a class="a" href="<%=basePath%>zdResultCitykpiQ/calcResultIndex.do" style="font-size:24px;">地市KPI全景</a> --%>
             	
             <li class="drop" id="cellIdentifyInfo1"><a  class="a" href="#" style="font-size:24px;" >地市KPI全景</a> 
					        	 <ul class="subnav">
					                <shiro:hasPermission name="entry:list"> 
					                	<li><a class="a" href="<%=basePath%>zdResultCitykpiQ/calcResultIndex.do" style="font-size:20px;color: #1addfa;">18年地市KPI全景</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					                </shiro:hasPermission>
					                <shiro:hasPermission name="entry:list"> 
					                	<li><a class="a" href="<%=basePath%>zdResultCitykpi2019/allList.do?quarter=1" style="font-size:20px;">19年地市KPI全景</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					                </shiro:hasPermission>
					            
					             </ul>
					 </li>		
            	<!--期初数据  -->
            	
             <li class="drop" id="cellIdentifyInfo2"><a  class="a" href="#" style="font-size:24px;" >期初数据</a> 
					        	 <ul class="subnav">
					                <shiro:hasPermission name="entry:list"> 
					                	<li><a  class="a" href="<%=basePath%>model5Gdate/modelList.do?pageNumber=1" style="font-size:24px;" >期初数据展示</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					                </shiro:hasPermission>
					                <shiro:hasPermission name="entry:list"> 
					                	<li><a  class="a" href="<%=basePath%>broken/modelList.do?pageNumber=1" style="font-size:24px;" >碎屏险期初数据</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					                </shiro:hasPermission>
					                 <shiro:hasPermission name="entry:list"> 
					                	<li><a  class="a" href="<%=basePath%>internet/modelList.do?pageNumber=1" style="font-size:24px;" >互联网数据展示</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					                </shiro:hasPermission>
					                
					            
					             </ul>
					 </li>	 
            	
            	 <%-- <li class="drop" id="cellIdentifyInfo2"><a  class="a" href="<%=basePath%>model5Gdate/modelList.do?pageNumber=1" style="font-size:24px;" >期初数据展示</a> 
					        	
					 </li>	
            	<li class="drop" id="cellIdentifyInfo2"><a  class="a" href="<%=basePath%>broken/modelList.do?pageNumber=1" style="font-size:24px;" >碎屏险期初数据</a> 
		 			        	
					 </li> --%>
            	
            	
            	
            	
             	
             	
             </shiro:hasPermission>
           
		 </ul>
        </div>
        <div class="col-xs-2 " style="border-color: red;float: left; ">
            <ul class=" "   >
                <h1 class="logo">
                    <a title="终端大数据营销平台"></a>
                </h1>
            </ul>
        </div>
        <div class=" col-xs-5" style="border-color: green;float: left;min-width: 507px;">
            <shiro:hasPermission name="amount:list">  
            	<a   class="a"  href="<%=basePath%>amount/index.do?type_8=量&special=type_8" style="font-size:24px;">量</a>
            </shiro:hasPermission>
            <shiro:hasPermission name="collect:list">  
            	<a   class="a"  href="<%=basePath%>amount/index.do?type_8=收&special=type_8" style="font-size:24px;">收</a>
            </shiro:hasPermission>
            <shiro:hasPermission name="benefit:list">  
            	<a   class="a"  href="<%=basePath%>amount/index.do?type_8=利&special=type_8" style="font-size:24px;">利</a>
            </shiro:hasPermission>
            <shiro:hasPermission name="share:list">  
            	<a   class="a"  href="<%=basePath%>amount/index.do?type_8=份&special=type_8" style="font-size:24px;">份</a>
            </shiro:hasPermission>
            <shiro:hasPermission name="enter:list">  
            	<a   class="a" href="<%=basePath%>amount/index.do?type_8=进&special=type_8" style="font-size:24px;">进</a>
            </shiro:hasPermission>
            <shiro:hasPermission name="pin:list">  
            	<a   class="a" href="<%=basePath%>amount/index.do?type_8=销&special=type_8" style="font-size:24px;">销</a>
            </shiro:hasPermission>
            <shiro:hasPermission name="deposit:list">   
            	<a   class="a" href="<%=basePath%>amount/index.do?type_8=存&special=type_8" style="font-size:24px;">存</a>
            </shiro:hasPermission>
            <shiro:hasPermission name="back:list">   
            	<a   class="a" href="<%=basePath%>amount/index.do?type_8=回&special=type_8" style="font-size:24px;">回</a>
            </shiro:hasPermission>
            <a href="<%=basePath%>admin/user/list.do" title="返回首页" style="font-size:24px;"> <em class="back-icon"></em></a>
 
        </div>
    </div>
</div>
 	
<!-- <div class="content2" style="width: 100%"> -->
	 <div class="row"style="margin-left: 0px;" >
			<ol class="breadcrumb">
			 <li>经分监控</li>
			  <li>重点KPI全景</li>
			  <li class=" ">19年重点KPI全景 </li>
			</ol>
		</div>
    <div class="row"style="width: 100%;height: 50px;margin-top: 10px;">
   
        <div class="col-xs-1" style="margin-top: 0px">
            <span style="color: #1addfa;font-size: 28px;margin-left: -500px;">重点KPI全景</span>
        </div>
        <div class="col-xs-2" style="color: #fff;font-size: 18px">
       	      查询月份： <!-- <input id="month" name="month" type="text" style="height: 30px;width:130px" readonly="readonly"class="form-text select"/> -->
       	       <input name="billcyc"   id="billcyc" type="text" style="width: 55%;" readonly="readonly"class="form-text select prevMonth"
			   	  		onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M+1}',onpicked:getVal})" />
			   	  		<input id="startMonth"  name="startMonth" type="hidden"   />
			   	  		<input id="endMonth" name="endMonth" type="hidden"    />
        </div>
    
        <div class="col-xs-2" style="height: 45px;width: 200px;text-align: center;line-height: 35px;margin-left: 80px">
        	<span  style="font-size: 40px;font-weight: bold;">预得分：</span>
        </div>
        <div class="col-xs-2">
            <div style="color: #fb0200;height: 45px;width: 200px;text-align: center;line-height: 35px;">
                <span id="zdf" name="score" style="font-size: 55px;font-weight: bold;">0</span>
<!--                 <span class="up" style="font-size: 60px; font-weight: bold">↑</span>
                <span class="down" style="font-size: 60px;font-weight: bold; display: none ">↓</span> -->
            </div>
        </div>
        <div class="col-xs-4" style="float:right;">
  		<div class="panel panel-default" style=" width: 100%;" >
  			<h4><span style='color:#3eb8c5' id="infoPerson" >数据来源:</span></h4>
  			<h4><span style='color:#3eb8c5' id="confirm" >确认人:</span></h4>
  			<div style="width:100%;" id="kpiConfirmInfo"></div>
  		</div>
  		<input type="hidden" id="hid_kpikey" value="gf_kpi_home"><h3></h3></input><!-- 和权限有关  慎改 -->
  		
  	    </div>
  		<!-- 	<h3 style="color: #1addfa; padding-top: 28px;">注：各指标落后时间进度或低于满分则为红色预警</h3> -->
    </div>
<!--  </div> -->
    <div  id ="table_oo" style="width: 100%; margin: 20px 50px; float: left; padding-right: 70px">
    <table id="overviewTable"  class="table table-hover editable" style="line-height: 35px;  font-size: 18px;" id="gf_kpi" width="100%" border="1" align="center" cellspacing="0" height="100%"> 
    	<thead>
    	<tr align="center" id="menu" style="background-color: #037abd;">  
    	   <th width="10%">主指标</th>
    	   <th width="15%"><span id="menu_year">2019</span>年考核项目</th> 
    	   <th width="">考核周期</th>   
    	   <th width="">满分</th> 
    	   <th width="10%">目标值</th> 
    	   <th width="">单位</th>
    	   <th width="">得分</th>
    	   <th width="10%">当月完成值</th>
    	   <th width="10%">年度完成值</th> 
    	   <th width="">时间进度</th>
    	   <th width="10%">备注</th>
    	   <td style="display: none;"></td>
    	 </tr>
    	</thead>
    	 
    	 
    	 <tbody>
    	   <tr id="busi_income"  scope="row" align="center" style="border-top: 1px solid #037abd;"  title="">
    	 		<td style="font-weight:bold;color: #33ffff;" rowspan="5">运营收入（42分）&nbsp;</td>
    	 		<td><a href="<%=basePath%>operateIncome/index.do?special=GFKPI">运营收入</a> </td>
    	        <td>年度</td>
    	        <td>18分</td>
    	        <td>9000000000.00</td>
    	        <td>元</td>
    	        <td style="color: #fb0200;">0.00</td>
    	        <td style="color: #fb0200;">625137812.98</td>
    	 		<td style="color: #fb0200;">625137812.98</td>
    	 		<td style="color: #fb0200;">-1.55% </td>
    	 		<td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td>
    	 		<td style="display: none;"></td>
    	  </tr>
    	  <tr id="own_brand_income" scope="row" align="center" style="border-top: 1px solid #037abd;" >
    	  		<td style="display: none;"></td>
    	  		<td> <a href="<%=basePath%>ownBrandIncome/index.do?special=GFKPI">自有品牌手机收入</a></td>
    	  		<td>年度</td>
    	  		<td>10分</td>
    	  		<td>205940000.00</td>
    	  		<td>元</td>
    		 	<td style="color: #fb0200;">0.00</td>
    		 	<td style="color: #fb0200;">10825536.38</td>
    		 	<td style="color: #fb0200;">10825536.38</td>
    		 	<td style="color: #fb0200;">-3.24%</td>
    		 	<td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr id="own_brand_multi_income" align="center" style="border-top: 1px solid #037abd;" >
    	     <td style="display: none;"></td>
	    	 <td><a href="<%=basePath%>ownBrandMultiIncome/index.do?special=GFKPI">自有品牌多形态终端收入 </a></td>
	    	 <td>年度</td><td>10分</td>
	    	 <td>673520000.00</td>
	    	 <td>元</td> 
	    	 <td style="color: #51ff33;">10.00</td> 
	    	 <td style="color: #51ff33;">72161015.66</td> 
	    	 <td style="color: #51ff33;">72161015.66</td> 
    	 	 <td style="color: #51ff33;">2.22%</td>
    	 	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr  id="own_brand_other_multi_income"  align="center" style="border-top: 1px solid #037abd;" >
    	     <td style="display: none;"></td>
	    	 <td><a href="<%=basePath%>ownBrandOtherMultiIncome/index.do?special=GFKPI">自有品牌其他多形态终端收入</a></td>
	    	 <td>年度</td>
	    	 <td>4分</td>
	    	 <td>117680000.00</td>
	    	 <td>元</td>
	    	 <td style="color: #fb0200;">0.00</td>
	    	 <td style="color: #fb0200;">1555152.81</td>
	    	 <td style="color: #fb0200;">1555152.81</td>
	    	 <td style="color: #fb0200;">-7.17%</td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	  <tr  id="home_sales_income"  align="center" style="border-top: 1px solid #037abd;" >
    	     <td style="display: none;"></td>
	    	 <td><a href="#">家庭智能硬件销售收入</a></td>
	    	 <td>年度</td>
	    	 <td>5分</td>
	    	 <td>2626</td>
	    	 <td>万元</td>
	    	 <td style="color: #51ff33;">5</td>
	    	 <td style="color: #51ff33;">-</td>
	    	 <td style="color: #51ff33;">-</td>
	    	 <td style="color: #51ff33;">-24.66%</td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr  id="quality_customer_target_value" align="center" style="border-top: 1px solid #037abd;" >
	    	 <td style="font-weight:bold;color: #33ffff;" rowspan="2">渠道拓展（8分）</td>
	    	 <td><a href="<%=basePath%>qualityCustomerTargetValue/index.do?special=GFKPI">优质客户目标值</a></td>
	    	 <td>年度</td>
	    	 <td>4分</td>
	    	 <td>551.00</td>
	    	 <td>家</td>
	    	 <td style="color: #fb0200;">0.40</td>
	    	 <td style="color: #fb0200;">-</td>
	    	 <td style="color: #fb0200;">-</td>
	    	 <td style="color: #fb0200;">73.18% </td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
	     <tr id="ka_phones_sales_target_value" align="center" style="border-top: 1px solid #037abd;" >
	         <td style="display: none;"></td>
	     	 <td><a href="<%=basePath%>kaPhonesSalesTargetValue/index.do?special=GFKPI">KA客户手机销量目标值</a></td>
	    	 <td>年度</td>
	    	 <td>4分</td>
	    	 <td>12102000000.00</td>
	    	 <td>台</td> 
	    	 <td style="color: #51ff33;">4.00</td> 
	    	 <td style="color: #51ff33;">120120000000.00</td> 
	    	 <td style="color: #51ff33;">120120000000.00</td> 
	    	 <td style="color: #51ff33;">984.07%</td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr  id="net_phones_sales_proportion" align="center" style="border-top: 1px solid #037abd;" >
	    	 <td style="font-weight:bold;color: #33ffff;" rowspan="2">运营协同（10分)</td>
	    	 <td><a href="<%=basePath%>netPhonesSalesProportion/index.do?special=GFKPI">网内战略型手机销量占比</a></td>
	    	 <td>年度</td>
	    	 <td>5分</td>
	    	 <td>13.30</td>
	    	 <td>%</td> 
	    	 <td style="color: #51ff33;">5.00</td> 
	    	 <td style="color: #51ff33;">-</td> 
	    	 <td style="color: #51ff33;">-</td> 
	    	 <td style="color: #51ff33;">0.00%</td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr  id="internal_support_satisfaction"  align="center" style="border-top: 1px solid #037abd;" >
    	 	<td style="display: none;"></td>
	    	 <td><a href="<%=basePath%>netPhonesSalesProportion/index.do?special=GFKPI">内部支撑满意度</a></td>
	    	 <td>年度</td>
	    	 <td>5分</td>
	    	 <td>-</td>
	    	 <td>-</td> 
	    	 <td style="color: #51ff33;">5.00</td> 
	    	 <td style="color: #51ff33;">-</td> 
	    	 <td style="color: #51ff33;">-</td> 
	    	 <td style="color: #51ff33;">0.00%</td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr  id="inventory_turnover"  align="center" style="border-top: 1px solid #037abd;" >
    	     
    	     <td style="font-weight:bold;color: #33ffff;" rowspan="5">运营效率（17分）</td>
	    	 <td><a href="<%=basePath%>inventoryTurnover/index.do?special=GFKPI">存货周转率</a></td>
	    	 <td>年度</td>
	    	 <td>4分</td>
	    	 <td>17.00</td>
	    	 <td>次</td>
	    	 <td style="color: #fb0200;">0.00</td>
	    	 <td style="color: #fb0200;">7.77</td>
	    	 <td style="color: #fb0200;">7.77</td>
	    	 <td style="color: #fb0200;">0.00% </td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr id="three_stock_value_proportion" align="center" style="border-top: 1px solid #037abd;" >
    	     <td style="display: none;"></td>
	    	 <td><a href="<%=basePath%>threeStockValueProportion/index.do?special=GFKPI">三个月以上存货原值占比</a></td>
	    	 <td>月度</td>
	    	 <td>3分</td>
	    	 <td>90-180天 &lt;=2% 180天-360天 &lt;=0.5% 360天以上 =0 </td>
	    	 <td>%</td>
	    	 <td style="color: #fb0200;">0.00</td>
	    	 <td style="color: #fb0200;">90-180天 0.02%;180天-360天 0.00%;360天以上 0.00%;</td>
	    	 <td style="color: #fb0200;">90-180天 0.02%;180天-360天 0.00%;360天以上 0.00%;</td>
	    	 <td style="color: #fb0200;">0.00%</td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr id="back_forecast_accuracy"  align="center" style="border-top: 1px solid #037abd;" >
    	 	<td style="display: none;"></td>
	    	 <td><a href="<%=basePath%>backForecastAccuracy/index.do?special=GFKPI">回款预测准确度</a></td>
	    	 <td>月度</td>
	    	 <td>3分</td>
	    	 <td>70%-150%</td>
	    	 <td>%</td> 
	    	 <td style="color: #51ff33;">3.00</td> 
	    	 <td style="color: #51ff33;">0.84</td> 
	    	 <td style="color: #51ff33;">-</td> 
	    	 <td style="color: #51ff33;">0.00%</td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr id="receivable_turnover_rate" align="center" style="border-top: 1px solid #037abd;" >
    	 	<td style="display: none;"></td>
	    	 <td><a href="<%=basePath%>receivableTurnoverRate/index.do?special=GFKPI">应收周转率</a></td>
	    	 <td>半年度</td>
	    	 <td>4分</td>
	    	 <td>16.00</td>
	    	 <td>次</td>
	    	 <td style="color: #fb0200;">2.78</td>
	    	 <td style="color: #fb0200;">12.09</td>
	    	 <td style="color: #fb0200;">2.07</td>
	    	 <td style="color: #fb0200;">0.00%</td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr id="three_receivable_proportion"  align="center" style="border-top: 1px solid #037abd;" >
    	 	 <td style="display: none;"></td>
    	 	 <td><a href="<%=basePath%>threeReceivableProportion/index.do?special=GFKPI">三个月以上应收账款占比</a></td>
	    	 <td>季度</td>
	    	 <td>3分</td>
	    	 <td>90（不含）-180天（含）应收账款 ≤4% 180天（不含）以上应收账款 ≤1%</td>
	    	 <td>%</td>
	    	 <td style="color: #fb0200;">1.50</td>
	    	 <td style="color: #fb0200;">90（不含）-180天（含）应收账款 0.09%;180天（不含）以上应收账款 0.00%;</td>
	    	 <td style="color: #fb0200;">90（不含）-180天（含）应收账款 0.09%;180天（不含）以上应收账款 0.00%;</td>
	    	 <td style="color: #fb0200;">0.00%</td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr id="total_profit"  align="center" style="border-top: 1px solid #037abd;" ><td style="font-weight:bold;color: #33ffff;" rowspan="2">运营效益（23分）</td>
	    	 <td><a href="<%=basePath%>totalProfit/index.do?special=GFKPI">利润总额</a></td>
	    	 <td>年度</td>
	    	 <td>20分</td>
	    	 <td>0.00</td>
	    	 <td>元</td>
	    	 <td style="color: #fb0200;">0.00</td>
	    	 <td style="color: #fb0200;">4305097.83</td>
	    	 <td style="color: #fb0200;">0.00</td>
	    	 <td style="color: #fb0200;">0.00% </td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr id="unit_cost_profit"  align="center" style="border-top: 1px solid #037abd;" >
	    	 <td style="display: none;"></td>
	    	 <td><a href="<%=basePath%>unitCostProfit/index.do?special=GFKPI">单位人工费用创利比</a></td>
	    	 <td>季度</td>
	    	 <td>3分</td>
	    	 <td>21.55</td>
	    	 <td>%</td>
	    	 <td style="color: #fb0200;">0.00</td>
	    	 <td style="color: #fb0200;">0.35</td>
	    	 <td style="color: #fb0200;">-</td>
	    	 <td style="color: #fb0200;">0.00%</td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
 
    	 <tr>
    	 	<td colspan="10">     <button id="showBonusAndDeduction" type="button" class="btn btn-primary" ident="1" style="width:100px">更多&gt;&gt;</button></td> 
    	 </tr> 
    	 <tr  id="bonus_operate_income"  align="center" style="display: none;" >
    	 	<td rowspan="4" style="color: #f7d62b;">加分项（10分）</td>
    	 	<td><a style="color: #f7d62b;" href="<%=basePath%>operateIncome/index.do?special=GFKPI">运营收入</a></td>
    	 	<td>年度</td>
    	 	<td>5分</td>
    	 	<td>945500.00</td>
    	 	<td>元 </td> 
    	 	<td>5.00</td> 
    	 	<td>0</td> 
    	 	<td>0</td> 
    	 	<td>0.00%</td>
    	 	<td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr id="bonus_net_phones_sales_proportion"  align="center" style="display: none;" >
    	 	<td style="display: none;"></td>
    	 	<td><a style="color: #f7d62b;" href="http://localhost:8080/cmcnull?special=GFKPI">网内战略型手机销量占比</a></td>
    	 	<td>年度</td>
    	 	<td>3分</td>
    	 	<td>22.40</td>
    	 	<td>%</td> 
    	 	<td>3.00</td> 
    	 	<td>-</td> 
    	 	<td>-</td> 
    	 	<td>0.00%</td>
    	 	<td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr id="bonus_store_operation"  align="center" style="display: none;" >
    	 	<td style="display: none;"></td>
    	 	<td><a style="color: #f7d62b;" href="http://localhost:8080/cmcnull?special=GFKPI">新零售门店运营</a></td>
    	 	<td>年度</td>
    	 	<td>2分</td>
    	 	<td></td>
    	 	<td></td> 
    	 	<td>0</td> 
    	 	<td>-</td> 
    	 	<td>-</td> 
    	 	<td>0.00%</td>
    	 	<td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr id="sales_private_brands" align="center" style="display: none;" >
    	 	<td style="display: none;"></td>
    	 	<td><a style="color: #f7d62b;" href="<%=basePath%>salesPrivateBrands/index.do?special=GFKPI">自有品牌销售额</a></td>
    	 	<td>年度</td>
    	 	<td>3分</td>
    	 	<td></td>
    	 	<td></td> 
    	 	<td>0</td> 
    	 	<td>-</td> 
    	 	<td>-</td> 
    	 	<td>0.00%</td>
    	 	<td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr id="deduction_finance_management"  align="center" style="display: none;" >
	    	 <td rowspan="11" style="color: #f7d62b;">扣分项（19分）</td>
	    	 <td><a style="color: #f7d62b;" href="http://localhost:8080/cmcnull?special=GFKPI">财务管理</a></td>
	    	 <td>年度</td>
	    	 <td>2分</td>
	    	 <td></td>
	    	 <td> </td> 
	    	 <td>0</td> 
	    	 <td>-</td> 
	    	 <td>-</td> 
	    	 <td>0.00%</td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr id="deduction_audit_supervision"  align="center" style="display: none;" >
    	 	 <td style="display: none;"></td>
    	 	 <td> <a style="color: #f7d62b;" href="http://localhost:8080/cmcnull?special=GFKPI">审计监督</a></td>
	    	 <td>年度</td>
	    	 <td>2分</td>
	    	 <td></td>
	    	 <td></td> 
	    	 <td>0</td> 
	    	 <td>-</td> 
	    	 <td>-</td> 
	    	 <td>0.00%</td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
        <tr id="deduction_after_sale"  align="center" style="display: none;" >
	    	 <td style="display: none;"></td>
	    	 <td><a style="color: #f7d62b;" href="http://localhost:8080/cmcnull?special=GFKPI">售后管理</a></td>
	    	 <td>年度</td>
	    	 <td>2分</td>
	    	 <td></td>
	    	 <td></td> 
	    	 <td>0</td> 
	    	 <td>-</td> 
	    	 <td>-</td> 
	    	 <td>0.00%</td>
	    	 <td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr  id="deduction_retail_business"  align="center" style="display: none;" >
    	    <td style="display: none;"></td>
    	 	<td><a style="color: #f7d62b;" href="http://localhost:8080/cmcnull?special=GFKPI">零售业务管理</a></td>
    	 	<td>年度</td>
    	 	<td>1分</td>
    	 	<td></td>
    	 	<td></td> 
    	 	<td>0</td> 
    	 	<td>-</td> 
    	 	<td>-</td> 
    	 	<td>0.00%</td>
    	 	<td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr  id="deduction_sys_operate"  align="center" style="display: none;" >
    	    <td style="display: none;"></td>
    	 	<td><a style="color: #f7d62b;" href="http://localhost:8080/cmcnull?special=GFKPI">系统运营质量</a></td>
    	 	<td>年度</td>
    	 	<td>2分</td>
    	 	<td></td>
    	 	<td></td> 
    	 	<td>0</td> 
    	 	<td>-</td> 
    	 	<td>-</td> 
    	 	<td>0.00%</td>
    	 	<td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr  id="deduction_purchase" align="center" style="display: none;" >
    	 	<td style="display: none;"></td>
    	 	<td><a style="color: #f7d62b;" href="http://localhost:8080/cmcnull?special=GFKPI">采购管理</a></td>
    	 	<td>年度</td>
    	 	<td>2分</td>
    	 	<td></td>
    	 	<td></td> 
    	 	<td>0</td> 
    	 	<td>-</td> 
    	 	<td>-</td> 
    	 	<td>0.00%</td>
    	 	<td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr id="deduction_logistics"  align="center" style="display: none;" >
    	 	<td style="display: none;"></td>
    	 	<td><a style="color: #f7d62b;" href="http://localhost:8080/cmcnull?special=GFKPI">物流管理</a></td>
    	 	<td>年度</td>
    	 	<td>2分</td>
    	 	<td></td>
    	 	<td></td> 
    	 	<td>0</td> 
    	 	<td>-</td> 
    	 	<td>-</td> 
    	 	<td>0.00%</td>
    	 	<td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr  id="deduction_risk"  align="center" style="display: none;" >
    	 	<td style="display: none;"></td>
    	 	<td><a style="color: #f7d62b;" href="http://localhost:8080/cmcnull?special=GFKPI">风险管理</a></td>
    	 	<td>年度</td>
    	 	<td>2分</td>
    	 	<td></td>
    	 	<td></td> 
    	 	<td>0</td> 
    	 	<td>-</td> 
    	 	<td>-</td> 
    	 	<td>0.00%</td>
    	 	<td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr id="deduction_integrity_risk"   align="center" style="display: none;" >
    	 	<td style="display: none;"></td>
    	 	<td><a style="color: #f7d62b;" href="http://localhost:8080/cmcnull?special=GFKPI">嵌入式廉洁风险防控机制建设</a></td>
    	 	<td>年度</td>
    	 	<td>2分</td>
    	 	<td></td>
    	 	<td></td> 
    	 	<td>0</td> 
    	 	<td>-</td> 
    	 	<td>-</td> 
    	 	<td>0.00%</td>
    	 	<td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr  id="deduction_cost_progress"   align="center" style="display: none;" >
    	 	<td style="display: none;"></td>
    		<td><a style="color: #f7d62b;" href="http://localhost:8080/cmcnull?special=GFKPI">费用进度均衡性</a></td>
    	 	<td>年度</td>
    	 	<td>2分</td>
    	 	<td></td>
    	 	<td></td> 
    	 	<td>0</td> 
    	 	<td>-</td> 
    	 	<td>-</td> 
    	 	<td>0.00%</td>
    	 	<td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr>
    	 <tr  id="deduction_other_matter"  align="center" style="display: none;" >
    	 	<td style="display: none;"></td>
    	 	<td><a style="color: #f7d62b;" href="http://localhost:8080/cmcnull?special=GFKPI">其他重大事项</a></td>
    	 	<td>年度</td>
    	 	<td>0分</td>
    	 	<td></td>
    	 	<td></td> 
    	 	<td>0</td> 
    	 	<td>-</td> 
    	 	<td>-</td> 
    	 	<td>0.00%</td>
    	 	<td > <button  type="button" class="btn btn-primary" ident="1" style="width:100px">指标说明</button></td><td style="display: none;"></td>
    	 </tr> 
    	 </tbody>
    	 </table>
    
    
<%-- <table   style="line-height: 35px; font-size: 18px;"id = "gf_kpi" width="100%" border="1" align="center" cellspacing="0" height="100%">
  <tr align="center" id="menu">
    <td width="10%">主指标</td>
    <td width="15%"><span id="menu_year">2019</span>年考核项目</td>
    <td width="10%">满分</td>
    <td width="10%">考核周期</td>
    <td width="10%">目标值</td>
    <td width="10%">得分</td>
    <td width="10%">当月完成值</td>
    <td width="10%">年度完成值</td>
    <td width="10%">时间进度</td>
  </tr>
   <c:forEach var="item"   items="${result.operate_income}"   varStatus="status"   >
   <c:choose>
			 <c:when test="${status.first}">
					      <tr align="center" id="businessIncome" >
							    <td rowspan="${fn:length(result.operate_income)}">${item.parentKpiName}    </td>
							    <td  ><a  url="#">${item.kpiName}</a></td>
							    <td>${item.kpiTotalScore}分</td>
							    <td>年度</td>
							    <td>${item.kpiMbz}</td>
							    <fmt:parseNumber value="${item.kpiTotalScore}" type="number" var="kpiTotalScore"></fmt:parseNumber>
							    <fmt:parseNumber value="${item.kpiScore}" type="number" var="kpiScore"></fmt:parseNumber>
							    <c:choose>
								   <c:when test="${kpiScore < kpiTotalScore }">
								  	   <td    style="color: #fb0200;" >${item.kpiScore}&nbsp;&nbsp; <!-- <span class="glyphicon glyphicon-star-empty" style="font-size: 14px;font-weight: bold;  "></span>  --></td>
								  	   <td    style="color: #fb0200;" >${item.kpiMonthComplete}&nbsp;&nbsp; <!--  <span class="glyphicon glyphicon-star-empty" style="font-size: 14px;font-weight: bold;  "></span>  --></td>
								  	   <td    style="color: #fb0200;" >${item.kpiYearComplete} &nbsp;&nbsp; <!-- <span class="glyphicon glyphicon-star-empty" style="font-size: 14px;font-weight: bold;  "></span>  --></td>
								  	   <td    style="color: #fb0200;" >${item.kpiTimeProgress} &nbsp;&nbsp;<!--  <span class="glyphicon glyphicon-star-empty" style="font-size: 14px;font-weight: bold;  "></span>  --></td>
								  	 
								   </c:when>  
								   <c:otherwise>
								      <td>${item.kpiScore}</td>
								      <td>${item.kpiMonthComplete}</td>
								      <td>${item.kpiYearComplete}</td>
								      <td>${item.kpiTimeProgress}</td>
								    </c:otherwise>
								 </c:choose>
					 
							  
						  </tr>
		    </c:when>
		    <c:when test="${item.type == 'operate_income' }">
					      <tr align="center" id="businessIncome">
							    <td><a  url="#">${item.kpiName}</a></td>
							    <td>${item.kpiTotalScore}分</td>
							    <td>年度</td>
							    <td>${item.kpiMbz}</td>
							    <fmt:parseNumber value="${item.kpiTotalScore}" type="number" var="kpiTotalScore"></fmt:parseNumber>
							    <fmt:parseNumber value="${item.kpiScore}" type="number" var="kpiScore"></fmt:parseNumber>
							    <c:choose>
								   <c:when test="${kpiScore < kpiTotalScore }">
								  	   <td    style="color: #fb0200;" >${item.kpiScore}</td>
								  	   <td    style="color: #fb0200;" >${item.kpiMonthComplete}</td>
								  	   <td    style="color: #fb0200;" >${item.kpiYearComplete}</td>
								  	   <td    style="color: #fb0200;" >${item.kpiTimeProgress}</td>
								  	 
								   </c:when>  
								   <c:otherwise>
								      <td>${item.kpiScore}</td>
								      <td>${item.kpiMonthComplete}</td>
								      <td>${item.kpiYearComplete}</td>
								      <td>${item.kpiTimeProgress}</td>
								    </c:otherwise>
								 </c:choose>
							    
						  </tr>
		    </c:when>
   </c:choose>
   </c:forEach>
   <c:forEach var="item"   items="${result.channel_development}"   varStatus="status"   >
      <c:choose>
  		 <c:when test="${status.first}">
					      <tr align="center" id="businessIncome">
							    <td rowspan="${fn:length(result.channel_development) }">${item.parentKpiName}    </td>
							    <td><a  url="#">${item.kpiName}</a></td>
							    <td>${item.kpiTotalScore}分</td>
							    <td>年度</td>
							    <td>${item.kpiMbz}</td>
							    <fmt:parseNumber value="${item.kpiTotalScore}" type="number" var="kpiTotalScore"></fmt:parseNumber>
							    <fmt:parseNumber value="${item.kpiScore}" type="number" var="kpiScore"></fmt:parseNumber>
							    <c:choose>
								   <c:when test="${kpiScore < kpiTotalScore }">
								  	   <td    style="color: #fb0200;" > ${item.kpiScore} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiMonthComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiYearComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiTimeProgress} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	 
								   </c:when>  
								   <c:otherwise>
								      <td>   ${item.kpiScore}</td>
								      <td>${item.kpiMonthComplete}</td>
								      <td>${item.kpiYearComplete}</td>
								      <td>${item.kpiTimeProgress}</td>
								    </c:otherwise>
								 </c:choose>
						  </tr>
		    </c:when>
   
		    <c:when test="${item.type == 'channel_development' }">
					      <tr align="center" id="businessIncome">
							    <td rowspan="">${item.parentKpiName}</td>
							    <td><a  url="#">${item.kpiName}</a></td>
							    <td>${item.kpiTotalScore}分</td>
							    <td>年度</td>
							     <td>${item.kpiMbz}</td>
							    <fmt:parseNumber value="${item.kpiTotalScore}" type="number" var="kpiTotalScore"></fmt:parseNumber>
							    <fmt:parseNumber value="${item.kpiScore}" type="number" var="kpiScore"></fmt:parseNumber>
							    <c:choose>
								   <c:when test="${kpiScore < kpiTotalScore }">
								  	   <td    style="color: #fb0200;" > ${item.kpiScore} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiMonthComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiYearComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiTimeProgress} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	 
								   </c:when>  
								   <c:otherwise>
								      <td>   ${item.kpiScore}</td>
								      <td>${item.kpiMonthComplete}</td>
								      <td>${item.kpiYearComplete}</td>
								      <td>${item.kpiTimeProgress}</td>
								    </c:otherwise>
								 </c:choose>
						  </tr>
		    </c:when>
		    </c:choose>
      </c:forEach>
         <c:forEach var="item"   items="${result.operate_coordination}"   varStatus="status"   >
      <c:choose>
  		 <c:when test="${status.first}">
					      <tr align="center" id="businessIncome">
							    <td rowspan="${fn:length(result.operate_coordination) }">${item.parentKpiName}    </td>
							    <td><a  url="#">${item.kpiName}</a></td>
							    <td>${item.kpiTotalScore}分</td>
							    <td>年度</td>
							     <td>${item.kpiMbz}</td>
							    <fmt:parseNumber value="${item.kpiTotalScore}" type="number" var="kpiTotalScore"></fmt:parseNumber>
							    <fmt:parseNumber value="${item.kpiScore}" type="number" var="kpiScore"></fmt:parseNumber>
							    <c:choose>
								   <c:when test="${kpiScore < kpiTotalScore }">
								  	   <td    style="color: #fb0200;" > ${item.kpiScore} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiMonthComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiYearComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiTimeProgress} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	 
								   </c:when>  
								   <c:otherwise>
								      <td>   ${item.kpiScore}</td>
								      <td>${item.kpiMonthComplete}</td>
								      <td>${item.kpiYearComplete}</td>
								      <td>${item.kpiTimeProgress}</td>
								    </c:otherwise>
								 </c:choose>
						  </tr>
		    </c:when>
   
		    <c:when test="${item.type == 'operate_coordination' }">
					      <tr align="center" id="businessIncome">
							    <td rowspan="">${item.parentKpiName}</td>
							    <td><a  url="#">${item.kpiName}</a></td>
							    <td>${item.kpiTotalScore}分</td>
							    <td>年度</td>
							     <td>${item.kpiMbz}</td>
							   <fmt:parseNumber value="${item.kpiTotalScore}" type="number" var="kpiTotalScore"></fmt:parseNumber>
							    <fmt:parseNumber value="${item.kpiScore}" type="number" var="kpiScore"></fmt:parseNumber>
							    <c:choose>
								   <c:when test="${kpiScore < kpiTotalScore }">
								  	   <td    style="color: #fb0200;" > ${item.kpiScore} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiMonthComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiYearComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiTimeProgress} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	 
								   </c:when>  
								   <c:otherwise>
								      <td>   ${item.kpiScore}</td>
								      <td>${item.kpiMonthComplete}</td>
								      <td>${item.kpiYearComplete}</td>
								      <td>${item.kpiTimeProgress}</td>
								    </c:otherwise>
								 </c:choose>
						  </tr>
		    </c:when>
		    </c:choose>
      </c:forEach>
      <c:forEach var="item"   items="${result.operate_efficiency}"   varStatus="status"   >
      <c:choose>
  		 <c:when test="${status.first}">
					      <tr align="center" id="operate_efficiency">
							    <td rowspan="${fn:length(result.operate_efficiency) }">${item.parentKpiName}    </td>
							    <td><a  url="#">${item.kpiName}</a></td>
							    <td>${item.kpiTotalScore}分</td>
							    <td>年度</td>
							     <td>${item.kpiMbz}</td>
							    <fmt:parseNumber value="${item.kpiTotalScore}" type="number" var="kpiTotalScore"></fmt:parseNumber>
							    <fmt:parseNumber value="${item.kpiScore}" type="number" var="kpiScore"></fmt:parseNumber>
							    <c:choose>
								   <c:when test="${kpiScore < kpiTotalScore }">
								  	   <td    style="color: #fb0200;" > ${item.kpiScore} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiMonthComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiYearComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiTimeProgress} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	 
								   </c:when>  
								   <c:otherwise>
								      <td>   ${item.kpiScore}</td>
								      <td>${item.kpiMonthComplete}</td>
								      <td>${item.kpiYearComplete}</td>
								      <td>${item.kpiTimeProgress}</td>
								    </c:otherwise>
								 </c:choose>
						  </tr>
		    </c:when>
   
		    <c:when test="${item.type == 'operate_efficiency' }">
					      <tr align="center" id="operate_efficiency">
							    <td rowspan="">${item.parentKpiName}</td>
							    <td><a  url="#">${item.kpiName}</a></td>
							    <td>${item.kpiTotalScore}分</td>
							    <td>年度</td>
							     <td>${item.kpiMbz}</td>
							    <fmt:parseNumber value="${item.kpiTotalScore}" type="number" var="kpiTotalScore"></fmt:parseNumber>
							    <fmt:parseNumber value="${item.kpiScore}" type="number" var="kpiScore"></fmt:parseNumber>
							    <c:choose>
								   <c:when test="${kpiScore < kpiTotalScore }">
								  	   <td    style="color: #fb0200;" > ${item.kpiScore} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiMonthComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiYearComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiTimeProgress} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	 
								   </c:when>  
								   <c:otherwise>
								      <td>   ${item.kpiScore}</td>
								      <td>${item.kpiMonthComplete}</td>
								      <td>${item.kpiYearComplete}</td>
								      <td>${item.kpiTimeProgress}</td>
								    </c:otherwise>
								 </c:choose>
						  </tr>
		    </c:when>
		    </c:choose>
      </c:forEach>
      <c:forEach var="item"   items="${result.operate_benefit}"   varStatus="status"   >
      <c:choose>
  		 <c:when test="${status.first}">
					      <tr align="center" id="operate_benefit">
							    <td rowspan="${fn:length(result.operate_benefit) }">${item.parentKpiName}    </td>
							    <td><a  url="#">${item.kpiName}</a></td>
							    <td>${item.kpiTotalScore}分</td>
							    <td>年度</td>
							     <td>${item.kpiMbz}</td>
							    <fmt:parseNumber value="${item.kpiTotalScore}" type="number" var="kpiTotalScore"></fmt:parseNumber>
							    <fmt:parseNumber value="${item.kpiScore}" type="number" var="kpiScore"></fmt:parseNumber>
							    <c:choose>
								   <c:when test="${kpiScore < kpiTotalScore }">
								  	   <td    style="color: #fb0200;" > ${item.kpiScore} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiMonthComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiYearComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiTimeProgress} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	 
								   </c:when>  
								   <c:otherwise>
								      <td>   ${item.kpiScore}</td>
								      <td>${item.kpiMonthComplete}</td>
								      <td>${item.kpiYearComplete}</td>
								      <td>${item.kpiTimeProgress}</td>
								    </c:otherwise>
								 </c:choose>
						  </tr>
		    </c:when>
		    <c:when test="${item.type == 'operate_benefit' }">
					      <tr align="center" id="businessIncome">
							    <td rowspan="">${item.parentKpiName}</td>
							    <td><a  url="#">${item.kpiName}</a></td>
							    <td>${item.kpiTotalScore}分</td>
							    <td>年度</td>
							     <td>${item.kpiMbz}</td>
							   <fmt:parseNumber value="${item.kpiTotalScore}" type="number" var="kpiTotalScore"></fmt:parseNumber>
							    <fmt:parseNumber value="${item.kpiScore}" type="number" var="kpiScore"></fmt:parseNumber>
							    <c:choose>
								   <c:when test="${kpiScore < kpiTotalScore }">
								  	   <td    style="color: #fb0200;" > ${item.kpiScore} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiMonthComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiYearComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiTimeProgress} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	 
								   </c:when>  
								   <c:otherwise>
								      <td>   ${item.kpiScore}</td>
								      <td>${item.kpiMonthComplete}</td>
								      <td>${item.kpiYearComplete}</td>
								      <td>${item.kpiTimeProgress}</td>
								    </c:otherwise>
								 </c:choose>
						  </tr>
		    </c:when>
		    </c:choose>
      </c:forEach>
      <c:forEach var="item"   items="${result.bonus}"   varStatus="status"   >
      <c:choose>
  		 <c:when test="${status.first}">
					      <tr align="center" id="operate_benefit">
							    <td rowspan="${fn:length(result.bonus) }">${item.parentKpiName}    </td>
							    <td><a  url="#">${item.kpiName}</a></td>
							    <td>${item.kpiTotalScore}分</td>
							    <td>年度</td>
							     <td>${item.kpiMbz}</td>
							    <fmt:parseNumber value="${item.kpiTotalScore}" type="number" var="kpiTotalScore"></fmt:parseNumber>
							    <fmt:parseNumber value="${item.kpiScore}" type="number" var="kpiScore"></fmt:parseNumber>
							    <c:choose>
								   <c:when test="${kpiScore < kpiTotalScore }">
								  	   <td    style="color: #fb0200;" > ${item.kpiScore} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiMonthComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiYearComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiTimeProgress} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	 
								   </c:when>  
								   <c:otherwise>
								      <td>   ${item.kpiScore}</td>
								      <td>${item.kpiMonthComplete}</td>
								      <td>${item.kpiYearComplete}</td>
								      <td>${item.kpiTimeProgress}</td>
								    </c:otherwise>
								 </c:choose>
						  </tr>
		    </c:when>
		    <c:when test="${item.type == 'bonus' }">
					      <tr align="center" id="businessIncome">
							    <td rowspan="">${item.parentKpiName}</td>
							    <td><a  url="#">${item.kpiName}</a></td>
							    <td>${item.kpiTotalScore}分</td>
							    <td>年度</td>
							     <td>${item.kpiMbz}</td>
							    <fmt:parseNumber value="${item.kpiTotalScore}" type="number" var="kpiTotalScore"></fmt:parseNumber>
							    <fmt:parseNumber value="${item.kpiScore}" type="number" var="kpiScore"></fmt:parseNumber>
							    <c:choose>
								   <c:when test="${kpiScore < kpiTotalScore }">
								  	   <td    style="color: #fb0200;" > ${item.kpiScore} <span class="glyphicon glyphicon-warning-sign " style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiMonthComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiYearComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiTimeProgress} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	 
								   </c:when>  
								   <c:otherwise>
								      <td>   ${item.kpiScore}</td>
								      <td>${item.kpiMonthComplete}</td>
								      <td>${item.kpiYearComplete}</td>
								      <td>${item.kpiTimeProgress}</td>
								    </c:otherwise>
								 </c:choose>
						  </tr>
		    </c:when>
		    </c:choose>
      </c:forEach>
      <c:forEach var="item"   items="${result.deduction}"   varStatus="status"   >
      <c:choose>
  		 <c:when test="${status.first}">
					      <tr align="center" id="operate_benefit">
							    <td rowspan="${fn:length(result.deduction) }">${item.parentKpiName}    </td>
							    <td><a  url="#">${item.kpiName}</a></td>
							    <td>${item.kpiTotalScore}分</td>
							    <td>年度</td>
							     <td>${item.kpiMbz}</td>
							    <fmt:parseNumber value="${item.kpiTotalScore}" type="number" var="kpiTotalScore"></fmt:parseNumber>
							    <fmt:parseNumber value="${item.kpiScore}" type="number" var="kpiScore"></fmt:parseNumber>
							    <c:choose>
								   <c:when test="${kpiScore < kpiTotalScore }">
								  	   <td    style="color: #fb0200;" > ${item.kpiScore} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiMonthComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiYearComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiTimeProgress} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	 
								   </c:when>  
								   <c:otherwise>
								      <td>   ${item.kpiScore}</td>
								      <td>${item.kpiMonthComplete}</td>
								      <td>${item.kpiYearComplete}</td>
								      <td>${item.kpiTimeProgress}</td>
								    </c:otherwise>
								 </c:choose>
						  </tr>
		    </c:when>
		    <c:when test="${item.type == 'deduction' }">
					      <tr align="center" id="businessIncome">
							    <td rowspan="">${item.parentKpiName}</td>
							    <td><a  url="#">${item.kpiName}</a></td>
							    <td>${item.kpiTotalScore}分</td>
							    <td>年度</td>
							     <td>${item.kpiMbz}</td>
							    <fmt:parseNumber value="${item.kpiTotalScore}" type="number" var="kpiTotalScore"></fmt:parseNumber>
							    <fmt:parseNumber value="${item.kpiScore}" type="number" var="kpiScore"></fmt:parseNumber>
							    <c:choose>
								   <c:when test="${kpiScore < kpiTotalScore }">
								  	   <td    style="color: #fb0200;" > ${item.kpiScore} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiMonthComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiYearComplete} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	   <td    style="color: #fb0200;" > ${item.kpiTimeProgress} <span class="down" style="font-size: 14px;font-weight: bold;  ">↓</span> </td>
								  	 
								   </c:when>  
								   <c:otherwise>
								      <td> ${item.kpiScore}</td>
								      <td>${item.kpiMonthComplete}</td>
								      <td>${item.kpiYearComplete}</td>
								      <td>${item.kpiTimeProgress}</td>
								    </c:otherwise>
								 </c:choose>
						  </tr>
		    </c:when>
		    </c:choose>
      </c:forEach>
      </table> --%>
</div>


<div class="modal fade bs-example-modal-lg" id="nddfModal" tabindex="-1" role="dialog" aria-labelledby="nddfModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">广东分公司2018年度经营业绩考核得分表</h4>
                <span style="color: red;float: right;font-size: 20px;">考核总得分:87.78</span>
            </div>
            <div class="modal-body">
            		<div class="row">
            		   
            		   	<table class="table table-bordered">
								<thead>
									<tr>
										<th>指标名称</th>
										<th>单位</th>
										<th>满分分值</th>
										<th>实际得分</th>
										<th>预算目标</th>
										<th>实际完成</th>
									</tr>
								</thead>
								<tbody>
<!-- 								<tr>
										<td>分公司业绩考核得分</td>
										<td> </td>
										<td> </td>
										<td>87.78</td>
										<td></td>
										<td></td>
									</tr> -->
									<tr>
										<td>一、主指标</td>
										<td> </td>
										<td>98.9分</td>
										<td>83.36</td>
										<td> </td>
										<td> </td>
									</tr>
									<tr>
										<td>1.1  运营收入</td>
										<td> </td>
										<td>35分</td>
										<td>24.25</td>
										<td></td>
										<td> </td>
										
									</tr>
									<tr>
										<td> 1.1.1  运营收入</td>
										<td>万元</td>
										<td>14.25分</td>
										<td>14.25</td>
										<td>854100</td>
										<td>908452.918309</td>
									 
									</tr>
									<tr>
										<td>1.1.2  自有品牌手机收入</td>
										<td>万元</td>
										<td>10分</td>
										<td>0</td>
										<td>26078.4</td>
										<td>7390.529773</td>
									 
									</tr>
									<tr>
										<td> 1.1.3  自有品牌多形态收入</td>
										<td>万元</td>
										<td>10分</td>
										<td>10</td>
										<td>32541.7</td>
										<td>51986.70241</td>
									 
									</tr>
									<tr>
										<td> 1.2  终端销量</td>
										<td>万部</td>
										<td>10分</td>
										<td>8.24</td>
										<td> </td>
										<td> </td>
									 
									</tr>
									<tr>
										<td>  1.2.1 总体终端销量</td>
										<td>万部</td>
										<td>4.75分</td>
										<td>4.75</td>
										<td>857.52</td>
										<td>873.7655</td>
									</tr>
									<tr>
										<td> 1.2.2 重点产品销售达成率</td>
										<td> </td>
										<td>5分</td>
										<td>3.49</td>
										<td></td>
										<td>-</td>
									</tr>
									<tr>
										<td> 1.3  社会渠道拓展</td>
										<td> </td>
										<td>8分</td>
										<td>7.9</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td> 1.3.1 活跃客户目标值</td>
										<td> </td>
										<td>4分</td>
										<td>4</td>
										<td></td>
										<td>1727家</td>
									</tr>
									<tr>
										<td> 1.3.2 KA客户销量目标值</td>
										<td> </td>
										<td>3.9分</td>
										<td>3.9</td>
										<td></td>
										<td>1488178台</td>
									</tr>
									<tr>
										<td>1.4  省移动公司协同</td>
										<td> </td>
										<td>15分</td>
										<td>13.38</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>1.4.1 省移动协同满意度</td>
										<td> </td>
										<td>5分</td>
										<td>5</td>
										<td></td>
										<td>-</td>
									</tr>
									<tr>
										<td>1.4.2 省移动终端销量份额</td>
										<td> </td>
										<td>5分</td>
										<td>4.03</td>
										<td></td>
										<td>3.19%</td>
									</tr>
									<tr>
										<td>1.4.3 4G+销量份额</td>
										<td> </td>
										<td>5分</td>
										<td>4.34</td>
										<td></td>
										<td>-</td>
									</tr>
									<tr>
										<td>1.5 流动资产周转率</td>
										<td> </td>
										<td>15分</td>
										<td>12.59</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td> 1.5.1 存货周转率</td>
										<td> </td>
										<td>3分</td>
										<td>3</td>
										<td>15</td>
										<td>20.1</td>
									</tr>
									<tr>
										<td>1.5.2 三个月以上存货原值占比</td>
										<td> </td>
										<td>3分</td>
										<td>2.96</td>
										<td></td>
										<td>-</td>
									</tr>
									<tr>
										<td>1.5.3 回款预测准确度</td>
										<td> </td>
										<td>3分</td>
										<td>2.74</td>
										<td></td>
										<td>97.94%</td>
									</tr>
									<tr>
										<td> 1.5.4 应收周转率</td>
										<td> </td>
										<td>3分</td>
										<td>1.27</td>
										<td></td>
										<td>15.9</td>
									</tr>
									<tr>
										<td>1.5.5 三个月以上应收账款占比</td>
										<td> </td>
										<td>3分</td>
										<td>2.63</td>
										<td></td>
										<td>-</td>
									</tr>
								    <tr>
										<td>1.6 利润总额</td>
										<td> </td>
										<td>17分</td>
										<td>17</td>
										<td></td>
										<td>-</td>
									</tr>
									
									<tr>
										<td>  1.6.1 总支出占毛利比</td>
										<td> %</td>
										<td>15分</td>
										<td>15</td>
										<td></td>
										<td>-</td>
									</tr>
									<tr>
										<td>——基础目标</td>
										<td> %</td>
										<td>12分</td>
										<td>12</td>
										<td>93.0%</td>
										<td>89.3%</td>
									</tr>
									<tr>
										<td>——挑战目标</td>
										<td> %</td>
										<td>3分</td>
										<td>3</td>
										<td>90.0%</td>
										<td>89.3%</td>
									</tr>
									<tr>
										<td>  1.6.2 费用均衡度</td>
										<td> %</td>
										<td>2分</td>
										<td>2</td>
										<td> </td>
										<td> 目标进度 得分
 
合计  2</td>
									</tr>
								    <tr>
										<td>二、加分项</td>
										<td> </td>
										<td>10分</td>
										<td>4.93</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>2.1   自有品牌收入</td>
										<td>万元 </td>
										<td>3分</td>
										<td>0.43</td>
										<td>81203.3</td>
										<td>61834.70</td>
									</tr>
									<tr>
										<td>2.2   非集团集采类自有品牌多形态收入</td>
										<td>万元 </td>
										<td>2分</td>
										<td>0.00</td>
										<td>3387</td>
										<td>801</td>
									</tr>
									<tr>
										<td>2.3   新零售门店运营</td>
										<td>万元 </td>
										<td>2分</td>
										<td>1.50</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>2.4  人均利润额</td>
										<td>万元 </td>
										<td>3分</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>三、扣分项</td>
										<td> </td>
										<td>-</td>
										<td>0.50</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>3.1  采购管理扣分</td>
										<td>万元 </td>
										<td>扣2分</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>3.2  价格管理扣分</td>
										<td>万元 </td>
										<td>扣2分</td>
										<td>0.40</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>3.3  财务管理扣分</td>
										<td>万元 </td>
										<td>扣2分</td>
										<td>0.10</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>3.4  系统运营质量扣分</td>
										<td>万元 </td>
										<td>扣2分</td>
										<td>0.00</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>3.5  审计监督扣分</td>
										<td>万元 </td>
										<td>扣2分</td>
										<td>0.00</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>3.6  售后管理扣分</td>
										<td>万元 </td>
										<td>扣2分</td>
										<td>0.00</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>3.7  零售业务管理扣分</td>
										<td>万元 </td>
										<td>扣1分</td>
										<td>0.00</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>3.8  风险控制扣分</td>
										<td>万元 </td>
										<td>扣2分</td>
										<td>0.00</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>3.9  重大管理事项扣分</td>
										<td>万元 </td>
										<td>扣2分</td>
										<td>0.00</td>
										<td></td>
										<td></td>
									</tr>
						
								</tbody>
							</table>
            		   
            		
            		
            		</div>
            
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>



	<!-- 添加备注模态框（Modal） -->
<div class="modal fade" id="addRemarksModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"   data-backdrop="static" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加备注</h4>
            </div>
            <div class="modal-body">
				<form id="addForm" class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="firstname" class="col-sm-4 control-label">月份</label>
				    <div class="col-sm-4">
				 
				      <input id="modal_billcyc" name="modal_billcyc" type="text" style="width:90%"  readonly="readonly"class="form-text select"/>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-4 control-label">2019年考核项目</label>
				    <div class="col-sm-4">
				      <input type="text" class="form-control" id="modal_item" name="modal_item" readonly="readonly">
				    </div>
				   
				  </div>
				  <div class="form-group">
				    <label for="firstname" class="col-sm-4 control-label">备注</label>
				    <div class="col-sm-4">
				     <!--  <input type="text" class="form-control" id="jbmbz" id="jbmbz" placeholder="备注"> -->
				      <textarea id="modal_remarks"  rows="8" cols="55">
						 
					 </textarea>
				      <input type="hidden" class="form-control" id="modal_kpiKey" id="modal_kpiKey" >
				      
				    </div>
				  
				  </div>
   				   
				</form>
			
			</div>
			<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id = "modal_submitBtn" class="btn btn-primary">提交</button>
            </div>
			
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


</body>
</html>
