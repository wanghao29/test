$(function() {
    //设置默认月份
//    setAutoMonth();
	$("input[name='startMonth']").val('201812');
    $("input[name='endMonth']").val('201812');
   
    //
    getLastData();

    $('#addBtn').click(function () {
        //ction="${pageContext.request.contextPath }/corporationCollaboration/salesShare4G/addAndEdit.do

        BootstrapDialog.show({
            title: '4G+销量份额',
            message: $('<div></div>').load(basePath + '/corporationCollaboration/salesShare4G/dialog/getDialog.do',{limit: 25}, function(data){

            }),
            buttons: [{
                label: '确定',
                action: function(dialog) {
                	
                	$('#addForm').validate({
                		rules : {
                			month : {
                				required : true
                			},
                			khjx : {
                				required : true,
                			},
                			dyzb : {
                				required : true,
                				digits:true
                			},
                			syzb : {
                				required : true,
                				digits:true
                			},
                			jcdf : {
                				required : true,
                				digits:true
                			},
                			jf : {
                				required : true,
                				digits:true
                			},
                			gydf : {
                				required : true,
                				digits:true
                			},
                			df : {
                				required : true,
                				digits:true
                			}
                		},
                		messages : {
                			month :{
                				required : "账期不能为空！"
                			},
                			khjx : {
                				required : "请输入考核机型！",
                			},
                			dyzb : {
                				required : "请输入当月占比！",
                				digits:"请输入合法数值!"
                			},
                			syzb : {
                				required : "请输入上月占比！",
                				digits:"请输入合法数值!"
                			},
                			jcdf : {
                				required : "请输入基础得分！",
                					digits:"请输入合法得分!"
                			},
                			jf : {
                				required : "请输入加分！",
            					digits:"请输入合法得分!"
                			},
                			gydf : {
                				required : "请输入本月得分！",
            					digits:"请输入合法得分!"
                			},
                			df : {
                				required : "请输入省协同满意度得分！",
            					digits:"请输入合法得分!"
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
                	
                	
                	var validOK = $('#addForm').valid();
                	if(!validOK){
                		return;
                	}else{
                		 addsales();
                         dialog.close();
                	}
                		
                	
                	
                   
                }
            }, {
                label: '取消',
                action: function(dialog) {
                    dialog.close();
                }
            }]
        });
    
        
        
        
        
        
    })

     

    function addsales(){
        // var formData = new FormData(document.getElementById("addForm"));
        // console.log(formData);
    	var data=$('#addForm').formToArray();
    	//alert(JSON.stringify(data));
        $.ajax({
            url:basePath + "/corporationCollaboration/salesShare4G/addAndEdit.do",
            type:"POST",
            datatype:"JSON",
       /*     contentType: "application/json; charset=utf-8",*/
          /*  traditional:true,*/
            data:data,
            success:function(data){
                $("#grid").bootstrapTable('refresh');
            },
            error:function(e){

            }
        });
    }

        function setAutoMonth(){
/*            var date = new Date();
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
                    month = date.getMonth() ;
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

        loadTable('#grid',
            basePath + "/corporationCollaboration/salesShare4G/list.do",
            ['month','khjx','dyzb','syzb','jcdf','jf','gydf','df'],
            ['月份','考核机型','当月占比','上月占比','基础得分','加分','各月得分','得分'],
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
                        var row = tableId.rows[2];
                        $(row).addClass('changeColor');
                        $("#select_yf").val($("#grid tbody tr:eq(0) td:eq(0)").text());
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
                    $("#select_yf").val(row.month);
                    //获取本月完成情况占比，上月完成情况占比，去年同期完成情况占比
                    getWcqkzbs(row);

                },
                onEditableSave: function (field, row, oldValue, $el) {
                    $.ajax({
                        type: "post",
                        url: basePath + "/corporationCollaboration/salesShare4G/updateByReceivePayment.do",
                        data: row,
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
            })

    }

    function createCols(params,titles) {
        if(params.length!=titles.length)
            return null;
        var total = [];
        var arr = [];
        var head = [];
        for(var i = 0;i<params.length;i++) {
            var obj = {};
//            if(titles[i] == '各月得分'){
//                obj.editable={type: 'text', title: '编辑', validate:  function (v) {}}
//            } else if(titles[i] == '得分'){
//                obj.editable={type: 'text', title: '编辑', validate:  function (v) {}}
//            }else if(titles[i] == '当月占比'){
//            	   obj.editable={type: 'text', title: '编辑', validate:  function (v) {}}
//            }else if(titles[i] == '上月占比'){
//            	   obj.editable={type: 'text', title: '编辑', validate:  function (v) {}}
//            }else if(titles[i] == '基础得分'){
//            	   obj.editable={type: 'text', title: '编辑', validate:  function (v) {}}
//            }else if(titles[i] == '考核机型'){
//            	   obj.editable={type: 'text', title: '编辑', validate:  function (v) {}}
//            }else if(titles[i] == '加分'){
//            	   obj.editable={type: 'text', title: '编辑', validate:  function (v) {}}
//            }
       
            obj.field = params[i];
            obj.title = titles[i];
            obj.align = 'center';
            arr.push(obj);
        }
        var head1 = {
            title: "4G+销量份额",
            valign:"middle",
            align:"center",
            colspan: 7
            // rowspan: 1
        };
        var head2 = {
            title: "省移动协同满意度",
            valign:"middle",
            align:"center",
            colspan: 1
        };
        head.push(head1);
        head.push(head2);
        // arr.splice(1, 0, head2);
        // arr.push({field: "candle",title: "编辑",editable:{type: 'text', title: '编辑', validate:  function (v) {}}})
        total.push(head);
        total.push(arr);
        return total;
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
            url: basePath + "/corporationCollaboration/salesShare4G/getWcqkzbs.do",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(row),
            dataType: 'JSON',
            success: function (data) {
            	$("#yf").text(data.yf);
                initEchart(data.currentMonthWcqkzb,data.lastMonthWcqkzb,data.lastYearWcqkzb);
            },
            error: function () {

            },
            complete: function () {

            }
        });
    }

});

function getLastData(){
	$.ajax({
		   type: 'post',
		   url: basePath+'/corporationCollaboration/salesShare4G/getLastData.do',
	    contentType: "application/json; charset=utf-8",
		   data: JSON.stringify({endMonth:$("input[name='endMonth']").val()}),
		   async: false,
		   dataType: 'json',
		   success: function(result){
		    $('#hDyzb').text(result.dyzb);
	        $('#hJcdf').text(result.jcdf);
	        $('#hJf').text(result.jf);
	        $('#hGydf').text(result.gydf);
		   }
	});
}

function initEchart(currentMonthWcqkzb,lastMonthWcqkzb,lastYearWcqkzb){
    var stockUserPaint = initEcharts(echarts,"char_bar");//存量用户数
    var option = threeGauge2(currentMonthWcqkzb.toFixed(0),lastMonthWcqkzb.toFixed(0),lastYearWcqkzb.toFixed(0),'回款预测准确度');
    stockUserPaint.setOption(option); //新入盘量
 }

