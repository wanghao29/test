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
	
	$('#addForm').validate({
		rules : {
			month : {
				required : true
			},
			sjhk : {
				required : true,
				number:true
			},
			jhhk : {
				required : true,
				number:true
			} 
		},
		messages : {
			month :{
				required : "账期不能为空！"
			},
			sjhk : {
				required : "请输入实际回款金额！",
			 
				number:"请输入合法数值!"
			},
			jhhk : {
				required : "请输入计划回款金额！",
				number:"请输入合法数值!"
			} 
		},
        invalidHandler : function(){
            return false;
        },
        submitHandler : function(){
            return false;//阻止表单提交
        },
        //**设置验证触发事件 *//*
	    focusInvalid : false,
	    onkeyup : false,
	    onclick : false,
	    onfocusout : false
	});
	$("#submitBtn").click(function() {
		var validOK = $('#addForm').valid();
    	if(!validOK){
    		return;
    	}else{
    	    $.ajax({
                type: "post",
                url: basePath + "/backForecastAccuracy/insert.do",
               /* contentType: "application/json; charset=utf-8",*/
                data: {"billcyc":$("#month").val(),"sjhk":$("#sjhk_input").val(),"jhhk":$("#jhhk_input").val() },
                dataType: 'JSON',
                success: function (data) {
                	 alert("提交成功");
                	 jqgridReload();
                	 $('#myModal').modal('hide');
                },
                error: function () {
                	alert("提交失败");
                } 
            });
    	}
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
	        url:basePath+"/backForecastAccuracy/queryData.do",
	        mtype:'post',
	        datatype: "json",
	        loadonce:false,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:{"startMonth":$("#startMonth").val(),"endMonth":$("#endMonth").val()},
	        //scroll:1, 滚动加载
	        //datatype : "local",
	        colNames : [ '月份','实际回款','计划回款','回款预测准确度','回款预测准确度得分' ],
	        colModel : [ 
	           {name : 'billcyc',index : 'billcyc' }, 
			   {name : 'sjhk',index : 'zjywcb', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
			   {name : 'jhhk',index : 'hlwcb', formatter: "number", formatoptions: {thousandsSeparator:",", defaulValue:"",decimalPlaces:2}  }, 
               {name : 'hkyczqd',index : 'sjdbcb'  }, 
               {name : 'hkyczqddf',index : 'hlwsjdbcb' }, 
           
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
	$("#sjhk").text(formatThousandsSeparator(rowData.sjhk));
	$("#hkyczqd").text(rowData.hkyczqd);
	$("#df").text(rowData.hkyczqddf);
	
	}
	$("#select_yf").val(rowData.billcyc);
}
