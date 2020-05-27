	 var result = [];
$(document).ready(function() {
	setAutoMonth();
	
	 $.ajax({                               
		 url : basePath + "/socialChannelExpand/customerSalesTargetValue/queryKaCustomerCode.do",
		 async : false,
		 type : "get",
		 data : {},
		 success : function(data, status) {
			 $.each(data, function(key, value) {
				 result.push({   
					 id : value.id, 
					 text : value.text 
					 });        
				 });          
				$("#customer_code").empty();
				$("#customer_code").select2({
					  data: result
				});
				$("#customer_code").off("select2:select");
				$("#customer_code").on("change",function(e){ 	
					
				});
			 }             
		 });  
	
	
     loadTable('#grid',
         basePath + "/socialChannelExpand/customerSalesTargetValue/list.do",
         ['month','kakhxlmbz','kakhdm','kakhdmdesc','kakhxs','kakhxslj','mbz','wcqkzb','df','sjjd'],
         ['月份','KA客户销量目标值','KA客户代码','KA客户代码描述','KA客户销售','KA客户销售累计','目标效率','完成情况占比','得分','时间进度'],
         true);

	 
     function loadTable(table,url,params,titles,hasCheckbox) {
         $(table).bootstrapTable({
                 url: url,                      //请求后台的URL（*）
                 method: 'post',                      //请求方式（*）
                /* height : 200,*/
                 toolbar: '#toolbar',              //工具按钮用哪个容器
                 striped: false,                      //是否显示行间隔色
                 cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                 pagination: true,                   //是否显示分页（*）
                 sortable: true,                     //是否启用排序
                 sortOrder: "asc",                   //排序方式
                 sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                 pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
                 pageSize: 12,                     //每页的记录行数（*）
                 pageList: [12, 10, 15, 20],        //可供选择的每页的行数（*）
                 search: false,                      //是否显示表格搜索
                 strictSearch: true,
                 // showColumns: true,                  //是否显示所有的列（选择显示的列）
                 // showRefresh: true,                  //是否显示刷新按钮
                 minimumCountColumns: 2,             //最少允许的列数
                 clickToSelect: true,                //是否启用点击选中行
                 paginationPreText: "上一页",
                 paginationNextText: "下一页",
                 //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                 uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                 // showToggle: false,                   //是否显示详细视图和列表视图的切换按钮
                 cardView: false,                    //是否显示详细视图
                 detailView: false,                  //是否显示父子表
                 //得到查询的参数
                 queryParams : queryParams,
                 columns: createCols(params,titles),
                 // onLoadSuccess: function () {
                	//  $(".fixed-table-toolbar").hide();
                 // },
                 onLoadSuccess:function(data){
//                     console.log('数据加载成功...');
                     var tableId = document.getElementById("grid");
                     var row = tableId.rows[1];
                     $(row).addClass('changeColor');
                     if(data.rows[0] != null){
                         getWcqkzbs(data.rows[0]);
                     }

                 },
                 onLoadError: function () {
//                     console.log('数据加载失败...')
                 },
                 responseHandler: function(res) {
//                 console.log(res);
                 return {
                     "total": res.totalCount,//总条数
                     "rows": res.list   //数据
                 };
             },
             //点击表格某一行
             onClickRow:function (row,field,$element) {
//                 console.log($(field[0]));
                 //点击某行使其变色
                 $(".changeColor").removeClass('changeColor');
                 $(field[0]).addClass('changeColor');
                 //获取本月完成情况占比，上月完成情况占比，去年同期完成情况占比
                 getWcqkzbs(row);

             },
             onEditableSave: function (field, row, oldValue, $el) {
                 if(field == 'mbz'){
                     $.ajax({
                         type: "post",
                         url: basePath + "/socialChannelExpand/customerSalesTargetValue/updateByTargetVal.do",
                         contentType: "application/json; charset=utf-8",
                         data: JSON.stringify({"startMonth":$("input[name='startMonth']").val(),"endMonth":$("input[name='endMonth']").val(),"mbz":row.mbz}),
                         dataType: 'JSON',
                         success: function (data, status) {
                             if (status == "success") {
                                 alert('提交数据成功');
                                 $("#grid").bootstrapTable('refresh');
                             }
                         },
                         error: function () {
                             alert('编辑失败');
                         },
                         complete: function () {

                         }
                     });
                 }
                 else {
                     updateByPrimaryKey(row);
                 }

             }
        });
     };
 $('#addForm').validate({
		rules : {
			month : {
				required : true
			},
			customer_sales : {
				required : true,
				digits:true
			},
			customer_code : {
				required : true
			},
			target_efficiency : {
				required : true,
				digits:true
			} 
		},
		messages : {
			month :{
				required : "账期不能为空！"
			},
			customer_sales : {
				required : "KA客户销量目标值！",
				digits:"请输入合法数值!"
			},
			customer_code : {
				required : "请选择KA客户代码！",
				
			},
			target_efficiency : {
				required : "请输入目标效率！",
				digits:"请输入合法数值!"
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
  
     
     
     
     
         //查询
         $('#btnSearch').click(function () {
         	//
         	getLastData();
             //更新表格
             $("#grid").bootstrapTable('refresh');
         })
         $('#btnAdd').click(function(){
        	 $('#addModal').modal('show');
        	 
        	
        	 
        	  queryKaCustomerCode();
         });
         $('#submitBtn').click(function(){
        	 var validOK = $('#addForm').valid();
         	if(!validOK){
         		return;
         	}else{
         		addKa( $('#month').val(),$('#customer_sales').val(), getSelectData("customer_code"),$('#target_efficiency').val(),getSelectDesc("customer_code"));
         	}
         });
         
         
         
         
   });	
function initEchart(currentMonthWcqkzb,lastMonthWcqkzb,lastYearWcqkzb){
    var stockUserPaint = initEcharts(echarts,"char_bar");//存量用户数
    var option = threeGauge2(currentMonthWcqkzb,lastMonthWcqkzb,lastYearWcqkzb,"完成情况占比")
    stockUserPaint.setOption(option); //新入盘量
 }	
function queryKaCustomerCode(){
	 $.ajax({                               
		 url : basePath + "/socialChannelExpand/customerSalesTargetValue/queryKaCustomerCode.do",
		 async : false,
		 type : "get",
		 data : {},
		 success : function(data, status) {
			 $.each(data, function(key, value) {
				 result.push({   
					 value : value.id, 
					 text : value.text 
					 });        
				 });          
				$("#customer_code").empty();
				$("#customer_code").select2({
					  data: result
				});
				$("#customer_code").off("select2:select");
				$("#customer_code").on("change",function(e){ 	
					
				});
			 }             
		 });   
}
function addKa(month,customer_sales,customer_code,target_efficiency,customer_code_desc){
	 $.ajax({                               
		 url : basePath + "/socialChannelExpand/customerSalesTargetValue/addKa.do",
		 async : false,
		 type : "post",
		 dataType: "json",//预期服务器返回的数据类型
		 contentType: 'application/json',  
		 processData: false, 
		 data : JSON.stringify({month:month,customer_sales:customer_sales,customer_code:customer_code,target_efficiency:target_efficiency,customer_code_desc:customer_code_desc }),
		 success : function(data, status) {
			 	$('#addModal').modal('hide');
				getLastData();
	             //更新表格
	             $("#grid").bootstrapTable('refresh');
			 }             
		 });   
}
function getSelectData(id){
	var selectObj = $("#"+id).select2('data');
	var resultValue =[];
	 $.each(selectObj,function(index,data){
		 resultValue[index]=data.id;
	 });
	return resultValue.join(",");
}
function getSelectDesc(id){
	var selectObj = $("#"+id).select2('data');
	var resultValue =[];
	 $.each(selectObj,function(index,data){
		 resultValue[index]=data.text;
	 });
	return resultValue.join(",");
}
function setAutoMonth(){
/*    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }*/
	  var billcyc = $("#billcyc").val();
      var year ="";
      var month = "";
    	if(billcyc == null || billcyc=="" ){
    		  var date = new Date();
                year = date.getFullYear();
                month = date.getMonth() + 1;
              if (month >= 1 && month <= 9) {
                  month = "0" + month;
              }
    	}else{
    		   year = billcyc.substring(0,4);
               month = billcyc.substring(4,billcyc.length);
    	}
    var startMonth = year + "01";
    var endMonth = String(year) + month;
    $("input[name='startMonth']").val(startMonth);
    $("input[name='endMonth']").val(endMonth);
}	 

function getLastData(){
	$.ajax({
		   type: 'post',
		   url: basePath+'/socialChannelExpand/customerSalesTargetValue/getLastData.do',
        contentType: "application/json; charset=utf-8",
		   data: JSON.stringify({endMonth:$("input[name='endMonth']").val()}),
		   async: false,
		   dataType: 'json',
		   success: function(result){
		       $('#hKakhxslj').text(result.kakhxslj);
            $('#hWcqkzb').text(result.wcqkzb);
            $('#hDf').text(result.df);
            $('#hSjjd').text(result.sjjd);
		   }
	   });
}
function queryParams (params) {
    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
    var temp = {
        pageSize: params.limit,                         //页面大小
        page: (params.offset / params.limit) + 1,   //页码
        // sort: params.sort,      //排序列名
        // sortOrder: params.order, //排位命令（desc，asc）
        startMonth:$("input[name='startMonth']").val(),
        endMonth:$("input[name='endMonth']").val()
    };
    return temp;
}

function getFormat(id){
    var str = '';
    $.ajax({
        type: 'get',
        url: basePath+'/socialChannelExpand/customerSalesTargetValue/getFormat.do?id=' + id,
        async: false,
        success: function(result){
            str = result.formatStr;
        }
    });
    return str;
}

function getWcqkzbs(row) {
    $.ajax({
        type: "post",
        url: basePath + "/socialChannelExpand/customerSalesTargetValue/getWcqkzbs.do",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(row),
        dataType: 'JSON',
        success: function (data) {
            initEchart(data.currentMonthWcqkzb,data.lastMonthWcqkzb,data.lastYearWcqkzb);
        },
        error: function () {

        },
        complete: function () {

        }
    });
}
function updateByPrimaryKey (row) {
    $.ajax({
        type: "post",
        url: basePath + "/socialChannelExpand/customerSalesTargetValue/updateByPrimaryKey.do",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(row),
        dataType: 'JSON',
        success: function (data, status) {
            if (status == "success") {
                $("#grid").bootstrapTable('refresh');
            }
        },
        error: function () {
        },
        complete: function () {

        }
    });
}

function createCols(params,titles) {
    if(params.length!=titles.length)
        return null;
    var arr = [];
    for(var i = 0;i<params.length;i++) {
        var obj = {};
        if(titles[i] == '目标效率'){
            obj.editable={type: 'text', title: '编辑', validate:  function (v) {if(v=='0'){return '目标效率不能修改为0';}}}
        } /*else if(titles[i] == 'KA客户代码'){
            obj.editable={type: 'text', title: '编辑', validate:  function (v) {}}
            obj.editable={
           		 type : 'select2',
           		 title : '免考核机型',
           		 field : 'kakhdm',
           		 mode:'inline',
           		 emptytext : "KA客户代码",
           		 placement : 'top',
           		 source : function() {
           			 //动态获取数据 
           		         
           			 return result;
           		 },
	               inputclass:'input-large',                
	                 select2:{                    
	                	allowClear : true,                    
	                	multiple : true,
	                	//多选                    
	                	tokenSeparators : [",", " "],                   
	                	width : '100px'//设置宽               
	                }
           };
          
        	
        	
        	
        } */else if(titles[i] == 'KA客户销量目标值'){
            obj.editable={type: 'text', title: '编辑', validate:  function (v) {}}
        }  else if(titles[i] == '月份'){
        	obj.edit={
                type:'date',//日期
                required:true,
                click:function(){
                }
        	}
        }
        obj.field = params[i];
        obj.title = titles[i];
        obj.align = 'center';
        arr.push(obj);
    }
    // arr.push({field: "candle",title: "编辑",editable:{type: 'text', title: '编辑', validate:  function (v) {}}})
    return arr;
}


/*	$("#grid").jqGrid({
				url : basePath + "/socialChannelExpand/customerSalesTargetValue/list.do",
				datatype : "json",
				postData :{startMonth: $("input[name='startMonth']").val().replace("-",""),endMonth:$("input[name='endMonth']").val().replace("-","")  },
				mtype : "POST",
		        colNames:[
		                 '月份',
		                 'KA客户销量目标值',
		                 'KA客户代码',
		                 'KA客户销售',
		                 'KA客户销售累计',
		                 '目标效率',
		                 '完成情况占比',
		                 '得分',
		                 '时间进度'
		                 ],
		     colModel:[
						{name:'month', index:'month',align:"center",editable : true,editoptions:{
							dataInit:function(el){
									 $(el).click(function(){
									//　 WdatePicker();
										 $(el).attr("readonly","readonly");
										 WdatePicker({dateFmt:'yyyyMM'});
										 });
									 }}
						},
						{name:'kakhxlmbz', index:'kakhxlmbz',align:"center",editable : true},
						{name:'kakhdm', index:'kakhdm',align:"center",editable : true},
						{name:'kakhxs', index:'kakhxs',align:"center"},
						{name:'kakhxslj', index:'kakhxslj',align:"center" },
						{name:'mbz', index:'mbz',align:"center",sortorder:"desc",editable : true},
						{name:'wcqkzb', index:'wcqkzb',align:"center"},
						{name:'df', index:'df',align:"center"},
						{name:'sjjd', index:'sjjd',align:"center"}
					 
						],
				pager : '#pager',
				autowidth : true,
				height : 'auto',
				caption :" ",
				viewrecords : true,
				multiselect: false,
				altRows : true,
				altclass : 'lightblue',
				rowNum : 12,
				rowList : [ 10, 20, 30 ],
				autoload:false,
				singleSelect : false, 
				shrinkToFit:true,
				loadonce:false,
				sortname : 'taskgentime',
				sortorder:'desc',
				ondblClickRow : function(rowid,iRow,iCol,e) {
		
		        },
		        onSelectRow: function(rowId){
		        	 
		        },
				gridComplete:function(){
					  
				},jsonReader : {
					      root: "list",    // json中代表实际模型数据的入口
					      page: "page",    // json中代表当前页码的数据
					      total: "totalPages",    // json中代表页码总数的数据
					      records: "totalCount", // json中代表数据行总数的数据
					      repeatitems: false, // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
					      cell: "cell",
					      id: "id",
					      userdata: "userdata",
					      cell:"cell"
				}
		 });*/
/*	  jQuery("#grid").jqGrid('navGrid', "#pager", {
		    edit : false,
		    add : false,
		    del : false
		  });*/
/*	  jQuery("#grid").jqGrid('inlineNav', "#pager");*/







/*$(function() {
    //设置默认月份
    setAutoMonth();

     //
    getLastData();

    
    }

  

    // var processFormatter = function (value, row, index) {
    //     var id = row.id
    //     var process = getFormat(id);
    //     return process;
    // }
	


});
*/

