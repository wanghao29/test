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
			var date = new Date();
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            $("input[name='month']").val(String(year) + month);
		});
	</script>
</head>
<body>

<div class="dialogContent">

	<form class="form-horizontal" id="form_dialog" method="post" >
		<div>
			账期：<input name="month" type="text" style="width:130px;color:black;" onClick="WdatePicker({dateFmt:'yyyyMM'})" readonly="readonly" class="form-text select"/>
		</div>
	  <div class="form-group">
	    <table id="tab" style="border:1px #ccc solid;width:100%;height:100%" >
	    	<tr>
	    		<td >扣分项名称1:</td>
	    		<td><input type="text" name="kfxmc1"   /></td>
	    		<td >分数1:</td>
	    		<td><input type="text" name="kfxfs1" /></td>
	    	</tr>
	    	<tr>
	    		<td>扣分项名称2:</td>
	    		<td><input type="text" name="kfxmc2" /></td>
	    		<td >分数2:</td>
	    		<td><input type="text" name="kfxfs2" /></td>
	    	</tr>
	    	<tr>
	    		<td>扣分项名称3:</td>
	    		<td><input type="text" name="kfxmc3" /></td>
	    		<td >分数3:</td>
	    		<td><input type="text" name="kfxfs3" /></td>
	    	</tr>
	    	<tr>
	    		<td>扣分项名称4:</td>
	    		<td><input type="text" name="kfxmc4" /></td>
	    		<td >分数4:</td>
	    		<td><input type="text" name="kfxfs4" /></td>
	    	</tr>
	    	<tr>
	    		<td>扣分项名称5:</td>
	    		<td><input type="text" name="kfxmc5" /></td>
	    		<td >分数5:</td>
	    		<td><input type="text" name="kfxfs5" /></td>
	    	</tr>
	    	<tr>
	    		<td>扣分项名称6:</td>
	    		<td><input type="text" name="kfxmc6" /></td>
	    		<td >分数6:</td>
	    		<td><input type="text" name="kfxfs6" /></td>
	    	</tr>
	    	<tr>
	    		<td>扣分项名称7:</td>
	    		<td><input type="text" name="kfxmc7" /></td>
	    		<td >分数7:</td>
	    		<td><input type="text" name="kfxfs7" /></td>
	    	</tr>
	    	<tr>
	    		<td>扣分项名称8:</td>
	    		<td><input type="text" name="kfxmc8" /></td>
	    		<td >分数8:</td>
	    		<td><input type="text" name="kfxfs8" /></td>
	    	</tr>
	    </table>
	  </div>
	</form>
</div>
</body>

</html>
