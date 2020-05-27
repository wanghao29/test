$(function() {
    //设置默认月份
//    setAutoMonth();
	$("input[name='startMonth']").val('201812');
    $("input[name='endMonth']").val('201812');

    getLastData();

     

        loadTable('#grid',
            basePath + "/terminalSales/terminalSales/list.do",
            ['month','scmxtxl','hlwxl','hlwsj','tzxl','bykhxl','qnljxl','mbz','sjwcd','qnwcd','bysrwcl','fz'],
            ['月份','SCM系统销量','互联网销量','互联网双计','调整销量','本月考核销量','全年累计销量','目标值','时间完成度','全年完成度','本月收入完成率','分值'],
            true);

        function loadTable(table,url,params,titles,hasCheckbox) {
            $(table).bootstrapTable({
                    url: url,                      //请求后台的URL（*）
                    method: 'post',                      //请求方式（*）
                  /*  height : 200,*/
                    toolbar: '#toolbar',              //工具按钮用哪个容器
                    striped: true,                      //是否显示行间隔色
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
                    showColumns: true,                  //是否显示所有的列（选择显示的列）
                    showRefresh: true,                  //是否显示刷新按钮
                    minimumCountColumns: 2,             //最少允许的列数
                    clickToSelect: true,                //是否启用点击选中行
                    paginationPreText: "上一页",
                    paginationNextText: "下一页",
                    //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                    uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                    showToggle: false,                   //是否显示详细视图和列表视图的切换按钮
                    cardView: false,                    //是否显示详细视图
                    detailView: false,                  //是否显示父子表
                    //得到查询的参数
                    queryParams : queryParams,
                    columns: createCols(params,titles),
                    onLoadSuccess: function () {
                   	 $(".fixed-table-toolbar").hide();
                    },
                    onLoadSuccess:function(data){
//                        console.log('数据加载成功...');
                        var tableId = document.getElementById("grid");
                        var row = tableId.rows[1];
                        $(row).addClass('changeColor');
                        $("#select_yf").val($("#grid tbody tr:eq(0) td:eq(0)").text());
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
                onClickRow:function (row,field,$element){//点击表格某一行
//                    console.log($(field[0]));
                    //点击某行使其变色
                    $("tr").removeClass('changeColor');
                    $(field[0]).addClass('changeColor');
                    //获取本月完成情况占比，上月完成情况占比，去年同期完成情况占比
                  $("#select_yf").val(row.month);
                },
                onEditableSave: function (field, row, oldValue, $el) {
                    if(field == 'mbz'){
                    	 $.ajax({
                             type: "post",
                             url: basePath + "/terminalSales/terminalSales/updateByTargetVal.do",
                             contentType: "application/json; charset=utf-8",
                             data: JSON.stringify(row),
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
                    }else if (field == 'hlwsj'){
	                    $.ajax({
	                        type: "post",
	                        url: basePath + "/terminalSales/terminalSales/update.do",
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
                    }  else if (field == 'tzxl'){
	                    $.ajax({
	                        type: "post",
	                        url: basePath + "/terminalSales/terminalSales/update.do",
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
                    
                    
                    
                    
                }
                });

            //查询
            $('#btnSearch').click(function () {
                //更新表格
                $("#grid").bootstrapTable('refresh');
                //更新图表
                getLastData();
            })

    }

    function createCols(params,titles) {
        if(params.length!=titles.length)
            return null;
        var arr = [];
        for(var i = 0;i<params.length;i++) {
            var obj = {};
//            if(titles[i] == '目标值'){
//                obj.editable={type: 'text', title: '编辑', validate:  function (v) {if(v<'0'){return '目标值不能修改为0';}}}
//            }else if(titles[i] == "互联网双计"){
//            	 obj.editable={type: 'text', title: '编辑', validate:  function (v) {if(v<'0'){return '目标值不能修改为0';}}}
//            }else if(titles[i] == "调整销量"){
//            	 obj.editable={type: 'text', title: '编辑', validate:  function (v) {if(v<'0'){return '目标值不能修改为0';}}}
//            }
            
            
            
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
});

function getLastData(){
	$.ajax({
		   type: 'post',
		   url: basePath+'/terminalSales/terminalSales/getEchartData.do',
        contentType: "application/json; charset=utf-8",
		   data: JSON.stringify({"startMonth":$("input[name='startMonth']").val().replace("-",""),"endMonth":$("input[name='endMonth']").val().replace("-","")}),
		   async: false,
		   dataType: 'json',
		   success: function(result,textStatus){
		       //设置上端三个累加值
            var lastQnljxl = result.lastData.qnljxl;
            var lastQnwcd = result.lastData.qnwcd;
            var lastBykhxl = result.lastData.bykhxl;
            if(Math.abs(lastQnljxl/10000)>=1){
         	   $('#all_year_sales').text((Number(lastQnljxl)/10000).toFixed(2)+"万");
            }else if(Math.abs(lastQnljxl/100000000)>=1){
         	   $('#all_year_sales').text((Number(lastQnljxl)/100000000).toFixed(2)+"亿");
            }else{
            	 $('#all_year_sales').text((Number(lastQnljxl)).toFixed(2));
            }
            if(Math.abs(lastBykhxl/10000)>=1){
          	   $('#this_month_sales').text((Number(lastBykhxl)/10000).toFixed(2)+"万");
             }else if(Math.abs(lastBykhxl/100000000)>=1){
          	   $('#this_month_sales').text((Number(lastBykhxl)/100000000).toFixed(2)+"亿");
             }else{
            	 $('#this_month_sales').text((Number(lastBykhxl)).toFixed(2));
             }
             $('#hQnwcd').text(lastQnwcd*100+"%");
           
            //初始化图表
            initEchart(result.months,result.bykhxl,result.bysrwcl);
		   }
	   });
}

function initEchart(months,bykhxl,bysrwcl){

    var stockUserPaint = initEcharts(echarts,"char_bar");//存量用户数
    var option = buildLineAndBarChart();
    option.xAxis[0].data=months;
    option.yAxis[0].name= '本月考核销量(亿)';
    option.yAxis[1].name= '本月完成率(%)';
    option.legend.data = ['本月考核销量','本月完成率'];
    option.series[0].data=bykhxl;
    option.series[1].data=bysrwcl;
    stockUserPaint.setOption(option); //新入盘量
}


   function setAutoMonth(){
    /*   var date = new Date();
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
       var startMonth = year + "-01";
       var endMonth = String(year) + "-"+month;
       $("input[name='startMonth']").val(startMonth);
       $("input[name='endMonth']").val(endMonth);
   }
 
