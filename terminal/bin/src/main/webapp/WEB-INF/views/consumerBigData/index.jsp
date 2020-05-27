<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>关注客户搜索</title>

</head>
<body>
<style type="text/css">
.mt ul li{
 margin-top: 25px; 
}
.mt ul li label{
    width: 130px;
}

.panel-height{
width: 100%;
height: 350px;
}
.panel-height-two{
width: 100%;
height: 350px;
}
.title-no-border{
	color: #5bfdff;
	font-size: 18px;
	margin-left: 12px;
}
.conditions_select{
  width: 100%;

}
.conditions_select  li:first-child{
   color: #5bfdff;
   font-weight: 800;
}
.conditions_select li{
	float: left;
	/* margin-right: 20px; */
	width: 21%;
	list-style: none;
}

.searchable-select,.searchable-select-dropdown{
	width:100%;
}
.mt ul li label {
    width: 170px;
} 
.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
    height: 27px;
    margin-top: 15px;
}
.ui-jqgrid .ui-common-table {
    padding-left: 2px;
}
.content div{
  color: #FFFFFF;
}


.slider.slider-horizontal ,.absolute-div{
    width: 36%;
}

input[type="radio"], input[type="checkbox"] {
    width: 16px;
    height: 16px;
}
th.ui-th-column div{
    white-space:normal !important;
    height:auto !important;
    padding:0px;
}
.ui-jqgrid tr.jqgrow td { white-space: normal !important; height:auto; } 

</style>
 
    <link href="<%=basePath%>resources/css/cube.css" rel="stylesheet">
    <script type="text/javascript" src="<%=basePath%>resources/js/consumerBigData/indicatorsDataAnalysis.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/consumerBigData/index.js"></script>

    <script type="text/javascript" src="<%=basePath%>resources/js/consumerBigData/jquery.jscrollpane.min.js"></script>
     <div  class="row">	
			 	<form id="queryForm">
			 	<div class="row" style="">
			 	<div class="col-xs-1">
			 	</div>
			 	 				<div class="col-xs-1">
			 	 				   <p>
			<!-- 	 				   	<label>查询地市:</label>  -->	 
				 	 				   	<select name="tag1" class="select" style="width: 100%;" id="citySelect">
				 	 				   		       		<shiro:hasPermission name="QS"><option value="">全省</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="GZ"><option value="GZ" selected="selected">广州</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="SZ"><option value="SZ">深圳</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="SG"><option value="SG">韶关</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="ZH"><option value="ZH">珠海</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="ST"><option value="ST">汕头</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="FS"><option value="FS">佛山</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="JM"><option value="JM">江门</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="ZJ"><option value="ZJ">湛江</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="MM"><option value="MM">茂名</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="ZQ"><option value="ZQ">肇庆</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="HZ"><option value="HZ">惠州</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="MZ"><option value="MZ">梅州</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="SW"><option value="SW">汕尾</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="HY"><option value="HY">河源</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="YJ"><option value="YJ">阳江</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="QY"><option value="QY">清远</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="DG"><option value="DG">东莞</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="ZS"><option value="ZS">中山</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="CZ"><option value="CZ">潮州</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="JY"><option value="JY">揭阳</option></shiro:hasPermission>
				 	 				   		       		<shiro:hasPermission name="YF"><option value="YF">云浮</option></shiro:hasPermission>
							       		</select>
						       		</p>
			 	 				</div>
								
								<!-- 品牌-机型 级联 -->
								<div>
									&nbsp;&nbsp;
									<label>当前终端品牌：</label>
									<select class="select" id="cm_brand" style="width: 100px;">
									</select>
									&nbsp;&nbsp;
									<label>当前终端型号：</label>
									<select class="select" id="cm_ter_type" style="width: 100px;">
									</select>
									&nbsp;&nbsp;
									<label>换机前终端品牌：</label>
									<select class="select" id="lm_brand" style="width: 100px;">
									</select>
									&nbsp;&nbsp;
									<label>换机前终端型号：</label>
									<select class="select" id="lm_ter_type" style="width: 100px;">
									</select>
									&nbsp;&nbsp;
									<label>账期：</label>
									<input id="billcyc" class="form-text select startDay" name="datetime" type="text" style="width:120px" onClick="WdatePicker({dateFmt:'yyyyMM'})" readonly="readonly"class="form-text"/>
			 	 					&nbsp;&nbsp;
			 	 					<button type="button" id="searchBtn"  class="btn btn-primary" style="width:100px"> 查询</button>
								</div>
								<br/>
								   	   
		   	  		
			 	</div>
			 	<div class="row"  style="height: 100px;" >
			 			            <div class="latitude">
			                        <div class="indicators-DataAnalysis-list-title ">
			                            <span id="dim-sel" class="latitude-title latitude-title-unhover">筛选条件选择：</span>
			                            <div class="latitude-check-list-c-scroll">
			                                <div class="latitude-check-list-c ">
			                                  
			                                           <div class="latitude-check ">
					                                        <ul class="" id="SelectedLists" style="padding-bottom: 10px;">
					                                        </ul>
					                                    </div>
			                                   	 
					                                    <div class="latitude-nocheck ">
					                                        <ul class="" id="UnselectedLists" style="padding-bottom: 10px;"></ul>
					                                    </div>
					                             
			                                </div>
			                            </div>
			                            <div class="latitude-check-list-c-scroll-p"></div>
			                        </div>
			                    </div>
			 	
			 	</div>
			 	
			 
			 	</form>
 	</div>
 
 
   <div class="row" style="margin-top: 100px;">  
   <hr>
   <h5>展示指标选择</h5>
					      <table class="table table-bordered">
					      	<tr>
					      	  <td><div class="checkbox checkbox-primary">
		                          <input id="basic_feature"  onchange="checBoxkOnChange($(this))" class="styled"  name="basic_feature" type="checkbox" checked>
		                          <label for="basic_feature">消费者基本特征</label>
		               		     </div></td>
					      	  <td><div class="checkbox checkbox-primary">
		                          <input id="portrait_feature" onchange="checBoxkOnChange($(this))" class="styled" name="portrait_feature" type="checkbox" checked>
		                          <label for="portrait_feature">消费者画像特征 </label>
		               		     </div></td>
					      	  <td><div class="checkbox checkbox-primary">
		                          <input id="ability_stratification" onchange="checBoxkOnChange($(this))"class="styled" name="ability_stratification" type="checkbox" checked>
		                          <label for="ability_stratification">消费能力分层</label>
		               		     </div></td>
					      	  <td><div class="checkbox checkbox-primary">
		                          <input id="evaluation_system" onchange="checBoxkOnChange($(this))" class="styled" name="evaluation_system" type="checkbox" checked>
		                          <label for="evaluation_system">消费评价体系</label>
		               		     </div></td>
					      	  <td><div class="checkbox checkbox-primary">
		                          <input id="market_movement" onchange="checBoxkOnChange($(this))" class="styled"  name="market_movement"  type="checkbox" checked>
		                          <label for="market_movement">消费者营销异动</label>
		               		     </div></td>
					      	  <td><div class="checkbox checkbox-primary">
		                          <input id="data_range" onchange="checBoxkOnChange($(this))" class="styled"   name="data_range"  type="checkbox" checked>
		                          <label for="data_range">终端数据范围</label>
		               		     </div></td>
					      	  <td><div class="checkbox checkbox-primary">
		                          <input id="factory_information" onchange="checBoxkOnChange($(this))"class="styled"  name="factory_information"  type="checkbox" checked>
		                          <label for="factory_information">终端厂家信息</label>
		               		     </div></td>
					      	  <td><div class="checkbox checkbox-primary">
		                          <input id="zd_basic_feature" onchange="checBoxkOnChange($(this))" class="styled"  name="zd_basic_feature"  type="checkbox" checked>
		                          <label for="zd_basic_feature">终端基本特征</label>
		               		     </div></td>
					      	  <td><div class="checkbox checkbox-primary">
		                          <input id="machine_type" onchange="checBoxkOnChange($(this))" class="styled"  name="machine_type"  type="checkbox" checked>
		                          <label for="machine_type">终端用机类型</label>
		               		     </div></td>
					      	  <td><div class="checkbox checkbox-primary">
		                          <input id="additional_switch_features" onchange="checBoxkOnChange($(this))" class="styled"  name="additional_switch_features"  type="checkbox" checked>
		                          <label for="additional_switch_features">终端附加功能特征</label>
		               		     </div></td>
					      	  <td><div class="checkbox checkbox-primary">
		                          <input id="switch_features" onchange="checBoxkOnChange($(this))" class="styled"  name="switch_features"  type="checkbox" checked>
		                          <label for="switch_features">终端换机特征</label>
		               		     </div></td>
					      	</tr>
					      	<tr>
					      	  <td>
					      	     <div class="checkbox checkbox-primary">
		                       <!--    <input id="checkbox2" class="styled"  name="basic_feature" type="checkbox" value="brndCd" checked>
		                          <label for="checkbox2">号码品牌</label> -->
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="basic_feature" type="checkbox" value="gdrTypCd"  >
		                          <label for="checkbox2">性别</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="basic_feature" type="checkbox" value="idHomeProv"  >
		                          <label for="checkbox2">籍贯</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="basic_feature" type="checkbox" value="usrTypCd"  >
		                          <label for="checkbox2">职业</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="basic_feature" type="checkbox" value="ageCntRnk"  >
		                          <label for="checkbox2">年龄分层</label>
		               		     </div>
		               		     
		               		   </td>
		               		   <td>
					      	     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="portrait_feature" type="checkbox" value="actvUsrInd" checked>
		                          <label for="checkbox2">活跃用户标志</label>
		               		     </div>
		               		      <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="portrait_feature" type="checkbox"value="threeChgInd" >
		                          <label for="checkbox2">是否三换客户</label>
		               		     </div>
		               		      <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="portrait_feature" type="checkbox" value="lte4gNetInd">
		                          <label for="checkbox2">是否4G客户</label>
		               		     </div>
		               		      <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="portrait_feature" type="checkbox"value="mhUsrInd" >
		                          <label for="checkbox2">是否中高端客户</label>
		               		     </div>
		               		      <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="portrait_feature" type="checkbox" value="vipUsrInd">
		                          <label for="checkbox2">是否VIP客户</label>
		               		     </div>
		               		      <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="portrait_feature"  type="checkbox"value="cmnctUsrInd" >
		                          <label for="checkbox2">是否通信用户</label>
		               		     </div>
		               		      <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="portrait_feature"  type="checkbox" value="actvCmnctInd">
		                          <label for="checkbox2">是否主动通信用户</label>
		               		     </div>
		               		      <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="portrait_feature"  type="checkbox" value="highSchInd">
		                          <label for="checkbox2">是否高校</label>
		               		     </div>
		               		   </td>
		               		   <td>
					      	     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="ability_stratification"  type="checkbox" value="arpuRnkCd" checked>
		                          <label for="checkbox2">ARPU分层</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="ability_stratification"  type="checkbox"value="debetDurRnk" >
		                          <label for="checkbox2">MOU分层</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="ability_stratification"  type="checkbox"value="gprsFluxRnk" >
		                          <label for="checkbox2">DOU分层</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="ability_stratification"  type="checkbox" value="tdlteGprsFluxRnk">
		                          <label for="checkbox2">DOU_4G分层</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="ability_stratification"  type="checkbox" value="p2psmsUpRnk">
		                          <label for="checkbox2">SOU分层</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="ability_stratification"  type="checkbox" value="aouRnk">
		                          <label for="checkbox2">AOU分层</label>
		               		     </div>
		               		     
		               		   </td>
		               		   <td>
					      	     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="evaluation_system"  type="checkbox" value="bothDownInd" checked>
		                          <label for="checkbox2">是否双降</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="evaluation_system"  type="checkbox" value="bothLowInd">
		                          <label for="checkbox2">低龄、低流量客户群</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="evaluation_system"  type="checkbox"value="bothLowInd" >
		                          <label for="checkbox2">视频偏好客户群</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="evaluation_system"  type="checkbox" value="bothHighInd">
		                          <label for="checkbox2">双高客户群</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="evaluation_system"  type="checkbox" value="exceedPkgInd">
		                          <label for="checkbox2">高饱和度客户群</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="evaluation_system"  type="checkbox" value="keyPersonInd">
		                          <label for="checkbox2">重点价值客户群</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="evaluation_system"  type="checkbox" value="ywstUsrCount">
		                          <label for="checkbox2">DM异网渗透客户群</label>
		               		     </div>
		               		   </td>
		               		   <td>
					      	     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="market_movement"  type="checkbox" value="pkgUpInd"checked>
		                          <label for="checkbox2">是否套餐升档</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="market_movement"  type="checkbox" value="pkgDownInd">
		                          <label for="checkbox2">是否流量套餐降档</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="market_movement"  type="checkbox" value="contractBindInd">
		                          <label for="checkbox2">是否合约捆绑</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="market_movement"  type="checkbox"value="stpkpNbrInd" >
		                          <label for="checkbox2">是否停机保号</label>
		               		     </div>
		               		   </td>
		               		   <td>
					      	     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="data_range"  type="checkbox" value="cmccCtyNam" checked>
		                          <label for="checkbox2">区域_市</label>
		               		     </div>
		               		      <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="data_range"  type="checkbox"value="cmccCntyNam" >
		                          <label for="checkbox2">区域_县</label>
		               		     </div>
		               		   </td>
		               		   <td>
					      	     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="factory_information"   type="checkbox" value="cmBrand" checked>
		                          <label for="checkbox2">当前终端品牌</label>
		               		     </div>
		               		      <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="factory_information"   type="checkbox" value="cmTerType" >
		                          <label for="checkbox2">当前终端型号</label>
		               		     </div>
		               		      <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="factory_information"   type="checkbox" value="cmProductModel" >
		                          <label for="checkbox2">当前终端产品型号</label>
		               		     </div>
		               		   </td>
					      	  <td>  
					      	    <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="zd_basic_feature"  type="checkbox" value="cmPriceRnk" checked>
		                          <label for="checkbox2">终端价格</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="zd_basic_feature"  type="checkbox" value="cmScreenPixelRnk" >
		                          <label for="checkbox2">手机分辨率</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="zd_basic_feature"  type="checkbox" value="cmRamRnk" >
		                          <label for="checkbox2">内存大小</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="zd_basic_feature"  type="checkbox" value="cmWeightRnk" >
		                          <label for="checkbox2">终端重量</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="zd_basic_feature"  type="checkbox" value="cmScreenSizeRnk" >
		                          <label for="checkbox2">屏幕大小</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="zd_basic_feature"  type="checkbox" value="cmBatteryRnk" >
		                          <label for="checkbox2">电池容量</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="zd_basic_feature"  type="checkbox" value="cmCameraPixelRnk" >
		                          <label for="checkbox2">摄像头像素</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="zd_basic_feature"  type="checkbox" value="cmIfDualCard" >
		                          <label for="checkbox2">是否双卡双待</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="zd_basic_feature"  type="checkbox" value="cmNetwork" >
		                          <label for="checkbox2">网络制式</label>
		               		     </div>
					      	     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="zd_basic_feature"  type="checkbox" value="cmTermNetType" >
		                          <label for="checkbox2">网络类型</label>
		               		     </div>
					      	  </td>
					      	  <td>
					      	  <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="machine_type" type="checkbox" value="emuTermInd" checked>
		                          <label for="checkbox2">是否山寨机</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="machine_type" type="checkbox" value="cmIfIntell">
		                          <label for="checkbox2">是否智能机</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="machine_type" type="checkbox" value="ydSellInd">
		                          <label for="checkbox2">是否移动购机</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="machine_type" type="checkbox" value="sellTypCd" >
		                          <label for="checkbox2">购机类型</label>
		               		     </div>
					      	  
					      	  </td>
					      	  <td>
					      	  	 <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="additional_switch_features" type="checkbox"value="cmIfNfc"  checked>
		                          <label for="checkbox2">是否支持NFC功能</label>
		               		     </div>
		               		      <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="additional_switch_features" type="checkbox" value="cmIfWifi" >
		                          <label for="checkbox2">是否支持WIFI</label>
		               		     </div>
		               		      <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="additional_switch_features" type="checkbox"value="cmIfFingerprint"  >
		                          <label for="checkbox2">是否支持指纹解锁</label>
		               		     </div>
		               		       <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="additional_switch_features" type="checkbox" value="cmIfFrontCamera">
		                          <label for="checkbox2">是否双摄像头</label>
		               		     </div>
		               		       <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="additional_switch_features" type="checkbox"value="qiqjInd" >
		                          <label for="checkbox2">是否旗舰机</label>
		               		     </div>
		               		       <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="additional_switch_features" type="checkbox"value="cmIfTd" >
		                          <label for="checkbox2">是否IF_TD</label>
		               		     </div>
		               		     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled"  name="additional_switch_features" type="checkbox"value="cmIfFddLte"  >
		                          <label for="checkbox2">是否IF_TDD</label>
		               		     </div>
					      	  
					      	  </td>
					      	  <td>
					      	     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="switch_features" type="checkbox" value="jiAgeRak" checked >
		                          <label for="checkbox2">终端机龄</label>
		               		     </div>
					      	     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="switch_features" type="checkbox" value="fstEffMo">
		                          <label for="checkbox2">换机月份</label>
		               		     </div>
					      	     <div class="checkbox checkbox-primary">
		                          <input id="checkbox2" class="styled" name="switch_features" type="checkbox" value="huanjiZqRnk" >
		                          <label for="checkbox2">换机周期</label>
		               		     </div>
					      	  </td>
					      	</tr>
					      </table>
		                </div>
					   
		                
		         
					   	 
					   	
			 
 



    <div  class="row"  style="margin-top: 10px;">	
        <p ><span class="title-no-border"><span style="background-color: #5bfdff;">|</span><span>&nbsp;查询结果-</span><label id="total_user"></label></p>
    	<class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" type="button" >
 
    	<div class="col-xs-12" style="padding-left:8px;">
    	   <table id="list"></table> 
			   <div id="pager"></div>
		  </div> 	
 	</div>	
 	
 	<div  class="row" >		
		<div  class="col-xs-12" style="margin-left:16px;padding-left:16px;">
			 
			     <table id="list" style="padding-left:16px;"></table> &nbsp;
			     <div id="pager"></div> 
		</div>
	</div> 




<script type="text/javascript">
$(document).ready(function() {

	//jqgridInit();
 
});




 
</script>



	
</body>
</html>