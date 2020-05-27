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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>价</title>
</head> 

<body>
<style   type="text/css">
.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
    height: 37px;
    margin-top: 5px;
}

.ui-jqgrid .ui-jqgrid-htable th {
    color: #607D8B;
}


.ui-jqgrid .ui-jqgrid-htable th {
    color: #337ab7;
}

 .modal-body {
  position:absolute;
  left:100px;
  top:10px;
  }
/* 设置表格样式 */
.ui-jqgrid .ui-jqgrid-htable th {

text-align: center;
color: #607D8B;
/* background-color:#54abd6; */
 font-size:16px;


}

.ui-jqgrid-htable th.ui-th-column-header {

background-color:#54abd6;

}

.content div { 

color: #607D8B;

}
.ui-jqgrid tr.jqgrow td, .ui-jqgrid {

border: none;

}

.ui-jqgrid .ui-jqgrid-hbox {

border: none;
}
/* 关注维度框设置  */
.cation {
font-size: 15px;
margin-top: -10px;
margin-bottom: 30px;

 position: relative;
  left: 18px;
 
}

.select1 {

width: 100px;
background-color: #f5f5f5;
border-radius: 3px;
}

/* 返回按钮设置 */
.bt5 {
color:white;
width: 120px;
background-color: #337ab7;
border-radius: 3px;
 margin-left: 83%;

}
.jqg-first-row-header {

background-color: #337ab7;

}
#table5 tr td {
width:100px;
text-align: center;
/* padding-top:0px !important;
padding-bottom:0px !important; */

}
/* 对超链接的样式进行设置  */
  a:link{text-decoration: none; color:white;font-size: 18px; font-family: 微软雅黑;}
</style>
<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
<script src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>

 <script type="text/javascript" src="<%=basePath%>resources/js/customerChannel/customerChannel.js?"></script>
 
     <!-- <link href="resources/css/main.css" rel="stylesheet">
    <script type="text/javascript" src="resources/js/plugin/jquery-3.3.1.min.js"></script> -->
  
   <link rel="stylesheet" href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap.css">
    <script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>
    <script src="<%=basePath%>resources/js/brandRangeSet/showAndHide.js?"></script>
 
   
   <div class="row" style=" margin: 20px;z-index: 1000;">
   <div class="col-xs-6">
   
   
 <label style="background-color: #00063c;font-size: 18px;margin-left:6%"> 关注维度：</label>  
   
   <input id="brand" type="hidden" value="${map.brand}">
   <input id="spec" type="hidden" value="${map.spec}">
   <input id="brand1" type="hidden" value="${map.COMPETBRANDNAME1}">
   <input id="brand2" type="hidden" value="${map.COMPETBRANDNAME2}">
   <input id="spec1" type="hidden" value="${map.COMPETSPEC1}">
   <input id="spec2" type="hidden" value="${map.COMPETSPEC2}">
    <select id="select1" style="background-color: #00063c;font-size: 18px;">
        <option value="">请选择</option>
        <option>量</option>
        <option>利</option>
        <option>收</option>
        <option>价</option>
        <option>覆</option>
        <option>库</option>
        <option selected="selected">份</option>
        <option>秩</option>
   
    
    
    
    </select>
   </div>
   <div class="col-xs-6">
   <!-- <button id="bt" onclick="goback()" style="margin-left: 83%;">返回</button> -->
   <a download="份数据导出Excel" id="excelOut" class="bt5" href="#" style="height: 50px;">导出Excel</a>
   </div>
   </div>
   
   
   

<div class="row" style=" margin: 20px;z-index: 1000;">
<div class="col-xs-12" align="center">
<table border="1" bordercolor="#1addfa" id="table5">
		

			<tr  bgcolor="#4682B4">
			<td colspan="18" align="center" height="40px;"style="font-size: 25px;">产品信息操盘份实时数据</td>
			</tr>
			<tr  bgcolor="#4682B4">
			    <td  colspan="14" style="text-align: left;font-size: 20px;"><span style="color: #7CFC00">品牌:</span>&nbsp;&nbsp;${map.brand}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #7CFC00">产品通俗名称:</span>&nbsp;&nbsp;${map.sname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #7CFC00">CTM系统型号:</span>&nbsp;&nbsp;${map.spec}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #7CFC00">SCM系统型号:</span>&nbsp;&nbsp;${map.meterdes}</td>
			   
			 </tr>
			<tr>
				<!-- <td rowspan="2">品牌</td>
				<td rowspan="2">产品通俗名称</td>
				<td rowspan="2">CTM系统型号</td>
				<td rowspan="2">SCM系统型号</td> -->
				<td rowspan="2" id="ta" class="wk">操盘周数</td> 
				<td rowspan="2" class="BZstart">本周起始时间</td>
				<td rowspan="2" class="endBZ">本周结束时间</td>
				<td colspan="2" class="lifeZQ" align="center">生命周期</td>
                <td colspan="2" class="DTamount" align="center">动态规划量（台）</td>
                <td colspan="2" class="nowXL" align="center">当前份额</td>
                <td rowspan="2" class="DBamount" align="center">对标品份额</td>
                <td rowspan="2" class="JPamount" align="center">竞品份额</td>
                <td colspan="3" class="healthLife" align="center">份额规划健康性</td>

			</tr>
			
			<tr>			
			    <td class="lifeZQ">规划生命周期</td>
			    <td class="lifeZQ">竞品生命周期</td>					
				<td class="DTamount">累计规划份额</td>
				<td class="DTamount">本周规划份额</td>
				<td class="nowXL">累计份额</td>
				<td class="nowXL">本周份额</td>
				<td class="healthLife">对标规划值</td>
				<td class="healthLife">对标对标品</td>
				<td class="healthLife">对标竞品</td>
			</tr>
 
 
  <c:forEach items="${showAll.newDate}" var="list">  
  <tr>	
		        <%-- <td>${list.brandname}</td>
			    <td>${list.sname}</td>					
				<td>${list.spec}</td>
				<td>${list.meterdes}</td> --%>
				<td class="wk" id="tt" name="haha">${list.week}</td>
				
				<td class="BZstart">${list.startTime}</td>
				<td class="endBZ">${list.endTime}</td>
				<c:if test="${list.planDate==1}">
					<td class="lifeZQ">导入期</td>
					<td class="lifeZQ">导入期</td>
				</c:if>
				<c:if test="${list.planDate==2}">
					<td class="lifeZQ">成长期</td>
					<td class="lifeZQ">成长期</td>
				</c:if>
				<c:if test="${list.planDate==3}">
					<td class="lifeZQ">成熟期</td>
					<td class="lifeZQ">成熟期</td>
				</c:if>
				<c:if test="${list.planDate==4}">
					<td class="lifeZQ">衰退期</td>
					<td class="lifeZQ">衰退期</td>
				</c:if>
			    <%-- <td>${list.compatitor}</td> --%>
			     <td class="DTamount">${list.totalPlan}</td>	
			    <td class="DTamount">${list.nowPlan}</td>					
				<td class="nowXL">${list.nowSale}</td>
				<td class="nowXL">${list.weekSale}</td>
				<td class="DBamount">${list.benchSale}</td>
				<td class="JPamount">${list.competitorSale}</td>
			   
				<%-- <c:if test="${list.benchPlan>30}">
				 <td style="color: red;">
			    <fmt:formatNumber type="number" maxFractionDigits="0">${list.benchPlan}%
				 ${(list.nowPlan-list.weekSale)/list.weekSale*100} 
				 <td>${(list.weekSale/list.nowPlan-1)*100}%</td>
				 </fmt:formatNumber> 
				</td>
			 	</c:if>  --%>
			 	<c:if test="${list.benchPlan>30}">
			 	<td class="healthLife" style="color: red;"><fmt:formatNumber type="number" value="${list.benchPlan}" pattern="#.00"/>
			 	%
			 	</td>
			 	</c:if> 
			 	<c:if test="${list.benchPlan>0&&list.benchPlan<30}">
			 	<td class="healthLife" style="color: yellow;"><fmt:formatNumber type="number" value="${list.benchPlan}" pattern="#.00"/>
			 	%</td>
			 	</c:if>
			 	<c:if test="${list.benchPlan<0}">
			 	<td class="healthLife" style="color: #32CD32;"><fmt:formatNumber type="number" value="${list.benchPlan}" pattern="#.00"/>
			 	%</td>
			 	</c:if>  
				<c:if test="${ list.benchPlan==0}">
				
				<td class="healthLife" style="color: #32CD32;"></td>
				
				</c:if>
				
				
				
				<c:if test="${list.benching>30}">
			 	<td class="healthLife" style="color: red;"><fmt:formatNumber type="number" value="${list.benching}" pattern="#.00"/>
			 	%
			 	</td>
			 	</c:if> 
			 	<c:if test="${list.benching>0&&list.benching<30}">
			 	<td class="healthLife" style="color: yellow;"><fmt:formatNumber type="number" value="${list.benching}" pattern="#.00"/>
			 	%</td>
			 	</c:if>
			 	<c:if test="${list.benching<0}">
			 	<td class="healthLife" style="color: #32CD32;"><fmt:formatNumber type="number" value="${list.benching}" pattern="#.00"/>
			 	%</td>
			 	</c:if>  
				<c:if test="${list.benching==0}">
				
				<td class="healthLife" style="color: #32CD32;"></td>
				
				</c:if>
				
								

                <c:if test="${list.benchCompetitor>30}">
			 	<td class="healthLife" style="color: red;"><fmt:formatNumber type="number" value="${list.benchCompetitor}" pattern="#.00"/>
			 	%
			 	</td>
			 	</c:if> 
			 	<c:if test="${list.benchCompetitor>0&&list.benchCompetitor<30}">
			 	<td class="healthLife" style="color: yellow;"><fmt:formatNumber type="number" value="${list.benchCompetitor}" pattern="#.00"/>
			 	%</td>
			 	</c:if>
			 	<c:if test="${list.benchCompetitor<0}">
			 	<td class="healthLife" style="color: #32CD32;"><fmt:formatNumber type="number" value="${list.benchCompetitor}" pattern="#.00"/>
			 	%</td>
			 	</c:if>  
               <c:if test="${list.benchCompetitor==0}">
				
				<td class="healthLife" style="color: #32CD32;"></td>
				
				</c:if>


			</tr>
	  </c:forEach>

		
		</table>


</div>	
                   <div align="center" style="magin: 200px; margin-top: 300px;">
                   
                    <button type="button" onclick="modelSet()" style="width: 100px; background-color:#23527c;">显示设置</button>           
                   </div>   
        </div>

<!-- 复选框模态框功能的实现------------------ -->
	<div class="modal fade" id="modalWeek" tabindex="3" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">信息设置</h4>
				</div>
				<div align="left">
				<p><span style="font-size: 25px;">
				   <input id="input_add_opProcesses_change" style="zoom:150%;" type="checkbox" name="category" value="今日话题" onclick="checkAll()" />
				          操盘周数 
				   </span>
                    <span style="font-size: 25px;">
                    <input id="startBZ" onclick="start()" style="zoom:150%;" type="checkbox" name="category" value="今日话题" />
                                                  本周起始时间 
                   </span>
                     <span style="font-size: 25px;">
                     <input id="amountDT" onclick="DT()" style="zoom:150%;" type="checkbox" name="category" value="今日话题" />
                                                   动态规划份额
                      </span>
                     </p>
                  <p> <span style="font-size: 25px;">
                  <input id="ZQlife" onclick="life()" style="zoom:150%;" type="checkbox" name="category" value="今日话题" />
                                                    生命周期 
                     </span>
                    <span style="font-size: 25px;">
                    <input id="BZend" onclick="end()" style="zoom:150%;" type="checkbox" name="category" value="今日话题" />
                                                    本周结束时间
                     </span>
                     
                     
                      <span style="font-size: 25px;">
                      <input id="amountDB" onclick="DB()" style="zoom:150%;" type="checkbox" name="category" value="今日话题" />
                                                       对标品份额
                     </span>
                 </p>
                   
                     <p><span style="font-size: 25px;">
                     <input id="amountJP" onclick="JP()" style="zoom:150%;" type="checkbox" name="category" value="今日话题" />
                                                      竞品份额
                         </span>
                     <span style="font-size: 25px;">
                     <input id="healthXL" onclick="health()" style="zoom:150%;" type="checkbox" name="category" value="今日话题" />
                                                      份额规划健康性
                       </span>
                     <span style="font-size: 25px;"><input id="XLnow" onclick="XL()" style="zoom:150%;" type="checkbox" name="category" value="今日话题" />
                                                      当前份额
                      </span>
                     </p>
					
					
					
					
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<!-- <button type="button" class="btn btn-primary" onclick="updateNew()">保存</button> -->
				</div>
			</div>
		</div>
	</div>





<script type="text/javascript">

$(function(){// dom元素加载完毕
	  $('#list tbody tr:even').css("backgroundColor","#337ab7");
	  //获取id为tb的元素,然后寻找他下面的tbody标签，再寻找tbody下索引值是偶数的tr元素,
	  //改变它的背景色.
	 })

/* 返回事件  */

function goback(){
	
	
	window.history.go(-1);
	
	
}
  
  
//post提交
$.extend({
    StandardPost:function(url,args){
        var form = $("<form method='post'></form>"),
            input;
        form.attr({"action":url});
        form.attr({"target":"_blank"});
        $.each(args,function(key,value){
            input = $("<input type='hidden'>");
            input.attr({"name":key});
            input.val(value);
            form.append(input);
        });
        form.prependTo(document.body);
        form.submit();
        document.body.removeChild(form[0]);
    }
}); 


/* 多维度选择 */

 var select = document.getElementById('select1');
 var brand=$("#brand").val();
 var COMPETBRANDNAME1=$("#brand1").val();	
 var COMPETBRANDNAME2=$("#brand2").val();	
 var model=$("#spec").val();	
 var COMPETSPEC1=$("#spec1").val();	
 var COMPETSPEC2=$("#spec2").val();
select.onchange = function(){
    var val = this.value;
    if(val=="量"){

    	$.StandardPost(basePath+'/quantitySet/show.do',{'BRANDNAME':brand,'SPEC':model,
    		'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2})
    	
    	/*  var url=basePath+"/quantitySet/show.do?BRANDNAME="+brand+"&SPEC="+model+"&brand1="+COMPETBRANDNAME1
		 +"&model1="+COMPETSPEC1+"&brand2="+COMPETBRANDNAME2+ "&model2="+COMPETSPEC2;
            
    	location.href=url;  */
	
    	
    }
    
    if(val=="利"){

    	
            
    	$.StandardPost(basePath+'/quantitySet/li.do',{'BRANDNAME':brand,'SPEC':model,
    		'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2})
	
    }
   
    
    if(val=="价"){

    	
            
    	$.StandardPost(basePath+'/quantitySet/price.do',{'BRANDNAME':brand,'SPEC':model,
    		'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2})
	
    }
    
    if(val=="覆"){

    	
            
    	$.StandardPost(basePath+'/quantitySet/cover.do',{'BRANDNAME':brand,'SPEC':model,
    		'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2})
	
    }
    if(val=="库"){

    
            
    	$.StandardPost(basePath+'/quantitySet/stock.do',{'BRANDNAME':brand,'SPEC':model,
    		'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2})
	
    }
    if(val=="份"){

    
            
    	$.StandardPost(basePath+'/quantitySet/share.do',{'BRANDNAME':brand,'SPEC':model,
    		'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2})
	
    }
    
    if(val=="秩"){

    	
            
    	$.StandardPost(basePath+'/quantitySet/order.do',{'BRANDNAME':brand,'SPEC':model,
    		'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2})
	
    }
    
    if(val=="收"){

            
    	$.StandardPost(basePath+'/quantitySet/income.do',{'BRANDNAME':brand,'SPEC':model,
    		'brand1':COMPETBRANDNAME1,'model1':COMPETSPEC1,'brand2':COMPETBRANDNAME2,'model2':COMPETSPEC2})
	
    }
    
}      
  
//**********************************数据导出功能的实现 ********************************************************************* 

window.onload = function () {
       tableToExcel('tableToExcel', '下载模板')
   };
   //base64转码
   var base64 = function (s) {
       return window.btoa(unescape(encodeURIComponent(s)));
   };
   //替换table数据和worksheet名字
   var format = function (s, c) {
       return s.replace(/{(\w+)}/g,
           function (m, p) {
               return c[p];
           });
   }
   function tableToExcel(tableid, sheetName) {
       var uri = 'data:application/vnd.ms-excel;base64,';
       var template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel"' +
           'xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'
           + '<x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets>'
           + '</x:ExcelWorkbook></xml><![endif]-->' +
           ' <style type="text/css">' +
           'table td {' +
           'border: 1px solid #1addfa;' +
           'width: 100px;' +
           'height: 25px;' +
           ' text-align: center;' +
           'background-color: #00063c;' +
           'color: #ffffff;' +
           ' }' +
           '</style>' +
           '</head><body ><table class="excelTable">{table}</table></body></html>';
       if (!tableid.nodeType) tableid = document.getElementById('table5');
       var ctx = {worksheet: sheetName || 'Worksheet', table: tableid.innerHTML};
       document.getElementById("excelOut").href = uri + base64(format(template, ctx));
   }  
  
  
  
  
  
  

</script>



</body>
</html>