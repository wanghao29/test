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
/*  #table5 td {
            font-size: 12px;
            width: 200px;
            height: 30px;
            text-align: center;
            background-color: #4f891e;
            color: #ffffff;
        } */
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
 
 <!--表头3个展示框  -->
  <div class="row" style=" margin: 20px;z-index: 1000;">
   <div class="col-xs-3" style="border: solid 1px;;height: 70px;align-content: center;">
   <label style="font-size: 25px;">每台加权平均价</label> <input id="" style="width: 130px;height: 50px;"/>
   </div>
    <div class="col-xs-2">
   <input/>
    </div>
    <div class="col-xs-2">
   <input/>
    </div>
    </div>
  <div class="row" style=" margin: 20px;z-index: 1000;">
		<!-- 表头控件 -->
	
			
			
			<div class="col-xs-3">
			<label style="font-size: 18px; color: white; font-weight: normal;">时间类型：
			</label>
			
			<select name="times" id="times" onchange ="changeTime()"
				style="border-color: #1addfa; width: 100px; color: white;text-align:center;
				 background-color: #00063c; height: 30px;border-radius: 16px; ">
				<option value="">请选择类型</option>
				<option value="day" >日指标</option>
				<option value="month" selected="selected">月指标</option>				
			</select>
			</div>		
			

	  <div class="col-xs-3"  id="dayes">
		<label
			 style="font-size: 18px; color: white; font-weight: normal;">&nbsp;&nbsp;&nbsp;日指标:
		</label> 
		<input name="day1" id="day1" 
			type="text" style="width:30%;height: 30px;  background-color: #00063c; 
			border-color: #1addfa;text-align:center; color: white;border-radius: 16px; " readonly="readonly"
			onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-{%M}',onpicked:selectDate})" />
	
	
		<label
			 style="font-size: 18px; color: white; font-weight: normal;">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
		 </label>
		 <input name="day2" id="day2"			 
			type="text" style="width:30%;height: 30px;  background-color: #00063c; 
			border-color: #1addfa;text-align:center; color: white;border-radius: 16px; " readonly="readonly"
			onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-{%M}',onpicked:selectDate})" />
	     </div>
      <div class="col-xs-3" style="display:none" id="mon">
		<label
			 style="font-size: 18px; color: white; font-weight: normal;">&nbsp;&nbsp;&nbsp;月指标:
		</label> 
			
			 <input name="month1" id="month1" 			  
			type="text" style="width:30%;height: 30px;  background-color: 
			#00063c; text-align:center; border-color: #1addfa; color: white;border-radius: 16px; " readonly="readonly"
			onClick="WdatePicker({dateFmt:'yyyy-MM',maxDate:'%y-{%M}',onpicked:selectDate})" />
	
		<label
			 font-size: 18px; color: white; font-weight: normal;">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</label>
		 
		 <input name="month2" id="month2"			 
			type="text" style="width:30%;height: 30px;text-align:center;  background-color: #00063c; 
			border-color: #1addfa; color: white;border-radius: 16px; " readonly="readonly"
			onClick="WdatePicker({dateFmt:'yyyy-MM',maxDate:'%y-{%M}',onpicked:selectDate})" />
	     </div>
	<div class="col-xs-2">
	
	
	<button id="customizationModalShow" class="select" name="btName"
			style="width: 55%;height:30px; background-color: #1addfa;border-radius: 16px;
			 margin-left: 5%;" onclick="btn()">
			查询</button>
	
	</div>
	

	</div>
	
   
   
   

<div class="row" style=" margin: 20px;z-index: 1000;">
<div class="col-xs-12">
<table id="list"></table>
<div id="pager">
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
  

  
  

</script>



</body>
</html>