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
<title>量</title>
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
#bt {
color:white;
width: 120px;
background-color: #337ab7;
border-radius: 3px;
 

}
.jqg-first-row-header {

background-color: #337ab7;

}


</style>
<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
<script src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>

 <script type="text/javascript" src="<%=basePath%>resources/js/customerChannel/customerChannel.js?"></script>
 <script type="text/javascript" src="<%=basePath%>resources/js/brandRangeSet/quantitySet.js"></script>
     <!-- <link href="resources/css/main.css" rel="stylesheet">
    <script type="text/javascript" src="resources/js/plugin/jquery-3.3.1.min.js"></script> -->
  
   <link rel="stylesheet" href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap.css">
    <script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>
 
   
   <div class="row" style=" margin: 20px;z-index: 1000;">
   <div class="col-xs-6">
   
   
 <label> 关注维度：</label>  
   
   
    <select class="select1" style="background-color: #00063c;">
        <option>量</option>
        <option>利</option>
        <option>收</option>
        <option>价</option>
        <option>覆</option>
        <option>库</option>
        <option>份</option>
        <option>秩</option>
    </select>
   </div>
   <div class="col-xs-6">
   <button id="bt" onclick="goback()" style="margin-left: 83%;">返回</button>
   <input type="text" name="brand" value="${list.brand}"/>
   
   </div>
   </div>
   
   
   

<div class="row" style=" margin: 20px;z-index: 1000;">
<div class="col-xs-12">
<table id="list" class="table table-bordered"></table>

<div id=pager></div>
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
  

</script>



</body>
</html>