$(document).ready(function() {
	setAutoMonth();
	jqgridInit();
	//初始化数据确认
	initConfirmInfo();
	
	$("#btnSearch").click(function() {
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
            month = date.getMonth() ;
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
	        url:basePath+"/unitCostProfit/queryData.do",
	        mtype:'post',
	        datatype: "json",
	        loadonce:false,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:{"startMonth":$("#startMonth").val(),"endMonth":$("#endMonth").val()},
	        //scroll:1, 滚动加载
	        //datatype : "local",
	        colNames : [ '月份','总支出','互联网支出','考核支出','财务报表运营收入','互联网收入','省间调拨收入','互联网省间调拨收入','考核收入','业务成本','互联网成本','省间调拨成本' 
	        	,'互联网省间调拨成本','运营毛利','互联网毛利','省间调拨毛利','综合毛利','利润总额','人工类成本','外包费','广分考核利润','单位人工费用创利比','得分','年度得分','广分利润累计'
	        	
	        	],
	        colModel : [ 
	           {name : 'billcyc',index : 'billcyc' }, 
			   {name : 'zzc',index : 'zzc', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
			   {name : 'hlwzc',index : 'hlwzc', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'khzc',index : 'khzc', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'cwbbyysr',index : 'cwbbyysr', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'hlwsr',index : 'hlwsr', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'sjdbsr',index : 'sjdbsr', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
             
               {name : 'hlwsjdbsr',index : 'hlwsjdbsr', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'khsr',index : 'khsr', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'ywcb',index : 'ywcb', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'hlwcb',index : 'hlwcb', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'sjdbcb',index : 'sjdbcb', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'hlwsjdbcb',index : 'hlwsjdbcb', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'yyml',index : 'yyml', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'hlwml',index : 'hlwml', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'sjdbml',index : 'sjdbml', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'zhml',index : 'zhml', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'lrze',index : 'lrze', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'rglcb',index : 'rglcb', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'wbf',index : 'wbf', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  } ,
               {name : 'gfAssessmentProfit',index : 'gfAssessmentProfit', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  },
               {name : 'dwrgfyclb',index : 'dwrgfyclb', formatter:function(cellvalue, options, rowObject){ return (Number(cellvalue*100).toFixed(2))+"%"; } }, 
               {name : 'df',index : 'df'  }, 
               {name : 'nddf',index : 'nddf'  }, 
               {name : 'gfAssessmentProfitNd',index : 'gfAssessmentProfitNd',hidden:true }
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
	$("#lrze").text(formatThousandsSeparator(rowData.lrze));
	$("#dwrgfyclb").text(rowData.dwrgfyclb);
	$("#df").text(rowData.df);
	
	}
	$("#select_yf").val(rowData.billcyc);
}
