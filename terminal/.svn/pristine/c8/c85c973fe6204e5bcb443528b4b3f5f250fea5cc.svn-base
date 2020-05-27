var select2_data;
$(function() {
    //设置默认月份
//    setAutoMonth();
	$("input[name='startMonth']").val('201812');
    $("input[name='endMonth']").val('201812');

    lastMonthData();

	 $.ajax({                               
		 url : basePath + "/assetsTurnoverRate/threeMonthStockRatio/querySelect2.do",
		 async : false,
		 type : "get",
		 data : {},
		 success : function(data, status) {
			 select2_data = data;
			             
			 }             
		 });     

 /*       loadTable('#grid',
            basePath + "/assetsTurnoverRate/threeMonthStockRatio/list.do",
            ['month','tsl90','tsl180','tsl360','kc90tsl','kc180tsl','kc360tsl','czk90tsl','czk180tsl','czk360tsl','mkhjx90tsl','mkhjx180tsl','mkhjx360tsl'
                ,'mkhjx','khknld90tsl','khknld180tsl','khknld360tsl','tsl0','kc0tsl','czk0tsl','mkhjx0tsl','khknld0tsl','fgschyz'
                ,'khknld90zb','khknld180zb','khknld360zb','df'],
            ['月份','90-180天数量','180-360天数量','360天以上天数量','K库存90-180天数量','K库存180-360天数量','K库存360天以上天数量','充值卡90-180天数量','充值卡180-360天数量','充值卡360天以上天数量','免考核机型90-180天数量','免考核机型180-360天数量'
                ,'免考核机型360天以上天数量','免考核机型','考核库龄段90-180天数量','考核库龄段180-360天数量','考核库龄段360天以上天数量','0-90天数量','K库存0-90天数量','充值卡0-90天数量','免考核机型0-90天数量','考核库龄段0-90天数量','分公司存货原值'
                ,'考核库龄段90-180天占比','考核库龄段180-360天占比','考核库龄段360天以上天占比','得分'],
            true);*/
        loadTable('#grid',
                basePath + "/assetsTurnoverRate/threeMonthStockRatio/list.do",
                ['month','mkhjx_desc','khknld90tsl','khknld180tsl','khknld360tsl','khknld90zb','khknld180zb','khknld360zb','df'],
                ['月份','免考核机型','考核库龄段90-180天金额','考核库龄段180-360天金额','考核库龄段360天以上天金额' ,'考核库龄段90-180天占比','考核库龄段180-360天占比','考核库龄段360天以上天占比','得分'],
                true);

        function loadTable(table,url,params,titles,hasCheckbox) {
            $(table).bootstrapTable({
                    url: url,                      //请求后台的URL（*）
                    method: 'post',                      //请求方式（*）
                  /*  height : 200,*/
                    toolbar: '#toolbar',              //工具按钮用哪个容器
                    striped: false,                      //是否显示行间隔色
                    cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                    pagination: true,                   //是否显示分页（*）
                    sortable: true,                     //是否启用排序
                    sortOrder: "asc",                   //排序方式
                    sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                    pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
                    pageSize: 12,                     //每页的记录行数（*）
                    pageList: [5, 10, 15, 20],        //可供选择的每页的行数（*）
                    search: false,                      //是否显示表格搜索
                    strictSearch: true,
                    // showColumns: true,                  //是否显示所有的列（选择显示的列）
                    // showRefresh: true,                  //是否显示刷新按钮
                    minimumCountColumns: 2,             //最少允许的列数
                    clickToSelect: true,                //是否启用点击选中行
                    paginationPreText: "上一页",
                    paginationNextText: "下一页",
                    //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                    uniqueId: "id",                     //每一行的唯一标识，一般为主键列
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
        
                        var tableId = document.getElementById("grid");
                        var row = tableId.rows[1];
                        $(row).addClass('changeColor');
                        getWcqkzbs(data.rows[0]);

                    },
                    onLoadError: function () {
//                        console.log('数据加载失败...')
                    },
                    responseHandler: function(res) {
//                    console.log(res);
                    return {
                        "total": res.totalCount,//总条数
                        "rows": res.list   //数据
                    };
                },
                //点击表格某一行
                onClickRow:function (row,field,$element) {
//                    console.log($(field[0]));
                    //点击某行使其变色
                    $("tr").removeClass('changeColor');
                    $(field[0]).addClass('changeColor');
                    //获取本月完成情况占比，上月完成情况占比，去年同期完成情况占比
                    getWcqkzbs(row);

                },
                onEditableSave: function (field, row, oldValue, $el) {
                    $.ajax({
                        type: "post",
                        url: basePath + "/assetsTurnoverRate/threeMonthStockRatio/updateByTargetVal.do",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({"startMonth":$("input[name='startMonth']").val().replace("-",""),"endMonth":$("input[name='endMonth']").val().replace("-",""),"mkhjx":row.mkhjx,"id":row.id}),
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
                });

            //查询
            $('#btnSearch').click(function () {
            	//根据日期的变换改变第一行数据的信息为该时间内的最后一个月份的数据
            	lastMonthData();
                //更新表格
                $("#grid").bootstrapTable('refresh');
            });
            //提交
            $('#submitBtn').click(function () {
            	updateMaterialId(getSelectData("brand_desc"),getSelectData("model_desc"),getSelectData("configure_desc"),$('#month').val());
            });

    }


});
function createCols(params,titles) {
    if(params.length!=titles.length)
        return null;
    var arr = [];
    for(var i = 0;i<params.length;i++) {
        var obj = {};
        if(titles[i] == '免考核机型'){
    /*    	obj.formatter =function (value,row,index){
        		var	add = '<button class="ui-pg-div ui-pg-button ui-corner-all  ui-state-hover"   id="set_up_exemption_model" ' +
				  ' onclick="set_up_exemption_model()" title="设置免考核机型">' +
				'  设置免考核机型</button>'; 
					return add;
        	}*/
           /* obj.editable={
            		 type : 'select2',
            		 title : '免考核机型',
            		 field : 'mkhjx',
            		 mode:'inline',
            		 emptytext : "请选择免考核机型",
            		 placement : 'top',
            		 source : function() {
            			 //动态获取数据 
            			 var result = [];
            			 $.each(select2_data, function(key, value) {
            				 result.push({   
            					 value : value.value, 
            					 text : value.text 
            					 });        
            				 }); 
            			 return result;
            		 },
	               inputclass:'input-large',                
	                 select2:{                    
	                	allowClear : true,                    
	                	multiple : true,
	                	//多选                    
	                	tokenSeparators : [",", " "],                   
	                	width : '250px'//设置宽               
	                }
            };*/
           
            
     

        }
        else if(titles[i] == '手工调整项'){
            obj.editable={type: 'text', title: '编辑', validate:  function (v) {}}
        }
        obj.field = params[i];
        obj.title = titles[i];
        obj.align = 'center';
        arr.push(obj);
    }
    // arr.push({field: "candle",title: "编辑",editable:{type: 'text', title: '编辑', validate:  function (v) {}}})
    return arr;
}
function queryParams (params) {
    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
    var temp = {
        pageSize: params.limit,                         //页面大小
        page: (params.offset / params.limit) + 1,   //页码
        // sort: params.sort,      //排序列名
        // sortOrder: params.order, //排位命令（desc，asc）
        startMonth:$("input[name='startMonth']").val().replace("-",""),
        endMonth:$("input[name='endMonth']").val().replace("-","")
    };
    return temp;
}
function getWcqkzbs(row) {
    $.ajax({
        type: "post",
        url: basePath + "/assetsTurnoverRate/threeMonthStockRatio/getWcqkzbs.do",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(row),
        dataType: 'JSON',
        success: function (data) {
        	 $("#yf").text(data.yf);
            initEchart(data.currentMonthWcqkzb,data.lastMonthWcqkzb,data.lastYearWcqkzb,'char_bar','考核库龄段90-180天占比');
            initEchart(data.currentMonthWcqkzb2,data.lastMonthWcqkzb2,data.lastYearWcqkzb2,'char_bar2','考核库龄段180-360天占比');
            initEchart(data.currentMonthWcqkzb3,data.lastMonthWcqkzb3,data.lastYearWcqkzb2,'char_bar3','考核库龄段360天以上天占比');
        },
        error: function () {

        },
        complete: function () {

        }
    });
}
function lastMonthData(){
	 $.ajax({
		   type: 'post',
		   url: basePath+'/assetsTurnoverRate/threeMonthStockRatio/getLastData.do',
        contentType: "application/json; charset=utf-8",
		   data: JSON.stringify({endMonth:$("#endMonth").val()}),
		   async: false,
		   dataType: 'json',
		   success: function(result){
		       $('#hKhkld90').text(result.khknld90tsl);
            $('#hKhkld180').text(result.khknld180tsl);
            $('#hKhkld360').text(result.khknld360tsl);
            
            $('#hKhkldzb90').text(result.khknld90zb+"%");
            $('#hKhkldzb180').text(result.khknld180zb+"%");
            $('#hKhkldzb360').text(result.khknld360zb+"%");
		   }
	   });
}
function initEchart(currentMonthWcqkzb,lastMonthWcqkzb,lastYearWcqkzb,id,title){
    var stockUserPaint = initEcharts(echarts,id);//存量用户数
    var option = threeGauge2(currentMonthWcqkzb,lastMonthWcqkzb,lastYearWcqkzb,title);
    stockUserPaint.setOption(option);
}

function getSelectData(id){
	var selectObj = $("#"+id).select2('data');
	var resultValue =[];
	 $.each(selectObj,function(index,data){
		 resultValue[index]=data.id;
	 });
	return resultValue.join(",");
}

function set_up_exemption_model(){
	$('#myModal').modal('show');
	queryBrand();
	queryModel(getSelectData("brand_desc"));
	queryConfigureDesc(getSelectData("brand_desc"),getSelectData("model_desc"))
}


function queryBrand(){
	$("#brand_desc").empty();
	$("#brand_desc").select2({
		  data: select2_data
	});
	$("#brand_desc").off("select2:select");
	$("#brand_desc").on("change",function(e){ 				
	//clickBrand();
 
		queryModel(getSelectData("brand_desc"));
		queryConfigureDesc(getSelectData("brand_desc"),getSelectData("model_desc"))
	});
	
}
function queryModel(brand_id){
	 $.ajax({                               
		 url : basePath + "/assetsTurnoverRate/threeMonthStockRatio/queryModel.do",
		 async : false,
		 type : "post",
		 data : {brand_id:brand_id},
		 success : function(data, status) {
			 
			    $("#model_desc").empty();
				$("#model_desc").select2({
					  data: data
				});
				$("#model_desc").off("select2:select");
				$("#model_desc").on("change",function(e){ 				
				//clickBrand();
					queryConfigureDesc(getSelectData("brand_desc"),getSelectData("model_desc"))
				});     
			 }             
		 });   
}

function queryConfigureDesc(brand_id,mobile_type){
	 $.ajax({                               
		 url : basePath + "/assetsTurnoverRate/threeMonthStockRatio/queryConfigureDesc.do",
		 async : false,
		 type : "post",
		 data : {brand_id:brand_id,mobile_type:mobile_type},
		 success : function(data, status) {
			 
			    $("#configure_desc").empty();
				$("#configure_desc").select2({
					  data: data
				});
				$("#configure_desc").off("select2:select");
				$("#configure_desc").on("select2:select",function(e){ 				
				//clickBrand();
				});     
			 }             
		 });  
	
}
function updateMaterialId(brand_id,mobile_type,configure_id,month){
	 $.ajax({                               
		 url : basePath + "/assetsTurnoverRate/threeMonthStockRatio/updateMaterialId.do",
		 async : false,
		 type : "post",
		 data : {brand_id:brand_id,mobile_type:mobile_type,configure_id:configure_id,month:month},
		 success : function(data, status) {
			 if(data.message == "success"){
				 	//根据日期的变换改变第一行数据的信息为该时间内的最后一个月份的数据
	            	lastMonthData();
	                //更新表格
	                $("#grid").bootstrapTable('refresh');
	                $('#myModal').modal('hide');
			 }else{
				 
			 }
			 
		 }             
	  });  
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
    	if(billcyc == null|| billcyc==""  ){
    		  var date = new Date();
                year = date.getFullYear();
                month = date.getMonth();
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