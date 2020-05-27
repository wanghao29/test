<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/jquery-3.3.1.min.js"></script>
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
    <script type="text/javascript" src="<%=basePath%>resources/js/entry/entry.js"></script>

    <sitemesh:head/>

</head>
<style>

  .a{
    color:#FFFFFF;
} 
 	td{
 	 font-size: 12px;
 	}
</style>
<body style="overflow-x:hidden;min-width: 1357px;">
 <c:set var="special" scope="session" value="${special}"/> 
<div class="header" >
    <div class="row ">
        <div class="col-xs-5" style="border-color: green;float: left;min-width: 550px;">
             <shiro:hasPermission name="entry:list">
             	<a class="a" href="#" style="font-size:24px;">重点KPI全景</a>&nbsp;&nbsp;&nbsp;&nbsp;
             </shiro:hasPermission>
             <shiro:hasPermission name="zdResultCitykpiQ:list">
             	<a class="a" href="<%=basePath%>zdResultCitykpiQ/calcResultIndex.do" style="font-size:24px;">地市KPI全景</a>
             </shiro:hasPermission>
            <%--<ul class=" " style="width: 100%; ">--%>
            <%--<li class="active" ms-click="activeClass(this)"  ms-click-1="skip('flowMonitor.html')">--%>

            <%--<a href="#">运营收入</a>--%>
            <%--</li>--%>
            <%--<li class="drop" ><a href="#">终端销量</a>--%>

            <%--</li>--%>
            <%--<li class="drop"><a href="#">社会渠道拓展</a>--%>

            <%--</li>--%>
            <%--<li ><a href="#" >省移动公司协同</a>--%>
            <%--</li>--%>
            <%--</ul>--%>
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
            <%-- <a href="<%=basePath%>" style="font-size:24px;">   返回</a> --%>
            <%--<ul class=" ">--%>
            <%--<li ><a href="#">流动资产周转率</a>--%>

            <%--</li>--%>
            <%--<li ><a href="#">利润总额</a>--%>
            <%--</li>--%>
            <%--<li ><a href="#">分项</a>--%>

            <%--</li>--%>

            <%--<li  ><a href="#">返回上一级</a></li>--%>
            <%--</ul>--%>
        </div>
    </div>
</div>
<div class="content2" style="width: 100%">
    <div style="width: 100%;height: 50px;">
        <div class="kpiTitle t1" style="margin-top: 0px">
            <h3 style="color: #1addfa">重点KPI全景</h3>
        </div>
        <div class="cMonth t1" style="color: #fff;font-size: 18px">
       	      查询月份： <!-- <input id="month" name="month" type="text" style="height: 30px;width:130px" readonly="readonly"class="form-text select"/> -->
       	       <input name="month"   id="month" type="text" style="width: 55%;" readonly="readonly"class="form-text select prevMonth"
			   	  		onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M-1}',onpicked:getVal})" />
        </div>
        <div class="t1" style="height: 45px;width: 200px;text-align: center;line-height: 35px;margin-left: 80px">
        	<span  style="font-size: 40px;font-weight: bold;">预得分：</span>
        </div>
        <div class="cDfCompare t1">
            <div style="color: #fb0200;height: 45px;width: 200px;text-align: center;line-height: 35px;">
                <span id="zdf" name="score" style="font-size: 55px;font-weight: bold;">0</span>
                <span class="up" style="font-size: 60px; font-weight: bold">↑</span>
                <span class="down" style="font-size: 60px;font-weight: bold; display: none ">↓</span>
            </div>
        </div>
		 <div class="kpiTitle t1" style="margin-top: 0px">
            <!-- <h3 style="color: #1addfa">年度得分</h3> -->
            <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#nddfModal">年度得分</button>
        </div>
 <!--       <div class="t1" style="color: #fff;margin-left: 10px;margin-top: 25px">
        <span  style="font-size: 40px;font-weight: bold;">预得分：</span>
             <span style="font-size: 20px">（同比上月<span class="up">提高</span><span class="down" style="display: none">下降</span><span id="increaseScore" name="increaseScore" style="color: #fbff2c">10</span>分）</span>    
        </div>
-->        
    </div>

    <div style="width: 100%; margin: 20px 50px; float: left; padding-right: 70px">
        <span class="t2" style="width: 35%;height: 100%;">
            <div id="chart" style=" width: 100%;height: 100%;"></div>
        </span>
    <span class="t2" style="width: 63%;height: 100%;margin-left: 2px;">
<table id = "gf_kpi" width="100%" border="1" align="center" cellspacing="0" height="100%">
  <tr align="center" id="menu">
    <td width="10%">主指标</td>
    <td width="20%"><span id="menu_year">2018</span>年考核项目</td>
    <td width="10%">分值 </td>
    <td width="25%">目标值</td>
    <td width="5%">单位</td>
    <td width="10%">本月完成情况</td>
    <td width="10%">全年完成情况</td>
    <td width="10%">与时间进度比</td>
  </tr>
  <tr align="center" id="businessIncome">
    <td rowspan="3">运营收入<br/>（35分）</td>
    <td><a  url="<%=basePath%>businessIncome/businessIncome/index.do?special=MONITOR">运营收入</a></td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
  </tr>
  <tr align="center" id="incomePhoneBrand">
    <td><a url="<%=basePath%>businessIncome/privateBrandIncome/index.do?special=MONITOR">自有品牌手机收入</a></td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
  </tr>
  <tr align="center" id="incomeMultiForm">
    <td><a url="<%=basePath%>businessIncome/incomeMultiForm/index.do?special=MONITOR">自有品牌多形态终端收入</a></td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
  </tr>
  <tr align="center" id="terminalSales">
    <td rowspan="2">终端销量<br/>（10分）</td>
    <td><a url="<%=basePath%>terminalSales/terminalSales/index.do?special=MONITOR">终端销量</a></td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
  </tr>
  <tr align="center" id="productSalesRate">
    <td><a url="<%=basePath%>terminalSales/productSalesRate/index.do?special=MONITOR">重点产品销售达成率</a></td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
  </tr>
  <tr align="center" id="customerTargetValue">
    <td rowspan="2">社会渠道拓展<br/>（8分）</td>
    <td><a url="<%=basePath%>socialChannelExpand/customerTargetValue/index.do?special=MONITOR">活跃客户目标值</a></td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
  </tr>
  <tr align="center" id="customerSaleTargetVal">
    <td><a url="<%=basePath%>socialChannelExpand/customerSalesTargetValue/index.do?special=MONITOR"> KA客户销量目标值</a></td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
  </tr>
  <tr align="center" id="salesShare4G">
    <td rowspan="3"> 省移动公司协同<br/>（15分）</td>
    <td><a url="<%=basePath%>corporationCollaboration/salesShare4G/index.do?special=MONITOR">4G+销量份额</a></td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
  </tr>
  <tr align="center" id="terminalSaleShare">
    <td><a href="<%=basePath%>corporationCollaboration/terminalSaleShare/index.do?special=MONITOR">省移动终端销量份额</a></td>
    <td>&nbsp;-</td>
    <td>&nbsp;前五名满分</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
  </tr>
  <tr align="center" id="satisfaction">
    <td><a href="#">省公司协同满意度</a></td>
    <td>&nbsp;-</td>
    <td>&nbsp;与本省各平台对比，第一名满分。</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
  </tr>
  <tr align="center" id="stockTurnoverRatio">
    <td rowspan="5">流动资产周转率<br/>（15分）</td>
    <td><a url="<%=basePath%>assetsTurnoverRate/stockTurnoverRatio/index.do?special=MONITOR">存货周转率 </a></td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
  </tr>
  <tr align="center" id="threeMonthStockRatio">
    <td><a url="<%=basePath%>assetsTurnoverRate/threeMonthStockRatio/index.do?special=MONITOR">三个月以上存货原值占比 </a></td>
    <td>&nbsp;-</td>
    <td>&nbsp;90-180天小于2%&nbsp;180-360天小于0.5%&nbsp;360天以上小于0.</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
  </tr>
  <tr align="center" id="repaymentAccuracyForecast">
    <td><a url="<%=basePath%>assetsTurnoverRate/repaymentAccuracyForecast/index.do?special=MONITOR">回款预测准确度</a></td>
    <td>&nbsp;-</td>
    <td>&nbsp;70%-130%</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
  </tr>
  <tr align="center" id="accountReceivableTurnoverRatio">
    <td><a url="<%=basePath%>assetsTurnoverRate/accountReceivableTurnoverRatio/index.do?special=MONITOR">应收周转率</a></td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
    <td>&nbsp;-</td>
  </tr>
  <tr align="center" id="accountsReceivableRatio">
    <td><a url="<%=basePath%>assetsTurnoverRate/accountReceivableRatio/index.do?special=MONITOR">三个月以上应收账款占比</a></td>
    <td>&nbsp;</td>
    <td>&nbsp;90-180天=小于5%；180天以上=小于2%；</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr align="center" id="grossProfitRatio">
    <td rowspan="2">利润总额<br/>（17分）</td>
    <td><a url="<%=basePath%>totalProfit/grossProfitRatio/index.do?special=MONITOR">总支出占综合毛利比</a></td>
    <td>&nbsp;</td>
    <td>&nbsp;90%</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr align="center" id="equilibrium">
    <td><a href="#" url="<%=basePath%>totalProfit/feeProgressBalance/index.do?special=MONITOR" >费用进度均衡性</a></td>
    <td>&nbsp;</td>
    <td>&nbsp;一季度累计 22.3% 0.25 一到二季度累计 46.0% 0.25 一到三季度累计 68.7% 0.5 1-10月累计 76.3% 0.5 1-11月累计 86.7% 0.5</td>
    <td>&nbsp;比值</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
        </span>
</div>
<!-- ========================================================================== -->
    <div style="width: 100%;height: 50px;">
        <div class="kpiTitle t1" style="margin-top: 0px">
            <h3 style="color: #1addfa">八字维度</h3>
        </div>
    </div>

    <div style="width: 97%;height: 750px; margin: 20px 50px; float: left; padding-right: 50px">

        <div class="col-xs-3">
            <div class="panel panel-default" style=" width: 100%;height: 48%">
                <div style="width: 100%; height: 30px;">
                      <a href="<%=basePath%>amount/index.do?type_8=量&special=type_8"><span style="width:150px;color: #1addfa;font-size: 20px" class="my_title">量-<span style="color: #fff;font-size: 15px;font-weight: bold">我司销量</span></span></a>
                </div>
                <div id="chart1" class="panel-body" style="width: 100%; height: 100%">
                </div>
            </div>
        </div>

        <div class="col-xs-3">
            <div class="panel panel-default" style=" width: 100%;height: 48%">
                    <div style="width: 100%; height: 30px;">
                          <a href="<%=basePath%>amount/index.do?type_8=收&special=type_8"><span style="width:150px;color: #1addfa;font-size: 20px" class="my_title">收-<span style="color: #fff;font-size: 15px;font-weight: bold">终端销售收入</span></span>
                    </div>
                    <div id="chart2" class="panel-body" style="width: 100%; height: 100%">
                    </div>
            </div>
        </div>

        <div class="col-xs-3">
            <div class="panel panel-default" style=" width: 100%;height: 48%">
                    <div style="width: 100%; height: 30px;">
                         <a href="<%=basePath%>amount/index.do?type_8=利&special=type_8"> <span style="width:150px;color: #1addfa;font-size: 20px" class="my_title">利-<span style="color: #fff;font-size: 15px;font-weight: bold">毛利额</span></span></a>
                    </div>
                    <div id="chart3" class="panel-body" style="width: 100%; height: 100%">
                    </div>
            </div>
        </div>

        <div class="col-xs-3">
            <div class="panel panel-default" style=" width: 100%;height: 48%;">
                    <div style="width: 100%; height: 30px;">
                        <a href="<%=basePath%>amount/index.do?type_8=份&special=type_8">  <span style="width:150px;color: #1addfa;font-size: 20px" class="my_title">份-<span style="color: #fff;font-size: 15px;font-weight: bold">平台份额</span></span></a>
                    </div>
                    <div id="chart4" class="" style="width: 90%; height: 90%; margin:10px auto">
                    </div>
            </div>
        </div>

        <div class="col-xs-3">
            <div class="panel panel-default" style=" width: 100%;height: 48%">
                    <div style="width: 100%; height: 30px;">
                         <a href="<%=basePath%>amount/index.do?type_8=进&special=type_8"> <span style="width:150px;color: #1addfa;font-size: 20px" class="my_title">进-<span style="color: #fff;font-size: 15px;font-weight: bold">市仓进货量</span></span></a>
                    </div>
                    <div id="chart5" class="panel-body" style="width: 100%; height: 100%">
                    </div>
            </div>
        </div>

        <div class="col-xs-3">
            <div class="panel panel-default" style=" width: 100%;height: 48%">
                    <div style="width: 100%; height: 30px;">
                         <a href="<%=basePath%>amount/index.do?type_8=销&special=type_8"> <span style="width:150px;color: #1addfa;font-size: 20px" class="my_title">销-<span style="color: #fff;font-size: 15px;font-weight: bold">我司激活量</span></span></a>
                    </div>
                    <div id="chart6" class="panel-body" style="width: 100%; height: 100%">
                    </div>
            </div>
        </div>

        <div class="col-xs-3">
            <div class="panel panel-default" style=" width: 100%;height: 48%">
                    <div style="width: 100%; height: 30px;">
                         <a href="<%=basePath%>amount/index.do?type_8=存&special=type_8"> <span style="width:150px;color: #1addfa;font-size: 20px" class="my_title">存-<span style="color: #fff;font-size: 15px;font-weight: bold">库龄库存量</span></span></a>
                    </div>
                    <div id="chart7" class="panel-body" style="width: 100%; height: 100%">
                    </div>
            </div>
        </div>

        <div class="col-xs-3">
            <div class="panel panel-default" style=" width: 100%;height: 48%">
                    <div style="width: 100%; height: 30px;">
                        <a href="<%=basePath%>amount/index.do?type_8=回&special=type_8">  <span style="width:150px;color: #1addfa;font-size: 20px" class="my_title">回-<span style="color: #fff;font-size: 15px;font-weight: bold"></span></span></a>
                    </div>
                    <div style="padding: 20px 30px; width: 100%; height: 100%">
                        <div class="td81">
                            <div>
                                <p style="font-size:35px;"><span id="aRTRatio">41.9</span>%</p>
                            </div>
                            <div>
                                <p style="font-size:20px;margin-top: -10px;">应收周转率</p>
                            </div>
                        </div>
                        <div class="td82">
                            <div>
                                <p style="font-size:35px;" ><span id="aRRatio">62.4</span>%</p>
                            </div>
                            <div>
                                <p style="font-size:20px;margin-top: -10px;">三个月以上应收款占比</p>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>

</div>


<div class="modal fade bs-example-modal-lg" id="nddfModal" tabindex="-1" role="dialog" aria-labelledby="nddfModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">广东分公司2018年度经营业绩考核得分表</h4>
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
									<tr>
										<td>分公司业绩考核得分</td>
										<td> </td>
										<td> </td>
										<td>87.78</td>
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




</body>
</html>
