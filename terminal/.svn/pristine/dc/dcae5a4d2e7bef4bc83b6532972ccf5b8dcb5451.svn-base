<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>dialog</title>
	<style>
		.dialogContent div{
			color: #000000;
		}
		.modal-body {
			background-color: #ffffff;
			height:600px;
		}
		.modal-footer{
			background-color:#1d7db1;
		}
		.modal-header{
			background-color: #337ab7;
			color:#fff;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			//初始化时间
			initTime();
			//初始化字段名称下拉框
			selectFieldName();
			//初始化列表
			loadTable1('#grid1',
					basePath + "/provinceKpi/adjust_log.do",
		            ['month','kpiName','fieldName','tzq','tzz','tzh','tz_time','userID','userName','bz'],
		            [ '账期', '指标名称','字段名称','调整前值','调整值','调整后值','调整时间','账号id','调整人名称','备注'],
		            true);
			//查询
			$("#btn_Search").click(function(){
				$("#grid1").bootstrapTable('refresh');
			});
			
		});
		
		
	//初始化时间
	function initTime(){
		var month =$("#select_yf").val();
        $("input[name='month']").val(month);
        $("input[name='startTime']").val("");
        $("input[name='stopTime']").val("");
	}
	//初始化字段名称下拉框
	function selectFieldName(){
		var flag=$("#flag").val();
		$.ajax({
            type: "post",
            url: basePath + "/provinceKpi/getFieldNames.do",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({"flag":flag}),
            dataType: 'JSON',
            success: function (result) {
            	for (var i = 0; i < result.length; i++) {
            		$("#fieldName_s").append("<option value='"+result[i]+"'>"+result[i]+"</option>");
            	}
            },
            error: function () {
                alert('跳转调整界面时获取数据失败');
            },
            complete: function () {

            }
        });
		//var field=$("#fieldName_s").val();
	}
	
	//初始化列表
	function loadTable1(table,url,params,titles,hasCheckbox) {
    $(table).bootstrapTable({
    	url: url,         //请求后台的URL（*）
        method: 'post',                      //请求方式（*）
        toolbar: '#toolbar',                //工具按钮用哪个容器
        striped: false,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        sortable: false,                     //是否启用排序
        sortOrder: "asc",                   //排序方式
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber:1,                       //初始化加载第一页，默认第一页
        pageSize: 5,                       //每页的记录行数（*）
        pageList: [5,10],        //可供选择的每页的行数（*）
        search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
        strictSearch: false,
        showColumns: true,                  //是否显示所有的列
        showRefresh: true,                  //是否显示刷新按钮
        minimumCountColumns: 2,             //最少允许的列数
        clickToSelect: true,                //是否启用点击选中行
       // height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "id",                     //每一行的唯一标识，一般为主键列
        showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
        cardView: false,                    //是否显示详细视图
        detailView: false,                   //是否显示父子表
        //得到查询的参数
        queryParams : queryParams1,
        columns: createCols(params,titles),
            onLoadSuccess:function(data){
                console.log('数据加载成功...');
            },
            onLoadError: function () {
                console.log('数据加载失败...')
            },
            responseHandler: function(res) {
            console.log(res);
            return {
                "total": res.totalCount,//总条数
                "rows": res.list  //数据
            };
        }
        });
   
}
	//列表参数
	function  queryParams1(params){
		//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        var temp = {
            pageSize: params.limit,                         //页面大小
            page: (params.offset / params.limit) + 1,   //页码
            month:$("#month").val(),
            kpiName:$("#flag").val(),
            fieldName:$("#fieldName_s").val(),
            startTime:$("#startTime").val(),
            stopTime:$("#stopTime").val()
        };
        return temp;
	}
	
	
	 function createCols(params,titles) {
	        if(params.length!=titles.length)
	            return null;
	        var arr = [];
	        for(var i = 0;i<params.length;i++) {
	            var obj = {};
	            obj.field = params[i];
	            obj.title = titles[i];
	            obj.align = 'center';
	            arr.push(obj);
	        }
	        // arr.push({field: "candle",title: "编辑",editable:{type: 'text', title: '编辑', validate:  function (v) {}}})
	        return arr;
	    }
	 
	</script>
</head>
<body >
<div class="dialogContent">
<div id="box_list">
		<div style="float:left">
			账期：<input id="month" name="month" type="text" style="width:130px;color:black;" onClick="WdatePicker({dateFmt:'yyyyMM'})" readonly="readonly" class="form-text select"/>
			&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div style="float:left">
			<select id="fieldName_s" class="select" style="color:blue;">
					<option value="">全部</option>
			</select>
		</div>
		<div style="float:left">
			调整时间:<input id="startTime" name="startTime" type="text" style="width:130px;color:black;" onClick="WdatePicker({dateFmt:'yyyyMMdd'})" readonly="readonly" class="form-text select"/>
			&nbsp;&nbsp;--&nbsp;&nbsp;
			<input id="stopTime" name="stopTime" type="text" style="width:130px;color:black;" onClick="WdatePicker({dateFmt:'yyyyMMdd'})" readonly="readonly" class="form-text select"/>
		</div>
		<div style="float:left" class="col-xs-1"  >
			<input id="btn_Search" type="button" value="查询"  style="width:80px;" class="btn btn-primary"/>
		</div>
		<br/>
	  <div class="form-group">
	    <table id="grid1" style="border:1px #ccc solid;width:100%;height:100%" >
	    </table>
	    <div id="pager1"></div>
	  </div>
	</div>
</div>
</body>

</html>
