var basePath = "/cmc";
var version = (new Date()).getTime();
(function () {
  var remarkjs = /\/resources\/js\/common(-\d\.\d(\.\d)?)?(\.min)?\.js/i
    , scriptElements = document.getElementsByTagName('script')
    , element
    , i;

  for (i = 0; i < scriptElements.length; ++i) {
    element = scriptElements[i];
    if (remarkjs.exec(element.src)) {
      basePath = element.src.replace(remarkjs,'');
      break;
    }
  }
})();
//根据电脑时间 获取上个月份
function getPrevMonthValue(){
/*	var myDate = new Date();	
	var year = myDate.getFullYear(); 
	var month = myDate.getMonth()+1;
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }*/
    
    var nowdays = new Date();
    var year = nowdays.getFullYear();
    var month = nowdays.getMonth();
    if(month==0){
            month=12;
            year=year-1;
    }
    if (month < 10) {
            month = "0" + month;
    }
	return year+""+month;
};
function getCurrentMonth(){
	
	//时间控件设置初始时间
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    var startDay = String(year)+month;
    return startDay;
}


function disabledBtn(jqgrid,model){
	var ids = jqgrid.jqGrid('getDataIDs');  
	for(var i=1;i<=ids.length;i++){
		$("#editBtn"+model+i).attr("disabled", true); 
		$("#editBtn"+model+i).addClass("ui-state-disabled");
		$("#deleteBtn"+model+i).attr("disabled", true); 
		$("#deleteBtn"+model+i).addClass("ui-state-disabled");
		$("#addBtn"+model+i).attr("disabled", true); 
		$("#addBtn"+model+i).addClass("ui-state-disabled");
	}
}
function undisabledBtn(jqgrid,model){
	var ids = jqgrid.jqGrid('getDataIDs');  
	for(var i=1;i<=ids.length;i++){
		$("#editBtn"+model+i).attr("disabled", false); 
		$("#editBtn"+model+i).removeClass("ui-state-disabled");
		$("#deleteBtn"+model+i).attr("disabled", false); 
		$("#deleteBtn"+model+i).removeClass("ui-state-disabled");
		$("#addBtn"+model+i).attr("disabled", false); 
		$("#addBtn"+model+i).removeClass("ui-state-disabled");
	}
}

function hideBtn(id,model){
	$("#editBtn"+model+id).hide(); 
	$("#deleteBtn"+model+id).hide(); 
	$("#addBtn"+model+id).hide(); 
 	$("#updateBtn"+model+id).show(); 
 	$("#cancelEditBtn"+model+id).show(); 
}
function showBtn(id,model){
 	$("#editBtn"+model+id).show(); 
	$("#deleteBtn"+model+id).show(); 
	$("#addBtn"+model+id).show(); 
 	$("#updateBtn"+model+id).hide(); 
 	$("#cancelEditBtn"+model+id).hide(); 
 	
 	// 对新增行会多出如下两个按钮
 	$("#saveBtn"+model+id).hide(); 
 	$("#cancelSaveBtn"+model+id).hide(); 
}

//获取调整日志的dialog
function adjustLog(){
	 BootstrapDialog.show({
         title: 'kpi数据调整日志',
         size :BootstrapDialog.SIZE_WIDE,
         message: $('<div></div>').load(basePath + '/provinceKpi/dialog/adjustLog_dialog.do',{limit: 25}, 
        function(data){
         }),
         buttons: [{
             label: '关闭',
             action: function(dialog) {
                 dialog.close();
             }
         }]
     });
}
//调整按钮的点击事件
function adjustment(){
	 BootstrapDialog.show({
         title: 'kpi数据调整',
         size :BootstrapDialog.SIZE_WIDE,
         message: $('<div></div>').load(basePath + '/provinceKpi/dialog/adjust_dialog.do',{limit: 25}, 
        function(data){
         }),
         buttons: [
                   {
                	   label: '确认调整',
                	   action: function(dialog) {
                		   if(confirm("确认调整?")){
                			   submit_adjust();
                			   dialog.close();
                    		   $("#grid").bootstrapTable('refresh');
                		   }
                	   }
                   }
                   ,{
                	   label: '关闭',
                	   action: function(dialog) {
                		   dialog.close();
                	   }
                   }]
     });
}
function formatThousandsSeparator (num) {  
    var reg=/\d{1,3}(?=(\d{3})+$)/g;   
    return   (Number(num).toFixed(2) + '').replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');  
}

//kpi数据确认
function kpiConfirmInfo(id,kpiKey){
	//初始化  信息来源
	kpiConfirmInit(kpiKey);
	//状态  和 按钮
	//1、选择的时间区间是同月 才会呈现确认功能
	var startMonth = $("#startMonth").val();
	var stopMonth = $("#endMonth").val();
	if(startMonth==stopMonth){
		
		//2、对应的月份确认的状态 从数据库查询
		var confirmInfo;
		$.ajax({
	        //几个参数需要注意一下
	            type: 'post',//方法类型
	            dataType: "json",//预期服务器返回的数据类型
	            url: basePath + "/amount/confirm_log.do",//url
	            data: JSON.stringify({'month':startMonth,'kpiKey':kpiKey}),
	            async: false,
	            contentType: 'application/json',  
	            processData: false, 
	            success: function (result) {
	            	confirmInfo=result;
	            },
	            error : function() {
	            	alert('确认功能失败');
	            	return;
	            }
	        });
		$("#kpiConfirmInfo").empty();
		if(confirmInfo==null){//如果没有记录  则是待确认    
			$("#"+id).append("<div style='background-color:#CCFF99;width：100%;' ><span style='color:green;'>待确认</span><input type='button' onclick='kpiConfirmInfo_dialog(\""+kpiKey+"\");' style='color:green;float:right;width:25%;' value='数据确认'/></div>");
		}else{//有记录  则判断什么状态
			var state = confirmInfo.state;
			if(state=='0'){
				 $("#"+id).append("<div style='background-color:#CCFF99;width：100%;' ><span style='color:green;'>请核查</span><input type='button' onclick='kpiConfirmInfo_dialog(\""+kpiKey+"\");' style='color:green;float:right;width:25%;' value='数据确认'/></div>");
			 }
			if(state=='1'){
				 $("#"+id).append("<div style='color:#fff;background-color:green;width：100%;' >已确认</div>");
			 }
		}
		
		
	}
}

//初始化数据确认人  和 数据来源
function kpiConfirmInit(kpiKey){
	$.ajax({
        //几个参数需要注意一下
            type: 'post',//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: basePath + "/amount/zlConfirmInfTS.do",//url
            data: JSON.stringify({'id':kpiKey}),
            async: false,
            contentType: 'application/json',  
            processData: false, 
            success: function (result) {
//            	$('#overview').val(result);
            	$("#infoPerson").text("数据来源:"+result.infoPerson);
            	$("#confirm").text("确认人:"+result.confirm);
            },
            error : function() {
            	alert('false');
            	return;
            }
        });
}

//数据确认按钮  点击事件
function kpiConfirmInfo_dialog(kpiKey){
	 BootstrapDialog.show({
           title: '数据确认',
           size :BootstrapDialog.SIZE_WIDE,
           message: $('<div></div>').load(basePath + '/amount/dialog/confirmInfo_dialog.do',{limit: kpiKey}, 
          function(data){
           }),
           buttons: [{
               label: '确认',
               cssClass: 'btn-primary',
               action: function(dialog) {
               	if($("#error_dialog").val()){
               		var month =$("input[name='month1']").val();
	                	var hid_kpikey = $("#hid_kpikey").val();
	                	var remarks=$("#remarks").val();
	                	var state= $("#state").val();
	                	//提交确认的信息
	                	$.ajax({
	            	        //几个参数需要注意一下
	            	            type: 'post',//方法类型
	            	            dataType: "json",//预期服务器返回的数据类型
	            	            url: basePath + "/amount/insertInfo.do",//url
	            	            data: JSON.stringify({'month':month,'kpiKey':hid_kpikey,'state':state,'remarks':remarks}),
	            	            async: false,
	            	            contentType: 'application/json',  
	            	            processData: false, 
	            	            success: function (result) {
	            	            		alert("数据确认  提交成功");
	            	            		initConfirmInfo();
	            	            },
	            	            error : function() {
	            	            	alert('false');
	            	            	return;
	            	            }
	            	        });
               	}
                   dialog.close();
               }
           },
           {
               label: '关闭',
               cssClass: 'btn-primary',
               action: function(dialog) {
                   dialog.close();
               }
           }]
       });
} 

