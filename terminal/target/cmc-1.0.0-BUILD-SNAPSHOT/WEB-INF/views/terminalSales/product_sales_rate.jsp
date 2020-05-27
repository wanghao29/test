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
    <title>重点产品销售达成率</title>

</head>
<body>
<script type="text/javascript" src="<%=basePath%>resources/js/terminalSales/product_sales_rate.js"></script>
<input type="hidden" id = "billcyc" value="${billcyc}">
<style type="text/css">
    table tr td{
        margin-right: 10px;
    }

    h1{
        float: right ;
    }

</style>
<div class="row">
<ol class="breadcrumb">
  <li><a href="#">基础项</a></li>
  <li class="active">重点产品销售达成率</li>
</ol>
</div>	
	
<div class="row">
    <div class="panel panel-default" style=" width: 100%;">
        <div class="panel-body" >
            <div class="row"  style="margin-bottom: 10px;" >
                <div class="col-xs-12">
                    <table style=" width: 50%;">
                        <tr>
                            <td > 开始时间:</td>
                            <td> <input name="startMonth" type="text" style="width:130px" onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-%M'})" readonly="readonly"class="form-text select"/></td>

                            <td > 结束时间:</td>
                            <td> <input name="endMonth" id="endMonth" type="text" style="width:130px" onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-%M'})" readonly="readonly"class="form-text select"/></td>

                            <td >  <button id="btnSearch" type="button" class="btn btn-primary" style="width:100px">查询</button> </td>
                            <td><button  id="addItem"  class="btn btn-primary">   <i class="glyphicon glyphicon-plus"></i>新增/修改  </button></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4">
                    <div class="panel panel-default" style=" width: 100%;height: 200px;">
                        <div class="panel-body" >
                            <p>考核销量</p>
                            <h1 id="khxl" style="float: right;">  </h1>
                        </div>
                    </div>

                </div>
                <div class="col-xs-4">
                    <div class="panel panel-default" style=" width: 100%;height: 200px;">
                        <div class="panel-body" >
                            <p>重点产品</p>
                            <h5 id="zdcp"> </h5>
                        </div>
                    </div>

                </div>
                <div class="col-xs-4">
                    <div class="panel panel-default" style=" width: 100%;height: 200px;">
                        <div class="panel-body" >
                            <p>完成率</p>
                            <h1 id="wcl"> </h1>
                        </div>
                    </div>

                </div>
            </div>

<!--             <div id="toolbar">
                <div id="addItem" class="btn-group">
                    
                </div>
            </div>
 -->
            <div class="row"style="margin-bottom: 10px;">
                <table id="grid" data-toolbar="#toolbar"></table>

            </div>
            <div class="row" style="margin-top: 10px;">
                <div class="col-xs-12">
                    <div class="panel panel-default" style=" width: 100%;height: 500px;">
                        <div class="panel-body" >
                            <div   id="char_bar" style=" width: 100%;height: 500px;">

                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </div>

</div>




</body>
</html>