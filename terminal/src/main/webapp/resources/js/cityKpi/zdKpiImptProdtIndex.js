
var model ="ImptProdt";
var grid = null;

$(document).ready(function() {
    //顶部菜单切换
    $("#menu li").attr("class","drop");
    $("#zdKpiImptProdt").attr("class","active");
	// 带搜索的下拉框样式初始化
	$('.select_searchable').searchableSelect();
	
	// 时间控件设置初始时间
	var myDate = new Date();	
	var year = myDate.getFullYear(); 
	$(".currentYear").val('2018');
	
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
	data["year"] = $("#year").val();
	data["quarter"] = $("#quarter").val();
	return data;
};
function jqgridInit() {
	grid = jQuery("#list").jqGrid({
		url : "../zdKpiImptProdt/list.do",
		mtype : 'post',
		datatype : "json",
		loadonce : true, // 一次性加载
		gridview : true, // 增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
		postData : getparam(),
		rowNum : 10,
		rowList : [ 5, 10, 30, 50 ],
		rownumbers : true, // 行首添加顺序编码
		rownumWidth : 60, // 行首添加顺序编码的列宽
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
			id : "id",
			userdata : "userdata",
		},
		pager : '#pager', //指定分页组件所在div id 
		pagination : true,
		caption : "",

		// 编辑单元格
		//cellEdit : true,
		//cellsubmit : 'clientArray',
		// 编辑框切换到文本框时触发
		onCellSelect : function(rowid, iCol, cellcontent, e) {
		},
		// 点击可编辑的框时触发
		afterEditCell : function(rowid, cellname, value, iRow, iCol) {
			lastValue = value
		},
		// 保存前触发
		beforeSaveCell : function(rowid, cellname, value, iRow, iCol) {
			return value;
		},
		afterSaveCell : function(rowid, name, val, iRow, iCol) {
			
		},
		colNames : ['ID','年度','季度','品牌','机型','目标值','操作'],
		colModel : [{
			name : 'id',
			index : 'id',
			sorttype : "int",
			hidden:true
		},{
			name : 'year',
			index : 'year',
			sorttype : "string",
			editable : true,
			width : 40
		}, {
			name : 'quarter',
			index : 'quarter',
			sorttype : "string",
			editable : true,
			width : 70,
			edittype : "select",editoptions : {value : "第一季度:第一季度;第二季度:第二季度;第三季度:第三季度;第四季度:第四季度"}
		}, {
			name : 'brand',
			index : 'brand',
			sorttype : "string",
			editable : true,
			width : 70,
			edittype : "select",
			editoptions : {
				value : getBrand(),
				dataEvents: [{
					type: 'change',                 //下拉选择的时候  
	                fn: function (e) {              //触发方法  
	                	//获取当前下拉框的id名字（这是点击编辑按钮时才需要的，因为点击编辑按钮后，schoolName的下拉框会变成1_brand,其中”1“是行号）  
	                 	//$('#btn').trigger('click');
	                	$(this).parent().next().trigger('click');
	                	var row = $(e.target).closest('tr.jqgrow');
	                    getModel(row.attr('id'),this.value);
	                }  
				}]
			}
		}, {
			name : 'model',
			index : 'model',
			sorttype : "string",
			editable : true, 
			width : 150,
			edittype:"select", 
			editoptions:{value: "请选择型号:请选择型号"}
		}, {
			name : 'goalVal',
			index : 'goalVal',
			sorttype : "float",
			editable : true, 
			width : 80
		}, {
			name:'actions', 
			index: 'actions',
			width: 40,
			align: 'center',
     	   	formatter:function(cellvalue, options, rowObject){
     	   		if("add"==cellvalue){
     	   			var add = "<button class='ui-pg-div ui-pg-button ui-corner-all ui-state-hover' id='addBtn' type='button' value='' " +
     	   					"onclick='addCommit()' title='保存'><span class='ui-icon ui-icon-disk'></span></button>";
     	   			var cancel = "<button class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover' id='cancelSaveBtn' " +
     	   					"onclick='canceAdd()' title='取消'><span class='ui-icon ui-icon-cancel'></span></button>";
     	   			
     	   			return add+cancel;
     	   		}else{
     	   			return jqgridCustomAction(options.rowId,model);
     	   		}
			}
        }]
	});
	
	jQuery("#list").jqGrid('navGrid',"#pager",{edit:false,add:true,del:false,search:false,view:false,refresh:false,addfunc:add});
}

var parameters =
{
    rowID : "new_row",
    initdata : {"actions":"add"},
    position :"first",
    useDefValues : false,
    useFormatter : false,
    addRowParams : {extraparam:{}}
}

//单击分页工具栏的新增按钮
function add(){
	$("#list").jqGrid('addRow', parameters);
}

//单击分页工具栏新增按钮后的取消按钮
function canceAdd(){
	jqgridReload();
}

//单击编辑按钮
function editStuImptProdt(id){
	$('#list').setGridParam().showCol("quarter");
	$("#list").setGridWidth($(window).width());
	
	// 允许 文本可编辑，下拉列表框可选
	$(":text").attr("disabled", false);
	$("select").attr("disabled", false);
	
	hideBtn(id,model);
	disabledBtn(grid,model);
	$('#list').jqGrid('editRow',id,true);
}

//单击取消按钮
function canceEditlStuImptProdt(id){
	$("#list").setGridWidth($(window).width());
	
	undisabledBtn(grid ,model);
	grid.jqGrid('editRow',id,false);
}

function addStuImptProdt(id){
	$("#list").setGridWidth($(window).width());
	
	// 允许 文本可编辑，下拉列表框可选
	$(":text").attr("disabled", false);
	$("select").attr("disabled", false);
	
	disabledBtn(grid,model);
	var currentRow=("tr[id=" + id + "]"); 
	var html_value1 = jqgridCustomAddRow($("#list"),id,model);
	$("#list").find(currentRow).after(html_value1);	
};

//点击分页工具栏新增按钮后的保存动作
function addCommit(){
	var postData={};
	postData["oper"] = "add";
	postData['year']= $("#new_row_year").val();
	postData['quarter']= $("#new_row_quarter").val();
	postData['brand']= $("#new_row_brand").val();
	postData['model']= $("#new_row_model").val();
	postData['goalVal']= $("#new_row_goalVal").val();
	
	var ret = checkpostdata(postData);
	if (ret[0] == false) {
		alert(ret[1]);
		return;
	}
	
	$.ajax({
	   type: 'post',
	   url: '../zdKpiImptProdt/save.do',
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
	} else {
		postData["oper"] = "";
	}
	$.ajax({
	   type: 'post',
	   url: '../zdKpiImptProdt/save.do',
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

//单击编辑按钮后的保存动作
function updateStuImptProdt(id){
	updatecommit(id,2);
}

//单击行内新增按钮后的保存动作
function saveStuImptProdt(id){	
	updatecommit(id,0);
}

//单击行内新增按钮后的 取消动作
function cancelSaveStuImptProdt(id) {
	undisabledBtn(grid, model);
	$("#" + id).remove();
}
 
//单击编辑按钮后的 取消动作 
function canceEditlStuImptProdt(id) {
	$('#list').jqGrid('restoreRow', id);
	showBtn(id,model);
	undisabledBtn(grid,model);
}

//单击删除按钮
function deleteStuImptProdt(id) {
	
	if( !confirm('确认删除该条记录?') ) {
		retrun;
	}
	
	$.ajax({
		type : 'post',
		url : 'del/'+id+'.do',
		async : false,
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
// end

//获取品牌
function getBrand(){

	var brand = "请选择品牌:请选择品牌;";

 	var i = 0;
 	$.ajax({
 		async: false,  //千万要记住加这个属性配置
 		type: "post",
 		datatype: 'json',
 		url: "../brandEnty/brands.do",
 		success: function(data) {
 			for(i; i < data.length; i++) {
 				if(i != data.length - 1) {
 					brand += data[i] + ":" + data[i] + ";";
 				} else {
 					brand += data[i] + ":" + data[i];
 				}
 			}
 		}
 	});
 	return brand;
} 

//获取机型
function getModel(selectNum, brand) {
    var str = ""; //用来存放option值  
    $("select#model").empty();
    $("select#" + selectNum + "_model").empty(); 
    
    if (brand == '请选择品牌') {  
        str += "<option>" + "请选择机型" + "</option>";  
    }else {
        $.ajax({  
            url: "../brandEnty/doubles.do",  
            type: "post", 
            async: false,  
            cache: false,  
            dataType: "json",  
            data: {  
            	roleid: brand 
            },  
            success: function (result) {
                if (result.length > 0) {  
                    for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象  
                        str += "<option value='" + result[i] + "'>" + result[i] + "</option>"; 
                    }  
                } else {  
                    str += "<option>" + "该品牌下暂无机型" + "</option>";  
                }  
            }  
        });
    }
    
    var term_mdl_nam2 = $("select#"+selectNum+"_model");
    term_mdl_nam2.append(str);//渲染option
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
		} else if (name == "brand") {
			if (value == null || value == undefined || value == ''){
				bret = false;
				strRet += " [品牌不能为空 ]";
			}		
		} else if (name == "model") {
			if (value == null || value == undefined || value == ''){
				bret = false;
				strRet += " [机型不能为空 ]";
			}		
		}
	}
	
	if (bret == false) {
		return [false, strRet];
	}
	
	return [true, ""];
}

function changeEvent(id,val){
	getModel(id, val);
}


function jqgridCustomAction(rowId,model){
	var cl =   rowId;
	var	edit = "<button class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover' id='editBtn"+model+cl+"' type='button' value='' onclick='editStu"+model+"("
	+ cl + ")' title='编辑'><span class='ui-icon ui-icon-pencil'></span></button>";
	
	var	del = "<button class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover'  id='deleteBtn"+model+cl+"' type='button' value='' onclick='deleteStu"+model+"("
		+ cl + ")' title='删除'><span class='ui-icon ui-icon-trash'></span></button>";
	
	var	add = "<button class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover'   id='addBtn"+model+cl+"'  onclick='addStu"+model+"("
		+ cl + ")' title='插入'><span class='ui-icon ui-icon-plus'></span></button>";
	var update = "<button style='display:none' class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover'  id='updateBtn"+model+cl+"' type='button' value='' onclick='updateStu"+model+"("+ cl + ")' title='保存'><span class='ui-icon ui-icon-disk'></span></button>";
	var cancel = "<button  style='display:none'  class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover' id='cancelEditBtn"+model+cl+"'  onclick='canceEditlStu"+model+"("
	+ cl + ")' title='取消'><span class='ui-icon ui-icon-cancel'></span></button>";
	
	return edit + del + add + update + cancel ;
}

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

