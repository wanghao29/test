$(document).ready(function() {
    //顶部菜单切换
    $("#menu li").attr("class","drop");
    $("#calcResultIndex").attr("class","active");
	// 时间控件设置初始时间
	var myDate = new Date();	
	var year = myDate.getFullYear(); 
	$(".currentYear").val(year);
	
	$("#query").click(function(){
		jqgridReload();
	});
	
	jqgridInit();
});

function pageInit() {

}

function jqgridReload(){
	jqgrid_reload("list",getparam());
};

function getparam(){
	var data = {};
	data["year"] = $("#year").val();
	data["quarter"] = $("#quarter").val();
	return data;
}

function jqgridInit() {
	jQuery("#list").jqGrid({
		url : "../zdResultCitykpiQ/calcResultList.do",
		mtype : 'post',
		datatype : "json",
		loadonce : true, // 一次性加载
		gridview : true, // 增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
		postData : getparam(),
		rowNum : 30,
		//rowList : [ 5, 10, 30, 50 ],
		rownumbers : false, // 行首添加顺序编码
		//rownumWidth : 60, // 行首添加顺序编码的列宽
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

		colNames : ['运营中心','年份','季度','地市','规模指标得分（76分）','渠道类得分（18分）','运营效率指标（6分）','加减分项','重点扣分项','KPI指标总分','排名（KPI得分）'],
		colModel : [
			{name : 'operationCenter',sorttype : "string",width : 110}, 
			{name : 'year',sorttype : "string",width : 80}, 
			{name : 'quarter',sorttype : "string",width : 80}, 
			{name : 'city',sorttype : "string",width : 80}, 
			{name : 'scopeKpi',sorttype : "float",formatter:"number",summaryType:'sum'}, 
			{name : 'channelKpi',sorttype : "float",formatter:"number",summaryType:'sum'}, 
			{name : 'operationKpi',sorttype : "float",formatter:"number",summaryType:'sum'}, 
			{name : 'addSubKpi',sorttype : "float",formatter:"number",summaryType:'sum'}, 
			{name : 'imptDeduct',sorttype : "float",formatter:"number",summaryType:'sum'}, 
			{name : 'kpi',sorttype : "float",formatter:"number",summaryType:'sum'}, 
			{name : 'rank',sorttype : "int"}
		]
	});
	
}
