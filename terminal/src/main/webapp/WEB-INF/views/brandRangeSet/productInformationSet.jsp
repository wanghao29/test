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
<title>品牌容量设置</title>

</head> 

<body>
<style   type="text/css">
input::-webkit-input-placeholder {
        /* placeholder颜色  */         
        color: #1addfa;       
      
        
        
    }




/* 
.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
    height: 37px;
    margin-top: 5px;
    color:white;


}
.ui-jqgrid-labels jqg-second-row-header {
bgcolor:"#4682B4";

}
.ui-jqgrid .ui-jqgrid-htable th {
    color: #607D8B;
}


.ui-jqgrid .ui-jqgrid-htable th {
    color: #607D8B;
} */
/* .select2-container--default .select2-results > .select2-results__options {
  max-height: 200px;
  border:200px;
  overflow-y: auto;
  width: 200px; 
  } */
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

/* .ui-jqgrid-htable th.ui-th-column-header {

background-color:#607D8B;

}
.content div { 

color: white;

}
.ui-th-column-header, .ui-jqgrid .ui-jqgrid-htable th.ui-th-column-header, .ui-jqgrid .ui-jqgrid-htable .ui-th-div {

color: white;

}
.ui-jqgrid tr.jqgrow td, .ui-jqgrid {

border: none;

}

.ui-jqgrid .ui-jqgrid-hbox {

border: none;
}

.ui-widget-content {
    border: 1px solid #dddddd;
    background: #337ab7;
    color: white;
}

.ui-widget-content a {
    color: red;
} */

</style>


<link rel="stylesheet"
	href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
 
<script
	src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/js/customerChannel/customerChannel.js?"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/js/brandRangeSet/productInformationSet.js?"></script>
<script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>
<div clss="row" style="margin-top: 30px;">
<div class="col-xs-6" style="margin-bottom: 50px;">
<input type="text"  placeholder="请输入搜索的品牌" id="local-dynamic-select" style="background-color: #473C8B;height: 34px;width:170px; font-size: 20px;" data-tableid="grid-table" data-selectrow="selectRow"/>
</div>	
<div class="col-xs-6" style="margin-bottom: 50px;">
<button onclick="window.location.href='<%=basePath%>/product/seted.do'" style="float: right;color:#1addfa; background-color: #00063d;font-size: 20px;">新增  / 修改信息设置</button>
</div>	


</div>	



<div clss="row">
<div class="col-xs-12">

<table id="list"></table>
<div id=pager></div>
<!-- <input  id="bt" type="button" value="规划值设置" onclick="buttonClick();"/> -->
</div>	
  </div>      
<!--  图表------------------ -->







<script type="text/javascript">

/* $(function(){// dom元素加载完毕
	  $('#list tbody tr:even').css("backgroundColor","#337ab7");
	  //获取id为tb的元素,然后寻找他下面的tbody标签，再寻找tbody下索引值是偶数的tr元素,
	  //改变它的背景色.
	 }) */

/* 鼠标移入移出事件  */
<%--  var btn = document.getElementById("bt");
	
 btn.onclick =function(){
	 window.location.href="<%=basePath%>parameterSet/setOne.do";
 }; --%>

<%--  var jsid = $("#list").getCell(gr,"brandname");
   alert(jsid);
 function tiaohuan(value, grid, rows, state) { 
	 
	 return "<a href=<%=basePath%>parameterSet\/setOne.do style=\"color:#1addfa; \" >规划值设置</a>" 
 }; --%>

/* 动态加载品牌值   */  
 <%-- function getOptionValue() {
 	var options = "";
 	var i = 0;
 	$.ajax({
 		async: false,  //千万要记住加这个属性配置
 		type: "post",
 		datatype: 'json',
 		url: "<%=basePath%>brandEnty/brands.do",
 		success: function(data) {
 			for(i; i < data.length; i++) {
 				if(i != data.length - 1) {
 					options += data[i] + ":" + data[i] + ";";
 				} else {
 					options += data[i] + ":" + data[i];
 				}
 			}
 		}
 	});
 	return options;
 }  --%>
 
/*动态加载型号值   */ 
 
 <%-- function getDoubleValue(data){
	 var options = "";
	 	var i = 0;
	 	$.ajax({
	 		async: false,  //千万要记住加这个属性配置
	 		type: "post",
	 		datatype: 'json',
	 		url: "<%=basePath%>brandEnty/doubles.do",
	 		data:roleid,
	 		success: function(data) {
	 			for(i; i < data.length; i++) {
	 				if(i != data.length - 1) {
	 					options += data[i] + ":" + data[i] + ";";
	 				} else {
	 					options += data[i] + ":" + data[i];
	 				}
	 			}
	 		}
	 	});
	 	return options;
	

	
}  --%>

 

</script>



</body>
</html>