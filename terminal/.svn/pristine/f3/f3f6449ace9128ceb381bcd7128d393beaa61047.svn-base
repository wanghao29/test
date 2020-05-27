$(document).ready(function() {
	//顶部菜单切换
    $("#menu li").attr("class","drop");
    $("#price_capacity_set").attr("class","active");
	
	// 带搜索的下拉框样式初始化
	$('.select_searchable').searchableSelect();
	// 时间控件设置初始时间
	$(".prevMonth").val(getPrevMonthValue());
	// 城市下拉框初始化
	citySelectInit($('#citySelect'));
	// 顶部菜单切换
	// $("#menu li").attr("class","drop");
	// $("#customerChannel").attr("class","active");

	$("#citySelect").change(function() {
		pageInit();
	});

});

$(document).ready(function() {
	jqgridInit();

});

function pageInit() {

}

function jqgridReload() {
	$("#list").jqGrid('clearGridData');
	$("#list").jqGrid('setGridParam', {
		postData : getparam(),
		datatype : 'json',
		page : 1
	}).trigger("reloadGrid");
};

function getparam() {
	var data = {};
	data["month"] = $("#month").val();
	data["month2"] = $("#month2").val();
	return data;
};

//初始化表格
var jqgrid_length;
function jqgridInit() {

	jQuery("#list").jqGrid(
			{
				/* datatype : "local", */
				url : "../uploadFilePrice/selectPrice.do",
				mtype : 'post',
				datatype : "json",
				loadonce : true, // 一次性加载
				gridview : true, // 增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
				postData : getparam(),
				gridComplete:function(){//表格加载执行 						            	 						            	 
	            	 if(typeof(eval(setGroupHeaders))=="function"){
	            		 setGroupHeaders();
	                 } 
	           	},
	            footerrow:true,//对统计进行设置
				rowNum : 5,
				rowList : [ 5, 10, 30, 50 ],
				rownumbers : false, // 行首添加顺序编码
				rownumWidth : 60, // 行首添加顺序编码的列宽
				autowidth : true, // 表格宽度 刚加载时自动适应父div ,然后随列调整宽度
				height : "100%", // 表格宽度自动适应行数
				sortorder : "asc", // 指定列排序的次序
				viewrecords : true, // 显示当前记录，和总记录数
				sortname : 'cityCd', // 默认排序
				repeatitems : true, // 是否可重复
				shrinkToFit : true, // 可伸缩, true时使列宽可调整
				// false时设置的水平滚动才有效/也可能留出空白右侧
				forceFit : true,
				autoScroll : true,
				jsonReader : { // 描述json 数据格式的数组,需修改
					root : 'list',
					page : "current", // json中代表当前页码的数据
					total : "pages", // json中代表页码总数的数据
					records : "total", // json中代表数据行总数的数据
					repeatitems : false, // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
					cell : "cell",
					id : "fRoleId",
					userdata : "userdata",
				},
				
				pager : '#pager', //指定分页组件所在div id 
				pagination : true,
				caption : "",
				 //编辑单元格
		        cellEdit : true,
		        cellsubmit : 'rclientArray',
		       /* onCellSelect : function(rowid,iCol,cellcontent,e){
		        	
		        	alert($("#1_sainuo").val());
		        },*/
		        //点击可编辑的框时触发
		        afterEditCell : function(rowid, cellname, value, iRow, iCol){
		        	if(iCol ==24){
		        		 jQuery('#list').setCell(rowid, 'guangdong', value);
		        	}
		        	
		        	
		        	value=$('#'+iRow+'_sainuo').val(),									
			          console.log(value);									         
			         var j =  Number(value);
			        	if(j>=100){
			        		
			        	alert("参数值不能大于等于100！");	
			        	
			        	}
                    if(j<0){
			        		
			        	alert("参数值不能小于等于0！");	
			        	
			        	}
			        	
			          //alert(j);
			        	
			        	 $('#'+iRow+'_sainuo').change(function (){ 
			        		var value=$('#'+iRow+'_sainuo').val(),
			        		j =  Number(value);
					        	//alert(j);
					        	 if(j>0&&j<100){
								       var tt= 100-j;
								     										       
								       jQuery('#list').setCell(rowid, 'yidong', tt);
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
				        	 jQuery('#list').setCell(rowid, 'sainuo', j);
					        	 
					        	 
					        	 
						}); 
			        	 
			        	 
			        	 
			        	 
		        	
		        },
		        
		        //保存前触发
			  	beforeSaveCell : function(rowid, cellname, value, iRow, iCol){ //行id,单元格名称,单元格值 ,行的index,列的index 
			  		
			  		
			  		
			  		
				},
				/*afterSaveCell : function(rowid,name,val,iRow,iCol){ //需要解决的问题，为什么触发不了
					var gr = $("#list").getGridParam('selrow');
		        	var jsid = $("#list").getCell(gr,"sainuo")
		        alert(gr);
		        alert(jsid);
				},*/
				gridComplete:function(){
					var lines= $("#list").jqGrid('getDataIDs');
					for(var j=0;j<lines.length;j++){
	                //  radiovalue[j]  = $("input:radio[name='sainuo'][checked]").val();
	        
					}
					$("#1_sainuo").change(function (){ 
					    alert("dfsf"); 
				}); 
				
					//completeMethod();
				
				},
				
			    //对合计行颜色进行改变
	             loadComplete: function () {  
	            	 
	            	 var ids = $("#list").jqGrid("getDataIDs");//获取所有行的id
					 var rowDatas = $("#list").jqGrid("getRowData");//获取所有行的数据
	            	 var abSet= $('#abSet').val();
	            	 if(abSet=="jdz"){
	        		//debugger;
	        		//在表格加载完成后执行
	            	 completeMethod();
	            	 
	            	
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
					    
					    
					    
					    if(rowData.city != ''){   //如果某一行中的“tax”为0，那就把这一整行的背景颜色设为红色
				            $("#"+ids[i]+ " td").css("color","#5bfdff");
				        }

					}
					 $("#list").footerData("set",{"total":sum_total, "value1": sum_value1,"value2": sum_value2,
	                       	"value3": sum_value3,"value4": sum_value4,"value5": sum_value5,"value6": sum_value6,"value7": sum_value7,"value8": sum_value8,
	                       	"total1": sum_total1,"value12": sum_value12,"value22": sum_value22, "value32": sum_value32,"value42": sum_value42,
	                       	"value52": sum_value52,"value62": sum_value62,"value72": sum_value72,"value82": sum_value82});
	            	 }else{ //百分比
	            		
	            		 if(rowDatas.city == ''){   //如果某一行中的“tax”为0，那就把这一整行的背景颜色设为红色
							 $("#list").jqGrid('clearFooterData');
					        }
	            	 
	            	 }
	             } ,
		       
				

				colNames : [ '', '整体容量', '0~399', '400~699', '700~999',
						'1000~1499', '1500~1999', '2000~2499', '2500~2999',
						'3000以上', '整体容量', '0~399', '400~699', '700~999',
						'1000~1499', '1500~1999', '2000~2499', '2500~2999',
						'3000以上', '塞诺数据', '广东移动换机预测数据', '0~399',
						'400~699', '700~999', '1000~1499', '1500~1999',
						'2000~2499', '2500~2999', '3000以上' ],
				colModel : [ {
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
					name : 'value1',
					index : 'value1',
					sorttype : "date",
					align:"center"
				}, {
					name : 'value2',
					index : 'value2',
					align:"center"
				}, {
					name : 'value3',
					index : 'value3',
					sorttype : "float",
					hidden : true,
					align:"center"
				      
				}, {
					name : 'value4',
					index : 'value4',
					sorttype : "float",
					hidden : true,
					align:"center"
				
				
				}, {
					name : 'value5',
					index : 'value5',
					sorttype : "float",
					hidden : true,
					align:"center"
				}, {
					name : 'value6',
					index : 'value6',
					sorttype : "float",
					hidden : true,
					align:"center"
				}, {
					name : 'value7',
					index : 'value7',
					sortable : false,
					hidden : true,
					align:"center"
				}, {
					name : 'value8',
					index : 'value8',
					sorttype : "int",
					hidden : true,
					align:"center"
				},

				{
					name : 'total1',
					index : 'total1',
					sorttype : "int",
					align:"center"
					
				}, {
					name : 'value12',
					index : 'value12',
					sorttype : "float",
					align:"center"
					
				}, {
					name : 'value22',
					index : 'value22',
					sorttype : "float",
					align:"center"
				}, {
					name : 'value32',
					index : 'value32',
					sorttype : "float",
					hidden : true,
					align:"center"
				}, {
					name : 'value42',
					index : 'value42',
					sorttype : "float",
					hidden : true,
					align:"center"
				}, {
					name : 'value52',
					index : 'value52',
					sorttype : "float",
					hidden : true,
					align:"center"
				}, {
					name : 'value62',
					index : 'value62',
					sorttype : "float",
					hidden : true,
					align:"center"
				}, {
					name : 'value72',
					index : 'value72',
					sortable : false,
					hidden : true,
					align:"center"
				}, {
					name : 'value82',
					index : 'value82',
					sorttype : "int",
					hidden : true,
					align:"center"
				},

				{
					name : 'sainuo',
					index : 'sainuo',
					sorttype : "date",
					cellEdit:true,
					editable : true,
					edittype : 'number',
					//cellattr: addCellAttr,					
					align:"center"
				}, {
					name : 'yidong',
					index : 'yidong',
					editable : false,
					edittype : 'number',
					//cellattr: addCellAttr,	
					align:"center"
				},

			/*	{
					name : 'total2',
					index : 'total2',
					sorttype : "int",
					align:"center"
				},*/ {
					name : 'value13',
					index : 'value13',
					sorttype : "date",
					align:"center"
				}, {
					name : 'value23',
					index : 'value23',
					align:"center"
				}, {
					name : 'value33',
					index : 'value33',
					sorttype : "float",
					hidden : true,
					align:"center"
				}, {
					name : 'value43',
					index : 'value43',
					sorttype : "float",
					hidden : true,
					align:"center"
				}, {
					name : 'value53',
					index : 'value53',
					sorttype : "float",
					hidden : true,
					align:"center"
				}, {
					name : 'value63',
					index : 'value63',
					sorttype : "float",
					hidden : true,
					align:"center"
				}, {
					name : 'value73',
					index : 'value73',
					sortable : false,
					hidden : true,
					align:"center"
				}, {
					name : 'value83',
					index : 'value83',
					sorttype : "int",
					hidden : true,
					align:"center"
				
				}, ],
			});
	jqgrid_length = $("#list").getGridParam("width");
}
	
	function setGroupHeaders(){
		jQuery("#list").jqGrid('destroyGroupHeader');
	    // 合并最顶表头
	   jQuery("#list").jqGrid('setGroupHeaders', {
		useColSpanStyle : true,
		groupHeaders : [ {
			startColumnName : 'total',
			numberOfColumns : 9,
			titleText : '基于塞诺数据'
		}, {
			startColumnName : 'total1',
			numberOfColumns : 9,
			titleText : '基于广东移动换机预测数据'
		}, {
			startColumnName : 'value13',
			numberOfColumns : 9,
			titleText : '加权参考值'
		} ]
	});
	// 合并二级表格
	jQuery("#list").jqGrid('setGroupHeaders', {
		useColSpanStyle : true,
		groupHeaders : [ {
			startColumnName : 'total',
			numberOfColumns : 9,
			titleText : '品牌容量'
		}, {
			startColumnName : 'total1',
			numberOfColumns : 9,
			titleText : '品牌容量'
		}, {
			startColumnName : 'value13',
			numberOfColumns : 9,
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
				jQuery("#list").setGridParam().hideCol([sel,sel+"2",sel+"3"]).trigger("reloadGrid");

			}
		}
	}else{
		for(var i=0; i<newSelect.length;i++){
			if(oldSelect==null || oldSelect.indexOf(newSelect[i])==-1){
				var sel = newSelect[i];
				jQuery("#list").setGridParam().showCol([sel,sel+"2",sel+"3"]).trigger("reloadGrid");
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
	setGroupHeaders();
});

//改变可输入单元格的背景颜色
/*function addCellAttr(rowId, val, rawObject, cm, rdata) {
 if (val!=null) {
         //alert(rdata);           
	 
	 return "style='background:blue'";
                }
}*/

function getSetDate(rowid,j,tt){
	
	
	//某品牌赛诺数据容量×赛诺数据权重+某品牌移动换机预测数据容量×移动换机预测数据权重=加权后该品牌的参考值
	 //value13
	  var value12=Number(jQuery('#list').getCell(rowid,'value12'));//广东移动
	  var value1=Number(jQuery('#list').getCell(rowid,'value1'));//赛诺数据
	  var ppt2=value1*(j/100)+value12*(tt/100);							  
	  ppt2=ppt2.toFixed(2);
	  if(ppt2=='NaN'){
		  ppt2='';
	  }
	  jQuery('#list').setCell(rowid, 'value13', ppt2);
	 // value23
	  var value22=Number(jQuery('#list').getCell(rowid,'value22'));//广东移动
	  var value2=Number(jQuery('#list').getCell(rowid,'value2'));//赛诺数据
	  var ppt3=value2*(j/100)+value22*(tt/100);							  
	  ppt3=ppt3.toFixed(2);
	  if(ppt3=='NaN'){
		  ppt3='';
	  }
	  jQuery('#list').setCell(rowid, 'value23', ppt3);
	  
	  //value33
	  var value32=Number(jQuery('#list').getCell(rowid,'value32'));//广东移动
	  var value3=Number(jQuery('#list').getCell(rowid,'value3'));//赛诺数据
	  var ppt4=value3*(j/100)+value32*(tt/100);							  
	  ppt4=ppt4.toFixed(2);
	  if(ppt4=='NaN'){
		  ppt4='';
	  }
	  jQuery('#list').setCell(rowid, 'value33', ppt4);
	 //value43
	  var value42=Number(jQuery('#list').getCell(rowid,'value42'));//广东移动
	  var value4=Number(jQuery('#list').getCell(rowid,'value4'));//赛诺数据
	  var ppt5=value4*(j/100)+value42*(tt/100);							  
	  ppt5=ppt5.toFixed(2);
	  if(ppt5=='NaN'){
		  ppt5='';
	  }
	  jQuery('#list').setCell(rowid, 'value43', ppt5);
	 //value53
	  var value52=Number(jQuery('#list').getCell(rowid,'value52'));//广东移动
	  var value5=Number(jQuery('#list').getCell(rowid,'value5'));//赛诺数据
	  var ppt6=value5*(j/100)+value52*(tt/100);							  
	  ppt6=ppt6.toFixed(2);
	  if(ppt6=='NaN'){
		  ppt6='';
	  }
	  jQuery('#list').setCell(rowid, 'value53', ppt6);
	 //value63
	  var value62=Number(jQuery('#list').getCell(rowid,'value62'));//广东移动
	  var value6=Number(jQuery('#list').getCell(rowid,'value6'));//赛诺数据
	  var ppt7=value6*(j/100)+value62*(tt/100);							  
	  ppt7=ppt7.toFixed(2);
	  if(ppt7=='NaN'){
		  ppt7='';
	  }
	  jQuery('#list').setCell(rowid, 'value63', ppt7);
	 //value73
	  var value72=Number(jQuery('#list').getCell(rowid,'value72'));//广东移动
	  var value7=Number(jQuery('#list').getCell(rowid,'value7'));//赛诺数据
	  var ppt8=value7*(j/100)+value72*(tt/100);							  
	  ppt8=ppt8.toFixed(2);
	  if(ppt8=='NaN'){
		  ppt8='';
	  }
	  jQuery('#list').setCell(rowid, 'value73', ppt8);
	 //value83
	  var value82=Number(jQuery('#list').getCell(rowid,'value82'));//广东移动
	  var value8=Number(jQuery('#list').getCell(rowid,'value8'));//赛诺数据
	  var ppt9=value8*(j/100)+value82*(tt/100);							  
	  ppt9=ppt9.toFixed(2);
	  if(ppt9=='NaN'){
		  ppt9='';
	  }
	  jQuery('#list').setCell(rowid, 'value83', ppt9);	
}
	
/*新增加一行来显示总量和手机容量的统计 */
/*统计功能 */
        	function completeMethod(){
                var sum_total=$("#list").getCol('total',false,'sum');
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
                

                $("#list").footerData('set', { "city": '全省', total: sum_total, value1: sum_value1,value2: sum_value2,
                	value3: sum_value3,value4: sum_value4,value5: sum_value5,value6:sum_value6,value7: sum_value7,value8: sum_value8,
                	total1: sum_total1,value12: sum_value12,value22: sum_value22, value32: sum_value32,value42: sum_value42,
                	value52: sum_value52,value62: sum_value62,value72: sum_value72,value82:sum_value82
                	
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
/*********************************百分比的执行方法*********************************************/
        	function getBfb(dou,total){
        		if(dou==0){
        		dou=0;	
        			
        		}
        		dou = parseInt(dou/total*100)+"%";
        		return dou;
        	}        	
        	
        	
        	
        	
        	
        	
        	
        	
