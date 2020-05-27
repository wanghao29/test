<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>dialog</title>
	<style>
		.dialogContent div{
			color: #000000;
			margin: 5px;
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
</head>
<body>

<form id="addForm">
	<div class="dialogContent">
		<div>
		   <input name="id" type="hidden"/>
			实际回款：<input name="sjhk" type="text"/>
		</div>
		<div>
			计划回款：<input name="jhhk" type="text"/>
		</div>
		<div>
			回款预测准确度得分：<input name="hkyczqddf" type="text"/>
		</div>
		<div>
			月份：<input name="month" type="text" style="width:130px;color:#000" onClick="WdatePicker({dateFmt:'yyyyMM'})" readonly="readonly"class="form-text select"/>
		</div>
	</div>
</form>

</body>

</html>
