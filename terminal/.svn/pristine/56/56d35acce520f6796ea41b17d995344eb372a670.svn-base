$(function() {
    //设置默认月份
    setAutoMonth();

    //
    getLastData();
    
    refreshChar();

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
        	if(billcyc == null|| billcyc==""  ){
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
            var endMonth = String(year) +"-"+ month;
            $("input[name='startMonth']").val(startMonth);
            $("input[name='endMonth']").val(endMonth);
        }

        loadTable('#grid',
            basePath + "/totalProfit/feeProgressBalance/list.do",
            ['month','zzc','sgtzx','hlwzc','khqljchdj','khqljrglcb','bykhfy','bhdjhrglcbys'
                ,'byjd','ljkhfy','fyjd','fyjdjhx','df' ],
            ['月份','总支出','手工调整项目','互联网支出','考核期累计存货跌价','考核期累计人工类成本','本月考核费用','不含跌价和人工类成本预算'
                ,'本月进度','累计考核费用','费用进度','费用进度均衡性','得分'],
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
//                        console.log('数据加载成功...');
                        var tableId = document.getElementById("grid");
                        var row = tableId.rows[1];
                        $(row).addClass('changeColor');
                        $("#select_yf").val($("#grid tbody tr:eq(0) td:eq(0)").text());
                        // getWcqkzbs(data.rows[0]);

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
                    $("#select_yf").val(row.month);
                    //获取本月完成情况占比，上月完成情况占比，去年同期完成情况占比
                    getWcqkzbs(row);

                },
                onEditableSave: function (field, row, oldValue, $el) {
                    $.ajax({
                        type: "post",
                        url: basePath + "/totalProfit/feeProgressBalance/updateByTargetVal.do",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({"endMonth":row.month,"sgtzx":row.sgtzx,"bhdjhrglcbys":row.bhdjhrglcbys}),
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
            	//
            	getLastData();
                //更新表格
                $("#grid").bootstrapTable('refresh');
                //更新图表
                refreshChar();
            })

    }

    function createCols(params,titles) {
        if(params.length!=titles.length)
            return null;
        var arr = [];
        for(var i = 0;i<params.length;i++) {
            var obj = {};
//            if(titles[i] == '手工调整项目'){
//                obj.editable={type: 'text', title: '编辑', validate:  function (v) {}}
//            }
//            else if(titles[i] == '不含跌价和人工类成本预算'){
//                obj.editable={type: 'text', title: '编辑', validate:  function (v) {}}
//            }
//            else if(titles[i] == '一季度费用累计'){
//                obj.formatter = function (value, row, index) {
//                    var id = row.id;
//                    var process = getFormat(id,'yjd');
//                    return process;
//                };
//            }
//            else if(titles[i] == '二季度费用累计'){
//                obj.formatter = function (value, row, index) {
//                    var id = row.id;
//                    var process = getFormat(id,'ejd');
//                    return process;
//                };
//            }
//            else if(titles[i] == '三季度费用累计'){
//                obj.formatter = function (value, row, index) {
//                    var id = row.id;
//                    var process = getFormat(id,'sjd');
//                    return process;
//                };
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

    function getFormat(id,flag){
        var str = '';
        $.ajax({
            type: 'get',
            url: basePath+'/totalProfit/feeProgressBalance/getFormat.do?id=' + id + '&&flag=' + flag,
            async: false,
            success: function(result){
                str = result.formatStr;
            }
        });
        return str;
    }



});

function getLastData(){
    $.ajax({
		   type: 'post',
		   url: basePath+'/totalProfit/feeProgressBalance/getLastData.do',
          contentType: "application/json; charset=utf-8",
		   data: JSON.stringify({"endMonth":$("input[name='endMonth']").val()}),
		   async: false,
		   dataType: 'json',
		   success: function(result){
			   if(Math.abs(result.bykhfy/100000000)>=1){
            	   $('#hBykhfy').text((result.bykhfy/100000000).toFixed(2)+"亿");
               }else if(Math.abs(result.bykhfy/10000)>=1){
            	   $('#hBykhfy').text((result.bykhfy/10000).toFixed(2)+"万");
               }else{
            	   $('#hBykhfy').text(result.bykhfy);
               }  
               $('#hByjd').text(result.byjd*100+"%");
               if(Math.abs(result.ljkhfy/100000000)>=1){
              	   $('#hLjkhfy').text((result.ljkhfy/100000000).toFixed(2)+"亿");
                 }else if(Math.abs(result.ljkhfy/10000)>=1){
                	 $('#hLjkhfy').text((result.ljkhfy/10000).toFixed(2)+"万");
                 }else{
                	 $('#hLjkhfy').text(result.ljkhfy);
                 }  
//		       $('#hBykhfy').text(result.bykhfy);
//              $('#hByjd').text(result.byjd);
//              $('#hLjkhfy').text(result.ljkhfy);
              
		   }
	   });

}


function initEchart(months,qnwcsrs,qnwcds){
    var stockUserPaint = initEcharts(echarts,"char_bar");//存量用户数
    var option = buildLineAndBarChart();
    option.xAxis[0].data=months;
    option.yAxis[0].name= '本月考核费用(亿)';
    option.yAxis[1].name= '本月进度(%)';
    option.series[0].data=qnwcsrs;
    option.series[1].data=qnwcds;
    stockUserPaint.setOption(option); //新入盘量
}


function refreshChar(){
	  //更新图表
  $.ajax({
      type: 'post',
      url: basePath+'/totalProfit/feeProgressBalance/getEchartData.do',
      contentType: "application/json; charset=utf-8",
      data: JSON.stringify({"startMonth":$("input[name='startMonth']").val().replace("-",""),"endMonth":$("input[name='endMonth']").val().replace("-","")}),
      async: false,
      dataType: 'json',
      success: function(result,textStatus){
          //初始化图表
          initEchart(result.months,result.qnwcsrs,result.qnwcds);
      }
  });
}

