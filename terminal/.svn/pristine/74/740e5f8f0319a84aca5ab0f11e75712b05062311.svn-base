$(function() {
    //设置默认月份
    setAutoMonth();
    //
//    initEchart();
    getEchartData();
    //新增窗口功能
    addItion();
    
    //加载数据列表
    loadTable('#grid',
            basePath + "/pointOption/reduceItem/list.do",
            ['month','kfxmc1','kfxfs1','kfxmc2','kfxfs2','kfxmc3','kfxfs3','kfxmc4','kfxfs4','kfxmc5','kfxfs5','kfxmc6','kfxfs6'
                ,'kfxmc7','kfxfs7','kfxmc8','kfxfs8'],
            ['月份','扣分项名称1','扣分项分数1','扣分项名称2','扣分项分数2','扣分项名称3','扣分项分数3','扣分项名称4','扣分项分数4'
                ,'扣分项名称5','扣分项分数5','扣分项名称6','扣分项分数6','扣分项名称7','扣分项分数7','扣分项名称8','扣分项分数8'],
            true);
});

function addRepaymentAccuracyForecast(){
    // var formData = new FormData(document.getElementById("addForm"));
    // console.log(formData);
    $.ajax({
        url:basePath + "/repaymentAccuracyForecast/addAndEdit.do",
        type:"post",
        data:$('#addForm').serialize(),
        success:function(data){
            $("#grid").bootstrapTable('refresh');
        },
        error:function(e){

        }
    });
}


//function initEchart(){
//    var stockUserPaint = initEcharts(echarts,"char_bar");//存量用户数
//        option = {
//            tooltip : {
//                formatter: "{a} <br/>{b} : {c}%"
//            },
//            toolbox: {
//                show : true,
//                feature : {
//                    mark : {show: true},
//                    restore : {show: true},
//                    saveAsImage : {show: true}
//                }
//            },
//            series : [
//                {
//                    name:'个性化仪表盘',
//                    type:'gauge',
//                    center : ['50%', '50%'],    // 默认全局居中
//                    // radius : [0, '75%'],
//                    startAngle: 140,
//                    endAngle : -140,
//                    min: 0,                     // 最小值
//                    max: 100,                   // 最大值
//                    precision: 0,               // 小数精度，默认为0，无小数点
//                    splitNumber: 10,             // 分割段数，默认为5
//                    axisLine: {            // 坐标轴线
//                        show: true,        // 默认显示，属性show控制显示与否
//                        lineStyle: {       // 属性lineStyle控制线条样式
//                            color: [[0.2, 'lightgreen'],[0.4, 'orange'],[0.8, 'skyblue'],[1, '#ff4500']],
//                            width: 30
//                        }
//                    },
//                    axisTick: {            // 坐标轴小标记
//                        show: true,        // 属性show控制显示与否，默认不显示
//                        splitNumber: 5,    // 每份split细分多少段
//                        length :8,         // 属性length控制线长
//                        lineStyle: {       // 属性lineStyle控制线条样式
//                            color: '#eee',
//                            width: 1,
//                            type: 'solid'
//                        }
//                    },
//                    axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
//                        show: true,
//                        formatter: function(v){
//                            switch (v+''){
//                                case '10': return '弱';
//                                case '30': return '低';
//                                case '60': return '中';
//                                case '90': return '高';
//                                default: return '';
//                            }
//                        },
//                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
//                            color: '#333'
//                        }
//                    },
//                    splitLine: {           // 分隔线
//                        show: true,        // 默认显示，属性show控制显示与否
//                        length :30,         // 属性length控制线长
//                        lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
//                            color: '#eee',
//                            width: 2,
//                            type: 'solid'
//                        }
//                    },
//                    pointer : {
//                        length : '80%',
//                        width : 8,
//                        color : 'auto'
//                    },
//                    title : {
//                        show : true,
//                        offsetCenter: ['-65%', -10],       // x, y，单位px
//                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
//                            color: '#333',
//                            fontSize : 15
//                        }
//                    },
//                    detail : {
//                        show : true,
//                        backgroundColor: 'rgba(0,0,0,0)',
//                        borderWidth: 0,
//                        borderColor: '#ccc',
//                        width: 100,
//                        height: 40,
//                        offsetCenter: ['-60%', 10],       // x, y，单位px
//                        formatter:'{value}%',
//                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
//                            color: 'auto',
//                            fontSize : 30
//                        }
//                    },
//                    data:[{value: 0, name: '扣分项合计'}]
//                }
//            ]
//        };
//    stockUserPaint.setOption(option); //新入盘量
// }

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
    var startMonth = year + "-01";
    var endMonth = String(year) +"-"+ month;
    $("input[name='startMonth']").val(startMonth);
    $("input[name='endMonth']").val(endMonth);
}


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
//                console.log('数据加载成功...');
                 var tableId = document.getElementById("grid");
                 var row = tableId.rows[1];
                 $(row).addClass('changeColor');
//                 getWcqkzbs(data.rows[0]);

            },
            onLoadError: function () {
//                console.log('数据加载失败...')
            },
            responseHandler: function(res) {
//            console.log(res);
            return {
                "total": res.totalCount,//总条数
                "rows": res.list   //数据
            };
        },
//        //点击表格某一行
//        onClickRow:function (row,field,$element) {
//            console.log($(field[0]));
//            //点击某行使其变色
//            $("tr").removeClass('changeColor');
//            $(field[0]).addClass('changeColor');
//            //获取本月完成情况占比，上月完成情况占比，去年同期完成情况占比
//            getWcqkzbs(row);
//
//        },
        onEditableSave: function (field, row, oldValue, $el) {
            $.ajax({
                type: "post",
                url: basePath + "/repaymentAccuracyForecast/updateByReceivePayment.do",
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
        }
        });

    //查询
    $('#btnSearch').click(function () {
        //更新表格
        $("#grid").bootstrapTable('refresh');
        
        getEchartData();
    })

}

function createCols(params,titles) {
if(params.length!=titles.length)
    return null;
var arr = [];
for(var i = 0;i<params.length;i++) {
    var obj = {};
//    if(titles[i] == '实际回款'){
//        obj.editable={type: 'text', title: '编辑', validate:  function (v) {}}
//    }
//    else if(titles[i] == '计划回款'){
//        obj.editable={type: 'text', title: '编辑', validate:  function (v) {}}
//    }
//    else if(titles[i] == '回款预测准确度得分'){
//        obj.editable={type: 'text', title: '编辑', validate:  function (v) {}}
//    }
    obj.field = params[i];
    obj.title = titles[i];
    obj.align = 'center';
    arr.push(obj);
}
// arr.push({field: "candle",title: "编辑",editable:{type: 'text', title: '编辑', validate:  function (v) {}}})
return arr;
}

// var processFormatter = function (value, row, index) {
//     var id = row.id
//     var process = getFormat(id);
//     return process;
// }

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
    url: basePath + "/pointOption/reduceItem/getWcqkzbs.do",
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

function addItion(){
	$('#addItem').click(function () {
        BootstrapDialog.show({
            title: '扣分项',
            closable: false,
            message: $('<div></div>').load(basePath + '/pointOption/reduceItem/dialog/getDialog.do',{limit: 25}, 
           function(data){
            	  $("#emphases_product").select2({    	
            	    	data:data,    	
            	    });
            }),
            buttons: [{
                label: '确定',
                action: function(dialog) {
                	    $.ajax({
            		    type: 'post',
            		    url: basePath+'/pointOption/reduceItem/add.do',
                        contentType: "application/json; charset=utf-8",
            		    data:JSON.stringify({
            		    	"month":$("input[name='month']").val(),
            		    	"kfxmc1":$("input[name='kfxmc1']").val(),
            		    	"kfxfs1":$("input[name='kfxfs1']").val(),
            		    	"kfxmc2":$("input[name='kfxmc2']").val(),
            		    	"kfxfs2":$("input[name='kfxfs2']").val(),
            		    	"kfxmc3":$("input[name='kfxmc3']").val(),
            		    	"kfxfs3":$("input[name='kfxfs3']").val(),
            		    	"kfxmc4":$("input[name='kfxmc4']").val(),
            		    	"kfxfs4":$("input[name='kfxfs4']").val(),
            		    	"kfxmc5":$("input[name='kfxmc5']").val(),
            		    	"kfxfs5":$("input[name='kfxfs5']").val(),
            		    	"kfxmc6":$("input[name='kfxmc6']").val(),
            		    	"kfxfs6":$("input[name='kfxfs6']").val(),
            		    	"kfxmc7":$("input[name='kfxmc7']").val(),
            		    	"kfxfs7":$("input[name='kfxfs7']").val(),
            		    	"kfxmc8":$("input[name='kfxmc8']").val(),
            		    	"kfxfs8":$("input[name='kfxfs8']").val()
            		    }),
            		    dataType: 'json',
            		    success: function(result){
            		    	$("#grid").bootstrapTable('refresh');
            		    	alert("success");
            		    	dialog.close();
            		    }
            	    });
                }
            }, {
                label: '取消',
                action: function(dialog) {
                    dialog.close();
                }
            }]
        });
    })
}


function initEchart(months,kfxhj){
    var stockUserPaint = initEcharts(echarts,"char_bar");//存量用户数
    var option = barOption(months,kfxhj);
    option.yAxis[0].name="扣分项合计";
    stockUserPaint.setOption(option); //新入盘量
}

function getEchartData(){
	$.ajax({
		   type: 'post',
		   url: basePath+'/pointOption/reduceItem/getEchartData.do',
        contentType: "application/json; charset=utf-8",
		   data: JSON.stringify({"startMonth":$("input[name='startMonth']").val().replace("-",""),"endMonth":$("input[name='endMonth']").val().replace("-","")}),
		   async: false,
		   dataType: 'json',
		   success: function(result,textStatus){
		       //设置上端的几个关键值
            $('#kfxhj').text(result.lastKfxhj);
            //初始化图表
            initEchart(result.months,result.kfxhj);
		   }
	   });

}

