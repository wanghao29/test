$(document).ready(function() {
	setAutoMonth();
	jqgridInit();
	//初始化数据确认
	initConfirmInfo();
	
	$("#btnSearch").click(function() {
		  // alert(  getSelectIds().join());
/*		  var postData = $('#grid').jqGrid("getGridParam", "postData");
		      $.each(postData, function (k, v) {
		          delete postData[k];
		    });   */
	/*	   var queryParams  =[];
		   queryParams["startMonth"]=$("#startMonth").val();
		   queryParams["endMonth"]=$("#endMonth").val();
*/
		//初始化数据确认
		initConfirmInfo();
		
		   jqgridReload()
		});
	
	
	
});
function initConfirmInfo(){
	var kpiKey = $("#hid_kpikey").val();
	kpiConfirmInfo("kpiConfirmInfo",kpiKey);
}

function setAutoMonth(){
    /*var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }*/
	  var billcyc = $("#billcyc").val();
  var year ="";
  var month = "";
	if(billcyc == null|| billcyc=="" ){
		  var date = new Date();
            year = date.getFullYear();
            month = date.getMonth()  ;
          if (month >= 1 && month <= 9) {
              month = "0" + month;
          }
	}else{
		   year = billcyc.substring(0,4);
           month = billcyc.substring(4,billcyc.length);
	}
    
    var startMonth = year + "01";
    var endMonth = String(year) +month;
    $("input[name='startMonth']").val(startMonth);
    $("input[name='endMonth']").val(endMonth);
}

function jqgridReload(){
	//$("#list").jqGrid('clearGridData'); 
	
	 $("#grid").setGridParam({postData :{"startMonth":$("#startMonth").val(),"endMonth":$("#endMonth").val()},datatype:'json', page:1}).trigger('reloadGrid');
/*	$("#list").jqGrid('setGridParam',{  
		  postData : postData,
		  datatype:'json',
	      page:1
	}).trigger("reloadGrid");*/
};
function jqgridInit(){
	  jQuery("#grid").jqGrid(
	      {
	        url:basePath+"/operateIncome/queryData.do",
	        mtype:'post',
	        datatype: "json",
	        loadonce:false,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:{"startMonth":$("#startMonth").val(),"endMonth":$("#endMonth").val()},
	        //scroll:1, 滚动加载
	        //datatype : "local",
	        colNames : [ '月份','财务报表运营收入','互联网收入','省间调拨收入','互联网省间调拨收入','本月完成情况','本月完成情况调整G1','全年完成收入',
	        	'全年完成度','基础目标值','本月收入完成率','时间完成度','基础分值','激励目标值','激励分值' 
	        	],
	        colModel : [ 
	           {name : 'billcyc',index : 'billcyc' ,align:'center'}, 
			   {name : 'cwbbyysr',index : 'cwbbyysr',align:'center', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2} }, 
               {name : 'hlwsr',index : 'hlwsr' ,align:'center', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2} }, 
               {name : 'sjdbsr',index : 'sjdbsr' ,align:'center', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2} }, 
			   {name : 'hlwsjdbsr',index : 'hlwsjdbsr' ,align:'center', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2} }, 
               {name : 'bywcqk',index : 'bywcqk',align:'center', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2} }, 
               {name : 'bywcqktz',index : 'bywcqktz' ,align:'center',hidden:true, formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2} }, 
               {name : 'qnwcsr',index : 'qnwcsr',align:'center' , formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2} }, 
               {name : 'qnwcd',index : 'qnwcd' ,align:'center' ,hidden:true,formatter:function(cellvalue, options, rowObject){ return cellvalue+"%"; } }, 
               {name : 'mbz',index : 'mbz' ,align:'center', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2} }, 
               {name : 'bysrwcl',index : 'bysrwcl',align:'center',hidden:true, formatter:function(cellvalue, options, rowObject){ return cellvalue+"%"; }}, 
               {name : 'sjwcd',index : 'sjwcd',align:'center' ,formatter:function(cellvalue, options, rowObject){ return cellvalue+"%"; } }, 
               {name : 'fz',index : 'fz',align:'center' }, 
               {name : 'jlmbz',index : 'jlmbz' ,align:'center', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2} }, 
               {name : 'jlfz',index : 'jlfz',align:'center' }
               ],
               onSelectRow: function (rowId, status, e) {
            	           var rowData=jQuery("#grid").jqGrid("getRowData",rowId);
            	   			  assignLableValue(rowData);
               },
	           gridComplete:function(){//表格加载执行 
	        	         jQuery("#grid").setSelection(1, false); 
	        	         var rowData=jQuery("#grid").jqGrid("getRowData",1);
	        	         assignLableValue(rowData);
	                	   $("#grid").setGridWidth($(window).width()*0.965);
	                  	   $(window).resize(function(){  
	                  		 $("#grid").setGridWidth($(window).width()*0.965);
	                       });
	        },             
	        rowNum:10,        
	        rowList : [12,24], 
	        rownumbers: true,    //行首添加顺序编码
	        rownumWidth: 60,     //行首添加顺序编码的列宽
	        autowidth: true,     //表格宽度自动适应父div
	        height : "100%",     //表格宽度自动适应行数
	        sortorder: "asc",    //指定列排序的次序
	        viewrecords : true,  //显示当前记录，和总记录数 
	        sortname: 'invdate', //默认排序
	        repeatitems: true,   //是否可重复
	        forceFit: true,
	        shrinkToFit:true,
	        autoScroll: true,
	        pager: '#pager',     //指定分页组件所在div id 
	        caption : "",
	      }) ;
	  
	  //jQuery("#list").jqGrid('filterToolbar',{searchOperators : true});
	  //jQuery("#list").jqGrid('navGrid','#pager',{add:false,edit:false,del:false});

};
function assignLableValue(rowData){
	if(! $.isEmptyObject(rowData)){
		$("#hQnwcsr").text(formatThousandsSeparator(rowData.qnwcsr));
		$("#hQnwcd").text(rowData.qnwcd);
		$("#df").text(rowData.fz);
		$("#sjwcd").text(rowData.sjwcd );
		if(Number(rowData.sjwcd.replace("%","")) < 0){
			$("#sjwcd").addClass("text-danger");
		}else{
			$("#sjwcd").removeClass("text-danger");
		}
		
	}
	

	$("#select_yf").val(rowData.billcyc);
	
}