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
    <title>新零售门店运营</title>

</head>
<body>
<script type="text/javascript" src="<%=basePath%>resources/js/pointOption/new_retail_operation.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/plugin/jquery.validate.js"></script>
<input type="hidden" id = "billcyc" value="${billcyc}">
<style type="text/css">
    table tr td{
        margin-right: 10px;
    }

    h1{
        float: right ;
    }
  label.error{
	color:red;
	margin-left:10px;
}
</style>
 
<div class="row">
<ol class="breadcrumb">
  <li><a href="#">基础项</a></li>
  <li class="active">新零售门店运营</li>
 
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
                            <td> <input name="endMonth" type="text" style="width:130px" onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-%M'})" readonly="readonly"class="form-text select"/></td>

                            <td >  <button id="btnSearch" type="button" class="btn btn-primary" style="width:100px">查询</button> </td>
                            <td><button id="addBtn" type="button" class="btn btn-primary"  >新增</button></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6">
                    <div class="panel panel-default" style=" width: 100%;">
                        <div class="panel-body" >
                            <p>新零售门店合计</p>
                            <h1 id="hXlsmdhj" style="float: right;">  </h1>
                        </div>
                    </div>

                </div>
                <div class="col-xs-6">
                    <div class="panel panel-default" style=" width: 100%;">
                        <div class="panel-body" >
                            <p>新零售门店运营得分</p>
                            <h1 id="hXlsmdyydf">  </h1>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row"style="margin-bottom: 10px;">
                <table id="grid"></table>

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



<div class="modal fade" id="add_and_edit_model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">新零售门店运营</h4>
      </div>
      <div class="modal-body">
        <form id="add_form">
          <div class="form-group">
            <label for="recipient-name" class="control-label">月份</label>
            <input name="billcyc"  id="billcyc" type="text" style="width:130px" onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-%M'})" readonly="readonly"class="form-text select"/>
         
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">新零售门店合计</label>
             <input type="text" class="form-control" id="xlsmdhj" name="xlsmdhj">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary"  id="saveBtn">保存</button>
      </div>
    </div>
  </div>
</div>




</body>
</html>