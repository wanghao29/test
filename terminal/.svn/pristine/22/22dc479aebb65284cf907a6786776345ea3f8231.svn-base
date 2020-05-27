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
	        url:basePath+"/threeReceivableProportion/queryData.do",
	        mtype:'post',
	        datatype: "json",
	        loadonce:false,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:{"startMonth":$("#startMonth").val(),"endMonth":$("#endMonth").val()},
	        //scroll:1, 滚动加载
	        //datatype : "local",
	        colNames : [ '月份','应收账款总额','90（不含）-180天（含）应收账款','90（不含）-180天（含）应收账款占比','90（不含）-180天（含）应收账款得分','180天（不含）以上应收账款','180天（不含）以上应收账款占比','180天（不含）以上应收账款得分','得分' ],
	        colModel : [ 
	           {name : 'billcyc',index : 'billcyc' }, 
			   {name : 'yszkze',index : 'yszkze', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
			   {name : 'yszk90',index : 'yszk90', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'yszkzb90',index : 'yszkzb90' , formatter:function(cellvalue, options, rowObject){ return (Number(cellvalue*100).toFixed(2))+"%"; }   }, 
               {name : 'yszkdf90',index : 'yszkdf90'  }, 
               {name : 'yszk180',index : 'yszk180', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}    }, 
               {name : 'yszkzb180',index : 'yszkzb180' , formatter:function(cellvalue, options, rowObject){ return (Number(cellvalue*100).toFixed(2))+"%"; }  }, 
               {name : 'yszkdf180',index : 'yszkdf180'}, 
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
	$("#yszkze").text(formatThousandsSeparator(rowData.yszkze));
	$("#yszkdf90").text(rowData.yszkdf90);
	$("#yszkdf180").text(rowData.yszkdf180);
	$("#df").text(rowData.df);
	
	}
	$("#select_yf").val(rowData.billcyc);
}
