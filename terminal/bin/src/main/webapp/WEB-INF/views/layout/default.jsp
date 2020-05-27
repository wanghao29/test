<%@ page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="sharainy" tagdir="/WEB-INF/tags" %>  
<%@ page import="com.asiainfo.cmc.utils.properties.JdbcConfig"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>

<!DOCTYPE html>
<html>
<head>
<title>终端大数据营销平台<sitemesh:title/></title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
 
 <%
 

WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());    
JdbcConfig Config = (JdbcConfig)wac.getBean("jdbcConfig");
session.setAttribute("bdMapUrl",Config.bdMapUrl);
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <link href="<%=basePath%>resources/css/main.css" rel="stylesheet">
    <link href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap.css" rel="stylesheet">
    <link href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap-theme.css" rel="stylesheet">
	<link href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap-dialog.css" rel="stylesheet">
    <link href="<%=basePath%>resources/js/plugin/searchableSelect/jquery.searchableSelect.css" rel="stylesheet">
    <link href="<%=basePath%>resources/js/plugin/slider/bootstrap-slider.css" rel="stylesheet">
	<link href="<%=basePath%>resources/js/plugin/bootstrap_table/bootstrap-table.css" rel="stylesheet">

    <link href="<%=basePath%>resources/js/plugin/jqGrid/css/jquery-ui.css" rel="stylesheet">
    <link href="<%=basePath%>resources/js/plugin/jqGrid/css/ui.jqgrid.css" rel="stylesheet">
    <link href="<%=basePath%>resources/js/plugin/jqGrid/css/jquery-ui.theme.css" rel="stylesheet">
    
    
     <link href="<%=basePath%>resources/js/plugin/select2/css/select2.css" rel="stylesheet">

	<link href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap-editable.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/css/plugin/checkboxs/font-awesome-4.6.3/css/font-awesome.min.css">
 
	<link rel="stylesheet" type="text/css" href="<%=basePath%>resources/css/plugin/checkboxs/build.css">
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
 
 	<link href="<%=Config.bdMapUrl%>/css/map.css" rel="stylesheet"> 
	<sitemesh:head/>


<style   type="text/css">
 .a{
    color:#FFFFFF;
} 
.active{
	text-decoration: underline;
}
.subnav li{
text-align: left;
}


.loginTitle{
    text-align: center;
    font-family: 微软雅黑;
}

.col-center-block {
    float: none;
    display: block;
    margin-left: auto;
    margin-right: auto;
}

</style>
</head>

<body   style="overflow-x:hidden;min-width: 1557px;">
   
<div class="header"  >
<input type="hidden" id="bdMapUrl"  value="<%=Config.bdMapUrl%>">
<!-- 临时处理方式 -->
<%--         <ul>
            <!--<li class="logo">
                <a title="终端大数据营销平台"></a>
            </li>-->
            <li style="float: right;">
       
                   欢迎您,【<shiro:principal property="nickname"/>】<img style="vertical-align: middle;margin-right: 5px;" src="<%=basePath%>resources/images/ico_user.png" >
            </li>
        </ul> --%>
 
<%--          <div style="position:absoult ;z-index: 9999;float: right">
		    欢迎您,【<shiro:principal property="nickname"/>】
		    <a class="btn btn-warning" role="button" href="<%=basePath%>main/logout.do">退出登录</a>
		</div> --%>
 
 <c:set var="special" scope="session" value="${special}"/> 
 
<c:if test="${special == 'CHANNEL'}">
	<div class="row ">
	  <div id="menu" class="col-xs-5" style="border-color: green;">
			  <ul class=" " style="width: 100%;">
			         <shiro:hasPermission name="customerChannel:list">
			         	<li id="customerChannel"><a class="a" href="<%=basePath%>customerChannel/index.do" style="font-size:20px;" >渠道客户画像</a></li>
			         </shiro:hasPermission>
			         <shiro:hasPermission name="followCustomerSearch:list">
			         	<li id="followCustomerSearch"><a class="a" href="<%=basePath%>followCustomerSearch/index.do" style="font-size:20px;" >关注客户搜索</a></li>		
			         </shiro:hasPermission>		
			     <%--     <sharainy:hasAnyPermissions name="customerIdentifyCount:list,customerIdentifyNormal:list,customerIdentifyDynamic:list">	 --%>  
					        <li class="drop" id="cellIdentifyInfo"><a  class="a" href="#" style="font-size:20px;" >客商特征</a> 
					        	 <ul class="subnav">
					                <shiro:hasPermission name="customerIdentifyCount:list"> 
					                	<li><a class="a" href="<%=basePath%>customerIdentifyInfo/customerIdentifyCount.do" style="font-size:20px;" >客商特征统计</a></li>
					                </shiro:hasPermission>
					                <shiro:hasPermission name="customerIdentifyNormal:list"> 
					                	<li><a class="a" href="<%=basePath%>customerIdentifyInfo/customerIdentifyNormal.do" style="font-size:20px;" >客商常态特征</a></li>
					                </shiro:hasPermission>
					                <shiro:hasPermission name="customerIdentifyDynamic:list"> 
					                	<li  ><a class="a" href="<%=basePath%>customerIdentifyInfo/customerIdentifyDynamic.do" style="font-size:20px;" >客商动态特征</a></li>
					                </shiro:hasPermission>
					             </ul>
					        </li>	
			 <%--        </sharainy:hasAnyPermissions>	 --%>	  
			        <li class="drop" id="hallIdentifyInfo"><a   class="a"  href="#" style="font-size:20px;" >厅店特征</a>
			        	 <ul class="subnav">
			               <shiro:hasPermission name="hallIdentifyCount:list">  
			               		<li  ><a  class="a" href="<%=basePath%>hallIdentifyInfo/hallIdentifyCount.do" style="font-size:20px;" >厅店特征统计</a></li>
			               </shiro:hasPermission>
			               <shiro:hasPermission name="hallIdentifyNorma:list">  
			               		<li  ><a class="a" href="<%=basePath%>hallIdentifyInfo/hallIdentifyNormal.do" style="font-size:20px;" >厅店常态特征</a></li>
			               </shiro:hasPermission>
			               <shiro:hasPermission name="hallIdentifyDynamic:list">  
			               		<li  ><a class="a" href="<%=basePath%>hallIdentifyInfo/hallIdentifyDynamic.do" style="font-size:20px;" >厅店动态特征</a></li>
			               </shiro:hasPermission>
			             </ul>

			        </li>
			  </ul>
	   </div>
	  <div align="center" class="col-xs-2" style="border-color: red;">
			<ul class=" "   >
		        <h1 class="logo">
		            <a title="终端大数据营销平台"></a>
		        </h1>
		    </ul>
	  </div>
	 <div class="col-xs-5" style="border-color: green;">
		  <ul class=" ">
		        <shiro:hasPermission name="storeBattleMap:list"> 
			        <li class="drop" id="storeBattleMap" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">
			        	<a   class="a"  href="<%=basePath%>storeBattleMap/index.do" style="font-size:20px;">门店作战地图</a>
			        </li>
			    </shiro:hasPermission>
		        
<%--		        
		        <li class="drop" id="hallIdentityMap" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">
		        	<a   class="a"  href="<%=basePath%>hallIdentityMap/index.do" style="font-size:20px;">厂商门店地图</a>
		        </li>
--%>		        
		        
<%-- 		        
               <li class="drop" id="hallIdentityMap" ><a   class="a" href="#"  style="font-size:20px;">厂商特性地图</a>
		        	 <ul class="subnav">
		                <li  class="active"><a  class="a" href="<%=basePath%>hallIdentityMap/index.do" style="font-size:20px;">厂商门店地图</a></li>
		                <li  ><a  class="a" href="<%=basePath%>cellIdentityMap/index.do" style="font-size:20px;">厂商基站地图</a></li>
		             </ul>

		        </li> 
--%>
		        
		        <li class="drop" id="shopCover"><a   class="a"  href="#" style="font-size:20px;">品牌覆盖情况</a>
		        	 <ul class="subnav">
		               <shiro:hasPermission name="shopCover:list">  
		               		<li  ><a  class="a" href="<%=basePath%>shopCover/index.do" style="font-size:20px;">门店覆盖情况</a></li>
		               </shiro:hasPermission>
		               <shiro:hasPermission name="baseStationCoverage:list">  
		               		<li  ><a  class="a" href="<%=basePath%>baseStationCoverage/index.do" style="font-size:20px;">基站覆盖情况</a></li>
		               </shiro:hasPermission>
		             </ul>
		        </li>
		        <li><%-- <a href="<%=basePath%>" style="font-size:24px;">返回首页</a> --%></li>
		        <a  class="a" href="<%=basePath%>admin/user/list.do" title="返回首页"  style="font-size:20px;"><em class="back-icon"></em></a>
		  </ul>
	 </div>
	</div>

</c:if>
<c:if test="${special == 'MONITOR'}">
		<div class="row ">
		  <div class="col-xs-5" style="border-color: green;float: left;min-width: 550px;">
				  <ul class=" " style="width: 100%; ">
				        <%--<li class="active" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">--%>
					   <li id="businessIncome" class="active drop" >
				        <a   class="a"  href="#" style="font-size:24px;">基础项</a>
				          <ul class="subnav" style="width: 180px;">
				                <shiro:hasPermission name="businessIncome:list">   
				                	<li  ><a  class="a" href="<%=basePath%>businessIncome/businessIncome/index.do?special=MONITOR"  style="font-size:16px;">运营收入</a></li>
				                </shiro:hasPermission>
				                <shiro:hasPermission name="terminalSales:list">   
				                	<li  ><a  class="a" href="<%=basePath%>terminalSales/terminalSales/index.do?special=MONITOR" style="font-size:16px;">终端销量</a></li>
				                </shiro:hasPermission>
				                <shiro:hasPermission name="stockTurnoverRatio:list">   
				                	<li  ><a  class="a" href="<%=basePath%>assetsTurnoverRate/stockTurnoverRatio/index.do?special=MONITOR" style="font-size:16px;">存货周转率</a></li>
				                </shiro:hasPermission>
				                <shiro:hasPermission name="salesShare4G:list">   
				                	<li  ><a  class="a" href="<%=basePath%>corporationCollaboration/salesShare4G/index.do?special=MONITOR" style="font-size:16px;">4G+销量份额</a></li>
				                </shiro:hasPermission>
				                <shiro:hasPermission name="customerTargetValue:list">  
				                	<li  ><a  class="a" href="<%=basePath%>socialChannelExpand/customerTargetValue/index.do?special=MONITOR" style="font-size:16px;">活跃客户目标值</a></li>
				                </shiro:hasPermission>
				                <shiro:hasPermission name="repaymentAccuracyForecast:list">  
				                	<li  ><a  class="a" href="<%=basePath%>assetsTurnoverRate/repaymentAccuracyForecast/index.do?special=MONITOR" style="font-size:16px;">回款预测准确度</a></li>		                  					      
						        </shiro:hasPermission>
						        <shiro:hasPermission name="accountReceivableTurnoverRatio:list">  
						        	<li  ><a  class="a" href="<%=basePath%>assetsTurnoverRate/accountReceivableTurnoverRatio/index.do?special=MONITOR" style="font-size:16px;">应收账款周转率</a></li>
				                </shiro:hasPermission>
				                <shiro:hasPermission name="feeProgressBalance:list">
				                	<li  ><a  class="a" href="<%=basePath%>totalProfit/feeProgressBalance/index.do?special=MONITOR" style="font-size:16px;">费用进度均衡性</a></li>
				                </shiro:hasPermission>
				                <shiro:hasPermission name="businessIncome:list">
				                	<li  ><a  class="a" href="<%=basePath%>businessIncome/privateBrandIncome/index.do?special=MONITOR"  style="font-size:16px;">自有品牌手机收入</a></li>
				                </shiro:hasPermission>
				                <shiro:hasPermission name="socialChannelExpand:list">
				                	<li  ><a  class="a" href="<%=basePath%>socialChannelExpand/customerSalesTargetValue/index.do?special=MONITOR" style="font-size:16px;">KA客户销量目标值</a></li>
				                </shiro:hasPermission>
				                <shiro:hasPermission name="terminalSales:list">
				                	<li  ><a  class="a" href="<%=basePath%>terminalSales/productSalesRate/index.do?special=MONITOR" style="font-size:16px;">重点产品销售达成率</a></li> 	
				                </shiro:hasPermission>
				                <shiro:hasPermission name="corporationCollaboration:list">
				                	<li  ><a  class="a" href="<%=basePath%>corporationCollaboration/terminalSaleShare/index.do?special=MONITOR" style="font-size:16px;">省移动终端销量份额</a></li>
				           		</shiro:hasPermission>
				           		<shiro:hasPermission name="grossProfitRatio:list">
				           			<li  ><a  class="a" href="<%=basePath%>totalProfit/grossProfitRatio/index.do?special=MONITOR" style="font-size:16px;">总支出占综合毛利比</a></li>
						        </shiro:hasPermission>
						        <shiro:hasPermission name="threeMonthStockRatio:list">
						        	<li  ><a  class="a" href="<%=basePath%>assetsTurnoverRate/threeMonthStockRatio/index.do?special=MONITOR" style="font-size:16px;">三个月以上存货占比</a></li>
						        </shiro:hasPermission>
						        <shiro:hasPermission name="businessIncome:list">
						        	<li  ><a  class="a" href="<%=basePath%>businessIncome/incomeMultiForm/index.do?special=MONITOR"  style="font-size:16px;">自有品牌多形态终端收入</a></li>
						        </shiro:hasPermission>
						        <shiro:hasPermission name="accountReceivableRatio:list">
						        	<li  ><a  class="a" href="<%=basePath%>assetsTurnoverRate/accountReceivableRatio/index.do?special=MONITOR" style="font-size:16px;">三个月以上应收账款占比</a></li>
				         		</shiro:hasPermission>
				          </ul>
				        </li>
				  </ul>
		   </div>
		  <div class="col-xs-2 " style="border-color: red;float: left;">
				<ul class=" "   >
			        <h2 class="logo">
			            <a title="终端大数据营销平台"></a>
			        </h2>
			    </ul>
		  </div>
				<div class=" col-xs-5" style="border-color: green;float: left;min-width: 507px;">
						  <ul class=" " style="width: 100%;">
						        <li id="assetsTurnoverRate" class="drop"><a   class="a"  href="#" style="font-size:24px;">加分项</a>
						        	  <ul class="subnav">
									
						                <shiro:hasPermission name="privateBrandSalesIncome:list">
						                	<li  ><a  class="a"  href="<%=basePath%>pointOption/privateBrandSalesIncome/index.do?special=MONITOR" style="font-size:16px;">自有品牌总收入</a></li>
						                </shiro:hasPermission>
						                <shiro:hasPermission name="newRetailOperation:list">	
						                	<li  ><a  class="a"  href="<%=basePath%>pointOption/newRetailOperation/index.do?special=MONITOR" style="font-size:16px;">新零售门店运营</a></li>
						                </shiro:hasPermission>
						                <shiro:hasPermission name="averageProfit:list">
						                	<li  ><a  class="a"  href="<%=basePath%>pointOption/averageProfit/index.do?special=MONITOR" style="font-size:16px;">人均利润额</a></li>
						                </shiro:hasPermission>
						             </ul>
						        
						        </li>
					   		   <shiro:hasPermission name="reduceItem:list">
						         <li id="pointOption" class="drop"><a   class="a"  href="#" style="font-size:24px;">扣分项</a>
						           <ul class="subnav">
						                 <shiro:hasPermission name="reduceItem:list">
						                 	<li  ><a  class="a"  href="<%=basePath%>pointOption/reduceItem/index.do?special=MONITOR" style="font-size:16px;">扣分项</a></li>
						                 </shiro:hasPermission>
						             </ul>
						         
						         </li>
						        </shiro:hasPermission>
						        <li  style="float：right;"></li>
						        
						        <a   class="a" href="<%=basePath%>entry/index.do?special=MONITOR" title="返回重点KPI全景"  style="font-size:24px;" ><em class="back-icon"></em></a>
						  </ul>
				</div>
		</div>


</c:if>
<c:if test="${special == 'type_8'}">
		<div class="row ">
		  <div class="col-xs-5" style="border-color: green;float: left;min-width: 550px;">   
				  <ul class=" " style="width: 100%; ">
				         <shiro:hasPermission name="amount:list">
					          <c:if test="${type_8 == '量'}">
					        	  <li class="active" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">
							           <a  class="a"  href="<%=basePath%>amount/index.do?type_8=量&special=type_8" style="font-size:24px;">量</a>
							        </li>
					         </c:if>
							  <c:if test="${type_8 != '量'}">
							         <li class="" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">
							           <a  class="a"  href="<%=basePath%>amount/index.do?type_8=量&special=type_8" style="font-size:24px;">量</a>
							   		 </li>
							  </c:if>
					      </shiro:hasPermission>
					      <shiro:hasPermission name="collect:list">
							  <c:if test="${type_8 == '收'}">
					        	   <li class="active" ><a  class="a"  href="<%=basePath%>amount/index.do?type_8=收&special=type_8" style="font-size:24px;">收</a>  </li>
					         </c:if>
							  <c:if test="${type_8 != '收'}">
							          <li  ><a  class="a"  href="<%=basePath%>amount/index.do?type_8=收&special=type_8" style="font-size:24px;">收</a>  </li>
							  </c:if>
						  </shiro:hasPermission>
					      <shiro:hasPermission name="benefit:list">
	  						 <c:if test="${type_8 == '利'}">
					        	  <li  class="active" ><a  class="a"  href="<%=basePath%>amount/index.do?type_8=利&special=type_8" style="font-size:24px;">利</a>  </li>
					         </c:if>
							  <c:if test="${type_8 != '利'}">
							        <li  ><a  class="a"  href="<%=basePath%>amount/index.do?type_8=利&special=type_8" style="font-size:24px;">利</a>  </li>
							  </c:if>
				          </shiro:hasPermission>
					      <shiro:hasPermission name="share:list">
					        <c:if test="${type_8 == '份'}">
					        	  <li class="active" ><a   class="a" href="<%=basePath%>amount/index.do?type_8=份&special=type_8"  style="font-size:24px;">份</a> </li>
					         </c:if>
							  <c:if test="${type_8 != '份'}">
							       <li ><a   class="a" href="<%=basePath%>amount/index.do?type_8=份&special=type_8"  style="font-size:24px;">份</a> </li>
							  </c:if>
				        	</shiro:hasPermission>
					      
				        
				      
				       
				  </ul>
		   </div>
		  <div class="col-xs-2 " style="border-color: red;float: left;">
				<ul class=" "   >
			        <h1 class="logo">
			            <a title="终端大数据营销平台"></a>
			        </h1>
			    </ul>
		  </div>
				<div class=" col-xs-5" style="border-color: green;float: left;min-width: 507px;">
					 <ul class=" ">
			  			   <shiro:hasPermission name="enter:list">
							  <c:if test="${type_8 == '进'}">
					        	  <li class="active" ><a  class="a"  href="<%=basePath%>amount/index.do?type_8=进&special=type_8" style="font-size:24px;">进</a> </li>
					          </c:if>
							  <c:if test="${type_8 != '进'}">
							      <li ><a  class="a"  href="<%=basePath%>amount/index.do?type_8=进&special=type_8" style="font-size:24px;">进</a>  </li>
							  </c:if>
						   </shiro:hasPermission>
					       <shiro:hasPermission name="pin:list">
							   <c:if test="${type_8 == '销'}">
					        	  <li class="active" ><a  class="a"  href="<%=basePath%>amount/index.do?type_8=销&special=type_8" style="font-size:24px;">销</a> </li>
					           </c:if>
							   <c:if test="${type_8 != '销'}">
							       <li ><a  class="a"  href="<%=basePath%>amount/index.do?type_8=销&special=type_8" style="font-size:24px;">销</a></li>
							   </c:if>
						   </shiro:hasPermission>
					       <shiro:hasPermission name="deposit:list">
							   <c:if test="${type_8 == '存'}">
					        	  <li class="active" ><a   class="a" href="<%=basePath%>amount/index.do?type_8=存&special=type_8" style="font-size:24px;">存</a> </li>
					           </c:if>
							   <c:if test="${type_8 != '存'}">
							       <li ><a   class="a" href="<%=basePath%>amount/index.do?type_8=存&special=type_8" style="font-size:24px;">存</a> </li>
							   </c:if>
							 </shiro:hasPermission>
					         <shiro:hasPermission name="back:list">
							   <c:if test="${type_8 == '回'}">
					        	  <li class="active" ><a   class="a" href="<%=basePath%>amount/index.do?type_8=回&special=type_8" style="font-size:24px;">回</a>  </li>
					           </c:if>
							   <c:if test="${type_8 != '回'}">
							       <li ><a   class="a" href="<%=basePath%>amount/index.do?type_8=回&special=type_8" style="font-size:24px;">回</a> </li>
							   </c:if>
						   </shiro:hasPermission>
					        
						          <a   class="a" href="<%=basePath%>entry/index.do?special=MONITOR" title="返回重点KPI全景"  style="font-size:24px;" ><em class="back-icon"></em></a>
						  </ul>
				</div>
		</div>


</c:if>




<c:if test="${special == 'MODEL'}">
		<div class="row ">
		  <div class="col-xs-5" style="border-color: green;float: left;min-width: 550px;">   
				  <ul class=" " style="width: 100%; ">
				         <shiro:hasPermission name="brandRangeSet:list">
					        <li id="brand_capacity_set" class="a" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">
					            <a   class="a" href="<%=basePath%>brandRangeSet/index.do" style="font-size:24px;">品牌容量设置</a>
					        </li>
				         </shiro:hasPermission>
				        <shiro:hasPermission name="priceRangeSet:list">
				        <li  id="price_capacity_set"  class="a" class="active" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">
				       		 <a   class="a" href="<%=basePath%>priceRangeSet/index.do" style="font-size:24px;">价格段容量设置</a>
				        </li>
				        </shiro:hasPermission>
				 <%--        <li class="drop" ><a href="#">八字维度</a>
				        	 <ul class="subnav">
				                <li  ><a href="<%=basePath%>amount/index.do" style="font-size:24px;">量</a></li>
				                <li  ><a>重点产品销售达成率</a></li>
				             </ul>
				        
				        </li> --%>
				       
				  </ul>
		   </div>
		  <div class=" col-xs-2" style="border-color: red;float: left;">
				<ul class=" "   >
			        <h1 class="logo">
			            <a title="终端大数据营销平台"></a>
			        </h1>
			    </ul>
		  </div>
				<div class="col-xs-5" style="border-color: green;float: left;min-width: 507px;">
						  <ul class=" ">
						 
					    <li class="a" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')"><a  class="a"  href="<%=basePath%>MODEL.do?special=MODEL" style="font-size:24px;">运营周报</a>
					           <ul class="subnav">
						                <li  ><a class="a" href="<%=basePath%>dmDate/index.do">DM非纯移动占比数据</a></li>
						                <li  ><a class="a" href="<%=basePath%>contractPhoneAmountAndShare/index.do">合约机销量及份额</a></li>
						                <li  ><a class="a" href="<%=basePath%>contractPhoneAmount/index.do">各渠道合约机销量</a></li>
						                <li  ><a class="a" href="<%=basePath%>selfAmount/index.do">4G+自带机情况</a></li>
						                <li  ><a class="a" href="<%=basePath%>appleAmount/index.do">苹果库存加权跌价</a></li>
						        
						             </ul>
						        
						        </li> 
						     
						        
						    <shiro:hasPermission name="productInformationSet:list">   
						       		<li id="product_information" ><a  class="a"  href="<%=basePath%>productInformationSet/index.do" style="font-size:24px;">产品信息及规划设置</a>
						        <!--  <ul class="subnav">
							                <li  ><a class="a" href="#">三个月以上存货占比</a></li>
							                <li  ><a class="a" href="#">回款预测准确度</a></li>
							                <li  ><a class="a" href="#">应收账款周转率</a></li>
							                <li  ><a class="a" href="#">三个月以上应收账款占比</a></li>
							        
							             </ul>  -->
							        
							        </li>
						      </shiro:hasPermission>
						        <li  ><a href="<%=basePath%>admin/user/list.do" style="font-size:24px;">返回首页</a></li>
					        <li  ><%-- <a href="<%=basePath%>" style="font-size:24px;">返回首页</a> --%></li>
						           <a  class="a"  href="<%=basePath%>home.do?special=MODEL" style="font-size:24px;" ><em class="back-icon"></em></a>
						  </ul>
				</div>
		</div>


</c:if>
<c:if test="${special == 'CONSUMER'}">
		<div class="row" id="menu">
		  <div class="col-xs-5" style="border-color: green;float: left;min-width: 550px;">   
	 		 <ul class=" ">
					<shiro:hasPermission name="xfzzlBigData:list">  
						<li class="drop" id="xfzzlBigData" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">
							<a class="a" href="<%=basePath%>xfzzlBigData/index.do" style="font-size:20px;">消费者总览</a>&nbsp;&nbsp;
						</li>
					</shiro:hasPermission>
					<shiro:hasPermission name="consumerBigData:list">  
						<li class="drop" id="index" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">
							<a class="a" href="<%=basePath%>consumerBigData/index.do" style="font-size:20px;">消费者大数据</a>&nbsp;&nbsp;
						</li>	
					</shiro:hasPermission>									       
			</ul>
		   </div>
		  <div class=" col-xs-2" style="border-color: red;float: left;">
				<ul class=" "   >
			        <h1 class="logo" style="margin-top: 10px;">
			            <a title="终端大数据营销平台"></a>
			        </h1>
			    </ul>
		  </div>
				<div class="col-xs-5" style="border-color: green;float: left;min-width: 507px;">
					  <ul class=" ">
							
							<shiro:hasPermission name="crossAnalysis:list">  
								<li class="drop" id="crossAnalysis" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">
									<a class="a" href="<%=basePath%>consumerBigData/crossAnalysis.do" style="font-size:20px;">交叉分析表</a>&nbsp;&nbsp;
								</li>							       
						    </shiro:hasPermission>    
						   
						           <a  class="a"  href="<%=basePath%>admin/user/list.do" title="返回首页"  style="font-size:24px;" ><em class="back-icon"></em></a>
						  </ul>
				</div>
		</div>


</c:if>
<c:if test="${special == 'cityKpi'}">
	<div class="row" id="menu">
		<div class="col-xs-5" style="border-color: green;float: left;min-width: 550px;">   
			<ul class=" " style="width: 100%; ">
				<shiro:hasPermission name="zdKpiCompltVal:list">  
					<li class="drop" id="zdKpiCompltVal" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">
						<a class="a" href="<%=basePath%>zdKpiCompltVal/index.do" style="font-size:20px;">完成值设置</a>&nbsp;&nbsp;
					</li>
				</shiro:hasPermission>
				<shiro:hasPermission name="zdKpiGoalVal:list">  
					<li class="drop" id="zdKpiGoalVal" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">
						<a class="a" href="<%=basePath%>zdKpiGoalVal/index.do" style="font-size:20px;">目标值设置</a>&nbsp;&nbsp;
					</li>
				</shiro:hasPermission>
				<shiro:hasPermission name="zdKpiImptProdt:list">  
					<li class="drop" id="zdKpiImptProdt" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">
						<a class="a" href="<%=basePath%>zdKpiImptProdt/index.do" style="font-size:20px;">终端产品设置</a>
			        </li>
		        </shiro:hasPermission>
			</ul>
		</div>
		<div class="col-xs-2 " style="border-color: red;float: left;">
			<ul class=" "   >
				<h1 class="logo">
			    	<a title="终端大数据营销平台"></a>
			    </h1>
			</ul>
		</div>
		<div class="col-xs-5" style="border-color: green;float: left;min-width: 507px;">
		<ul class=" ">
			<shiro:hasPermission name="zdResultCitykpiQ:list">  
				<li class="drop" id="zdResultCitykpiQ" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">
					<a class="a" href="<%=basePath%>zdResultCitykpiQ/index.do" style="font-size:20px;">各地市年度KPI指标</a>&nbsp;&nbsp;
				</li>
			</shiro:hasPermission>
			<shiro:hasPermission name="calcResultIndex:list">  
				<li class="drop" id="calcResultIndex" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">
					<a class="a" href="<%=basePath%>zdResultCitykpiQ/calcResultIndex.do" style="font-size:20px;">清算结果表</a>
				</li>
			</shiro:hasPermission>
			<li style="float：right;"></li>
			<a class="a" href="<%=basePath%>entry/index.do?special=MONITOR" title="返回重点KPI全景"  style="font-size:24px;" ><em class="back-icon"></em></a>
		</ul>
	</div>
</div>

</c:if>
</div>

<!-- 界面内容显示 -->
<div class=" ">
   <div class="row" style="height: 95%;">
       <div class="col-xs-12">
       <div style="margin-left: 40px;margin-right: 20px;">
       	<sitemesh:write property='body' />
       	</div>
       </div>
 
    </div>
</div>
 
    
<!--  <div class="footer">
    <p>Copyright©1999-2018  中国移动  版权所有</p>
    <p>中华人民共和国增值电信业务经营许可证      经营许可证编号：A2.B1.B2-20100001</p>
</div> -->
</body>
</html>