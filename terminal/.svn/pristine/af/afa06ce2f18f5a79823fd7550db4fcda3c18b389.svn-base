<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
	

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>品牌容量设置</title>

</head>

<body>
	<style type="text/css">
.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
	height: 37px;
	margin-top: 5px;
}
.select2-container--default .select2-results > .select2-results__options {
  max-height: 200px;
  border:200px;
  overflow-y: auto;
  width: 200px; 
  }
.ui-jqgrid .ui-jqgrid-htable th {
	color: #607D8B;
}

.ui-jqgrid .ui-jqgrid-htable th {
	color: #607D8B;
}

.modal-body {
	position: absolute;
	left: 100px;
	top: 10px;
}
/* 设置表格样式 */
.ui-jqgrid .ui-jqgrid-htable th {
	text-align: center;
	color: #607D8B;
	/* background-color:#54abd6; */
	font-size: 16px;
}

.ui-jqgrid-htable th.ui-th-column-header {
	background-color: #607D8B;
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

.ui-widget-content {
	border: 1px solid #dddddd;
	background: #337ab7;
	color: white;
}

.element.style {
	width: 100%;
}

.ui-widget-content {
	border: 1px solid #dddddd;
	background: #275267;
	color: white;
}
table{
              table-layout: fixed; 
              border-collapse: collapse;
              width: 100%;
           color: white;
            align: center;
            
            }
td

{

    text-align:center;

}
#table0 input {
            background: #00063c;  /*设置输入框背景色*/
            height: 29px;
            width:100%;
            text-align:center;
             border:none;
        }

#table1 input {
            background: #00063c;  /*设置输入框背景色*/
            height: 29px;
            width:100%;
            text-align:center;
             border:none;
        }
 #table2 input {
            background: #00063c;  /*设置输入框背景色*/
            height: 29px;
            width:100%;
            text-align:center;
            word-wrap:break-word;word-break:break-all;
            
             border:none;
        } 
        
#table1 {

width: 100%;



}       
/* #table2 {

width:746px;
float:right;
position:absolute;top:200px;left:813px;
table-layout: fixed; 
border-collapse: collapse;
color: white;

}   */        



/* 按钮设置 */
#btSet {


position:absolute;right:700px;

}
#bt {

margin: 50px;

}


        
</style>


	<link rel="stylesheet"
		href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap.css">
	<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
	<script
		src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>
	<script type="text/javascript"
		src="<%=basePath%>resources/js/customerChannel/customerChannel.js?"></script>
	<%-- <script type="text/javascript"
	src="<%=basePath%>resources/js/brandRangeSet/informationSet.js?"></script> --%>
	<script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>
	<div
		style="margin-left: 10px; margin-right: 10px; margin-bottom: 20px; margin: 20px;">



		<!-- <table id="list" class="table table-bordered"></table>

<table id="listed" class="table table-bordered"></table> -->
<%-- <%
 String brand=request.getParameter("brand"); 
%> --%>
<form id="form1" method="post" action="../parameterSet/addAndUpdateLifeDate1.do">
<div class="row">
	<div class="col-xs-12">
	<%-- 	<input type="hidden" name="brand" value="<%=brand%>"> --%>
	<input type="hidden"  value="${brand}" id="brand" name="BRANDNAME"/>
	<input type="hidden"  value="${spec}" id="spec" name="SPEC"/>
	<input type="hidden"  value="${CYCLE}" id="CYCLE" name="CYCLE"/>
		<%-- <table border="1" bordercolor="#1addfa" id="table0">
			<tr  bgcolor="#4682B4">
			<td colspan="2" align="center">生命周期维度规划</td>
			</tr>
		
			   <tr> 
				<td>时期</td>
				<c:if test="${CYCLE==1}">
					<td><input type="text"  align="top" value="导入期" disabled="disabled" id="CYCLE"></input></td>
				</c:if>
				<c:if test="${CYCLE==2}">
					<td><input type="text"  align="top" value="成长期" disabled="disabled" id="CYCLE"></input></td>
				</c:if>
				<c:if test="${CYCLE==3}">
					<td><input type="text"  align="top" value="成熟期" disabled="disabled" id="CYCLE"></input></td>
				</c:if>
				<c:if test="${CYCLE==4}">
					<td><input type="text"  align="top" value="衰退期" disabled="disabled" id="CYCLE"></input></td>
				</c:if>
          	   </tr>
			   <tr> 
          	   <td>持续时长（周）</td>
				<td><input type="text" name="DURATION" align="top" id="DURATION"  value="${lifeDate.DURATION}"/></td>
          	   </tr>
			   <tr> 
				<td>销量（台）</td>
				<td><input type="text" name="SALEAMOUNT" id="SALEAMOUNT"  value="${lifeDate.SALEAMOUNT}"/></td>
          	   </tr>
			   <tr> 
				<td>收入（元）</td>
				<td><input type="text" name="INCOME" id="INCOME"  value="${lifeDate.INCOME}"/></td>
          	   </tr>
			   <tr> 
				<td>毛利（元）</td>
				<td><input type="text" name="MAORI" id="MAORI"  value="${lifeDate.MAORI}"/></td>
          	   </tr>
			   <tr> 
				<td>覆盖客户（个）</td>
				<td><input type="text" name="OVERAMOUNT" id="OVERAMOUNT"  value="${lifeDate.OVERAMOUNT}"/></td>
          	   </tr>
			   <tr> 
				<td>份额</td>
				<td> <input type="text" name="SHARE" id="SHARE"  value="${lifeDate.SHARE}"/></td>
          	   </tr>
			   <tr> 
				<td>库存周转（周）</td>
				<td><input type="text" name="TURNOVERTIME" id="TURNOVERTIME"  value="${lifeDate.TURNOVERTIME}"/></td>
          	   </tr>
			   <tr> 
                <td>操作</td>
				<td><input type="submit"  id="lifeDate"  value="${lifeDate.DURATION==null?"添加":"修改"}"/></td>
          	   </tr>

      
          
		
		</table> --%>
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  	<div class="modal-dialog" role="document">
			    <div class="modal-content">
			      	<div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				        	<span aria-hidden="true">×</span>
				        </button>
				        <h4 class="modal-title" id="myModalLabel">模态窗口</h4>
			      	</div>
				    <div class="modal-body modal-li">
				      	
				      	  	<table border="1" bordercolor="#1addfa" id="table0">
			<tr  bgcolor="#4682B4">
			<td colspan="2" align="center">生命周期维度规划</td>
			</tr>
		
			   <tr> 
				<td>时期</td>
				<c:if test="${CYCLE==1}">
					<td><input type="text"  align="top" value="导入期" disabled="disabled" id="CYCLE"></input></td>
				</c:if>
				<c:if test="${CYCLE==2}">
					<td><input type="text"  align="top" value="成长期" disabled="disabled" id="CYCLE"></input></td>
				</c:if>
				<c:if test="${CYCLE==3}">
					<td><input type="text"  align="top" value="成熟期" disabled="disabled" id="CYCLE"></input></td>
				</c:if>
				<c:if test="${CYCLE==4}">
					<td><input type="text"  align="top" value="衰退期" disabled="disabled" id="CYCLE"></input></td>
				</c:if>
          	   </tr>
			   <tr> 
          	   <td>持续时长（周）</td>
				<td><input type="text" name="DURATION" align="top" id="DURATION"  value="${lifeDate.DURATION}"/></td>
          	   </tr>
			   <tr> 
				<td>销量（台）</td>
				<td><input type="text" name="SALEAMOUNT" id="SALEAMOUNT"  value="${lifeDate.SALEAMOUNT}"/></td>
          	   </tr>
			   <tr> 
				<td>收入（元）</td>
				<td><input type="text" name="INCOME" id="INCOME"  value="${lifeDate.INCOME}"/></td>
          	   </tr>
			   <tr> 
				<td>毛利（元）</td>
				<td><input type="text" name="MAORI" id="MAORI"  value="${lifeDate.MAORI}"/></td>
          	   </tr>
			   <tr> 
				<td>覆盖客户（个）</td>
				<td><input type="text" name="OVERAMOUNT" id="OVERAMOUNT"  value="${lifeDate.OVERAMOUNT}"/></td>
          	   </tr>
			   <tr> 
				<td>份额</td>
				<td> <input type="text" name="SHARE" id="SHARE"  value="${lifeDate.SHARE}"/></td>
          	   </tr>
			   <tr> 
				<td>库存周转（周）</td>
				<td><input type="text" name="TURNOVERTIME" id="TURNOVERTIME"  value="${lifeDate.TURNOVERTIME}"/></td>
          	   </tr>
			   <tr> 
                <td>操作</td>
				<td><input type="submit"  id="lifeDate"  value="${lifeDate.DURATION==null?"添加":"修改"}"/></td>
          	   </tr>

      
          
		
		</table>
				      	
				    </div>
				    <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="button" class="btn btn-primary"  onclick="update()">保存</button>
				    </div>
			    </div>
		  	</div>




</div>	
</div>	 
</form>	 

	
	
	
	
	<!--  图表------------------ -->







	<script type="text/javascript">
	function goback(){
		
		
		window.history.go(-1);
		
		
	}
/* 保存事件 */	



//触发模态框的同时调用此方法  
function editInfo(obj) {  
	
    $('#modal').modal('show');  
}  
//生命周期提交更改  
function update() {  
    //获取模态框数据  
   var brand =$("#brand").val();	
   var spec =$("#spec").val();	
    $.ajax({  
        type: "post",  
        url: "../parameterSet/addAndUpdateLifeDate1.do",  
        data: "brand=" + brand + "&spec=" + spec,  
        dataType: 'json',  
        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
        success: function(result) {  
            //location.reload();  
        }  
    }); 
	$('#modal').modal('hide');  
}

	
	

	
	
	
	
	</script>



</body>
</html>