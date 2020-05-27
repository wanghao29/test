<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="sharainy" tagdir="/WEB-INF/tags" %>  
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
			//文本显示
			hidAdd();
			
			//初始化时间
			initTime();
			
			//初始化列表
			loadTable('#grid',
		            basePath + "/amount/getGrossList.do",
		            ['month','city','brand','value'],
		            [ '月份', '地市', '品牌','毛利额'],
		            true);
			//查询
			$("#btnSearch").click(function(){
				if($("#citySelect").val() != null && $("#citySelect").val() != ""){
					$("#search_hid").val(1);
				}
				if($("#selectBrand").val() != null && $("#selectBrand").val() != ""){
					$("#search_hid").val(1);
				}
				$("#grid").bootstrapTable('refresh');
			});
			
		});
		
	//初始化时间
	function initTime(){
		var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        $("input[name='startMonth']").val(String(year) + "01");
        $("input[name='stopMonth']").val(String(year) + month);
        $("#addMonth").val(String(year) + month);
	}
	//初始化列表
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
            pageSize: 5,                     //每页的记录行数（*）
           	pageList: [5],        //可供选择的每页的行数（*）
            search: false,                      //是否显示表格搜索
            strictSearch: true,
            // showColumns: true,                  //是否显示所有的列（选择显示的列）
            // showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            paginationPreText: "上一页",
            paginationNextText: "下一页",
            height: 300,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            // showToggle: false,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                  //是否显示父子表
            //得到查询的参数
            queryParams : queryParams,
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
                "rows": res.list   //数据
            };
        },
        onEditableSave: function (field, row, oldValue, $el) {
            $.ajax({
                type: "post",
                url: basePath + "/amount/updateByGross.do",
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
}
	function queryParams (params) {
		//如果是点击查询按钮  触发的
		if($("#search_hid").val()==1){
			params.offset=0;
			$("#search_hid").val(0);
		}
        //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        var temp = {
            pageSize: params.limit,                         //页面大小
            page: (params.offset / params.limit) + 1,   //页码
            // sort: params.sort,      //排序列名
            // sortOrder: params.order, //排位命令（desc，asc）
            startMonth:$("input[name='startMonth']").val(),
            stopMonth:$("input[name='stopMonth']").val(),
            city:$("#citySelect").val(),
            brand:$("#selectBrand").val()
        };
        return temp;
    }
	
	function createCols(params,titles) {
        if(params.length!=titles.length)
            return null;
        var arr = [];
        for(var i = 0;i<params.length;i++) {
            var obj = {};
            if(titles[i] == '毛利额'){
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
	//新增文本隐藏
	function hidAdd(){
		$("#box_list").show();
		$("#box_add").hide();
	}
	
	function showAdd(){
		//新增文本显示
		$("#box_list").hide();
		$("#box_add").show();
	}
	
	function addSubmit(){
		if(checkSubmit()){
			$.ajax({
	              type: "post",
	              url: basePath + "/amount/addGross.do",
	              contentType: "application/json; charset=utf-8",
	              data: JSON.stringify({'addMonth':$('#addMonth').val(),'addCity':$('#addCity').val(),'addBrand':$('#addBrand').val(),'addValue':$('#addValue').val()}),
	              dataType: 'JSON',
	              success: function (data, status) {
	                  if (status == "success") {
	                      if(!confirm("是否继续新增")){
	                    	  hidAdd();
	                    	  $("#grid").bootstrapTable('refresh');
	                      }
	                     
	                  }
	              },
	              error: function () {
	                  alert('新增数据失败');
	              },
	              complete: function () {

	              }
	          });
		}
		  
	}
	
	//新增校验
	function checkSubmit(){
		
		var addBrand=$('#addBrand').val();
		var addCity=$('#addCity').val();
		var addValue=$('#addValue').val();
		if(addCity==null || addCity ==""){
			addCity=='-';
		}
		if(addBrand==null || addBrand ==""){
			alert("[品牌]不能为空");
			return false;
		}
		if(addValue==null || addValue ==""){
			alert("[毛利额]不能为空");
			return false;
		}
		//正则
		var reg=/^[0-9]{1,9}(\.[0-9]{0,9})?$/;
		if(!reg.test(addValue)){
			alert("[毛利额]必须为数字");
			return false;
		}
		return  true;
	}
	</script>
</head>
<body >
<div class="dialogContent">
<div id="box_list">
	<form class="form-horizontal" id="form_dialog" method="post" >
		<div style="float:left">
			账期：<input name="startMonth" type="text" style="width:130px;color:black;" onClick="WdatePicker({dateFmt:'yyyyMM'})" readonly="readonly" class="form-text select"/>
			&nbsp;&nbsp;--&nbsp;&nbsp;
		</div>
		<div style="float:left">
			<input name="stopMonth" type="text" style="width:130px;color:black;" onClick="WdatePicker({dateFmt:'yyyyMM'})" readonly="readonly" class="form-text select"/>
		</div>
		<div style="float:left;width:120px;">
			<select name="tag1" class="select" style="width: 100%;color:blue;" id="citySelect">
														<shiro:hasPermission name="QS"><option value="">全省</option></shiro:hasPermission>
				<shiro:hasPermission name="GZ"><option value="广州">广州</option></shiro:hasPermission>
				<shiro:hasPermission name="QY"><option value="清远">清远</option></shiro:hasPermission>
				<shiro:hasPermission name="ZQ"><option value="肇庆">肇庆</option></shiro:hasPermission>
				<shiro:hasPermission name="SQ"><option value="韶关">韶关</option></shiro:hasPermission>
				<shiro:hasPermission name="YF"><option value="云浮">云浮</option></shiro:hasPermission>
				<shiro:hasPermission name="FS"><option value="佛山">佛山</option></shiro:hasPermission>
				<shiro:hasPermission name="JM"><option value="江门">江门</option></shiro:hasPermission>
				<shiro:hasPermission name="MM"><option value="茂名">茂名</option></shiro:hasPermission>
				<shiro:hasPermission name="YJ"><option value="阳江">阳江</option></shiro:hasPermission>
				<shiro:hasPermission name="ZJ"><option value="湛江">湛江</option></shiro:hasPermission>
				<shiro:hasPermission name="SZ"><option value="深圳">深圳</option></shiro:hasPermission>
				<shiro:hasPermission name="ST"><option value="汕头">汕头</option></shiro:hasPermission>
				<shiro:hasPermission name="MZ"><option value="梅州">梅州</option></shiro:hasPermission>
				<shiro:hasPermission name="SW"><option value="汕尾">汕尾</option></shiro:hasPermission>
				<shiro:hasPermission name="YJ"><option value="揭阳">揭阳</option></shiro:hasPermission>
				<shiro:hasPermission name="CZ"><option value="潮州">潮州</option></shiro:hasPermission>
				<shiro:hasPermission name="DG"><option value="东莞">东莞</option></shiro:hasPermission>
				<shiro:hasPermission name="HZ"><option value="惠州">惠州</option></shiro:hasPermission>
				<shiro:hasPermission name="ZH"><option value="珠海">珠海</option></shiro:hasPermission>
				<shiro:hasPermission name="ZS"><option value="中山">中山</option></shiro:hasPermission>
				<shiro:hasPermission name="HY"><option value="河源">河源</option></shiro:hasPermission>
			</select>
		</div>
		<div style="float:left" >&nbsp;&nbsp;品牌:</div>
		<div style="float:left"   >
			<input id="selectBrand" type="text"   style="width:100px;" class="form-control"/>
		</div>
		
		<div style="float:left" class="col-xs-1"  >
			<input id="btnSearch" type="button" value="查询"  style="width:80px;" class="btn btn-primary"/>
		</div>
		<div style="float:right; padding-right: 80px" class="col-xs-1"  >
			<input id="btnAdd" type="button" value="新增"  style="width:80px;" class="btn btn-primary" onclick="showAdd();"/>
		</div>
	  <div class="form-group">
	    <table id="grid" style="border:1px #ccc solid;width:100%;height:100%" >
	    </table>
	    <div id="pager2"></div>
	  </div>
	</form>
	</div>
	<div id="box_add">
	<!-- '月份', '地市', '品牌','毛利额' -->
		<label style="color:blue;">账期:</label>
		<input id="addMonth" type="text" style="width:130px;color:black;" onClick="WdatePicker({dateFmt:'yyyyMM'})" readonly="readonly" class="form-text select"/>
		<br><br>	
		<label style="color:blue;">地市:</label>
			<select name="tag1" class="select" style="width: 30%;color:blue;" id="addCity">
														<shiro:hasPermission name="QS"><option value="">全省</option></shiro:hasPermission>
				<shiro:hasPermission name="GZ"><option value="广州">广州</option></shiro:hasPermission>
				<shiro:hasPermission name="QY"><option value="清远">清远</option></shiro:hasPermission>
				<shiro:hasPermission name="ZQ"><option value="肇庆">肇庆</option></shiro:hasPermission>
				<shiro:hasPermission name="SQ"><option value="韶关">韶关</option></shiro:hasPermission>
				<shiro:hasPermission name="YF"><option value="云浮">云浮</option></shiro:hasPermission>
				<shiro:hasPermission name="FS"><option value="佛山">佛山</option></shiro:hasPermission>
				<shiro:hasPermission name="JM"><option value="江门">江门</option></shiro:hasPermission>
				<shiro:hasPermission name="MM"><option value="茂名">茂名</option></shiro:hasPermission>
				<shiro:hasPermission name="YJ"><option value="阳江">阳江</option></shiro:hasPermission>
				<shiro:hasPermission name="ZJ"><option value="湛江">湛江</option></shiro:hasPermission>
				<shiro:hasPermission name="SZ"><option value="深圳">深圳</option></shiro:hasPermission>
				<shiro:hasPermission name="ST"><option value="汕头">汕头</option></shiro:hasPermission>
				<shiro:hasPermission name="MZ"><option value="梅州">梅州</option></shiro:hasPermission>
				<shiro:hasPermission name="SW"><option value="汕尾">汕尾</option></shiro:hasPermission>
				<shiro:hasPermission name="YJ"><option value="揭阳">揭阳</option></shiro:hasPermission>
				<shiro:hasPermission name="CZ"><option value="潮州">潮州</option></shiro:hasPermission>
				<shiro:hasPermission name="DG"><option value="东莞">东莞</option></shiro:hasPermission>
				<shiro:hasPermission name="HZ"><option value="惠州">惠州</option></shiro:hasPermission>
				<shiro:hasPermission name="ZH"><option value="珠海">珠海</option></shiro:hasPermission>
				<shiro:hasPermission name="ZS"><option value="中山">中山</option></shiro:hasPermission>
				<shiro:hasPermission name="HY"><option value="河源">河源</option></shiro:hasPermission>
		</select>
		<br><br>
		<label style="color:blue;float:left;">品牌:</label>
		<div style="width:400px;float:left;"><input  id="addBrand" type="text" class="form-control"/></div>
		<br><br>
		<label style="color:blue;float:left;">毛利额:</label>
		<div style="width:400px;float:left;"><input  id="addValue" type="text" class="form-control"/></div>
		<br><br>
		<div style="float:right;padding_right:200px;" >
			<input id="add_t" type="button" class="btn btn-primary" value="确认" onclick="addSubmit()"/>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="add_f" type="button" class="btn"  value="取消" onclick="hidAdd()"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
</div>
		<input type="hidden"  id="search_hid"/>  <!-- 隐藏域，做点击查询时 保证显示为第一页数据 即：page=1 -->
</body>

</html>
