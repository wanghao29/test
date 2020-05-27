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
 	 first-child:none;
 	}
 	



 	
</style>

</head>







<body style="overflow-x:hidden;min-width: 1508px;">

    <script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugin/bootstrap_3.3.7/bootstrap.min.js?"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/cityKpi/layer.js?"></script>
    <link href="https://cdn.bootcss.com/multiple-select/1.2.0/multiple-select.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/multiple-select/1.2.0/multiple-select.min.js"></script>
	<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
	<script	src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/cityKpi/broken.js?"></script>
	
	<script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>
	<script src="<%=basePath%>resources/js/plugin/table2excel.js"></script>
	<div class="row">
	<div class="col-xs-12" style="margin-left: 10px;background-color:#36648B" align="left">
	<span style="color: #33ffff;font-size: 20px;">经分监控   / 量   / 碎屏险期初数据</span>
	</div>
	</div>
	<div class="row" style="padding-top: 30px;">
    	<div class="col-xs-2" style="margin-left: 0.1%;" align="left">
			<span>ECSS编码：</span>
			<input type="text"  align="top" oninput = "value=value.replace(/[^0-9.]/g,'')"
			id="kind1" name="kind1" style="color: blue;text-align: center;border-radius: 6px;"
			/>
		</div>
		<div class="col-xs-2" align="left">
			<span>产品名称：</span>
			<input type="text"  align="top"
			id="brand1" style="color: blue;text-align: center;border-radius: 6px;" />
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
>添加数据
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
							
							<a style="color:white;" href="<%=basePath%>resources/tmpl/brokenScreen.xlsx">模板下载</a>
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
 	
 	<!--表格  -->  
 	<div  class="row" style="padding-top: 30px;">
 	
 	
 	
 	
 	
 	
 	
 	<table class="table table-striped table-sm" style="white-space: nowrap;/*规定段落的文本不进行换行*/
     text-overflow: ellipsis;/*隐藏的字符用省略号表示  IE*/-moz-text-overflow: ellipsis;/*隐藏的字符用省略号表示  火狐*/
     table-layout:fixed;/*table的内部布局固定大小，才可以通过td的width控制宽度*/overflow: hidden;">
							<thead>   
								<tr style="text-align:left;">
								   <!--  <th style="display: none;">编号</th> -->
									<th>ECSS编码</th>									
									<th>产品名称</th>
									<th>零售价</th>
									<th>基准价</th>
									<th>采购价</th>
									
									
									<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</th>
								</tr>
							</thead>
							<tbody>
							    <c:forEach items="${fns}" var="fn">
								<tr style="text-align:left;">
								    <td style="display: none;">${fn.id}</td>
									<td style='white-space:nowrap;overflow:hidden;text-overflow: ellipsis;'>${fn.ecssAport}</td>
									<td style='white-space:nowrap;overflow:hidden;text-overflow: ellipsis;'>${fn.product}</td>
									<td style='white-space:nowrap;overflow:hidden;text-overflow: ellipsis;'>${fn.retail}</td>
									<td style='white-space:nowrap;overflow:hidden;text-overflow: ellipsis;'>${fn.basePrice}</td>						
									<td style='white-space:nowrap;overflow:hidden;text-overflow: ellipsis;'>${fn.shopPrice}</td>
					
									
									<td>
										<%-- <a class="btn btn-sm btn-primary" href="<%=basePath%>/product/seted.do?${fn.id}">修改</a> --%>
										<a class="btn btn-sm btn-primary"  href="#" onclick="update('${fn.id}')">修改</a>
										<button onclick="deleteD('${fn.id}')" class="btn btn-sm btn-danger deleteBtn">删除</button>
									</td>
								</tr>
								</c:forEach>
							</tbody>

						</table>
 	    <div>	<p  style="border: 0px;color: red;text-align: center;font-size: 15px ">${mss}</p></div>
 	               <div align="center">
						<%-- <a class="allpage">共  ${maxPage} 页</a>
						<a  href="<%=basePath%>model5Gdate/modelList.do?pageNumber=1">首页</a>
						<a  href="<%=basePath%>model5Gdate/modelList.do?pageNumber=${pageNo-1}">上一页</a>
						<a class="allpage">第  ${pageNo} 页</a>
						<a  href="<%=basePath%>model5Gdate/modelList.do?pageNumber=${pageNo+1}">下一页</a>
						<a  href="<%=basePath%>model5Gdate/modelList.do?pageNumber=${maxPage}">尾页</a> --%>
						<a class="allpage">共  ${maxPage} 页</a>
						<a onclick="one('${ecssAport},${product}')">首页</a>
						<a onclick="fistOn('${pageNo-1},${ecssAport},${product}')">上一页</a>
						<a class="allpage">第  ${pageNo} 页</a>
						<a onclick="next('${pageNo+1},${ecssAport},${product}')">下一页</a>
						<a onclick="last('${maxPage},${ecssAport},${product}')">尾页</a>
						
						
						
						
					</div>
 	                </div>
 	
 	
 	
 	
 <div class="modal fade"  id="myModal1" tabindex="-1"  role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" align="center"  role="document" style="width: 80%;height:20%;margin-left: 0.5%;margin-top: 4%;">
			<div class="modal-content" >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">数据修改</h4>
				</div>
				<div class="modal-body modal-li">
					<form id="form1" method="post" 
						action="../broken/updateModel.do">
						<table border="1" bordercolor="#1addfa" id="table0" >
							<tr bgcolor="#4682B4">
								<td colspan="11" align="center">数据信息</td>
							</tr>

							<tr>
							    <td style="text-align: center;display: none;">id</td>
								<td style="text-align: center;">ECSS编码</td>
								<td style="text-align: center;" id="cycle1">产品名称</td>
								<td style="text-align: center; "id="cycle2">零售价</td>
								<td style="text-align: center;" id="cycle3">基准价</td>
								<td style="text-align: center;" id="cycle4">采购价</td>
								
							</tr>
							<tr>
								<td style="display: none;"><input type="text" name="id" align="top"
									id="model_DURATION0" style="color: blue;text-align: center;" /></td>
								<td><input type="text" name="ecssAport" align="top" oninput = "value=value.replace(/[^0-9.]/g,'')"
									id="model_DURATION1" style="color: blue;text-align: center;" /></td>
								<td><input type="text" name="product" align="top"
									id="model_DURATION2" style="color: blue;text-align: center;" /></td>
								<td><input type="text" name="retail" align="top" oninput = "value=value.replace(/[^0-9.]/g,'')"
									id="model_DURATION3" style="color: blue;text-align: center;" /></td>
								<td><input type="text" name="basePrice" align="top" oninput = "value=value.replace(/[^0-9.]/g,'')"
									id="model_DURATION4" style="color: blue;text-align: center;" /></td>
							    <td><input type="text" name="shopPrice" align="top" oninput = "value=value.replace(/[^0-9.]/g,'')"
									id="model_DURATION5" style="color: blue;text-align: center;" /></td>

							</tr>
							
							<input type="hidden" name="tend" align="top" id="tt" />

						</table>
					</form>
				</div>
				<div class="modal-footer" align="right">
					
					<button type="button" class="btn btn-primary" onclick="updateNew()">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>	
 	
 	
 	
<script type="text/javascript">
//**********************************数据导出功能的实现 ********************************************************************* 
  // 数据添加操作的实现
 $("#btn").click(function(){
	     document.getElementById("model_DURATION0").value="";
	     document.getElementById("model_DURATION1").value="";
         document.getElementById("model_DURATION2").value="";
		 document.getElementById("model_DURATION3").value="";
		 document.getElementById("model_DURATION4").value="";
		 document.getElementById("model_DURATION5").value="";
	 
	 
	 $('#myModal1').modal('show'); 
           
           });

/*页面一加载就执行的事件   */ 

$(function () {
        $("td").on("click",function() {
            if (this.offsetWidth < this.scrollWidth) {
                var that = this;
                var text = $(this).text();
               // $("alert").attr("contentEditable", "True");
                layer.alert(text);
            }
        });
    })


 
    
    
  //数据修改操作调用此方法  
function update(obj) {  
	  
	  var city=obj;
	   
	   $.ajax({  
	        type: "post",  
	        url: "../broken/updateD.do",  
	        data: "id="+city,  
	        dataType: 'json',  
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
	        success: function(result) {  
	       
	         if(result.md!=null){
	        $("#model_DURATION0").val(result.md.id);	 
            $("#model_DURATION1").val(result.md.ecssAport);
      		$("#model_DURATION2").val(result.md.product);
      		$("#model_DURATION3").val(result.md.retail);
      		$("#model_DURATION4").val(result.md.basePrice);
      		$("#model_DURATION5").val(result.md.shopPrice);

	         }else{
	        	 
	        	 document.getElementById("model_DURATION1").value="";
	             document.getElementById("model_DURATION2").value="";
	       		 document.getElementById("model_DURATION3").value="";
	       		 document.getElementById("model_DURATION4").value="";
	       		 document.getElementById("model_DURATION5").value="";
	            
	       		
	        	 
	         }
	        	
	        	} 
	    }); 
	  
	   $('#myModal1').modal('show'); 
}     

 
 
function selectDate() {
	//jqgridReload();
}
 







 
 
 

</script>




</body>
</html>