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
	        url:basePath+"/inventoryTurnover/queryData.do",
	        mtype:'post',
	        datatype: "json",
	        loadonce:false,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:{"startMonth":$("#startMonth").val(),"endMonth":$("#endMonth").val()},
	        //scroll:1, 滚动加载
	        //datatype : "local",
	        colNames : [ '月份','直接业务成本','互联网成本','省间调拨成本','互联网省间调拨成本','广分考核直接业务成本','存货净值','互联网存货净值','广分考核存货净值','存货周转率','目标次数','得分' ],
	        colModel : [ 
	           {name : 'billcyc',index : 'billcyc' }, 
			   {name : 'zjywcb',index : 'zjywcb', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
			   {name : 'hlwcb',index : 'hlwcb', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'sjdbcb',index : 'sjdbcb', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'hlwsjdbcb',index : 'hlwsjdbcb', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'gfkhzjywcb',index : 'gfkhzjywcb', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'chjz',index : 'chjz', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'hlwchjz',index : 'hlwchjz', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'gfkhchjz',index : 'gfkhchjz', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'chzzl',index : 'chzzl', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'mbcs',index : 'mbcs', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'df',index : 'df' } 
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
	$("#chzzl").text(formatThousandsSeparator(rowData.chzzl));
	$("#mbz").text(rowData.mbcs);
	$("#df").text(rowData.df);
	
	}
	$("#select_yf").val(rowData.billcyc);
}
