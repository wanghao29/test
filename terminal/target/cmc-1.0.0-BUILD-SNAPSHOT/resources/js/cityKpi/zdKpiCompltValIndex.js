$(document).ready(function() {
    //顶部菜单切换
    $("#menu li").attr("class","drop");
    $("#zdKpiCompltVal").attr("class","active");
	// 带搜索的下拉框样式初始化
	$('.select_searchable').searchableSelect();
	
	// 时间控件设置初始时间
	var myDate = new Date();	
	var year = myDate.getFullYear(); 
	$(".currentYear").val(year);
	
	// 城市下拉框初始化
	citySelectInit($('#citySelect'));
	// 顶部菜单切换
	// $("#menu li").attr("class","drop");
	// $("#customerChannel").attr("class","active");

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
	data["city"] = $("#city").val();
	return data;
};
function jqgridInit() {
	grid = jQuery("#list").jqGrid({
		url : "../zdKpiCompltVal/list.do",
		mtype : 'post',
		datatype : "json",
		loadonce : true, // 一次性加载
		gridview : true, // 增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
		postData : getparam(),
		rowNum : 50,
		rowList : [ 5, 10, 30, 50 ],
		//rownumbers : true, // 行首添加顺序编码
		rownumWidth : 40, // 行首添加顺序编码的列宽
		autowidth : true, // 表格宽度 刚加载时自动适应父div ,然后随列调整宽度
		height : "100%", // 表格宽度自动适应行数
		sortorder : "asc", // 指定列排序的次序
		viewrecords : true, // 显示当前记录，和总记录数
		sortname : 'id', // 默认排序
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
       	
		// 编辑框切换到文本框时触发
		onCellSelect : function(rowid, iCol, cellcontent, e) {
		},
		
		// 编辑单元格
		//cellEdit : true,
		//cellsubmit : 'rclientArray',
		// 点击可编辑的框时触发
		afterEditCell : function(rowid, cellname, value, iRow, iCol) {
			lastValue = value
		},		
		// 保存前触发
		beforeSaveCell : function(rowid, cellname, value, iRow, iCol) { // 行id,单元格名称,单元格值
			return false;
		},
		afterSaveCell : function(rowid, name, val, iRow, iCol) { // 需要解决的问题，为什么触发不了
			alert("afterSaveCell");
		},

		colNames : ['操作','id',
		            '年度','季度','地市','三月以上应收占比指标—应收账款金额总计（元）','三月以上应收占比指标—0-180天金额（元）',
		            '三月以上应收占比指标—0-180天占比','三月以上应收占比指标—0-180天得分','三月以上应收占比指标—180以上金额（元）',
		            '三月以上应收占比指标—180以上占比','三月以上应收占比指标—180以上得分','三月以上应收占比指标—总分',
		            '零售侧双渠道指标-销量（万台）','零售侧双渠道指标-税前净利润（万元）','新零售门店运营-分值','售后净利（万）',
		            '智能硬件毛利率','有效客户规模扣分项-有效客户规模量'],
		colModel : [
		{
			name:'actions', 
			index: 'actions',
			width: 200,
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
			sorttype : "int",
			hidden:true
		},{
			name : 'year',
			index : 'year',
			sorttype : "string",
			editable : true,
			width : 80
		}, {
			name : 'quarter',
			index : 'quarter',
			sorttype : "string",
			editable : true,
			width : 120
		}, {
			name : 'city',
			index : 'city',
			sorttype : "string",
			editable : true,
			width : 80
		}, {
			name : 'account',
			index : 'account',
			editable : true,
			sorttype : "float"
		}, {
			name : 'accountIn180',
			index : 'accountIn180',
			editable : true,
			sorttype : "float"
		}, {
			name : 'proportionIn180',
			index : 'proportionIn180',
			editable : true,
			sorttype : "float"
		}, {
			name : 'scoreIn180',
			index : 'scoreIn180',
			editable : true,
			sorttype : "float"
		}, {
			name : 'accountOut180',
			index : 'accountOut180',
			editable : true,
			sorttype : "float"
		}, {
			name : 'proportionOut180',
			index : 'proportionOut180',
			editable : true,
			sortable : "float"
		}, {
			name : 'scoreOut180',
			index : 'scoreOut180',
			editable : true,
			sorttype : "float"
		}, {
			name : 'score',
			index : 'score',
			editable : true,
			sorttype : "float"
		}, {
			name : 'retailSales',
			index : 'retailSales',
			editable : true,
			sorttype : "float"
		}, {
			name : 'retailPretaxProfits',
			index : 'retailPretaxProfits',
			editable : true,
			sorttype : "float"
		}, {
			name : 'shopScore',
			index : 'shopScore',
			editable : true,
			sorttype : "float"
		}, {
			name : 'saleProfits',
			index : 'saleProfits',
			editable : true,
			sorttype : "float"
		}, {
			name : 'hardwareGpr',
			index : 'hardwareGpr',
			editable : true,
			sorttype : "float"
		}, {
			name : 'efctCustAccount',
			index : 'efctCustAccount',
			editable : true,
			sorttype : "float"
		}
		]
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
		url : '../zdKpiCompltVal/oper.do',
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
	   url: '../zdKpiCompltVal/oper.do',
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


