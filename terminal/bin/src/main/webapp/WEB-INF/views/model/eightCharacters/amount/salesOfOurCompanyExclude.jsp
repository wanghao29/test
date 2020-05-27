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
<title>量</title>
</head>

    

 
<body>
<style   type="text/css">
 
</style>
<div class="row">
	<div class="col-xs-8">
		<p>
			<label>维度1:&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<select class="select_square">
				<option>我司销量</option>
			</select>
			<select class="select_square">
				<option>我司销量</option>
			</select>
			<select class="select_square">
				<option>我司销量</option>
			</select>
		</p>
		<div  class="row">
			<div class="col-xs-12">
				    <div class="box" style="border: 1px solid #558baf!important;border-bottom-right-radius:16px; height: 300px;">
		                <div class="box-head"><span class="title">销量饼状图</span></div>
		                <div class="box-content" id="ageShow" style="height: 250px;">
		                    <!--<img src="images/m21.png">-->
		                </div>
		            </div>
			</div>
		</div>
	</div>
	<div class="col-xs-4">
		<p>
			<label>维度1:&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<select class="select_square">
				<option>我司销量</option>
			</select>
			<select class="select_square">
				<option>我司销量</option>
			</select>
		</p>
		<div  class="row">
			<div class="col-xs-12">
				    <div class="box" style="border: 1px solid #558baf!important;border-bottom-right-radius:16px; height: 300px;">
		                <div class="box-head"><span class="title">销售趋势</span></div>
		                <div class="box-content" id="ageShow" style="height: 250px;">
		               
		                </div>
		            </div>
			</div>
		</div>
	
	
	</div>
</div>



</body>
</html>