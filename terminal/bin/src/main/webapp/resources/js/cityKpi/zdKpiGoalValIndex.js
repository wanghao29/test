$(document).ready(function() {
    //顶部菜单切换
    $("#menu li").attr("class","drop");
    $("#zdKpiGoalVal").attr("class","active");
	// 带搜索的下拉框样式初始化
	$('.select_searchable').searchableSelect();
	
	// 时间控件设置初始时间
	var myDate = new Date();	
	var year = myDate.getFullYear(); 
	$(".currentYear").val(year);
	
	// 城市下拉框初始化
	citySelectInit($('#citySelect'));

	$("#citySelect").change(function() {
		pageInit();
	});

});

var grid = null;
var model ="ImptProdt";

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
	data["year"] = $("#year").val();
	data["quarter"] = $("#quarter").val();
	return data;
};
function jqgridInit() {
	grid = jQuery("#list").jqGrid(
			{
				/* datatype : "local", */
				url : "../zdKpiGoalVal/list.do",
				mtype : 'post',
				datatype : "json",
				loadonce : true, // 一次性加载
				gridview : true, // 增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
				postData : getparam(),
				rowNum : 50,
				rowList : [ 5, 10, 30, 50 ],
				//rownumbers : true, // 行首添加顺序编码
				//rownumWidth : 40, // 行首添加顺序编码的列宽
				autowidth : true, // 表格宽度 刚加载时自动适应父div ,然后随列调整宽度
				height : "100%", // 表格宽度自动适应行数
				sortorder : "asc", // 指定列排序的次序
				viewrecords : true, // 显示当前记录，和总记录数
				sortname : 'id', // 默认排序
				repeatitems : true, // 是否可重复
				shrinkToFit : false, // 可伸缩, true时使列宽可调整
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

				// 编辑单元格
				//cellEdit : true,
				cellsubmit : 'rclientArray',
				// 编辑框切换到文本框时触发
				onCellSelect : function(rowid, iCol, cellcontent, e) {
				},
				// 点击可编辑的框时触发
				afterEditCell : function(rowid, cellname, value, iRow, iCol) {
					lastValue = value
				},
				// 保存前触发
				beforeSaveCell : function(rowid, cellname, value, iRow, iCol) {
					return false;
				},
				afterSaveCell : function(rowid, name, val, iRow, iCol) {
					alert("afterSaveCell");
				},
				colNames : ['操作','id',
				            '运营中心','地市','年份','季度','全年销量（万台）','季度销量-基本目标（万台）','季度销量-激励目标','季度销量-冲刺目标',
				            '全年销售额（万元）','季度销售额-基本目标','季度销售额-激励目标','季度销售额-冲刺目标','全年智能硬件销售额（万元）',
				            '季度智能硬件销售额-基本目标','季度智能硬件销售额-激励目标','季度智能硬件销售额-冲刺目标','全年自主品牌手机销售额（万元）',
				            '季度自主品牌手机销售额指标','全年自主品牌配额智能硬件销售额（万元）','季度自主品牌配额智能硬件销售额指标',
				            '全年自主品牌非配额智能硬件销售额（万元）','季度自主品牌非配额智能硬件销售额-基本目标',
				            '季度自主品牌非配额智能硬件销售额-激励目标','季度自主品牌非配额智能硬件销售额-冲刺目标','活跃客户目标值（个,全年）',
				            '活跃客户目标值季度指标（累计口径）','KA维系客户销量（万台，下半年）','KA维系客户销量季度指标','中小活跃客户数（个，全年）',
				            '中小活跃客户数季度指标（累计口径）','零售侧双渠道销量（万台）','零售侧双渠道-季度指标','零售侧双渠道-净利润（万元）',
				            '零售侧双渠道-季度指标','售后净利（万元）—全年指标','售后净利-季度指标','有效客户规模扣分项-全年','有效客户规模扣分项-季度指标'],
				colModel : [
	    		{
	    			name:'actions', 
	    			index: 'actions',
	    			width: 120,
	    			align: 'center',
	         	   	formatter:function(cellvalue, options, rowObject){
	    	     	   	var cl =   options.rowId;//rowObject.id 删除的id
	    	     		var	edit = "<button class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover' id='editBtn"+model+cl+"' type='button' value='' onclick='editStu"+model+"("
	    	     		+ cl + ")' title='编辑'><span class='ui-icon ui-icon-pencil'></span></button>";
	    	     		
	    	     		var	del = "<button class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover'  id='deleteBtn"+model+cl+"' type='button' value='' onclick='deleteStu"+model+"("
	    	     			+ rowObject.id + ")' title='删除'><span class='ui-icon ui-icon-trash'></span></button>";
	    	     		
	    	     		var	add = "<button class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover'   id='addBtn"+model+cl+"'  onclick='addStu"+model+"("
	    	     			+ cl + ")' title='插入'><span class='ui-icon ui-icon-plus'></span></button>";
	    	     		var update = "<button style='display:none' class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover'  id='updateBtn"+model+cl+"' type='button' value='' onclick='updateStu"+model+"("+ cl + ")' title='保存'><span class='ui-icon ui-icon-disk'></span></button>";
	    	     		var cancel = "<button  style='display:none'  class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover' id='cancelEditBtn"+model+cl+"'  onclick='canceEditlStu"+model+"("
	    	     		+ cl + ")' title='取消'><span class='ui-icon ui-icon-cancel'></span></button>";
	    	     		
	    	     		return edit + del + add + update + cancel ;
	    			}
	    		},{
					name : 'id',
					index : 'id',
					sorttype : "string",
					width:100,
					hidden:true
				},{
					name : 'operationCenter',
					index : 'operationCenter',
					editable : true,
					sorttype : "string",width:100
				}, {
					name : 'city',
					index : 'city',
					editable : true,
					sorttype : "string",width:50
				}, {
					name : 'year',
					index : 'year',
					editable : true,
					sorttype : "string",width:50
				}, {
					name : 'quarter',
					index : 'quarter',
					editable : true,
					sorttype : "string",width:80
				}, {
					name : 'yearCount',
					index : 'yearCount',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qcBaseGoal',
					index : 'qcBaseGoal',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qcUrgeGoal',
					index : 'qcUrgeGoal',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qcSprintGoal',
					index : 'qcSprintGoal',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'yearSales',
					index : 'yearSales',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qsBaseGoal',
					index : 'qsBaseGoal',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qsUrgeGoal',
					index : 'qsUrgeGoal',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qsSprintGoal',
					index : 'qsSprintGoal',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'yearHdwSales',
					index : 'yearHdwSales',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qhsBaseGoal',
					index : 'qhsBaseGoal',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qhsUrgeGoal',
					index : 'qhsUrgeGoal',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qhsSprintGoal',
					index : 'qhsSprintGoal',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'ymbmSales',
					index : 'ymbmSales',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qmbmSales',
					index : 'qmbmSales',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'ymbhSales',
					index : 'ymbhSales',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qmbhSales',
					index : 'qmbhSales',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'ymbnhSales',
					index : 'ymbnhSales',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qmbnhBaseGoal',
					index : 'qmbnhBaseGoal',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qmbnhUrgeGoal',
					index : 'qmbnhUrgeGoal',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qmbnhSprintGoal',
					index : 'qmbnhSprintGoal',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'actCustGoal',
					index : 'actCustGoal',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qactCustGoal',
					index : 'qactCustGoal',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'kaCustSales',
					index : 'kaCustSales',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qkaCustSales',
					index : 'qkaCustSales',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'msActCustCount',
					index : 'msActCustCount',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qmsActCustCount',
					index : 'qmsActCustCount',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'retailDchnSales',
					index : 'retailDchnSales',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qretailDchnSales',
					index : 'qretailDchnSales',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'retailDchnProfits',
					index : 'retailDchnProfits',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qretailDchnProfits',
					index : 'qretailDchnProfits',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'aftSaleProfits',
					index : 'aftSaleProfits',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qaftSaleProfits',
					index : 'qaftSaleProfits',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'efctCustDedtScore',
					index : 'efctCustDedtScore',
					editable : true,
					sorttype : "float",width:100
				}, {
					name : 'qefctCustDedtScore',
					index : 'qefctCustDedtScore',
					editable : true,
					sorttype : "float",width:100
				}]
			});
	
}


//************************** 编辑 ******************************
//编辑按钮
function editStuImptProdt(id){	
	hideBtn(id,model);
	disabledBtn(grid,model);
	$('#list').jqGrid('editRow',id,true);
}
//单击编辑按钮后的 取消动作 
function canceEditlStuImptProdt(id) {
	$('#list').jqGrid('restoreRow', id);
	showBtn(id,model);
	undisabledBtn(grid,model);
}
//单击编辑按钮后的保存动作
function updateStuImptProdt(id){
	updatecommit(id,2);
}
//************************** 编辑 ******************************


//************************** 新增 ******************************
//新增按钮
function addStuImptProdt(id){
	disabledBtn(grid,model);
	var currentRow=("tr[id=" + id + "]"); 
	var html_value1 = jqgridCustomAddRow($("#list"),id,model);
	$("#list").find(currentRow).after(html_value1);	
};
function jqgridCustomAddRow(jqgrid,id,model){
	
	var rowData = jqgrid.jqGrid('getRowData',id);
	var dim;	
	if( rowData.hasOwnProperty("dim") ){
		dim = rowData.dim.substring(0,1);//+parseInt(rowData.dim.substring(1,rowData.dim.length))+1;
	}

	var ids = jqgrid.jqGrid('getDataIDs');	  // 获取行总数
  var maxrowid = Math.max.apply(Math,ids);  // 获取当前最大行编号 
	var newid = parseInt(maxrowid) + 1;      // 给新行分配新的ID

	var cl = newid;
	
	var save = "<button  class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover'  id='saveBtn"+model+cl+"' type='button' value='' onclick='saveStu"+model+"("+ cl + ")' title='保存'><span class='ui-icon ui-icon-disk'></span></button>";
	var cancel = "<button   class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover' id='cancelSaveBtn"+model+cl+"'  onclick='cancelSaveStu"+model+"("+ cl + ")' title='取消'><span class='ui-icon ui-icon-cancel'></span></button>";
 
	// 增加普通的“增、删、改” 按钮
	var	edit = "<button style='display:none' class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover' id='editBtn"+model+cl+"' type='button' value='' onclick='editStu"+model+"("
	+ cl + ")' title='编辑'><span class='ui-icon ui-icon-pencil'></span></button>";
	var	del = "<button style='display:none' class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover'  id='deleteBtn"+model+cl+"' type='button' value='' onclick='deleteStu"+model+"("
		+ cl + ")' title='删除'><span class='ui-icon ui-icon-trash'></span></button>";
	var	add = "<button style='display:none' class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover'   id='addBtn"+model+cl+"'  onclick='addStu"+model+"("
		+ cl + ")' title='插入'><span class='ui-icon ui-icon-plus'></span></button>";
	var update = "<button style='display:none' class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover'  id='updateBtn"+model+cl+"' type='button' value='' onclick='updateStu"+model+"("+ cl + ")' title='保存'><span class='ui-icon ui-icon-disk'></span></button>";
	var cancel_normal = "<button  style='display:none'  class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover' id='cancelEditBtn"+model+cl+"'  onclick='canceEditlStu"+model+"("
	+ cl + ")' title='取消'><span class='ui-icon ui-icon-cancel'></span></button>";
	
	var html_value1="<tr role='row' id='"+cl+"' tabindex='0' class='jqgrow ui-row-ltr ui-widget-content jqgrid-new-row ui-state-highlight' editable='1' aria-selected='true'>";
		
	var colNames=jqgrid.jqGrid('getGridParam','colModel');  
	for(var i=0;i<colNames.length;i++){
		
		if(colNames[i].name == "dim" ){
			if(colNames[i].hidden){
				html_value1 += "<td role='gridcell' style='display:none;' title='' aria-describedby='grid_"+colNames[i].name+"'>"+dim+"</td>";
			}else{
				html_value1 += "<td role='gridcell' style='' title='' aria-describedby='grid_"+colNames[i].name+"'>"+dim+"</td>";
			}
		}else{
			if(colNames[i].editable){
				var inputTxt = '';
				var isnewcopy = false; // 主要用来处理select，第一次来源数据库的记录新增时，获得的是option的text，第二次从新增的记录再次新增时，获得的是option的value。
				var domID = id + "_" + colNames[i].name;
				
				if( $("#" + domID).length > 0 ) {
					isnewcopy = true;
					inputTxt =  $("#" + domID).val(); // 如果是基于新增的记录再次拷贝出记录，则从页面上取值，因为内存中的rowData[cl]已经变成html串了
				} else {
					inputTxt =  rowData[colNames[i].name]; // 如果是首次由标准记录增加拷贝出的记录，则从jqgrid内存取值，否则从页面取值
				}
				
				if (colNames[i].edittype == "select" && colNames[i].editoptions.value != null  && 
						colNames[i].editoptions.value != '') {
					// 当显示的是列表框, 选中的option值即为inputTxt
					var value = colNames[i].editoptions.value;
					var valueArray = value.split(';');
					var options = '';
					
					for(var vi=0; vi<valueArray.length; vi++){
						var index = valueArray[vi].indexOf(':'); // 找到第一个':' 作为 key|value的分割	
						var optVal = valueArray[vi].substr(0,index);
						var optTxt = valueArray[vi].substr(index+1); // 从“:”开始，截取到字符串结尾
						
						var selected = '';
						if ( (isnewcopy == true && optVal == inputTxt ) || 
							 (isnewcopy == false && optTxt == inputTxt)) {
							selected = "selected = 'selected'";
						}
						
						options += "<option role='option' value='" + optVal + "'>";
						options += optTxt + "</option>";
					}
					
					if("brand" == colNames[i].name){
						html_value1 += "<td role='gridcell' style='text-align:center;' title='' aria-describedby='grid_"+colNames[i].name+"'>" +
	      				"<select role='select' id='"+cl+"_"+colNames[i].name+"' name='"+colNames[i].name+"' rowid='"+cl+"' size='1' class='editable inline-edit-cell ui-widget-content ui-corner-all' style='width: 96%;' onChange='changeEvent("+cl+",this.value)'>" + 
	      				options + "</td>" ;	
					}else{
						html_value1 += "<td role='gridcell' style='text-align:center;' title='' aria-describedby='grid_"+colNames[i].name+"'>" +
	      				"<select role='select' id='"+cl+"_"+colNames[i].name+"' name='"+colNames[i].name+"' rowid='"+cl+"' size='1' class='editable inline-edit-cell ui-widget-content ui-corner-all' style='width: 96%;'>" + 
	      				options + "</td>" ;	
					}
				} else {
					html_value1 += "<td role='gridcell' style='text-align:center;' title='' aria-describedby='grid_"+colNames[i].name+"'>" +
    				"<input type='text' id='"+cl+"_"+colNames[i].name+"' name='"+colNames[i].name+"' rowid='"+cl+"' value='" + inputTxt + "' role='textbox' class='editable inline-edit-cell ui-widget-content ui-corner-all' style='width: 96%;'>" + 
    				"</td>" ;					
				}

			}else{
				if(colNames[i].hidden){
					html_value1 += "<td role='gridcell' style='display:none;' title='' aria-describedby='grid_"+colNames[i].name+"'>"+rowData[colNames[i].name]+"</td>"; // 监控表的seq已经通过页面再次获得
				}else{
					
					if(colNames[i].name == "actions"){
						html_value1 +=  "<td role='gridcell' style='text-align:center;' title='' aria-describedby='grid_actions'>" +
								       		save+cancel + edit + del + add + update + cancel_normal
									    "</td>"  ;
					}else{
						html_value1 += "<td role='gridcell' style='' title='' aria-describedby='grid_"+colNames[i].name+"'>" + cl + "</td>" ;
					}
				}
			}
		}
		
	}
	
	return html_value1 + "</tr>";
}
//单击行内新增按钮后的 取消动作
function cancelSaveStuImptProdt(id) {
	undisabledBtn(grid, model);
	$("#" + id).remove();
}
//单击行内新增按钮后的保存动作
function saveStuImptProdt(id){	
	updatecommit(id,0);
}
//************************** 新增 ******************************

//操作发送请求
//删除按钮
function deleteStuImptProdt(id) {	
	if( !confirm('确认删除该条记录?') ) {
		retrun;
	}
	
	var postData={};
	postData["id"]= id;
	postData["oper"] = "del";
	$.ajax({
		type : 'post',
		url : '../zdKpiGoalVal/oper.do',
		async : false,
		data : postData,
		dataType : 'json',
		success : function(result, textStatus) {
			alert(result.msg);
			jqgridReload();
		},
	    error: function(result,textStatus){
	    	alert(result.msg);
	    }
	});
} 

//falg取值范围 {0:增加记录  1：删除记录  2：修改记录}
function updatecommit(id, flag) {
	lastPos = id; // 记录最后改动的行位置
	
	var postData={};
	
	var rowData = $("#list").jqGrid('getRowData',id);
	var colNames=$("#list").jqGrid('getGridParam','colModel');  
	for(var i=0;i<colNames.length;i++){
		if(colNames[i].editable){
			postData[colNames[i].name]= $("#"+id+"_"+colNames[i].name).val();
		}else{
			postData[colNames[i].name]= rowData[colNames[i].name];
		}
	}

	var ret = checkpostdata(postData);
	if (ret[0] == false) {
		alert(ret[1]);
		return;
	}
	
	// 0:增加记录  1：删除记录  2：修改记录
	if(flag == 0){ 
		postData["oper"] = "add";
	} else if (flag == 2) {
		postData["oper"] = "edit";
	}
	$.ajax({
	   type: 'post',
	   url: '../zdKpiGoalVal/oper.do',
	   data: postData,
	   async: false,
	   dataType: 'json',
	   success: function(result,textStatus){
		   alert(result.msg);
		   jqgridReload();
	   },
	   error: function(result,textStatus){
		   alert(result.msg);
	   }
	});
}

//检查post data
var checkpostdata= function(postdata){		
	
	var regmoney = /^20\d{2}$/; // 年份校验正则表达式
	var bret = true;
	var strRet = "";
	
	for(var p in postdata){//遍历json数组时，这么写p为索引，0,1
		var name = p;
		var value = postdata[p];
		
		if (name == "year") {
			if (value == null || value == undefined || value == ''){
				bret = false;
				strRet += " [年份不能为空]";	
			} else {
				if (!regmoney.test(value)){
					 bret = false;
					 strRet += " [年份格式非法]";
				 }
			}
		} else if (name == "quarter") {
			if (value == null || value == undefined || value == ''){
				 bret = false;
				 strRet += " [季度不能为空 ]";
			}		
		} else if (name == "city") {
			if (value == null || value == undefined || value == ''){
				bret = false;
				strRet += " [品牌不能为空 ]";
			}		
		} 
	}
	
	if (bret == false) {
		return [false, strRet];
	}
	
	return [true, ""];
}
