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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>价格容量设置</title>
</head>

<body>
	<style type="text/css">
.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
	height: 37px;
	margin-top: 5px;
}

.ui-jqgrid .ui-jqgrid-htable th {
	color: #607D8B;
}

.ui-jqgrid .ui-jqgrid-htable th {
	color: #607D8B;
}



/* .btn-lg, .btn-group-lg > .btn {
   /*  padding: 4px 6px;
    font-size: 18px;
    line-height: 1.3333333;
    border-radius: 6px; */
}
* /

.btn {
	display: inline-block;
	padding: 4px 6px;
}

.btn-lg, .btn-group-lg>.btn {
	padding: 10px 8px;
	font-size: 6px;
	line-height: 1;
	border-radius: 6px;
	float: right;
}
</style>
	<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script> -->
	<script
		src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>
	<script type="text/javascript"
		src="<%=basePath%>resources/js/customerChannel/customerChannel.js?"></script>
	<script type="text/javascript"
		src="<%=basePath%>resources/js/brandRangeSet/priceRangeSet.js?"></script>
	<script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>
	
		<div class="row" style="padding-top: 30px;">
             	<div class="col-xs-2">
		
			
					<label >时间范围:</label> <input name="month"
						id="month" type="text" style="width:60%;text-align:center;"
						readonly="readonly" class="form-text select prevMonth"
						onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M}',onpicked:selectDate})" />
			
				</div>
				<div class="col-xs-2" align="left">
					<span >— &nbsp;&nbsp;</span>
					<input name="month2" id="month2"  type="text" style="width:60%;text-align:center;"
						 readonly="readonly"
						class="form-text select prevMonth"
						onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M}',onpicked:pageInit,onpicked:selectDate})" />
				
				</div>
	
					<div class="col-xs-2" align="left">
					<span >数值类型:&nbsp;&nbsp;&nbsp;</span> 
					<select style="width:60%;text-align:center;" id="abSet" name="abSet" class="select" onclick="absoluteDate()">
						<option value="jdz">绝对值</option>
						<option value="bfb">百分比</option>
					</select>
			
		</div>
				<div class="col-xs-4" align="left">
						<label >关注价位段:&nbsp;&nbsp;</label>
						<!-- <div style="width: 58%; float:left;">	 -->
						
						
						
						
						<select id="usertype" name="usertype" onchange="select3()"
							class="selectpicker show-tick " multiple data-live-search="true">
							<option value="value1" selected="selected">0~399</option>
							<option value="value2" selected="selected">400~699</option>
							<option value="value3">700~999</option>
							<option value="value4">1000~1499</option>
							<option value="value5">1500~1999</option>
							<option value="value6">2000~2499</option>
							<option value="value7">2500~2999</option>
							<option value="value8">3000以上</option>



						</select>

						<!--获取值: $("#XXX").val(); form-control
                               	 动态加载操作：
                               	 	 var str='3,4,5,6';
   									 var arr=str.split(',');
    								$('#usertype').selectpicker('val', arr); 
    								 -->
						<!--  </div>	  -->
			
				<!-- 模态框（Modal） -->
		</div>
					
					
					<div class="col-xs-2">
					<button class="btn btn-primary btn-lg" data-toggle="modal" style="float: left"
						data-target="#myModal">赛诺数据导入</button>

					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel"></h4>
								</div>
								 
								 </div>
								
								<form id="uploadForm" enctype="multipart/form-data">
									<div class="modal-body">
										<input type="file" id="file" name="file"
											onchange="loadFile(this.files[0])" /> <label>选择时间:</label>
										<input name="month" type="text" style="width: 60%;text-align:center;"
											readonly="readonly" class="form-text select prevMonth"
											onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M-1}',onpicked:pageInit})" />
											<a style="color:white;" href="<%=basePath%>resources/tmpl/price.xlsx">模板下载</a>
									
								</form>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<!--  <button type="button" class="btn btn-primary">提交更改</button> -->
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>
					<div id="demo"></div>
				


			
			<!--     data-toggle="modal" data-target="#customizationModal"
	  		<button   id="customizationModalShow" class="select" style="width:150px;  background-color:#083d5c;border-width:1px; position: absolute;right: 17px;top: 0px;">关注特征定制</button> -->
			</div>
		
		
		<div class="row" style="padding-top: 70px;">
			<div class="col-xs-12">
			<table id="list"></table>
			</div>
			
			<div id=pager></div>
		
		</div>

	
	<script type="text/javascript">


function loadFile(file){
	   
	
	
	var formdata = new FormData($('form')[0]);
    
	
	$.ajax({
      url: '../uploadFilePrice/test.do',
      type: 'POST',
      datatype: 'json',
      data: formdata,
      cache:false,
      traditional: true,
      contentType: false,
      processData: false,
      success: function (data) {
    	  if (data.i ==1) {

				alert("导入成功！");
				location.reload(); 
			} if (data.i ==2){
				alert("本月数据已存在，导入失败。");
				location.reload(); 
			}if (data.i ==0){
				
			alert("导入失败，请检查数据是否正确。");	
			location.reload(); 
				
			}

    	  
      },
      
      error: function () {
    	  
      }
    });
 }
	


/* 实现查询所有品牌的功能 */	

 function selectDate2(){
	 var formData = new FormData();
	var month=document.getElementById('month').value;
	var month2=document.getElementById('month2').value;
	 formData.append("month",month);//这个地方可以传递多个参数
	 formData.append("month2",month2);//这个地方可以传递多个参数
	 $.ajax({
	      url: '../uploadFilePrice/selectPrice.do',
	      type: 'POST',
	      datatype: 'json',
	      data: formData,
	      cache:false,
	      traditional: true,
	      contentType: false,
	      processData: false,
	      success: function (data) {
	    	if(data=="b"){
	    		
	    		alert("查询成功！"); 	
	    	}else{
	    		
	    	alert("无数据！");
	    	}
	    	
	    	  
	      },
	      
	      error: function () {
	    	  
	      }
	    });
	
	
	
	
	} 


  function selectDate() {
		jqgridReload();
	} 


/* 表格数据  */
/* 百分比和绝对值的点击事件   */

function absoluteDate(){
	var formData = new FormData();
	var abSet= $('#abSet').val();
	
	var month = document.getElementById('month').value;
	var month2 = document.getElementById('month2').value;
	formData.append("month", month);//这个地方可以传递多个参数
	formData.append("month2", month2);//这个地方可以传递多个参数
	formData.append("abSet", abSet);
	var date;
	$.ajax({
		url : '../uploadFilePrice/selectPrice.do',
		type : 'POST',
		datatype : 'json',
		data : formData,
		cache : false,
		traditional : true,
		contentType : false,
		processData : false,
		success : function(data) {
	       if(abSet=="bfb"){
	    	  
/* 	    	  var sum_total=$("#list").getCol('total',false,'sum');
              var sum_value1=$("#list").getCol('value1',false,'sum');
              var sum_value2=$("#list").getCol('value2',false,'sum');
              var sum_value3=$("#list").getCol('value3',false,'sum');
              var sum_value4=$("#list").getCol('value4',false,'sum');
              var sum_value5=$("#list").getCol('value5',false,'sum');
              var sum_value6=$("#list").getCol('value6',false,'sum');
              var sum_value7=$("#list").getCol('value7',false,'sum');
              var sum_value8=$("#list").getCol('value8',false,'sum');
            
              
              var sum_total1=$("#list").getCol('total1',false,'sum'); 
              var sum_value12=$("#list").getCol('value12',false,'sum');
              var sum_value22=$("#list").getCol('value22',false,'sum');
              var sum_value32=$("#list").getCol('value32',false,'sum');
              var sum_value42=$("#list").getCol('value42',false,'sum');
              var sum_value52=$("#list").getCol('value52',false,'sum');
              var sum_value62=$("#list").getCol('value62',false,'sum');
              var sum_value72=$("#list").getCol('value72',false,'sum');
              var sum_value82=$("#list").getCol('value82',false,'sum');
    		  
              //getBfb(sum_value1,sum_total); */
              			var sum_total=0;
		                var sum_value1=0;
		                var sum_value2=0;
		                var sum_value3=0;
		                var sum_value4=0;
		                var sum_value5=0;
		                var sum_value6=0;
		                var sum_value7=0;
		                var sum_value8=0;
		              		                
		                var sum_total1=0; 
		                var sum_value12=0;
		                var sum_value22=0;
		                var sum_value32=0;
		                var sum_value42=0;
		                var sum_value52=0;
		                var sum_value62=0;
		                var sum_value72=0;
		                var sum_value82=0;
                    var rowDatas =data;
					for(var i=0;i< rowDatas.length;i++){
					    var rowData = rowDatas[i];					 
					    sum_total = Math.add(sum_total,parseFloat(rowDatas[i].total)==null?0:rowDatas[i].total);
					    sum_value1 = Math.add(sum_value1,parseFloat(rowDatas[i].value1)==null?0:rowDatas[i].value1);
					    sum_value2 = Math.add(sum_value2,parseFloat(rowDatas[i].value2)==null?0:rowDatas[i].value2);
					    sum_value3 = Math.add(sum_value3,parseFloat(rowDatas[i].value3)==null?0:rowDatas[i].value3);
					    sum_value4 = Math.add(sum_value4,parseFloat(rowDatas[i].value4)==null?0:rowDatas[i].value4);
					    sum_value5 = Math.add(sum_value5,parseFloat(rowDatas[i].value5)==null?0:rowDatas[i].value5);
					    sum_value6 = Math.add(sum_value6,parseFloat(rowDatas[i].value6)==null?0:rowDatas[i].value6);
					    sum_value7 = Math.add(sum_value7,parseFloat(rowDatas[i].value7)==null?0:rowDatas[i].value7);
					    sum_value8 = Math.add(sum_value8,parseFloat(rowDatas[i].value8)==null?0:rowDatas[i].value8);
					    sum_total1 = Math.add(sum_total1,parseFloat(rowDatas[i].total1)==null?0:rowDatas[i].total1);
					    sum_value12 = Math.add(sum_value12,parseFloat(rowDatas[i].value12)==null?0:rowDatas[i].value12);
					    sum_value22 = Math.add(sum_value22,parseFloat(rowDatas[i].value22)==null?0:rowDatas[i].value22);
					    sum_value32 = Math.add(sum_value32,parseFloat(rowDatas[i].value32)==null?0:rowDatas[i].value32);
					    sum_value42 = Math.add(sum_value42,parseFloat(rowDatas[i].value42)==null?0:rowDatas[i].value42);
					    sum_value52 = Math.add(sum_value52,parseFloat(rowDatas[i].value52)==null?0:rowDatas[i].value52);
					    sum_value62 = Math.add(sum_value62,parseFloat(rowDatas[i].value62)==null?0:rowDatas[i].value62);
					    sum_value72 = Math.add(sum_value72,parseFloat(rowDatas[i].value72)==null?0:rowDatas[i].value72);
					    sum_value82 = Math.add(sum_value82,parseFloat(rowDatas[i].value82)==null?0:rowDatas[i].value82);
					}
              
              
              
              $("#list").footerData('set', {total:sum_total, value1: getBfb(sum_value1,sum_total),value2: getBfb(sum_value2,sum_total),
                	value3: getBfb(sum_value3,sum_total),value4: getBfb(sum_value4,sum_total),value5: getBfb(sum_value5,sum_total),value6:getBfb(sum_value6,sum_total),value7: getBfb(sum_value7,sum_total),value8: getBfb(sum_value8,sum_total),
                	total1:sum_total1,value12: getBfb(sum_value12,sum_total),value22: getBfb(sum_value22,sum_total), value32: getBfb(sum_value32,sum_total),value42: getBfb(sum_value42,sum_total),
                	value52: getBfb(sum_value52,sum_total),value62: getBfb(sum_value62,sum_total),value72: getBfb(sum_value72,sum_total),value82:getBfb(sum_value82,sum_total)
                	
                });
              
	    	   $.each(data,function(index,item){   	

					var total = item.total;
		        	item.value1 = getBfb(item.value1,total);
		        	item.value2 = getBfb(item.value2,total);
		        	item.value3 = getBfb(item.value3,total);
		        	item.value4 = getBfb(item.value4,total);
		        	item.value5 = getBfb(item.value5,total);
		        	item.value6 = getBfb(item.value6,total);
		        	item.value7 = getBfb(item.value7,total);
		        	item.value8 = getBfb(item.value8,total);	        	
		        	var total1 = item.total1;
		        	item.value12 = getBfb(item.value12,total1);
		        	item.value22 = getBfb(item.value22,total1);
		        	item.value32 = getBfb(item.value32,total1);
		        	item.value42 = getBfb(item.value42,total1);
		        	item.value52 = getBfb(item.value52,total1);
		        	item.value62 = getBfb(item.value62,total1);
		        	item.value72 = getBfb(item.value72,total1);
		        	item.value82 = getBfb(item.value82,total1);
		        	
		        }); 
	    	  
			$("#list").jqGrid('clearGridData');
			$("#list").jqGrid('setGridParam', {
				data : data,
				datatype : 'local',
				page : 1
			}).trigger("reloadGrid");  
			
		}else  if(abSet=="jdz"){
			
			$("#list").jqGrid('clearGridData');
			$("#list").jqGrid('setGridParam', {
				data : data,
				datatype : 'json',
				page : 1
			}).trigger("reloadGrid");
			
			
		}

		
		}
		
		});

}

function getBfb(dou,total){
	if(total==0){
	dou=0+"%";	
	}else if(total!=0){
		dou = parseInt(dou/total*100)+"%";	
	}
	
	return dou;
}




</script>










</body>
</html>