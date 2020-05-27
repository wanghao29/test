<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
%>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>目标值模板</title>


<style type="text/css">
.btn-group-lg > .btn {
  padding: 5px 10px;
  font-size: 10px;
  line-height: 1.3333333;
  border-radius: 6px;
}
.table > tbody > tr > td{
 	 font-size: 18px;
 	 border-top: 1px solid #037abd;
 	 border-left: 1px solid #037abd;
 	 vertical-align: middle;
 	}
</style>

</head>







<body style="overflow-x:hidden;min-width: 1508px;">

    <script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/multiple-select/1.2.0/multiple-select.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/multiple-select/1.2.0/multiple-select.min.js"></script>
	<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
	<script	src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/cityKpi/zdKpi2019.js?"></script>
	<script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>
	<script src="<%=basePath%>resources/js/plugin/table2excel.js"></script>
	<div class="row">
	<div class="col-xs-12" style="margin-left: 10px;background-color:#36648B" align="left">
	<span style="color: #33ffff;font-size: 20px;">地市KPI全景   / 2019地市KPI第二季度</span>
	</div>
	</div>
	<div class="row" style="padding-top: 30px;">
    	<div class="col-xs-2" style="margin-left: 10px;" align="left">
			<span>季度：</span>
			<select onchange="selectTwo()" name="quarter" id="quarter" class="select">
			 
				<option value="1">第一季度</option>
				<option value="2">第二季度</option>
				<option value="3" selected="selected">第三季度</option>
				<option value="4">第四季度</option>
			</select>
		</div>
		<div class="col-xs-2" align="left">
			<span>运营中心：</span>
			<select  style="width: 150px;height:100px; background-color: #337ab7" name="quarter" id="cityArea" multiple="true">
				<!-- <option value="1">全省</option> -->
				<option value="2">广州运营中心</option>
				<option value="3">深圳运营中心</option>
				<option value="4">佛山运营中心</option>
				<option value="5">东莞运营中心</option>
			</select>
		</div>
		<div class="col-xs-2" align="left">
			<span>展示维度：</span>
               <select id="showDu" name="showDu" multiple="true" style="width:130px;">
                <option value="1">指标值</option>
				<option value="2">结果值</option>
				<option value="3">得分</option> 
				</select>


			
			 <!-- <select name="quarter" id="showDu"  multiple="multiple">				
				<option value="1">指标值</option>
				<option value="2">结果值</option>
				<option value="3">得分</option>
				
			</select>  -->
		</div>
		
		<div class="col-xs-3">
<button class="btn btn-primary btn-lg" 
style=" padding: 1px 16px;font-size: 18px;line-height: 1.3333333;
border-radius: 6px;float:left;margin:0px 10px;" 
id="query" onclick="selelctAll()">查询
</button>

<button class="btn btn-primary btn-lg" 
data-toggle="modal" style="padding: 1px 16px;
font-size: 18px;line-height: 1.3333333;border-radius: 6px;
float:left;margin:0px 10px;" 
data-target="#myModal">数据导入
</button>

 <button id="btn" class="btn btn-primary btn-lg" 
 style="padding: 1px 16px;
font-size: 18px;line-height: 1.3333333;border-radius: 6px;
float:left;margin:0px 10px;" 
>数据导出
</button> 
<!-- <input style="padding: 1px 16px;
font-size: 18px;line-height: 1.3333333;border-radius: 6px;
float:left;margin:0px 10px;" type="button" id="btn" value="数据导出" /> -->

<!-- <input type="button" onclick="ExportExcel('tptable')" value="导出excel"/>  -->


			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel"></h4>
						</div>
					</div>
					
					<form id="uploadForm" enctype="multipart/form-data">
						<div class="modal-body">
							<input type="file" id="file" name="file" onchange="loadFile(this.files[0])" />
							<br/>
							<span> 选择季度：</span>
		   <select name="tName" class="select">			
				<option value="1">第一季度</option>
				<option value="2">第二季度</option>
				<option value="3">第三季度</option>
				<option value="4">第四季度</option>
			</select>
							<a style="color:white;" href="<%=basePath%>resources/tmpl/kpiCity-2.xlsx">模板下载</a>
						</div>
					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
							data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</div>
		<!-- style="overflow-x:scroll;width:1500px;white-space:normal;border: 1px solid;height: 600px" -->
 	 <div style="margin-top: 10px;overflow-x:scroll;width:98%;white-space:nowrap;" >
<div  style="width: 100%; margin: 20px 0px; float: left; padding-right: 70px" > 
					
<table id="tptable"  border="1px red" align="center" style="word-break:break-all; word-wrap:break-word;height: 600px;width: 1000px;border: 1px solid #037abd; font-size: 18px;text-align: center;">
			
		
   <tr style="background-color: #037abd;border: #8B7D6B;">  
    <td rowspan="4" style="text-align: center;color:#5bfdff;">类别</td>
    <td rowspan="4" style="text-align: center;color:#5bfdff;width: 20px;">2019年考核项目</td> 
    <td rowspan="4" style="color:#5bfdff;">满分值</td>   
    <td id="guang1" class="guangzhou" colspan="18" style='text-align: center;border: white;color: #5bfdff';>2季度</td> 
    <td class="shenzhen" colspan="21" style='text-align: center;border: white;color: #5bfdff'>2季度</td> 
    <td class="foshan" colspan="18" style='text-align: center;border: white;color: #5bfdff'>2季度</td>
    <td class="dongguan" colspan="18" style='text-align: center;border: white;color: #5bfdff'>2季度</td> 
   </tr>
   
   <tr style="background-color: #037abd;border: #8B7D6B">  
    <td class="guangzhou"  colspan="18" style='color:#5bfdff;text-align: center;'>广州运营中心</td>
    <td class="shenzhen" colspan="21" style='color:#5bfdff;text-align: center;'>深圳运营中心</td>
    <td class="foshan" colspan="18" style='color:#5bfdff;text-align: center;'>佛山运营中心</td> 
    <td class="dongguan" colspan="18" style='color:#5bfdff;text-align: center;'>东莞运营中心</td> 
   </tr>	 
        	<tr style="background-color: #037abd;border: #8B7D6B">  
    <td id="guang1"  class="guangzhou" colspan="3" style='color:#5bfdff;text-align:center;'>广州</td>
    <td id="guang2"  class="guangzhou" colspan="3" style='color:#5bfdff;text-align: center;'>肇庆</td>
    <td id="guang3"  class="guangzhou" colspan="3" style='color:#5bfdff;text-align: center;'>清远</td>
    <td id="guang4"  class="guangzhou" colspan="3" style='color:#5bfdff;text-align: center;'>韶关</td>
    <td id="guang5"  class="guangzhou" colspan="3" style='color:#5bfdff;text-align: center;'>云浮</td>
    <td id="guang6"  class="guangzhou" colspan="3" style='color:#5bfdff;text-align: center;'>合计</td>
    <td id="shen1" class="shenzhen" colspan="3" style='color:#5bfdff;text-align: center;'>深圳</td>
    <td id="shen2" class="shenzhen" colspan="3" style='color:#5bfdff;text-align: center;'>汕头</td>
    <td id="shen3" class="shenzhen" colspan="3" style='color:#5bfdff;text-align: center;'>揭阳</td>
    <td id="shen4" class="shenzhen" colspan="3" style='color:#5bfdff;text-align: center;'>梅州</td>
    <td id="shen5" class="shenzhen" colspan="3" style='color:#5bfdff;text-align: center;'>潮州</td>
    <td id="shen6" class="shenzhen" colspan="3" style='text-align: center;color: #5bfdff'>汕尾</td>
    <td id="shen7" class="shenzhen" colspan="3" style='color:#5bfdff;text-align: center;'>合计</td>
    <td id="fo1" class="foshan" colspan="3" style='color:#5bfdff;text-align: center;'>佛山</td>
    <td id="fo2" class="foshan" colspan="3" style='color:#5bfdff;text-align: center;'>江门</td>
    <td id="fo3" class="foshan" colspan="3" style='color:#5bfdff;text-align: center;'>湛江</td>
    <td id="fo4" class="foshan" colspan="3" style='color:#5bfdff;text-align: center;'>茂名</td>
    <td id="fo5" class="foshan" colspan="3" style='color:#5bfdff;text-align: center;'>阳江</td>
    <td id="fo6" class="foshan" colspan="3" style='color:#5bfdff;text-align: center;'>合计</td>
    <td id="dong1" class="dongguan" colspan="3" style='color:#5bfdff;text-align: center;'>东莞</td>
    <td id="dong2" class="dongguan" colspan="3" style='color:#5bfdff;text-align: center;'>中山</td>
    <td id="dong3" class="dongguan" colspan="3" style='color:#5bfdff;text-align: center;'>惠州</td>
    <td id="dong4" class="dongguan" colspan="3" style='color:#5bfdff;text-align: center;'>珠海</td>
    <td id="dong5" class="dongguan" colspan="3" style='color:#5bfdff;text-align: center;'>河源</td>
    <td id="dong6" class="dongguan" colspan="3" style='color:#5bfdff;text-align: center;'>合计</td>
   </tr>
    	  	<tr style="background-color: #037abd;border: #8B7D6B">  
   <td class="guangzhou1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="guangzhou2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="guangzhou3" style='text-align: center;color: #5bfdff'>得分</td>   
   
   <td class="guangzhou1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="guangzhou2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="guangzhou3" style='text-align: center;color: #5bfdff'>得分</td>  
  
   <td class="guangzhou1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="guangzhou2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="guangzhou3" style='text-align: center;color: #5bfdff'>得分</td>  
   
   <td class="guangzhou1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="guangzhou2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="guangzhou3" style='text-align: center;color: #5bfdff'>得分</td>  
   
   <td class="guangzhou1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="guangzhou2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="guangzhou3" style='text-align: center;color: #5bfdff'>得分</td>  
   
   <td class="guangzhou1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="guangzhou2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="guangzhou3" style='text-align: center;color: #5bfdff'>得分</td>  
   
   <!--深圳  -->

   <td class="shenzhen1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="shenzhen2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="shenzhen3" style='text-align: center;color: #5bfdff'>得分</td>   
   
   <td class="shenzhen1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="shenzhen2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="shenzhen3" style='text-align: center;color: #5bfdff'>得分</td>   
  
   <td class="shenzhen1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="shenzhen2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="shenzhen3" style='text-align: center;color: #5bfdff'>得分</td>   
   
   <td class="shenzhen1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="shenzhen2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="shenzhen3" style='text-align: center;color: #5bfdff'>得分</td>   
   
   <td class="shenzhen1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="shenzhen2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="shenzhen3" style='text-align: center;color: #5bfdff'>得分</td>   
   
   <td class="shenzhen1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="shenzhen2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="shenzhen3" style='text-align: center;color: #5bfdff'>得分</td> 
   
   <td class="shenzhen1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="shenzhen2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="shenzhen3" style='text-align: center;color: #5bfdff'>得分</td>   
  
   <!--佛山  -->
   <td class="foshan1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="foshan2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="foshan3" style='text-align: center;color: #5bfdff'>得分</td>  
   <td class="foshan1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="foshan2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="foshan3" style='text-align: center;color: #5bfdff'>得分</td>  
   <td class="foshan1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="foshan2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="foshan3" style='text-align: center;color: #5bfdff'>得分</td>  
   <td class="foshan1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="foshan2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="foshan3" style='text-align: center;color: #5bfdff'>得分</td>  
   <td class="foshan1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="foshan2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="foshan3" style='text-align: center;color: #5bfdff'>得分</td>  
   <td class="foshan1" style='text-align: center;color: #5bfdff'>指标值</td>
   <td class="foshan2" style='text-align: center;color: #5bfdff'>结果值</td> 
   <td class="foshan3" style='text-align: center;color: #5bfdff'>得分</td>  
   
   <!--东莞  -->
    <td class="dongguan1" style='text-align: center;color: #5bfdff'>指标值</td>
    <td class="dongguan2" style='text-align: center;color: #5bfdff'>结果值</td> 
    <td class="dongguan3" style='text-align: center;color: #5bfdff'>得分</th>  
    <td class="dongguan1" style='text-align: center;color: #5bfdff'>指标值</td>
    <td class="dongguan2" style='text-align: center;color: #5bfdff'>结果值</td> 
    <td class="dongguan3" style='text-align: center;color: #5bfdff'>得分</td>  
    <td class="dongguan1" style='text-align: center;color: #5bfdff'>指标值</td>
    <td class="dongguan2" style='text-align: center;color: #5bfdff'>结果值</td> 
    <td class="dongguan3" style='text-align: center;color: #5bfdff'>得分</td>  
    <td class="dongguan1" style='text-align: center;color: #5bfdff'>指标值</td>
    <td class="dongguan2" style='text-align: center;color: #5bfdff'>结果值</td> 
    <td class="dongguan3" style='text-align: center;color: #5bfdff'>得分</td>   
    <td class="dongguan1" style='text-align: center;color: #5bfdff'>指标值</td>
    <td class="dongguan2" style='text-align: center;color: #5bfdff'>结果值</td> 
    <td class="dongguan3" style='text-align: center;color: #5bfdff'>得分</td>  
    <td class="dongguan1" style='text-align: center;color: #5bfdff'>指标值</td>
    <td class="dongguan2" style='text-align: center;color: #5bfdff'>结果值</td> 
    <td class="dongguan3" style='text-align: center;color: #5bfdff'>得分</td>    	  	  	  	  	  	  	  	  
   </tr> 
 <!--第一行-->  
 

   <tr>
   <td rowspan="2" style="color: #00EEEE;">利润类（20分）</td>	
   <td style="width: 20px;color: #00EEEE;" title="取清算表的考核细则">直接毛利率比（%）</td>
   <td >${score.rateScore}</td>
  <!-- 广州 -->
   <td class="guangzhou1">${GZgzDte.rate1}</td>
   <td class="guangzhou2">${GZgzDte.rateDown}</td>
   <c:if test="${GZgzDte.rateScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.rateScore}</td>
   </c:if>
   <c:if test="${GZgzDte.rateScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.rateScore}</td>
   </c:if>
   <!-- 肇庆 -->
   <td class="guangzhou1">${GZzqDte.rate1}</td>
   <td class="guangzhou2">${GZzqDte.rateDown}</td>
   <c:if test="${GZzqDte.rateScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.rateScore}</td>
   </c:if>
    <c:if test="${GZzqDte.rateScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.rateScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZqyDte.rate1}</td>
   <td class="guangzhou2">${GZqyDte.rateDown}</td>
  <%--  <td class="guangzhou3">${GZqyDte.rateScore}</td> --%>
   <c:if test="${GZqyDte.rateScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.rateScore}</td>
   </c:if>
    <c:if test="${GZqyDte.rateScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.rateScore}</td>
   </c:if>
   
   
   
   
   <td class="guangzhou1">${GZsgDte.rate1}</td>
   <td class="guangzhou2">${GZsgDte.rateDown}</td>
  <%--  <td class="guangzhou3">${GZsgDte.rateScore}</td> --%>
    <c:if test="${GZsgDte.rateScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.rateScore}</td>
   </c:if>
    <c:if test="${GZsgDte.rateScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.rateScore}</td>
   </c:if>

   <td class="guangzhou1">${GZyfDte.rate1}</td>
   <td class="guangzhou2">${GZyfDte.rateDown}</td>
   <%-- <td class="guangzhou3">${GZyfDte.rateScore}</td> --%>
    <c:if test="${GZyfDte.rateScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZyfDte.rateScore}</td>
   </c:if>
    <c:if test="${GZyfDte.rateScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZyfDte.rateScore}</td>
   </c:if>
   
   
   <td class="guangzhou1">${GZhj1Dte.rate1}</td>
   <td class="guangzhou2">${GZhj1Dte.rateDown}</td>
  <%--  <td class="guangzhou3">${GZhj1Dte.rateScore}</td> --%>
   <c:if test="${GZhj1Dte.rateScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.rateScore}</td>
   </c:if>
    <c:if test="${GZhj1Dte.rateScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.rateScore}</td>
   </c:if>
  
   <!--深圳-->
  
   <td class="shenzhen1">${SZszDte.rate1}</td>
   <td class="shenzhen2">${SZszDte.rateDown}</td>
   <%-- <td class="shenzhen3">${SZszDte.rateScore}</td> --%>
   <c:if test="${SZszDte.rateScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.rateScore}</td>
   </c:if>
    <c:if test="${SZszDte.rateScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.rateScore}</td>
   </c:if>
   
   
   <td class="shenzhen1">${SZstDte.rate1}</td>
   <td class="shenzhen2">${SZstDte.rateDown}</td>
  <%--  <td class="shenzhen3">${SZstDte.rateScore}</td> --%>
   <c:if test="${SZstDte.rateScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.rateScore}</td>
   </c:if>
    <c:if test="${SZstDte.rateScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.rateScore}</td>
   </c:if>
  
   
   <td class="shenzhen1">${SZjyDte.rate1}</td>
   <td class="shenzhen2">${SZjyDte.rateDown}</td>
  <%--  <td class="shenzhen3">${SZjyDte.rateScore}</td> --%>
    <c:if test="${SZjyDte.rateScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.rateScore}</td>
   </c:if>
    <c:if test="${SZjyDte.rateScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.rateScore}</td>
   </c:if>
   
   
   <td class="shenzhen1">${SZmzDte.rate1}</td>
   <td class="shenzhen2">${SZmzDte.rateDown}</td>
  <%--  <td class="shenzhen3">${SZmzDte.rateScore}</td> --%>
   <c:if test="${SZmzDte.rateScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.rateScore}</td>
   </c:if>
    <c:if test="${SZmzDte.rateScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.rateScore}</td>
   </c:if>
   
   
   <td class="shenzhen1">${SZczDte.rate1}</td>
   <td class="shenzhen2">${SZczDte.rateDown}</td>
  <%--  <td class="shenzhen3">${SZczDte.rateScore}</td> --%>
   <c:if test="${SZczDte.rateScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.rateScore}</td>
   </c:if>
    <c:if test="${SZczDte.rateScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.rateScore}</td>
   </c:if>
   
   
   <td class="shenzhen1">${SZswDte.rate1}</td>
   <td class="shenzhen2">${SZswDte.rateDown}</td>
   <%-- <td class="shenzhen3">${SZswDte.rateScore}</td> --%>
   <c:if test="${SZswDte.rateScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.rateScore}</td>
   </c:if>
   <c:if test="${SZswDte.rateScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.rateScore}</td>
   </c:if>
  
  
  
   <td class="shenzhen1">${SZhj2Dte.rate1}</td>
   <td class="shenzhen2">${SZhj2Dte.rateDown}</td>
   <%-- <td class="shenzhen3">${SZhj2Dte.rateScore}</td> --%>
   <c:if test="${SZhj2Dte.rateScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.rateScore}</td>
   </c:if>
   <c:if test="${SZhj2Dte.rateScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.rateScore}</td>
   </c:if>
   </div>
 <!--佛山-->
   <td class="foshan1">${FSfsDte.rate1}</td>
   <td class="foshan2">${FSfsDte.rateDown}</td>
   <%-- <td class="foshan3">${FSfsDte.rateScore}</td> --%>
   <c:if test="${FSfsDte.rateScore==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.rateScore}</td>
   </c:if>
   <c:if test="${FSfsDte.rateScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.rateScore}</td>
   </c:if>
   
   <td class="foshan1">${FSjmDte.rate1}</td>
   <td class="foshan2">${FSjmDte.rateDown}</td>
   <%-- <td class="foshan3">${FSjmDte.rateScore}</td> --%>
   <c:if test="${FSjmDte.rateScore==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.rateScore}</td>
   </c:if>
   <c:if test="${FSjmDte.rateScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.rateScore}</td>
   </c:if>
   
   <td class="foshan1">${FSzzDte.rate1}</td>
   <td class="foshan2">${FSzzDte.rateDown}</td>
  <%--  <td class="foshan3">${FSzzDte.rateScore}</td> --%>
   <c:if test="${FSzzDte.rateScore==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.rateScore}</td>
   </c:if>
   <c:if test="${FSzzDte.rateScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.rateScore}</td>
   </c:if>
   
   <td class="foshan1">${FSmmDte.rate1}</td>
   <td class="foshan2">${FSmmDte.rateDown}</td>
  <%--  <td class="foshan3">${FSmmDte.rateScore}</td> --%>
   <c:if test="${FSmmDte.rateScore==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.rateScore}</td>
   </c:if>
   <c:if test="${FSmmDte.rateScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.rateScore}</td>
   </c:if>
   
   <td class="foshan1">${FSyjDte.rate1}</td>
   <td class="foshan2">${FSyjDte.rateDown}</td>
   <%-- <td class="foshan3">${FSyjDte.rateScore}</td> --%>
   <c:if test="${FSyjDte.rateScore==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.rateScore}</td>
   </c:if>
   <c:if test="${FSyjDte.rateScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.rateScore}</td>
   </c:if>
   
   <td class="foshan1">${FShj4Dte.rate1}</td>
   <td class="foshan2">${FShj4Dte.rateDown}</td>
   <%-- <td class="foshan3">${FShj4Dte.rateScore}</td> --%>
   <c:if test="${FShj4Dte.rateScore==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.rateScore}</td>
   </c:if>
   <c:if test="${FShj4Dte.rateScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.rateScore}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1">${DGdgDte.rate1}</td>
   <td class="dongguan2">${DGdgDte.rateDown}</td>
   <%-- <td class="dongguan3">${DGdgDte.rateScore}</td> --%>
   <c:if test="${DGdgDte.rateScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.rateScore}</td>
   </c:if>
   <c:if test="${DGdgDte.rateScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.rateScore}</td>
   </c:if>
   
   
   <td class="dongguan1">${DGzsDte.rate1}</td>
   <td class="dongguan2">${DGzsDte.rateDown}</td>
   <%-- <td class="dongguan3">${DGzsDte.rateScore}</td> --%>
   <c:if test="${DGzsDte.rateScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.rateScore}</td>
   </c:if>
   <c:if test="${DGzsDte.rateScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.rateScore}</td>
   </c:if>
   
   
   <td class="dongguan1">${DGhzDte.rate1}</td>
   <td class="dongguan2">${DGhzDte.rateDown}</td>
   <%-- <td class="dongguan3">${DGhzDte.rateScore}</td> --%>
   <c:if test="${DGhzDte.rateScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.rateScore}</td>
   </c:if>
   <c:if test="${DGhzDte.rateScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.rateScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzhDte.rate1}</td>
   <td class="dongguan2">${DGzhDte.rateDown}</td>
   <%-- <td class="dongguan3">${DGzhDte.rateScore}</td> --%>
   <c:if test="${DGzhDte.rateScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.rateScore}</td>
   </c:if>
   <c:if test="${DGzhDte.rateScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.rateScore}</td>
   </c:if>
   
   
   <td class="dongguan1">${DGhyDte.rate1}</td>
   <td class="dongguan2">${DGhyDte.rateDown}</td>
   <%-- <td class="dongguan3">${DGhyDte.rateScore}</td> --%>
   <c:if test="${DGhyDte.rateScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.rateScore}</td>
   </c:if>
   <c:if test="${DGhyDte.rateScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.rateScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhj3Dte.rate1}</td>
   <td class="dongguan2">${DGhj3Dte.rateDown}</td>
   <%-- <td class="dongguan3">${DGhj3Dte.rateScore}</td> --%>
   <c:if test="${DGhj3Dte.rateScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.rateScore}</td>
   </c:if>
   <c:if test="${DGhj3Dte.rateScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.rateScore}</td>
   </c:if>
   
   </tr> 	
	<!--第一行-->  
   
   <tr>
  
   <td style="color: #00EEEE;" title="取清算表的考核细则">直接净利率（%）</td>
   <td>${score.profitScore}</td>
   <td class="guangzhou1">${GZgzDte.netprofit}</td>
   <td class="guangzhou2">${GZgzDte.profitDown}</td>
   <%-- <td class="guangzhou3">${GZgzDte.profitScore}</td> --%>
   <c:if test="${GZgzDte.profitScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.profitScore}</td>
   </c:if>
   <c:if test="${GZgzDte.profitScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.profitScore}</td>
   </c:if>
   
   <!-- 肇庆 -->
   <td class="guangzhou1">${GZzqDte.netprofit}</td>
   <td class="guangzhou2">${GZzqDte.profitDown}</td>
  <%--  <td class="guangzhou3">${GZzqDte.profitScore}</td> --%>
   <c:if test="${GZzqDte.profitScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.profitScore}</td>
   </c:if>
   <c:if test="${GZzqDte.profitScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.profitScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZqyDte.netprofit}</td>
   <td class="guangzhou2">${GZqyDte.profitDown}</td>
   <%-- <td class="guangzhou3">${GZqyDte.profitScore}</td> --%>
   <c:if test="${GZqyDte.profitScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.profitScore}</td>
   </c:if>
   <c:if test="${GZqyDte.profitScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.profitScore}</td>
   </c:if>
   
   
   <td class="guangzhou1">${GZsgDte.netprofit}</td>
   <td class="guangzhou2">${GZsgDte.profitDown}</td>
   <%-- <td class="guangzhou3">${GZsgDte.profitScore}</td> --%>
   <c:if test="${GZsgDte.profitScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.profitScore}</td>
   </c:if>
   <c:if test="${GZsgDte.profitScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.profitScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZyfDte.netprofit}</td>
   <td class="guangzhou2">${GZyfDte.profitDown}</td>
   <%-- <td class="guangzhou3">${GZyfDte.profitScore}</td> --%>
   <c:if test="${GZyfDte.profitScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZyfDte.profitScore}</td>
   </c:if>
   <c:if test="${GZyfDte.profitScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZyfDte.profitScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZhj1Dte.netprofit}</td>
   <td class="guangzhou2">${GZhj1Dte.profitDown}</td>
   <%-- <td class="guangzhou3">${GZhj1Dte.profitScore}</td> --%>
   <c:if test="${GZhj1Dte.profitScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.profitScore}</td>
   </c:if>
   <c:if test="${GZhj1Dte.profitScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.profitScore}</td>
   </c:if>
   <!--深圳-->
    
   <td class="shenzhen1">${SZszDte.netprofit}</td>
   <td class="shenzhen2">${SZszDte.profitDown}</td>
   <%-- <td class="shenzhen3">${SZszDte.profitScore}</td> --%>
   <c:if test="${SZszDte.profitScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.profitScore}</td>
   </c:if>
   <c:if test="${SZszDte.profitScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.profitScore}</td>
   </c:if>
   
   
   <td class="shenzhen1">${SZstDte.netprofit}</td>
   <td class="shenzhen2">${SZstDte.profitDown}</td>
   <%-- <td class="shenzhen3">${SZstDte.profitScore}</td> --%>
   <c:if test="${SZstDte.profitScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.profitScore}</td>
   </c:if>
   <c:if test="${SZstDte.profitScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.profitScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZjyDte.netprofit}</td>
   <td class="shenzhen2">${SZjyDte.profitDown}</td>
   <%-- <td class="shenzhen3">${SZjyDte.profitScore}</td> --%>
   <c:if test="${SZjyDte.profitScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.profitScore}</td>
   </c:if>
   <c:if test="${SZjyDte.profitScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.profitScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZmzDte.netprofit}</td>
   <td class="shenzhen2">${SZmzDte.profitDown}</td>
   <%-- <td class="shenzhen3">${SZmzDte.profitScore}</td> --%>
   <c:if test="${SZmzDte.profitScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.profitScore}</td>
   </c:if>
   <c:if test="${SZmzDte.profitScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.profitScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZczDte.netprofit}</td>
   <td class="shenzhen2">${SZczDte.profitDown}</td>
   <%-- <td class="shenzhen3">${SZczDte.profitScore}</td> --%>
   <c:if test="${SZczDte.profitScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.profitScore}</td>
   </c:if>
   <c:if test="${SZczDte.profitScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.profitScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZswDte.netprofit}</td>
   <td class="shenzhen2">${SZswDte.profitDown}</td>
   <%-- <td class="shenzhen3">${SZswDte.profitScore}</td> --%>
   <c:if test="${SZswDte.profitScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.profitScore}</td>
   </c:if>
   <c:if test="${SZswDte.profitScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.profitScore}</td>
   </c:if>
  
   <td class="shenzhen1">${SZhj2Dte.netprofit}</td>
   <td class="shenzhen2">${SZhj2Dte.profitDown}</td>
   <%-- <td class="shenzhen3">${SZhj2Dte.profitScore}</td> --%>
   <c:if test="${SZhj2Dte.profitScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.profitScore}</td>
   </c:if>
   <c:if test="${SZhj2Dte.profitScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.profitScore}</td>
   </c:if>
  
  
 <!--佛山-->
   <td class="foshan1">${FSfsDte.netprofit}</td>
   <td class="foshan2">${FSfsDte.profitDown}</td>
   <%-- <td class="foshan3">${FSfsDte.profitScore}</td> --%>
   <c:if test="${FSfsDte.profitScore==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.profitScore}</td>
   </c:if>
   <c:if test="${FSfsDte.profitScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.profitScore}</td>
   </c:if>
   
   
   <td class="foshan1">${FSjmDte.netprofit}</td>
   <td class="foshan2">${FSjmDte.profitDown}</td>
  <%--  <td class="foshan3">${FSjmDte.profitScore}</td> --%>
   <c:if test="${FSjmDte.profitScore==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.profitScore}</td>
   </c:if>
   <c:if test="${FSjmDte.profitScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.profitScore}</td>
   </c:if>
   
   <td class="foshan1">${FSzzDte.netprofit}</td>
   <td class="foshan2">${FSzzDte.profitDown}</td>
   <%-- <td class="foshan3">${FSzzDte.profitScore}</td> --%>
   <c:if test="${FSzzDte.profitScore==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.profitScore}</td>
   </c:if>
   <c:if test="${FSzzDte.profitScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.profitScore}</td>
   </c:if>
   
   <td class="foshan1">${FSmmDte.netprofit}</td>
   <td class="foshan2">${FSmmDte.profitDown}</td>
   <%-- <td class="foshan3">${FSmmDte.profitScore}</td> --%>
   <c:if test="${FSmmDte.profitScore==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.profitScore}</td>
   </c:if>
   <c:if test="${FSmmDte.profitScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.profitScore}</td>
   </c:if>
   
   <td class="foshan1">${FSyjDte.netprofit}</td>
   <td class="foshan2">${FSyjDte.profitDown}</td>
   <%-- <td class="foshan3">${FSyjDte.profitScore}</td> --%>
   <c:if test="${FSyjDte.profitScore==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.profitScore}</td>
   </c:if>
   <c:if test="${FSyjDte.profitScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.profitScore}</td>
   </c:if>
   
   <td class="foshan1">${FShj4Dte.netprofit}</td>
   <td class="foshan2">${FShj4Dte.profitDown}</td>
   <%-- <td class="foshan3">${FShj4Dte.profitScore}</td> --%>
   <c:if test="${FShj4Dte.profitScore==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.profitScore}</td>
   </c:if>
   <c:if test="${FShj4Dte.profitScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.profitScore}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1">${DGdgDte.netprofit}</td>
   <td class="dongguan2">${DGdgDte.profitDown}</td>
   <%-- <td class="dongguan3">${DGdgDte.profitScore}</td> --%>
   <c:if test="${DGdgDte.profitScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.profitScore}</td>
   </c:if>
   <c:if test="${DGdgDte.profitScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.profitScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzsDte.netprofit}</td>
   <td class="dongguan2">${DGzsDte.profitDown}</td>
   <%-- <td class="dongguan3">${DGzsDte.profitScore}</td> --%>
   <c:if test="${DGzsDte.profitScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.profitScore}</td>
   </c:if>
   <c:if test="${DGzsDte.profitScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.profitScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhzDte.netprofit}</td>
   <td class="dongguan2">${DGhzDte.profitDown}</td>
   <%-- <td class="dongguan3">${DGhzDte.profitScore}</td> --%>
   <c:if test="${DGhzDte.profitScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.profitScore}</td>
   </c:if>
   <c:if test="${DGhzDte.profitScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.profitScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzhDte.netprofit}</td>
   <td class="dongguan2">${DGzhDte.profitDown}</td>
   <%-- <td class="dongguan3">${DGzhDte.profitScore}</td> --%>
   <c:if test="${DGzhDte.profitScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.profitScore}</td>
   </c:if>
   <c:if test="${DGzhDte.profitScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.profitScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhyDte.netprofit}</td>
   <td class="dongguan2">${DGhyDte.profitDown}</td>
   <%-- <td class="dongguan3">${DGhyDte.profitScore}</td> --%>
   <c:if test="${DGhyDte.profitScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.profitScore}</td>
   </c:if>
   <c:if test="${DGhyDte.profitScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.profitScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhj3Dte.netprofit}</td>
   <td class="dongguan2">${DGhj3Dte.profitDown}</td>
   <%-- <td class="dongguan3">${DGhj3Dte.profitScore}</td> --%>
   <c:if test="${DGhj3Dte.profitScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.profitScore}</td>
   </c:if>
   <c:if test="${DGhj3Dte.profitScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.profitScore}</td>
   </c:if>
   
   </tr>
   
   </tr> 		
<!--规模类（50分）-->		
	   <tr>
   <td rowspan="4" style="color: #00EEEE;">规模类（50分）</td>	
   <td style="color: #00EEEE;" title="取清算表的考核细则">运营收入（万元）</td>
   <td>${score.businessScore}</td>
   <td class="guangzhou1">${GZgzDte.businessQuarter}</td>
   <td class="guangzhou2">${GZgzDte.businessDown}</td>
   <%-- <td class="guangzhou3">${GZgzDte.businessScore}</td> --%>
   <c:if test="${GZgzDte.businessScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.businessScore}</td>
   </c:if>
   <c:if test="${GZgzDte.businessScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.businessScore}</td>
   </c:if>
   <!-- 肇庆 -->
   <td class="guangzhou1">${GZzqDte.businessQuarter}</td>
   <td class="guangzhou2">${GZzqDte.businessDown}</td>
   <%-- <td class="guangzhou3">${GZzqDte.businessScore}</td> --%>
   <c:if test="${GZzqDte.businessScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.businessScore}</td>
   </c:if>
   <c:if test="${GZzqDte.businessScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.businessScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZqyDte.businessQuarter}</td>
   <td class="guangzhou2">${GZqyDte.businessDown}</td>
   <%-- <td class="guangzhou3">${GZqyDte.businessScore}</td> --%>
   <c:if test="${GZqyDte.businessScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.businessScore}</td>
   </c:if>
   <c:if test="${GZqyDte.businessScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.businessScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZsgDte.businessQuarter}</td>
   <td class="guangzhou2">${GZsgDte.businessDown}</td>
   <%-- <td class="guangzhou3">${GZsgDte.businessScore}</td> --%>
   <c:if test="${GZsgDte.businessScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.businessScore}</td>
   </c:if>
   <c:if test="${GZsgDte.businessScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.businessScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZyfDte.businessQuarter}</td>
   <td class="guangzhou2">${GZyfDte.businessDown}</td>
  <%--  <td class="guangzhou3">${GZyfDte.businessScore}</td> --%>
   <c:if test="${GZyfDte.businessScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZyfDte.businessScore}</td>
   </c:if>
   <c:if test="${GZyfDte.businessScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZyfDte.businessScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZhj1Dte.businessQuarter}</td>
   <td class="guangzhou2">${GZhj1Dte.businessDown}</td>
   <%-- <td class="guangzhou3">${GZhj1Dte.businessScore}</td> --%>
   <c:if test="${GZhj1Dte.businessScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.businessScore}</td>
   </c:if>
   <c:if test="${GZhj1Dte.businessScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.businessScore}</td>
   </c:if>
   <!--深圳-->
    
   <td class="shenzhen1">${SZszDte.businessQuarter}</td>
   <td class="shenzhen2">${SZszDte.businessDown}</td>
   <%-- <td class="shenzhen3">${SZszDte.businessScore}</td> --%>
   <c:if test="${SZszDte.businessScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.businessScore}</td>
   </c:if>
   <c:if test="${SZszDte.businessScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.businessScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZstDte.businessQuarter}</td>
   <td class="shenzhen2">${SZstDte.businessDown}</td>
   <%-- <td class="shenzhen3">${SZstDte.businessScore}</td> --%>
   <c:if test="${SZstDte.businessScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.businessScore}</td>
   </c:if>
   <c:if test="${SZstDte.businessScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.businessScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZjyDte.businessQuarter}</td>
   <td class="shenzhen2">${SZjyDte.businessDown}</td>
   <%-- <td class="shenzhen3">${SZjyDte.businessScore}</td> --%>
   <c:if test="${SZjyDte.businessScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.businessScore}</td>
   </c:if>
   <c:if test="${SZjyDte.businessScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.businessScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZmzDte.businessQuarter}</td>
   <td class="shenzhen2">${SZmzDte.businessDown}</td>
   <%-- <td class="shenzhen3">${SZmzDte.businessScore}</td> --%>
   <c:if test="${SZmzDte.businessScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.businessScore}</td>
   </c:if>
   <c:if test="${SZmzDte.businessScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.businessScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZczDte.businessQuarter}</td>
   <td class="shenzhen2">${SZczDte.businessDown}</td>
   <%-- <td class="shenzhen3">${SZczDte.businessScore}</td> --%>
   <c:if test="${SZczDte.businessScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.businessScore}</td>
   </c:if>
   <c:if test="${SZczDte.businessScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.businessScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZswDte.businessQuarter}</td>
   <td class="shenzhen2">${SZswDte.businessDown}</td>
   <%-- <td class="shenzhen3">${SZswDte.businessScore}</td> --%>
   <c:if test="${SZswDte.businessScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.businessScore}</td>
   </c:if>
   <c:if test="${SZswDte.businessScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.businessScore}</td>
   </c:if>
  
   <td class="shenzhen1">${SZhj2Dte.businessQuarter}</td>
   <td class="shenzhen2">${SZhj2Dte.businessDown}</td>
   <%-- <td class="shenzhen3">${SZhj2Dte.businessScore}</td> --%>
   <c:if test="${SZhj2Dte.businessScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.businessScore}</td>
   </c:if>
   <c:if test="${SZhj2Dte.businessScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.businessScore}</td>
   </c:if>
   </div>
 <!--佛山-->
   <td class="foshan1">${FSfsDte.businessQuarter}</td>
   <td class="foshan2">${FSfsDte.businessDown}</td>
   <%-- <td class="foshan3">${FSfsDte.businessScore}</td> --%>
   <c:if test="${FSfsDte.businessScore==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.businessScore}</td>
   </c:if>
   <c:if test="${FSfsDte.businessScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.businessScore}</td>
   </c:if>
   
   <td class="foshan1">${FSjmDte.businessQuarter}</td>
   <td class="foshan2">${FSjmDte.businessDown}</td>
   <%-- <td class="foshan3">${FSjmDte.businessScore}</td> --%>
   <c:if test="${FSjmDte.businessScore==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.businessScore}</td>
   </c:if>
   <c:if test="${FSjmDte.businessScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.businessScore}</td>
   </c:if>
   
   <td class="foshan1">${FSzzDte.businessQuarter}</td>
   <td class="foshan2">${FSzzDte.businessDown}</td>
   <%-- <td class="foshan3">${FSzzDte.businessScore}</td> --%>
   <c:if test="${FSzzDte.businessScore==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.businessScore}</td>
   </c:if>
   <c:if test="${FSzzDte.businessScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.businessScore}</td>
   </c:if>
   
   <td class="foshan1">${FSmmDte.businessQuarter}</td>
   <td class="foshan2">${FSmmDte.businessDown}</td>
   <%-- <td class="foshan3">${FSmmDte.businessScore}</td> --%>
   <c:if test="${FSmmDte.businessScore==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.businessScore}</td>
   </c:if>
   <c:if test="${FSmmDte.businessScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.businessScore}</td>
   </c:if>
   
   <td class="foshan1">${FSyjDte.businessQuarter}</td>
   <td class="foshan2">${FSyjDte.businessDown}</td>
   <%-- <td class="foshan3">${FSyjDte.businessScore}</td> --%>
   <c:if test="${FSyjDte.businessScore==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.businessScore}</td>
   </c:if>
   <c:if test="${FSyjDte.businessScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.businessScore}</td>
   </c:if>
   
   <td class="foshan1">${FShj4Dte.businessQuarter}</td>
   <td class="foshan2">${FShj4Dte.businessDown}</td>
   <%-- <td class="foshan3">${FShj4Dte.businessScore}</td> --%>
   <c:if test="${FShj4Dte.businessScore==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.businessScore}</td>
   </c:if>
   <c:if test="${FShj4Dte.businessScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.businessScore}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1">${DGdgDte.businessQuarter}</td>
   <td class="dongguan2">${DGdgDte.businessDown}</td>
   <%-- <td class="dongguan3">${DGdgDte.businessScore}</td> --%>
   <c:if test="${DGdgDte.businessScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.businessScore}</td>
   </c:if>
   <c:if test="${DGdgDte.businessScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.businessScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzsDte.businessQuarter}</td>
   <td class="dongguan2">${DGzsDte.businessDown}</td>
   <%-- <td class="dongguan3">${DGzsDte.businessScore}</td> --%>
   <c:if test="${DGzsDte.businessScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.businessScore}</td>
   </c:if>
   <c:if test="${DGzsDte.businessScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.businessScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhzDte.businessQuarter}</td>
   <td class="dongguan2">${DGhzDte.businessDown}</td>
  <%--  <td class="dongguan3">${DGhzDte.businessScore}</td> --%>
   <c:if test="${DGhzDte.businessScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.businessScore}</td>
   </c:if>
   <c:if test="${DGhzDte.businessScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.businessScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzhDte.businessQuarter}</td>
   <td class="dongguan2">${DGzhDte.businessDown}</td>
   <%-- <td class="dongguan3">${DGzhDte.businessScore}</td> --%>
   <c:if test="${DGzhDte.businessScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.businessScore}</td>
   </c:if>
   <c:if test="${DGzhDte.businessScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.businessScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhyDte.businessQuarter}</td>
   <td class="dongguan2">${DGhyDte.businessDown}</td>
   <%-- <td class="dongguan3">${DGhyDte.businessScore}</td> --%>
   <c:if test="${DGhyDte.businessScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.businessScore}</td>
   </c:if>
   <c:if test="${DGhyDte.businessScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.businessScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhj3Dte.businessQuarter}</td>
   <td class="dongguan2">${DGhj3Dte.businessDown}</td>
   <%-- <td class="dongguan3">${DGhj3Dte.businessScore}</td> --%>
   <c:if test="${DGhj3Dte.businessScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.businessScore}</td>
   </c:if>
   <c:if test="${DGhj3Dte.businessScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.businessScore}</td>
   </c:if>
   </tr> 	
	<!--第一行-->  
   
   <tr>
  
   <td style="color: #00EEEE;" title="取清算表的考核细则">自有品牌手机收入（万元）</td>
 <td>${score.brandselfScore}</td>
   <td class="guangzhou1">${GZgzDte.brandselfQuarter}</td>
   <td class="guangzhou2">${GZgzDte.brandselfMobileD}</td>
   <%-- <td class="guangzhou3">${GZgzDte.brandselfScore}</td> --%>
   <c:if test="${GZgzDte.brandselfScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.brandselfScore}</td>
   </c:if>
   <c:if test="${GZgzDte.brandselfScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.brandselfScore}</td>
   </c:if>
   <!-- 肇庆 -->
   <td class="guangzhou1">${GZzqDte.brandselfQuarter}</td>
   <td class="guangzhou2">${GZzqDte.brandselfMobileD}</td>
   <%-- <td class="guangzhou3">${GZzqDte.brandselfScore}</td> --%>
   <c:if test="${GZzqDte.brandselfScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.brandselfScore}</td>
   </c:if>
   <c:if test="${GZzqDte.brandselfScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.brandselfScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZqyDte.brandselfQuarter}</td>
   <td class="guangzhou2">${GZqyDte.brandselfMobileD}</td>
   <%-- <td class="guangzhou3">${GZqyDte.brandselfScore}</td> --%>
   <c:if test="${GZqyDte.brandselfScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.brandselfScore}</td>
   </c:if>
   <c:if test="${GZqyDte.brandselfScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.brandselfScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZsgDte.brandselfQuarter}</td>
   <td class="guangzhou2">${GZsgDte.brandselfMobileD}</td>
   <%-- <td class="guangzhou3">${GZsgDte.brandselfScore}</td> --%>
   <c:if test="${GZsgDte.brandselfScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.brandselfScore}</td>
   </c:if>
   <c:if test="${GZsgDte.brandselfScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.brandselfScore}</td>
   </c:if>
   
    <td class="guangzhou1">${GZyfDte.brandselfQuarter}</td>
   <td class="guangzhou2">${GZyfDte.brandselfMobileD}</td>
   <%-- <td class="guangzhou3">${GZyfDte.brandselfScore}</td> --%>
   <c:if test="${GZyfDte.brandselfScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZyfDte.brandselfScore}</td>
   </c:if>
   <c:if test="${GZyfDte.brandselfScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZyfDte.brandselfScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZhj1Dte.brandselfQuarter}</td>
   <td class="guangzhou2">${GZhj1Dte.brandselfMobileD}</td>
   <%-- <td class="guangzhou3">${GZhj1Dte.brandselfScore}</td> --%>
   <c:if test="${GZhj1Dte.brandselfScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.brandselfScore}</td>
   </c:if>
   <c:if test="${GZhj1Dte.brandselfScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.brandselfScore}</td>
   </c:if>
   <!--深圳-->
    
   <td class="shenzhen1">${SZszDte.brandselfQuarter}</td>
   <td class="shenzhen2">${SZszDte.brandselfMobileD}</td>
   <%-- <td class="shenzhen3">${SZszDte.brandselfScore}</td> --%>
   <c:if test="${SZszDte.brandselfScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.brandselfScore}</td>
   </c:if>
   <c:if test="${SZszDte.brandselfScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.brandselfScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZstDte.brandselfQuarter}</td>
   <td class="shenzhen2">${SZstDte.brandselfMobileD}</td>
   <%-- <td class="shenzhen3">${SZstDte.brandselfScore}</td> --%>
   <c:if test="${SZstDte.brandselfScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.brandselfScore}</td>
   </c:if>
   <c:if test="${SZstDte.brandselfScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.brandselfScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZjyDte.brandselfQuarter}</td>
   <td class="shenzhen2">${SZjyDte.brandselfMobileD}</td>
  <%--  <td class="shenzhen3">${SZjyDte.brandselfScore}</td> --%>
   <c:if test="${SZjyDte.brandselfScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.brandselfScore}</td>
   </c:if>
   <c:if test="${SZjyDte.brandselfScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.brandselfScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZmzDte.brandselfQuarter}</td>
   <td class="shenzhen2">${SZmzDte.brandselfMobileD}</td>
   <%-- <td class="shenzhen3">${SZmzDte.brandselfScore}</td> --%>
   <c:if test="${SZmzDte.brandselfScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.brandselfScore}</td>
   </c:if>
   <c:if test="${SZmzDte.brandselfScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.brandselfScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZczDte.brandselfQuarter}</td>
   <td class="shenzhen2">${SZczDte.brandselfMobileD}</td>
   <%-- <td class="shenzhen3">${SZczDte.brandselfScore}</td> --%>
   <c:if test="${SZczDte.brandselfScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.brandselfScore}</td>
   </c:if>
   <c:if test="${SZczDte.brandselfScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.brandselfScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZswDte.brandselfQuarter}</td>
   <td class="shenzhen2">${SZswDte.brandselfMobileD}</td>
   <%-- <td class="shenzhen3">${SZswDte.brandselfScore}</td> --%>
   <c:if test="${SZswDte.brandselfScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.brandselfScore}</td>
   </c:if>
   <c:if test="${SZswDte.brandselfScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.brandselfScore}</td>
   </c:if>
  
   <td class="shenzhen1">${SZhj2Dte.brandselfQuarter}</td>
   <td class="shenzhen2">${SZhj2Dte.brandselfMobileD}</td>
   <%-- <td class="shenzhen3">${SZhj2Dte.brandselfScore}</td> --%>
   <c:if test="${SZhj2Dte.brandselfScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.brandselfScore}</td>
   </c:if>
   <c:if test="${SZhj2Dte.brandselfScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.brandselfScore}</td>
   </c:if>
    
 <!--佛山-->
   <td class="foshan1">${FSfsDte.brandselfQuarter}</td>
   <td class="foshan2">${FSfsDte.brandselfMobileD}</td>
   <%-- <td class="foshan3">${FSfsDte.brandselfScore}</td> --%>
   <c:if test="${FSfsDte.brandselfScore==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.brandselfScore}</td>
   </c:if>
   <c:if test="${FSfsDte.brandselfScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.brandselfScore}</td>
   </c:if>
   
   <td class="foshan1">${FSjmDte.brandselfQuarter}</td>
   <td class="foshan2">${FSjmDte.brandselfMobileD}</td>
   <%-- <td class="foshan3">${FSjmDte.brandselfScore}</td> --%>
   <c:if test="${FSjmDte.brandselfScore==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.brandselfScore}</td>
   </c:if>
   <c:if test="${FSjmDte.brandselfScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.brandselfScore}</td>
   </c:if>
   
   <td class="foshan1">${FSzzDte.brandselfQuarter}</td>
   <td class="foshan2">${FSzzDte.brandselfMobileD}</td>
   <%-- <td class="foshan3">${FSzzDte.brandselfScore}</td> --%>
   <c:if test="${FSzzDte.brandselfScore==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.brandselfScore}</td>
   </c:if>
   <c:if test="${FSzzDte.brandselfScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.brandselfScore}</td>
   </c:if>
   
   <td class="foshan1">${FSmmDte.brandselfQuarter}</td>
   <td class="foshan2">${FSmmDte.brandselfMobileD}</td>
   <%-- <td class="foshan3">${FSmmDte.brandselfScore}</td> --%>
   <c:if test="${FSmmDte.brandselfScore==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.brandselfScore}</td>
   </c:if>
   <c:if test="${FSmmDte.brandselfScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.brandselfScore}</td>
   </c:if>
   
   <td class="foshan1">${FSyjDte.brandselfQuarter}</td>
   <td class="foshan2">${FSyjDte.brandselfMobileD}</td>
   <%-- <td class="foshan3">${FSyjDte.brandselfScore}</td> --%>
   <c:if test="${FSyjDte.brandselfScore==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.brandselfScore}</td>
   </c:if>
   <c:if test="${FSyjDte.brandselfScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.brandselfScore}</td>
   </c:if>
   
   <td class="foshan1">${FShj4Dte.brandselfQuarter}</td>
   <td class="foshan2">${FShj4Dte.brandselfMobileD}</td>
   <%-- <td class="foshan3">${FShj4Dte.brandselfScore}</td> --%>
   <c:if test="${FShj4Dte.brandselfScore==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.brandselfScore}</td>
   </c:if>
   <c:if test="${FShj4Dte.brandselfScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.brandselfScore}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1">${DGdgDte.brandselfQuarter}</td>
   <td class="dongguan2">${DGdgDte.brandselfMobileD}</td>
   <%-- <td class="dongguan3">${DGdgDte.brandselfScore}</td> --%>
   <c:if test="${DGdgDte.brandselfScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.brandselfScore}</td>
   </c:if>
   <c:if test="${DGdgDte.brandselfScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.brandselfScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzsDte.brandselfQuarter}</td>
   <td class="dongguan2">${DGzsDte.brandselfMobileD}</td>
   <%-- <td class="dongguan3">${DGzsDte.brandselfScore}</td> --%>
   <c:if test="${DGzsDte.brandselfScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.brandselfScore}</td>
   </c:if>
   <c:if test="${DGzsDte.brandselfScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.brandselfScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhzDte.brandselfQuarter}</td>
   <td class="dongguan2">${DGhzDte.brandselfMobileD}</td>
   <%-- <td class="dongguan3">${DGhzDte.brandselfScore}</td> --%>
   <c:if test="${DGhzDte.brandselfScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.brandselfScore}</td>
   </c:if>
   <c:if test="${DGhzDte.brandselfScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.brandselfScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzhDte.brandselfQuarter}</td>
   <td class="dongguan2">${DGzhDte.brandselfMobileD}</td>
   <%-- <td class="dongguan3">${DGzhDte.brandselfScore}</td> --%>
   <c:if test="${DGzhDte.brandselfScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.brandselfScore}</td>
   </c:if>
   <c:if test="${DGzhDte.brandselfScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.brandselfScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhyDte.brandselfQuarter}</td>
   <td class="dongguan2">${DGhyDte.brandselfMobileD}</td>
   <%-- <td class="dongguan3">${DGhyDte.brandselfScore}</td> --%>
   <c:if test="${DGhyDte.brandselfScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.brandselfScore}</td>
   </c:if>
   <c:if test="${DGhyDte.brandselfScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.brandselfScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhj3Dte.brandselfQuarter}</td>
   <td class="dongguan2">${DGhj3Dte.brandselfMobileD}</td>
   <%-- <td class="dongguan3">${DGhj3Dte.brandselfScore}</td> --%>
   <c:if test="${DGhj3Dte.brandselfScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.brandselfScore}</td>
   </c:if>
   <c:if test="${DGhj3Dte.brandselfScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.brandselfScore}</td>
   </c:if>
   
   </tr> 		
			
	   <tr>
   <td style="color: #00EEEE;" title="取清算表的考核细则">自有品牌智能硬件硬件收入（万元）</td>	
   <td>${score.hardwardScore}</td>
   <td class="guangzhou1">${GZgzDte.hardwardQuarter}</td>
   <td class="guangzhou2">${GZgzDte.hardwardD}</td>
   <%-- <td class="guangzhou3">${GZgzDte.hardwardScore}</td> --%>
   <c:if test="${GZgzDte.hardwardScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.hardwardScore}</td>
   </c:if>
   <c:if test="${GZgzDte.hardwardScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.hardwardScore}</td>
   </c:if>
   <!-- 肇庆 -->
   <td class="guangzhou1">${GZzqDte.hardwardQuarter}</td>
   <td class="guangzhou2">${GZzqDte.hardwardD}</td>
   <%-- <td class="guangzhou3">${GZzqDte.hardwardScore}</td> --%>
   <c:if test="${GZzqDte.hardwardScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.hardwardScore}</td>
   </c:if>
   <c:if test="${GZzqDte.hardwardScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.hardwardScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZqyDte.hardwardQuarter}</td>
   <td class="guangzhou2">${GZqyDte.hardwardD}</td>
   <%-- <td class="guangzhou3">${GZqyDte.hardwardScore}</td> --%>
   <c:if test="${GZqyDte.hardwardScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.hardwardScore}</td>
   </c:if>
   <c:if test="${GZqyDte.hardwardScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.hardwardScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZsgDte.hardwardQuarter}</td>
   <td class="guangzhou2">${GZsgDte.hardwardD}</td>
   <%-- <td class="guangzhou3">${GZsgDte.hardwardScore}</td> --%>
   <c:if test="${GZsgDte.hardwardScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.hardwardScore}</td>
   </c:if>
   <c:if test="${GZsgDte.hardwardScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.hardwardScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZyfDte.hardwardQuarter}</td>
   <td class="guangzhou2">${GZyfDte.hardwardD}</td>
   <%-- <td class="guangzhou3">${GZyfDte.hardwardScore}</td> --%>
   <c:if test="${GZyfDte.hardwardScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZyfDte.hardwardScore}</td>
   </c:if>
   <c:if test="${GZyfDte.hardwardScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZyfDte.hardwardScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZhj1Dte.hardwardQuarter}</td>
   <td class="guangzhou2">${GZhj1Dte.hardwardD}</td>
   <%-- <td class="guangzhou3">${GZhj1Dte.hardwardScore}</td> --%>
   <c:if test="${GZhj1Dte.hardwardScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.hardwardScore}</td>
   </c:if>
   <c:if test="${GZhj1Dte.hardwardScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.hardwardScore}</td>
   </c:if>
   <!--深圳-->
   
   <td class="shenzhen1">${SZszDte.hardwardQuarter}</td>
   <td class="shenzhen2">${SZszDte.hardwardD}</td>
   <%-- <td class="shenzhen3">${SZszDte.hardwardScore}</td> --%>
   <c:if test="${SZszDte.hardwardScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.hardwardScore}</td>
   </c:if>
   <c:if test="${SZszDte.hardwardScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.hardwardScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZstDte.hardwardQuarter}</td>
   <td class="shenzhen2">${SZstDte.hardwardD}</td>
   <%-- <td class="shenzhen3">${SZstDte.hardwardScore}</td> --%>
   <c:if test="${SZstDte.hardwardScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.hardwardScore}</td>
   </c:if>
   <c:if test="${SZstDte.hardwardScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.hardwardScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZjyDte.hardwardQuarter}</td>
   <td class="shenzhen2">${SZjyDte.hardwardD}</td>
   <%-- <td class="shenzhen3">${SZjyDte.hardwardScore}</td> --%>
   <c:if test="${SZjyDte.hardwardScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.hardwardScore}</td>
   </c:if>
   <c:if test="${SZjyDte.hardwardScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.hardwardScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZmzDte.hardwardQuarter}</td>
   <td class="shenzhen2">${SZmzDte.hardwardD}</td>
   <%-- <td class="shenzhen3">${SZmzDte.hardwardScore}</td> --%>
   <c:if test="${GZhj1Dte.hardwardScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.hardwardScore}</td>
   </c:if>
   <c:if test="${SZmzDte.hardwardScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.hardwardScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZczDte.hardwardQuarter}</td>
   <td class="shenzhen2">${SZczDte.hardwardD}</td>
   <%-- <td class="shenzhen3">${SZczDte.hardwardScore}</td> --%>
   <c:if test="${SZczDte.hardwardScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.hardwardScore}</td>
   </c:if>
   <c:if test="${SZczDte.hardwardScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.hardwardScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZswDte.hardwardQuarter}</td>
   <td class="shenzhen2">${SZswDte.hardwardD}</td>
   <%-- <td class="shenzhen3">${SZswDte.hardwardScore}</td> --%>
   <c:if test="${SZswDte.hardwardScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.hardwardScore}</td>
   </c:if>
   <c:if test="${SZswDte.hardwardScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.hardwardScore}</td>
   </c:if>
  
   <td class="shenzhen1">${SZhj2Dte.hardwardQuarter}</td>
   <td class="shenzhen2">${SZhj2Dte.hardwardD}</td>
   <%-- <td class="shenzhen3">${SZhj2Dte.hardwardScore}</td> --%>
   <c:if test="${SZhj2Dte.hardwardScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.hardwardScore}</td>
   </c:if>
   <c:if test="${SZhj2Dte.hardwardScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.hardwardScore}</td>
   </c:if>
   
 <!--佛山-->
   <td class="foshan1">${FSfsDte.hardwardQuarter}</td>
   <td class="foshan2">${FSfsDte.hardwardD}</td>
   <%-- <td class="foshan3">${FSfsDte.hardwardScore}</td> --%>
   <c:if test="${FSfsDte.hardwardScore==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.hardwardScore}</td>
   </c:if>
   <c:if test="${FSfsDte.hardwardScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.hardwardScore}</td>
   </c:if>
   
   <td class="foshan1">${FSjmDte.hardwardQuarter}</td>
   <td class="foshan2">${FSjmDte.hardwardD}</td>
   <%-- <td class="foshan3">${FSjmDte.hardwardScore}</td> --%>
   <c:if test="${FSjmDte.hardwardScore==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.hardwardScore}</td>
   </c:if>
   <c:if test="${FSjmDte.hardwardScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.hardwardScore}</td>
   </c:if>
   
   <td class="foshan1">${FSzzDte.hardwardQuarter}</td>
   <td class="foshan2">${FSzzDte.hardwardD}</td>
   <%-- <td class="foshan3">${FSzzDte.hardwardScore}</td> --%>
   <c:if test="${FSzzDte.hardwardScore==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.hardwardScore}</td>
   </c:if>
   <c:if test="${FSzzDte.hardwardScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.hardwardScore}</td>
   </c:if>
   
   <td class="foshan1">${FSmmDte.hardwardQuarter}</td>
   <td class="foshan2">${FSmmDte.hardwardD}</td>
   <%-- <td class="foshan3">${FSmmDte.hardwardScore}</td> --%>
   <c:if test="${FSmmDte.hardwardScore==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.hardwardScore}</td>
   </c:if>
   <c:if test="${FSmmDte.hardwardScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.hardwardScore}</td>
   </c:if>
   
   <td class="foshan1">${FSyjDte.hardwardQuarter}</td>
   <td class="foshan2">${FSyjDte.hardwardD}</td>
   <%-- <td class="foshan3">${FSyjDte.hardwardScore}</td> --%>
   <c:if test="${FSyjDte.hardwardScore==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.hardwardScore}</td>
   </c:if>
   <c:if test="${FSyjDte.hardwardScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.hardwardScore}</td>
   </c:if>
   
   <td class="foshan1">${FShj4Dte.hardwardQuarter}</td>
   <td class="foshan2">${FShj4Dte.hardwardD}</td>
   <%-- <td class="foshan3">${FShj4Dte.hardwardScore}</td> --%>
   <c:if test="${FShj4Dte.hardwardScore==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.hardwardScore}</td>
   </c:if>
   <c:if test="${FShj4Dte.hardwardScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.hardwardScore}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1">${DGdgDte.hardwardQuarter}</td>
   <td class="dongguan2">${DGdgDte.hardwardD}</td>
   <%-- <td class="dongguan3">${DGdgDte.hardwardScore}</td> --%>
   <c:if test="${DGdgDte.hardwardScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.hardwardScore}</td>
   </c:if>
   <c:if test="${DGdgDte.hardwardScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.hardwardScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzsDte.hardwardQuarter}</td>
   <td class="dongguan2">${DGzsDte.hardwardD}</td>
   <%-- <td class="dongguan3">${DGzsDte.hardwardScore}</td> --%>
   <c:if test="${DGzsDte.hardwardScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.hardwardScore}</td>
   </c:if>
   <c:if test="${DGzsDte.hardwardScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.hardwardScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhzDte.hardwardQuarter}</td>
   <td class="dongguan2">${DGhzDte.hardwardD}</td>
   <%-- <td class="dongguan3">${DGhzDte.hardwardScore}</td> --%>
   <c:if test="${DGhzDte.hardwardScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.hardwardScore}</td>
   </c:if>
   <c:if test="${DGhzDte.hardwardScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.hardwardScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzhDte.hardwardQuarter}</td>
   <td class="dongguan2">${DGzhDte.hardwardD}</td>
   <%-- <td class="dongguan3">${DGzhDte.hardwardScore}</td> --%>
   <c:if test="${DGzhDte.hardwardScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.hardwardScore}</td>
   </c:if>
   <c:if test="${DGzhDte.hardwardScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.hardwardScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhyDte.hardwardQuarter}</td>
   <td class="dongguan2">${DGhyDte.hardwardD}</td>
   <%-- <td class="dongguan3">${DGhyDte.hardwardScore}</td> --%>
   <c:if test="${DGhyDte.hardwardScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.hardwardScore}</td>
   </c:if>
   <c:if test="${DGhyDte.hardwardScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.hardwardScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhj3Dte.hardwardQuarter}</td>
   <td class="dongguan2">${DGhj3Dte.hardwardD}</td>
   <%-- <td class="dongguan3">${DGhj3Dte.hardwardScore}</td> --%>
   <c:if test="${DGhj3Dte.hardwardScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.hardwardScore}</td>
   </c:if>
   <c:if test="${DGhj3Dte.hardwardScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.hardwardScore}</td>
   </c:if>
 
   
   </tr> 	
	<!--第一行-->  
   
   <tr>
  
   <td title="" style="color: #00EEEE;" title="取清算表的考核细则">非集团采集类自有品牌智能硬件收入 （万元）</td>
  <td>${score.notGroupScore}</td>
   <td class="guangzhou1">${GZgzDte.notGroupQuarter}</td>
   <td class="guangzhou2">${GZgzDte.notGroupHard1}</td>
   <%-- <td class="guangzhou3">${GZgzDte.notGroupScore}</td> --%>
   <c:if test="${GZgzDte.notGroupScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.notGroupScore}</td>
   </c:if>
   <c:if test="${GZgzDte.notGroupScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.notGroupScore}</td>
   </c:if>
   <!-- 肇庆 -->
   <td class="guangzhou1">${GZzqDte.notGroupQuarter}</td>
   <td class="guangzhou2">${GZzqDte.notGroupHard1}</td>
   <%-- <td class="guangzhou3">${GZzqDte.notGroupScore}</td> --%>
   <c:if test="${GZzqDte.notGroupScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.notGroupScore}</td>
   </c:if>
   <c:if test="${GZzqDte.notGroupScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.notGroupScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZqyDte.notGroupQuarter}</td>
   <td class="guangzhou2">${GZqyDte.notGroupHard1}</td>
   <%-- <td class="guangzhou3">${GZqyDte.notGroupScore}</td> --%>
   <c:if test="${GZqyDte.notGroupScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.notGroupScore}</td>
   </c:if>
   <c:if test="${GZqyDte.notGroupScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.notGroupScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZsgDte.notGroupQuarter}</td>
   <td class="guangzhou2">${GZsgDte.notGroupHard1}</td>
   <%-- <td class="guangzhou3">${GZsgDte.notGroupScore}</td> --%>
   <c:if test="${GZsgDte.notGroupScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.notGroupScore}</td>
   </c:if>
   <c:if test="${GZsgDte.notGroupScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.notGroupScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZyfDte.notGroupQuarter}</td>
   <td class="guangzhou2">${GZyfDte.notGroupHard1}</td>
   <%-- <td class="guangzhou3">${GZyfDte.notGroupScore}</td> --%>
   <c:if test="${GZyfDte.notGroupScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZyfDte.notGroupScore}</td>
   </c:if>
   <c:if test="${GZyfDte.notGroupScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZyfDte.notGroupScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZhj1Dte.notGroupQuarter}</td>
   <td class="guangzhou2">${GZhj1Dte.notGroupHard1}</td>
   <%-- <td class="guangzhou3">${GZhj1Dte.notGroupScore}</td> --%>
   <c:if test="${GZhj1Dte.notGroupScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.notGroupScore}</td>
   </c:if>
   <c:if test="${GZhj1Dte.notGroupScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.notGroupScore}</td>
   </c:if>
   <!--深圳-->
 
   <td class="shenzhen1">${SZszDte.notGroupQuarter}</td>
   <td class="shenzhen2">${SZszDte.notGroupHard1}</td>
   <%-- <td class="shenzhen3">${SZszDte.notGroupScore}</td> --%>
   <c:if test="${SZszDte.notGroupScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.notGroupScore}</td>
   </c:if>
   <c:if test="${SZszDte.notGroupScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.notGroupScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZstDte.notGroupQuarter}</td>
   <td class="shenzhen2">${SZstDte.notGroupHard1}</td>
   <%-- <td class="shenzhen3">${SZstDte.notGroupScore}</td> --%>
   <c:if test="${SZstDte.notGroupScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.notGroupScore}</td>
   </c:if>
   <c:if test="${SZstDte.notGroupScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.notGroupScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZjyDte.notGroupQuarter}</td>
   <td class="shenzhen2">${SZjyDte.notGroupHard1}</td>
   <%-- <td class="shenzhen3">${SZjyDte.notGroupScore}</td> --%>
   <c:if test="${SZjyDte.notGroupScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.notGroupScore}</td>
   </c:if>
   <c:if test="${SZjyDte.notGroupScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.notGroupScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZmzDte.notGroupQuarter}</td>
   <td class="shenzhen2">${SZmzDte.notGroupHard1}</td>
   <%-- <td class="shenzhen3">${SZmzDte.notGroupScore}</td> --%>
   <c:if test="${SZmzDte.notGroupScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.notGroupScore}</td>
   </c:if>
   <c:if test="${SZmzDte.notGroupScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.notGroupScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZczDte.notGroupQuarter}</td>
   <td class="shenzhen2">${SZczDte.notGroupHard1}</td>
   <%-- <td class="shenzhen3">${SZczDte.notGroupScore}</td> --%>
   <c:if test="${SZczDte.notGroupScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.notGroupScore}</td>
   </c:if>
   <c:if test="${SZczDte.notGroupScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.notGroupScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZswDte.notGroupQuarter}</td>
   <td class="shenzhen2">${SZswDte.notGroupHard1}</td>
   <%-- <td class="shenzhen3">${SZswDte.notGroupScore}</td> --%>
   <c:if test="${SZswDte.notGroupScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.notGroupScore}</td>
   </c:if>
   <c:if test="${SZswDte.notGroupScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.notGroupScore}</td>
   </c:if>
  
   <td class="shenzhen1">${SZhj2Dte.notGroupQuarter}</td>
   <td class="shenzhen2">${SZhj2Dte.notGroupHard1}</td>
   <%-- <td class="shenzhen3">${SZhj2Dte.notGroupScore}</td> --%>
   <c:if test="${SZhj2Dte.notGroupScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.notGroupScore}</td>
   </c:if>
   <c:if test="${SZhj2Dte.notGroupScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.notGroupScore}</td>
   </c:if>
   </div>
 <!--佛山-->
   <td class="foshan1">${FSfsDte.notGroupQuarter}</td>
   <td class="foshan2">${FSfsDte.notGroupHard1}</td>
   <%-- <td class="foshan3">${FSfsDte.notGroupScore}</td> --%>
   <c:if test="${FSfsDte.notGroupScore==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.notGroupScore}</td>
   </c:if>
   <c:if test="${FSfsDte.notGroupScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.notGroupScore}</td>
   </c:if>
   
   <td class="foshan1">${FSjmDte.notGroupQuarter}</td>
   <td class="foshan2">${FSjmDte.notGroupHard1}</td>
   <%-- <td class="foshan3">${FSjmDte.notGroupScore}</td> --%>
   <c:if test="${FSjmDte.notGroupScore==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.notGroupScore}</td>
   </c:if>
   <c:if test="${FSjmDte.notGroupScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.notGroupScore}</td>
   </c:if>
   
   <td class="foshan1">${FSzzDte.notGroupQuarter}</td>
   <td class="foshan2">${FSzzDte.notGroupHard1}</td>
   <%-- <td class="foshan3">${FSzzDte.notGroupScore}</td> --%>
   <c:if test="${FSzzDte.notGroupScore==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.notGroupScore}</td>
   </c:if>
   <c:if test="${FSzzDte.notGroupScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.notGroupScore}</td>
   </c:if>
   
   <td class="foshan1">${FSmmDte.notGroupQuarter}</td>
   <td class="foshan2">${FSmmDte.notGroupHard1}</td>
   <%-- <td class="foshan3">${FSmmDte.notGroupScore}</td> --%>
   <c:if test="${FSmmDte.notGroupScore==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.notGroupScore}</td>
   </c:if>
   <c:if test="${FSmmDte.notGroupScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.notGroupScore}</td>
   </c:if>
   
   <td class="foshan1">${FSyjDte.notGroupQuarter}</td>
   <td class="foshan2">${FSyjDte.notGroupHard1}</td>
   <%-- <td class="foshan3">${FSyjDte.notGroupScore}</td> --%>
   <c:if test="${FSyjDte.notGroupScore==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.notGroupScore}</td>
   </c:if>
   <c:if test="${FSyjDte.notGroupScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.notGroupScore}</td>
   </c:if>
   
   <td class="foshan1">${FShj4Dte.notGroupQuarter}</td>
   <td class="foshan2">${FShj4Dte.notGroupHard1}</td>
   <%-- <td class="foshan3">${FShj4Dte.notGroupScore}</td> --%>
   <c:if test="${FShj4Dte.notGroupScore==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.notGroupScore}</td>
   </c:if>
   <c:if test="${FShj4Dte.notGroupScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.notGroupScore}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1">${DGdgDte.notGroupQuarter}</td>
   <td class="dongguan2">${DGdgDte.notGroupHard1}</td>
   <%-- <td class="dongguan3">${DGdgDte.notGroupScore}</td> --%>
   <c:if test="${DGdgDte.notGroupScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.notGroupScore}</td>
   </c:if>
   <c:if test="${DGdgDte.notGroupScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.notGroupScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzsDte.notGroupQuarter}</td>
   <td class="dongguan2">${DGzsDte.notGroupHard1}</td>
   <%-- <td class="dongguan3">${DGzsDte.notGroupScore}</td> --%>
   <c:if test="${DGzsDte.notGroupScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.notGroupScore}</td>
   </c:if>
   <c:if test="${DGzsDte.notGroupScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.notGroupScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhzDte.notGroupQuarter}</td>
   <td class="dongguan2">${DGhzDte.notGroupHard1}</td>
   <%-- <td class="dongguan3">${DGhzDte.notGroupScore}</td> --%>
   <c:if test="${DGhzDte.notGroupScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.notGroupScore}</td>
   </c:if>
   <c:if test="${DGhzDte.notGroupScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.notGroupScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzhDte.notGroupQuarter}</td>
   <td class="dongguan2">${DGzhDte.notGroupHard1}</td>
   <%-- <td class="dongguan3">${DGzhDte.notGroupScore}</td> --%>
   <c:if test="${DGzhDte.notGroupScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.notGroupScore}</td>
   </c:if>
   <c:if test="${DGzhDte.notGroupScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.notGroupScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhyDte.notGroupQuarter}</td>
   <td class="dongguan2">${DGhyDte.notGroupHard1}</td>
   <%-- <td class="dongguan3">${DGhyDte.notGroupScore}</td> --%>
   <c:if test="${DGhyDte.notGroupScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.notGroupScore}</td>
   </c:if>
   <c:if test="${DGhyDte.notGroupScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.notGroupScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhj3Dte.notGroupQuarter}</td>
   <td class="dongguan2">${DGhj3Dte.notGroupHard1}</td>
   <%-- <td class="dongguan3">${DGhj3Dte.notGroupScore}</td> --%>
   <c:if test="${DGhj3Dte.notGroupScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.notGroupScore}</td>
   </c:if>
   <c:if test="${DGhj3Dte.notGroupScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.notGroupScore}</td>
   </c:if>
   
   </tr> 		
			
	<!--重点产品-->		
		 <tr>
   <td rowspan="2" style="color: #00EEEE;">重点产品（9分）</td>	
   <td style="color: #00EEEE" title="取清算表的考核细则">重点手机销售达成率（%）</td>
  <td>${score.keyNotScore}</td>
   <td class="guangzhou1" style="font-size:12px;">${GZgzDte.keyNot}</td>
   <td class="guangzhou2" style="font-size:12px;">${GZgzDte.keyNot}</td>
   <%-- <td class="guangzhou3">${GZgzDte.keyNotScore}</td> --%>
   <c:if test="${GZgzDte.keyNotScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.keyNotScore}</td>
   </c:if>
   <c:if test="${GZgzDte.keyNotScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.keyNotScore}</td>
   </c:if>
   <!-- 肇庆 -->
   <td class="guangzhou1" style="font-size:12px;">${GZzqDte.keyNot}</td>
   <td class="guangzhou2" style="font-size:12px;">${GZzqDte.keyNot}</td>
   <%-- <td class="guangzhou3">${GZzqDte.keyNotScore}</td> --%>
   <c:if test="${GZzqDte.keyNotScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.keyNotScore}</td>
   </c:if>
   <c:if test="${GZzqDte.keyNotScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.keyNotScore}</td>
   </c:if>
   
   <td class="guangzhou1" style="font-size:12px;">${GZqyDte.keyNot}</td>
   <td class="guangzhou2" style="font-size:12px;">${GZqyDte.keyNot}</td>
  <%--  <td class="guangzhou3">${GZqyDte.keyNotScore}</td> --%>
   <c:if test="${GZqyDte.keyNotScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.keyNotScore}</td>
   </c:if>
   <c:if test="${GZqyDte.keyNotScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.keyNotScore}</td>
   </c:if>
   
   <td class="guangzhou1" style="font-size:12px;">${GZsgDte.keyNot}</td>
   <td class="guangzhou2" style="font-size:12px;">${GZsgDte.keyNot}</td>
   <%-- <td class="guangzhou3">${GZsgDte.keyNotScore}</td> --%>
   <c:if test="${GZsgDte.keyNotScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.keyNotScore}</td>
   </c:if>
   <c:if test="${GZsgDte.keyNotScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.keyNotScore}</td>
   </c:if>
   
   <td class="guangzhou1" style="font-size:12px;">${GZyfDte.keyNot}</td>
   <td class="guangzhou2" style="font-size:12px;">${GZyfDte.keyNot}</td>
   <%-- <td class="guangzhou3">${GZyfDte.keyNotScore}</td> --%>
   <c:if test="${GZyfDte.keyNotScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZyfDte.keyNotScore}</td>
   </c:if>
   <c:if test="${GZyfDte.keyNotScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZyfDte.keyNotScore}</td>
   </c:if>
   
   <td class="guangzhou1" style="font-size:12px;">${GZhj1Dte.keyNot}</td>
   <td class="guangzhou2" style="font-size:12px;">${GZhj1Dte.keyNot}</td>
   <%-- <td class="guangzhou3">${GZhj1Dte.keyNotScore}</td> --%>
   <c:if test="${GZhj1Dte.keyNotScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.keyNotScore}</td>
   </c:if>
   <c:if test="${GZhj1Dte.keyNotScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.keyNotScore}</td>
   </c:if>
   <!--深圳-->
   
   <td class="shenzhen1" style="font-size:12px;">${SZszDte.keyNot}</td>
   <td class="shenzhen2" style="font-size:12px;">${SZszDte.keyNot}</td>
   <%-- <td class="shenzhen3">${SZszDte.keyNotScore}</td> --%>
   <c:if test="${SZszDte.keyNotScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.keyNotScore}</td>
   </c:if>
   <c:if test="${SZszDte.keyNotScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.keyNotScore}</td>
   </c:if>
   
   <td class="shenzhen1" style="font-size:12px;">${SZstDte.keyNot}</td>
   <td class="shenzhen2" style="font-size:12px;">${SZstDte.keyNot}</td>
   <%-- <td class="shenzhen3">${SZstDte.keyNotScore}</td> --%>
   <c:if test="${SZstDte.keyNotScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.keyNotScore}</td>
   </c:if>
   <c:if test="${SZstDte.keyNotScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.keyNotScore}</td>
   </c:if>
   
   <td class="shenzhen1" style="font-size:12px;">${SZjyDte.keyNot}</td>
   <td class="shenzhen2" style="font-size:12px;">${SZjyDte.keyNot}</td>
   <%-- <td class="shenzhen3">${SZjyDte.keyNotScore}</td> --%>
   <c:if test="${SZjyDte.keyNotScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.keyNotScore}</td>
   </c:if>
   <c:if test="${SZjyDte.keyNotScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.keyNotScore}</td>
   </c:if>
   
   <td class="shenzhen1" style="font-size:12px;">${SZmzDte.keyNot}</td>
   <td class="shenzhen2" style="font-size:12px;">${SZmzDte.keyNot}</td>
   <%-- <td class="shenzhen3">${SZmzDte.keyNotScore}</td> --%>
   <c:if test="${SZmzDte.keyNotScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.keyNotScore}</td>
   </c:if>
   <c:if test="${SZmzDte.keyNotScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.keyNotScore}</td>
   </c:if>
   
   <td class="shenzhen1" style="font-size:12px;">${SZczDte.keyNot}</td>
   <td class="shenzhen2" style="font-size:12px;">${SZczDte.keyNot}</td>
   <%-- <td class="shenzhen3">${SZczDte.keyNotScore}</td> --%>
   <c:if test="${SZczDte.keyNotScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.keyNotScore}</td>
   </c:if>
   <c:if test="${SZczDte.keyNotScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.keyNotScore}</td>
   </c:if>
   
   <td class="shenzhen1" style="font-size:12px;">${SZswDte.keyNot}</td>
   <td class="shenzhen2" style="font-size:12px;">${SZswDte.keyNot}</td>
   <%-- <td class="shenzhen3">${SZswDte.keyNotScore}</td> --%>
   <c:if test="${SZswDte.keyNotScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.keyNotScore}</td>
   </c:if>
   <c:if test="${SZswDte.keyNotScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.keyNotScore}</td>
   </c:if>
  
   <td class="shenzhen1" style="font-size:12px;">${SZhj2Dte.keyNot}</td>
   <td class="shenzhen2" style="font-size:12px;">${SZhj2Dte.keyNot}</td>
   <%-- <td class="shenzhen3">${SZhj2Dte.keyNotScore}</td> --%>
   <c:if test="${SZhj2Dte.keyNotScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.keyNotScore}</td>
   </c:if>
   <c:if test="${SZhj2Dte.keyNotScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.keyNotScore}</td>
   </c:if>
   
 <!--佛山-->
   <td class="foshan1" style="font-size:12px;">${FSfsDte.keyNot}</td>
   <td class="foshan2" style="font-size:12px;">${FSfsDte.keyNot}</td>
   <%-- <td class="foshan3">${FSfsDte.keyNotScore}</td> --%>
   <c:if test="${FSfsDte.keyNotScore==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.keyNotScore}</td>
   </c:if>
   <c:if test="${FSfsDte.keyNotScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.keyNotScore}</td>
   </c:if>
   
   <td class="foshan1" style="font-size:12px;">${FSjmDte.keyNot}</td>
   <td class="foshan2" style="font-size:12px;">${FSjmDte.keyNot}</td>
   <%-- <td class="foshan3">${FSjmDte.keyNotScore}</td> --%>
   <c:if test="${FSjmDte.keyNotScore==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.keyNotScore}</td>
   </c:if>
   <c:if test="${FSjmDte.keyNotScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.keyNotScore}</td>
   </c:if>
   
   <td class="foshan1" style="font-size:12px;">${FSzzDte.keyNot}</td>
   <td class="foshan2" style="font-size:12px;">${FSzzDte.keyNot}</td>
   <%-- <td class="foshan3">${FSzzDte.keyNotScore}</td> --%>
   <c:if test="${FSzzDte.keyNotScore==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.keyNotScore}</td>
   </c:if>
   <c:if test="${FSzzDte.keyNotScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.keyNotScore}</td>
   </c:if>
   
   <td class="foshan1" style="font-size:12px;">${FSmmDte.keyNot}</td>
   <td class="foshan2" style="font-size:12px;">${FSmmDte.keyNot}</td>
   <%-- <td class="foshan3">${FSmmDte.keyNotScore}</td> --%>
   <c:if test="${FSmmDte.keyNotScore==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.keyNotScore}</td>
   </c:if>
   <c:if test="${FSmmDte.keyNotScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.keyNotScore}</td>
   </c:if>
   
   <td class="foshan1" style="font-size:12px;">${FSyjDte.keyNot}</td>
   <td class="foshan2" style="font-size:12px;">${FSyjDte.keyNot}</td>
   <%-- <td class="foshan3">${FSyjDte.keyNotScore}</td> --%>
   <c:if test="${FSyjDte.keyNotScore==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.keyNotScore}</td>
   </c:if>
   <c:if test="${FSyjDte.keyNotScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.keyNotScore}</td>
   </c:if>
   
   <td class="foshan1" style="font-size:12px;">${FShj4Dte.keyNot}</td>
   <td class="foshan2" style="font-size:12px;">${FShj4Dte.keyNot}</td>
   <%-- <td class="foshan3">${FShj4Dte.keyNotScore}</td> --%>
   <c:if test="${FShj4Dte.keyNotScore==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.keyNotScore}</td>
   </c:if>
   <c:if test="${FShj4Dte.keyNotScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.keyNotScore}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1" style="font-size:12px;">${DGdgDte.keyNot}</td>
   <td class="dongguan2" style="font-size:12px;">${DGdgDte.keyNot}</td>
  <%--  <td class="dongguan3">${DGdgDte.keyNotScore}</td> --%>
   <c:if test="${DGdgDte.keyNotScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.keyNotScore}</td>
   </c:if>
   <c:if test="${DGdgDte.keyNotScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.keyNotScore}</td>
   </c:if>
   
   <td class="dongguan1" style="font-size:12px;">${DGzsDte.keyNot}</td>
   <td class="dongguan2" style="font-size:12px;">${DGzsDte.keyNot}</td>
   <%-- <td class="dongguan3">${DGzsDte.keyNotScore}</td> --%>
   <c:if test="${DGzsDte.keyNotScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.keyNotScore}</td>
   </c:if>
   <c:if test="${DGzsDte.keyNotScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.keyNotScore}</td>
   </c:if>
   
   <td class="dongguan1" style="font-size:12px;">${DGhzDte.keyNot}</td>
   <td class="dongguan2" style="font-size:12px;">${DGhzDte.keyNot}</td>
   <%-- <td class="dongguan3">${DGhzDte.keyNotScore}</td> --%>
   <c:if test="${DGhzDte.keyNotScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.keyNotScore}</td>
   </c:if>
   <c:if test="${DGhzDte.keyNotScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.keyNotScore}</td>
   </c:if>
   
   <td class="dongguan1" style="font-size:12px;">${DGzhDte.keyNot}</td>
   <td class="dongguan2" style="font-size:12px;">${DGzhDte.keyNot}</td>
   <%-- <td class="dongguan3">${DGzhDte.keyNotScore}</td> --%>
   <c:if test="${DGzhDte.keyNotScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.keyNotScore}</td>
   </c:if>
   <c:if test="${DGzhDte.keyNotScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.keyNotScore}</td>
   </c:if>
   
   <td class="dongguan1" style="font-size:12px;">${DGhyDte.keyNot}</td>
   <td class="dongguan2" style="font-size:12px;">${DGhyDte.keyNot}</td>
   <%-- <td class="dongguan3">${DGhyDte.keyNotScore}</td> --%>
   <c:if test="${DGhyDte.keyNotScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.keyNotScore}</td>
   </c:if>
   <c:if test="${DGhyDte.keyNotScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.keyNotScore}</td>
   </c:if>
   
   <td class="dongguan1" style="font-size:12px;">${DGhj3Dte.keyNot}</td>
   <td class="dongguan2" style="font-size:12px;">${DGhj3Dte.keyNot}</td>
   <%-- <td class="dongguan3">${DGhj3Dte.keyNotScore}</td> --%>
   <c:if test="${DGhj3Dte.keyNotScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.keyNotScore}</td>
   </c:if>
   <c:if test="${DGhj3Dte.keyNotScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.keyNotScore}</td>
   </c:if>
   
   </tr> 	
	<!--第一行-->  
   
   <tr>
  
   <td style="color: #00EEEE" title="取清算表的考核细则">重点智能硬件销售达成率（%）</td>
   <td>${score.keyNotScore}</td>
   <td class="guangzhou1" style="font-size:12px;">${GZgzDte.keyNot}</td>
   <td class="guangzhou2" style="font-size:12px;">${GZgzDte.keyNot}</td>
   <%-- <td class="guangzhou3">${GZgzDte.keyNotScore}</td> --%>
   <c:if test="${GZgzDte.keyNotScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.keyNotScore}</td>
   </c:if>
   <c:if test="${GZgzDte.keyNotScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.keyNotScore}</td>
   </c:if>
   <!-- 肇庆 -->
   <td class="guangzhou1" style="font-size:12px;">${GZzqDte.keyNot}</td>
   <td class="guangzhou2" style="font-size:12px;">${GZzqDte.keyNot}</td>
   <%-- <td class="guangzhou3">${GZzqDte.keyNotScore}</td> --%>
   <c:if test="${GZzqDte.keyNotScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.keyNotScore}</td>
   </c:if>
   <c:if test="${GZzqDte.keyNotScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.keyNotScore}</td>
   </c:if>
   
   <td class="guangzhou1" style="font-size:12px;">${GZqyDte.keyNot}</td>
   <td class="guangzhou2" style="font-size:12px;">${GZqyDte.keyNot}</td>
  <%--  <td class="guangzhou3">${GZqyDte.keyNotScore}</td> --%>
   <c:if test="${GZqyDte.keyNotScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.keyNotScore}</td>
   </c:if>
   <c:if test="${GZqyDte.keyNotScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.keyNotScore}</td>
   </c:if>
   
   <td class="guangzhou1" style="font-size:12px;">${GZsgDte.keyNot}</td>
   <td class="guangzhou2" style="font-size:12px;">${GZsgDte.keyNot}</td>
   <%-- <td class="guangzhou3">${GZsgDte.keyNotScore}</td> --%>
   <c:if test="${GZsgDte.keyNotScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.keyNotScore}</td>
   </c:if>
   <c:if test="${GZsgDte.keyNotScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.keyNotScore}</td>
   </c:if>
   
   <td class="guangzhou1" style="font-size:12px;">${GZyfDte.keyNot}</td>
   <td class="guangzhou2" style="font-size:12px;">${GZyfDte.keyNot}</td>
   <%-- <td class="guangzhou3">${GZyfDte.keyNotScore}</td> --%>
   <c:if test="${GZyfDte.keyNotScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZyfDte.keyNotScore}</td>
   </c:if>
   <c:if test="${GZyfDte.keyNotScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZyfDte.keyNotScore}</td>
   </c:if>
   
   <td class="guangzhou1" style="font-size:12px;">${GZhj1Dte.keyNot}</td>
   <td class="guangzhou2" style="font-size:12px;">${GZhj1Dte.keyNot}</td>
   <%-- <td class="guangzhou3">${GZhj1Dte.keyNotScore}</td> --%>
   <c:if test="${GZhj1Dte.keyNotScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.keyNotScore}</td>
   </c:if>
   <c:if test="${GZhj1Dte.keyNotScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.keyNotScore}</td>
   </c:if>
   <!--深圳-->
   
   <td class="shenzhen1" style="font-size:12px;">${SZszDte.keyNot}</td>
   <td class="shenzhen2" style="font-size:12px;">${SZszDte.keyNot}</td>
   <%-- <td class="shenzhen3">${SZszDte.keyNotScore}</td> --%>
   <c:if test="${SZszDte.keyNotScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.keyNotScore}</td>
   </c:if>
   <c:if test="${SZszDte.keyNotScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.keyNotScore}</td>
   </c:if>
   
   <td class="shenzhen1" style="font-size:12px;">${SZstDte.keyNot}</td>
   <td class="shenzhen2" style="font-size:12px;">${SZstDte.keyNot}</td>
   <%-- <td class="shenzhen3">${SZstDte.keyNotScore}</td> --%>
   <c:if test="${SZstDte.keyNotScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.keyNotScore}</td>
   </c:if>
   <c:if test="${SZstDte.keyNotScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.keyNotScore}</td>
   </c:if>
   
   <td class="shenzhen1" style="font-size:12px;">${SZjyDte.keyNot}</td>
   <td class="shenzhen2" style="font-size:12px;">${SZjyDte.keyNot}</td>
   <%-- <td class="shenzhen3">${SZjyDte.keyNotScore}</td> --%>
   <c:if test="${SZjyDte.keyNotScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.keyNotScore}</td>
   </c:if>
   <c:if test="${SZjyDte.keyNotScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.keyNotScore}</td>
   </c:if>
   
   <td class="shenzhen1" style="font-size:12px;">${SZmzDte.keyNot}</td>
   <td class="shenzhen2" style="font-size:12px;">${SZmzDte.keyNot}</td>
   <%-- <td class="shenzhen3">${SZmzDte.keyNotScore}</td> --%>
   <c:if test="${SZmzDte.keyNotScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.keyNotScore}</td>
   </c:if>
   <c:if test="${SZmzDte.keyNotScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.keyNotScore}</td>
   </c:if>
   
   <td class="shenzhen1" style="font-size:12px;">${SZczDte.keyNot}</td>
   <td class="shenzhen2" style="font-size:12px;">${SZczDte.keyNot}</td>
   <%-- <td class="shenzhen3">${SZczDte.keyNotScore}</td> --%>
   <c:if test="${SZczDte.keyNotScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.keyNotScore}</td>
   </c:if>
   <c:if test="${SZczDte.keyNotScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.keyNotScore}</td>
   </c:if>
   
   <td class="shenzhen1" style="font-size:12px;">${SZswDte.keyNot}</td>
   <td class="shenzhen2" style="font-size:12px;">${SZswDte.keyNot}</td>
   <%-- <td class="shenzhen3">${SZswDte.keyNotScore}</td> --%>
   <c:if test="${SZswDte.keyNotScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.keyNotScore}</td>
   </c:if>
   <c:if test="${SZswDte.keyNotScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.keyNotScore}</td>
   </c:if>
  
   <td class="shenzhen1" style="font-size:12px;">${SZhj2Dte.keyNot}</td>
   <td class="shenzhen2" style="font-size:12px;">${SZhj2Dte.keyNot}</td>
   <%-- <td class="shenzhen3">${SZhj2Dte.keyNotScore}</td> --%>
   <c:if test="${SZhj2Dte.keyNotScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.keyNotScore}</td>
   </c:if>
   <c:if test="${SZhj2Dte.keyNotScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.keyNotScore}</td>
   </c:if>
   
 <!--佛山-->
   <td class="foshan1" style="font-size:12px;">${FSfsDte.keyNot}</td>
   <td class="foshan2" style="font-size:12px;">${FSfsDte.keyNot}</td>
   <%-- <td class="foshan3">${FSfsDte.keyNotScore}</td> --%>
   <c:if test="${FSfsDte.keyNotScore==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.keyNotScore}</td>
   </c:if>
   <c:if test="${FSfsDte.keyNotScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.keyNotScore}</td>
   </c:if>
   
   <td class="foshan1" style="font-size:12px;">${FSjmDte.keyNot}</td>
   <td class="foshan2" style="font-size:12px;">${FSjmDte.keyNot}</td>
   <%-- <td class="foshan3">${FSjmDte.keyNotScore}</td> --%>
   <c:if test="${FSjmDte.keyNotScore==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.keyNotScore}</td>
   </c:if>
   <c:if test="${FSjmDte.keyNotScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.keyNotScore}</td>
   </c:if>
   
   <td class="foshan1" style="font-size:12px;">${FSzzDte.keyNot}</td>
   <td class="foshan2" style="font-size:12px;">${FSzzDte.keyNot}</td>
   <%-- <td class="foshan3">${FSzzDte.keyNotScore}</td> --%>
   <c:if test="${FSzzDte.keyNotScore==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.keyNotScore}</td>
   </c:if>
   <c:if test="${FSzzDte.keyNotScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.keyNotScore}</td>
   </c:if>
   
   <td class="foshan1" style="font-size:12px;">${FSmmDte.keyNot}</td>
   <td class="foshan2" style="font-size:12px;">${FSmmDte.keyNot}</td>
   <%-- <td class="foshan3">${FSmmDte.keyNotScore}</td> --%>
   <c:if test="${FSmmDte.keyNotScore==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.keyNotScore}</td>
   </c:if>
   <c:if test="${FSmmDte.keyNotScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.keyNotScore}</td>
   </c:if>
   
   <td class="foshan1" style="font-size:12px;">${FSyjDte.keyNot}</td>
   <td class="foshan2" style="font-size:12px;">${FSyjDte.keyNot}</td>
   <%-- <td class="foshan3">${FSyjDte.keyNotScore}</td> --%>
   <c:if test="${FSyjDte.keyNotScore==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.keyNotScore}</td>
   </c:if>
   <c:if test="${FSyjDte.keyNotScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.keyNotScore}</td>
   </c:if>
   
   <td class="foshan1" style="font-size:12px;">${FShj4Dte.keyNot}</td>
   <td class="foshan2" style="font-size:12px;">${FShj4Dte.keyNot}</td>
   <%-- <td class="foshan3">${FShj4Dte.keyNotScore}</td> --%>
   <c:if test="${FShj4Dte.keyNotScore==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.keyNotScore}</td>
   </c:if>
   <c:if test="${FShj4Dte.keyNotScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.keyNotScore}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1" style="font-size:12px;">${DGdgDte.keyNot}</td>
   <td class="dongguan2" style="font-size:12px;">${DGdgDte.keyNot}</td>
  <%--  <td class="dongguan3">${DGdgDte.keyNotScore}</td> --%>
   <c:if test="${DGdgDte.keyNotScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.keyNotScore}</td>
   </c:if>
   <c:if test="${DGdgDte.keyNotScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.keyNotScore}</td>
   </c:if>
   
   <td class="dongguan1" style="font-size:12px;">${DGzsDte.keyNot}</td>
   <td class="dongguan2" style="font-size:12px;">${DGzsDte.keyNot}</td>
   <%-- <td class="dongguan3">${DGzsDte.keyNotScore}</td> --%>
   <c:if test="${DGzsDte.keyNotScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.keyNotScore}</td>
   </c:if>
   <c:if test="${DGzsDte.keyNotScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.keyNotScore}</td>
   </c:if>
   
   <td class="dongguan1" style="font-size:12px;">${DGhzDte.keyNot}</td>
   <td class="dongguan2" style="font-size:12px;">${DGhzDte.keyNot}</td>
   <%-- <td class="dongguan3">${DGhzDte.keyNotScore}</td> --%>
   <c:if test="${DGhzDte.keyNotScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.keyNotScore}</td>
   </c:if>
   <c:if test="${DGhzDte.keyNotScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.keyNotScore}</td>
   </c:if>
   
   <td class="dongguan1" style="font-size:12px;">${DGzhDte.keyNot}</td>
   <td class="dongguan2" style="font-size:12px;">${DGzhDte.keyNot}</td>
   <%-- <td class="dongguan3">${DGzhDte.keyNotScore}</td> --%>
   <c:if test="${DGzhDte.keyNotScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.keyNotScore}</td>
   </c:if>
   <c:if test="${DGzhDte.keyNotScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.keyNotScore}</td>
   </c:if>
   
   <td class="dongguan1" style="font-size:12px;">${DGhyDte.keyNot}</td>
   <td class="dongguan2" style="font-size:12px;">${DGhyDte.keyNot}</td>
   <%-- <td class="dongguan3">${DGhyDte.keyNotScore}</td> --%>
   <c:if test="${DGhyDte.keyNotScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.keyNotScore}</td>
   </c:if>
   <c:if test="${DGhyDte.keyNotScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.keyNotScore}</td>
   </c:if>
   
   <td class="dongguan1" style="font-size:12px;">${DGhj3Dte.keyNot}</td>
   <td class="dongguan2" style="font-size:12px;">${DGhj3Dte.keyNot}</td>
   <%-- <td class="dongguan3">${DGhj3Dte.keyNotScore}</td> --%>
   <c:if test="${DGhj3Dte.keyNotScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.keyNotScore}</td>
   </c:if>
   <c:if test="${DGhj3Dte.keyNotScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.keyNotScore}</td>
   </c:if>
   
   </tr> 			
			
	<!--渠道质量（16分）-->	
		
	 <tr>
   <td  rowspan="2" style="color: #00EEEE">渠道质量（16分）</td>	
   <td style="color: #00EEEE" title="取清算表的考核细则">优质客户目标值（个）</td>
  <td>${score.qualityScore}</td>
   <td class="guangzhou1">${GZgzDte.qualityQuarter}</td>
   <td class="guangzhou2">${GZgzDte.qualityQuarterD}</td>
   <%-- <td class="guangzhou3">${GZgzDte.qualityScore}</td> --%>
   <c:if test="${GZgzDte.qualityScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.qualityScore}</td>
   </c:if>
   <c:if test="${GZgzDte.qualityScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.qualityScore}</td>
   </c:if>
   <!-- 肇庆 -->
   <td class="guangzhou1">${GZzqDte.qualityQuarter}</td>
   <td class="guangzhou2">${GZzqDte.qualityQuarterD}</td>
   <%-- <td class="guangzhou3">${GZzqDte.qualityScore}</td> --%>
   <c:if test="${GZzqDte.qualityScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.qualityScore}</td>
   </c:if>
   <c:if test="${GZzqDte.qualityScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.qualityScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZqyDte.qualityQuarter}</td>
   <td class="guangzhou2">${GZqyDte.qualityQuarterD}</td>
   <%-- <td class="guangzhou3">${GZqyDte.qualityScore}</td> --%>
   <c:if test="${GZqyDte.qualityScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.qualityScore}</td>
   </c:if>
   <c:if test="${GZqyDte.qualityScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.qualityScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZsgDte.qualityQuarter}</td>
   <td class="guangzhou2">${GZsgDte.qualityQuarterD}</td>
   <%-- <td class="guangzhou3">${GZsgDte.qualityScore}</td> --%>
   <c:if test="${GZsgDte.qualityScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.qualityScore}</td>
   </c:if>
   <c:if test="${GZsgDte.qualityScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.qualityScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZyfDte.qualityQuarter}</td>
   <td class="guangzhou2">${GZyfDte.qualityQuarterD}</td>
   <%-- <td class="guangzhou3">${GZyfDte.qualityScore}</td> --%>
   <c:if test="${GZyfDte.qualityScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZyfDte.qualityScore}</td>
   </c:if>
   <c:if test="${GZyfDte.qualityScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZyfDte.qualityScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZhj1Dte.qualityQuarter}</td>
   <td class="guangzhou2">${GZhj1Dte.qualityQuarterD}</td>
   <%-- <td class="guangzhou3">${GZhj1Dte.qualityScore}</td> --%>
   <c:if test="${GZhj1Dte.qualityScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.qualityScore}</td>
   </c:if>
   <c:if test="${GZhj1Dte.qualityScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.qualityScore}</td>
   </c:if>
    
   <!--深圳-->
   <td class="shenzhen1">${SZszDte.qualityQuarter}</td>
   <td class="shenzhen2">${SZszDte.qualityQuarterD}</td>
   <%-- <td class="shenzhen3">${SZszDte.qualityScore}</td> --%>
   <c:if test="${SZszDte.qualityScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.qualityScore}</td>
   </c:if>
   <c:if test="${SZszDte.qualityScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.qualityScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZstDte.qualityQuarter}</td>
   <td class="shenzhen2">${SZstDte.qualityQuarterD}</td>
   <%-- <td class="shenzhen3">${SZstDte.qualityScore}</td> --%>
   <c:if test="${SZstDte.qualityScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.qualityScore}</td>
   </c:if>
   <c:if test="${SZstDte.qualityScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.qualityScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZjyDte.qualityQuarter}</td>
   <td class="shenzhen2">${SZjyDte.qualityQuarterD}</td>
   <%-- <td class="shenzhen3">${SZjyDte.qualityScore}</td> --%>
   <c:if test="${SZjyDte.qualityScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.qualityScore}</td>
   </c:if>
   <c:if test="${SZjyDte.qualityScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.qualityScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZmzDte.qualityQuarter}</td>
   <td class="shenzhen2">${SZmzDte.qualityQuarterD}</td>
   <%-- <td class="shenzhen3">${SZmzDte.qualityScore}</td> --%>
   <c:if test="${SZmzDte.qualityScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.qualityScore}</td>
   </c:if>
   <c:if test="${SZmzDte.qualityScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.qualityScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZczDte.qualityQuarter}</td>
   <td class="shenzhen2">${SZczDte.qualityQuarterD}</td>
   <%-- <td class="shenzhen3">${SZczDte.qualityScore}</td> --%>
   <c:if test="${SZczDte.qualityScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.qualityScore}</td>
   </c:if>
   <c:if test="${SZczDte.qualityScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.qualityScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZswDte.qualityQuarter}</td>
   <td class="shenzhen2">${SZswDte.qualityQuarterD}</td>
   <%-- <td class="shenzhen3">${SZswDte.qualityScore}</td> --%>
   <c:if test="${SZswDte.qualityScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.qualityScore}</td>
   </c:if>
   <c:if test="${SZswDte.qualityScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.qualityScore}</td>
   </c:if>
  
   <td class="shenzhen1">${SZhj2Dte.qualityQuarter}</td>
   <td class="shenzhen2">${SZhj2Dte.qualityQuarterD}</td>
   <%-- <td class="shenzhen3">${SZhj2Dte.qualityScore}</td> --%>
   <c:if test="${SZhj2Dte.qualityScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.qualityScore}</td>
   </c:if>
   <c:if test="${SZhj2Dte.qualityScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.qualityScore}</td>
   </c:if>
   
 <!--佛山-->
   <td class="foshan1">${FSfsDte.qualityQuarter}</td>
   <td class="foshan2">${FSfsDte.qualityQuarterD}</td>
   <%-- <td class="foshan3">${FSfsDte.qualityScore}</td> --%>
   <c:if test="${FSfsDte.qualityScore==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.qualityScore}</td>
   </c:if>
   <c:if test="${FSfsDte.qualityScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.qualityScore}</td>
   </c:if>
   
   <td class="foshan1">${FSjmDte.qualityQuarter}</td>
   <td class="foshan2">${FSjmDte.qualityQuarterD}</td>
   <%-- <td class="foshan3">${FSjmDte.qualityScore}</td> --%>
   <c:if test="${FSjmDte.qualityScore==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.qualityScore}</td>
   </c:if>
   <c:if test="${FSjmDte.qualityScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.qualityScore}</td>
   </c:if>
   
   <td class="foshan1">${FSzzDte.qualityQuarter}</td>
   <td class="foshan2">${FSzzDte.qualityQuarterD}</td>
   <%-- <td class="foshan3">${FSzzDte.qualityScore}</td> --%>
   <c:if test="${FSzzDte.qualityScore==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.qualityScore}</td>
   </c:if>
   <c:if test="${FSzzDte.qualityScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.qualityScore}</td>
   </c:if>
   
   <td class="foshan1">${FSmmDte.qualityQuarter}</td>
   <td class="foshan2">${FSmmDte.qualityQuarterD}</td>
   <%-- <td class="foshan3">${FSmmDte.qualityScore}</td> --%>
   <c:if test="${FSmmDte.qualityScore==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.qualityScore}</td>
   </c:if>
   <c:if test="${FSmmDte.qualityScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.qualityScore}</td>
   </c:if>
   
   <td class="foshan1">${FSyjDte.qualityQuarter}</td>
   <td class="foshan2">${FSyjDte.qualityQuarterD}</td>
   <%-- <td class="foshan3">${FSyjDte.qualityScore}</td> --%>
   <c:if test="${FSyjDte.qualityScore==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.qualityScore}</td>
   </c:if>
   <c:if test="${FSyjDte.qualityScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.qualityScore}</td>
   </c:if>
   
   <td class="foshan1">${FShj4Dte.qualityQuarter}</td>
   <td class="foshan2">${FShj4Dte.qualityQuarterD}</td>
   <%-- <td class="foshan3">${FShj4Dte.qualityScore}</td> --%>
   <c:if test="${FShj4Dte.qualityScore==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.qualityScore}</td>
   </c:if>
   <c:if test="${FShj4Dte.qualityScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.qualityScore}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1">${DGdgDte.qualityQuarter}</td>
   <td class="dongguan2">${DGdgDte.qualityQuarterD}</td>
   <%-- <td class="dongguan3">${DGdgDte.qualityScore}</td> --%>
   <c:if test="${DGdgDte.qualityScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.qualityScore}</td>
   </c:if>
   <c:if test="${DGdgDte.qualityScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.qualityScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzsDte.qualityQuarter}</td>
   <td class="dongguan2">${DGzsDte.qualityQuarterD}</td>
   <%-- <td class="dongguan3">${DGzsDte.qualityScore}</td> --%>
   <c:if test="${DGzsDte.qualityScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.qualityScore}</td>
   </c:if>
   <c:if test="${DGzsDte.qualityScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.qualityScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhzDte.qualityQuarter}</td>
   <td class="dongguan2">${DGhzDte.qualityQuarterD}</td>
   <%-- <td class="dongguan3">${DGhzDte.qualityScore}</td> --%>
   <c:if test="${DGhzDte.qualityScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.qualityScore}</td>
   </c:if>
   <c:if test="${DGhzDte.qualityScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.qualityScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzhDte.qualityQuarter}</td>
   <td class="dongguan2">${DGzhDte.qualityQuarterD}</td>
   <%-- <td class="dongguan3">${DGzhDte.qualityScore}</td> --%>
   <c:if test="${DGzhDte.qualityScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.qualityScore}</td>
   </c:if>
   <c:if test="${DGzhDte.qualityScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.qualityScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhyDte.qualityQuarter}</td>
   <td class="dongguan2">${DGhyDte.qualityQuarterD}</td>
   <%-- <td class="dongguan3">${DGhyDte.qualityScore}</td> --%>
   <c:if test="${DGhyDte.qualityScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.qualityScore}</td>
   </c:if>
   <c:if test="${DGhyDte.qualityScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.qualityScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhj3Dte.qualityQuarter}</td>
   <td class="dongguan2">${DGhj3Dte.qualityQuarterD}</td>
   <%-- <td class="dongguan3">${DGhj3Dte.qualityScore}</td> --%>
   <c:if test="${DGhj3Dte.qualityScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.qualityScore}</td>
   </c:if>
   <c:if test="${DGhj3Dte.qualityScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.qualityScore}</td>
   </c:if>
   
   </tr> 	
	<!--第一行-->  
   
   <tr>
  
   <td style="color: #00EEEE" title="取清算表的考核细则">KA客户手机销量目标值（台）</td>
 <td>${score.kAcustomerScore}</td>
   <td class="guangzhou1">${GZgzDte.kAcustomerQuarterD}</td>
   <td class="guangzhou2">${GZgzDte.kAcustomerRate}</td>
   <%-- <td class="guangzhou3">${GZgzDte.kAcustomerScore}</td> --%>
   <c:if test="${GZgzDte.kAcustomerScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${GZgzDte.kAcustomerScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.kAcustomerScore}</td>
   </c:if>
   <!-- 肇庆 -->
   <td class="guangzhou1">${GZzqDte.kAcustomerQuarterD}</td>
   <td class="guangzhou2">${GZzqDte.kAcustomerRate}</td>
   <%-- <td class="guangzhou3">${GZzqDte.kAcustomerScore}</td> --%>
   <c:if test="${GZzqDte.kAcustomerScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${GZzqDte.kAcustomerScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZqyDte.kAcustomerQuarterD}</td>
   <td class="guangzhou2">${GZqyDte.kAcustomerRate}</td>
   <%-- <td class="guangzhou3">${GZqyDte.kAcustomerScore}</td> --%>
   <c:if test="${GZqyDte.kAcustomerScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${GZqyDte.kAcustomerScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZsgDte.kAcustomerQuarterD}</td>
   <td class="guangzhou2">${GZsgDte.kAcustomerRate}</td>
   <%-- <td class="guangzhou3">${GZsgDte.kAcustomerScore}</td> --%>
   <c:if test="${GZsgDte.kAcustomerScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${GZsgDte.kAcustomerScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZyfDte.kAcustomerQuarterD}</td>
   <td class="guangzhou2">${GZyfDte.kAcustomerRate}</td>
   <%-- <td class="guangzhou3">${GZyfDte.kAcustomerScore}</td> --%>
   <c:if test="${GZyfDte.kAcustomerScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZyfDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${GZyfDte.kAcustomerScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZyfDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZhj1Dte.kAcustomerQuarterD}</td>
   <td class="guangzhou2">${GZhj1Dte.kAcustomerRate}</td>
   <%-- <td class="guangzhou3">${GZhj1Dte.kAcustomerScore}</td> --%>
   <c:if test="${GZhj1Dte.kAcustomerScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${GZhj1Dte.kAcustomerScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.kAcustomerScore}</td>
   </c:if>
   <!--深圳-->
   
   <td class="shenzhen1">${SZszDte.kAcustomerQuarterD}</td>
   <td class="shenzhen2">${SZszDte.kAcustomerRate}</td>
   <%-- <td class="shenzhen3">${SZszDte.kAcustomerScore}</td> --%>
   <c:if test="${SZszDte.kAcustomerScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${SZszDte.kAcustomerScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZstDte.kAcustomerQuarterD}</td>
   <td class="shenzhen2">${SZstDte.kAcustomerRate}</td>
   <%-- <td class="shenzhen3">${SZstDte.kAcustomerScore}</td> --%>
   <c:if test="${SZstDte.kAcustomerScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${SZstDte.kAcustomerScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZjyDte.kAcustomerQuarterD}</td>
   <td class="shenzhen2">${SZjyDte.kAcustomerRate}</td>
   <%-- <td class="shenzhen3">${SZjyDte.kAcustomerScore}</td> --%>
   <c:if test="${SZjyDte.kAcustomerScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${SZjyDte.kAcustomerScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZmzDte.kAcustomerQuarterD}</td>
   <td class="shenzhen2">${SZmzDte.kAcustomerRate}</td>
   <%-- <td class="shenzhen3">${SZmzDte.kAcustomerScore}</td> --%>
   <c:if test="${SZmzDte.kAcustomerScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${SZmzDte.kAcustomerScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZczDte.kAcustomerQuarterD}</td>
   <td class="shenzhen2">${SZczDte.kAcustomerRate}</td>
   <%-- <td class="shenzhen3">${SZczDte.kAcustomerScore}</td> --%>
   <c:if test="${SZczDte.kAcustomerScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${SZczDte.kAcustomerScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZswDte.kAcustomerQuarterD}</td>
   <td class="shenzhen2">${SZswDte.kAcustomerRate}</td>
   <%-- <td class="shenzhen3">${SZswDte.kAcustomerScore}</td> --%>
   <c:if test="${SZswDte.kAcustomerScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${SZswDte.kAcustomerScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.kAcustomerScore}</td>
   </c:if>
  
   <td class="shenzhen1">${SZhj2Dte.kAcustomerQuarterD}</td>
   <td class="shenzhen2">${SZhj2Dte.kAcustomerRate}</td>
   <%-- <td class="shenzhen3">${SZhj2Dte.kAcustomerScore}</td> --%>
   <c:if test="${SZhj2Dte.kAcustomerScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${SZhj2Dte.kAcustomerScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.kAcustomerScore}</td>
   </c:if>
  
 <!--佛山-->
   <td class="foshan1">${FSfsDte.kAcustomerQuarterD}</td>
   <td class="foshan2">${FSfsDte.kAcustomerRate}</td>
   <%-- <td class="foshan3">${FSfsDte.kAcustomerScore}</td> --%>
   <c:if test="${FSfsDte.kAcustomerScore==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${FSfsDte.kAcustomerScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="foshan1">${FSjmDte.kAcustomerQuarterD}</td>
   <td class="foshan2">${FSjmDte.kAcustomerRate}</td>
   <%-- <td class="foshan3">${FSjmDte.kAcustomerScore}</td> --%>
   <c:if test="${FSjmDte.kAcustomerScore==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${FSjmDte.kAcustomerScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="foshan1">${FSzzDte.kAcustomerQuarterD}</td>
   <td class="foshan2">${FSzzDte.kAcustomerRate}</td>
   <%-- <td class="foshan3">${FSzzDte.kAcustomerScore}</td> --%>
   <c:if test="${FSzzDte.kAcustomerScore==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${FSzzDte.kAcustomerScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="foshan1">${FSmmDte.kAcustomerQuarterD}</td>
   <td class="foshan2">${FSmmDte.kAcustomerRate}</td>
   <%-- <td class="foshan3">${FSmmDte.kAcustomerScore}</td> --%>
   <c:if test="${FSmmDte.kAcustomerScore==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${FSmmDte.kAcustomerScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="foshan1">${FSyjDte.kAcustomerQuarterD}</td>
   <td class="foshan2">${FSyjDte.kAcustomerRate}</td>
   <%-- <td class="foshan3">${FSyjDte.kAcustomerScore}</td> --%>
   <c:if test="${FSyjDte.kAcustomerScore==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${FSyjDte.kAcustomerScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="foshan1">${FShj4Dte.kAcustomerQuarterD}</td>
   <td class="foshan2">${FShj4Dte.kAcustomerRate}</td>
   <%-- <td class="foshan3">${FShj4Dte.kAcustomerScore}</td> --%>
   <c:if test="${FShj4Dte.kAcustomerScore==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${FShj4Dte.kAcustomerScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.kAcustomerScore}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1">${DGdgDte.kAcustomerQuarterD}</td>
   <td class="dongguan2">${DGdgDte.kAcustomerRate}</td>
   <%-- <td class="dongguan3">${DGdgDte.kAcustomerScore}</td> --%>
   <c:if test="${DGdgDte.kAcustomerScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${DGdgDte.kAcustomerScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzsDte.kAcustomerQuarterD}</td>
   <td class="dongguan2">${DGzsDte.kAcustomerRate}</td>
   <%-- <td class="dongguan3">${DGzsDte.kAcustomerScore}</td> --%>
   <c:if test="${DGzsDte.kAcustomerScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${DGzsDte.kAcustomerScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhzDte.kAcustomerQuarterD}</td>
   <td class="dongguan2">${DGhzDte.kAcustomerRate}</td>
   <%-- <td class="dongguan3">${DGhzDte.kAcustomerScore}</td> --%>
   <c:if test="${DGhzDte.kAcustomerScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${DGhzDte.kAcustomerScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzhDte.kAcustomerQuarterD}</td>
   <td class="dongguan2">${DGzhDte.kAcustomerRate}</td>
   <%-- <td class="dongguan3">${DGzhDte.kAcustomerScore}</td> --%>
   <c:if test="${DGzhDte.kAcustomerScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${DGzhDte.kAcustomerScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhyDte.kAcustomerQuarterD}</td>
   <td class="dongguan2">${DGhyDte.kAcustomerRate}</td>
   <%-- <td class="dongguan3">${DGhyDte.kAcustomerScore}</td> --%>
   <c:if test="${DGhyDte.kAcustomerScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${DGhyDte.kAcustomerScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.kAcustomerScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhj3Dte.kAcustomerQuarterD}</td>
   <td class="dongguan2">${DGhj3Dte.kAcustomerRate}</td>
   <%-- <td class="dongguan3">${DGhj3Dte.kAcustomerScore}</td> --%>
   <c:if test="${DGhj3Dte.kAcustomerScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.kAcustomerScore}</td>
   </c:if>
   <c:if test="${DGhj3Dte.kAcustomerScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.kAcustomerScore}</td>
   </c:if>
   
   </tr> 			
	
	<!--铁通-->
	
	   <tr>
  
   <td style="color: #00EEEE">铁通（5分）</td>
   <td style="color: #00EEEE" title="取清算表的考核细则">铁通终端销量（万台）</td>
   <td>${score.tieTongScore}</td>
   <td class="guangzhou1">${GZgzDte.tieTongQuarter}</td>
   <td class="guangzhou2">${GZgzDte.tieTongQuarterD}</td>
   <%-- <td class="guangzhou3">${GZgzDte.tieTongScore}</td> --%>
   <c:if test="${GZgzDte.tieTongScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.tieTongScore}</td>
   </c:if>
   <c:if test="${GZgzDte.tieTongScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.tieTongScore}</td>
   </c:if>
   <!-- 肇庆 -->
   <td class="guangzhou1">${GZzqDte.tieTongQuarter}</td>
   <td class="guangzhou2">${GZzqDte.tieTongQuarterD}</td>
   <%-- <td class="guangzhou3">${GZzqDte.tieTongScore}</td> --%>
   <c:if test="${GZzqDte.tieTongScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.tieTongScore}</td>
   </c:if>
   <c:if test="${GZzqDte.tieTongScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.tieTongScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZqyDte.tieTongQuarter}</td>
   <td class="guangzhou2">${GZqyDte.tieTongQuarterD}</td>
   <%-- <td class="guangzhou3">${GZqyDte.tieTongScore}</td> --%>
   <c:if test="${GZqyDte.tieTongScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.tieTongScore}</td>
   </c:if>
   <c:if test="${GZqyDte.tieTongScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.tieTongScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZsgDte.tieTongQuarter}</td>
   <td class="guangzhou2">${GZsgDte.tieTongQuarterD}</td>
   <%-- <td class="guangzhou3">${GZsgDte.tieTongScore}</td> --%>
   <c:if test="${GZsgDte.tieTongScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.tieTongScore}</td>
   </c:if>
   <c:if test="${GZsgDte.tieTongScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.tieTongScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZyfDte.tieTongQuarter}</td>
   <td class="guangzhou2">${GZyfDte.tieTongQuarterD}</td>
   <%-- <td class="guangzhou3">${GZyfDte.tieTongScore}</td> --%>
   <c:if test="${GZyfDte.tieTongScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZyfDte.tieTongScore}</td>
   </c:if>
   <c:if test="${GZyfDte.tieTongScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZyfDte.tieTongScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZhj1Dte.tieTongQuarter}</td>
   <td class="guangzhou2">${GZhj1Dte.tieTongQuarterD}</td>
   <%-- <td class="guangzhou3">${GZhj1Dte.tieTongScore}</td> --%>
   <c:if test="${GZhj1Dte.tieTongScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.tieTongScore}</td>
   </c:if>
   <c:if test="${GZhj1Dte.tieTongScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.tieTongScore}</td>
   </c:if>
   <!--深圳-->
   
   <td class="shenzhen1">${SZszDte.tieTongQuarter}</td>
   <td class="shenzhen2">${SZszDte.tieTongQuarterD}</td>
   <%-- <td class="shenzhen3">${SZszDte.tieTongScore}</td> --%>
   <c:if test="${SZszDte.tieTongScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.tieTongScore}</td>
   </c:if>
   <c:if test="${SZszDte.tieTongScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.tieTongScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZstDte.tieTongQuarter}</td>
   <td class="shenzhen2">${SZstDte.tieTongQuarterD}</td>
   <%-- <td class="shenzhen3">${SZstDte.tieTongScore}</td> --%>
   <c:if test="${SZstDte.tieTongScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.tieTongScore}</td>
   </c:if>
   <c:if test="${SZstDte.tieTongScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.tieTongScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZjyDte.tieTongQuarter}</td>
   <td class="shenzhen2">${SZjyDte.tieTongQuarterD}</td>
   <%-- <td class="shenzhen3">${SZjyDte.tieTongScore}</td> --%>
   <c:if test="${SZjyDte.tieTongScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.tieTongScore}</td>
   </c:if>
   <c:if test="${SZjyDte.tieTongScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.tieTongScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZmzDte.tieTongQuarter}</td>
   <td class="shenzhen2">${SZmzDte.tieTongQuarterD}</td>
   <%-- <td class="shenzhen3">${SZmzDte.tieTongScore}</td> --%>
   <c:if test="${SZmzDte.tieTongScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.tieTongScore}</td>
   </c:if>
   <c:if test="${SZmzDte.tieTongScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.tieTongScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZczDte.tieTongQuarter}</td>
   <td class="shenzhen2">${SZczDte.tieTongQuarterD}</td>
   <%-- <td class="shenzhen3">${SZczDte.tieTongScore}</td> --%>
   <c:if test="${SZczDte.tieTongScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.tieTongScore}</td>
   </c:if>
   <c:if test="${SZczDte.tieTongScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.tieTongScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZswDte.tieTongQuarter}</td>
   <td class="shenzhen2">${SZswDte.tieTongQuarterD}</td>
   <%-- <td class="shenzhen3">${SZswDte.tieTongScore}</td> --%>
   <c:if test="${SZswDte.tieTongScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.tieTongScore}</td>
   </c:if>
   <c:if test="${SZswDte.tieTongScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.tieTongScore}</td>
   </c:if>
  
   <td class="shenzhen1">${SZhj2Dte.tieTongQuarter}</td>
   <td class="shenzhen2">${SZhj2Dte.tieTongQuarterD}</td>
   <%-- <td class="shenzhen3">${SZhj2Dte.tieTongScore}</td> --%>
   <c:if test="${SZhj2Dte.tieTongScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.tieTongScore}</td>
   </c:if>
   <c:if test="${SZhj2Dte.tieTongScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.tieTongScore}</td>
   </c:if>
   
 <!--佛山-->
   <td class="foshan1">${FSfsDte.tieTongQuarter}</td>
   <td class="foshan2">${FSfsDte.tieTongQuarterD}</td>
   <%-- <td class="foshan3">${FSfsDte.tieTongScore}</td> --%>
   <c:if test="${FSfsDte.tieTongScore==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.tieTongScore}</td>
   </c:if>
   <c:if test="${FSfsDte.tieTongScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.tieTongScore}</td>
   </c:if>
   
   <td class="foshan1">${FSjmDte.tieTongQuarter}</td>
   <td class="foshan2">${FSjmDte.tieTongQuarterD}</td>
   <%-- <td class="foshan3">${FSjmDte.tieTongScore}</td> --%>
   <c:if test="${FSjmDte.tieTongScore==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.tieTongScore}</td>
   </c:if>
   <c:if test="${FSjmDte.tieTongScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.tieTongScore}</td>
   </c:if>
   
   <td class="foshan1">${FSzzDte.tieTongQuarter}</td>
   <td class="foshan2">${FSzzDte.tieTongQuarterD}</td>
   <%-- <td class="foshan3">${FSzzDte.tieTongScore}</td> --%>
   <c:if test="${FSzzDte.tieTongScore==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.tieTongScore}</td>
   </c:if>
   <c:if test="${FSzzDte.tieTongScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.tieTongScore}</td>
   </c:if>
   
   <td class="foshan1">${FSmmDte.tieTongQuarter}</td>
   <td class="foshan2">${FSmmDte.tieTongQuarterD}</td>
   <%-- <td class="foshan3">${FSmmDte.tieTongScore}</td> --%>
   <c:if test="${FSmmDte.tieTongScore==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.tieTongScore}</td>
   </c:if>
   <c:if test="${FSmmDte.tieTongScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.tieTongScore}</td>
   </c:if>
   
   <td class="foshan1">${FSyjDte.tieTongQuarter}</td>
   <td class="foshan2">${FSyjDte.tieTongQuarterD}</td>
   <%-- <td class="foshan3">${FSyjDte.tieTongScore}</td> --%>
   <c:if test="${FSyjDte.tieTongScore==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.tieTongScore}</td>
   </c:if>
   <c:if test="${FSyjDte.tieTongScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.tieTongScore}</td>
   </c:if>
   
   <td class="foshan1">${FShj4Dte.tieTongQuarter}</td>
   <td class="foshan2">${FShj4Dte.tieTongQuarterD}</td>
   <%-- <td class="foshan3">${FShj4Dte.tieTongScore}</td> --%>
   <c:if test="${FShj4Dte.tieTongScore==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.tieTongScore}</td>
   </c:if>
   <c:if test="${FShj4Dte.tieTongScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.tieTongScore}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1">${DGdgDte.tieTongQuarter}</td>
   <td class="dongguan2">${DGdgDte.tieTongQuarterD}</td>
   <%-- <td class="dongguan3">${DGdgDte.tieTongScore}</td> --%>
   <c:if test="${DGdgDte.tieTongScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.tieTongScore}</td>
   </c:if>
   <c:if test="${DGdgDte.tieTongScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.tieTongScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzsDte.tieTongQuarter}</td>
   <td class="dongguan2">${DGzsDte.tieTongQuarterD}</td>
   <%-- <td class="dongguan3">${DGzsDte.tieTongScore}</td> --%>
   <c:if test="${DGzsDte.tieTongScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.tieTongScore}</td>
   </c:if>
   <c:if test="${DGzsDte.tieTongScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.tieTongScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhzDte.tieTongQuarter}</td>
   <td class="dongguan2">${DGhzDte.tieTongQuarterD}</td>
   <%-- <td class="dongguan3">${DGhzDte.tieTongScore}</td> --%>
   <c:if test="${DGhzDte.tieTongScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.tieTongScore}</td>
   </c:if>
   <c:if test="${DGhzDte.tieTongScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.tieTongScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzhDte.tieTongQuarter}</td>
   <td class="dongguan2">${DGzhDte.tieTongQuarterD}</td>
   <%-- <td class="dongguan3">${DGzhDte.tieTongScore}</td> --%>
   <c:if test="${DGzhDte.tieTongScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.tieTongScore}</td>
   </c:if>
   <c:if test="${DGzhDte.tieTongScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.tieTongScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhyDte.tieTongQuarter}</td>
   <td class="dongguan2">${DGhyDte.tieTongQuarterD}</td>
   <%-- <td class="dongguan3">${DGhyDte.tieTongScore}</td> --%>
   <c:if test="${DGhyDte.tieTongScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.tieTongScore}</td>
   </c:if>
   <c:if test="${DGhyDte.tieTongScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.tieTongScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhj3Dte.tieTongQuarter}</td>
   <td class="dongguan2">${DGhj3Dte.tieTongQuarterD}</td>
   <%-- <td class="dongguan3">${DGhj3Dte.tieTongScore}</td> --%>
   <c:if test="${DGhj3Dte.tieTongScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.tieTongScore}</td>
   </c:if>
   <c:if test="${DGhj3Dte.tieTongScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.tieTongScore}</td>
   </c:if>
   </tr>
	
	<!--加减分类-->	
	   <tr>
  
   <td rowspan="5" style="color: #EEB422">加减分类</td>
   <td style="color: #EEB422" title="取清算表的考核细则">加分项：新零售厅店建设（间）</td>
  <td>${score.sellRetailScore}</td>
   <td class="guangzhou1">${GZgzDte.sellRetail}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZgzDte.sellRetailScore}</td> --%>
   <c:if test="${GZgzDte.sellRetailScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${GZgzDte.sellRetailScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.sellRetailScore}</td>
   </c:if>
   <!-- 肇庆 -->
   <td class="guangzhou1">${GZzqDte.sellRetail}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZzqDte.sellRetailScore}</td> --%>
   <c:if test="${GZzqDte.sellRetailScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${GZzqDte.sellRetailScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.sellRetailScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZqyDte.sellRetail}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZqyDte.sellRetailScore}</td> --%>
   <c:if test="${GZqyDte.sellRetailScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${GZqyDte.sellRetailScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.sellRetailScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZsgDte.sellRetail}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZsgDte.sellRetailScore}</td> --%>
   <c:if test="${GZsgDte.sellRetailScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${GZsgDte.sellRetailScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.sellRetailScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZyfDte.sellRetail}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZyfDte.sellRetailScore}</td> --%>
   <c:if test="${GZyfDte.sellRetailScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZyfDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${GZyfDte.sellRetailScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZyfDte.sellRetailScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZhj1Dte.sellRetail}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZhj1Dte.sellRetailScore}</td> --%>
   <c:if test="${GZhj1Dte.sellRetailScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.sellRetailScore}</td>
   </c:if>
   <c:if test="${GZhj1Dte.sellRetailScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.sellRetailScore}</td>
   </c:if>
   <!--深圳-->
    
   <td class="shenzhen1">${SZszDte.sellRetail}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZszDte.sellRetailScore}</td> --%>
   <c:if test="${SZszDte.sellRetailScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${SZszDte.sellRetailScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.sellRetailScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZstDte.sellRetail}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZstDte.sellRetailScore}</td> --%>
   <c:if test="${SZstDte.sellRetailScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${SZstDte.sellRetailScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.sellRetailScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZjyDte.sellRetail}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZjyDte.sellRetailScore}</td> --%>
   <c:if test="${SZjyDte.sellRetailScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${SZjyDte.sellRetailScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.sellRetailScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZmzDte.sellRetail}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZmzDte.sellRetailScore}</td> --%>
   <c:if test="${SZmzDte.sellRetailScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${SZmzDte.sellRetailScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.sellRetailScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZczDte.sellRetail}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZczDte.sellRetailScore}</td> --%>
   <c:if test="${SZczDte.sellRetailScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${SZczDte.sellRetailScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.sellRetailScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZswDte.sellRetail}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZswDte.sellRetailScore}</td> --%>
   <c:if test="${SZswDte.sellRetailScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${SZswDte.sellRetailScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.sellRetailScore}</td>
   </c:if>
  
   <td class="shenzhen1">${SZhj2Dte.sellRetail}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZhj2Dte.sellRetailScore}</td> --%>
   <c:if test="${SZhj2Dte.sellRetailScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.sellRetailScore}</td>
   </c:if>
   <c:if test="${SZhj2Dte.sellRetailScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.sellRetailScore}</td>
   </c:if>
   
 <!--佛山-->
   <td class="foshan1">${FSfsDte.sellRetail}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FSfsDte.sellRetailScore}</td> --%>
   <c:if test="${FSfsDte.sellRetailScore==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${FSfsDte.sellRetailScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.sellRetailScore}</td>
   </c:if>
   
   <td class="foshan1">${FSjmDte.sellRetail}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FSjmDte.sellRetailScore}</td> --%>
   <c:if test="${FSjmDte.sellRetailScore==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${FSjmDte.sellRetailScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.sellRetailScore}</td>
   </c:if>
   
   <td class="foshan1">${FSzzDte.sellRetail}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FSzzDte.sellRetailScore}</td> --%>
   <c:if test="${FSzzDte.sellRetailScore==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${FSzzDte.sellRetailScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.sellRetailScore}</td>
   </c:if>
   
   <td class="foshan1">${FSmmDte.sellRetail}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FSmmDte.sellRetailScore}</td> --%>
   <c:if test="${FSmmDte.sellRetailScore==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${FSmmDte.sellRetailScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.sellRetailScore}</td>
   </c:if>
   
   <td class="foshan1">${FSyjDte.sellRetail}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FSyjDte.sellRetailScore}</td> --%>
   <c:if test="${FSyjDte.sellRetailScore==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${FSyjDte.sellRetailScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.sellRetailScore}</td>
   </c:if>
   
   <td class="foshan1">${FShj4Dte.sellRetail}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FShj4Dte.sellRetailScore}</td> --%>
   <c:if test="${FShj4Dte.sellRetailScore==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.sellRetailScore}</td>
   </c:if>
   <c:if test="${FShj4Dte.sellRetailScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.sellRetailScore}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1">${DGdgDte.sellRetail}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGdgDte.sellRetailScore}</td> --%>
   <c:if test="${DGdgDte.sellRetailScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${DGdgDte.sellRetailScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.sellRetailScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzsDte.sellRetail}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGzsDte.sellRetailScore}</td> --%>
   <c:if test="${DGzsDte.sellRetailScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${DGzsDte.sellRetailScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.sellRetailScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhzDte.sellRetail}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGhzDte.sellRetailScore}</td> --%>
   <c:if test="${DGhzDte.sellRetailScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${DGhzDte.sellRetailScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.sellRetailScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzhDte.sellRetail}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGzhDte.sellRetailScore}</td> --%>
   <c:if test="${DGzhDte.sellRetailScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${DGzhDte.sellRetailScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.sellRetailScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhyDte.sellRetail}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGhyDte.sellRetailScore}</td> --%>
   <c:if test="${DGhyDte.sellRetailScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.sellRetailScore}</td>
   </c:if>
   <c:if test="${DGhyDte.sellRetailScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.sellRetailScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhj3Dte.sellRetail}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGhj3Dte.sellRetailScore}</td> --%>
   <c:if test="${DGhj3Dte.sellRetailScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.sellRetailScore}</td>
   </c:if>
   <c:if test="${DGhj3Dte.sellRetailScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.sellRetailScore}</td>
   </c:if>
   </tr>	
		
	   <tr>
  
   <td style="color: #EEB422" title="取清算表的考核细则">加分项：售后净利率（%）</td>
   <td>${score.afterSaleScore}</td>
   <td class="guangzhou1">${GZgzDte.afterSaleQuarter}</td>
   <td class="guangzhou2">${GZgzDte.afterSaleD}</td>
   <%-- <td class="guangzhou3">${GZgzDte.afterSaleScore}</td> --%>
   <c:if test="${GZgzDte.afterSaleScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${GZgzDte.afterSaleScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.afterSaleScore}</td>
   </c:if>
   <!-- 肇庆 -->
   <td class="guangzhou1">${GZzqDte.afterSaleQuarter}</td>
   <td class="guangzhou2">${GZzqDte.afterSaleD}</td>
   <%-- <td class="guangzhou3">${GZzqDte.afterSaleScore}</td> --%>
   <c:if test="${GZzqDte.afterSaleScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${GZzqDte.afterSaleScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.afterSaleScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZqyDte.afterSaleQuarter}</td>
   <td class="guangzhou2">${GZqyDte.afterSaleD}</td>
   <%-- <td class="guangzhou3">${GZqyDte.afterSaleScore}</td> --%>
   <c:if test="${GZqyDte.afterSaleScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${GZqyDte.afterSaleScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.afterSaleScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZsgDte.afterSaleQuarter}</td>
   <td class="guangzhou2">${GZsgDte.afterSaleD}</td>
   <%-- <td class="guangzhou3">${GZsgDte.afterSaleScore}</td> --%>
   <c:if test="${GZsgDte.afterSaleScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${GZsgDte.afterSaleScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.afterSaleScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZyfDte.afterSaleQuarter}</td>
   <td class="guangzhou2">${GZyfDte.afterSaleD}</td>
   <%-- <td class="guangzhou3">${GZyfDte.afterSaleScore}</td> --%>
   <c:if test="${GZyfDte.afterSaleScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZyfDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${GZyfDte.afterSaleScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZyfDte.afterSaleScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZhj1Dte.afterSaleQuarter}</td>
   <td class="guangzhou2">${GZhj1Dte.afterSaleD}</td>
   <%-- <td class="guangzhou3">${GZhj1Dte.afterSaleScore}</td> --%>
   <c:if test="${GZhj1Dte.afterSaleScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.afterSaleScore}</td>
   </c:if>
   <c:if test="${GZhj1Dte.afterSaleScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.afterSaleScore}</td>
   </c:if>
   <!--深圳-->
   
   <td class="shenzhen1">${SZszDte.afterSaleQuarter}</td>
   <td class="shenzhen2">${SZszDte.afterSaleD}</td>
   <%-- <td class="shenzhen3">${SZszDte.afterSaleScore}</td> --%>
   <c:if test="${SZszDte.afterSaleScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${SZszDte.afterSaleScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.afterSaleScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZstDte.afterSaleQuarter}</td>
   <td class="shenzhen2">${SZstDte.afterSaleD}</td>
   <%-- <td class="shenzhen3">${SZstDte.afterSaleScore}</td> --%>
   <c:if test="${SZstDte.afterSaleScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${SZstDte.afterSaleScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.afterSaleScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZjyDte.afterSaleQuarter}</td>
   <td class="shenzhen2">${SZjyDte.afterSaleD}</td>
   <%-- <td class="shenzhen3">${SZjyDte.afterSaleScore}</td> --%>
   <c:if test="${SZjyDte.afterSaleScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${SZjyDte.afterSaleScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.afterSaleScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZmzDte.afterSaleQuarter}</td>
   <td class="shenzhen2">${SZmzDte.afterSaleD}</td>
   <%-- <td class="shenzhen3">${SZmzDte.afterSaleScore}</td> --%>
   <c:if test="${SZmzDte.afterSaleScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${SZmzDte.afterSaleScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.afterSaleScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZczDte.afterSaleQuarter}</td>
   <td class="shenzhen2">${SZczDte.afterSaleD}</td>
   <%-- <td class="shenzhen3">${SZczDte.afterSaleScore}</td> --%>
   <c:if test="${SZczDte.afterSaleScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${SZczDte.afterSaleScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.afterSaleScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZswDte.afterSaleQuarter}</td>
   <td class="shenzhen2">${SZswDte.afterSaleD}</td>
   <%-- <td class="shenzhen3">${SZswDte.afterSaleScore}</td> --%>
   <c:if test="${SZswDte.afterSaleScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${SZswDte.afterSaleScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.afterSaleScore}</td>
   </c:if>
  
   <td class="shenzhen1">${SZhj2Dte.afterSaleQuarter}</td>
   <td class="shenzhen2">${SZhj2Dte.afterSaleD}</td>
   <%-- <td class="shenzhen3">${SZhj2Dte.afterSaleScore}</td> --%>
   <c:if test="${SZhj2Dte.afterSaleScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.afterSaleScore}</td>
   </c:if>
   <c:if test="${SZhj2Dte.afterSaleScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.afterSaleScore}</td>
   </c:if>
   
 <!--佛山-->
   <td class="foshan1">${FSfsDte.afterSaleQuarter}</td>
   <td class="foshan2">${FSfsDte.afterSaleD}</td>
   <%-- <td class="foshan3">${FSfsDte.afterSaleScore}</td> --%>
   <c:if test="${FSfsDte.afterSaleScore==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${FSfsDte.afterSaleScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.afterSaleScore}</td>
   </c:if>
   
   <td class="foshan1">${FSjmDte.afterSaleQuarter}</td>
   <td class="foshan2">${FSjmDte.afterSaleD}</td>
   <%-- <td class="foshan3">${FSjmDte.afterSaleScore}</td> --%>
   <c:if test="${FSjmDte.afterSaleScore==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${FSjmDte.afterSaleScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.afterSaleScore}</td>
   </c:if>
   
   <td class="foshan1">${FSzzDte.afterSaleQuarter}</td>
   <td class="foshan2">${FSzzDte.afterSaleD}</td>
   <%-- <td class="foshan3">${FSzzDte.afterSaleScore}</td> --%>
   <c:if test="${FSzzDte.afterSaleScore==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${FSzzDte.afterSaleScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.afterSaleScore}</td>
   </c:if>
   
   <td class="foshan1">${FSmmDte.afterSaleQuarter}</td>
   <td class="foshan2">${FSmmDte.afterSaleD}</td>
   <%-- <td class="foshan3">${FSmmDte.afterSaleScore}</td> --%>
   <c:if test="${FSmmDte.afterSaleScore==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${FSmmDte.afterSaleScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.afterSaleScore}</td>
   </c:if>
   
   <td class="foshan1">${FSyjDte.afterSaleQuarter}</td>
   <td class="foshan2">${FSyjDte.afterSaleD}</td>
   <%-- <td class="foshan3">${FSyjDte.afterSaleScore}</td> --%>
   <c:if test="${FSyjDte.afterSaleScore==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${FSyjDte.afterSaleScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.afterSaleScore}</td>
   </c:if>
   
   <td class="foshan1">${FShj4Dte.afterSaleQuarter}</td>
   <td class="foshan2">${FShj4Dte.afterSaleD}</td>
   <%-- <td class="foshan3">${FShj4Dte.afterSaleScore}</td> --%>
   <c:if test="${FShj4Dte.afterSaleScore==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.afterSaleScore}</td>
   </c:if>
   <c:if test="${FShj4Dte.afterSaleScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.afterSaleScore}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1">${DGdgDte.afterSaleQuarter}</td>
   <td class="dongguan2">${DGdgDte.afterSaleD}</td>
   <%-- <td class="dongguan3">${DGdgDte.afterSaleScore}</td> --%>
   <c:if test="${DGdgDte.afterSaleScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${DGdgDte.afterSaleScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.afterSaleScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzsDte.afterSaleQuarter}</td>
   <td class="dongguan2">${DGzsDte.afterSaleD}</td>
   <%-- <td class="dongguan3">${DGzsDte.afterSaleScore}</td> --%>
   <c:if test="${DGzsDte.afterSaleScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${DGzsDte.afterSaleScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.afterSaleScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhzDte.afterSaleQuarter}</td>
   <td class="dongguan2">${DGhzDte.afterSaleD}</td>
   <%-- <td class="dongguan3">${DGhzDte.afterSaleScore}</td> --%>
   <c:if test="${DGhzDte.afterSaleScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${DGhzDte.afterSaleScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.afterSaleScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzhDte.afterSaleQuarter}</td>
   <td class="dongguan2">${DGzhDte.afterSaleD}</td>
   <%-- <td class="dongguan3">${DGzhDte.afterSaleScore}</td> --%>
   <c:if test="${DGzhDte.afterSaleScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${DGzhDte.afterSaleScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.afterSaleScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhyDte.afterSaleQuarter}</td>
   <td class="dongguan2">${DGhyDte.afterSaleD}</td>
   <%-- <td class="dongguan3">${DGhyDte.afterSaleScore}</td> --%>
   <c:if test="${DGhyDte.afterSaleScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.afterSaleScore}</td>
   </c:if>
   <c:if test="${DGhyDte.afterSaleScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.afterSaleScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhj3Dte.afterSaleQuarter}</td>
   <td class="dongguan2">${DGhj3Dte.afterSaleD}</td>
   <%-- <td class="dongguan3">${DGhj3Dte.afterSaleScore}</td> --%>
   <c:if test="${DGhj3Dte.afterSaleScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.afterSaleScore}</td>
   </c:if>
   <c:if test="${DGhj3Dte.afterSaleScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.afterSaleScore}</td>
   </c:if>
   
   </tr>	
	   <tr>
  
   <td style="color: #EEB422" title="取清算表的考核细则">直接净利率比高法（%）</td>
   <td>${score.directRateScore}</td>
   <td class="guangzhou1">${GZgzDte.directRate}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZgzDte.directRateScore}</td> --%>
   <c:if test="${GZgzDte.directRateScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.directRateScore}</td>
   </c:if>
   <c:if test="${GZgzDte.directRateScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.directRateScore}</td>
   </c:if>
   <!-- 肇庆 -->
   <td class="guangzhou1">${GZzqDte.directRate}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZzqDte.directRateScore}</td> --%>
   <c:if test="${GZzqDte.directRateScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.directRateScore}</td>
   </c:if>
   <c:if test="${GZzqDte.directRateScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.directRateScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZqyDte.directRate}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZqyDte.directRateScore}</td> --%>
   <c:if test="${GZqyDte.directRateScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.directRateScore}</td>
   </c:if>
   <c:if test="${GZqyDte.directRateScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.directRateScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZsgDte.directRate}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZsgDte.directRateScore}</td> --%>
   <c:if test="${GZsgDte.directRateScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.directRateScore}</td>
   </c:if>
   <c:if test="${GZsgDte.directRateScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.directRateScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZyfDte.directRate}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZyfDte.directRateScore}</td> --%>
   <c:if test="${GZyfDte.directRateScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.directRateScore}</td>
   </c:if>
   <c:if test="${GZgzDte.directRateScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.directRateScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZhj1Dte.directRate}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZhj1Dte.directRateScore}</td> --%>
   <c:if test="${GZhj1Dte.directRateScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.directRateScore}</td>
   </c:if>
   <c:if test="${GZhj1Dte.directRateScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.directRateScore}</td>
   </c:if>
   <!--深圳-->
   
   <td class="shenzhen1">${SZszDte.directRate}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZszDte.directRateScore}</td> --%>
   <c:if test="${SZszDte.directRateScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.directRateScore}</td>
   </c:if>
   <c:if test="${SZszDte.directRateScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.directRateScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZstDte.directRate}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZstDte.directRateScore}</td> --%>
   <c:if test="${SZstDte.directRateScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.directRateScore}</td>
   </c:if>
   <c:if test="${SZstDte.directRateScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.directRateScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZjyDte.directRate}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZjyDte.directRateScore}</td> --%>
   <c:if test="${SZjyDte.directRateScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.directRateScore}</td>
   </c:if>
   <c:if test="${SZjyDte.directRateScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.directRateScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZmzDte.directRate}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZmzDte.directRateScore}</td> --%>
   <c:if test="${SZmzDte.directRateScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.directRateScore}</td>
   </c:if>
   <c:if test="${SZmzDte.directRateScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.directRateScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZczDte.directRate}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZczDte.directRateScore}</td> --%>
   <c:if test="${SZczDte.directRateScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.directRateScore}</td>
   </c:if>
   <c:if test="${SZczDte.directRateScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.directRateScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZswDte.directRate}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZswDte.directRateScore}</td> --%>
   <c:if test="${SZswDte.directRateScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.directRateScore}</td>
   </c:if>
   <c:if test="${SZswDte.directRateScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.directRateScore}</td>
   </c:if>
  
   <td class="shenzhen1">${SZhj2Dte.directRate}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZhj2Dte.directRateScore}</td> --%>
   <c:if test="${SZhj2Dte.directRateScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.directRateScore}</td>
   </c:if>
   <c:if test="${SZhj2Dte.directRateScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.directRateScore}</td>
   </c:if>
   
 <!--佛山-->
   <td class="foshan1">${FSfsDte.directRate}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FSfsDte.directRateScore}</td> --%>
   <c:if test="${FSfsDte.directRateScore==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.directRateScore}</td>
   </c:if>
   <c:if test="${FSfsDte.directRateScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.directRateScore}</td>
   </c:if>
   
   <td class="foshan1">${FSjmDte.directRate}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FSjmDte.directRateScore}</td> --%>
   <c:if test="${FSjmDte.directRateScore==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.directRateScore}</td>
   </c:if>
   <c:if test="${FSjmDte.directRateScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.directRateScore}</td>
   </c:if>
   
   <td class="foshan1">${FSzzDte.directRate}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FSzzDte.directRateScore}</td> --%>
   <c:if test="${FSzzDte.directRateScore==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.directRateScore}</td>
   </c:if>
   <c:if test="${FSzzDte.directRateScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.directRateScore}</td>
   </c:if>
   
   <td class="foshan1">${FSmmDte.directRate}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FSmmDte.directRateScore}</td> --%>
   <c:if test="${FSmmDte.directRateScore==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.directRateScore}</td>
   </c:if>
   <c:if test="${FSmmDte.directRateScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.directRateScore}</td>
   </c:if>
   
   <td class="foshan1">${FSyjDte.directRate}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FSyjDte.directRateScore}</td> --%>
   <c:if test="${FSyjDte.directRateScore==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.directRateScore}</td>
   </c:if>
   <c:if test="${FSyjDte.directRateScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.directRateScore}</td>
   </c:if>
   
   <td class="foshan1">${FShj4Dte.directRate}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FShj4Dte.directRateScore}</td> --%>
   <c:if test="${FShj4Dte.directRateScore==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.directRateScore}</td>
   </c:if>
   <c:if test="${FShj4Dte.directRateScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.directRateScore}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1">${DGdgDte.directRate}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGdgDte.directRateScore}</td> --%>
   <c:if test="${DGdgDte.directRateScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.directRateScore}</td>
   </c:if>
   <c:if test="${DGdgDte.directRateScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.directRateScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzsDte.directRate}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGzsDte.directRateScore}</td> --%>
   <c:if test="${DGzsDte.directRateScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.directRateScore}</td>
   </c:if>
   <c:if test="${DGzsDte.directRateScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.directRateScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhzDte.directRate}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGhzDte.directRateScore}</td> --%>
   <c:if test="${DGhzDte.directRateScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.directRateScore}</td>
   </c:if>
   <c:if test="${DGhzDte.directRateScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.directRateScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzhDte.directRate}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGzhDte.directRateScore}</td> --%>
   <c:if test="${DGzhDte.directRateScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.directRateScore}</td>
   </c:if>
   <c:if test="${DGzhDte.directRateScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.directRateScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhyDte.directRate}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGhyDte.directRateScore}</td> --%>
   <c:if test="${DGhyDte.directRateScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.directRateScore}</td>
   </c:if>
   <c:if test="${DGhyDte.directRateScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.directRateScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhj3Dte.directRate}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGhj3Dte.directRateScore}</td> --%>
   <c:if test="${DGhj3Dte.directRateScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.directRateScore}</td>
   </c:if>
   <c:if test="${DGhj3Dte.directRateScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.directRateScore}</td>
   </c:if>
   
   </tr>	
	   <tr>
  
   <td style="color: #EEB422" title="取清算表的考核细则">三个月以上应收账款占比（%）</td>
   <td>${score.threeMonthQuarter}</td>
   <td class="guangzhou1">${GZgzDte.threeMonth}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZgzDte.threeMonthQuarter}</td> --%>
   <c:if test="${GZgzDte.threeMonthQuarter==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${GZgzDte.threeMonthQuarter!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.threeMonthQuarter}</td>
   </c:if>
   <!-- 肇庆 -->
   <td class="guangzhou1">${GZzqDte.threeMonth}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZzqDte.threeMonthQuarter}</td> --%>
   <c:if test="${GZzqDte.threeMonthQuarter==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${GZzqDte.threeMonthQuarter!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="guangzhou1">${GZqyDte.threeMonth}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZqyDte.threeMonthQuarter}</td> --%>
   <c:if test="${GZqyDte.threeMonthQuarter==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${GZqyDte.threeMonthQuarter!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="guangzhou1">${GZsgDte.threeMonth}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZsgDte.threeMonthQuarter}</td> --%>
   <c:if test="${GZsgDte.threeMonthQuarter==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${GZsgDte.threeMonthQuarter!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="guangzhou1">${GZyfDte.threeMonth}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZyfDte.threeMonthQuarter}</td> --%>
   <c:if test="${GZyfDte.threeMonthQuarter==0.00}">
   <td class="guangzhou3" style="color: red;">${GZyfDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${GZyfDte.threeMonthQuarter!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZyfDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="guangzhou1">${GZhj1Dte.threeMonth}</td>
   <td class="guangzhou2"></td>
   <%-- <td class="guangzhou3">${GZhj1Dte.threeMonthQuarter}</td> --%>
   <c:if test="${GZhj1Dte.threeMonthQuarter==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${GZhj1Dte.threeMonthQuarter!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.threeMonthQuarter}</td>
   </c:if>
   <!--深圳-->
    
   <td class="shenzhen1">${SZszDte.threeMonth}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZszDte.threeMonthQuarter}</td> --%>
   <c:if test="${SZszDte.threeMonthQuarter==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${SZszDte.threeMonthQuarter!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="shenzhen1">${SZstDte.threeMonth}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZstDte.threeMonthQuarter}</td> --%>
   <c:if test="${SZstDte.threeMonthQuarter==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${SZstDte.threeMonthQuarter!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="shenzhen1">${SZjyDte.threeMonth}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZjyDte.threeMonthQuarter}</td> --%>
   <c:if test="${SZjyDte.threeMonthQuarter==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${SZjyDte.threeMonthQuarter!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="shenzhen1">${SZmzDte.threeMonth}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZmzDte.threeMonthQuarter}</td> --%>
   <c:if test="${SZmzDte.threeMonthQuarter==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${SZmzDte.threeMonthQuarter!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="shenzhen1">${SZczDte.threeMonth}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZczDte.threeMonthQuarter}</td> --%>
   <c:if test="${SZczDte.threeMonthQuarter==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${SZczDte.threeMonthQuarter!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="shenzhen1">${SZswDte.threeMonth}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZswDte.threeMonthQuarter}</td> --%>
   <c:if test="${SZswDte.threeMonthQuarter==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${SZswDte.threeMonthQuarter!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.threeMonthQuarter}</td>
   </c:if>
  
   <td class="shenzhen1">${SZhj2Dte.threeMonth}</td>
   <td class="shenzhen2"></td>
   <%-- <td class="shenzhen3">${SZhj2Dte.threeMonthQuarter}</td> --%>
   <c:if test="${SZhj2Dte.threeMonthQuarter==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${SZhj2Dte.threeMonthQuarter!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.threeMonthQuarter}</td>
   </c:if>
  
 <!--佛山-->
   <td class="foshan1">${FSfsDte.threeMonth}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FSfsDte.threeMonthQuarter}</td> --%>
   <c:if test="${FSfsDte.threeMonthQuarter==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${FSfsDte.threeMonthQuarter!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="foshan1">${FSjmDte.threeMonth}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FSjmDte.threeMonthQuarter}</td> --%>
   <c:if test="${FSjmDte.threeMonthQuarter==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${FSjmDte.threeMonthQuarter!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="foshan1">${FSzzDte.threeMonth}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FSzzDte.threeMonthQuarter}</td> --%>
   <c:if test="${FSzzDte.threeMonthQuarter==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${FSzzDte.threeMonthQuarter!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="foshan1">${FSmmDte.threeMonth}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FSmmDte.threeMonthQuarter}</td> --%>
   <c:if test="${FSmmDte.threeMonthQuarter==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${FSmmDte.threeMonthQuarter!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="foshan1">${FSyjDte.threeMonth}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FSyjDte.threeMonthQuarter}</td> --%>
   <c:if test="${FSyjDte.threeMonthQuarter==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${FSyjDte.threeMonthQuarter!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="foshan1">${FShj4Dte.threeMonth}</td>
   <td class="foshan2"></td>
   <%-- <td class="foshan3">${FShj4Dte.threeMonthQuarter}</td> --%>
   <c:if test="${FShj4Dte.threeMonthQuarter==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${FShj4Dte.threeMonthQuarter!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.threeMonthQuarter}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1">${DGdgDte.threeMonth}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGdgDte.threeMonthQuarter}</td> --%>
   <c:if test="${DGdgDte.threeMonthQuarter==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${DGdgDte.threeMonthQuarter!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="dongguan1">${DGzsDte.threeMonth}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGzsDte.threeMonthQuarter}</td> --%>
   <c:if test="${DGzsDte.threeMonthQuarter==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${DGzsDte.threeMonthQuarter!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="dongguan1">${DGhzDte.threeMonth}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGhzDte.threeMonthQuarter}</td> --%>
   <c:if test="${DGhzDte.threeMonthQuarter==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${DGhzDte.threeMonthQuarter!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="dongguan1">${DGzhDte.threeMonth}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGzhDte.threeMonthQuarter}</td> --%>
   <c:if test="${DGzhDte.threeMonthQuarter==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${DGzhDte.threeMonthQuarter!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="dongguan1">${DGhyDte.threeMonth}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGhyDte.threeMonthQuarter}</td> --%>
   <c:if test="${DGhyDte.threeMonthQuarter==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${DGhyDte.threeMonthQuarter!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.threeMonthQuarter}</td>
   </c:if>
   
   <td class="dongguan1">${DGhj3Dte.threeMonth}</td>
   <td class="dongguan2"></td>
   <%-- <td class="dongguan3">${DGhj3Dte.threeMonthQuarter}</td> --%>
   <c:if test="${DGhj3Dte.threeMonthQuarter==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.threeMonthQuarter}</td>
   </c:if>
   <c:if test="${DGhj3Dte.threeMonthQuarter!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.threeMonthQuarter}</td>
   </c:if>
   
   </tr>		
	   <tr>
  
   <td id="tdLong" title="引起广分被总部扣分以及出现应收、存货、退货率等分公司内部管理严重事项，由主责部门评估主责部门打分" style="color: #EEB422">重大事项扣分</td>
   <td>${score.majorScore}</td>
   <td class="guangzhou1">${GZgzDte.kpiGoal}</td>
   <td class="guangzhou2">${GZgzDte.kpiRateD}</td>
   <%-- <td class="guangzhou3">${GZgzDte.majorScore}</td> --%>
   <c:if test="${GZgzDte.majorScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZgzDte.majorScore}</td>
   </c:if>
   <c:if test="${GZgzDte.majorScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZgzDte.majorScore}</td>
   </c:if>
   <!-- 肇庆 -->
   <td class="guangzhou1">${GZzqDte.kpiGoal}</td>
   <td class="guangzhou2">${GZzqDte.kpiRateD}</td>
   <%-- <td class="guangzhou3">${GZzqDte.majorScore}</td> --%>
   <c:if test="${GZzqDte.majorScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZzqDte.majorScore}</td>
   </c:if>
   <c:if test="${GZzqDte.majorScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZzqDte.majorScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZqyDte.kpiGoal}</td>
   <td class="guangzhou2">${GZqyDte.kpiRateD}</td>
   <%-- <td class="guangzhou3">${GZqyDte.majorScore}</td> --%>
   <c:if test="${GZqyDte.majorScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZqyDte.majorScore}</td>
   </c:if>
   <c:if test="${GZqyDte.majorScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZqyDte.majorScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZsgDte.kpiGoal}</td>
   <td class="guangzhou2">${GZsgDte.kpiRateD}</td>
   <%-- <td class="guangzhou3">${GZsgDte.majorScore}</td> --%>
   <c:if test="${GZsgDte.majorScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZsgDte.majorScore}</td>
   </c:if>
   <c:if test="${GZsgDte.majorScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZsgDte.majorScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZyfDte.kpiGoal}</td>
   <td class="guangzhou2">${GZyfDte.kpiRateD}</td>
   <%-- <td class="guangzhou3">${GZyfDte.majorScore}</td> --%>
   <c:if test="${GZyfDte.majorScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZyfDte.majorScore}</td>
   </c:if>
   <c:if test="${GZyfDte.majorScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZyfDte.majorScore}</td>
   </c:if>
   
   <td class="guangzhou1">${GZhj1Dte.kpiGoal}</td>
   <td class="guangzhou2">${GZhj1Dte.kpiRateD}</td>
   <%-- <td class="guangzhou3">${GZhj1Dte.majorScore}</td> --%>
   <c:if test="${GZhj1Dte.majorScore==0.00}">
   <td class="guangzhou3" style="color: red;">${GZhj1Dte.majorScore}</td>
   </c:if>
   <c:if test="${GZhj1Dte.majorScore!=0.00}">
   <td class="guangzhou3" style="color: #7FFF00;">${GZhj1Dte.majorScore}</td>
   </c:if>
   <!--深圳-->
    
   <td class="shenzhen1">${SZszDte.kpiGoal}</td>
   <td class="shenzhen2">${SZszDte.kpiRateD}</td>
   <%-- <td class="shenzhen3">${SZszDte.majorScore}</td> --%>
   <c:if test="${SZszDte.majorScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZszDte.majorScore}</td>
   </c:if>
   <c:if test="${SZszDte.majorScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZszDte.majorScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZstDte.kpiGoal}</td>
   <td class="shenzhen2">${SZstDte.kpiRateD}</td>
   <%-- <td class="shenzhen3">${SZstDte.majorScore}</td> --%>
   <c:if test="${SZstDte.majorScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZstDte.majorScore}</td>
   </c:if>
   <c:if test="${SZstDte.majorScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZstDte.majorScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZjyDte.kpiGoal}</td>
   <td class="shenzhen2">${SZjyDte.kpiRateD}</td>
   <%-- <td class="shenzhen3">${SZjyDte.majorScore}</td> --%>
   <c:if test="${SZjyDte.majorScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZjyDte.majorScore}</td>
   </c:if>
   <c:if test="${SZjyDte.majorScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZjyDte.majorScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZmzDte.kpiGoal}</td>
   <td class="shenzhen2">${SZmzDte.kpiRateD}</td>
   <%-- <td class="shenzhen3">${SZmzDte.majorScore}</td> --%>
   <c:if test="${SZmzDte.majorScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZmzDte.majorScore}</td>
   </c:if>
   <c:if test="${SZmzDte.majorScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZmzDte.majorScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZczDte.kpiGoal}</td>
   <td class="shenzhen2">${SZczDte.kpiRateD}</td>
   <%-- <td class="shenzhen3">${SZczDte.majorScore}</td> --%>
   <c:if test="${SZczDte.majorScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZczDte.majorScore}</td>
   </c:if>
   <c:if test="${SZczDte.majorScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZczDte.majorScore}</td>
   </c:if>
   
   <td class="shenzhen1">${SZswDte.kpiGoal}</td>
   <td class="shenzhen2">${SZswDte.kpiRateD}</td>
   <%-- <td class="shenzhen3">${SZswDte.majorScore}</td> --%>
   <c:if test="${SZswDte.majorScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZswDte.majorScore}</td>
   </c:if>
   <c:if test="${SZswDte.majorScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZswDte.majorScore}</td>
   </c:if>
  
   <td class="shenzhen1">${SZhj2Dte.kpiGoal}</td>
   <td class="shenzhen2">${SZhj2Dte.kpiRateD}</td>
   <%-- <td class="shenzhen3">${SZhj2Dte.majorScore}</td> --%>
   <c:if test="${SZhj2Dte.majorScore==0.00}">
   <td class="shenzhen3" style="color: red;">${SZhj2Dte.majorScore}</td>
   </c:if>
   <c:if test="${SZhj2Dte.majorScore!=0.00}">
   <td class="shenzhen3" style="color: #7FFF00;">${SZhj2Dte.majorScore}</td>
   </c:if>
  
 <!--佛山-->
   <td class="foshan1">${FSfsDte.kpiGoal}</td>
   <td class="foshan2">${FSfsDte.kpiRateD}</td>
   <%-- <td class="foshan3">${FSfsDte.majorScore}</td> --%>
   <c:if test="${FSfsDte.majorScore==0.00}">
   <td class="foshan3" style="color: red;">${FSfsDte.majorScore}</td>
   </c:if>
   <c:if test="${FSfsDte.majorScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSfsDte.majorScore}</td>
   </c:if>
   
   <td class="foshan1">${FSjmDte.kpiGoal}</td>
   <td class="foshan2">${FSjmDte.kpiRateD}</td>
   <%-- <td class="foshan3">${FSjmDte.majorScore}</td> --%>
   <c:if test="${FSjmDte.majorScore==0.00}">
   <td class="foshan3" style="color: red;">${FSjmDte.majorScore}</td>
   </c:if>
   <c:if test="${FSjmDte.majorScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSjmDte.majorScore}</td>
   </c:if>
   
   <td class="foshan1">${FSzzDte.kpiGoal}</td>
   <td class="foshan2">${FSzzDte.kpiRateD}</td>
   <%-- <td class="foshan3">${FSzzDte.majorScore}</td> --%>
   <c:if test="${FSzzDte.majorScore==0.00}">
   <td class="foshan3" style="color: red;">${FSzzDte.majorScore}</td>
   </c:if>
   <c:if test="${FSzzDte.majorScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSzzDte.majorScore}</td>
   </c:if>
   
   <td class="foshan1">${FSmmDte.kpiGoal}</td>
   <td class="foshan2">${FSmmDte.kpiRateD}</td>
   <%-- <td class="foshan3">${FSmmDte.majorScore}</td> --%>
   <c:if test="${FSmmDte.majorScore==0.00}">
   <td class="foshan3" style="color: red;">${FSmmDte.majorScore}</td>
   </c:if>
   <c:if test="${FSmmDte.majorScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSmmDte.majorScore}</td>
   </c:if>
   
   <td class="foshan1">${FSyjDte.kpiGoal}</td>
   <td class="foshan2">${FSyjDte.kpiRateD}</td>
   <%-- <td class="foshan3">${FSyjDte.majorScore}</td> --%>
   <c:if test="${FSyjDte.majorScore==0.00}">
   <td class="foshan3" style="color: red;">${FSyjDte.majorScore}</td>
   </c:if>
   <c:if test="${FSyjDte.majorScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FSyjDte.majorScore}</td>
   </c:if>
   
   <td class="foshan1">${FShj4Dte.kpiGoal}</td>
   <td class="foshan2">${FShj4Dte.kpiRateD}</td>
   <%-- <td class="foshan3">${FShj4Dte.majorScore}</td> --%>
   <c:if test="${FShj4Dte.majorScore==0.00}">
   <td class="foshan3" style="color: red;">${FShj4Dte.majorScore}</td>
   </c:if>
   <c:if test="${FShj4Dte.majorScore!=0.00}">
   <td class="foshan3" style="color: #7FFF00;">${FShj4Dte.majorScore}</td>
   </c:if>
<!--东莞-->
   <td class="dongguan1">${DGdgDte.kpiGoal}</td>
   <td class="dongguan2">${DGdgDte.kpiRateD}</td>
   <%-- <td class="dongguan3">${DGdgDte.majorScore}</td> --%>
   <c:if test="${DGdgDte.majorScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGdgDte.majorScore}</td>
   </c:if>
   <c:if test="${DGdgDte.majorScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGdgDte.majorScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzsDte.kpiGoal}</td>
   <td class="dongguan2">${DGzsDte.kpiRateD}</td>
  <%--  <td class="dongguan3">${DGzsDte.majorScore}</td> --%>
   <c:if test="${DGzsDte.majorScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzsDte.majorScore}</td>
   </c:if>
   <c:if test="${DGzsDte.majorScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzsDte.majorScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhzDte.kpiGoal}</td>
   <td class="dongguan2">${DGhzDte.kpiRateD}</td>
   <%-- <td class="dongguan3">${DGhzDte.majorScore}</td> --%>
   <c:if test="${DGhzDte.majorScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhzDte.majorScore}</td>
   </c:if>
   <c:if test="${DGhzDte.majorScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhzDte.majorScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGzhDte.kpiGoal}</td>
   <td class="dongguan2">${DGzhDte.kpiRateD}</td>
   <%-- <td class="dongguan3">${DGzhDte.majorScore}</td> --%>
   <c:if test="${DGzhDte.majorScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGzhDte.majorScore}</td>
   </c:if>
   <c:if test="${DGzhDte.majorScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGzhDte.majorScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhyDte.kpiGoal}</td>
   <td class="dongguan2">${DGhyDte.kpiRateD}</td>
   <%-- <td class="dongguan3">${DGhyDte.majorScore}</td> --%>
   <c:if test="${DGhyDte.majorScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhyDte.majorScore}</td>
   </c:if>
   <c:if test="${DGhyDte.majorScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhyDte.majorScore}</td>
   </c:if>
   
   <td class="dongguan1">${DGhj3Dte.kpiGoal}</td>
   <td class="dongguan2">${DGhj3Dte.kpiRateD}</td>
   <%-- <td class="dongguan3">${DGhj3Dte.majorScore}</td> --%>
   <c:if test="${DGhj3Dte.majorScore==0.00}">
   <td class="dongguan3" style="color: red;">${DGhj3Dte.majorScore}</td>
   </c:if>
   <c:if test="${DGhj3Dte.majorScore!=0.00}">
   <td class="dongguan3" style="color: #7FFF00;">${DGhj3Dte.majorScore}</td>
   </c:if>
   
   </tr>	
 <!-- 汇总 -->
    <tr>
  
   <td style="color: #76EE00">汇总</td>
   <td style="color: #76EE00">得分汇总</td>
   <td></td>
   <td class="guangzhou1"></td>
   <td class="guangzhou2"></td>
   <td class="guangzhou3">${GZscore}</td>
   <!-- 肇庆 -->
   <td class="guangzhou1"></td>
   <td class="guangzhou2"></td>
   <td class="guangzhou3">${ZQscore}</td>
   
   <td class="guangzhou1"></td>
   <td class="guangzhou2"></td>
   <td class="guangzhou3">${QYscore}</td>
   
   <td class="guangzhou1"></td>
   <td class="guangzhou2"></td>
   <td class="guangzhou3">${SGscore}</td>
   
    <td class="guangzhou1"></td>
   <td class="guangzhou2"></td>
   <td class="guangzhou3">${YFscore}</td>
   
   <td class="guangzhou1"></td>
   <td class="guangzhou2"></td>
   <td class="guangzhou3">${HJscore}</td>
   <!--深圳-->
    
   <td class="shenzhen1"></td>
   <td class="shenzhen2"></td>
   <td class="shenzhen3">${SZscore}</td>
   
   <td class="shenzhen1"></td>
   <td class="shenzhen2"></td>
   <td class="shenzhen3">${STscore}</td>
   
   <td class="shenzhen1"></td>
   <td class="shenzhen2"></td>
   <td class="shenzhen3">${JYscore}</td>
   
   <td class="shenzhen1"></td>
   <td class="shenzhen2"></td>
   <td class="shenzhen3">${MZscore}</td>
   
   <td class="shenzhen1"></td>
   <td class="shenzhen2"></td>
   <td class="shenzhen3">${CZscore}</td>
   
   <td class="shenzhen1"></td>
   <td class="shenzhen2"></td>
   <td class="shenzhen3">${SWscore}</td>
  
   <td class="shenzhen1"></td>
   <td class="shenzhen2"></td>
   <td class="shenzhen3">${HJ2score}</td>
  
 <!--佛山-->
   <td class="foshan1"></td>
   <td class="foshan2"></td>
   <td class="foshan3">${FSscore}</td>
   
   <td class="foshan1"></td>
   <td class="foshan2"></td>
   <td class="foshan3">${JMscore}</td>
   
   <td class="foshan1"></td>
   <td class="foshan2"></td>
   <td class="foshan3">${ZZscore}</td>
   
   <td class="foshan1"></td>
   <td class="foshan2"></td>
   <td class="foshan3">${MMscore}</td>
   
   <td class="foshan1"></td>
   <td class="foshan2"></td>
   <td class="foshan3">${YJscore}</td>
   
   <td class="foshan1"></td>
   <td class="foshan2"></td>
   <td class="foshan3">${HJ4score}</td>
<!--东莞-->
   <td class="dongguan1"></td>
   <td class="dongguan2"></td>
   <td class="dongguan3">${DGscore}</td>
   
   <td class="dongguan1"></td>
   <td class="dongguan2"></td>
   <td class="dongguan3">${ZSscore}</td>
   
   <td class="dongguan1"></td>
   <td class="dongguan2"></td>
   <td class="dongguan3">${HZscore}</td>
   
   <td class="dongguan1"></td>
   <td class="dongguan2"></td>
   <td class="dongguan3">${ZHscore}</td>
   
   <td class="dongguan1"></td>
   <td class="dongguan2"></td>
   <td class="dongguan3">${HYscore}</td>
   
   <td class="dongguan1"></td>
   <td class="dongguan2"></td>
   <td class="dongguan3">${HJ3score}</td>
   
   </tr>	
 
   
		</table>
	</div>
		</div>
<script type="text/javascript">
//**********************************数据导出功能的实现 ********************************************************************* 
  
 $("#btn").click(function(){
        	   var cityArea=$('#cityArea').val();
        	   var quarter= $('#quarter').val();
           	   var showDu=$('#showDu').val();
           	   var te=document.getElementsByTagName("th");
           	   var th=document.getElementsByTagName("td");
           	   var x=document.getElementById('tptable').rows[2].cells;
			   var y=document.getElementById('tptable').rows[1].cells;
			   var z=document.getElementById('tptable').rows[0].cells;
			   if(quarter!="1" && quarter!="2"){
					alert("无数据");
					return false;
				}
				
				if(showDu=="" || showDu==null){
					alert("请选择维度！");
					return false;
				}
			   
			   
               if(cityArea.length==4 && cityArea[0]=="2" && cityArea[1]=="3" && cityArea[2]=="4" && cityArea[3]=="5"){
            	
            	   if(showDu.length==1 &&showDu[0]=="1"){
            		  /*瀛ｅ害琛? */
      				z[3].colSpan="6";
      				z[4].colSpan="7";
      				z[5].colSpan="6";
      				z[6].colSpan="6";
      				/* 杩愯惀涓績琛? */
      				y[0].colSpan="6";
      				y[1].colSpan="7";
      				y[2].colSpan="6";
      				y[3].colSpan="6";
      				/* 鍦板競琛?*/
      				x[0].colSpan="1";
      				x[1].colSpan="1";
      				x[2].colSpan="1";
      				x[3].colSpan="1";
      				x[4].colSpan="1";
      				x[5].colSpan="1";
      				x[6].colSpan="1";
      				x[7].colSpan="1";
      				x[8].colSpan="1";
      				x[9].colSpan="1";
      				x[10].colSpan="1";
      				x[11].colSpan="1";
      				x[12].colSpan="1";
      				x[13].colSpan="1";
      				x[14].colSpan="1";
      				x[15].colSpan="1";
      				x[16].colSpan="1";
      				x[17].colSpan="1";
      				x[18].colSpan="1";
      				x[19].colSpan="1";
      				x[20].colSpan="1";
      				x[21].colSpan="1";
      				x[22].colSpan="1";
      				x[23].colSpan="1";
      				x[24].colSpan="1";  
            		  
             	  for(var i=0;i<th.length;i++)
             	  {
             	  if(th[i].className=="guangzhou2")
             	  {
             	  th[i].parentNode.removeChild(th[i]);
             	  }
             	  if(th[i].className=="guangzhou3")
             	  {
             	  th[i].parentNode.removeChild(th[i]);
             	  } 
             	 if(th[i].className=="shenzhen2")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }
             	  if(th[i].className=="shenzhen3")
           	      {
           	      th[i].parentNode.removeChild(th[i]);
           	      }
             	  if(th[i].className=="foshan2")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }
             	  if(th[i].className=="foshan3")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }
             	 if(th[i].className=="dongguan2")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }
             	 if(th[i].className=="dongguan3")
           	      {
           	     th[i].parentNode.removeChild(th[i]);
           	      }
             	  }            	  
            	  }
            	  //鑻ョ淮搴︿负缁撴灉鍊?
            	  if(showDu.length==1 && showDu[0]=="2"){
            		z[3].colSpan="6";
      				z[4].colSpan="7";
      				z[5].colSpan="6";
      				z[6].colSpan="6";
      				/* 杩愯惀涓績琛? */
      				y[0].colSpan="6";
      				y[1].colSpan="7";
      				y[2].colSpan="6";
      				y[3].colSpan="6";
      				/* 鍦板競琛?*/
      				x[0].colSpan="1";
      				x[1].colSpan="1";
      				x[2].colSpan="1";
      				x[3].colSpan="1";
      				x[4].colSpan="1";
      				x[5].colSpan="1";
      				x[6].colSpan="1";
      				x[7].colSpan="1";
      				x[8].colSpan="1";
      				x[9].colSpan="1";
      				x[10].colSpan="1";
      				x[11].colSpan="1";
      				x[12].colSpan="1";
      				x[13].colSpan="1";
      				x[14].colSpan="1";
      				x[15].colSpan="1";
      				x[16].colSpan="1";
      				x[17].colSpan="1";
      				x[18].colSpan="1";
      				x[19].colSpan="1";
      				x[20].colSpan="1";
      				x[21].colSpan="1";
      				x[22].colSpan="1";
      				x[23].colSpan="1";
      				x[24].colSpan="1";
      			  for(var i=0;i<th.length;i++)
             	  {
             	  if(th[i].className=="guangzhou1")
             	  {
             	  th[i].parentNode.removeChild(th[i]);
             	  }
             	  if(th[i].className=="guangzhou3")
             	  {
             	  th[i].parentNode.removeChild(th[i]);
             	  } 
             	 if(th[i].className=="shenzhen1")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }
             	  if(th[i].className=="shenzhen3")
           	      {
           	      th[i].parentNode.removeChild(th[i]);
           	      }
             	  if(th[i].className=="foshan1")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }
             	  if(th[i].className=="foshan3")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }
             	 if(th[i].className=="dongguan1")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }
             	 if(th[i].className=="dongguan3")
           	      {
           	     th[i].parentNode.removeChild(th[i]);
           	      }
             	  } 
      			 for(var i=0;i<th.length;i++)
      		 	  {
      			if(th[i].className=="guangzhou1")
      		     	  {
      		     	  th[i].parentNode.removeChild(th[i]);
      		     	  }	
      		 	  }
      			for(var i=0;i<th.length;i++)
    		 	  {
    			if(th[i].className=="guangzhou1")
    		     	  {
    		     	  th[i].parentNode.removeChild(th[i]);
    		     	  }	
    		 	  }
      			 for(var i=0;i<th.length;i++)
     		 	  {
     			if(th[i].className=="shenzhen1")
     		     	  {
     		     	  th[i].parentNode.removeChild(th[i]);
     		     	  }	
     		 	  }
     			for(var i=0;i<th.length;i++)
   		 	  {
   			if(th[i].className=="shenzhen1")
   		     	  {
   		     	  th[i].parentNode.removeChild(th[i]);
   		     	  }	
   		 	  }
     			 for(var i=0;i<th.length;i++)
     		 	  {
     			if(th[i].className=="foshan1")
     		     	  {
     		     	  th[i].parentNode.removeChild(th[i]);
     		     	  }	
     		 	  }
     			for(var i=0;i<th.length;i++)
   		 	  {
   			if(th[i].className=="foshan1")
   		     	  {
   		     	  th[i].parentNode.removeChild(th[i]);
   		     	  }	
   		 	  }
     			 for(var i=0;i<th.length;i++)
     		 	  {
     			if(th[i].className=="dongguan1")
     		     	  {
     		     	  th[i].parentNode.removeChild(th[i]);
     		     	  }	
     		 	  }
     			for(var i=0;i<th.length;i++)
   		 	  {
   			if(th[i].className=="dongguan1")
   		     	  {
   		     	  th[i].parentNode.removeChild(th[i]);
   		     	  }	
   		 	  }
      			  
            	  }
         	      //鑻ョ淮搴︿负寰楀垎  
            	  if(showDu.length==1 && showDu[0]=="3"){
            		  /*瀛ｅ害琛? */
      				z[3].colSpan="6";
      				z[4].colSpan="7";
      				z[5].colSpan="6";
      				z[6].colSpan="6";
      				/* 杩愯惀涓績琛? */
      				y[0].colSpan="6";
      				y[1].colSpan="7";
      				y[2].colSpan="6";
      				y[3].colSpan="6";
      				/* 鍦板競琛?*/
      				x[0].colSpan="1";
      				x[1].colSpan="1";
      				x[2].colSpan="1";
      				x[3].colSpan="1";
      				x[4].colSpan="1";
      				x[5].colSpan="1";
      				x[6].colSpan="1";
      				x[7].colSpan="1";
      				x[8].colSpan="1";
      				x[9].colSpan="1";
      				x[10].colSpan="1";
      				x[11].colSpan="1";
      				x[12].colSpan="1";
      				x[13].colSpan="1";
      				x[14].colSpan="1";
      				x[15].colSpan="1";
      				x[16].colSpan="1";
      				x[17].colSpan="1";
      				x[18].colSpan="1";
      				x[19].colSpan="1";
      				x[20].colSpan="1";
      				x[21].colSpan="1";
      				x[22].colSpan="1";
      				x[23].colSpan="1";
      				x[24].colSpan="1";
      				for(var i=0;i<th.length;i++)
               	  {
               	  if(th[i].className=="guangzhou1")
               	  {
               	  th[i].parentNode.removeChild(th[i]);
               	  }
               	  if(th[i].className=="guangzhou2")
               	  {
               	  th[i].parentNode.removeChild(th[i]);
               	  } 
               	 if(th[i].className=="shenzhen1")
              	  {
              	  th[i].parentNode.removeChild(th[i]);
              	  }
               	  if(th[i].className=="shenzhen2")
             	      {
             	      th[i].parentNode.removeChild(th[i]);
             	      }
               	  if(th[i].className=="foshan1")
              	  {
              	  th[i].parentNode.removeChild(th[i]);
              	  }
               	  if(th[i].className=="foshan2")
              	  {
              	  th[i].parentNode.removeChild(th[i]);
              	  }
               	 if(th[i].className=="dongguan1")
              	  {
              	  th[i].parentNode.removeChild(th[i]);
              	  }
               	 if(th[i].className=="dongguan2")
             	      {
             	     th[i].parentNode.removeChild(th[i]);
             	      }
               	  }
      				
            	  }
                  //鑻ョ淮搴︿负鎸囨爣鍊肩粨鏋滃€?
            	  if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="2"){
            		  /*瀛ｅ害琛? */
      				z[3].colSpan="12";
      				z[4].colSpan="14";
      				z[5].colSpan="12";
      				z[6].colSpan="12";
      				/* 杩愯惀涓績琛? */
      				y[0].colSpan="12";
      				y[1].colSpan="14";
      				y[2].colSpan="12";
      				y[3].colSpan="12";
      				/* 鍦板競琛?*/
      				x[0].colSpan="2";
      				x[1].colSpan="2";
      				x[2].colSpan="2";
      				x[3].colSpan="2";
      				x[4].colSpan="2";
      				x[5].colSpan="2";
      				x[6].colSpan="2";
      				x[7].colSpan="2";
      				x[8].colSpan="2";
      				x[9].colSpan="2";
      				x[10].colSpan="2";
      				x[11].colSpan="2";
      				x[12].colSpan="2";
      				x[13].colSpan="2";
      				x[14].colSpan="2";
      				x[15].colSpan="2";
      				x[16].colSpan="2";
      				x[17].colSpan="2";
      				x[18].colSpan="2";
      				x[19].colSpan="2";
      				x[20].colSpan="2";
      				x[21].colSpan="2";
      				x[22].colSpan="2";
      				x[23].colSpan="2";
      				x[24].colSpan="2";
      				 for(var i=0;i<th.length;i++)
                	  {
                	  
                	  if(th[i].className=="guangzhou3")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  } 
                	
                	  if(th[i].className=="shenzhen3")
              	      {
              	      th[i].parentNode.removeChild(th[i]);
              	      }
                	 
                	  if(th[i].className=="foshan3")
               	  {
               	  th[i].parentNode.removeChild(th[i]);
               	  }
                	 
                	 if(th[i].className=="dongguan3")
              	      {
              	     th[i].parentNode.removeChild(th[i]);
              	      }
                	  }

            	  }
         	      //鑻ョ淮搴︿负鎸囨爣鍊煎緱鍒?
            	  if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="3"){
            		  /*瀛ｅ害琛? */
      				z[3].colSpan="12";
      				z[4].colSpan="14";
      				z[5].colSpan="12";
      				z[6].colSpan="12";
      				/* 杩愯惀涓績琛? */
      				y[0].colSpan="12";
      				y[1].colSpan="14";
      				y[2].colSpan="12";
      				y[3].colSpan="12";
      				/* 鍦板競琛?*/
      				x[0].colSpan="2";
      				x[1].colSpan="2";
      				x[2].colSpan="2";
      				x[3].colSpan="2";
      				x[4].colSpan="2";
      				x[5].colSpan="2";
      				x[6].colSpan="2";
      				x[7].colSpan="2";
      				x[8].colSpan="2";
      				x[9].colSpan="2";
      				x[10].colSpan="2";
      				x[11].colSpan="2";
      				x[12].colSpan="2";
      				x[13].colSpan="2";
      				x[14].colSpan="2";
      				x[15].colSpan="2";
      				x[16].colSpan="2";
      				x[17].colSpan="2";
      				x[18].colSpan="2";
      				x[19].colSpan="2";
      				x[20].colSpan="2";
      				x[21].colSpan="2";
      				x[22].colSpan="2";
      				x[23].colSpan="2";
      				x[24].colSpan="2";
      				 for(var i=0;i<th.length;i++)
               	  {
               	  
               	  if(th[i].className=="guangzhou2")
               	  {
               	  th[i].parentNode.removeChild(th[i]);
               	  } 
               	
               	  if(th[i].className=="shenzhen2")
             	      {
             	      th[i].parentNode.removeChild(th[i]);
             	      }
               	 
               	  if(th[i].className=="foshan2")
              	  {
              	  th[i].parentNode.removeChild(th[i]);
              	  }
               	 
               	 if(th[i].className=="dongguan2")
             	      {
             	     th[i].parentNode.removeChild(th[i]);
             	      }
               	  }
            	  }
                  //鑻ョ淮搴︿负缁撴灉鍊煎緱鍒?
            	  if(showDu.length==2 && showDu[0]=="2" && showDu[1]=="3"){
            		  /*瀛ｅ害琛? */
      				z[3].colSpan="12";
      				z[4].colSpan="14";
      				z[5].colSpan="12";
      				z[6].colSpan="12";
      				/* 杩愯惀涓績琛? */
      				y[0].colSpan="12";
      				y[1].colSpan="14";
      				y[2].colSpan="12";
      				y[3].colSpan="12";
      				/* 鍦板競琛?*/
      				x[0].colSpan="2";
      				x[1].colSpan="2";
      				x[2].colSpan="2";
      				x[3].colSpan="2";
      				x[4].colSpan="2";
      				x[5].colSpan="2";
      				x[6].colSpan="2";
      				x[7].colSpan="2";
      				x[8].colSpan="2";
      				x[9].colSpan="2";
      				x[10].colSpan="2";
      				x[11].colSpan="2";
      				x[12].colSpan="2";
      				x[13].colSpan="2";
      				x[14].colSpan="2";
      				x[15].colSpan="2";
      				x[16].colSpan="2";
      				x[17].colSpan="2";
      				x[18].colSpan="2";
      				x[19].colSpan="2";
      				x[20].colSpan="2";
      				x[21].colSpan="2";
      				x[22].colSpan="2";
      				x[23].colSpan="2";
      				x[24].colSpan="2";
      			  for(var i=0;i<th.length;i++)
            	  {
            	  
            	  if(th[i].className=="guangzhou1")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  } 
            	
            	  if(th[i].className=="shenzhen1")
          	      {
          	      th[i].parentNode.removeChild(th[i]);
          	      }
            	 
            	  if(th[i].className=="foshan1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }
            	 
            	 if(th[i].className=="dongguan1")
          	      {
          	     th[i].parentNode.removeChild(th[i]);
          	      }
            	  }
            	  }
         	     //鑻ョ淮搴︿负鎸囨爣鍊肩粨鏋滃€煎緱鍒?
            	  if(showDu.length==3 && showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3"){
            		  /*瀛ｅ害琛? */
      				z[3].colSpan="18";
      				z[4].colSpan="21";
      				z[5].colSpan="18";
      				z[6].colSpan="18";
      				/* 杩愯惀涓績琛? */
      				y[0].colSpan="18";
      				y[1].colSpan="21";
      				y[2].colSpan="18";
      				y[3].colSpan="18";
      				/* 鍦板競琛?*/
      				x[0].colSpan="3";
      				x[1].colSpan="3";
      				x[2].colSpan="3";
      				x[3].colSpan="3";
      				x[4].colSpan="3";
      				x[5].colSpan="3";
      				x[6].colSpan="3";
      				x[7].colSpan="3";
      				x[8].colSpan="3";
      				x[9].colSpan="3";
      				x[10].colSpan="3";
      				x[11].colSpan="3";
      				x[12].colSpan="3";
      				x[13].colSpan="3";
      				x[14].colSpan="3";
      				x[15].colSpan="3";
      				x[16].colSpan="3";
      				x[17].colSpan="3";
      				x[18].colSpan="3";
      				x[19].colSpan="3";
      				x[20].colSpan="3";
      				x[21].colSpan="3";
      				x[22].colSpan="3";
      				x[23].colSpan="3";
      				x[24].colSpan="3";
            		  
            		  
            	  }
  
               }
  // 濡傛灉閫夋嫨骞垮窞杩愯惀涓績              
        if(cityArea.length==1 && cityArea[0]=="2"){
        	 /*瀛ｅ害琛? */
				z[3].colSpan="18";
				z[4].colSpan="21";
				z[5].colSpan="18";
				z[6].colSpan="18";
				/* 杩愯惀涓績琛? */
				y[0].colSpan="18";
				y[1].colSpan="21";
				y[2].colSpan="18";
				y[3].colSpan="18";
				/* 鍦板競琛?*/
				x[0].colSpan="3";
				x[1].colSpan="3";
				x[2].colSpan="3";
				x[3].colSpan="3";
				x[4].colSpan="3";
				x[5].colSpan="3";
				x[6].colSpan="3";
				x[7].colSpan="3";
				x[8].colSpan="3";
				x[9].colSpan="3";
				x[10].colSpan="3";
				x[11].colSpan="3";
				x[12].colSpan="3";
				x[13].colSpan="3";
				x[14].colSpan="3";
				x[15].colSpan="3";
				x[16].colSpan="3";
				x[17].colSpan="3";
				x[18].colSpan="3";
				x[19].colSpan="3";
				x[20].colSpan="3";
				x[21].colSpan="3";
				x[22].colSpan="3";
				x[23].colSpan="3";
				x[24].colSpan="3";
			
        	
        	for(var i=0;i<th.length;i++)
         	  {
         	 
         	 if(th[i].className=="shenzhen")
         	  {
         
         	  th[i].parentNode.removeChild(th[i]);
         	  }
         	if(th[i].className=="shenzhen1")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }
         	
         	
         	if(th[i].className=="shenzhen2")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	if(th[i].className=="shenzhen3")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	 
         	  if(th[i].className=="foshan")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="foshan1")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="foshan2")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="foshan3")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	 if(th[i].className=="dongguan")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }
         	 if(th[i].className=="dongguan1")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }
         	 if(th[i].className=="dongguan2")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	 if(th[i].className=="dongguan3")
       	      {
       	     th[i].parentNode.removeChild(th[i]);
       	      }
         	  }
        	
        	//濡傛灉鍙€夋寚鏍囧€?
    		  if(showDu.length==1 && showDu[0]=="1"){
    			z[3].colSpan="6";
    			y[0].colSpan="6";
    			x[0].colSpan="1";
    			x[1].colSpan="1";
    			x[2].colSpan="1";
    			x[3].colSpan="1";
    			x[4].colSpan="1";
    			x[5].colSpan="1";
    			for(var i=0;i<th.length;i++)
           	  {
           	  if(th[i].className=="guangzhou2")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }
           	  if(th[i].className=="guangzhou3")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }
           	if(th[i].className=="shenzhen")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
           	
           	if(th[i].className=="shenzhen1")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
           	 if(th[i].className=="shenzhen2")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
           	  if(th[i].className=="shenzhen3")
         	      {
         	      th[i].parentNode.removeChild(th[i]);
         	      }
           	  if(th[i].className=="foshan")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
           	  if(th[i].className=="foshan1")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
           	  if(th[i].className=="foshan2")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
           	  if(th[i].className=="foshan3")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
           	 if(th[i].className=="dongguan")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
           	 if(th[i].className=="dongguan1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
           	 $("#shen4").remove();
           	 $("#shen6").remove();
           	 $("#fo4").remove();
           	 $("#dong4").remove();
           	 $("#fo6").remove();
           	 $("#dong6").remove();
           	
           	  }
    			for(var i=0;i<th.length;i++)
             	  {
    				 if(th[i].className=="shenzhen1")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
             	  }
    			for(var i=0;i<th.length;i++)
           	  {
  				 if(th[i].className=="shenzhen1")
  	         	  {
  	         	  th[i].parentNode.removeChild(th[i]);
  	         	  }
           	  }
    			for(var i=0;i<th.length;i++)
             	  {
    				 if(th[i].className=="foshan1")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
             	  }
    			for(var i=0;i<th.length;i++)
             	  {
    				 if(th[i].className=="foshan1")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
             	  }
    			for(var i=0;i<th.length;i++)
             	  {
    				 if(th[i].className=="dongguan1")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
             	  }
    			for(var i=0;i<th.length;i++)
               	  {
       				 if(th[i].className=="dongguan1")
       	         	  {
       	         	  th[i].parentNode.removeChild(th[i]);
       	         	  }
                	  }
    		 }
           if(showDu.length==1 && showDu[0]=="2"){
        	z[3].colSpan="6";
   			y[0].colSpan="6";
   			x[0].colSpan="1";
   			x[1].colSpan="1";
   			x[2].colSpan="1";
   			x[3].colSpan="1";
   			x[4].colSpan="1";
   			x[5].colSpan="1";
   			for(var i=0;i<th.length;i++)
       	  {
   				if(th[i].className=="dongguan1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	  }
   			for(var i=0;i<th.length;i++)
         	  {
     				if(th[i].className=="dongguan1")
             	  {
             	  th[i].parentNode.removeChild(th[i]);
             	  }	
         	  }
   			for(var i=0;i<th.length;i++)
         	  {
     				if(th[i].className=="foshan1")
             	  {
             	  th[i].parentNode.removeChild(th[i]);
             	  }	
         	  }
   			for(var i=0;i<th.length;i++)
       	  {
   				if(th[i].className=="foshan1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	  }
   			for(var i=0;i<th.length;i++)
       	  {
   				if(th[i].className=="shenzhen1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	  }
   			for(var i=0;i<th.length;i++)
         	  {
     				if(th[i].className=="shenzhen1")
             	  {
             	  th[i].parentNode.removeChild(th[i]);
             	  }	
         	  }
   			for(var i=0;i<th.length;i++)
       	  {
   				if(th[i].className=="guangzhou1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	  }
   			for(var i=0;i<th.length;i++)
         	  {
         	  if(th[i].className=="guangzhou1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
         	  if(th[i].className=="guangzhou3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
         	if(th[i].className=="shenzhen")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }
         	
         	if(th[i].className=="shenzhen1")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }
         	 if(th[i].className=="shenzhen2")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="shenzhen3")
       	      {
       	      th[i].parentNode.removeChild(th[i]);
       	      }
         	  if(th[i].className=="foshan")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="foshan1")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="foshan2")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="foshan3")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	 if(th[i].className=="dongguan")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }
         	 if(th[i].className=="dongguan1")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }
         
         	 $("#shen4").remove();
         	 $("#shen6").remove();
         	 $("#fo4").remove();
         	 $("#dong4").remove();
         	 $("#fo6").remove();
         	 $("#dong6").remove();
         	
         	  }
    		}
           if(showDu.length==1 && showDu[0]=="3"){
            z[3].colSpan="6";
   			y[0].colSpan="6";
   			x[0].colSpan="1";
   			x[1].colSpan="1";
   			x[2].colSpan="1";
   			x[3].colSpan="1";
   			x[4].colSpan="1";
   			x[5].colSpan="1";
   		 $("#shen4").remove();
     	 $("#shen6").remove();
     	$("#shen2").remove();
    	 $("#fo2").remove();
     	 $("#fo4").remove();
     	 $("#dong4").remove();
     	 $("#dong2").remove();
     	 $("#fo6").remove();
     	 $("#dong6").remove();
   			
	for(var i=0;i<th.length;i++)
	  {
    if(th[i].className=="shenzhen1")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }	
	  }
 	for(var i=0;i<th.length;i++)
 	  {
	if(th[i].className=="shenzhen1")
     	  {
     	  th[i].parentNode.removeChild(th[i]);
     	  }	
 	  }
 	for(var i=0;i<th.length;i++)
  {
    if(th[i].className=="foshan1")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
  }
 	for(var i=0;i<th.length;i++)
 	  {
	if(th[i].className=="foshan1")
     	  {
     	  th[i].parentNode.removeChild(th[i]);
     	  }	
 	  }
 	for(var i=0;i<th.length;i++)
 	  {
	if(th[i].className=="dongguan1")
     	  {
     	  th[i].parentNode.removeChild(th[i]);
     	  }	
 	  }
 	for(var i=0;i<th.length;i++)
  {
  if(th[i].className=="dongguan1")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
  }
 	 for(var i=0;i<th.length;i++)
   	  {
   	  if(th[i].className=="guangzhou1")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }
   	  if(th[i].className=="guangzhou2")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  } 
   	 if(th[i].className=="shenzhen1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }
   	 
   	  if(th[i].className=="shenzhen2")
 	      {
 	      th[i].parentNode.removeChild(th[i]);
 	      }
   	if(th[i].className=="shenzhen3")
   {
   th[i].parentNode.removeChild(th[i]);
   }
   	  if(th[i].className=="foshan1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }
   	  if(th[i].className=="foshan2")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }
   	 if(th[i].className=="foshan3")
 	  {
 	  th[i].parentNode.removeChild(th[i]);
 	  }
   	 if(th[i].className=="dongguan1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }
   	
   	  }
 }
           if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="2"){
        	    z[3].colSpan="12";
      			y[0].colSpan="12";
      			x[0].colSpan="2";
      			x[1].colSpan="2";
      			x[2].colSpan="2";
      			x[3].colSpan="2";
      			x[4].colSpan="2";
      			x[5].colSpan="2";
      			 for(var i=0;i<th.length;i++)
      		 	  {
      			if(th[i].className=="dongguan1")
      		     	  {
      		     	  th[i].parentNode.removeChild(th[i]);
      		     	  }	
      		 	  }
      			 for(var i=0;i<th.length;i++)
      		 	  {
      			if(th[i].className=="dongguan1")
      		     	  {
      		     	  th[i].parentNode.removeChild(th[i]);
      		     	  }	
      		 	  }
      			 for(var i=0;i<th.length;i++)
      		 	  {
      			if(th[i].className=="foshan1")
      		     	  {
      		     	  th[i].parentNode.removeChild(th[i]);
      		     	  }	
      		 	  }
      			 for(var i=0;i<th.length;i++)
      		 	  {
      			if(th[i].className=="foshan1")
      		     	  {
      		     	  th[i].parentNode.removeChild(th[i]);
      		     	  }	
      		 	  }
      			 for(var i=0;i<th.length;i++)
      		 	  {
      			if(th[i].className=="shenzhen1")
      		     	  {
      		     	  th[i].parentNode.removeChild(th[i]);
      		     	  }	
      		 	  }
      			 for(var i=0;i<th.length;i++)
      		 	  {
      			if(th[i].className=="shenzhen1")
      		     	  {
      		     	  th[i].parentNode.removeChild(th[i]);
      		     	  }	
      		 	  }
      			 for(var i=0;i<th.length;i++)
      		 	  {
      			if(th[i].className=="shenzhen1")
      		     	  {
      		     	  th[i].parentNode.removeChild(th[i]);
      		     	  }	
      		 	  }
      			
   			for(var i=0;i<th.length;i++)
       	  {
       	 
       	  if(th[i].className=="guangzhou3")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }
       	if(th[i].className=="shenzhen")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
       	
       	if(th[i].className=="shenzhen1")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
       	 if(th[i].className=="shenzhen2")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }
       	  if(th[i].className=="shenzhen3")
     	      {
     	      th[i].parentNode.removeChild(th[i]);
     	      }
       	  if(th[i].className=="foshan")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }
       	  if(th[i].className=="foshan1")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }
       	  if(th[i].className=="foshan2")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }
       	  if(th[i].className=="foshan3")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }
       	 if(th[i].className=="dongguan")
     	  {
     	  th[i].parentNode.removeChild(th[i]);
     	  }
       	 if(th[i].className=="dongguan1")
     	  {
     	  th[i].parentNode.removeChild(th[i]);
     	  }
       
       	 $("#shen4").remove();
       	 $("#shen6").remove();
       	 $("#fo4").remove();
       	 $("#dong4").remove();
       	 $("#fo6").remove();
       	 $("#dong6").remove();
       	
       	  }
           }
          if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="3"){
        	z[3].colSpan="12";
  			y[0].colSpan="12";
  			x[0].colSpan="2";
  			x[1].colSpan="2";
  			x[2].colSpan="2";
  			x[3].colSpan="2";
  			x[4].colSpan="2";
  			x[5].colSpan="2";
  			for(var i=0;i<th.length;i++)
		 	  {
			if(th[i].className=="dongguan1")
		     	  {
		     	  th[i].parentNode.removeChild(th[i]);
		     	  }	
		 	  }
			 for(var i=0;i<th.length;i++)
		 	  {
			if(th[i].className=="dongguan1")
		     	  {
		     	  th[i].parentNode.removeChild(th[i]);
		     	  }	
		 	  }
			 for(var i=0;i<th.length;i++)
		 	  {
			if(th[i].className=="foshan1")
		     	  {
		     	  th[i].parentNode.removeChild(th[i]);
		     	  }	
		 	  }
			 for(var i=0;i<th.length;i++)
		 	  {
			if(th[i].className=="foshan1")
		     	  {
		     	  th[i].parentNode.removeChild(th[i]);
		     	  }	
		 	  }
			 for(var i=0;i<th.length;i++)
		 	  {
			if(th[i].className=="shenzhen1")
		     	  {
		     	  th[i].parentNode.removeChild(th[i]);
		     	  }	
		 	  }
			 for(var i=0;i<th.length;i++)
		 	  {
			if(th[i].className=="shenzhen1")
		     	  {
		     	  th[i].parentNode.removeChild(th[i]);
		     	  }	
		 	  }
			 for(var i=0;i<th.length;i++)
		 	  {
			if(th[i].className=="shenzhen1")
		     	  {
		     	  th[i].parentNode.removeChild(th[i]);
		     	  }	
		 	  }
			
			for(var i=0;i<th.length;i++)
 	  {
 	 
 	  if(th[i].className=="guangzhou2")
 	  {
 	  th[i].parentNode.removeChild(th[i]);
 	  }
 	if(th[i].className=="shenzhen")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	
 	if(th[i].className=="shenzhen1")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	 if(th[i].className=="shenzhen2")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	  if(th[i].className=="shenzhen3")
	      {
	      th[i].parentNode.removeChild(th[i]);
	      }
 	  if(th[i].className=="foshan")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	  if(th[i].className=="foshan1")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	  if(th[i].className=="foshan2")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	  if(th[i].className=="foshan3")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	 if(th[i].className=="dongguan")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	 if(th[i].className=="dongguan1")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 
 	 $("#shen4").remove();
 	 $("#shen6").remove();
 	 $("#fo4").remove();
 	 $("#dong4").remove();
 	 $("#fo6").remove();
 	 $("#dong6").remove();
 	
 	  }
          }
          
          
          if(showDu.length==2 && showDu[0]=="2" && showDu[1]=="3"){
          	    z[3].colSpan="12";
    			y[0].colSpan="12";
    			x[0].colSpan="2";
    			x[1].colSpan="2";
    			x[2].colSpan="2";
    			x[3].colSpan="2";
    			x[4].colSpan="2";
    			x[5].colSpan="2";
    			 for(var i=0;i<th.length;i++)
    		 	  {
    			if(th[i].className=="guangzhou1")
    		     	  {
    		     	  th[i].parentNode.removeChild(th[i]);
    		     	  }	
    		 	  }	
    			
    		for(var i=0;i<th.length;i++)
  		 	  {
  			if(th[i].className=="dongguan1")
  		     	  {
  		     	  th[i].parentNode.removeChild(th[i]);
  		     	  }	
  		 	  }
  			 for(var i=0;i<th.length;i++)
  		 	  {
  			if(th[i].className=="dongguan1")
  		     	  {
  		     	  th[i].parentNode.removeChild(th[i]);
  		     	  }	
  		 	  }
  			 for(var i=0;i<th.length;i++)
  		 	  {
  			if(th[i].className=="foshan1")
  		     	  {
  		     	  th[i].parentNode.removeChild(th[i]);
  		     	  }	
  		 	  }
  			 for(var i=0;i<th.length;i++)
  		 	  {
  			if(th[i].className=="foshan1")
  		     	  {
  		     	  th[i].parentNode.removeChild(th[i]);
  		     	  }	
  		 	  }
  			 for(var i=0;i<th.length;i++)
  		 	  {
  			if(th[i].className=="shenzhen1")
  		     	  {
  		     	  th[i].parentNode.removeChild(th[i]);
  		     	  }	
  		 	  }
  			 for(var i=0;i<th.length;i++)
  		 	  {
  			if(th[i].className=="shenzhen1")
  		     	  {
  		     	  th[i].parentNode.removeChild(th[i]);
  		     	  }	
  		 	  }
  			 for(var i=0;i<th.length;i++)
  		 	  {
  			if(th[i].className=="shenzhen1")
  		     	  {
  		     	  th[i].parentNode.removeChild(th[i]);
  		     	  }	
  		 	  }
  			
  			for(var i=0;i<th.length;i++)
   	  {
   	 
   	  if(th[i].className=="guangzhou1")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }
   	if(th[i].className=="shenzhen")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }
   	
   	if(th[i].className=="shenzhen1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }
   	 if(th[i].className=="shenzhen2")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }
   	  if(th[i].className=="shenzhen3")
  	      {
  	      th[i].parentNode.removeChild(th[i]);
  	      }
   	  if(th[i].className=="foshan")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }
   	  if(th[i].className=="foshan1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }
   	  if(th[i].className=="foshan2")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }
   	  if(th[i].className=="foshan3")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }
   	 if(th[i].className=="dongguan")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }
   	 if(th[i].className=="dongguan1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }
   
   	 $("#shen4").remove();
   	 $("#shen6").remove();
   	 $("#fo4").remove();
   	 $("#dong4").remove();
   	 $("#fo6").remove();
   	 $("#dong6").remove();
   	
   	  }
            }     
          
          if(showDu.length==3 && showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
            z[3].colSpan="18";
  			y[0].colSpan="18";
  			x[0].colSpan="3";
  			x[1].colSpan="3";
  			x[2].colSpan="3";
  			x[3].colSpan="3";
  			x[4].colSpan="3";
  			x[5].colSpan="3";
  			for(var i=0;i<th.length;i++)
		 	  {
			if(th[i].className=="dongguan1")
		     	  {
		     	  th[i].parentNode.removeChild(th[i]);
		     	  }	
		 	  }
			 for(var i=0;i<th.length;i++)
		 	  {
			if(th[i].className=="dongguan1")
		     	  {
		     	  th[i].parentNode.removeChild(th[i]);
		     	  }	
		 	  }
			 for(var i=0;i<th.length;i++)
		 	  {
			if(th[i].className=="foshan1")
		     	  {
		     	  th[i].parentNode.removeChild(th[i]);
		     	  }	
		 	  }
			 for(var i=0;i<th.length;i++)
		 	  {
			if(th[i].className=="foshan1")
		     	  {
		     	  th[i].parentNode.removeChild(th[i]);
		     	  }	
		 	  }
			 for(var i=0;i<th.length;i++)
		 	  {
			if(th[i].className=="shenzhen1")
		     	  {
		     	  th[i].parentNode.removeChild(th[i]);
		     	  }	
		 	  }
			 for(var i=0;i<th.length;i++)
		 	  {
			if(th[i].className=="shenzhen1")
		     	  {
		     	  th[i].parentNode.removeChild(th[i]);
		     	  }	
		 	  }
			 for(var i=0;i<th.length;i++)
		 	  {
			if(th[i].className=="shenzhen1")
		     	  {
		     	  th[i].parentNode.removeChild(th[i]);
		     	  }	
		 	  }
			
			for(var i=0;i<th.length;i++)
 	  {
 	 
 	 
 	if(th[i].className=="shenzhen")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	
 	if(th[i].className=="shenzhen1")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	 if(th[i].className=="shenzhen2")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	  if(th[i].className=="shenzhen3")
	      {
	      th[i].parentNode.removeChild(th[i]);
	      }
 	  if(th[i].className=="foshan")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	  if(th[i].className=="foshan1")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	  if(th[i].className=="foshan2")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	  if(th[i].className=="foshan3")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	 if(th[i].className=="dongguan")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 	 if(th[i].className=="dongguan1")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }
 
 	 $("#shen4").remove();
 	 $("#shen6").remove();
 	 $("#fo4").remove();
 	 $("#dong4").remove();
 	 $("#fo6").remove();
 	 $("#dong6").remove();
 	
 	  }
        	  
          }  
        }
        	
 //鑻ラ€夋嫨娣卞湷杩愯惀涓績------------------------------------------------------------
        if(cityArea.length==1 && cityArea[0]=="3"){
       	 /*瀛ｅ害琛? */
				z[3].colSpan="18";
				z[4].colSpan="21";
				z[5].colSpan="18";
				z[6].colSpan="18";
				/* 杩愯惀涓績琛? */
				y[0].colSpan="18";
				y[1].colSpan="21";
				y[2].colSpan="18";
				y[3].colSpan="18";
				/* 鍦板競琛?*/
				x[0].colSpan="3";
				x[1].colSpan="3";
				x[2].colSpan="3";
				x[3].colSpan="3";
				x[4].colSpan="3";
				x[5].colSpan="3";
				x[6].colSpan="3";
				x[7].colSpan="3";
				x[8].colSpan="3";
				x[9].colSpan="3";
				x[10].colSpan="3";
				x[11].colSpan="3";
				x[12].colSpan="3";
				x[13].colSpan="3";
				x[14].colSpan="3";
				x[15].colSpan="3";
				x[16].colSpan="3";
				x[17].colSpan="3";
				x[18].colSpan="3";
				x[19].colSpan="3";
				x[20].colSpan="3";
				x[21].colSpan="3";
				x[22].colSpan="3";
				x[23].colSpan="3";
				x[24].colSpan="3";
			
       	
       	for(var i=0;i<th.length;i++)
        	  {
        	 
        	 if(th[i].className=="guangzhou")
        	  {
        
        	  th[i].parentNode.removeChild(th[i]);
        	  }
        	if(th[i].className=="guangzhou1")
     	  {
     	  th[i].parentNode.removeChild(th[i]);
     	  }
        	
        	
        	if(th[i].className=="guangzhou2")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }
        	if(th[i].className=="guangzhou3")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }
        	 
        	  if(th[i].className=="foshan")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }
        	  if(th[i].className=="foshan1")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }
        	  if(th[i].className=="foshan2")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }
        	  if(th[i].className=="foshan3")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }
        	 if(th[i].className=="dongguan")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }
        	 if(th[i].className=="dongguan1")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }
        	 if(th[i].className=="dongguan2")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }
        	 if(th[i].className=="dongguan3")
      	      {
      	     th[i].parentNode.removeChild(th[i]);
      	      }
        	  }
       	
       	//濡傛灉鍙€夋寚鏍囧€?
   		 if(showDu.length==1 && showDu[0]=="1"){
   			
			z[3].colSpan="7";
   			y[1].colSpan="7";
   			x[3].colSpan="1";
   			x[4].colSpan="1";
   			x[5].colSpan="1";
   			x[6].colSpan="1";
   			x[7].colSpan="1";
   			x[8].colSpan="1";
   			x[9].colSpan="1"; 
   			
   		 for(var i=0;i<th.length;i++)
    	  {
   	      if(th[i].className=="guangzhou")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }	
    	  }
   			for(var i=0;i<th.length;i++)
          	  {
          	  if(th[i].className=="shenzhen2")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
          	  if(th[i].className=="shenzhen3")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
          	if(th[i].className=="guangzhou")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }
          	
          	if(th[i].className=="guangzhou1")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }
          	 if(th[i].className=="guangzhou2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
          	  if(th[i].className=="guangzhou3")
        	      {
        	      th[i].parentNode.removeChild(th[i]);
        	      }
          	  if(th[i].className=="foshan")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
          	  if(th[i].className=="foshan1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
          	  if(th[i].className=="foshan2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
          	  if(th[i].className=="foshan3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
          	 if(th[i].className=="dongguan")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
          	 if(th[i].className=="dongguan1")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
          	 $("#guang4").remove();
          	 $("#guang6").remove();
          	 $("#fo4").remove();
          	 $("#dong4").remove();
          	 $("#fo6").remove();
          	 $("#dong6").remove();
          	
          	  }
   			for(var i=0;i<th.length;i++)
            	  {
   				 if(th[i].className=="guangzhou1")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
            	  }
   			for(var i=0;i<th.length;i++)
          	  {
 				 if(th[i].className=="guangzhou1")
 	         	  {
 	         	  th[i].parentNode.removeChild(th[i]);
 	         	  }
          	  }
   			for(var i=0;i<th.length;i++)
            	  {
   				 if(th[i].className=="foshan1")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
            	  }
   			for(var i=0;i<th.length;i++)
            	  {
   				 if(th[i].className=="foshan1")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
            	  }
   			for(var i=0;i<th.length;i++)
            	  {
   				 if(th[i].className=="dongguan1")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
            	  }
   			for(var i=0;i<th.length;i++)
              	  {
      				 if(th[i].className=="dongguan1")
      	         	  {
      	         	  th[i].parentNode.removeChild(th[i]);
      	         	  }
               	  }
   		 }
          if(showDu.length==1 && showDu[0]=="2"){
        	    z[3].colSpan="7";
     			y[1].colSpan="7";
     			x[3].colSpan="1";
     			x[4].colSpan="1";
     			x[5].colSpan="1";
     			x[6].colSpan="1";
     			x[7].colSpan="1";
     			x[8].colSpan="1";
     			x[9].colSpan="1"; 
     			 for(var i=0;i<th.length;i++)
     		 	  {
     			if(th[i].className=="shenzhen1")
     		     	  {
     		     	  th[i].parentNode.removeChild(th[i]);
     		     	  }	
     		 	  }
     			for(var i=0;i<th.length;i++)
   		 	  {
   			if(th[i].className=="shenzhen1")
   		     	  {
   		     	  th[i].parentNode.removeChild(th[i]);
   		     	  }	
   		 	  }
     			for(var i=0;i<th.length;i++)
   		 	  {
   			if(th[i].className=="shenzhen1")
   		     	  {
   		     	  th[i].parentNode.removeChild(th[i]);
   		     	  }	
   		 	  }
     			for(var i=0;i<th.length;i++)
     	    	  {
     	   	      if(th[i].className=="guangzhou")
     	        	  {
     	        	  th[i].parentNode.removeChild(th[i]);
     	        	  }	
     	    	  }
     	   			for(var i=0;i<th.length;i++)
     	          	  {
     	          	  if(th[i].className=="shenzhen1")
     	          	  {
     	          	  th[i].parentNode.removeChild(th[i]);
     	          	  }
     	          	  if(th[i].className=="shenzhen3")
     	          	  {
     	          	  th[i].parentNode.removeChild(th[i]);
     	          	  }
     	          	if(th[i].className=="guangzhou")
     	       	  {
     	       	  th[i].parentNode.removeChild(th[i]);
     	       	  }
     	          	
     	          	if(th[i].className=="guangzhou1")
     	       	  {
     	       	  th[i].parentNode.removeChild(th[i]);
     	       	  }
     	          	 if(th[i].className=="guangzhou2")
     	         	  {
     	         	  th[i].parentNode.removeChild(th[i]);
     	         	  }
     	          	  if(th[i].className=="guangzhou3")
     	        	      {
     	        	      th[i].parentNode.removeChild(th[i]);
     	        	      }
     	          	  if(th[i].className=="foshan")
     	         	  {
     	         	  th[i].parentNode.removeChild(th[i]);
     	         	  }
     	          	  if(th[i].className=="foshan1")
     	         	  {
     	         	  th[i].parentNode.removeChild(th[i]);
     	         	  }
     	          	  if(th[i].className=="foshan2")
     	         	  {
     	         	  th[i].parentNode.removeChild(th[i]);
     	         	  }
     	          	  if(th[i].className=="foshan3")
     	         	  {
     	         	  th[i].parentNode.removeChild(th[i]);
     	         	  }
     	          	 if(th[i].className=="dongguan")
     	        	  {
     	        	  th[i].parentNode.removeChild(th[i]);
     	        	  }
     	          	 if(th[i].className=="dongguan1")
     	        	  {
     	        	  th[i].parentNode.removeChild(th[i]);
     	        	  }
     	          	 $("#guang4").remove();
     	          	 $("#guang6").remove();
     	          	 $("#fo4").remove();
     	          	 $("#dong4").remove();
     	          	 $("#fo6").remove();
     	          	 $("#dong6").remove();
     	          	
     	          	  }
     	   			for(var i=0;i<th.length;i++)
     	            	  {
     	   				 if(th[i].className=="guangzhou1")
     	   	         	  {
     	   	         	  th[i].parentNode.removeChild(th[i]);
     	   	         	  }
     	            	  }
     	   			for(var i=0;i<th.length;i++)
     	          	  {
     	 				 if(th[i].className=="guangzhou1")
     	 	         	  {
     	 	         	  th[i].parentNode.removeChild(th[i]);
     	 	         	  }
     	          	  }
     	   			for(var i=0;i<th.length;i++)
     	            	  {
     	   				 if(th[i].className=="foshan1")
     	   	         	  {
     	   	         	  th[i].parentNode.removeChild(th[i]);
     	   	         	  }
     	            	  }
     	   			for(var i=0;i<th.length;i++)
     	            	  {
     	   				 if(th[i].className=="foshan1")
     	   	         	  {
     	   	         	  th[i].parentNode.removeChild(th[i]);
     	   	         	  }
     	            	  }
     	   			for(var i=0;i<th.length;i++)
     	            	  {
     	   				 if(th[i].className=="dongguan1")
     	   	         	  {
     	   	         	  th[i].parentNode.removeChild(th[i]);
     	   	         	  }
     	            	  }
     	   			for(var i=0;i<th.length;i++)
     	              	  {
     	      				 if(th[i].className=="dongguan1")
     	      	         	  {
     	      	         	  th[i].parentNode.removeChild(th[i]);
     	      	         	  }
     	               	  }
   		}
          if(showDu.length==1 && showDu[0]=="3"){
        	  z[3].colSpan="7";
   			y[1].colSpan="7";
   			x[3].colSpan="1";
   			x[4].colSpan="1";
   			x[5].colSpan="1";
   			x[6].colSpan="1";
   			x[7].colSpan="1";
   			x[8].colSpan="1";
   			x[9].colSpan="1"; 
   			 for(var i=0;i<th.length;i++)
   		 	  {
   			if(th[i].className=="shenzhen2")
   		     	  {
   		     	  th[i].parentNode.removeChild(th[i]);
   		     	  }	
   		 	  }
   			for(var i=0;i<th.length;i++)
 		 	  {
 			if(th[i].className=="shenzhen1")
 		     	  {
 		     	  th[i].parentNode.removeChild(th[i]);
 		     	  }	
 		 	  }
   			for(var i=0;i<th.length;i++)
 		 	  {
 			if(th[i].className=="shenzhen1")
 		     	  {
 		     	  th[i].parentNode.removeChild(th[i]);
 		     	  }	
 		 	  }
   			for(var i=0;i<th.length;i++)
   	    	  {
   	   	      if(th[i].className=="guangzhou")
   	        	  {
   	        	  th[i].parentNode.removeChild(th[i]);
   	        	  }	
   	    	  }
   	   			for(var i=0;i<th.length;i++)
   	          	  {
   	          	  if(th[i].className=="shenzhen1")
   	          	  {
   	          	  th[i].parentNode.removeChild(th[i]);
   	          	  }
   	          	  if(th[i].className=="shenzhen2")
   	          	  {
   	          	  th[i].parentNode.removeChild(th[i]);
   	          	  }
   	          	if(th[i].className=="guangzhou")
   	       	  {
   	       	  th[i].parentNode.removeChild(th[i]);
   	       	  }
   	          	
   	          	if(th[i].className=="guangzhou1")
   	       	  {
   	       	  th[i].parentNode.removeChild(th[i]);
   	       	  }
   	          	 if(th[i].className=="guangzhou2")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
   	          	  if(th[i].className=="guangzhou3")
   	        	      {
   	        	      th[i].parentNode.removeChild(th[i]);
   	        	      }
   	          	  if(th[i].className=="foshan")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
   	          	  if(th[i].className=="foshan1")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
   	          	  if(th[i].className=="foshan2")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
   	          	  if(th[i].className=="foshan3")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
   	          	 if(th[i].className=="dongguan")
   	        	  {
   	        	  th[i].parentNode.removeChild(th[i]);
   	        	  }
   	          	 if(th[i].className=="dongguan1")
   	        	  {
   	        	  th[i].parentNode.removeChild(th[i]);
   	        	  }
   	          	 $("#guang4").remove();
   	          	 $("#guang6").remove();
   	          	 $("#fo4").remove();
   	          	 $("#dong4").remove();
   	          	 $("#fo6").remove();
   	          	 $("#dong6").remove();
   	          	
   	          	  }
   	   			for(var i=0;i<th.length;i++)
   	            	  {
   	   				 if(th[i].className=="guangzhou1")
   	   	         	  {
   	   	         	  th[i].parentNode.removeChild(th[i]);
   	   	         	  }
   	            	  }
   	   			for(var i=0;i<th.length;i++)
   	          	  {
   	 				 if(th[i].className=="guangzhou1")
   	 	         	  {
   	 	         	  th[i].parentNode.removeChild(th[i]);
   	 	         	  }
   	          	  }
   	   			for(var i=0;i<th.length;i++)
   	            	  {
   	   				 if(th[i].className=="foshan1")
   	   	         	  {
   	   	         	  th[i].parentNode.removeChild(th[i]);
   	   	         	  }
   	            	  }
   	   			for(var i=0;i<th.length;i++)
   	            	  {
   	   				 if(th[i].className=="foshan1")
   	   	         	  {
   	   	         	  th[i].parentNode.removeChild(th[i]);
   	   	         	  }
   	            	  }
   	   			for(var i=0;i<th.length;i++)
   	            	  {
   	   				 if(th[i].className=="dongguan1")
   	   	         	  {
   	   	         	  th[i].parentNode.removeChild(th[i]);
   	   	         	  }
   	            	  }
   	   			for(var i=0;i<th.length;i++)
   	              	  {
   	      				 if(th[i].className=="dongguan1")
   	      	         	  {
   	      	         	  th[i].parentNode.removeChild(th[i]);
   	      	         	  }
   	               	  }
}
          if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="2"){
        	z[3].colSpan="14";
   			y[1].colSpan="14";
   			x[3].colSpan="2";
   			x[4].colSpan="2";
   			x[5].colSpan="2";
   			x[6].colSpan="2";
   			x[7].colSpan="2";
   			x[8].colSpan="2";
   			x[9].colSpan="2"; 
   			
   			
   			for(var i=0;i<th.length;i++)
 		 	  {
 			if(th[i].className=="shenzhen3")
 		     	  {
 		     	  th[i].parentNode.removeChild(th[i]);
 		     	  }	
 		 	  }
   			for(var i=0;i<th.length;i++)
   	    	  {
   	   	      if(th[i].className=="guangzhou")
   	        	  {
   	        	  th[i].parentNode.removeChild(th[i]);
   	        	  }	
   	    	  }
   	   			for(var i=0;i<th.length;i++)
   	          	  {
   	          	  if(th[i].className=="shenzhen3")
   	          	  {
   	          	  th[i].parentNode.removeChild(th[i]);
   	          	  }
   	          	  if(th[i].className=="shenzhen3")
   	          	  {
   	          	  th[i].parentNode.removeChild(th[i]);
   	          	  }
   	          	if(th[i].className=="guangzhou")
   	       	  {
   	       	  th[i].parentNode.removeChild(th[i]);
   	       	  }
   	          	
   	          	if(th[i].className=="guangzhou1")
   	       	  {
   	       	  th[i].parentNode.removeChild(th[i]);
   	       	  }
   	          	 if(th[i].className=="guangzhou2")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
   	          	  if(th[i].className=="guangzhou3")
   	        	      {
   	        	      th[i].parentNode.removeChild(th[i]);
   	        	      }
   	          	  if(th[i].className=="foshan")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
   	          	  if(th[i].className=="foshan1")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
   	          	  if(th[i].className=="foshan2")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
   	          	  if(th[i].className=="foshan3")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
   	          	 if(th[i].className=="dongguan")
   	        	  {
   	        	  th[i].parentNode.removeChild(th[i]);
   	        	  }
   	          	 if(th[i].className=="dongguan1")
   	        	  {
   	        	  th[i].parentNode.removeChild(th[i]);
   	        	  }
   	          	 $("#guang4").remove();
   	          	 $("#guang6").remove();
   	          	 $("#fo4").remove();
   	          	 $("#dong4").remove();
   	          	 $("#fo6").remove();
   	          	 $("#dong6").remove();
   	          	
   	          	  }
   	   			for(var i=0;i<th.length;i++)
   	            	  {
   	   				 if(th[i].className=="guangzhou1")
   	   	         	  {
   	   	         	  th[i].parentNode.removeChild(th[i]);
   	   	         	  }
   	            	  }
   	   			for(var i=0;i<th.length;i++)
   	          	  {
   	 				 if(th[i].className=="guangzhou1")
   	 	         	  {
   	 	         	  th[i].parentNode.removeChild(th[i]);
   	 	         	  }
   	          	  }
   	   			for(var i=0;i<th.length;i++)
   	            	  {
   	   				 if(th[i].className=="foshan1")
   	   	         	  {
   	   	         	  th[i].parentNode.removeChild(th[i]);
   	   	         	  }
   	            	  }
   	   			for(var i=0;i<th.length;i++)
   	            	  {
   	   				 if(th[i].className=="foshan1")
   	   	         	  {
   	   	         	  th[i].parentNode.removeChild(th[i]);
   	   	         	  }
   	            	  }
   	   			for(var i=0;i<th.length;i++)
   	            	  {
   	   				 if(th[i].className=="dongguan1")
   	   	         	  {
   	   	         	  th[i].parentNode.removeChild(th[i]);
   	   	         	  }
   	            	  }
   	   			for(var i=0;i<th.length;i++)
   	              	  {
   	      				 if(th[i].className=="dongguan1")
   	      	         	  {
   	      	         	  th[i].parentNode.removeChild(th[i]);
   	      	         	  }
   	               	  }
          }
         if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="3"){
        	    z[3].colSpan="14";
    			y[1].colSpan="14";
    			x[3].colSpan="2";
    			x[4].colSpan="2";
    			x[5].colSpan="2";
    			x[6].colSpan="2";
    			x[7].colSpan="2";
    			x[8].colSpan="2";
    			x[9].colSpan="2"; 
    			
    			
    			for(var i=0;i<th.length;i++)
  		 	  {
  			if(th[i].className=="shenzhen2")
  		     	  {
  		     	  th[i].parentNode.removeChild(th[i]);
  		     	  }	
  		 	  }
    			for(var i=0;i<th.length;i++)
    	    	  {
    	   	      if(th[i].className=="guangzhou")
    	        	  {
    	        	  th[i].parentNode.removeChild(th[i]);
    	        	  }	
    	    	  }
    	   			for(var i=0;i<th.length;i++)
    	          	  {
    	          	  if(th[i].className=="shenzhen2")
    	          	  {
    	          	  th[i].parentNode.removeChild(th[i]);
    	          	  }
    	          	  if(th[i].className=="shenzhen2")
    	          	  {
    	          	  th[i].parentNode.removeChild(th[i]);
    	          	  }
    	          	if(th[i].className=="guangzhou")
    	       	  {
    	       	  th[i].parentNode.removeChild(th[i]);
    	       	  }
    	          	
    	          	if(th[i].className=="guangzhou1")
    	       	  {
    	       	  th[i].parentNode.removeChild(th[i]);
    	       	  }
    	          	 if(th[i].className=="guangzhou2")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
    	          	  if(th[i].className=="guangzhou3")
    	        	      {
    	        	      th[i].parentNode.removeChild(th[i]);
    	        	      }
    	          	  if(th[i].className=="foshan")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
    	          	  if(th[i].className=="foshan1")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
    	          	  if(th[i].className=="foshan2")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
    	          	  if(th[i].className=="foshan3")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
    	          	 if(th[i].className=="dongguan")
    	        	  {
    	        	  th[i].parentNode.removeChild(th[i]);
    	        	  }
    	          	 if(th[i].className=="dongguan1")
    	        	  {
    	        	  th[i].parentNode.removeChild(th[i]);
    	        	  }
    	          	 $("#guang4").remove();
    	          	 $("#guang6").remove();
    	          	 $("#fo4").remove();
    	          	 $("#dong4").remove();
    	          	 $("#fo6").remove();
    	          	 $("#dong6").remove();
    	          	
    	          	  }
    	   			for(var i=0;i<th.length;i++)
    	            	  {
    	   				 if(th[i].className=="guangzhou1")
    	   	         	  {
    	   	         	  th[i].parentNode.removeChild(th[i]);
    	   	         	  }
    	            	  }
    	   			for(var i=0;i<th.length;i++)
    	          	  {
    	 				 if(th[i].className=="guangzhou1")
    	 	         	  {
    	 	         	  th[i].parentNode.removeChild(th[i]);
    	 	         	  }
    	          	  }
    	   			for(var i=0;i<th.length;i++)
    	            	  {
    	   				 if(th[i].className=="foshan1")
    	   	         	  {
    	   	         	  th[i].parentNode.removeChild(th[i]);
    	   	         	  }
    	            	  }
    	   			for(var i=0;i<th.length;i++)
    	            	  {
    	   				 if(th[i].className=="foshan1")
    	   	         	  {
    	   	         	  th[i].parentNode.removeChild(th[i]);
    	   	         	  }
    	            	  }
    	   			for(var i=0;i<th.length;i++)
    	            	  {
    	   				 if(th[i].className=="dongguan1")
    	   	         	  {
    	   	         	  th[i].parentNode.removeChild(th[i]);
    	   	         	  }
    	            	  }
    	   			for(var i=0;i<th.length;i++)
    	              	  {
    	      				 if(th[i].className=="dongguan1")
    	      	         	  {
    	      	         	  th[i].parentNode.removeChild(th[i]);
    	      	         	  }
    	               	  }
         }
         
         if(showDu.length==2 && showDu[0]=="2" && showDu[1]=="3"){
     	    z[3].colSpan="14";
 			y[1].colSpan="14";
 			x[3].colSpan="2";
 			x[4].colSpan="2";
 			x[5].colSpan="2";
 			x[6].colSpan="2";
 			x[7].colSpan="2";
 			x[8].colSpan="2";
 			x[9].colSpan="2"; 
 			
 			
 			for(var i=0;i<th.length;i++)
		 	  {
			if(th[i].className=="shenzhen1")
		     	  {
		     	  th[i].parentNode.removeChild(th[i]);
		     	  }	
		 	  }
 			for(var i=0;i<th.length;i++)
 	    	  {
 	   	      if(th[i].className=="guangzhou")
 	        	  {
 	        	  th[i].parentNode.removeChild(th[i]);
 	        	  }	
 	    	  }
 	   			for(var i=0;i<th.length;i++)
 	          	  {
 	          	  if(th[i].className=="shenzhen1")
 	          	  {
 	          	  th[i].parentNode.removeChild(th[i]);
 	          	  }
 	          	  if(th[i].className=="shenzhen1")
 	          	  {
 	          	  th[i].parentNode.removeChild(th[i]);
 	          	  }
 	          	if(th[i].className=="guangzhou")
 	       	  {
 	       	  th[i].parentNode.removeChild(th[i]);
 	       	  }
 	          	
 	          	if(th[i].className=="guangzhou1")
 	       	  {
 	       	  th[i].parentNode.removeChild(th[i]);
 	       	  }
 	          	 if(th[i].className=="guangzhou2")
 	         	  {
 	         	  th[i].parentNode.removeChild(th[i]);
 	         	  }
 	          	  if(th[i].className=="guangzhou3")
 	        	      {
 	        	      th[i].parentNode.removeChild(th[i]);
 	        	      }
 	          	  if(th[i].className=="foshan")
 	         	  {
 	         	  th[i].parentNode.removeChild(th[i]);
 	         	  }
 	          	  if(th[i].className=="foshan1")
 	         	  {
 	         	  th[i].parentNode.removeChild(th[i]);
 	         	  }
 	          	  if(th[i].className=="foshan2")
 	         	  {
 	         	  th[i].parentNode.removeChild(th[i]);
 	         	  }
 	          	  if(th[i].className=="foshan3")
 	         	  {
 	         	  th[i].parentNode.removeChild(th[i]);
 	         	  }
 	          	 if(th[i].className=="dongguan")
 	        	  {
 	        	  th[i].parentNode.removeChild(th[i]);
 	        	  }
 	          	 if(th[i].className=="dongguan1")
 	        	  {
 	        	  th[i].parentNode.removeChild(th[i]);
 	        	  }
 	          	 $("#guang4").remove();
 	          	 $("#guang6").remove();
 	          	 $("#fo4").remove();
 	          	 $("#dong4").remove();
 	          	 $("#fo6").remove();
 	          	 $("#dong6").remove();
 	          	
 	          	  }
 	   			for(var i=0;i<th.length;i++)
 	            	  {
 	   				 if(th[i].className=="guangzhou1")
 	   	         	  {
 	   	         	  th[i].parentNode.removeChild(th[i]);
 	   	         	  }
 	            	  }
 	   			for(var i=0;i<th.length;i++)
 	          	  {
 	 				 if(th[i].className=="guangzhou1")
 	 	         	  {
 	 	         	  th[i].parentNode.removeChild(th[i]);
 	 	         	  }
 	          	  }
 	   			for(var i=0;i<th.length;i++)
 	            	  {
 	   				 if(th[i].className=="foshan1")
 	   	         	  {
 	   	         	  th[i].parentNode.removeChild(th[i]);
 	   	         	  }
 	            	  }
 	   			for(var i=0;i<th.length;i++)
 	            	  {
 	   				 if(th[i].className=="foshan1")
 	   	         	  {
 	   	         	  th[i].parentNode.removeChild(th[i]);
 	   	         	  }
 	            	  }
 	   			for(var i=0;i<th.length;i++)
 	            	  {
 	   				 if(th[i].className=="dongguan1")
 	   	         	  {
 	   	         	  th[i].parentNode.removeChild(th[i]);
 	   	         	  }
 	            	  }
 	   			for(var i=0;i<th.length;i++)
 	              	  {
 	      				 if(th[i].className=="dongguan1")
 	      	         	  {
 	      	         	  th[i].parentNode.removeChild(th[i]);
 	      	         	  }
 	               	  }
      }
         if(showDu.length==3 && showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
        	 z[3].colSpan="21";
  			y[1].colSpan="21";
  			x[3].colSpan="3";
  			x[4].colSpan="3";
  			x[5].colSpan="3";
  			x[6].colSpan="3";
  			x[7].colSpan="3";
  			x[8].colSpan="3";
  			x[9].colSpan="3"; 
  			
			for(var i=0;i<th.length;i++)
	    	  {
	   	      if(th[i].className=="guangzhou")
	        	  {
	        	  th[i].parentNode.removeChild(th[i]);
	        	  }	
	    	  }
	   			for(var i=0;i<th.length;i++)
	          	  {
	          	 
	          	if(th[i].className=="guangzhou")
	       	  {
	       	  th[i].parentNode.removeChild(th[i]);
	       	  }
	          	
	          	if(th[i].className=="guangzhou1")
	       	  {
	       	  th[i].parentNode.removeChild(th[i]);
	       	  }
	          	 if(th[i].className=="guangzhou2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
	          	  if(th[i].className=="guangzhou3")
	        	      {
	        	      th[i].parentNode.removeChild(th[i]);
	        	      }
	          	  if(th[i].className=="foshan")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
	          	  if(th[i].className=="foshan1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
	          	  if(th[i].className=="foshan2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
	          	  if(th[i].className=="foshan3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
	          	 if(th[i].className=="dongguan")
	        	  {
	        	  th[i].parentNode.removeChild(th[i]);
	        	  }
	          	 if(th[i].className=="dongguan1")
	        	  {
	        	  th[i].parentNode.removeChild(th[i]);
	        	  }
	          	 $("#guang4").remove();
	          	 $("#guang6").remove();
	          	 $("#fo4").remove();
	          	 $("#dong4").remove();
	          	 $("#fo6").remove();
	          	 $("#dong6").remove();
	          	
	          	  }
	   			for(var i=0;i<th.length;i++)
	            	  {
	   				 if(th[i].className=="guangzhou1")
	   	         	  {
	   	         	  th[i].parentNode.removeChild(th[i]);
	   	         	  }
	            	  }
	   			for(var i=0;i<th.length;i++)
	          	  {
	 				 if(th[i].className=="guangzhou1")
	 	         	  {
	 	         	  th[i].parentNode.removeChild(th[i]);
	 	         	  }
	          	  }
	   			for(var i=0;i<th.length;i++)
	            	  {
	   				 if(th[i].className=="foshan1")
	   	         	  {
	   	         	  th[i].parentNode.removeChild(th[i]);
	   	         	  }
	            	  }
	   			for(var i=0;i<th.length;i++)
	            	  {
	   				 if(th[i].className=="foshan1")
	   	         	  {
	   	         	  th[i].parentNode.removeChild(th[i]);
	   	         	  }
	            	  }
	   			for(var i=0;i<th.length;i++)
	            	  {
	   				 if(th[i].className=="dongguan1")
	   	         	  {
	   	         	  th[i].parentNode.removeChild(th[i]);
	   	         	  }
	            	  }
	   			for(var i=0;i<th.length;i++)
	              	  {
	      				 if(th[i].className=="dongguan1")
	      	         	  {
	      	         	  th[i].parentNode.removeChild(th[i]);
	      	         	  }
	               	  }
         } 
       }

 //鑻ラ€夋嫨浣涘北杩愯惀涓績-----------------------------------------------------------------
        if(cityArea.length==1 && cityArea[0]=="4"){
          	 /*瀛ｅ害琛? */
   				z[3].colSpan="18";
   				z[4].colSpan="21";
   				z[5].colSpan="18";
   				z[6].colSpan="18";
   				/* 杩愯惀涓績琛? */
   				y[0].colSpan="18";
   				y[1].colSpan="21";
   				y[2].colSpan="18";
   				y[3].colSpan="18";
   				/* 鍦板競琛?*/
   				x[0].colSpan="3";
   				x[1].colSpan="3";
   				x[2].colSpan="3";
   				x[3].colSpan="3";
   				x[4].colSpan="3";
   				x[5].colSpan="3";
   				x[6].colSpan="3";
   				x[7].colSpan="3";
   				x[8].colSpan="3";
   				x[9].colSpan="3";
   				x[10].colSpan="3";
   				x[11].colSpan="3";
   				x[12].colSpan="3";
   				x[13].colSpan="3";
   				x[14].colSpan="3";
   				x[15].colSpan="3";
   				x[16].colSpan="3";
   				x[17].colSpan="3";
   				x[18].colSpan="3";
   				x[19].colSpan="3";
   				x[20].colSpan="3";
   				x[21].colSpan="3";
   				x[22].colSpan="3";
   				x[23].colSpan="3";
   				x[24].colSpan="3";
   			
          	
          	for(var i=0;i<th.length;i++)
           	  {
           	 
           	 if(th[i].className=="guangzhou")
           	  {
           
           	  th[i].parentNode.removeChild(th[i]);
           	  }
           	if(th[i].className=="guangzhou1")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
           	
           	
           	if(th[i].className=="guangzhou2")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
           	if(th[i].className=="guangzhou3")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
           	 
           	  if(th[i].className=="shenzhen")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
           	  if(th[i].className=="shenzhen1")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
           	  if(th[i].className=="shenzhen2")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
           	  if(th[i].className=="shenzhen3")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
           	 if(th[i].className=="dongguan")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
           	 if(th[i].className=="dongguan1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
           	 if(th[i].className=="dongguan2")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
           	 if(th[i].className=="dongguan3")
         	      {
         	     th[i].parentNode.removeChild(th[i]);
         	      }
           	  }
          	
          	//濡傛灉鍙€夋寚鏍囧€?
      		 if(showDu.length==1 && showDu[0]=="1"){
      			
      			z[3].colSpan="6";
    			y[1].colSpan="6";
    			x[6].colSpan="1";
    			x[7].colSpan="1";
    			x[8].colSpan="1";
    			x[9].colSpan="1";
    			x[10].colSpan="1";
    			x[11].colSpan="1";
      			
      		 for(var i=0;i<th.length;i++)
       	  {
      	      if(th[i].className=="guangzhou")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	  }
      			for(var i=0;i<th.length;i++)
             	  {
             	  if(th[i].className=="foshan2")
             	  {
             	  th[i].parentNode.removeChild(th[i]);
             	  }
             	  if(th[i].className=="foshan3")
             	  {
             	  th[i].parentNode.removeChild(th[i]);
             	  }
             	if(th[i].className=="guangzhou")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
             	
             	if(th[i].className=="guangzhou1")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }
             	 if(th[i].className=="guangzhou2")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }
             	  if(th[i].className=="guangzhou3")
           	      {
           	      th[i].parentNode.removeChild(th[i]);
           	      }
             	  if(th[i].className=="shenzhen")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }
             	  if(th[i].className=="shenzhen1")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }
             	  if(th[i].className=="shenzhen2")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }
             	  if(th[i].className=="shenzhen3")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }
             	 if(th[i].className=="dongguan")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }
             	 if(th[i].className=="dongguan1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }
             	 $("#guang4").remove();
             	 $("#guang6").remove();
             	 $("#shen4").remove();
             	 $("#dong4").remove();
             	 $("#shen6").remove();
             	 $("#dong6").remove();
             	
             	  }
      			for(var i=0;i<th.length;i++)
               	  {
      				 if(th[i].className=="guangzhou1")
      	         	  {
      	         	  th[i].parentNode.removeChild(th[i]);
      	         	  }
               	  }
      			for(var i=0;i<th.length;i++)
             	  {
    				 if(th[i].className=="guangzhou1")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
             	  }
      			for(var i=0;i<th.length;i++)
               	  {
      				 if(th[i].className=="shenzhen1")
      	         	  {
      	         	  th[i].parentNode.removeChild(th[i]);
      	         	  }
               	  }
      			for(var i=0;i<th.length;i++)
               	  {
      				 if(th[i].className=="shenzhen1")
      	         	  {
      	         	  th[i].parentNode.removeChild(th[i]);
      	         	  }
               	  }
      			for(var i=0;i<th.length;i++)
               	  {
      				 if(th[i].className=="dongguan1")
      	         	  {
      	         	  th[i].parentNode.removeChild(th[i]);
      	         	  }
               	  }
      			for(var i=0;i<th.length;i++)
                 	  {
         				 if(th[i].className=="dongguan1")
         	         	  {
         	         	  th[i].parentNode.removeChild(th[i]);
         	         	  }
                  	  }
      		 }
             if(showDu.length==1 && showDu[0]=="2"){
            		z[3].colSpan="6";
        			y[1].colSpan="6";
        			x[6].colSpan="1";
        			x[7].colSpan="1";
        			x[8].colSpan="1";
        			x[9].colSpan="1";
        			x[10].colSpan="1";
        			x[11].colSpan="1";
        			for(var i=0;i<th.length;i++)
                 	  {
        				 if(th[i].className=="foshan1")
        	         	  {
        	         	  th[i].parentNode.removeChild(th[i]);
        	         	  }
                 	  }
          			
          		 for(var i=0;i<th.length;i++)
           	  {
          	      if(th[i].className=="guangzhou")
               	  {
               	  th[i].parentNode.removeChild(th[i]);
               	  }	
           	  }
          			for(var i=0;i<th.length;i++)
                 	  {
                 	  if(th[i].className=="foshan1")
                 	  {
                 	  th[i].parentNode.removeChild(th[i]);
                 	  }
                 	  if(th[i].className=="foshan3")
                 	  {
                 	  th[i].parentNode.removeChild(th[i]);
                 	  }
                 	if(th[i].className=="guangzhou")
              	  {
              	  th[i].parentNode.removeChild(th[i]);
              	  }
                 	
                 	if(th[i].className=="guangzhou1")
              	  {
              	  th[i].parentNode.removeChild(th[i]);
              	  }
                 	 if(th[i].className=="guangzhou2")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }
                 	  if(th[i].className=="guangzhou3")
               	      {
               	      th[i].parentNode.removeChild(th[i]);
               	      }
                 	  if(th[i].className=="shenzhen")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }
                 	  if(th[i].className=="shenzhen1")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }
                 	  if(th[i].className=="shenzhen2")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }
                 	  if(th[i].className=="shenzhen3")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }
                 	 if(th[i].className=="dongguan")
               	  {
               	  th[i].parentNode.removeChild(th[i]);
               	  }
                 	 if(th[i].className=="dongguan1")
               	  {
               	  th[i].parentNode.removeChild(th[i]);
               	  }
                 	 $("#guang4").remove();
                 	 $("#guang6").remove();
                 	 $("#shen4").remove();
                 	 $("#dong4").remove();
                 	 $("#shen6").remove();
                 	 $("#dong6").remove();
                 	
                 	  }
          			for(var i=0;i<th.length;i++)
                   	  {
          				 if(th[i].className=="guangzhou1")
          	         	  {
          	         	  th[i].parentNode.removeChild(th[i]);
          	         	  }
                   	  }
          			for(var i=0;i<th.length;i++)
                 	  {
        				 if(th[i].className=="guangzhou1")
        	         	  {
        	         	  th[i].parentNode.removeChild(th[i]);
        	         	  }
                 	  }
          			for(var i=0;i<th.length;i++)
                   	  {
          				 if(th[i].className=="shenzhen1")
          	         	  {
          	         	  th[i].parentNode.removeChild(th[i]);
          	         	  }
                   	  }
          			for(var i=0;i<th.length;i++)
                   	  {
          				 if(th[i].className=="shenzhen1")
          	         	  {
          	         	  th[i].parentNode.removeChild(th[i]);
          	         	  }
                   	  }
          			for(var i=0;i<th.length;i++)
                   	  {
          				 if(th[i].className=="dongguan1")
          	         	  {
          	         	  th[i].parentNode.removeChild(th[i]);
          	         	  }
                   	  }
          			for(var i=0;i<th.length;i++)
                     	  {
             				 if(th[i].className=="dongguan1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
      		}
             if(showDu.length==1 && showDu[0]=="3"){
            		z[3].colSpan="6";
        			y[1].colSpan="6";
        			x[6].colSpan="1";
        			x[7].colSpan="1";
        			x[8].colSpan="1";
        			x[9].colSpan="1";
        			x[10].colSpan="1";
        			x[11].colSpan="1";
          			
          		 for(var i=0;i<th.length;i++)
           	  {
          	      if(th[i].className=="guangzhou")
               	  {
               	  th[i].parentNode.removeChild(th[i]);
               	  }	
           	  }
          			for(var i=0;i<th.length;i++)
                 	  {
                 	  if(th[i].className=="foshan1")
                 	  {
                 	  th[i].parentNode.removeChild(th[i]);
                 	  }
                 	  if(th[i].className=="foshan2")
                 	  {
                 	  th[i].parentNode.removeChild(th[i]);
                 	  }
                 	if(th[i].className=="guangzhou")
              	  {
              	  th[i].parentNode.removeChild(th[i]);
              	  }
                 	
                 	if(th[i].className=="guangzhou1")
              	  {
              	  th[i].parentNode.removeChild(th[i]);
              	  }
                 	 if(th[i].className=="guangzhou2")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }
                 	  if(th[i].className=="guangzhou3")
               	      {
               	      th[i].parentNode.removeChild(th[i]);
               	      }
                 	  if(th[i].className=="shenzhen")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }
                 	  if(th[i].className=="shenzhen1")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }
                 	  if(th[i].className=="shenzhen2")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }
                 	  if(th[i].className=="shenzhen3")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }
                 	 if(th[i].className=="dongguan")
               	  {
               	  th[i].parentNode.removeChild(th[i]);
               	  }
                 	 if(th[i].className=="dongguan1")
               	  {
               	  th[i].parentNode.removeChild(th[i]);
               	  }
                 	 $("#guang4").remove();
                 	 $("#guang6").remove();
                 	 $("#shen4").remove();
                 	 $("#dong4").remove();
                 	 $("#shen6").remove();
                 	 $("#dong6").remove();
                 	
                 	  }
          			for(var i=0;i<th.length;i++)
                   	  {
          				 if(th[i].className=="guangzhou1")
          	         	  {
          	         	  th[i].parentNode.removeChild(th[i]);
          	         	  }
                   	  }
          			for(var i=0;i<th.length;i++)
                 	  {
        				 if(th[i].className=="guangzhou1")
        	         	  {
        	         	  th[i].parentNode.removeChild(th[i]);
        	         	  }
                 	  }
          			for(var i=0;i<th.length;i++)
                   	  {
          				 if(th[i].className=="shenzhen1")
          	         	  {
          	         	  th[i].parentNode.removeChild(th[i]);
          	         	  }
                   	  }
          			for(var i=0;i<th.length;i++)
                   	  {
          				 if(th[i].className=="shenzhen1")
          	         	  {
          	         	  th[i].parentNode.removeChild(th[i]);
          	         	  }
                   	  }
          			for(var i=0;i<th.length;i++)
                   	  {
          				 if(th[i].className=="dongguan1")
          	         	  {
          	         	  th[i].parentNode.removeChild(th[i]);
          	         	  }
                   	  }
          			for(var i=0;i<th.length;i++)
                     	  {
             				 if(th[i].className=="dongguan1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
   }
             if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="2"){
            	z[3].colSpan="12";
     			y[1].colSpan="12";
     			x[6].colSpan="2";
     			x[7].colSpan="2";
     			x[8].colSpan="2";
     			x[9].colSpan="2";
     			x[10].colSpan="2";
     			x[11].colSpan="2";
      			
      			
     			 for(var i=0;i<th.length;i++)
              	  {
             	      if(th[i].className=="guangzhou")
                  	  {
                  	  th[i].parentNode.removeChild(th[i]);
                  	  }	
              	  }
             			for(var i=0;i<th.length;i++)
                    	  {
                    	  
                    	  if(th[i].className=="foshan3")
                    	  {
                    	  th[i].parentNode.removeChild(th[i]);
                    	  }
                    	if(th[i].className=="guangzhou")
                 	  {
                 	  th[i].parentNode.removeChild(th[i]);
                 	  }
                    	
                    	if(th[i].className=="guangzhou1")
                 	  {
                 	  th[i].parentNode.removeChild(th[i]);
                 	  }
                    	 if(th[i].className=="guangzhou2")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="guangzhou3")
                  	      {
                  	      th[i].parentNode.removeChild(th[i]);
                  	      }
                    	  if(th[i].className=="shenzhen")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="shenzhen1")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="shenzhen2")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="shenzhen3")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	 if(th[i].className=="dongguan")
                  	  {
                  	  th[i].parentNode.removeChild(th[i]);
                  	  }
                    	 if(th[i].className=="dongguan1")
                  	  {
                  	  th[i].parentNode.removeChild(th[i]);
                  	  }
                    	 $("#guang4").remove();
                    	 $("#guang6").remove();
                    	 $("#shen4").remove();
                    	 $("#dong4").remove();
                    	 $("#shen6").remove();
                    	 $("#dong6").remove();
                    	
                    	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="guangzhou1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                    	  {
           				 if(th[i].className=="guangzhou1")
           	         	  {
           	         	  th[i].parentNode.removeChild(th[i]);
           	         	  }
                    	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="shenzhen1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="shenzhen1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="dongguan1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                        	  {
                				 if(th[i].className=="dongguan1")
                	         	  {
                	         	  th[i].parentNode.removeChild(th[i]);
                	         	  }
                         	  }
             }
            if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="3"){
            	z[3].colSpan="12";
     			y[1].colSpan="12";
     			x[6].colSpan="2";
     			x[7].colSpan="2";
     			x[8].colSpan="2";
     			x[9].colSpan="2";
     			x[10].colSpan="2";
     			x[11].colSpan="2";
      			
      			
     			 for(var i=0;i<th.length;i++)
              	  {
             	      if(th[i].className=="guangzhou")
                  	  {
                  	  th[i].parentNode.removeChild(th[i]);
                  	  }	
              	  }
             			for(var i=0;i<th.length;i++)
                    	  {
                    	  
                    	  if(th[i].className=="foshan2")
                    	  {
                    	  th[i].parentNode.removeChild(th[i]);
                    	  }
                    	if(th[i].className=="guangzhou")
                 	  {
                 	  th[i].parentNode.removeChild(th[i]);
                 	  }
                    	
                    	if(th[i].className=="guangzhou1")
                 	  {
                 	  th[i].parentNode.removeChild(th[i]);
                 	  }
                    	 if(th[i].className=="guangzhou2")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="guangzhou3")
                  	      {
                  	      th[i].parentNode.removeChild(th[i]);
                  	      }
                    	  if(th[i].className=="shenzhen")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="shenzhen1")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="shenzhen2")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="shenzhen3")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	 if(th[i].className=="dongguan")
                  	  {
                  	  th[i].parentNode.removeChild(th[i]);
                  	  }
                    	 if(th[i].className=="dongguan1")
                  	  {
                  	  th[i].parentNode.removeChild(th[i]);
                  	  }
                    	 $("#guang4").remove();
                    	 $("#guang6").remove();
                    	 $("#shen4").remove();
                    	 $("#dong4").remove();
                    	 $("#shen6").remove();
                    	 $("#dong6").remove();
                    	
                    	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="guangzhou1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                    	  {
           				 if(th[i].className=="guangzhou1")
           	         	  {
           	         	  th[i].parentNode.removeChild(th[i]);
           	         	  }
                    	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="shenzhen1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="shenzhen1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="dongguan1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                        	  {
                				 if(th[i].className=="dongguan1")
                	         	  {
                	         	  th[i].parentNode.removeChild(th[i]);
                	         	  }
                         	  }
            }
            
            if(showDu.length==2 && showDu[0]=="2" && showDu[1]=="3"){
            	z[3].colSpan="12";
     			y[1].colSpan="12";
     			x[6].colSpan="2";
     			x[7].colSpan="2";
     			x[8].colSpan="2";
     			x[9].colSpan="2";
     			x[10].colSpan="2";
     			x[11].colSpan="2";
      			
      			
     			 for(var i=0;i<th.length;i++)
              	  {
             	      if(th[i].className=="guangzhou")
                  	  {
                  	  th[i].parentNode.removeChild(th[i]);
                  	  }	
              	  }
             			for(var i=0;i<th.length;i++)
                    	  {
                    	  
                    	  if(th[i].className=="foshan1")
                    	  {
                    	  th[i].parentNode.removeChild(th[i]);
                    	  }
                    	if(th[i].className=="guangzhou")
                 	  {
                 	  th[i].parentNode.removeChild(th[i]);
                 	  }
                    	
                    	if(th[i].className=="guangzhou1")
                 	  {
                 	  th[i].parentNode.removeChild(th[i]);
                 	  }
                    	 if(th[i].className=="guangzhou2")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="guangzhou3")
                  	      {
                  	      th[i].parentNode.removeChild(th[i]);
                  	      }
                    	  if(th[i].className=="shenzhen")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="shenzhen1")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="shenzhen2")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="shenzhen3")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	 if(th[i].className=="dongguan")
                  	  {
                  	  th[i].parentNode.removeChild(th[i]);
                  	  }
                    	 if(th[i].className=="dongguan1")
                  	  {
                  	  th[i].parentNode.removeChild(th[i]);
                  	  }
                    	 $("#guang4").remove();
                    	 $("#guang6").remove();
                    	 $("#shen4").remove();
                    	 $("#dong4").remove();
                    	 $("#shen6").remove();
                    	 $("#dong6").remove();
                    	
                    	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="guangzhou1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                    	  {
           				 if(th[i].className=="guangzhou1")
           	         	  {
           	         	  th[i].parentNode.removeChild(th[i]);
           	         	  }
                    	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="shenzhen1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="shenzhen1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="dongguan1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                        	  {
                				 if(th[i].className=="dongguan1")
                	         	  {
                	         	  th[i].parentNode.removeChild(th[i]);
                	         	  }
                         	  }
         }
            if(showDu.length==3 && showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
            	z[3].colSpan="18";
     			y[1].colSpan="18";
     			x[6].colSpan="3";
     			x[7].colSpan="3";
     			x[8].colSpan="3";
     			x[9].colSpan="3";
     			x[10].colSpan="3";
     			x[11].colSpan="3";
      			
      			
     			 for(var i=0;i<th.length;i++)
              	  {
             	      if(th[i].className=="guangzhou")
                  	  {
                  	  th[i].parentNode.removeChild(th[i]);
                  	  }	
              	  }
             			for(var i=0;i<th.length;i++)
                    	  {
                    	  
                    	  
                    	if(th[i].className=="guangzhou")
                 	  {
                 	  th[i].parentNode.removeChild(th[i]);
                 	  }
                    	
                    	if(th[i].className=="guangzhou1")
                 	  {
                 	  th[i].parentNode.removeChild(th[i]);
                 	  }
                    	 if(th[i].className=="guangzhou2")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="guangzhou3")
                  	      {
                  	      th[i].parentNode.removeChild(th[i]);
                  	      }
                    	  if(th[i].className=="shenzhen")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="shenzhen1")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="shenzhen2")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	  if(th[i].className=="shenzhen3")
                   	  {
                   	  th[i].parentNode.removeChild(th[i]);
                   	  }
                    	 if(th[i].className=="dongguan")
                  	  {
                  	  th[i].parentNode.removeChild(th[i]);
                  	  }
                    	 if(th[i].className=="dongguan1")
                  	  {
                  	  th[i].parentNode.removeChild(th[i]);
                  	  }
                    	 $("#guang4").remove();
                    	 $("#guang6").remove();
                    	 $("#shen4").remove();
                    	 $("#dong4").remove();
                    	 $("#shen6").remove();
                    	 $("#dong6").remove();
                    	
                    	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="guangzhou1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                    	  {
           				 if(th[i].className=="guangzhou1")
           	         	  {
           	         	  th[i].parentNode.removeChild(th[i]);
           	         	  }
                    	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="shenzhen1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="shenzhen1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                      	  {
             				 if(th[i].className=="dongguan1")
             	         	  {
             	         	  th[i].parentNode.removeChild(th[i]);
             	         	  }
                      	  }
             			for(var i=0;i<th.length;i++)
                        	  {
                				 if(th[i].className=="dongguan1")
                	         	  {
                	         	  th[i].parentNode.removeChild(th[i]);
                	         	  }
                         	  }

            } 
          }
//鑻ラ€夋嫨涓滆帪杩愯惀涓績
        if(cityArea.length==1 && cityArea[0]=="5"){
         	 /*瀛ｅ害琛? */
  				z[3].colSpan="18";
  				z[4].colSpan="21";
  				z[5].colSpan="18";
  				z[6].colSpan="18";
  				/* 杩愯惀涓績琛? */
  				y[0].colSpan="18";
  				y[1].colSpan="21";
  				y[2].colSpan="18";
  				y[3].colSpan="18";
  				/* 鍦板競琛?*/
  				x[0].colSpan="3";
  				x[1].colSpan="3";
  				x[2].colSpan="3";
  				x[3].colSpan="3";
  				x[4].colSpan="3";
  				x[5].colSpan="3";
  				x[6].colSpan="3";
  				x[7].colSpan="3";
  				x[8].colSpan="3";
  				x[9].colSpan="3";
  				x[10].colSpan="3";
  				x[11].colSpan="3";
  				x[12].colSpan="3";
  				x[13].colSpan="3";
  				x[14].colSpan="3";
  				x[15].colSpan="3";
  				x[16].colSpan="3";
  				x[17].colSpan="3";
  				x[18].colSpan="3";
  				x[19].colSpan="3";
  				x[20].colSpan="3";
  				x[21].colSpan="3";
  				x[22].colSpan="3";
  				x[23].colSpan="3";
  				x[24].colSpan="3";
  			
         	
         	for(var i=0;i<th.length;i++)
          	  {
          	 
          	 if(th[i].className=="guangzhou")
          	  {
          
          	  th[i].parentNode.removeChild(th[i]);
          	  }
          	if(th[i].className=="guangzhou1")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }
          	
          	
          	if(th[i].className=="guangzhou2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
          	if(th[i].className=="guangzhou3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
          	 
          	  if(th[i].className=="shenzhen")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
          	  if(th[i].className=="shenzhen1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
          	  if(th[i].className=="shenzhen2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
          	  if(th[i].className=="shenzhen3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
          	 if(th[i].className=="foshan")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
          	 if(th[i].className=="foshan1")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
          	 if(th[i].className=="foshan2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
          	 if(th[i].className=="foshan3")
        	      {
        	     th[i].parentNode.removeChild(th[i]);
        	      }
          	  }
         	
         	//濡傛灉鍙€夋寚鏍囧€?
     		 if(showDu.length==1 && showDu[0]=="1"){
     			
     		z[3].colSpan="6";
   			y[0].colSpan="6";
   			x[9].colSpan="1";
   			x[10].colSpan="1";
   			x[11].colSpan="1";
   			x[12].colSpan="1";
   			x[13].colSpan="1";
   			x[14].colSpan="1";
   			for(var i=0;i<th.length;i++)
        	  {
				 if(th[i].className=="guangzhou1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
        	  }
   			for(var i=0;i<th.length;i++)
        	  {
				 if(th[i].className=="guangzhou1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
        	  }
   		
   		 for(var i=0;i<th.length;i++)
    	  {
      	if(th[i].className=="shenzhen1")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }	
    	  }	
   		 for(var i=0;i<th.length;i++)
    	  {
      	if(th[i].className=="foshan1")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }	
    	  }
     		 for(var i=0;i<th.length;i++)
      	  {
     	      if(th[i].className=="guangzhou")
          	  {
          	  th[i].parentNode.removeChild(th[i]);
          	  }	
      	  }
     			for(var i=0;i<th.length;i++)
            	  {
            	  if(th[i].className=="dongguan2")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }
            	  if(th[i].className=="dongguan3")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }

            	 $("#guang4").remove();
            	 $("#guang6").remove();
            	 $("#shen4").remove();
            	 $("#fo4").remove();
            	 $("#shen6").remove();
            	 $("#fo6").remove();
            	 $("#fo2").remove();
            	 $("#shen2").remove();
            	
            	  }
     			
     			for(var i=0;i<th.length;i++)
            	  {
   				 if(th[i].className=="foshan1")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
            	  }
     			for(var i=0;i<th.length;i++)
          	  {
 				 if(th[i].className=="dongguan2")
 	         	  {
 	         	  th[i].parentNode.removeChild(th[i]);
 	         	  }
          	  }
     			for(var i=0;i<th.length;i++)
            	  {
   				 if(th[i].className=="guangzhou1")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
            	  }
     			
     			for(var i=0;i<th.length;i++)
            	  {
   				 if(th[i].className=="shenzhen1")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
            	  }
     			for(var i=0;i<th.length;i++)
              	  {
     				 if(th[i].className=="shenzhen1")
     	         	  {
     	         	  th[i].parentNode.removeChild(th[i]);
     	         	  }
              	  }
     			
     			for(var i=0;i<th.length;i++)
                	  {
        				 if(th[i].className=="foshan1")
        	         	  {
        	         	  th[i].parentNode.removeChild(th[i]);
        	         	  }
                 	  }
     		 }
            if(showDu.length==1 && showDu[0]=="2"){
            	z[3].colSpan="6";
       			y[0].colSpan="6";
       			x[9].colSpan="1";
       			x[10].colSpan="1";
       			x[11].colSpan="1";
       			x[12].colSpan="1";
       			x[13].colSpan="1";
       			x[14].colSpan="1";
       			for(var i=0;i<th.length;i++)
            	  {
    				 if(th[i].className=="guangzhou1")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
            	  }
       			for(var i=0;i<th.length;i++)
            	  {
    				 if(th[i].className=="guangzhou1")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
            	  }
       		
       		 for(var i=0;i<th.length;i++)
        	  {
          	if(th[i].className=="shenzhen1")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }	
        	  }	
       		 for(var i=0;i<th.length;i++)
        	  {
          	if(th[i].className=="foshan1")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }	
        	  }
         		 for(var i=0;i<th.length;i++)
          	  {
         	      if(th[i].className=="guangzhou")
              	  {
              	  th[i].parentNode.removeChild(th[i]);
              	  }	
          	  }
         			for(var i=0;i<th.length;i++)
                	  {
                	  if(th[i].className=="dongguan1")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }
                	  if(th[i].className=="dongguan3")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }

                	 $("#guang4").remove();
                	 $("#guang6").remove();
                	 $("#shen4").remove();
                	 $("#fo4").remove();
                	 $("#shen6").remove();
                	 $("#fo6").remove();
                	 $("#fo2").remove();
                	 $("#shen2").remove();
                	
                	  }
         			
         			for(var i=0;i<th.length;i++)
                	  {
       				 if(th[i].className=="foshan1")
       	         	  {
       	         	  th[i].parentNode.removeChild(th[i]);
       	         	  }
                	  }
         			for(var i=0;i<th.length;i++)
              	  {
     				 if(th[i].className=="dongguan1")
     	         	  {
     	         	  th[i].parentNode.removeChild(th[i]);
     	         	  }
              	  }
         			for(var i=0;i<th.length;i++)
                	  {
       				 if(th[i].className=="guangzhou1")
       	         	  {
       	         	  th[i].parentNode.removeChild(th[i]);
       	         	  }
                	  }
         			
         			for(var i=0;i<th.length;i++)
                	  {
       				 if(th[i].className=="shenzhen1")
       	         	  {
       	         	  th[i].parentNode.removeChild(th[i]);
       	         	  }
                	  }
         			for(var i=0;i<th.length;i++)
                  	  {
         				 if(th[i].className=="shenzhen1")
         	         	  {
         	         	  th[i].parentNode.removeChild(th[i]);
         	         	  }
                  	  }
         			
         			for(var i=0;i<th.length;i++)
                    	  {
            				 if(th[i].className=="foshan1")
            	         	  {
            	         	  th[i].parentNode.removeChild(th[i]);
            	         	  }
                     	  }
     		}
            if(showDu.length==1 && showDu[0]=="3"){
            	z[3].colSpan="6";
       			y[0].colSpan="6";
       			x[9].colSpan="1";
       			x[10].colSpan="1";
       			x[11].colSpan="1";
       			x[12].colSpan="1";
       			x[13].colSpan="1";
       			x[14].colSpan="1";
       			for(var i=0;i<th.length;i++)
            	  {
    				 if(th[i].className=="guangzhou1")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
            	  }
       			for(var i=0;i<th.length;i++)
            	  {
    				 if(th[i].className=="guangzhou1")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
            	  }
       		
       		 for(var i=0;i<th.length;i++)
        	  {
          	if(th[i].className=="shenzhen1")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }	
        	  }	
       		 for(var i=0;i<th.length;i++)
        	  {
          	if(th[i].className=="foshan1")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }	
        	  }
         		 for(var i=0;i<th.length;i++)
          	  {
         	      if(th[i].className=="guangzhou")
              	  {
              	  th[i].parentNode.removeChild(th[i]);
              	  }	
          	  }
         			for(var i=0;i<th.length;i++)
                	  {
                	  if(th[i].className=="dongguan2")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }
                	  if(th[i].className=="dongguan1")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }

                	 $("#guang4").remove();
                	 $("#guang6").remove();
                	 $("#shen4").remove();
                	 $("#fo4").remove();
                	 $("#shen6").remove();
                	 $("#fo6").remove();
                	 $("#fo2").remove();
                	 $("#shen2").remove();
                	
                	  }
         			
         			for(var i=0;i<th.length;i++)
                	  {
       				 if(th[i].className=="foshan1")
       	         	  {
       	         	  th[i].parentNode.removeChild(th[i]);
       	         	  }
                	  }
         			for(var i=0;i<th.length;i++)
              	  {
     				 if(th[i].className=="dongguan2")
     	         	  {
     	         	  th[i].parentNode.removeChild(th[i]);
     	         	  }
              	  }
         			for(var i=0;i<th.length;i++)
                	  {
       				 if(th[i].className=="guangzhou1")
       	         	  {
       	         	  th[i].parentNode.removeChild(th[i]);
       	         	  }
                	  }
         			
         			for(var i=0;i<th.length;i++)
                	  {
       				 if(th[i].className=="shenzhen1")
       	         	  {
       	         	  th[i].parentNode.removeChild(th[i]);
       	         	  }
                	  }
         			for(var i=0;i<th.length;i++)
                  	  {
         				 if(th[i].className=="shenzhen1")
         	         	  {
         	         	  th[i].parentNode.removeChild(th[i]);
         	         	  }
                  	  }
         			
         			for(var i=0;i<th.length;i++)
                    	  {
            				 if(th[i].className=="foshan1")
            	         	  {
            	         	  th[i].parentNode.removeChild(th[i]);
            	         	  }
                     	  }
  }
            if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="2"){
            	z[3].colSpan="12";
       			y[0].colSpan="12";
       			x[9].colSpan="2";
       			x[10].colSpan="2";
       			x[11].colSpan="2";
       			x[12].colSpan="2";
       			x[13].colSpan="2";
       			x[14].colSpan="2";
       			for(var i=0;i<th.length;i++)
            	  {
    				 if(th[i].className=="guangzhou1")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
            	  }
       			for(var i=0;i<th.length;i++)
            	  {
    				 if(th[i].className=="guangzhou1")
    	         	  {
    	         	  th[i].parentNode.removeChild(th[i]);
    	         	  }
            	  }
       		
       		 for(var i=0;i<th.length;i++)
        	  {
          	if(th[i].className=="shenzhen1")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }	
        	  }	
       		 for(var i=0;i<th.length;i++)
        	  {
          	if(th[i].className=="foshan1")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }	
        	  }
         		 for(var i=0;i<th.length;i++)
          	  {
         	      if(th[i].className=="guangzhou")
              	  {
              	  th[i].parentNode.removeChild(th[i]);
              	  }	
          	  }
         			for(var i=0;i<th.length;i++)
                	  {
                	  
                	  if(th[i].className=="dongguan3")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }

                	 $("#guang4").remove();
                	 $("#guang6").remove();
                	 $("#shen4").remove();
                	 $("#fo4").remove();
                	 $("#shen6").remove();
                	 $("#fo6").remove();
                	 $("#fo2").remove();
                	 $("#shen2").remove();
                	
                	  }
         			
         			for(var i=0;i<th.length;i++)
                	  {
       				 if(th[i].className=="foshan1")
       	         	  {
       	         	  th[i].parentNode.removeChild(th[i]);
       	         	  }
                	  }
         			
         			for(var i=0;i<th.length;i++)
                	  {
       				 if(th[i].className=="guangzhou1")
       	         	  {
       	         	  th[i].parentNode.removeChild(th[i]);
       	         	  }
                	  }
         			
         			for(var i=0;i<th.length;i++)
                	  {
       				 if(th[i].className=="shenzhen1")
       	         	  {
       	         	  th[i].parentNode.removeChild(th[i]);
       	         	  }
                	  }
         			for(var i=0;i<th.length;i++)
                  	  {
         				 if(th[i].className=="shenzhen1")
         	         	  {
         	         	  th[i].parentNode.removeChild(th[i]);
         	         	  }
                  	  }
         			
         			for(var i=0;i<th.length;i++)
                    	  {
            				 if(th[i].className=="foshan1")
            	         	  {
            	         	  th[i].parentNode.removeChild(th[i]);
            	         	  }
                     	  }
            }
           if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="3"){
        	   z[3].colSpan="12";
      			y[0].colSpan="12";
      			x[9].colSpan="2";
      			x[10].colSpan="2";
      			x[11].colSpan="2";
      			x[12].colSpan="2";
      			x[13].colSpan="2";
      			x[14].colSpan="2";
      			for(var i=0;i<th.length;i++)
           	  {
   				 if(th[i].className=="guangzhou1")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
           	  }
      			for(var i=0;i<th.length;i++)
           	  {
   				 if(th[i].className=="guangzhou1")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
           	  }
      		
      		 for(var i=0;i<th.length;i++)
       	  {
         	if(th[i].className=="shenzhen1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	  }	
      		 for(var i=0;i<th.length;i++)
       	  {
         	if(th[i].className=="foshan1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	  }
        		 for(var i=0;i<th.length;i++)
         	  {
        	      if(th[i].className=="guangzhou")
             	  {
             	  th[i].parentNode.removeChild(th[i]);
             	  }	
         	  }
        			for(var i=0;i<th.length;i++)
               	  {
               	  
               	  if(th[i].className=="dongguan2")
               	  {
               	  th[i].parentNode.removeChild(th[i]);
               	  }

               	 $("#guang4").remove();
               	 $("#guang6").remove();
               	 $("#shen4").remove();
               	 $("#fo4").remove();
               	 $("#shen6").remove();
               	 $("#fo6").remove();
               	 $("#fo2").remove();
               	 $("#shen2").remove();
               	
               	  }
        			
        			for(var i=0;i<th.length;i++)
               	  {
      				 if(th[i].className=="foshan1")
      	         	  {
      	         	  th[i].parentNode.removeChild(th[i]);
      	         	  }
               	  }
        			
        			for(var i=0;i<th.length;i++)
               	  {
      				 if(th[i].className=="guangzhou1")
      	         	  {
      	         	  th[i].parentNode.removeChild(th[i]);
      	         	  }
               	  }
        			
        			for(var i=0;i<th.length;i++)
               	  {
      				 if(th[i].className=="shenzhen1")
      	         	  {
      	         	  th[i].parentNode.removeChild(th[i]);
      	         	  }
               	  }
        			for(var i=0;i<th.length;i++)
                 	  {
        				 if(th[i].className=="shenzhen1")
        	         	  {
        	         	  th[i].parentNode.removeChild(th[i]);
        	         	  }
                 	  }
        			
        			for(var i=0;i<th.length;i++)
                   	  {
           				 if(th[i].className=="foshan1")
           	         	  {
           	         	  th[i].parentNode.removeChild(th[i]);
           	         	  }
           }
           }
           if(showDu.length==2 && showDu[0]=="2" && showDu[1]=="3"){
        	   z[3].colSpan="12";
      			y[0].colSpan="12";
      			x[9].colSpan="2";
      			x[10].colSpan="2";
      			x[11].colSpan="2";
      			x[12].colSpan="2";
      			x[13].colSpan="2";
      			x[14].colSpan="2";
      			for(var i=0;i<th.length;i++)
           	  {
   				 if(th[i].className=="guangzhou1")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
           	  }
      			for(var i=0;i<th.length;i++)
           	  {
   				 if(th[i].className=="guangzhou1")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
           	  }
      		
      		 for(var i=0;i<th.length;i++)
       	  {
         	if(th[i].className=="shenzhen1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	  }	
      		 for(var i=0;i<th.length;i++)
       	  {
         	if(th[i].className=="foshan1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	  }
        		 for(var i=0;i<th.length;i++)
         	  {
        	      if(th[i].className=="guangzhou")
             	  {
             	  th[i].parentNode.removeChild(th[i]);
             	  }	
         	  }
        			for(var i=0;i<th.length;i++)
               	  {
               	  
               	  if(th[i].className=="dongguan1")
               	  {
               	  th[i].parentNode.removeChild(th[i]);
               	  }

               	 $("#guang4").remove();
               	 $("#guang6").remove();
               	 $("#shen4").remove();
               	 $("#fo4").remove();
               	 $("#shen6").remove();
               	 $("#fo6").remove();
               	 $("#fo2").remove();
               	 $("#shen2").remove();
               	
               	  }
        			
        			for(var i=0;i<th.length;i++)
               	  {
      				 if(th[i].className=="foshan1")
      	         	  {
      	         	  th[i].parentNode.removeChild(th[i]);
      	         	  }
               	  }
        			
        			for(var i=0;i<th.length;i++)
               	  {
      				 if(th[i].className=="guangzhou1")
      	         	  {
      	         	  th[i].parentNode.removeChild(th[i]);
      	         	  }
               	  }
        			
        			for(var i=0;i<th.length;i++)
               	  {
      				 if(th[i].className=="shenzhen1")
      	         	  {
      	         	  th[i].parentNode.removeChild(th[i]);
      	         	  }
               	  }
        			for(var i=0;i<th.length;i++)
                 	  {
        				 if(th[i].className=="shenzhen1")
        	         	  {
        	         	  th[i].parentNode.removeChild(th[i]);
        	         	  }
                 	  }
        			
        			for(var i=0;i<th.length;i++)
                   	  {
           				 if(th[i].className=="foshan1")
           	         	  {
           	         	  th[i].parentNode.removeChild(th[i]);
           	         	  }
        }
           }
           if(showDu.length==3 && showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
        	   z[3].colSpan="18";
      			y[0].colSpan="18";
      			x[9].colSpan="3";
      			x[10].colSpan="3";
      			x[11].colSpan="3";
      			x[12].colSpan="3";
      			x[13].colSpan="3";
      			x[14].colSpan="3";
      			for(var i=0;i<th.length;i++)
           	  {
   				 if(th[i].className=="guangzhou1")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
           	  }
      			for(var i=0;i<th.length;i++)
           	  {
   				 if(th[i].className=="guangzhou1")
   	         	  {
   	         	  th[i].parentNode.removeChild(th[i]);
   	         	  }
           	  }
      		
      		 for(var i=0;i<th.length;i++)
       	  {
         	if(th[i].className=="shenzhen1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	  }	
      		 for(var i=0;i<th.length;i++)
       	  {
         	if(th[i].className=="foshan1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	  }
        		 for(var i=0;i<th.length;i++)
         	  {
        	      if(th[i].className=="guangzhou1")
             	  {
             	  th[i].parentNode.removeChild(th[i]);
             	  }	
         	  }
        		 for(var i=0;i<th.length;i++)
            	  {
           	      if(th[i].className=="shenzhen1")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }	
            	  }
        		 for(var i=0;i<th.length;i++)
            	  {
           	      if(th[i].className=="foshan1")
                	  {
                	  th[i].parentNode.removeChild(th[i]);
                	  }	
            	  }
        		 for(var i=0;i<th.length;i++)
           	  {
          	      if(th[i].className=="shenzhen1")
               	  {
               	  th[i].parentNode.removeChild(th[i]);
               	  }	
           	  }
       		 for(var i=0;i<th.length;i++)
           	  {
          	      if(th[i].className=="foshan1")
               	  {
               	  th[i].parentNode.removeChild(th[i]);
               	  }	
           	  }
        		 $("#guang2").remove();
               	 $("#guang4").remove();
               	 $("#guang6").remove();
               	 $("#shen4").remove();
               	 $("#fo4").remove();
               	 $("#shen6").remove();
               	 $("#fo6").remove();
               	 $("#fo2").remove();
               	 $("#shen2").remove();
               	
               	  }
        }
        /*  如果选择广州运营中心和 深圳运营中心****************************************   */	
        if(cityArea.length==2 && cityArea[0]=="2" && cityArea[1]=="3"){      
        	z[3].colSpan="18";
			z[4].colSpan="21";			
			y[0].colSpan="18";
			y[1].colSpan="21";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";

			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan1")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan2")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan1")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan2")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			 $("#fo4").remove();
          	 $("#dong4").remove();
          	$("#dong3").remove();
          	 $("#dong2").remove();
          	 $("#dong6").remove();
          	 $("#fo6").remove();
          	 $("#fo2").remove();
			
          	if(showDu.length==1 && showDu[0]=="1"){
    			
          		z[3].colSpan="6";
    			z[4].colSpan="7";			
    			y[0].colSpan="6";
    			y[1].colSpan="7";
    			x[0].colSpan="1";
    			x[1].colSpan="1";
    			x[2].colSpan="1";
    			x[3].colSpan="1";
    			x[4].colSpan="1";
    			x[5].colSpan="1";
    			x[6].colSpan="1";
    			x[7].colSpan="1";
    			x[8].colSpan="1";
    			x[9].colSpan="1";
    			x[10].colSpan="1";
    			x[11].colSpan="1";
    			x[12].colSpan="1";
				
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="guangzhou2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="guangzhou3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
		
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="shenzhen2")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="shenzhen3")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }
       	
		
	     	
      
      
       	 
       	 
		
    }
    	
    	
    	
	
		
		  if(showDu.length==1 && showDu[0]=="2"){
			  z[3].colSpan="6";
  			z[4].colSpan="7";			
  			y[0].colSpan="6";
  			y[1].colSpan="7";
  			x[0].colSpan="1";
  			x[1].colSpan="1";
  			x[2].colSpan="1";
  			x[3].colSpan="1";
  			x[4].colSpan="1";
  			x[5].colSpan="1";
  			x[6].colSpan="1";
  			x[7].colSpan="1";
  			x[8].colSpan="1";
  			x[9].colSpan="1";
  			x[10].colSpan="1";
  			x[11].colSpan="1";
  			x[12].colSpan="1";
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="guangzhou1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
  	  }
			
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="guangzhou3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
  	  }
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="shenzhen1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="shenzhen3")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }
		
		}
		    if(showDu.length==1 && showDu[0]=="3"){
		    	z[3].colSpan="6";
    			z[4].colSpan="7";			
    			y[0].colSpan="6";
    			y[1].colSpan="7";
    			x[0].colSpan="1";
    			x[1].colSpan="1";
    			x[2].colSpan="1";
    			x[3].colSpan="1";
    			x[4].colSpan="1";
    			x[5].colSpan="1";
    			x[6].colSpan="1";
    			x[7].colSpan="1";
    			x[8].colSpan="1";
    			x[9].colSpan="1";
    			x[10].colSpan="1";
    			x[11].colSpan="1";
    			x[12].colSpan="1";
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="guangzhou2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="guangzhou1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
		
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="shenzhen2")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="shenzhen1")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }

		    }
       if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="2"){
    	   z[3].colSpan="12";
			z[4].colSpan="14";			
			y[0].colSpan="12";
			y[1].colSpan="14";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="guangzhou3")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="shenzhen3")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
	 
	 
	 
	 
}
    if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="3"){
    	z[3].colSpan="12";
		z[4].colSpan="14";			
		y[0].colSpan="12";
		y[1].colSpan="14";
		x[0].colSpan="2";
		x[1].colSpan="2";
		x[2].colSpan="2";
		x[3].colSpan="2";
		x[4].colSpan="2";
		x[5].colSpan="2";
		x[6].colSpan="2";
		x[7].colSpan="2";
		x[8].colSpan="2";
		x[9].colSpan="2";
		x[10].colSpan="2";
		x[11].colSpan="2";
		x[12].colSpan="2";
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="guangzhou2")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="shenzhen2")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
}
    if(showDu.length==2 && showDu[0]=="2" && showDu[1]=="3"){
    	z[3].colSpan="12";
		z[4].colSpan="14";			
		y[0].colSpan="12";
		y[1].colSpan="14";
		x[0].colSpan="2";
		x[1].colSpan="2";
		x[2].colSpan="2";
		x[3].colSpan="2";
		x[4].colSpan="2";
		x[5].colSpan="2";
		x[6].colSpan="2";
		x[7].colSpan="2";
		x[8].colSpan="2";
		x[9].colSpan="2";
		x[10].colSpan="2";
		x[11].colSpan="2";
		x[12].colSpan="2";
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="guangzhou1")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="shenzhen1")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
}
      if(showDu.length==3 && showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
    	    z[3].colSpan="18";
			z[4].colSpan="21";			
			y[0].colSpan="18";
			y[1].colSpan="21";			
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";

} 		
          	 

        }
        /*如果选择广州 和佛山 -----------------------------------------------  */       
        if(cityArea.length==2 && cityArea[0]=="2" && cityArea[1]=="4"){      
        	z[3].colSpan="18";
			z[5].colSpan="18";			
			y[0].colSpan="18";
			y[2].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			x[16].colSpan="3";
			x[17].colSpan="3";
			x[18].colSpan="3";
			

			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen1")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen2")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan1")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan2")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			 $("#shen4").remove();
          	 $("#dong4").remove();
          	$("#dong3").remove();
          	 $("#dong2").remove();
          	 $("#dong6").remove();
          	 $("#shen6").remove();
          	 $("#shen2").remove();
			
          	if(showDu.length==1 && showDu[0]=="1"){
    			
          		z[3].colSpan="6";
    			z[4].colSpan="6";			
    			y[0].colSpan="6";
    			y[1].colSpan="6";
    			x[0].colSpan="1";
    			x[1].colSpan="1";
    			x[2].colSpan="1";
    			x[3].colSpan="1";
    			x[4].colSpan="1";
    			x[5].colSpan="1";
    			x[6].colSpan="1";
    			x[7].colSpan="1";
    			x[8].colSpan="1";
    			x[9].colSpan="1";
    			x[10].colSpan="1";
    			x[11].colSpan="1";
				
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="guangzhou2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="guangzhou3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
		
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="foshan2")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="foshan3")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }
       	
		
	     	
      
      
       	 
       	 
		
    } 
    	
    	
    	
	
		
		  if(showDu.length==1 && showDu[0]=="2"){
			z[3].colSpan="6";
  			z[4].colSpan="6";			
  			y[0].colSpan="6";
  			y[1].colSpan="6";
  			x[0].colSpan="1";
  			x[1].colSpan="1";
  			x[2].colSpan="1";
  			x[3].colSpan="1";
  			x[4].colSpan="1";
  			x[5].colSpan="1";
  			x[6].colSpan="1";
  			x[7].colSpan="1";
  			x[8].colSpan="1";
  			x[9].colSpan="1";
  			x[10].colSpan="1";
  			x[11].colSpan="1";
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="guangzhou1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
  	  }
			
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="guangzhou3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
  	  }
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="foshan1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="foshan3")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }
		
		}
		    if(showDu.length==1 && showDu[0]=="3"){
		    	z[3].colSpan="6";
	  			z[4].colSpan="6";			
	  			y[0].colSpan="6";
	  			y[1].colSpan="6";
	  			x[0].colSpan="1";
	  			x[1].colSpan="1";
	  			x[2].colSpan="1";
	  			x[3].colSpan="1";
	  			x[4].colSpan="1";
	  			x[5].colSpan="1";
	  			x[6].colSpan="1";
	  			x[7].colSpan="1";
	  			x[8].colSpan="1";
	  			x[9].colSpan="1";
	  			x[10].colSpan="1";
	  			x[11].colSpan="1";
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="guangzhou2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="guangzhou1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
		
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="foshan2")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="foshan1")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }

		    }
       if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="2"){
    	   z[3].colSpan="12";
 			z[4].colSpan="12";			
 			y[0].colSpan="12";
 			y[1].colSpan="12";
 			x[0].colSpan="2";
 			x[1].colSpan="2";
 			x[2].colSpan="2";
 			x[3].colSpan="2";
 			x[4].colSpan="2";
 			x[5].colSpan="2";
 			x[6].colSpan="2";
 			x[7].colSpan="2";
 			x[8].colSpan="2";
 			x[9].colSpan="2";
 			x[10].colSpan="2";
 			x[11].colSpan="2";
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="guangzhou3")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="foshan3")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
	 
	 
	 
	 
}
    if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="3"){
    	z[3].colSpan="12";
			z[4].colSpan="12";			
			y[0].colSpan="12";
			y[1].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="guangzhou2")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="foshan2")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
}
    if(showDu.length==2 && showDu[0]=="2" && showDu[1]=="3"){
    	z[3].colSpan="12";
			z[4].colSpan="12";			
			y[0].colSpan="12";
			y[1].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="guangzhou1")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="foshan1")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
}
      if(showDu.length==3 && showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
    	  z[3].colSpan="18";
			z[4].colSpan="18";			
			y[0].colSpan="18";
			y[1].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";

} 		
          	 

        }   
        /*如果选择广州和 东莞-----------------------------------------------------  */      
        
        if(cityArea.length==2 && cityArea[0]=="2" && cityArea[1]=="5"){      
        	z[3].colSpan="18";
			z[5].colSpan="18";			
			y[0].colSpan="18";
			y[2].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			

			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen1")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen2")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan1")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan2")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			 $("#shen1").remove();
          	 $("#fo4").remove();
          	$("#fo3").remove();
          	 $("#fo2").remove();
          	 $("#fo6").remove();
          	 $("#shen3").remove();
          	 $("#shen5").remove();
          	$("#shen7").remove();
          	$("#shen2").remove();
          	$("#shen4").remove();
          	$("#shen6").remove();
			
          	 if(showDu.length==1 && showDu[0]=="1"){
    			
          		z[3].colSpan="6";
      			z[4].colSpan="6";			
      			y[0].colSpan="6";
      			y[1].colSpan="6";
      			x[0].colSpan="1";
      			x[1].colSpan="1";
      			x[2].colSpan="1";
      			x[3].colSpan="1";
      			x[4].colSpan="1";
      			x[5].colSpan="1";
      			x[6].colSpan="1";
      			x[7].colSpan="1";
      			x[8].colSpan="1";
      			x[9].colSpan="1";
      			x[10].colSpan="1";
      			x[11].colSpan="1";
				
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="guangzhou2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="guangzhou3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
		
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="dongguan2")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="dongguan3")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }
       	
		
	     	
      
      
       	 
       	 
		
    } 
    	
    	
    	
	
		
		  if(showDu.length==1 && showDu[0]=="2"){
			z[3].colSpan="6";
  			z[4].colSpan="6";			
  			y[0].colSpan="6";
  			y[1].colSpan="6";
  			x[0].colSpan="1";
  			x[1].colSpan="1";
  			x[2].colSpan="1";
  			x[3].colSpan="1";
  			x[4].colSpan="1";
  			x[5].colSpan="1";
  			x[6].colSpan="1";
  			x[7].colSpan="1";
  			x[8].colSpan="1";
  			x[9].colSpan="1";
  			x[10].colSpan="1";
  			x[11].colSpan="1";
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="guangzhou1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
  	  }
			
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="guangzhou3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
  	  }
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="dongguan1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="dongguan3")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }
		
		}
		    if(showDu.length==1 && showDu[0]=="3"){
		    	z[3].colSpan="6";
	  			z[4].colSpan="6";			
	  			y[0].colSpan="6";
	  			y[1].colSpan="6";
	  			x[0].colSpan="1";
	  			x[1].colSpan="1";
	  			x[2].colSpan="1";
	  			x[3].colSpan="1";
	  			x[4].colSpan="1";
	  			x[5].colSpan="1";
	  			x[6].colSpan="1";
	  			x[7].colSpan="1";
	  			x[8].colSpan="1";
	  			x[9].colSpan="1";
	  			x[10].colSpan="1";
	  			x[11].colSpan="1";
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="guangzhou2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="guangzhou1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
		
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="dongguan2")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="dongguan1")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }

		    }
       if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="2"){
    	   z[3].colSpan="12";
 			z[4].colSpan="12";			
 			y[0].colSpan="12";
 			y[1].colSpan="12";
 			x[0].colSpan="2";
 			x[1].colSpan="2";
 			x[2].colSpan="2";
 			x[3].colSpan="2";
 			x[4].colSpan="2";
 			x[5].colSpan="2";
 			x[6].colSpan="2";
 			x[7].colSpan="2";
 			x[8].colSpan="2";
 			x[9].colSpan="2";
 			x[10].colSpan="2";
 			x[11].colSpan="2";
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="guangzhou3")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="dongguan3")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
	 
	 
	 
	 
}
    if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="3"){
    	z[3].colSpan="12";
			z[4].colSpan="12";			
			y[0].colSpan="12";
			y[1].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="guangzhou2")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="dongguan2")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
}
    if(showDu.length==2 && showDu[0]=="2" && showDu[1]=="3"){
    	    z[3].colSpan="12";
			z[4].colSpan="12";			
			y[0].colSpan="12";
			y[1].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="guangzhou1")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="dongguan1")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
}
      if(showDu.length==3 && showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
    	  z[3].colSpan="18";
			z[4].colSpan="18";			
			y[0].colSpan="18";
			y[1].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";

} 		 
          	 

        }  
        /*如果选择深圳 和佛山 --------------------------------------------------------  */
        if(cityArea.length==2 && cityArea[0]=="3" && cityArea[1]=="4"){      
        	z[3].colSpan="21";
			z[5].colSpan="18";			
			y[0].colSpan="21";
			y[2].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			

			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou1")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou2")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan1")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan2")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			 $("#guang1").remove();
          	 $("#dong4").remove();
          	 $("#dong3").remove();
             $("#dong2").remove();
          	 $("#dong6").remove();
          	 $("#guang3").remove();
          	 $("#guang5").remove();
          	 $("#guang7").remove();
          	 $("#guang2").remove();
          	 $("#guang4").remove();
          	 $("#guang6").remove();
			
          	  if(showDu.length==1 && showDu[0]=="1"){
    			
          		z[3].colSpan="7";
      			z[4].colSpan="6";			
      			y[0].colSpan="7";
      			y[1].colSpan="6";
      			x[0].colSpan="1";
      			x[1].colSpan="1";
      			x[2].colSpan="1";
      			x[3].colSpan="1";
      			x[4].colSpan="1";
      			x[5].colSpan="1";
      			x[6].colSpan="1";
      			x[7].colSpan="1";
      			x[8].colSpan="1";
      			x[9].colSpan="1";
      			x[10].colSpan="1";
      			x[11].colSpan="1";
      			x[12].colSpan="1";
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="shenzhen2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="shenzhen3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
		
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="foshan2")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="foshan3")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }
       	
		
	     	
      
      
       	 
       	 
		
    } 
    	
    	
    	
	
		
          	if(showDu.length==1 && showDu[0]=="2"){
			z[3].colSpan="7";
  			z[4].colSpan="6";			
  			y[0].colSpan="7";
  			y[1].colSpan="6";
  			x[0].colSpan="1";
  			x[1].colSpan="1";
  			x[2].colSpan="1";
  			x[3].colSpan="1";
  			x[4].colSpan="1";
  			x[5].colSpan="1";
  			x[6].colSpan="1";
  			x[7].colSpan="1";
  			x[8].colSpan="1";
  			x[9].colSpan="1";
  			x[10].colSpan="1";
  			x[11].colSpan="1";
  			x[12].colSpan="1";
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="shenzhen1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
  	  }
			
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="shenzhen3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
  	  }
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="foshan1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="foshan3")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }
		
		}
		    if(showDu.length==1 && showDu[0]=="3"){
		    	z[3].colSpan="7";
	  			z[4].colSpan="6";			
	  			y[0].colSpan="7";
	  			y[1].colSpan="6";
	  			x[0].colSpan="1";
	  			x[1].colSpan="1";
	  			x[2].colSpan="1";
	  			x[3].colSpan="1";
	  			x[4].colSpan="1";
	  			x[5].colSpan="1";
	  			x[6].colSpan="1";
	  			x[7].colSpan="1";
	  			x[8].colSpan="1";
	  			x[9].colSpan="1";
	  			x[10].colSpan="1";
	  			x[11].colSpan="1";
	  			x[12].colSpan="1";
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="shenzhen2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="shenzhen1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
		
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="foshan2")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="foshan1")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }

		    }
       if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="2"){
    	   z[3].colSpan="14";
 			z[4].colSpan="12";			
 			y[0].colSpan="14";
 			y[1].colSpan="12";
 			x[0].colSpan="2";
 			x[1].colSpan="2";
 			x[2].colSpan="2";
 			x[3].colSpan="2";
 			x[4].colSpan="2";
 			x[5].colSpan="2";
 			x[6].colSpan="2";
 			x[7].colSpan="2";
 			x[8].colSpan="2";
 			x[9].colSpan="2";
 			x[10].colSpan="2";
 			x[11].colSpan="2";
 			x[12].colSpan="2";
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="shenzhen3")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="foshan3")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
	 
	 
	 
	 
}
    if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="3"){
    	    z[3].colSpan="14";
			z[4].colSpan="12";			
			y[0].colSpan="14";
			y[1].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="shenzhen2")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="foshan2")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
}
    if(showDu.length==2 && showDu[0]=="2" && showDu[1]=="3"){
    	    z[3].colSpan="14";
			z[4].colSpan="12";			
			y[0].colSpan="14";
			y[1].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="shenzhen1")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="foshan1")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
}
      if(showDu.length==3 && showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
    	  z[3].colSpan="21";
			z[4].colSpan="18";			
			y[0].colSpan="21";
			y[1].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";

}		 
          	 

        }  
        
        /*如果选择 深圳和 东莞  --------------------------------------------------------  */  
        if(cityArea.length==2 && cityArea[0]=="3" && cityArea[1]=="5"){      
        	z[3].colSpan="21";
			z[5].colSpan="18";			
			y[0].colSpan="21";
			y[2].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			

			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou1")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou2")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan1")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan2")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="foshan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			 $("#guang1").remove();
          	 $("#fo4").remove();
          	 $("#fo3").remove();
             $("#fo2").remove();
          	 $("#fo6").remove();
          	 $("#guang3").remove();
          	 $("#guang5").remove();
          	 $("#guang7").remove();
          	 $("#guang2").remove();
          	 $("#guang4").remove();
          	 $("#guang6").remove();
			
          	  if(showDu.length==1 && showDu[0]=="1"){
    			
          		z[3].colSpan="7";
      			z[4].colSpan="6";			
      			y[0].colSpan="7";
      			y[1].colSpan="6";
      			x[0].colSpan="1";
      			x[1].colSpan="1";
      			x[2].colSpan="1";
      			x[3].colSpan="1";
      			x[4].colSpan="1";
      			x[5].colSpan="1";
      			x[6].colSpan="1";
      			x[7].colSpan="1";
      			x[8].colSpan="1";
      			x[9].colSpan="1";
      			x[10].colSpan="1";
      			x[11].colSpan="1";
      			x[12].colSpan="1";
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="shenzhen2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="shenzhen3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
		
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="dongguan2")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="dongguan3")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }
       	
		
	     	
      
      
       	 
       	 
		
    } 
    	
    	
    	
	
		
          	if(showDu.length==1 && showDu[0]=="2"){
			z[3].colSpan="7";
  			z[4].colSpan="6";			
  			y[0].colSpan="7";
  			y[1].colSpan="6";
  			x[0].colSpan="1";
  			x[1].colSpan="1";
  			x[2].colSpan="1";
  			x[3].colSpan="1";
  			x[4].colSpan="1";
  			x[5].colSpan="1";
  			x[6].colSpan="1";
  			x[7].colSpan="1";
  			x[8].colSpan="1";
  			x[9].colSpan="1";
  			x[10].colSpan="1";
  			x[11].colSpan="1";
  			x[12].colSpan="1";
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="shenzhen1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
  	  }
			
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="shenzhen3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
  	  }
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="dongguan1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="dongguan3")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }
		
		}
		    if(showDu.length==1 && showDu[0]=="3"){
		    	z[3].colSpan="7";
	  			z[4].colSpan="6";			
	  			y[0].colSpan="7";
	  			y[1].colSpan="6";
	  			x[0].colSpan="1";
	  			x[1].colSpan="1";
	  			x[2].colSpan="1";
	  			x[3].colSpan="1";
	  			x[4].colSpan="1";
	  			x[5].colSpan="1";
	  			x[6].colSpan="1";
	  			x[7].colSpan="1";
	  			x[8].colSpan="1";
	  			x[9].colSpan="1";
	  			x[10].colSpan="1";
	  			x[11].colSpan="1";
	  			x[12].colSpan="1";
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="shenzhen2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="shenzhen1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
		
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="dongguan2")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="dongguan1")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }

		    }
       if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="2"){
    	   z[3].colSpan="14";
 			z[4].colSpan="12";			
 			y[0].colSpan="14";
 			y[1].colSpan="12";
 			x[0].colSpan="2";
 			x[1].colSpan="2";
 			x[2].colSpan="2";
 			x[3].colSpan="2";
 			x[4].colSpan="2";
 			x[5].colSpan="2";
 			x[6].colSpan="2";
 			x[7].colSpan="2";
 			x[8].colSpan="2";
 			x[9].colSpan="2";
 			x[10].colSpan="2";
 			x[11].colSpan="2";
 			x[12].colSpan="2";
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="shenzhen3")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="dongguan3")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
	 
	 
	 
	 
}
    if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="3"){
    	    z[3].colSpan="14";
			z[4].colSpan="12";			
			y[0].colSpan="14";
			y[1].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="shenzhen2")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="dongguan2")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
}
    if(showDu.length==2 && showDu[0]=="2" && showDu[1]=="3"){
    	    z[3].colSpan="14";
			z[4].colSpan="12";			
			y[0].colSpan="14";
			y[1].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="shenzhen1")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="dongguan1")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
}
      if(showDu.length==3 && showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
    	  z[3].colSpan="21";
			z[4].colSpan="18";			
			y[0].colSpan="21";
			y[1].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";

}		 
          	 

        }  
        
        /* 佛山和东莞------------------------------------------------------------  */ 
        
        
        if(cityArea.length==2 && cityArea[0]=="4" && cityArea[1]=="5"){      
        	z[3].colSpan="18";
			z[5].colSpan="18";			
			y[0].colSpan="18";
			y[2].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";			
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			

			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou1")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou2")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen1")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen2")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="shenzhen3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="guangzhou")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
			 $("#guang1").remove();
          	 $("#shen4").remove();
          	 $("#shen3").remove();
             $("#shen2").remove();
          	 $("#shen6").remove();
          	 $("#guang3").remove();
          	 $("#guang5").remove();
          	 $("#guang7").remove();
          	 $("#guang2").remove();
          	 $("#guang4").remove();
          	 $("#guang6").remove();
			
          	  if(showDu.length==1 && showDu[0]=="1"){
    			
          		z[3].colSpan="6";
      			z[4].colSpan="6";			
      			y[0].colSpan="6";
      			y[1].colSpan="6";
      			x[0].colSpan="1";
      			x[1].colSpan="1";
      			x[2].colSpan="1";
      			x[3].colSpan="1";
      			x[4].colSpan="1";
      			x[5].colSpan="1";
      			x[6].colSpan="1";
      			x[7].colSpan="1";
      			x[8].colSpan="1";
      			x[9].colSpan="1";
      			x[10].colSpan="1";
      			x[11].colSpan="1";
      			
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="foshan2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="foshan3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
		
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="dongguan2")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="dongguan3")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }
       	
		
	     	
      
      
       	 
       	 
		
    } 
    	
    	
    	
	
		
          	if(showDu.length==1 && showDu[0]=="2"){
			z[3].colSpan="6";
  			z[4].colSpan="6";			
  			y[0].colSpan="6";
  			y[1].colSpan="6";
  			x[0].colSpan="1";
  			x[1].colSpan="1";
  			x[2].colSpan="1";
  			x[3].colSpan="1";
  			x[4].colSpan="1";
  			x[5].colSpan="1";
  			x[6].colSpan="1";
  			x[7].colSpan="1";
  			x[8].colSpan="1";
  			x[9].colSpan="1";
  			x[10].colSpan="1";
  			x[11].colSpan="1";
  			
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="foshan1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
  	  }
			
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="foshan3")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
  	  }
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="dongguan1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="dongguan3")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }
		
		}
		    if(showDu.length==1 && showDu[0]=="3"){
		    	z[3].colSpan="6";
	  			z[4].colSpan="6";			
	  			y[0].colSpan="6";
	  			y[1].colSpan="6";
	  			x[0].colSpan="1";
	  			x[1].colSpan="1";
	  			x[2].colSpan="1";
	  			x[3].colSpan="1";
	  			x[4].colSpan="1";
	  			x[5].colSpan="1";
	  			x[6].colSpan="1";
	  			x[7].colSpan="1";
	  			x[8].colSpan="1";
	  			x[9].colSpan="1";
	  			x[10].colSpan="1";
	  			x[11].colSpan="1";
	  			
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="foshan2")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
			 if(th[i].className=="foshan1")
         	  {
         	  th[i].parentNode.removeChild(th[i]);
         	  }
   	  }
		
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="dongguan2")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	  {
 	if(th[i].className=="dongguan1")
   	  {
   	  th[i].parentNode.removeChild(th[i]);
   	  }	
	  }

		    }
       if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="2"){
    	   z[3].colSpan="12";
 			z[4].colSpan="12";			
 			y[0].colSpan="12";
 			y[1].colSpan="12";
 			x[0].colSpan="2";
 			x[1].colSpan="2";
 			x[2].colSpan="2";
 			x[3].colSpan="2";
 			x[4].colSpan="2";
 			x[5].colSpan="2";
 			x[6].colSpan="2";
 			x[7].colSpan="2";
 			x[8].colSpan="2";
 			x[9].colSpan="2";
 			x[10].colSpan="2";
 			x[11].colSpan="2";
 			
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="foshan3")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="dongguan3")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
	 
	 
	 
	 
}
    if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="3"){
    	    z[3].colSpan="12";
			z[4].colSpan="12";			
			y[0].colSpan="12";
			y[1].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="foshan2")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="dongguan2")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
}
    if(showDu.length==2 && showDu[0]=="2" && showDu[1]=="3"){
    	    z[3].colSpan="12";
			z[4].colSpan="12";			
			y[0].colSpan="12";
			y[1].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			
		for(var i=0;i<th.length;i++)
	  {
		 if(th[i].className=="foshan1")
    	  {
    	  th[i].parentNode.removeChild(th[i]);
    	  }
	  }
		
		
	 for(var i=0;i<th.length;i++)
  {
if(th[i].className=="dongguan1")
	  {
	  th[i].parentNode.removeChild(th[i]);
	  }	
  }	
	
}
      if(showDu.length==3 && showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
    	    z[3].colSpan="18";
			z[4].colSpan="18";			
			y[0].colSpan="18";
			y[1].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			

}		 
          	 

        }
        
        
        
        
        
        
        
        
           //广州 深圳佛山
           if(cityArea.length==3 && cityArea[0]=="2" && cityArea[1]=="3" && cityArea[2]=="4"){      			
        	z[3].colSpan="18";
   			z[4].colSpan="21";
   			z[5].colSpan="18";
   			y[0].colSpan="18";
   			y[1].colSpan="21";
   			y[2].colSpan="18";
   			x[0].colSpan="3";
   			x[1].colSpan="3";
   			x[2].colSpan="3";
   			x[3].colSpan="3";
   			x[4].colSpan="3";
   			x[5].colSpan="3";
   			x[6].colSpan="3";
   			x[7].colSpan="3";
   			x[8].colSpan="3";
   			x[9].colSpan="3";
   			x[10].colSpan="3";
   			x[11].colSpan="3";
   			x[12].colSpan="3";
   			x[13].colSpan="3";
   			x[14].colSpan="3";
   			x[15].colSpan="3";
   			x[16].colSpan="3";
   			x[17].colSpan="3";
   			x[18].colSpan="3";
    			
        	
        	 for(var i=0;i<th.length;i++)
        	  {
       	     if(th[i].className=="dongguan1")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }	
        	  }
        	 for(var i=0;i<th.length;i++)
       	    {
      	     if(th[i].className=="dongguan2")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	     }
        	 for(var i=0;i<th.length;i++)
       	  {
      	     if(th[i].className=="dongguan3")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	  }
        	 for(var i=0;i<th.length;i++)
	      	  {
					 if(th[i].className=="dongguan")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	      	  }
        	 for(var i=0;i<th.length;i++)
          	  {
         	     if(th[i].className=="dongguan3")
              	  {
              	  th[i].parentNode.removeChild(th[i]);
              	  }	
          	  }
        	 for(var i=0;i<th.length;i++)
          	  {
         	     if(th[i].className=="dongguan3")
              	  {
              	  th[i].parentNode.removeChild(th[i]);
              	  }	
          	  }
        	 //$("#fo4").remove();
           	 $("#dong4").remove();
           	$("#dong3").remove();
           	 $("#dong2").remove();
           	 $("#dong6").remove();
           	// $("#fo6").remove();
           	// $("#fo2").remove();
        	//濡傛灉鍙€夋寚鏍囧€? 
    		 if(showDu.length==1 && showDu[0]=="1"){
    			
    			    z[3].colSpan="6";
    				z[4].colSpan="7";
    				z[5].colSpan="6";
    				y[0].colSpan="6";
    				y[1].colSpan="7";
    				y[2].colSpan="6";
    				x[0].colSpan="1";
    				x[1].colSpan="1";
    				x[2].colSpan="1";
    				x[3].colSpan="1";
    				x[4].colSpan="1";
    				x[5].colSpan="1";
    				x[6].colSpan="1";
    				x[7].colSpan="1";
    				x[8].colSpan="1";
    				x[9].colSpan="1";
    				x[10].colSpan="1";
    				x[11].colSpan="1";
    				x[12].colSpan="1";
    				x[13].colSpan="1";
    				x[14].colSpan="1";
    				x[15].colSpan="1";
    				x[16].colSpan="1";
    				x[17].colSpan="1";
    				x[18].colSpan="1";
    				
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="guangzhou2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  			
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="guangzhou3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  		
  		 for(var i=0;i<th.length;i++)
   	  {
     	if(th[i].className=="shenzhen2")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	  }	
  		 for(var i=0;i<th.length;i++)
   	  {
     	if(th[i].className=="shenzhen3")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	  }
           	
  		for(var i=0;i<th.length;i++)
     	  {
				 if(th[i].className=="foshan2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
     	  }
			
			for(var i=0;i<th.length;i++)
     	  {
				 if(th[i].className=="foshan3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
     	  }
		     	
          
          
           	 
           	 
    		
        }
        	
        	
        	
    	
    		
    		  if(showDu.length==1 && showDu[0]=="2"){
    			    z[3].colSpan="6";
    				z[4].colSpan="7";
    				z[5].colSpan="6";
    				y[0].colSpan="6";
    				y[1].colSpan="7";
    				y[2].colSpan="6";
    				x[0].colSpan="1";
    				x[1].colSpan="1";
    				x[2].colSpan="1";
    				x[3].colSpan="1";
    				x[4].colSpan="1";
    				x[5].colSpan="1";
    				x[6].colSpan="1";
    				x[7].colSpan="1";
    				x[8].colSpan="1";
    				x[9].colSpan="1";
    				x[10].colSpan="1";
    				x[11].colSpan="1";
    				x[12].colSpan="1";
    				x[13].colSpan="1";
    				x[14].colSpan="1";
    				x[15].colSpan="1";
    				x[16].colSpan="1";
    				x[17].colSpan="1";
    				x[18].colSpan="1";
 			for(var i=0;i<th.length;i++)
      	  {
				 if(th[i].className=="guangzhou1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
      	  }
 			
 			for(var i=0;i<th.length;i++)
      	  {
				 if(th[i].className=="guangzhou3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
      	  }
 		
 		 for(var i=0;i<th.length;i++)
  	  {
    	if(th[i].className=="shenzhen1")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }	
  	  }	
 		 for(var i=0;i<th.length;i++)
  	  {
    	if(th[i].className=="shenzhen3")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }	
  	  }
 		for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="foshan1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="foshan3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }
    		}
    		    if(showDu.length==1 && showDu[0]=="3"){
    		    	z[3].colSpan="6";
    				z[4].colSpan="7";
    				z[5].colSpan="6";
    				y[0].colSpan="6";
    				y[1].colSpan="7";
    				y[2].colSpan="6";
    				x[0].colSpan="1";
    				x[1].colSpan="1";
    				x[2].colSpan="1";
    				x[3].colSpan="1";
    				x[4].colSpan="1";
    				x[5].colSpan="1";
    				x[6].colSpan="1";
    				x[7].colSpan="1";
    				x[8].colSpan="1";
    				x[9].colSpan="1";
    				x[10].colSpan="1";
    				x[11].colSpan="1";
    				x[12].colSpan="1";
    				x[13].colSpan="1";
    				x[14].colSpan="1";
    				x[15].colSpan="1";
    				x[16].colSpan="1";
    				x[17].colSpan="1";
    				x[18].colSpan="1";
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="guangzhou2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  			
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="guangzhou1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  		
  		 for(var i=0;i<th.length;i++)
   	  {
     	if(th[i].className=="shenzhen2")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	  }	
  		 for(var i=0;i<th.length;i++)
   	  {
     	if(th[i].className=="shenzhen1")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	  }
 
  		for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="foshan2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="foshan1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }	    
    		    
    		    
    		    
    		    }
           if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="2"){
        	    z[3].colSpan="12";
				z[4].colSpan="14";
				z[5].colSpan="12";
				y[0].colSpan="12";
				y[1].colSpan="14";
				y[2].colSpan="12";
				x[0].colSpan="2";
				x[1].colSpan="2";
				x[2].colSpan="2";
				x[3].colSpan="2";
				x[4].colSpan="2";
				x[5].colSpan="2";
				x[6].colSpan="2";
				x[7].colSpan="2";
				x[8].colSpan="2";
				x[9].colSpan="2";
				x[10].colSpan="2";
				x[11].colSpan="2";
				x[12].colSpan="2";
				x[13].colSpan="2";
				x[14].colSpan="2";
				x[15].colSpan="2";
				x[16].colSpan="2";
				x[17].colSpan="2";
				x[18].colSpan="2";
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="guangzhou3")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
  	  }
			
			
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="shenzhen3")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	   	  {
					 if(th[i].className=="foshan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	   	  }	    
		 
		 
		 
		 
}
        if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="3"){
        	z[3].colSpan="12";
			z[4].colSpan="14";
			z[5].colSpan="12";
			y[0].colSpan="12";
			y[1].colSpan="14";
			y[2].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="guangzhou2")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
  	  }
			for(var i=0;i<th.length;i++)
		   	  {
						 if(th[i].className=="foshan2")
			         	  {
			         	  th[i].parentNode.removeChild(th[i]);
			         	  }
		   	  }	    	
			
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="shenzhen2")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		
}
        if(showDu.length==2 && showDu[0]=="2" && showDu[1]=="3"){
        	z[3].colSpan="12";
			z[4].colSpan="14";
			z[5].colSpan="12";
			y[0].colSpan="12";
			y[1].colSpan="14";
			y[2].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="guangzhou1")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
  	  }
			
			for(var i=0;i<th.length;i++)
		   	  {
						 if(th[i].className=="foshan1")
			         	  {
			         	  th[i].parentNode.removeChild(th[i]);
			         	  }
		   	  }	    	
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="shenzhen1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		
}
          if(showDu.length==3 && showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
        	  z[3].colSpan="18";
				z[4].colSpan="21";
				z[5].colSpan="18";
				y[0].colSpan="18";
				y[1].colSpan="21";
				y[2].colSpan="18";
				x[0].colSpan="3";
				x[1].colSpan="3";
				x[2].colSpan="3";
				x[3].colSpan="3";
				x[4].colSpan="3";
				x[5].colSpan="3";
				x[6].colSpan="3";
				x[7].colSpan="3";
				x[8].colSpan="3";
				x[9].colSpan="3";
				x[10].colSpan="3";
				x[11].colSpan="3";
				x[12].colSpan="3";
				x[13].colSpan="3";
				x[14].colSpan="3";
				x[15].colSpan="3";
				x[16].colSpan="3";
				x[17].colSpan="3";
				x[18].colSpan="3";
			
		
}  
          }
 
 
  /* 广州  深圳     东莞----------------------------------------------------------------- */
        if(cityArea.length==3 && cityArea[0]=="2" && cityArea[1]=="3" && cityArea[2]=="5"){
        	z[3].colSpan="18";
			z[4].colSpan="21";
			z[5].colSpan="18";
			y[0].colSpan="18";
			y[1].colSpan="21";
			y[2].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			x[16].colSpan="3";
			x[17].colSpan="3";
			x[18].colSpan="3";
 			
        	
        	for(var i=0;i<th.length;i++)
         	  {
         	 
         	 if(th[i].className=="foshan")
         	  {
         
         	  th[i].parentNode.removeChild(th[i]);
         	  }
         	if(th[i].className=="foshan1")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }
         	
         	
         	if(th[i].className=="foshan2")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	if(th[i].className=="foshan3")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	 
         	  if(th[i].className=="foshan")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="foshan1")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="foshan2")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="foshan3")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }        	 
         	  }
        	
        	 for(var i=0;i<th.length;i++)
        	  {
       	     if(th[i].className=="foshan1")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }	
        	  }
        	 for(var i=0;i<th.length;i++)
       	    {
      	     if(th[i].className=="foshan1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	     }
        	 for(var i=0;i<th.length;i++)
       	  {
      	     if(th[i].className=="foshan1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	  }
        	 
        	 $("#fo4").remove();
           	// $("#dong4").remove();
           //	$("#dong3").remove();
           	// $("#dong2").remove();
           	// $("#dong6").remove();
           	 $("#fo6").remove();
           	 $("#fo2").remove();
           	 $("#fo3").remove();
        	//濡傛灉鍙€夋寚鏍囧€?
    		 if(showDu.length==1 && showDu[0]=="1"){
    			
    			    z[3].colSpan="6";
    				z[4].colSpan="7";
    				z[5].colSpan="6";
    				y[0].colSpan="6";
    				y[1].colSpan="7";
    				y[2].colSpan="6";
    				x[0].colSpan="1";
    				x[1].colSpan="1";
    				x[2].colSpan="1";
    				x[3].colSpan="1";
    				x[4].colSpan="1";
    				x[5].colSpan="1";
    				x[6].colSpan="1";
    				x[7].colSpan="1";
    				x[8].colSpan="1";
    				x[9].colSpan="1";
    				x[10].colSpan="1";
    				x[11].colSpan="1";
    				x[12].colSpan="1";
    				x[13].colSpan="1";
    				x[14].colSpan="1";
    				x[15].colSpan="1";
    				x[16].colSpan="1";
    				x[17].colSpan="1";
    				x[18].colSpan="1";
    				
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="guangzhou2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  			
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="guangzhou3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  		
  		 for(var i=0;i<th.length;i++)
   	  {
     	if(th[i].className=="shenzhen2")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	  }	
  		 for(var i=0;i<th.length;i++)
   	  {
     	if(th[i].className=="shenzhen3")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	  }
           	
  		for(var i=0;i<th.length;i++)
     	  {
				 if(th[i].className=="dongguan2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
     	  }
			
			for(var i=0;i<th.length;i++)
     	  {
				 if(th[i].className=="dongguan3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
     	  }
		     	
          
          
           	 
           	 
    		
        }
        	
        	
        	
    	
    		
    		  if(showDu.length==1 && showDu[0]=="2"){
    			    z[3].colSpan="6";
    				z[4].colSpan="7";
    				z[5].colSpan="6";
    				y[0].colSpan="6";
    				y[1].colSpan="7";
    				y[2].colSpan="6";
    				x[0].colSpan="1";
    				x[1].colSpan="1";
    				x[2].colSpan="1";
    				x[3].colSpan="1";
    				x[4].colSpan="1";
    				x[5].colSpan="1";
    				x[6].colSpan="1";
    				x[7].colSpan="1";
    				x[8].colSpan="1";
    				x[9].colSpan="1";
    				x[10].colSpan="1";
    				x[11].colSpan="1";
    				x[12].colSpan="1";
    				x[13].colSpan="1";
    				x[14].colSpan="1";
    				x[15].colSpan="1";
    				x[16].colSpan="1";
    				x[17].colSpan="1";
    				x[18].colSpan="1";
 			for(var i=0;i<th.length;i++)
      	  {
				 if(th[i].className=="guangzhou1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
      	  }
 			
 			for(var i=0;i<th.length;i++)
      	  {
				 if(th[i].className=="guangzhou3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
      	  }
 		
 		 for(var i=0;i<th.length;i++)
  	  {
    	if(th[i].className=="shenzhen1")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }	
  	  }	
 		 for(var i=0;i<th.length;i++)
  	  {
    	if(th[i].className=="shenzhen3")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }	
  	  }
 		for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="dongguan1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="dongguan3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }
    		}
    		    if(showDu.length==1 && showDu[0]=="3"){
    		    	z[3].colSpan="6";
    				z[4].colSpan="7";
    				z[5].colSpan="6";
    				y[0].colSpan="6";
    				y[1].colSpan="7";
    				y[2].colSpan="6";
    				x[0].colSpan="1";
    				x[1].colSpan="1";
    				x[2].colSpan="1";
    				x[3].colSpan="1";
    				x[4].colSpan="1";
    				x[5].colSpan="1";
    				x[6].colSpan="1";
    				x[7].colSpan="1";
    				x[8].colSpan="1";
    				x[9].colSpan="1";
    				x[10].colSpan="1";
    				x[11].colSpan="1";
    				x[12].colSpan="1";
    				x[13].colSpan="1";
    				x[14].colSpan="1";
    				x[15].colSpan="1";
    				x[16].colSpan="1";
    				x[17].colSpan="1";
    				x[18].colSpan="1";
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="guangzhou2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  			
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="guangzhou1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  		
  		 for(var i=0;i<th.length;i++)
   	  {
     	if(th[i].className=="shenzhen2")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	  }	
  		 for(var i=0;i<th.length;i++)
   	  {
     	if(th[i].className=="shenzhen1")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	  }
 
  		for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="dongguan2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="dongguan1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }	    
    		    
    		    
    		    
    		    }
           if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="2"){
        	    z[3].colSpan="12";
				z[4].colSpan="14";
				z[5].colSpan="12";
				y[0].colSpan="12";
				y[1].colSpan="14";
				y[2].colSpan="12";
				x[0].colSpan="2";
				x[1].colSpan="2";
				x[2].colSpan="2";
				x[3].colSpan="2";
				x[4].colSpan="2";
				x[5].colSpan="2";
				x[6].colSpan="2";
				x[7].colSpan="2";
				x[8].colSpan="2";
				x[9].colSpan="2";
				x[10].colSpan="2";
				x[11].colSpan="2";
				x[12].colSpan="2";
				x[13].colSpan="2";
				x[14].colSpan="2";
				x[15].colSpan="2";
				x[16].colSpan="2";
				x[17].colSpan="2";
				x[18].colSpan="2";
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="guangzhou3")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
  	  }
			
			
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="shenzhen3")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	   	  {
					 if(th[i].className=="dongguan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	   	  }	    
		 
		 
		 
		 
}
        if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="3"){
        	z[3].colSpan="12";
			z[4].colSpan="14";
			z[5].colSpan="12";
			y[0].colSpan="12";
			y[1].colSpan="14";
			y[2].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="guangzhou2")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
  	  }
			for(var i=0;i<th.length;i++)
		   	  {
						 if(th[i].className=="dongguan2")
			         	  {
			         	  th[i].parentNode.removeChild(th[i]);
			         	  }
		   	  }	    	
			
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="shenzhen2")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		
}
        if(showDu.length==2 && showDu[0]=="2" && showDu[1]=="3"){
        	z[3].colSpan="12";
			z[4].colSpan="14";
			z[5].colSpan="12";
			y[0].colSpan="12";
			y[1].colSpan="14";
			y[2].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="guangzhou1")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
  	  }
			
			for(var i=0;i<th.length;i++)
		   	  {
						 if(th[i].className=="dongguan1")
			         	  {
			         	  th[i].parentNode.removeChild(th[i]);
			         	  }
		   	  }	    	
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="shenzhen1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		
}
          if(showDu.length==3 && showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
        	  z[3].colSpan="18";
				z[4].colSpan="21";
				z[5].colSpan="18";
				y[0].colSpan="18";
				y[1].colSpan="21";
				y[2].colSpan="18";
				x[0].colSpan="3";
				x[1].colSpan="3";
				x[2].colSpan="3";
				x[3].colSpan="3";
				x[4].colSpan="3";
				x[5].colSpan="3";
				x[6].colSpan="3";
				x[7].colSpan="3";
				x[8].colSpan="3";
				x[9].colSpan="3";
				x[10].colSpan="3";
				x[11].colSpan="3";
				x[12].colSpan="3";
				x[13].colSpan="3";
				x[14].colSpan="3";
				x[15].colSpan="3";
				x[16].colSpan="3";
				x[17].colSpan="3";
				x[18].colSpan="3";
			
		
} 
          }
 
 /*广州   佛山   东莞  -----------------------------------------------------------  */
        if(cityArea.length==3 && cityArea[0]=="2" && cityArea[1]=="4" && cityArea[2]=="5"){
        	z[3].colSpan="18";
			z[4].colSpan="18";
			z[5].colSpan="18";
			y[0].colSpan="18";
			y[1].colSpan="18";
			y[2].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			x[16].colSpan="3";
			x[17].colSpan="3";
			
 			
        	
        	for(var i=0;i<th.length;i++)
         	  {
         	 
         	 if(th[i].className=="shenzhen")
         	  {
         
         	  th[i].parentNode.removeChild(th[i]);
         	  }
         	if(th[i].className=="shenzhen1")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }
         	
         	
         	if(th[i].className=="shenzhen2")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	if(th[i].className=="shenzhen3")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	 
         	  if(th[i].className=="shenzhen")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="shenzhen1")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="shenzhen2")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="shenzhen3")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }        	 
         	  }
        	
        	 for(var i=0;i<th.length;i++)
        	  {
       	     if(th[i].className=="shenzhen1")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }	
        	  }
        	 for(var i=0;i<th.length;i++)
       	    {
      	     if(th[i].className=="shenzhen1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	     }
        	 for(var i=0;i<th.length;i++)
       	  {
      	     if(th[i].className=="shenzhen1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	  }
        	 
        	// $("#fo4").remove();
           	// $("#dong4").remove();
           //$("#dong3").remove();
           	// $("#dong2").remove();
           	// $("#dong6").remove();
           	 $("#shen6").remove();
           	 //$("#fo2").remove();
           	 $("#shen3").remove();
        	//濡傛灉鍙€夋寚鏍囧€?
    		 if(showDu.length==1 && showDu[0]=="1"){
    			
    			    z[3].colSpan="6";
    				z[4].colSpan="6";
    				z[5].colSpan="6";
    				y[0].colSpan="6";
    				y[1].colSpan="6";
    				y[2].colSpan="6";
    				x[0].colSpan="1";
    				x[1].colSpan="1";
    				x[2].colSpan="1";
    				x[3].colSpan="1";
    				x[4].colSpan="1";
    				x[5].colSpan="1";
    				x[6].colSpan="1";
    				x[7].colSpan="1";
    				x[8].colSpan="1";
    				x[9].colSpan="1";
    				x[10].colSpan="1";
    				x[11].colSpan="1";
    				x[12].colSpan="1";
    				x[13].colSpan="1";
    				x[14].colSpan="1";
    				x[15].colSpan="1";
    				x[16].colSpan="1";
    				x[17].colSpan="1";
    				
    				
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="guangzhou2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  			
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="guangzhou3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  		
  		 for(var i=0;i<th.length;i++)
   	  {
     	if(th[i].className=="foshan2")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	  }	
  		 for(var i=0;i<th.length;i++)
   	  {
     	if(th[i].className=="foshan3")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	  }
           	
  		for(var i=0;i<th.length;i++)
     	  {
				 if(th[i].className=="dongguan2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
     	  }
			
			for(var i=0;i<th.length;i++)
     	  {
				 if(th[i].className=="dongguan3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
     	  }
		     	
          
          
           	 
           	 
    		
        }
        	
        	
        	
    	
    		
    		  if(showDu.length==1 && showDu[0]=="2"){
    			    z[3].colSpan="6";
    				z[4].colSpan="6";
    				z[5].colSpan="6";
    				y[0].colSpan="6";
    				y[1].colSpan="6";
    				y[2].colSpan="6";
    				x[0].colSpan="1";
    				x[1].colSpan="1";
    				x[2].colSpan="1";
    				x[3].colSpan="1";
    				x[4].colSpan="1";
    				x[5].colSpan="1";
    				x[6].colSpan="1";
    				x[7].colSpan="1";
    				x[8].colSpan="1";
    				x[9].colSpan="1";
    				x[10].colSpan="1";
    				x[11].colSpan="1";
    				x[12].colSpan="1";
    				x[13].colSpan="1";
    				x[14].colSpan="1";
    				x[15].colSpan="1";
    				x[16].colSpan="1";
    				x[17].colSpan="1";
    				
 			for(var i=0;i<th.length;i++)
      	  {
				 if(th[i].className=="guangzhou1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
      	  }
 			
 			for(var i=0;i<th.length;i++)
      	  {
				 if(th[i].className=="guangzhou3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
      	  }
 		
 		 for(var i=0;i<th.length;i++)
  	  {
    	if(th[i].className=="foshan1")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }	
  	  }	
 		 for(var i=0;i<th.length;i++)
  	  {
    	if(th[i].className=="foshan3")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }	
  	  }
 		for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="dongguan1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="dongguan3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }
    		}
    		    if(showDu.length==1 && showDu[0]=="3"){
    		    	z[3].colSpan="6";
    				z[4].colSpan="6";
    				z[5].colSpan="6";
    				y[0].colSpan="6";
    				y[1].colSpan="6";
    				y[2].colSpan="6";
    				x[0].colSpan="1";
    				x[1].colSpan="1";
    				x[2].colSpan="1";
    				x[3].colSpan="1";
    				x[4].colSpan="1";
    				x[5].colSpan="1";
    				x[6].colSpan="1";
    				x[7].colSpan="1";
    				x[8].colSpan="1";
    				x[9].colSpan="1";
    				x[10].colSpan="1";
    				x[11].colSpan="1";
    				x[12].colSpan="1";
    				x[13].colSpan="1";
    				x[14].colSpan="1";
    				x[15].colSpan="1";
    				x[16].colSpan="1";
    				x[17].colSpan="1";
    				
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="guangzhou2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  			
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="guangzhou1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  		
  		 for(var i=0;i<th.length;i++)
   	  {
     	if(th[i].className=="foshan2")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	  }	
  		 for(var i=0;i<th.length;i++)
   	  {
     	if(th[i].className=="foshan1")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	  }
 
  		for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="dongguan2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="dongguan1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }	    
    		    
    		    
    		    
    		    }
           if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="2"){
        	    z[3].colSpan="12";
				z[4].colSpan="12";
				z[5].colSpan="12";
				y[0].colSpan="12";
				y[1].colSpan="12";
				y[2].colSpan="12";
				x[0].colSpan="2";
				x[1].colSpan="2";
				x[2].colSpan="2";
				x[3].colSpan="2";
				x[4].colSpan="2";
				x[5].colSpan="2";
				x[6].colSpan="2";
				x[7].colSpan="2";
				x[8].colSpan="2";
				x[9].colSpan="2";
				x[10].colSpan="2";
				x[11].colSpan="2";
				x[12].colSpan="2";
				x[13].colSpan="2";
				x[14].colSpan="2";
				x[15].colSpan="2";
				x[16].colSpan="2";
				x[17].colSpan="2";
				
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="guangzhou3")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
  	  }
			
			
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="foshan3")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	   	  {
					 if(th[i].className=="dongguan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	   	  }	    
		 
		 
		 
		 
}
        if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="3"){
        	z[3].colSpan="12";
			z[4].colSpan="12";
			z[5].colSpan="12";
			y[0].colSpan="12";
			y[1].colSpan="12";
			y[2].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="guangzhou2")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
  	  }
			for(var i=0;i<th.length;i++)
		   	  {
						 if(th[i].className=="dongguan2")
			         	  {
			         	  th[i].parentNode.removeChild(th[i]);
			         	  }
		   	  }	    	
			
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="foshan2")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		
}
        if(showDu.length==2 && showDu[0]=="2" && showDu[1]=="3"){
        	z[3].colSpan="12";
			z[4].colSpan="12";
			z[5].colSpan="12";
			y[0].colSpan="12";
			y[1].colSpan="12";
			y[2].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="guangzhou1")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
  	  }
			
			for(var i=0;i<th.length;i++)
		   	  {
						 if(th[i].className=="dongguan1")
			         	  {
			         	  th[i].parentNode.removeChild(th[i]);
			         	  }
		   	  }	    	
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="foshan1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		
}
          if(showDu.length==3 && showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
        	  z[3].colSpan="18";
				z[4].colSpan="18";
				z[5].colSpan="18";
				y[0].colSpan="18";
				y[1].colSpan="18";
				y[2].colSpan="18";
				x[0].colSpan="3";
				x[1].colSpan="3";
				x[2].colSpan="3";
				x[3].colSpan="3";
				x[4].colSpan="3";
				x[5].colSpan="3";
				x[6].colSpan="3";
				x[7].colSpan="3";
				x[8].colSpan="3";
				x[9].colSpan="3";
				x[10].colSpan="3";
				x[11].colSpan="3";
				x[12].colSpan="3";
				x[13].colSpan="3";
				x[14].colSpan="3";
				x[15].colSpan="3";
				x[16].colSpan="3";
				x[17].colSpan="3";
				
			
		
} 
          } 
 
 
 
 
 
/*深圳   佛山  东莞--------------------------------------------------------    */ 
        if(cityArea.length==3 && cityArea[0]=="3" && cityArea[1]=="4" && cityArea[2]=="5"){
        	z[3].colSpan="21";
			z[4].colSpan="18";
			z[5].colSpan="18";
			y[0].colSpan="21";
			y[1].colSpan="18";
			y[2].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			x[16].colSpan="3";
			x[17].colSpan="3";
			x[18].colSpan="3";
 			
        	
        	for(var i=0;i<th.length;i++)
         	  {
         	 
         	 if(th[i].className=="guangzhou")
         	  {
         
         	  th[i].parentNode.removeChild(th[i]);
         	  }
         	if(th[i].className=="guangzhou1")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }
         	
         	
         	if(th[i].className=="guangzhou2")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	if(th[i].className=="guangzhou3")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	 
         	  if(th[i].className=="guangzhou")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="guangzhou1")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="guangzhou2")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
         	  if(th[i].className=="guangzhou3")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }        	 
         	  }
        	
        	 for(var i=0;i<th.length;i++)
        	  {
       	     if(th[i].className=="guangzhou1")
            	  {
            	  th[i].parentNode.removeChild(th[i]);
            	  }	
        	  }
        	 for(var i=0;i<th.length;i++)
       	    {
      	     if(th[i].className=="guangzhou1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	     }
        	 for(var i=0;i<th.length;i++)
       	  {
      	     if(th[i].className=="guangzhou1")
           	  {
           	  th[i].parentNode.removeChild(th[i]);
           	  }	
       	  }
        	 
        	// $("#fo4").remove();
           	// $("#dong4").remove();
           $("#guang3").remove();
           	// $("#dong2").remove();
           	 $("#guang6").remove();
           	 //$("#shen6").remove();
           	 //$("#fo2").remove();
           	 //$("#shen3").remove();
        	//濡傛灉鍙€夋寚鏍囧€?
    		 if(showDu.length==1 && showDu[0]=="1"){
    			
    			    z[3].colSpan="7";
    				z[4].colSpan="6";
    				z[5].colSpan="6";
    				y[0].colSpan="7";
    				y[1].colSpan="6";
    				y[2].colSpan="6";
    				x[0].colSpan="1";
    				x[1].colSpan="1";
    				x[2].colSpan="1";
    				x[3].colSpan="1";
    				x[4].colSpan="1";
    				x[5].colSpan="1";
    				x[6].colSpan="1";
    				x[7].colSpan="1";
    				x[8].colSpan="1";
    				x[9].colSpan="1";
    				x[10].colSpan="1";
    				x[11].colSpan="1";
    				x[12].colSpan="1";
    				x[13].colSpan="1";
    				x[14].colSpan="1";
    				x[15].colSpan="1";
    				x[16].colSpan="1";
    				x[17].colSpan="1";
    				x[18].colSpan="1";
    				
    				
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="shenzhen2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  			
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="shenzhen3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  		
  		 for(var i=0;i<th.length;i++)
   	     {
     	if(th[i].className=="foshan2")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	       }	
  		 for(var i=0;i<th.length;i++)
   	  {
     	if(th[i].className=="foshan3")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	  }
           	
  		for(var i=0;i<th.length;i++)
     	  {
				 if(th[i].className=="dongguan2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
     	  }
			
			for(var i=0;i<th.length;i++)
     	  {
				 if(th[i].className=="dongguan3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
     	  }
		     	
          
          
           	 
           	 
    		
        }
        	
        	
        	
    	
    		
    		  if(showDu.length==1 && showDu[0]=="2"){
    			    z[3].colSpan="7";
    				z[4].colSpan="6";
    				z[5].colSpan="6";
    				y[0].colSpan="7";
    				y[1].colSpan="6";
    				y[2].colSpan="6";
    				x[0].colSpan="1";
    				x[1].colSpan="1";
    				x[2].colSpan="1";
    				x[3].colSpan="1";
    				x[4].colSpan="1";
    				x[5].colSpan="1";
    				x[6].colSpan="1";
    				x[7].colSpan="1";
    				x[8].colSpan="1";
    				x[9].colSpan="1";
    				x[10].colSpan="1";
    				x[11].colSpan="1";
    				x[12].colSpan="1";
    				x[13].colSpan="1";
    				x[14].colSpan="1";
    				x[15].colSpan="1";
    				x[16].colSpan="1";
    				x[17].colSpan="1";
    				x[18].colSpan="1";
    				
 			for(var i=0;i<th.length;i++)
      	  {
				 if(th[i].className=="shenzhen1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
      	  }
 			
 			for(var i=0;i<th.length;i++)
      	  {
				 if(th[i].className=="shenzhen3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
      	  }
 		
 		 for(var i=0;i<th.length;i++)
  	  {
    	if(th[i].className=="foshan1")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }	
  	  }	
 		 for(var i=0;i<th.length;i++)
  	  {
    	if(th[i].className=="foshan3")
      	  {
      	  th[i].parentNode.removeChild(th[i]);
      	  }	
  	  }
 		for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="dongguan1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="dongguan3")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }
    		}
    		    if(showDu.length==1 && showDu[0]=="3"){
    		    	z[3].colSpan="7";
    				z[4].colSpan="6";
    				z[5].colSpan="6";
    				y[0].colSpan="7";
    				y[1].colSpan="6";
    				y[2].colSpan="6";
    				x[0].colSpan="1";
    				x[1].colSpan="1";
    				x[2].colSpan="1";
    				x[3].colSpan="1";
    				x[4].colSpan="1";
    				x[5].colSpan="1";
    				x[6].colSpan="1";
    				x[7].colSpan="1";
    				x[8].colSpan="1";
    				x[9].colSpan="1";
    				x[10].colSpan="1";
    				x[11].colSpan="1";
    				x[12].colSpan="1";
    				x[13].colSpan="1";
    				x[14].colSpan="1";
    				x[15].colSpan="1";
    				x[16].colSpan="1";
    				x[17].colSpan="1";
    				x[18].colSpan="1";
    				
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="shenzhen2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  			
  			for(var i=0;i<th.length;i++)
       	  {
				 if(th[i].className=="shenzhen1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
       	  }
  		
  		 for(var i=0;i<th.length;i++)
   	  {
     	if(th[i].className=="foshan2")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	  }	
  		 for(var i=0;i<th.length;i++)
   	  {
     	if(th[i].className=="foshan1")
       	  {
       	  th[i].parentNode.removeChild(th[i]);
       	  }	
   	  }
 
  		for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="dongguan2")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }
			
			for(var i=0;i<th.length;i++)
   	  {
				 if(th[i].className=="dongguan1")
	         	  {
	         	  th[i].parentNode.removeChild(th[i]);
	         	  }
   	  }	    
    		    
    		    
    		    
    		    }
           if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="2"){
        	    z[3].colSpan="14";
				z[4].colSpan="12";
				z[5].colSpan="12";
				y[0].colSpan="14";
				y[1].colSpan="12";
				y[2].colSpan="12";
				x[0].colSpan="2";
				x[1].colSpan="2";
				x[2].colSpan="2";
				x[3].colSpan="2";
				x[4].colSpan="2";
				x[5].colSpan="2";
				x[6].colSpan="2";
				x[7].colSpan="2";
				x[8].colSpan="2";
				x[9].colSpan="2";
				x[10].colSpan="2";
				x[11].colSpan="2";
				x[12].colSpan="2";
				x[13].colSpan="2";
				x[14].colSpan="2";
				x[15].colSpan="2";
				x[16].colSpan="2";
				x[18].colSpan="2";
				
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="shenzhen3")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
  	  }
			
			
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="foshan3")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		 for(var i=0;i<th.length;i++)
	   	  {
					 if(th[i].className=="dongguan3")
		         	  {
		         	  th[i].parentNode.removeChild(th[i]);
		         	  }
	   	  }	    
		 
		 
		 
		 
}
        if(showDu.length==2 && showDu[0]=="1" && showDu[1]=="3"){
        	z[3].colSpan="14";
			z[4].colSpan="12";
			z[5].colSpan="12";
			y[0].colSpan="14";
			y[1].colSpan="12";
			y[2].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="shenzhen2")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
  	  }
			for(var i=0;i<th.length;i++)
		   	  {
						 if(th[i].className=="dongguan2")
			         	  {
			         	  th[i].parentNode.removeChild(th[i]);
			         	  }
		   	  }	    	
			
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="foshan2")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		
}
        if(showDu.length==2 && showDu[0]=="2" && showDu[1]=="3"){
        	z[3].colSpan="14";
			z[4].colSpan="12";
			z[5].colSpan="12";
			y[0].colSpan="14";
			y[1].colSpan="12";
			y[2].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			
			for(var i=0;i<th.length;i++)
  	  {
			 if(th[i].className=="shenzhen1")
        	  {
        	  th[i].parentNode.removeChild(th[i]);
        	  }
  	  }
			
			for(var i=0;i<th.length;i++)
		   	  {
						 if(th[i].className=="dongguan1")
			         	  {
			         	  th[i].parentNode.removeChild(th[i]);
			         	  }
		   	  }	    	
		
		 for(var i=0;i<th.length;i++)
	  {
	if(th[i].className=="foshan1")
  	  {
  	  th[i].parentNode.removeChild(th[i]);
  	  }	
	  }	
		
}
          if(showDu.length==3 && showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
        	  z[3].colSpan="21";
				z[4].colSpan="18";
				z[5].colSpan="18";
				y[0].colSpan="21";
				y[1].colSpan="18";
				y[2].colSpan="18";
				x[0].colSpan="3";
				x[1].colSpan="3";
				x[2].colSpan="3";
				x[3].colSpan="3";
				x[4].colSpan="3";
				x[5].colSpan="3";
				x[6].colSpan="3";
				x[7].colSpan="3";
				x[8].colSpan="3";
				x[9].colSpan="3";
				x[10].colSpan="3";
				x[11].colSpan="3";
				x[12].colSpan="3";
				x[13].colSpan="3";
				x[14].colSpan="3";
				x[15].colSpan="3";
				x[16].colSpan="3";
				x[17].colSpan="3";
				x[18].colSpan="3";
				
			
		
} 
          }


        $("#tptable").table2excel({
            // 不被导出的表格行的CSS class类
            exclude: ".noExl",
            // 导出的Excel文档的名称，（没看到作用）
            name: "Excel Document Name",
            // Excel文件的名称
            filename: "2019地市KPI数据"
             });
            window.location.reload();
           
           });

 

</script>




</body>
</html>