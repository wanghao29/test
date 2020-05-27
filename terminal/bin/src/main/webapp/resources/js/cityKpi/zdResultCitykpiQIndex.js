var model ="CityKpi";
var grid = null;

$(function(){
    //顶部菜单切换
    $("#menu li").attr("class","drop");
    $("#zdResultCitykpiQ").attr("class","active");
	// 带搜索的下拉框样式初始化
	$('.select_searchable').searchableSelect();
	
	// 时间控件设置初始时间
	var myDate = new Date();	
	var year = myDate.getFullYear(); 
	$(".currentYear").val(year);
	
	$("#query").click(function(){
		$('#list').setGridParam({shrinkToFit:true});
		jqgridReload();
	});
	
	jqgridInit(); 
	
	//指标勾选框点击事件
    $("input.type1,input.type3,input.type4,input.type5,input.type6").change(function(){
    	var isChecked = $(this).prop("checked");
    	var col = $(this).val();
    	//获取勾选的字段值
		var fieldArr = [];
		$("input[name='field']:checked").each(function(){
			fieldArr.push(this.value);
     	});
		var colArr = [];
     	$.each(fieldArr, function(){
     		colArr.push(col+'_'+this);
     	});
    	
    	if(isChecked){
    		jQuery("#list").setGridParam().showCol(colArr);
    	}else{
    		jQuery("#list").setGridParam().hideCol(colArr);
    	}   	
    	jqgrid_colChange("list");    	
    });
	
	//字段勾选框点击事件
	$("input.type2").change(function(){
    	var isChecked = $(this).prop("checked");
    	var col = $(this).val();
    	//获取勾选的指标值
		var kpidArr = [];
		$("input[name='kpi']:checked").each(function(){
			kpidArr.push(this.value);
     	});
		var colArr = [];
     	$.each(kpidArr, function(){
     		colArr.push(this+'_'+col);
     	});
    	if(isChecked){
    		jQuery("#list").setGridParam().showCol(colArr);
    	}else{
    		jQuery("#list").setGridParam().hideCol(colArr);
    	}   	
    	jqgrid_colChange("list");
    });

    //全选取消
    var arr = ['type1','type3','type4','type5','type6'];
    for(var h=0; h<arr.length; h++){
    	var cls = arr[h];
    	var all_cls = cls+"_all";
    	quanxuan(all_cls,cls);
    }
   
/*    //指标全选
	$(".type1_all,.type3_all,.type5_all,.type4_all,.type6_all").click(function(){
		var isChecked = $(this).prop("checked");
		$(".type1").prop("checked",isChecked);
		
		//获取勾选的字段值
		var fieldArr = [];
		$("input[name='field']:checked").each(function(){
			fieldArr.push(this.value);
     	});
		
     	var jqgridId = "list";
     	var cols = [];
    	$(".type1").each(function(){
         	var col = $(this).val();
         	var colArr = [];
         	$.each(fieldArr, function(){
         		colArr.push(col+'_'+this);
         	});
         	cols.push.apply(cols,colArr);
    	});

    	if(isChecked){
       		jQuery("#"+jqgridId).setGridParam().showCol(cols);		
    	}else{
       		jQuery("#"+jqgridId).setGridParam().hideCol(cols);		
    	} 
	});*/
    
    //字段全选
	$(".type2_all").click(function(){
		var isChecked = $(this).prop("checked");
		$(".type2").prop("checked",isChecked);
		
		//获取勾选的指标值
		var kpidArr = [];
		$("input[name='kpi']:checked").each(function(){
			kpidArr.push(this.value);
     	});
		
     	var jqgridId = "list";
     	var cols = [];
    	$(".type2").each(function(){
         	var col = $(this).val();
         	var colArr = [];
         	$.each(kpidArr, function(){
         		colArr.push(this+'_'+col);
         	});
         	cols.push.apply(cols,colArr);
    	});  

    	if(isChecked){
       		jQuery("#"+jqgridId).setGridParam().showCol(cols);	
    	}else{
       		jQuery("#"+jqgridId).setGridParam().hideCol(cols);	
    	} 
    	
    	jqgrid_colChange("list");
	});
	
	
});

//全选取消
function quanxuan(type_all,type){
	$("."+type_all).click(function(){
		var isChecked = $(this).prop("checked");
		$("."+type).prop("checked",isChecked);
		
		//获取勾选的字段值
		var fieldArr = [];
		$("input[name='field']:checked").each(function(){
			fieldArr.push(this.value);
     	});
		
     	var jqgridId = "list";
     	var cols = [];
    	$("."+type).each(function(){
         	var col = $(this).val();
         	var colArr = [];
         	$.each(fieldArr, function(){
         		colArr.push(col+'_'+this);
         	});
         	cols.push.apply(cols,colArr);
    	});

    	if(isChecked){
       		jQuery("#"+jqgridId).setGridParam().showCol(cols);		
    	}else{
       		jQuery("#"+jqgridId).setGridParam().hideCol(cols);		
    	} 
    	
    	jqgrid_colChange("list");
	});
	
	
} 

function pageInit() {

}

function getparam_normalModal(){
	var data = {};
	data["year"] = $("#year").val();
	data["quarter"] = $("#quarter").val();
	return data;
}

function jqgridReload(){
	jqgrid_reload("list",getparam_normalModal());
};

function list_setGroupHeaders(){
	  jQuery("#list").jqGrid('destroyGroupHeader');
	  //合并最顶表头
	  
	  jQuery("#list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
            {startColumnName: 'operationCenter', numberOfColumns: 4, titleText: '考核对象'},
		    {startColumnName: 'xl_YGoal', numberOfColumns: 56, titleText: '规模指标'},		    
		    {startColumnName: 'hykhmbz_YGoal', numberOfColumns: 24, titleText: '渠道指标'},			    
		    {startColumnName: 'sgyyschyzzb_YGoal', numberOfColumns: 16, titleText: '运营效率指标'},		    
		    {startColumnName: 'lscsqdxl_YGoal', numberOfColumns: 56, titleText: '加减分项指标'},
		    {startColumnName: 'zdsxkfx_YGoal', numberOfColumns: 8, titleText: '重点扣分项指标'}]  
	  });
	  jQuery("#list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[			
		    {startColumnName: 'xl_YGoal', numberOfColumns: 8, titleText: '销量'},
		    {startColumnName: 'xse_YGoal', numberOfColumns: 8, titleText: '销售额'},
		    {startColumnName: 'znyjsr_YGoal', numberOfColumns: 8, titleText: '智能硬件收入'},
		    {startColumnName: 'zzppsjsr_YGoal', numberOfColumns: 8, titleText: '自主品牌手机收入'},
		    {startColumnName: 'zzppfpeznyjsr_YGoal', numberOfColumns: 8, titleText: '自主品牌非配额智能硬件收入'},
		    {startColumnName: 'zzpppeznyjsr_YGoal', numberOfColumns: 8, titleText: '自主品牌配额智能硬件收入'},
		    {startColumnName: 'zdcpxl_YGoal', numberOfColumns: 8, titleText: '重点产品销量'},
		    
		    {startColumnName: 'hykhmbz_YGoal', numberOfColumns: 8, titleText: '活跃客户目标值'},	
		    {startColumnName: 'kawxkhxl_YGoal', numberOfColumns: 8, titleText: 'KA维系客户销量'},
		    {startColumnName: 'zxhykhs_YGoal', numberOfColumns: 8, titleText: '中小活跃客户数'},
		    
		    {startColumnName: 'sgyyschyzzb_YGoal', numberOfColumns: 8, titleText: '三个月以上存货原值占比'},
		    {startColumnName: 'sgyysyszkzb_YGoal', numberOfColumns: 8, titleText: '三个月以上应收账款占比'},
		    
		    {startColumnName: 'lscsqdxl_YGoal', numberOfColumns: 8, titleText: '零售侧双渠道销量'},
		    {startColumnName: 'lscsqdjlr_YGoal', numberOfColumns: 8, titleText: '零售侧双渠道净利润'},
		    {startColumnName: 'xlsmdyy_YGoal', numberOfColumns: 8, titleText: '新零售门店运营'},
		    {startColumnName: 'shjl_YGoal', numberOfColumns: 8, titleText: '售后净利'},
		    {startColumnName: 'zzppxsejfx_YGoal', numberOfColumns: 8, titleText: '自主品牌销售额加分项'},
		    {startColumnName: 'znyjmll_YGoal', numberOfColumns: 8, titleText: '智能硬件毛利率'},
		    {startColumnName: 'yhkhgmkfx_YGoal', numberOfColumns: 8, titleText: '有效客户规模扣分项'},
		    
		    {startColumnName: 'zdsxkfx_YGoal', numberOfColumns: 8, titleText: '重大事项扣分项'}]  
	  });
}

function jqgrid_init_groupSummary(tableId,pager,url,params,colNames,colModel,sortname){
	grid = jQuery("#"+tableId).jqGrid({
        url:url,
        mtype:'post',
        datatype: "json",
        loadonce:true,     //一次性加载
        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
        postData:params,	        
        colNames : colNames,	        
        colModel : colModel,
	        
        gridComplete:function(){//表格加载执行 
            try {
           	 eval(tableId+"_setGroupHeaders");
       		 var setGroupHeaders = eval(tableId+"_setGroupHeaders");
       		 setGroupHeaders();
            }catch(err){
           	 
            }
        	 
            setTimeout(function(){jqgrid_setGridWidth(tableId)},100);
        	 
        	 $(window).resize(function(){  
        		 jqgrid_setGridWidth(tableId);
             });
       	},  
       	
        rowNum:50,        
        rowList : [10,30,50], 
        rownumbers: false,    //行首添加顺序编码
        rownumWidth: 60,     //行首添加顺序编码的列宽
        autowidth: true,     //表格宽度 刚加载时自动适应父div   ,然后随列调整宽度
        height : "100%",     //表格宽度自动适应行数
        sortorder: "asc",    //指定列排序的次序
        viewrecords : true,  //显示当前记录，和总记录数 
        sortname: sortname,  //默认排序
        repeatitems: true,   //是否可重复
        forceFit:false,      //当为ture时，调整列宽度不会改变表格的宽度。当shrinkToFit 为false时，此属性会被忽略
        shrinkToFit:false,    //可伸缩, true时使列宽可调整   false时设置的水平滚动才有效/也可能留出空白右侧	        
        autoScroll:false,    //false,宽度超出才展示滚动条
        jsonReader: {        //描述json 数据格式的数组,需修改
        	root: 'list',
	    	page: 'current',        // json中代表当前页码的数据
	    	total: "pages",         // json中代表页码总数的数据
	    	records: "total",       // json中代表数据行总数的数据
	    	repeatitems: false,     // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
	    	cell: "cell",
	    	id: "fRoleId",
	    	userdata: "userdata", 
	    }, 
        pager: '#'+pager,     //指定分页组件所在div id 
        pagination: true,
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
		
        grouping:true,
       	groupingView : {
       		groupField : ['operationCenter'], //分组属性
       		groupSummary : [true],
       		groupColumnShow : [true],         //是否显示分组列
       		groupText : ['<b>{0}</b>'],       //表头显示数据(每组中包含的数据量)
       		groupCollapse : false,            //加载数据时是否只显示分组的组信息
    		groupOrder: ['asc']
       	},
        caption : ""
	});
};

var first = true;
function vagueQuery(kpiname,year,quarter,city){
	
	var data = {kpiname:kpiname,year:year,quarter:quarter,city:city};
	$.ajax({
	    type: "post",
	    url:  "../zdResultCitykpiQ/extraList.do",
	    contentType: 'application/json',
	    data : JSON.stringify(data),
	    dataType: "json",
	    async: false,
	    success: function(result){
	    	$('#vagueQueryModal').modal('show');
	    	if(first){
	    		extraJqgridInit(result);
	    		first = false;
	    	}else{
	    		extraJqgridReload(result);
	    	} 
	    	
	    	
	    	if('重点产品销量'==kpiname){
	    		$("#extraList").setGridParam().hideCol(['type2','subtype2','type3']);
	    		$("#extraList").setGridParam().showCol(['type','subtype','cntbm','unitscore']);
	    	}else if('三个月以上存货原值占比'==kpiname){
	    		$("#extraList").setGridParam().hideCol(['type','subtype','cntbm','unitscore','type3']);
	    		$("#extraList").setGridParam().showCol(['type2','subtype2']);
	    	}else if('三个月以上应收账款占比'==kpiname){
	    		$("#extraList").setGridParam().hideCol(['type','subtype','cntbm','unitscore','type2','subtype2']);
	    		$("#extraList").setGridParam().showCol(['type3']);
	    	}
	    }
	});
}

function extraJqgridInit(data) {
	jQuery("#extraList").jqGrid({
		datatype : "local",
        data:data, 
		//rowNum : 10,
		//rowList : [ 5, 10, 30, 50 ],
		rownumbers : true, // 行首添加顺序编码
		rownumWidth : 30, // 行首添加顺序编码的列宽
		autowidth : true, // 表格宽度 刚加载时自动适应父div ,然后随列调整宽度
		height : "100%",     //表格宽度自动适应行数
        width:"90%",
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
			//page : "current", // json中代表当前页码的数据
			//total : "pages", // json中代表页码总数的数据
			records : "total", // json中代表数据行总数的数据
			repeatitems : false, // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
			cell : "cell",
			id : "fRoleId",
			userdata : "userdata",
		},
		//pager : '#pager', //指定分页组件所在div id 
		//pagination : true,
		caption : "",

		// 编辑单元格
		cellEdit : true,
		cellsubmit : 'rclientArray',
		// 编辑框切换到文本框时触发
		onCellSelect : function(rowid, iCol, cellcontent, e) {
		},
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
		
        gridComplete:function(){//表格加载执行 
        	setTimeout(function(){
        		var wid = $("#extraList_table_container").width();
        		$("#extraList").setGridWidth(wid);
        	},200);
        	
      	}, 

		colNames : ['年份','季度','地市',
		            '品牌','机型',                                  //重点产品销量
		            '月份','类型',                                 //三个月以上存货原值占比
		            '区间',                                         //三个月以上应收账款占比
		            '季度目标值','季度完成值','季度完成率','得分',
		            '地市重点产品数','重点产品单元分值'               //重点产品销量
		            ],
		colModel : [
			{name : 'year',sorttype : "string"}, 
			{name : 'quarter',sorttype : "string"}, 
			{name : 'city',sorttype : "string"}, 
			
			//重点销量
			{name : 'type',sorttype : "string"}, 
			{name : 'subtype',sorttype : "string"}, 
			//三个月以上存货原值占比
			{name : 'subtype2',sorttype : "string"},
			{name : 'type2',sorttype : "string"}, 			 
			//三个月以上应收账款占比
			{name : 'type3',sorttype : "string",
				formatter:function(cellvalue, options, rowObject) {
			    if(cellvalue == "in180"){
			        return "1-180天";
			    }else{
			        return "180天以上";
			    }
			}
			}, 

			
			{name : 'qgoal',sorttype : "float",formatter:"number"},
			{name : 'qvalue',sorttype : "float",formatter:"number"},
			{name : 'qrate',sorttype : "float",formatter:"number"},
			{name : 'score',sorttype : "float",formatter:"number"},
			
			//重点销量
			{name : 'cntbm',sorttype : "float",formatter:"number"},
			{name : 'unitscore',sorttype : "float",formatter:"number"}
		]
	});
}

function extraJqgridReload(newdata){
	$("#extraList").jqGrid('clearGridData');  //清空表格
	$("#extraList").jqGrid('setGridParam',{  // 重新加载数据
	      datatype:'local',
	      data : newdata,   //  newdata 是符合格式要求的需要重新加载的数据 
	}).trigger("reloadGrid");
}

function jqgridEditAction(rowId,model){
	var cl = rowId;
	var	edit = "<button class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover' id='editBtn"+model+cl+"' type='button' value='' onclick='editStu"+model+"("
	+ cl + ")' title='编辑'><span class='ui-icon ui-icon-pencil'></span></button>";
	var update = "<button style='display:none' class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover'  id='updateBtn"+model+cl+"' type='button' value='' onclick='updateStu"+model+"("+ cl + ")' title='保存'><span class='ui-icon ui-icon-disk'></span></button>";
	var cancel = "<button  style='display:none'  class='ui-pg-div ui-pg-button ui-corner-all  ui-state-hover' id='cancelEditBtn"+model+cl+"'  onclick='canceEditlStu"+model+"("
	+ cl + ")' title='取消'><span class='ui-icon ui-icon-cancel'></span></button>";
	
	return edit + update + cancel ;
}

function editStuCityKpi(id){
	
	$('#list').setGridParam({shrinkToFit:false});
	$('#list').setGridParam().showCol("quarter");
	$("#list").setGridWidth($(window).width());
	
	// 允许 文本可编辑，下拉列表框可选
//	$(":text").attr("disabled", false);
//	$("select").attr("disabled", false);
	
	hideBtn(id,model);
	disabledBtn(grid,model);
	$('#list').jqGrid('editRow',id,true);
}

function canceEditlStuCityKpi(id){
	$('#list').setGridParam({shrinkToFit:true});
	$("#list").setGridWidth($(window).width());
	
	undisabledBtn(grid ,model);
	grid.jqGrid('editRow',id,false);
}

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
	   url: '../zdResultCitykpiQ/save.do',
	   contentType: 'application/json',
	   data: JSON.stringify(postData),
	   async: false,
	   dataType: 'json',
	   success: function(result,textStatus){
		   alert(result.msg);
		   showBtn(id,model);
		   undisabledBtn(grid,model);
		   
		   $(grid).jqGrid('resetSelection',id);
		   
		   if (flag == 0) {
			   // 对新增记录，要把数据库返回的seq刷新到页面上
			   var seq = result["seq"];
			   if (seq == null || seq == undefined || seq == '' ) {
				   alert("注意：由于页面上没有获得到当前新增记录的序列号，为了避免后续操作该记录出现异常，现在需要自动重新刷新一次数据，请确保页面是否有数据需要保存！");
				   $("#list").trigger('reloadGrid');
			   } else {
				   $("tr[id="+ id +"] > td[aria-describedby=grid_seq]").text(seq);
			   }
		   }
	   },
	   error: function(result,textStatus){
		   alert(result.msg);
	   }
	});
}

//单击编辑按钮后的保存动作
function updateStuCityKpi(id){
	$('#list').setGridParam({shrinkToFit:true});
	updatecommit(id,2);
}

//单击编辑按钮后的 取消动作 
function canceEditlStuCityKpi(id) {
	$('#list').setGridParam({shrinkToFit:true});
	$('#list').jqGrid('restoreRow', id);
	showBtn(id,model);
	undisabledBtn(grid,model);
}

function jqgridInit(){
	
	var colNames = ['操作','运营中心','年份','季度','地市',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分',
	                '全年目标值','全年完成值','全年完成率','季度目标值','季度完成值','季度完成率','时间进度','得分'];
	
	var colModel = [
	                {name:'actions',index: 'actions',align: 'center',
						formatter:function(cellvalue, options, rowObject){
							if("全省合计"==rowObject.city){
								return "";
							}else{
								return jqgridEditAction(options.rowId,model);
							}
						}
    				},
    				{name : 'operationCenter',	index : 'operationCenter', sorttype : 'string'},
	                {name : 'year', index : 'year', sorttype : "string",},
	                {name : 'quarter',	index : 'quarter', sorttype : "string",},
	                {name : 'city', index : 'city', sorttype : "string"},
	                 
	                //销量
	                {name : 'xl_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xl_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
	                {name : 'xl_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xl_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xl_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xl_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xl_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'xl_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					//销售额
					{name : 'xse_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xse_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xse_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xse_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xse_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xse_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xse_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'xse_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					//智能硬件收
					{name : 'znyjsr_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'znyjsr_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'znyjsr_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'znyjsr_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'znyjsr_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'znyjsr_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'znyjsr_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'znyjsr_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					//自主品牌手机收入
					{name : 'zzppsjsr_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppsjsr_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppsjsr_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppsjsr_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppsjsr_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppsjsr_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppsjsr_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppsjsr_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					//自主品牌非配额智能硬件收入
					{name : 'zzppfpeznyjsr_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppfpeznyjsr_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppfpeznyjsr_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppfpeznyjsr_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppfpeznyjsr_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppfpeznyjsr_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppfpeznyjsr_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppfpeznyjsr_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					//自主品牌配额智能硬件收入
					{name : 'zzpppeznyjsr_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzpppeznyjsr_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzpppeznyjsr_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzpppeznyjsr_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzpppeznyjsr_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzpppeznyjsr_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzpppeznyjsr_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzpppeznyjsr_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					//重点产品销量
					{name : 'zdcpxl_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zdcpxl_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zdcpxl_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zdcpxl_QGoal',sorttype : "string"},
					{name : 'zdcpxl_QValue',sorttype : "string"},
					{name : 'zdcpxl_QRate',sorttype : "string"},
					{name : 'zdcpxl_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'zdcpxl_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					
					//活跃客户目标值
					{name : 'hykhmbz_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'hykhmbz_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'hykhmbz_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'hykhmbz_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'hykhmbz_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'hykhmbz_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'hykhmbz_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'hykhmbz_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					//KA维系客户销量
					{name : 'kawxkhxl_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'kawxkhxl_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'kawxkhxl_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'kawxkhxl_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'kawxkhxl_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'kawxkhxl_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'kawxkhxl_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'kawxkhxl_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					//中小活跃客户数
					{name : 'zxhykhs_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zxhykhs_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zxhykhs_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zxhykhs_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zxhykhs_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zxhykhs_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zxhykhs_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'zxhykhs_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},

					//三个月以上存货原值占比
					{name : 'sgyyschyzzb_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'sgyyschyzzb_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'sgyyschyzzb_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'sgyyschyzzb_QGoal',sorttype : "string", width:80},
					{name : 'sgyyschyzzb_QValue',sorttype : "string", width:80},
					{name : 'sgyyschyzzb_QRate',sorttype : "string", width:80},
					{name : 'sgyyschyzzb_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'sgyyschyzzb_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					//三个月以上应收账款占比
					{name : 'sgyysyszkzb_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'sgyysyszkzb_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'sgyysyszkzb_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'sgyysyszkzb_QGoal',sorttype : "string", width:80},
					{name : 'sgyysyszkzb_QValue',sorttype : "string", width:80},
					{name : 'sgyysyszkzb_QRate',sorttype : "string", width:80},
					{name : 'sgyysyszkzb_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'sgyysyszkzb_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					
					//零售侧双渠道销量
					{name : 'lscsqdxl_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'lscsqdxl_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'lscsqdxl_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'lscsqdxl_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'lscsqdxl_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'lscsqdxl_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'lscsqdxl_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'lscsqdxl_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					//零售侧双渠道净利润
					{name : 'lscsqdjlr_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'lscsqdjlr_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'lscsqdjlr_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'lscsqdjlr_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'lscsqdjlr_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'lscsqdjlr_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'lscsqdjlr_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'lscsqdjlr_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					//新零售门店运营
					{name : 'xlsmdyy_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xlsmdyy_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xlsmdyy_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xlsmdyy_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xlsmdyy_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xlsmdyy_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'xlsmdyy_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'xlsmdyy_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					//售后净利
					{name : 'shjl_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'shjl_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'shjl_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'shjl_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'shjl_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'shjl_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'shjl_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'shjl_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					//自主品牌销售额加分项
					{name : 'zzppxsejfx_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppxsejfx_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppxsejfx_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppxsejfx_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppxsejfx_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppxsejfx_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppxsejfx_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'zzppxsejfx_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					//智能硬件毛利率
					{name : 'znyjmll_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'znyjmll_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'znyjmll_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'znyjmll_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'znyjmll_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'znyjmll_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'znyjmll_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'znyjmll_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					//有效客户规模扣分项
					{name : 'yhkhgmkfx_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'yhkhgmkfx_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'yhkhgmkfx_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'yhkhgmkfx_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'yhkhgmkfx_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'yhkhgmkfx_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'yhkhgmkfx_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'yhkhgmkfx_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					
					//重大事项扣分项
					{name : 'zdsxkfx_YGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zdsxkfx_YValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zdsxkfx_YRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zdsxkfx_QGoal',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zdsxkfx_QValue',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zdsxkfx_QRate',sorttype : "float", formatter:"number",summaryType:'sum',editable : true},
					{name : 'zdsxkfx_Progress',sorttype : "float",formatter:"number",summaryType:'sum',editable : true},
					{name : 'zdsxkfx_Score',sorttype : "float",formatter:"number",summaryType:'sum',editable : true}
					];
	
	jqgrid_init_groupSummary("list","pager1","../zdResultCitykpiQ/list.do",{},colNames,colModel,"operationCenter");
}