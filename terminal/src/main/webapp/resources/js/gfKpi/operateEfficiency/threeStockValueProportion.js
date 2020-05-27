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
	        url:basePath+"/threeStockValueProportion/queryData.do",
	        mtype:'post',
	        datatype: "json",
	        loadonce:false,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:{"startMonth":$("#startMonth").val(),"endMonth":$("#endMonth").val()},
	        //scroll:1, 滚动加载
	        //datatype : "local",
	        colNames : [ '月份','库存金额-剔除前','库存金额-充值卡','库存金额-免考核机','库存金额-剔除后','1-90天金额-剔除前','1-90天金额-充值卡',
	        	'1-90天金额-免考核机','1-90天金额-剔除后','90-180天金额-剔除前','90-180天金额-充值卡','90-180天金额-免考核机','90-180天金额-剔除后',
	        	'金额占比','得分', '180-360金额-剔除前','180-360金额-充值卡','180-360金额-免考核机','180-360金额-剔除后','金额占比','得分',
	        	'360天金额-剔除前','360天金额-充值卡', '360天金额-免考核机','360天金额-剔除后','金额占比','得分','小计得分','年度得分'],
	        colModel : [ 
	           {name : 'billcyc',index : 'billcyc' }, 
			   {name : 'kctcq',index : 'kctcq',hidden:true, formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
			   {name : 'kcczk',index : 'kcczk',hidden:true, formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'kcmkhj',index : 'kcmkhj',hidden:true, formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'kctch',index : 'kctch', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'tje90tcq',index : 'tje90tcq',hidden:true, formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'tje90czk',index : 'tje90czk',hidden:true, formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'tje90mkhj',index : 'tje90mkhj',hidden:true, formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'tje90tch',index : 'tje90tch', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'tje180tcq',index : 'tje180tcq',hidden:true, formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'tje180czk',index : 'tje180czk',hidden:true, formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  },
               {name : 'tje180mkhj',index : 'tje180mkhj',hidden:true, formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'tje180tch',index : 'tje180tch', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'je180zb',index : 'je180zb',  formatter: "number", formatter:function(cellvalue, options, rowObject){ return (Number(cellvalue*100).toFixed(2))+"%"; }  }, 
               {name : 'je180df',index : 'je180df',  formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'tje300tcq',index : 'tje300tcq',hidden:true,hidden:true, formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'tje300czk',index : 'tje300czk',hidden:true, formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'tje300mkhj',index : 'tje300mkhj',hidden:true, formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'tje300tch',index : 'tje300tch', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'je300zb',index : 'je300zb', formatter:function(cellvalue, options, rowObject){ return (Number(cellvalue*100).toFixed(2))+"%"; }  }, 
               {name : 'je300df',index : 'je300df', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'tje360tcq',index : 'tje360tcq',hidden:true } ,
               {name : 'tje360czk',index : 'tje360czk',hidden:true, formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'tje360mkhj',index : 'tje360mkhj',hidden:true, formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'tje360tch',index : 'tje360tch', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'je360zb',index : 'je360zb',  formatter:function(cellvalue, options, rowObject){ return (Number(cellvalue*100).toFixed(2))+"%"; }  }, 
               {name : 'je360df',index : 'je360df', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'df',index : 'df', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'nddf',index : 'nddf', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               ],
               onSelectRow: function (rowId, status, e) {
            	           var rowData=jQuery("#grid").jqGrid("getRowData",rowId);
            	   			assignLableValue(rowData);
               },
	           gridComplete:function(){//表格加载执行 
	        	         jQuery("#grid").setSelection(1, false); 
	        	         var rowData=jQuery("#grid").jqGrid("getRowData",1);
	        	         assignLableValue(rowData);
	                	/*   $("#grid").setGridWidth($(window).width()*0.965);
	                  	   $(window).resize(function(){  
	                  		 $("#grid").setGridWidth($(window).width()*0.965);
	                       });*/
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
		$("#grid").jqGrid('setGroupHeaders', {
			  useColSpanStyle: false, 
			  groupHeaders:[
			                {startColumnName: 'kctcq', numberOfColumns: 4, titleText: "库存金额"},
			                {startColumnName: 'tje90tcq', numberOfColumns: 4, titleText: "1-90天金额"},
				            {startColumnName: 'tje180tcq', numberOfColumns: 6, titleText: "90-180天金额"},
				            {startColumnName: 'tje300tcq', numberOfColumns: 6, titleText: "180-360金额"},
				            {startColumnName: 'tje360tcq', numberOfColumns: 6, titleText: "360天金额"} 
				            ]
			});

};

function assignLableValue(rowData){
	   
	if(! $.isEmptyObject(rowData)){
	$("#ratio_amount_90_180").text(rowData.je180zb);
	$("#ratio_amount_180_360").text(rowData.je300zb);
	$("#ratio_amount_360").text(rowData.je360zb);
	$("#amount_90_180_df").text(rowData.je180df);
	$("#amount_180_360_df").text(rowData.je300df);
	$("#amount_360_df").text(rowData.je360df);
	
	
	}
	$("#select_yf").val(rowData.billcyc);
}
