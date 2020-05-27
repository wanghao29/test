<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.btn-lg, .btn-group-lg>.btn {
	padding: 10px 16px;
	font-size: 6px;
	line-height: 2;
	border-radius: 6px;
	float: right;
}

.btn {
	display: inline-block;
	padding: 4px 6px;
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
</style>
	<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
	<script
		src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/i18n/defaults-*.min.js"></script -->
	<script type="text/javascript"
		src="<%=basePath%>resources/js/customerChannel/customerChannel.js?"></script>
	<script type="text/javascript"
		src="<%=basePath%>resources/js/brandRangeSet/brandRangeSet.js?"></script>
	<script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>


	<div
		style="margin-left: 10px; margin-right: 10px; margin-bottom: 20px;">
		<div class="row" style="padding: 40px;">

			<div class="row top-select">



				<div class="col-xs-2">
					<label style="float: left;">时间范围:</label> <input name="month1"
						id="month"  type="text" style="width:60%"
						readonly="readonly" class="form-text select prevMonth"
						onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M}',onpicked:selectDate})" />
				</div>
				<!-- <div class="col-xs-2">
 	 				 		<label style="float:left;">时间范围:</label>
	 	 				   	<select name="cityNam" class="select" style="width: 60%; float:left;" id="citySelect">
				       		</select>    		 
 	 				</div> -->
				<div class="col-xs-2">
					<label style="float: left;">—&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<input name="month2" id="month2"  type="text"
						style="width:60%" readonly="readonly"
						class="form-text select prevMonth"
						onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M}',onpicked:pageInit,onpicked:selectDate})" />
				</div>

				<div class="col-xs-2" align="left">
					<label style="float: left;">数值类型:&nbsp;&nbsp;</label> 
					
					
					<select id="abSet"
						name="abSet" class="select" style="width: 60%; float: left;" onclick="absoluteDate()">
						<option value="jdz">绝对值</option>
						<option value="bfb">百分比</option>
					</select>
				</div>
				<div class="col-xs-2">
					<div style="position: absolute;" class="absolute-div">
						<label style="float: left;">数值类型:&nbsp;&nbsp;</label>
						<div style="width: 58%; float: left;">
							<select id="usertype" name="usertype"
								class="selectpicker show-tick " multiple data-live-search="true"
								onchange="select3()">
								<option value="oppo" selected="selected">OPPO</option>
								<option value="vivo" selected="selected">VIVO</option>
								<option value="apple" selected="selected">苹果</option>
								<option value="huawei" selected="selected">华为</option>
								<option value="rongyao">荣耀</option>
								<option value="cmcc">中国移动</option>
								<option value="mi">小米</option>
								<option value="meizu">魅族</option>
								<option value="sumsing">三星</option>
								<option value="other">其他</option>
							</select>

							<!--获取值: $("#XXX").val(); form-control
                               	 动态加载操作：
                               	 	 var str='3,4,5,6';
   									 var arr=str.split(',');
    								$('#usertype').selectpicker('val', arr); 
    								 -->
						</div>
					</div>
				</div>
				<!-- 模态框（Modal） -->
				<div class="col-xs-2" align="right" style="margin-left: 200px;">
					<button class="btn btn-primary btn-lg" data-toggle="modal" style="float: right; margin-right: 10px;"
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
								<!-- onchange="importf(this)" -->

								<form id="uploadForm" enctype="multipart/form-data">
									<div class="modal-body">
										<input type="file" id="file" name="file"
											onchange="loadFile(this.files[0])" /> <label>选择时间:</label> <input
											name="month" id="times" type="text" style="width: 60%"
											readonly="readonly" class="form-text select prevMonth"
											onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M-1}',onpicked:pageInit})" />
									</div>
								</form>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<!-- <button type="button" id="button-submit" class="btn btn-primary" >提交更改</button> -->
								</div>

							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>
					<div id="demo"></div>
				</div>


			</div>
			<!-- data-toggle="modal" data-target="#customizationModal" -->
			<!-- <button   id="customizationModalShow" class="select" style="width:150px;  background-color:#083d5c;border-width:1px; position: absolute;right: 17px;top: 0px;">关注特征定制</button> -->
		</div>
		<div class="row" style="padding-left: 30px; padding-right: 30px;">
			<table id="list"></table>
			<div id=pager></div>
		</div>

		<script type="text/javascript">
			function loadFile(file) {

				var formdata = new FormData($('form')[0]);

				$.ajax({
					url : '../uploadFile/test.do',
					type : 'POST',
					datatype : 'json',
					data : formdata,
					cache : false,
					traditional : true,
					contentType : false,
					processData : false,
					success : function(data) {
						if (data.i ==1) {

							alert("导入成功！");
						}else{
							
						alert("导入失败，请检查数据是否正确。");	
							
						}

					},

					error : function() {

					}
				});
			}

			/* 实现查询所有品牌的功能 */


			function selectDate() {
				jqgridReload();
			}

			function getparam() {
				var data = {};
				data["month"] = $("#month").val();
				data["month2"] = $("#month2").val();
				return data;
			};

			function jqgridReload() {
				$("#list").jqGrid('clearGridData');
				$("#list").jqGrid('setGridParam', {
					postData : getparam(),
					datatype : 'json',
					page : 1
				}).trigger("reloadGrid");
			};

			/* 初始化表格 */
			var jqgrid_length;
			function jqgridInit() {
				jQuery("#list")
						.jqGrid(
								{
									url : "${basePath}uploadFile/selectList.do",
									mtype : 'post',
									datatype : "json",
									loadonce : true, //一次性加载
									gridview : true, //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
									postData : getparam(),
									sortorder : "desc",
									colNames : [ '', '整体容量', 'OPPO', 'VIVO',
											'苹果', '华为', '荣耀', '中国移动', '小米',
											'魅族', '三星', '其他', '整体容量', 'OPPO',
											'VIVO', '苹果', '华为', '荣耀', '中国移动',
											'小米', '魅族', '三星', '其他','广东移动换机预测数据', 
											'塞诺数据',
											 'OPPO',
											'VIVO', '苹果', '华为', '荣耀', '中国移动',
											'小米', '魅族', '三星', '其他'],
									colModel : [
									
										{
										
										name : 'city',
										index : 'city',
										sorttype : "string",
										align:"center",
										cellattr: addCellAttre
									},
									{
										name : 'total',
										index : 'total',
										sorttype : "int",
										align:"center"
									}, {
										name : 'oppo',
										index : 'oppo',
										sorttype : "date",
										align:"center"
									}, {
										name : 'vivo',
										index : 'vivo',
										align:"center"
									}, {
										name : 'apple',
										index : 'apple',
										sorttype : "float",
										align:"center"
									}, {
										name : 'huawei',
										index : 'huawei',
										sorttype : "float",
										align:"center"
									
									}, {
										name : 'rongyao',
										index : 'rongyao',
										sorttype : "float",
										hidden : true,
										align:"center"
									}, {
										name : 'cmcc',
										index : 'cmcc',
										sorttype : "float",
										hidden : true,
										align:"center"
									}, {
										name : 'mi',
										index : 'mi',
										sortable : false,
										hidden : true,
										align:"center"
									}, {
										name : 'meizu',
										index : 'meizu',
										sorttype : "int",
										hidden : true,
										align:"center"
									}, {
										name : 'sumsing',
										index : 'sumsing',
										sorttype : "float",
										hidden : true,
										align:"center"
									}, {
										name : 'other',
										index : 'other',
										sorttype : "date",
										hidden : true,
										align:"center"
									},
									{
										name : 'total1',
										index : 'total1',
										sorttype : "int",
										align:"center"
									}, {
										name : 'oppo1',
										index : 'oppo1',
										sorttype : "date",
										align:"center"
									}, {
										name : 'vivo1',
										index : 'vivo1',
										align:"center"
									}, {
										name : 'apple1',
										index : 'apple1',
										sorttype : "float",
										align:"center"
									}, {
										name : 'huawei1',
										index : 'huawei1',
										sorttype : "float",
										align:"center"
									}, {
										name : 'rongyao1',
										index : 'rongyao1',
										sorttype : "float",
										hidden : true,
										align:"center"
									}, {
										name : 'cmcc1',
										index : 'cmcc1',
										sorttype : "float",
										hidden : true,
										align:"center"
									}, {
										name : 'mi1',
										index : 'mi1',
										sortable : false,
										hidden : true,
										align:"center"
									}, {
										name : 'meizu1',
										index : 'meizu1',
										sorttype : "int",
										hidden : true,
										align:"center"
									}, {
										name : 'sumsing1',
										index : 'sumsing1',
										sorttype : "float",
										hidden : true,
										align:"center"
									}, {
										name : 'other1',
										index : 'other1',
										sorttype : "date",
										hidden : true,
										align:"center"
									},	
									
								 {
										name : 'guangdong',
										index : 'guangdong',
										sorttype : "date",
										editable : true,
										edittype : 'number',
										cellattr: addCellAttr,
										width:100,
										align:"center"
									
									},	{
										name : 'nuosai',
										index : 'nuosai',
										width:110,
										editable: false,
										edittype:"number",
										cellattr: addCellAttr,
										cellEdit:true,
										width:100,
										align:"center"
									},

									/* {
										name : 'total2',
										index : 'total',
										sorttype : "int"
									}, */ {
										name : 'oppo2',
										index : 'oppo',
										sorttype : "date",
										align:"center"
									}, {
										name : 'vivo2',
										index : 'vivo',
										align:"center"
									}, {
										name : 'apple2',
										index : 'apple',
										sorttype : "float",
										align:"center"
									}, {
										name : 'huawei2',
										index : 'huawei',
										sorttype : "float",
										align:"center"
									}, {
										name : 'rongyao2',
										index : 'rongyao',
										sorttype : "float",
										hidden : true,
										align:"center"
									}, {
										name : 'cmcc2',
										index : 'cmcc',
										sorttype : "float",
										hidden : true,
										align:"center"
									}, {
										name : 'mi2',
										index : 'mi',
										sortable : false,
										hidden : true,
										align:"center"
									}, {
										name : 'meizu2',
										index : 'meizu',
										sorttype : "int",
										hidden : true,
										align:"center"
									}, {
										name : 'sumsing2',
										index : 'sumsing',
										sorttype : "float",
										hidden : true,
										align:"center"
									}, {
										name : 'other2',
										index : 'other',
										sorttype : "int",
										hidden : true,
										align:"center"
									},
									],
						            gridComplete:function(){//表格加载执行 						            	 						            	 
						            	 if(typeof(eval(setGroupHeaders))=="function"){
						            		 setGroupHeaders();
						            		
						            		
						            	 }
						            },
						            
						            //对合计行颜色进行改变
						             loadComplete: function () {             
						        		//debugger;
						        		//在表格加载完成后执行
										var ids = $("#list").jqGrid("getDataIDs");//获取所有行的id
										var rowDatas = $("#list").jqGrid("getRowData");//获取所有行的数据
										var abSet= $('#abSet').val();
										if(abSet=="jdz"){
									    completeMethod();
										var total = 0;
						                var sum_oppo=0;
						                var sum_vivo=0;
						                var sum_apple=0;
						                var sum_huawei=0;
						                var sum_rongyao=0;
						                var sum_mi=0;
						                var sum_meizu=0;
						                var sum_sumsing=0;
						                var sum_other=0;
						                var sum_total1=0;
						                var sum_oppo1=0;
						                var sum_vivo1=0;
						                var sum_apple1=0;
						                var sum_huawei1=0;
						                var sum_rongyao1=0;
						                var sum_mi1=0;
						                var sum_meizu1=0;
						                var sum_sumsing1=0;
						                var sum_other1=0;
						                var sum_cmcc=0;
						                var sum_cmcc1=0;
						                
										for(var i=0;i< rowDatas.length;i++){
										    var rowData = rowDatas[i];					 
										    total = Math.add(total,parseFloat(rowDatas[i].total)==null?0:rowDatas[i].total);
										    sum_oppo = Math.add(sum_oppo,parseFloat(rowDatas[i].oppo)==null?0:rowDatas[i].oppo);
										    sum_vivo = Math.add(sum_vivo,parseFloat(rowDatas[i].vivo)==null?0:rowDatas[i].vivo);
										    sum_apple = Math.add(sum_apple,parseFloat(rowDatas[i].apple)==null?0:rowDatas[i].apple);
										    sum_huawei = Math.add(sum_huawei,parseFloat(rowDatas[i].huawei)==null?0:rowDatas[i].huawei);
										    sum_rongyao = Math.add(sum_rongyao,parseFloat(rowDatas[i].rongyao)==null?0:rowDatas[i].rongyao);
										    sum_cmcc = Math.add(sum_cmcc,parseFloat(rowDatas[i].cmcc)==null?0:rowDatas[i].cmcc);
										    sum_mi = Math.add(sum_mi,parseFloat(rowDatas[i].mi)==null?0:rowDatas[i].mi);
										    sum_meizu = Math.add(sum_meizu,parseFloat(rowDatas[i].meizu)==null?0:rowDatas[i].meizu);
										    sum_sumsing = Math.add(sum_sumsing,parseFloat(rowDatas[i].sumsing)==null?0:rowDatas[i].sumsing);
										    sum_other = Math.add(sum_other,parseFloat(rowDatas[i].other)==null?0:rowDatas[i].other);
										    sum_total1 = Math.add(sum_total1,parseFloat(rowDatas[i].total1)==null?0:rowDatas[i].total1);
										    sum_oppo1 = Math.add(sum_oppo1,parseFloat(rowDatas[i].oppo1)==null?0:rowDatas[i].oppo1);
										    sum_vivo1 = Math.add(sum_vivo1,parseFloat(rowDatas[i].vivo1)==null?0:rowDatas[i].vivo1);
										    sum_apple1 = Math.add(sum_apple1,parseFloat(rowDatas[i].apple1)==null?0:rowDatas[i].apple1);
										    sum_huawei1 = Math.add(sum_huawei1,parseFloat(rowDatas[i].huawei1)==null?0:rowDatas[i].huawei1);
										    sum_rongyao1 = Math.add(sum_rongyao1,parseFloat(rowDatas[i].rongyao1)==null?0:rowDatas[i].rongyao1);
										    sum_cmcc1 = Math.add(sum_cmcc1,parseFloat(rowDatas[i].cmcc1)==null?0:rowDatas[i].cmcc1);
										    sum_mi1 = Math.add(sum_mi1,parseFloat(rowDatas[i].mi1)==null?0:rowDatas[i].mi1);
										    sum_meizu1 = Math.add(sum_meizu1,parseFloat(rowDatas[i].meizu1)==null?0:rowDatas[i].meizu1);
										    sum_sumsing1 = Math.add(sum_sumsing1,parseFloat(rowDatas[i].sumsing1)==null?0:rowDatas[i].sumsing1);
										    sum_other1 = Math.add(sum_other1,parseFloat(rowDatas[i].other1)==null?0:rowDatas[i].other1);
										    
										    
										    if(rowData.city != ''){   //如果某一行中的“tax”为0，那就把这一整行的背景颜色设为红色
									            $("#"+ids[i]+ " td").css("color","#5bfdff");
									        }

										}
										 $("#list").footerData("set",{"total":total, "oppo": sum_oppo,"vivo": sum_vivo,
					                        	"apple": sum_apple,"huawei": sum_huawei,"rongyao": sum_rongyao,"cmcc": sum_cmcc,"mi": sum_mi,"meizu": sum_meizu,
					                        	"sumsing": sum_sumsing,"other": sum_other,"total1": sum_total1, "oppo1": sum_oppo1,"vivo1": sum_vivo1,
					                        	"apple1": sum_apple1,"huawei1": sum_huawei1,"rongyao1": sum_rongyao1,"cmcc1": sum_cmcc1,"mi1": sum_mi1,"meizu1": sum_meizu1,
					                        	"sumsing1": sum_sumsing1,"other1": sum_other1}); 
										
										 }else{
											 if(rowDatas.city == ''){   //如果某一行中的“tax”为0，那就把这一整行的背景颜色设为红色
												 $("#list").jqGrid('clearFooterData');
										        }	 
											 
										
											 
										 }
						             } , 

		
						            
						            
						            
						            footerrow:true,//对统计进行设置
					        		//gridComplete: completeMethod,//设置统计的方法

									rowNum : 5,
									rowList : [ 5, 10, 30, 50 ],
									rownumbers : false, //行首添加顺序编码
									rownumWidth : 60, //行首添加顺序编码的列宽
									autowidth : true, //表格宽度 刚加载时自动适应父div   ,然后随列调整宽度
									height : "100%", //表格宽度自动适应行数
									sortorder : "asc", //指定列排序的次序
									viewrecords : true, //显示当前记录，和总记录数 
									sortname : 'cityCd', //默认排序
									repeatitems : true, //是否可重复
									shrinkToFit : true, //可伸缩, true时使列宽可调整   false时设置的水平滚动才有效/也可能留出空白右侧
									forceFit : true,
									autoScroll : true,
									jsonReader : { //描述json 数据格式的数组,需修改
										root : 'list',
										page : 'current', // json中代表当前页码的数据
										total : "pages", // json中代表页码总数的数据
										records : "total", // json中代表数据行总数的数据
										repeatitems : true, // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
										cell : "cell",
										id : "fRoleId",
										userdata : "userdata",
									},
									pager : '#pager', //指定分页组件所在div id 
									pagination : true,
									caption : "",
									 cellEdit : true,
									 cellsubmit : 'rclientArray',
									 //加权参考值权重的设置和显示
									 afterEditCell : function(rowid, cellname, value, iRow, iCol){
								        	//lastValue = value
								        	if(iCol ==24){
								        		 jQuery('#list').setCell(rowid, 'nuosai', value);
								        	}
								        	
								         value=$('#'+iRow+'_nuosai').val(),									
								          console.log(value);									         
								         var j =  Number(value);
								      	if(j>=100){
							        		
								        	alert("参数值不能大于等于100！");	
								        	
								        	}
					                    if(j<0){
								        		
								        	alert("参数值不能小于等于0！");	
								        	
								        	}
								         
								         //alert(j);
								        	/*  if(j>0&&j<100){
											       var tt= 100-j;
											     										       
											       jQuery('#list').setCell(rowid, 'guangdong', tt);
											       getSetDate(rowid,j,tt);
											  
											  
								        	 } */
									 
								        	 $('#'+iRow+'_guangdong').change(function (){ 
									        		var value=$('#'+iRow+'_guangdong').val(),
									        		j =  Number(value);
											        	//alert(j);
											        	 if(j>0&&j<100){
														       var tt= 100-j;
														     										       
														       jQuery('#list').setCell(rowid, 'nuosai', tt);
														       getSetDate(rowid,j,tt);
														       
											        	 }
											        		if(j>=100){
												        		
													        	alert("参数值不能大于等于100！");	
													        	 return;
													        	}
										                    if(j<=0){
													        		
													        	alert("参数值不能小于等于0！");	
													        	 return;
													        	}
											        	 jQuery('#list').setCell(rowid, 'guangdong', j);
											        	 //$('#list').jqGrid("saveCell", iRow, iCol); 
									 }); 
								        	 
									 },
								        	
									 afterSaveCell: function(rowid, cellname, value, iRow, iCol){
										
									 },
									 //点击的时候才会触发事件
									 onCellSelect:function(rowid,iCol,cellcontent,e ){
										//alert(cellcontent); 
										//alert(e);
										 
									 },
									 
									 /*
									 onEditableSave: function(rowid, cellname, value, iRow, iCol){ //行id,单元格名称,单元格值 ,行的index,列的index 
//									  		alert('行id:'+rowid+",单元格名称:"+cellname+",单元格值:"+value+",行的index:"+iRow+",列的index:"+iCol);		  	    
										 var lastcell="";
										 var lastrow="";
										 lastrow = iRow; 
										 lastcell = iCol;
										 value=$("input[name='nuosai']").val(),
									
									 console.log(value);
									 	}, */
									
								

            	/* jqgrid_length = $("#list").getGridParam("width");
                console.log(jqgrid_length); */


			   }); 
			   jqgrid_length = $("#list").getGridParam("width");
								
								};

			function selectDate2() {
				var formData = new FormData();
				var month = document.getElementById('month').value;
				var month2 = document.getElementById('month2').value;
				formData.append("month", month);//这个地方可以传递多个参数
				formData.append("month2", month2);//这个地方可以传递多个参数
				$.ajax({
					url : '../uploadFile/selectList.do',
					type : 'POST',
					datatype : 'json',
					data : formData,
					cache : false,
					traditional : true,
					contentType : false,
					processData : false,
					success : function(data) {
						if (data == "b") {

							alert("查询成功！");
						} else {

							alert("无数据！");
						}

					},

					error : function() {

					}
				});

			}
			
	function setGroupHeaders(){
		jQuery("#list").jqGrid('destroyGroupHeader');
		//合并最顶表头
		jQuery("#list").jqGrid('setGroupHeaders', {
			useColSpanStyle : true,
			groupHeaders : [ {
				startColumnName : 'total',
				numberOfColumns : 11,
				titleText :'基于广东移动换机预测数据'
			},

			{
				startColumnName : 'total1',
				numberOfColumns : 11,
				titleText : '基于塞诺数据' 
			}, {
				startColumnName : 'oppo2',
				numberOfColumns : 11,
				titleText : '加权参考值'
			} ]
		});
		//合并二级表格
		jQuery("#list").jqGrid('setGroupHeaders', {
			useColSpanStyle : true,
			groupHeaders : [ {
				startColumnName : 'oppo',
				numberOfColumns : 10,
				titleText : '品牌容量'
			}, {
				startColumnName : 'oppo1',
				numberOfColumns : 10,
				titleText : '品牌容量'
			}, {
				startColumnName : 'oppo2',
				numberOfColumns : 10,
				titleText : '品牌容量'
			} ]
		});
	
		
	}
    
	
	
	
	
	
	
	
	
	var oldSelect;		
	function select3(){
		var select = $('select');
		var options = select.find('option');
		var newSelect = $("#usertype").val();
		
		var olength = oldSelect==null?0:oldSelect.length;
		var nlength = newSelect==null?0:newSelect.length;
		if(olength>nlength){
			for(var i=0; i<oldSelect.length;i++){
				if(newSelect==null || newSelect.indexOf(oldSelect[i])==-1){
					var sel = oldSelect[i];
					jQuery("#list").setGridParam().hideCol([sel,sel+"1",sel+"2"]).trigger("reloadGrid");

				}
			}
		}else{
			for(var i=0; i<newSelect.length;i++){
				if(oldSelect==null || oldSelect.indexOf(newSelect[i])==-1){
					var sel = newSelect[i];
					jQuery("#list").setGridParam().showCol([sel,sel+"1",sel+"2"]).trigger("reloadGrid");
				}
			}
		}
		oldSelect = newSelect;
		//$('#usertype').selectpicker('val', [1,2]); 
		$("#list").setGridWidth(jqgrid_length,true);
		setGroupHeaders();
	};
	
	$(document).ready(function() {
		jqgridInit();
		oldSelect =  $("#usertype").val();
		
	});

/* 百分比和绝对值的点击事件   */

function absoluteDate(){
	var formData = new FormData();
	var abSet= $('#abSet').val();	
	var month = document.getElementById('month').value;
	var month2 = document.getElementById('month2').value;
	formData.append("month", month);//这个地方可以传递多个参数
	formData.append("month2", month2);//这个地方可以传递多个参数
	formData.append("abSet", abSet);
	
	$.ajax({
		url : '../uploadFile/selectList.do',
		type : 'POST',
		datatype : 'json',
		data : formData,
		cache : false,
		traditional : true,
		contentType : false,
		processData : false,
		success : function(data) {
	      if(abSet=="bfb"){
	    		var sum_total = 0;
                var sum_oppo=0;
                var sum_vivo=0;
                var sum_apple=0;
                var sum_huawei=0;
                var sum_rongyao=0;
                var sum_mi=0;
                var sum_meizu=0;
                var sum_sumsing=0;
                var sum_other=0;
                var sum_total1=0;
                var sum_oppo1=0;
                var sum_vivo1=0;
                var sum_apple1=0;
                var sum_huawei1=0;
                var sum_rongyao1=0;
                var sum_mi1=0;
                var sum_meizu1=0;
                var sum_sumsing1=0;
                var sum_other1=0;
                var sum_cmcc=0;
                var sum_cmcc1=0;
                var rowDatas =data;
				for(var i=0;i< rowDatas.length;i++){
				    var rowData = rowDatas[i];					 
				    sum_total = Math.add(sum_total,parseFloat(rowDatas[i].total)==null?0:rowDatas[i].total);
				    sum_oppo = Math.add(sum_oppo,parseFloat(rowDatas[i].oppo)==null?0:rowDatas[i].oppo);
				    sum_vivo = Math.add(sum_vivo,parseFloat(rowDatas[i].vivo)==null?0:rowDatas[i].vivo);
				    sum_apple = Math.add(sum_apple,parseFloat(rowDatas[i].apple)==null?0:rowDatas[i].apple);
				    sum_huawei = Math.add(sum_huawei,parseFloat(rowDatas[i].huawei)==null?0:rowDatas[i].huawei);
				    sum_rongyao = Math.add(sum_rongyao,parseFloat(rowDatas[i].rongyao)==null?0:rowDatas[i].rongyao);
				    sum_cmcc = Math.add(sum_cmcc,parseFloat(rowDatas[i].cmcc)==null?0:rowDatas[i].cmcc);
				    sum_mi = Math.add(sum_mi,parseFloat(rowDatas[i].mi)==null?0:rowDatas[i].mi);
				    sum_meizu = Math.add(sum_meizu,parseFloat(rowDatas[i].meizu)==null?0:rowDatas[i].meizu);
				    sum_sumsing = Math.add(sum_sumsing,parseFloat(rowDatas[i].sumsing)==null?0:rowDatas[i].sumsing);
				    sum_other = Math.add(sum_other,parseFloat(rowDatas[i].other)==null?0:rowDatas[i].other);
				    sum_total1 = Math.add(sum_total1,parseFloat(rowDatas[i].total1)==null?0:rowDatas[i].total1);
				    sum_oppo1 = Math.add(sum_oppo1,parseFloat(rowDatas[i].oppo1)==null?0:rowDatas[i].oppo1);
				    sum_vivo1 = Math.add(sum_vivo1,parseFloat(rowDatas[i].vivo1)==null?0:rowDatas[i].vivo1);
				    sum_apple1 = Math.add(sum_apple1,parseFloat(rowDatas[i].apple1)==null?0:rowDatas[i].apple1);
				    sum_huawei1 = Math.add(sum_huawei1,parseFloat(rowDatas[i].huawei1)==null?0:rowDatas[i].huawei1);
				    sum_rongyao1 = Math.add(sum_rongyao1,parseFloat(rowDatas[i].rongyao1)==null?0:rowDatas[i].rongyao1);
				    sum_cmcc1 = Math.add(sum_cmcc1,parseFloat(rowDatas[i].cmcc1)==null?0:rowDatas[i].cmcc1);
				    sum_mi1 = Math.add(sum_mi1,parseFloat(rowDatas[i].mi1)==null?0:rowDatas[i].mi1);
				    sum_meizu1 = Math.add(sum_meizu1,parseFloat(rowDatas[i].meizu1)==null?0:rowDatas[i].meizu1);
				    sum_sumsing1 = Math.add(sum_sumsing1,parseFloat(rowDatas[i].sumsing1)==null?0:rowDatas[i].sumsing1);
				    sum_other1 = Math.add(sum_other1,parseFloat(rowDatas[i].other1)==null?0:rowDatas[i].other1);

				}                                
				 $("#list").footerData("set",{total:sum_total,oppo:getBfb(sum_oppo,sum_total),vivo:getBfb(sum_vivo,sum_total),
					 apple: getBfb(sum_apple,sum_total),huawei:getBfb(sum_huawei,sum_total),
					 rongyao:getBfb(sum_rongyao,sum_total),cmcc: getBfb(sum_cmcc,sum_total),
					 mi:getBfb(sum_mi,sum_total),meizu:getBfb(sum_meizu,sum_total),
					 sumsing:getBfb(sum_sumsing,sum_total),other:getBfb(sum_other,sum_total),
					 total1:sum_total1,
					 oppo1:getBfb(sum_oppo1,sum_total1),vivo1:getBfb(sum_vivo1,sum_total1),
					 apple1: getBfb(sum_apple1,sum_total1),huawei1:getBfb(sum_huawei1,sum_total1),
					 rongyao1:getBfb(sum_rongyao1,sum_total1),cmcc1: getBfb(sum_cmcc1,sum_total1),
					 mi1:getBfb(sum_mi1,sum_total1),meizu1:getBfb(sum_meizu1,sum_total1),
					 sumsing1: getBfb(sum_sumsing1,sum_total1),other1:getBfb(sum_other1,sum_total1)}); 
	    	  

	    	  $.each(data,function(index,item){   	
	        	var total = item.total;
	        	item.oppo = getBfb(item.oppo,total);
	        	item.vivo = getBfb(item.vivo,total);
	        	item.apple = getBfb(item.apple,total);
	        	item.huawei = getBfb(item.huawei,total);
	        	item.rongyao = getBfb(item.rongyao,total);
	        	item.cmcc = getBfb(item.cmcc,total);
	        	item.mi = getBfb(item.mi,total);
	        	item.meizu = getBfb(item.meizu,total);
	        	item.sumsing = getBfb(item.sumsing,total);
	        	item.other = getBfb(item.other,total);
	        	var total1 = item.total1;
	        	item.oppo1 = getBfb(item.oppo1,total1);
	        	item.vivo1 = getBfb(item.vivo1,total1);
	        	item.apple1 = getBfb(item.apple1,total1);
	        	item.huawei1 = getBfb(item.huawei1,total1);
	        	item.rongyao1 = getBfb(item.rongyao1,total1);
	        	item.cmcc1 = getBfb(item.cmcc1,total1);
	        	item.mi1 = getBfb(item.mi1,total1);
	        	item.meizu1 = getBfb(item.meizu1,total1);
	        	item.sumsing1 = getBfb(item.sumsing1,total1);
	        	item.other1 = getBfb(item.other1,total1);
	        }); 
		
			$("#list").jqGrid('clearGridData');
			$("#list").jqGrid('setGridParam', {
				data : data,
				datatype : 'local',
				page : 1
			}).trigger("reloadGrid");
			
		}else if(abSet=="jdz"){
			
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

//改变可输入单元格的背景颜色 addCellAttre
function addCellAttr(rowId, val, rawObject, cm, rdata) {
 if (val!=null) {
                    return "style='color:blue'";
                }
}

//加权参考值设置

function getSetDate(rowid,j,tt){
	
	//某品牌赛诺数据容量×赛诺数据权重+某品牌移动换机预测数据容量×移动换机预测数据权重=加权后该品牌的参考值
	 //oppo
	  var oppo1=Number(jQuery('#list').getCell(rowid,'oppo1'));//广东移动
	  var oppo=Number(jQuery('#list').getCell(rowid,'oppo'));//赛诺数据
	  var ppt2=oppo*j/100+oppo1*tt/100;							  
	  ppt2=ppt2.toFixed(2);
	  if(ppt2=='NaN'){
		  ppt2='';
	  }
	  jQuery('#list').setCell(rowid, 'oppo2', ppt2);
	 // vivo2
	  var vivo1=Number(jQuery('#list').getCell(rowid,'vivo1'));//广东移动
	  var vivo=Number(jQuery('#list').getCell(rowid,'vivo'));//赛诺数据
	  var ppt3=vivo*(j/100)+vivo1*(tt/100);							  
	  ppt3=ppt3.toFixed(2);
	  if(ppt3=='NaN'){
		  ppt3='';
	  }
	  jQuery('#list').setCell(rowid, 'vivo2', ppt3);
	  
	  //apple2
	  var apple1=Number(jQuery('#list').getCell(rowid,'apple1'));//广东移动
	  var apple=Number(jQuery('#list').getCell(rowid,'apple'));//赛诺数据
	  var ppt4=apple*(j/100)+apple1*(tt/100);							  
	  ppt4=ppt4.toFixed(2);
	  if(ppt4=='NaN'){
		  ppt4='';
	  }
	  jQuery('#list').setCell(rowid, 'apple2', ppt4);
	 //huawei2
	  var huawei1=Number(jQuery('#list').getCell(rowid,'huawei1'));//广东移动
	  var huawei=Number(jQuery('#list').getCell(rowid,'huawei'));//赛诺数据
	  var ppt5=huawei*(j/100)+huawei1*(tt/100);							  
	  ppt5=ppt5.toFixed(2);
	  if(ppt5=='NaN'){
		  ppt5='';
	  }
	  jQuery('#list').setCell(rowid, 'huawei2', ppt5);
	 //rongyao2
	  var rongyao1=Number(jQuery('#list').getCell(rowid,'rongyao1'));//广东移动
	  var rongyao=Number(jQuery('#list').getCell(rowid,'rongyao'));//赛诺数据
	  var ppt6=rongyao*(j/100)+rongyao1*(tt/100);							  
	  ppt6=ppt6.toFixed(2);
	  if(ppt6=='NaN'){
		  ppt6='';
	  }
	  jQuery('#list').setCell(rowid, 'rongyao2', ppt6);
	 //cmcc2
	  var cmcc1=Number(jQuery('#list').getCell(rowid,'cmcc1'));//广东移动
	  var cmcc=Number(jQuery('#list').getCell(rowid,'cmcc'));//赛诺数据
	  var ppt7=cmcc*(j/100)+cmcc1*(tt/100);							  
	  ppt7=ppt7.toFixed(2);
	  if(ppt7=='NaN'){
		  ppt7='';
	  }
	  jQuery('#list').setCell(rowid, 'cmcc2', ppt7);
	 //mi2
	  var mi1=Number(jQuery('#list').getCell(rowid,'mi1'));//广东移动
	  var mi=Number(jQuery('#list').getCell(rowid,'mi'));//赛诺数据
	  var ppt8=mi*(j/100)+mi1*(tt/100);							  
	  ppt8=ppt8.toFixed(2);
	  if(ppt8=='NaN'){
		  ppt8='';
	  }
	  jQuery('#list').setCell(rowid, 'mi2', ppt8);
	 //meizu2
	  var meizu1=Number(jQuery('#list').getCell(rowid,'meizu1'));//广东移动
	  var meizu=Number(jQuery('#list').getCell(rowid,'meizu'));//赛诺数据
	  var ppt9=oppo*(j/100)+oppo1*(tt/100);							  
	  ppt9=ppt9.toFixed(2);
	  if(ppt9=='NaN'){
		  ppt9='';
	  }
	  jQuery('#list').setCell(rowid, 'meizu2', ppt9);
	 //sumsing2
	  var sumsing1=Number(jQuery('#list').getCell(rowid,'sumsing1'));//广东移动
	  var sumsing=Number(jQuery('#list').getCell(rowid,'sumsing'));//赛诺数据
	  var ppt10=sumsing*(j/100)+sumsing1*(tt/100);							  
	  ppt10=ppt10.toFixed(2);
	  if(ppt10=='NaN'){
		  ppt10='';
	  }
	  jQuery('#list').setCell(rowid, 'sumsing2', ppt10);
	 //other2
	  var other1=Number(jQuery('#list').getCell(rowid,'other1'));//广东移动
	  var other=Number(jQuery('#list').getCell(rowid,'other'));//赛诺数据
	  var ppt11=other*(j/100)+other1*(tt/100);							  
	  ppt11=ppt11.toFixed(2);
	  if(ppt11=='NaN'){
		  ppt11='';
	  }
	  jQuery('#list').setCell(rowid, 'other2', ppt11);

	
}
/*新增加一行来显示总量和手机容量的统计 */
/*统计功能 */
        	function completeMethod(){
                var sum_total=$("#list").getCol('total',false,'sum');
                var sum_oppo=$("#list").getCol('oppo',false,'sum');
                var sum_vivo=$("#list").getCol('vivo',false,'sum');
                var sum_apple=$("#list").getCol('apple',false,'sum');
                var sum_huawei=$("#list").getCol('huawei',false,'sum');
                var sum_rongyao=$("#list").getCol('rongyao',false,'sum');
                var sum_cmcc=$("#list").getCol('cmcc',false,'sum');
                var sum_mi=$("#list").getCol('mi',false,'sum');
                var sum_meizu=$("#list").getCol('meizu',false,'sum');
                var sum_sumsing=$("#list").getCol('sumsing',false,'sum');
                var sum_other=$("#list").getCol('other',false,'sum');
                
                var sum_total1=$("#list").getCol('total1',false,'sum');
                var sum_oppo1=$("#list").getCol('oppo1',false,'sum');
                var sum_vivo1=$("#list").getCol('vivo1',false,'sum');
                var sum_apple1=$("#list").getCol('apple1',false,'sum');
                var sum_huawei1=$("#list").getCol('huawei1',false,'sum');
                var sum_rongyao1=$("#list").getCol('rongyao1',false,'sum');
                var sum_cmcc1=$("#list").getCol('cmcc1',false,'sum');
                var sum_mi1=$("#list").getCol('mi1',false,'sum');
                var sum_meizu1=$("#list").getCol('meizu1',false,'sum');
                var sum_sumsing1=$("#list").getCol('sumsing1',false,'sum');
                var sum_other1=$("#list").getCol('other1',false,'sum');
                

                $("#list").footerData('set', { "city": '全省', total: sum_total, oppo: sum_oppo,vivo: sum_vivo,
                	apple: sum_apple,huawei: sum_huawei,rongyao: sum_rongyao,cmcc:sum_cmcc,mi: sum_mi,meizu: sum_meizu,
                	sumsing: sum_sumsing,other: sum_other,total1: sum_total1, oppo1: sum_oppo1,vivo1: sum_vivo1,
                	apple1: sum_apple1,huawei1: sum_huawei1,rongyao1: sum_rongyao1,cmcc1:sum_cmcc1,mi1:sum_mi1,meizu1: sum_meizu1,
                	sumsing1: sum_sumsing1,other1: sum_other1
                	
                });
            }

        	//改变可输入单元格的背景颜色 addCellAttre
        	function addCellAttre(rowId, val, rawObject, cm, rdata) {
        	 if (val!=null) {
        	                    return "style='color:#5bfdff'";
        	                }
        	}

/*******************************************定义实现数据格式化保留两位小数的方 法************************************************************************/
Math.add = function(v1, v2)
{
    var r1, r2, m;
    try
    {
        r1 = v1.toString().split(".")[1].length;
    }
    catch (e)
    {
        r1 = 0;
    }
    try
    {
        r2 = v2.toString().split(".")[1].length;
    }
    catch (e)
    {
        r2 = 0;
    }
    m = Math.pow(10, Math.max(r1, r2));
 
    return (v1 * m + v2 * m) / m;
}

//初始化表格要执行的方法
/* $("#list").jqGrid({
		gridComplete: function () {
			//将第3步到第5步复制到此方法中;
		
}); */




	
	
	
	
	
	
	
		</script>
</body>
</html>