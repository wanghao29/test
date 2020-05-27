var basePath = "/cmc";
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
