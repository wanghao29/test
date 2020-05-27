<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>dialog</title>
	<style>
		.dialogContent div{
			color: #000000;
		}
		.modal-body {
			background-color: #ffffff;
		}
		.modal-footer{
			background-color:#1d7db1;
		}
		.modal-header{
			background-color: #337ab7;
			color:#fff;
		}
	</style>
	
	<script type="text/javascript">
	  var select2_data;
		$(function(){
			//账期关联重点产品下拉框的选项值
			selectMonth();
			
			
			 $.ajax({                               
				 url : basePath + "/assetsTurnoverRate/threeMonthStockRatio/querySelect2.do",
				 async : false,
				 type : "get",
				 data : {},
				 success : function(data, status) {
					 select2_data = data;
					             
					 }             
				 });     
			//多选下拉框初始化
			queryBrand();
			//queryModel(getSelectData("brand_desc"));
			//queryConfigureDesc(getSelectData("brand_desc"),getSelectData("model_desc"))
		});


		function select2Product(){
			//初始化多选框
			$("#product").select2({
				placeholder : '输入关键字',
				tags : true,
				multiple : true,
				height : '40px',
				width : '70%',
//				maximumSelectionLength : 3,
				allowClear : true,
				language : "zh-CN",
				data : null, //itemList itemList是[{}{}{}{}]格式的数组
			});
		}
		
		//账期关联重点产品下拉框选项
		function selectMonth(){
			$("input[name='btnMonth']").on("click",function(){
					//获取对应账期下的所以重点产品名称
					var month=$("input[name='month']").val();
					$.ajax({
					    type: "post",
					    url: basePath + "/terminalSales/productSalesRate/dialog/getProductList.do",
					    contentType: "application/json; charset=utf-8",
					    data: JSON.stringify({"month":month}),
					    dataType: 'JSON',
					    success: function (data, status) {
//					        initEchart(data.currentMonthWcqkzb,data.lastMonthWcqkzb,data.lastYearWcqkzb);
					        changeOption(data);
					    },
					    error: function () {
							alert("error");
					    }
					});
				});
		}
		
		function changeOption(zdcpList){
			//清空option
			$("#product").empty();
			//新增option
			var obj=$("#product");
			for (var i = 0; i < zdcpList.length; i++) {
				var option="<option>"+zdcpList[i]+"</option>";
				obj.append(option);
			}
		}
		function queryBrand(){
			$("#brand_desc").empty();
			$("#brand_desc").select2({
				  data: select2_data
			});
			$("#brand_desc").off("select2:select");
			$("#brand_desc").on("change",function(e){ 				
			//clickBrand();
		 
				queryModel(getSelectData("brand_desc"));
				queryConfigureDesc(getSelectData("brand_desc"),getSelectData("model_desc"))
			});
			
		}
		function queryModel(brand_id){
			 $.ajax({                               
				 url : basePath + "/assetsTurnoverRate/threeMonthStockRatio/queryModel.do",
				 async : false,
				 type : "post",
				 data : {brand_id:brand_id},
				 success : function(data, status) {
					 
					    $("#model_desc").empty();
						$("#model_desc").select2({
							  data: data
						});
						$("#model_desc").off("select2:select");
						$("#model_desc").on("change",function(e){ 				
						//clickBrand();
							queryConfigureDesc(getSelectData("brand_desc"),getSelectData("model_desc"))
						});     
					 }             
				 });   
		}

		function queryConfigureDesc(brand_id,mobile_type){
			 $.ajax({                               
				 url : basePath + "/assetsTurnoverRate/threeMonthStockRatio/queryConfigureDesc.do",
				 async : false,
				 type : "post",
				 data : {brand_id:brand_id,mobile_type:mobile_type},
				 success : function(data, status) {
					 
					    $("#configure_desc").empty();
						$("#configure_desc").select2({
							  data: data
						});
						$("#configure_desc").off("select2:select");
						$("#configure_desc").on("select2:select",function(e){ 				
						//clickBrand();
						});     
					 }             
				 });  
			
		}
		
		
		
	</script>
</head>
<body>

<div class="dialogContent">
	<form class="form-horizontal" id="form_dialog" method="post" >
		<!-- <div>
			&nbsp;&nbsp;&nbsp;&nbsp;
			账    期：<input name="month" type="text" style="width:130px;color:black;" onClick="WdatePicker({dateFmt:'yyyyMM'})" readonly="readonly" class="form-text select"/>
			<input type="button" name="btnMonth" value="查询" />
		</div> -->
	<!-- 	<br/> -->
	  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">月份：</label>
		    <div class="col-sm-3">
		      <input name="month"  id="month" type="text" style="width:130px;color:#333;"  onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-%M'})"  readonly="readonly"class="form-text select"/>
		    </div>
		     <label for="inputPassword3" class="col-sm-2 control-label">品牌：</label>
		    <div class="col-sm-3">
		          <select name="brand_desc" id="brand_desc" multiple="multiple" style="float:left;width: 100%;" class="">
		          </select>
		    </div>
	   </div>
	   <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">机型：</label>
			    <div class="col-sm-3">
			         <select name="model_desc" id="model_desc"  multiple="multiple" style="float:left;width: 100%;" class="">
			          </select>
			    </div>
			     <label for="inputPassword3" class="col-sm-2 control-label">重点产品：</label>
			    <div class="col-sm-3">
			          <select name="configure_desc" id="configure_desc" multiple="multiple" style="float:left;width: 100%;" class="">
			          </select>
			    </div>
		</div>
<!-- 	  <div class="form-group">
	  		&nbsp;&nbsp;&nbsp;&nbsp;
	  		重点产品：<select name="product" id="product"   style="float:left;width: 100%;" >
			      	</select>
	  </div> -->
	  	  <div class="form-group">
 
	  		  <label for="inputEmail3" class="col-sm-2 control-label">目  标  值：</label>
	  		   <div class="col-sm-3">
	  		    <input type="text"  name="mbz" />
	  		  </div>
	  </div>
	</form>
</div>
</body>

</html>
