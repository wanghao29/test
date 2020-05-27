$(function() {
    //设置默认月份
//    setAutoMonth();
	$("input[name='startMonth']").val('201812');
    $("input[name='endMonth']").val('201812');
    
    //最后一条数据
    getLastData();
    
     

    loadTable('#grid',
            basePath + "/pointOption/newRetailOperation/list.do",
            ['month','xlsmdhj','xlsmdyydf'],
            ['月份','新零售门店合计','新零售门店运营得分'],
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

                onEditableSave: function (field, row, oldValue, $el) {
                        $.ajax({
                            type: "post",
                            url: basePath + "/pointOption/newRetailOperation/updateByTargetVal.do",
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify(row),
                            dataType: 'JSON',
                            success: function (data, status) {
                                if (status == "success") {
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
                $.ajax({
                    type: 'post',
                    url: basePath+'/pointOption/newRetailOperation/getEchartData.do',
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({"startMonth":$("input[name='startMonth']").val().replace("-",""),"endMonth":$("input[name='endMonth']").val().replace("-","")}),
                    async: false,
                    dataType: 'json',
                    success: function(result,textStatus){
                        //初始化图表
                        initEchart(result.months,result.qnwcsrs);
                    }
                });
            })
            $('#addBtn').click(function () {
            	$('#add_and_edit_model').modal('show');
            	
            });
             $('#saveBtn').click(function () {
            	 
            	 var validOK = $('#add_form').valid();
            	 if(!validOK){
            			return;
             	}else{
             		 $.ajax({
                         type: 'post',
                         url: basePath+'/pointOption/newRetailOperation/addnewRetailOperation.do',
                         data: {"xlsmdhj":$("input[name='xlsmdhj']").val(),"billcyc":$("input[name='billcyc']").val().replace("-","")},
                         async: false,
                         dataType: 'json',
                         success: function(result,textStatus){
                             //初始化图表
                             initEchart(result.months,result.qnwcsrs);
                             $("#grid").bootstrapTable('refresh');
                         	$('#add_and_edit_model').modal('hide');
                         }
                     });
             	}
            	 
            	
             });
            
             
         	$('#add_form').validate({
        		rules : {
        			billcyc : {
        				required : true
        			},
        			xlsmdhj : {
        				required : true,
        				digits:true
        			}
        		},
        		messages : {
        			billcyc :{
        				required : "月份不能为空！"
        			} ,
        			xlsmdhj : {
        				required : "请输入新零售门店合计！",
    					digits:"请输入新零售门店合计!"
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
        	
        	
        	
             
            

    }

    function updateByPrimaryKey (row) {
        $.ajax({
            type: "post",
            url: basePath + "/pointOption/newRetailOperation/updateByPrimaryKey.do",
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
            if(titles[i] == '新零售门店合计'){
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
});

function getLastData(){
    $.ajax({
		   type: 'post',
		   url: basePath+'/pointOption/newRetailOperation/getEchartData.do',
          contentType: "application/json; charset=utf-8",
		   data: JSON.stringify({"startMonth":$("input[name='startMonth']").val(),"endMonth":$("input[name='endMonth']").val()}),
		   async: false,
		   dataType: 'json',
		   success: function(result,textStatus){
		       //设置上端的几个关键值
              var xlsmdhj = result.lastData.xlsmdhj;
              var xlsmdyydf = result.lastData.xlsmdyydf;
              $('#hXlsmdhj').text(xlsmdhj);
              $('#hXlsmdyydf').text(xlsmdyydf);
              //初始化图表
              initEchart(result.months,result.qnwcsrs);
		   }
	   });
}

function initEchart(months,qnwcsrs){
    var stockUserPaint = initEcharts(echarts,"char_bar");//存量用户数
    var option = barOption(months,qnwcsrs);
    option.xAxis[0].name="月份";
    option.yAxis[0].name="新零售门店合计";
    stockUserPaint.setOption(option); //新入盘量
}

function setAutoMonth(){
     /*  var date = new Date();
       var year = date.getFullYear();
       var month = date.getMonth() + 1;
       if (month >= 1 && month <= 9) {
           month = "0" + month;
       }*/
/*	  var billcyc = $("#billcyc").val();
      var year = billcyc.substring(0,4);
      var month = billcyc.substring(4,billcyc.length);*/
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
       var endMonth = String(year) + "-"+month;
       $("input[name='startMonth']").val(startMonth);
       $("input[name='endMonth']").val(endMonth);
   }