$(document).ready(function() {
	setAutoMonth();
	jqgridInit();
	//初始化数据确认
	initConfirmInfo();
	
	$('#addForm').validate({
		rules : {
			month : {
				required : true
			},
			wnzlxsjxlzb : {
				required : true,
				range:[0,100],
				number:true
			},
			jbmbz : {
				required : true,
				range:[0,100],
				number:true
			},
			jlmbz : {
				required : true,
				range:[0,100],
				number:true
			} ,
			nbzsmyddf : {
				range:[0,5],
				number:true
			} 
		},
		messages : {
			month :{
				required : "账期不能为空！"
			},
			wnzlxsjxlzb : {
				required : "请输入网内战略型手机销量占比！",
				range :"输入值必须介于 0 和 100 之间",
				number:"请输入合法数值!"
			},
			jbmbz : {
				required : "请输入基本目标值！",
				range :"输入值必须介于 0 和 100 之间",
				number:"请输入合法数值!"
			},
			jlmbz : {
				required : "请输入激励目标值！",
				range :"输入值必须介于 0 和 100 之间",
				number:"请输入合法数值!"
			} ,
			nbzsmyddf : {
				range :"输入值必须介于 0 和 5 之间",
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
	$("#btnSearch").click(function() {
		//初始化数据确认
		initConfirmInfo();
		   jqgridReload();
	});
	$("#submitBtn").click(function() {
		var validOK = $('#addForm').valid();
    	if(!validOK){
    		return;
    	}else{
    	    $.ajax({
                type: "post",
                url: basePath + "/netPhonesSalesProportion/insert.do",
               /* contentType: "application/json; charset=utf-8",*/
                data: {"billcyc":$("#month").val(),"wnzlxsjxlzb":$("#wnzlxsjxlzbInput").val(),"jbmbz":$("#jbmbz").val(),"jlmbz":$("#jlmbz").val(),"nbzsmyddf":$("#nbzsmyddf").val()},
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
	
	 $("#grid").setGridParam({postData :{"startMonth":$("#startMonth").val(),"endMonth":$("#endMonth").val()},datatype:'json', page:1}).trigger('reloadGrid');
 
};
function jqgridInit(){
	  jQuery("#grid").jqGrid(
	      {
	        url:basePath+"/netPhonesSalesProportion/queryData.do",
	        mtype:'post',
	        datatype: "json",
	        loadonce:false,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:{"startMonth":$("#startMonth").val(),"endMonth":$("#endMonth").val()},
	        //scroll:1, 滚动加载
	        //datatype : "local",
	        colNames : [ '月份','网内战略型手机销量占比','基本目标值','基本得分','激励目标值','激励得分','内部支撑满意度得分'  ],
	        colModel : [ 
	           {name : 'billcyc',index : 'billcyc',editable : true}, 
			   {name : 'wnzlxsjxlzb',index : 'wnzlxsjxlzb',editable : true,formatter:function(cellvalue, options, rowObject){ return cellvalue+"%"; }}, 
               {name : 'jbmbz',index : 'jbmbz',editable : true,formatter:function(cellvalue, options, rowObject){ return cellvalue+"%"; }}, 
			   {name : 'jbdf',index : 'jbdf',editable : true}, 
               {name : 'jlmbz',index : 'jlmbz',editable : true,formatter:function(cellvalue, options, rowObject){ return cellvalue+"%"; }}, 
               {name : 'jldf',index : 'jldf' ,editable : true},
               {name : 'nbzsmyddf',index : 'nbzsmyddf' ,editable : true} 
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
	  
 

};
function addRow() {
    // 选中行rowid
    var rowIds = $("#grid").jqGrid('getRowData');

    // 选中行实际表示的位置
    //var ind = $("#jqGrid").getInd(rowId);
    // 新插入行的位置
  //  var newInd = ind + 1;
    //$("#grid").addRowData(rowIds.length + 1, {"billcyc":"201901","wnzlxsjxlzb":"201901","jbmbz":"","jbdf":"","jlmbz":"","jldf":"","201901":"",}, rowIds.length + 1);
    $("#grid").editGridRow(rowIds.length + 1, { closeAfterEdit: true });
}
function assignLableValue(rowData){
	if(! $.isEmptyObject(rowData)){
	$("#wnzlxsjxlzb").text(rowData.wnzlxsjxlzb);
	$("#jsmbz").text(rowData.jbmbz);
	$("#df").text(rowData.jbdf);
	
	}
	$("#select_yf").val(rowData.billcyc);
}
