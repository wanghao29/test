<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>品牌容量设置</title>

</head>

<body>
	<style type="text/css">
.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
	height: 37px;
	margin-top: 5px;
}

/* .select2-container--default .select2-results > .select2-results__options {
  max-height: 200px;
  border:200px;
  overflow-y: auto;
  width: 200px; 
  } */
.ui-jqgrid .ui-jqgrid-htable th {
	color: #607D8B;
}

.ui-jqgrid .ui-jqgrid-htable th {
	color: #607D8B;
}

.modal-body {
	position: absolute;
	top: 10px;
}
/* 设置表格样式 */
.ui-jqgrid .ui-jqgrid-htable th {
	text-align: center;
	color: #607D8B;
	/* background-color:#54abd6; */
	font-size: 16px;
}

.ui-jqgrid-htable th.ui-th-column-header {
	background-color: #607D8B;
}

.content div {
	color: #607D8B;
}

.ui-jqgrid tr.jqgrow td, .ui-jqgrid {
	border: none;
}

.ui-jqgrid .ui-jqgrid-hbox {
	border: none;
}

.ui-widget-content {
	border: 1px solid #dddddd;
	background: #337ab7;
	color: white;
}

.element.style {
	width: 100%;
}

.ui-widget-content {
	border: 1px solid #dddddd;
	background: #275267;
	color: white;
}

table {
	table-layout: fixed;
	border-collapse: collapse;
	width: 100%;
	color: white;
	align: center;
}

td {
	text-align: center;
}

/* .select_searchableMy {
    padding: 4px;
    width: 100%;
    background-color: transparent;
  
    box-sizing: border-box;


} */

#table0 input {
	background: #00063c; /*设置输入框背景色*/
	height: 29px;
	width: 100%;
	text-align: center;
	border: none;
}

#table1 input {
	background: #00063c; /*设置输入框背景色*/
	height: 29px;
	width: 100%;
	text-align: center;
	border: none;
}

#table2 input {
	background: #00063c; /*设置输入框背景色*/
	height: 29px;
	width: 100%;
	text-align: center;
	word-wrap: break-word;
	word-break: break-all;
	border: none;
}

#table1 {
	width: 100%;
}
/* #table2 {

width:746px;
float:right;
position:absolute;top:200px;left:813px;
table-layout: fixed; 
border-collapse: collapse;
color: white;

}   */

/* 按钮设置 */
#btSet {
	position: absolute;
	right: 700px;
}

#bt {
	margin: 50px;
}
</style>


	<link rel="stylesheet"
		href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap.css">
	<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
	<script
		src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>
	<script type="text/javascript"
		src="<%=basePath%>resources/js/customerChannel/customerChannel.js?"></script>
	<script type="text/javascript"
		src="<%=basePath%>resources/js/brandRangeSet/parameterSeted.js?"></script>
	<script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel"></h4>
								</div>
								<!-- onchange="importf(this)" -->

								<form id="uploadForm" enctype="multipart/form-data">
						<div class="modal-body">
							<input type="file" id="file" name="file" onchange="loadFile(this.files[0])" />
							<br/>
							<span style=""> 品牌：</span>
<select name="tbrandname" id="select88"
class="select_searchableMy" runat="server"
style="border-color: #1addfa; width: 200px; height: 30px; color: white; 
background-color: #00063c;border-radius: 16px;">
<option id="oneDate">${brand}</option>
		<option>苹果</option>
		<option>华为</option>
		<option>三星</option>
		<option>中国移动</option>
		<option>小米</option>
		<option>魅族</option>
		<option>OPPO</option>

	</select>
	
<label style="font-size: 18px; color: white; font-weight: normal;">机型：
</label> <select name="tspec" id="select99" class="select_searchableMy"
	runat="server"
	style="border-color: #1addfa; width: 200px; color: white; background-color: #00063c; height: 30px;border-radius: 16px;">
<option id="twoDate">${spec}</option>
	</select>	
	
							<a style="color:white;" href="<%=basePath%>resources/tmpl/planDate.xlsx">模板下载</a>
						</div>
					</form>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<!-- <button type="button" id="button-submit" class="btn btn-primary" >提交更改</button> -->
								</div>

							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>
	
	<div class="alert alert-danger hide" id="alertMessage">
				<a class="close" style="font-size: x-large" data-dismiss="alert">
					&times; </a> <strong style="font-size: 15px">设置数据和全生命周期设置的总量不一致，请重新设置！</strong>
			</div>
	
		<!-- 模态框（Modal） -->
		<div div class="row">
		<div class="col-xs-8" align="right" style="margin-left: -475px;">
		<span style="font-size: 18px; color: white; font-weight: normal;"> 品牌：</span>
<select name="tbrandname" id="select188"
class="select_searchableMy" runat="server"
style="border-color: #1addfa; width: 200px; height: 30px; color: white; 
background-color: #00063c;border-radius: 16px;">
<option id="oneDate" style="text-align: left;">${brand}</option>
		
	</select>
	
<label style="font-size: 18px; color: white; font-weight: normal;">机型：
</label> <select name="tspec" id="select199" class="select_searchableMy"
	runat="server"
	style="border-color: #1addfa; width: 200px; color: white; background-color: #00063c; height: 30px;border-radius: 16px;">
<option id="twoDate">${spec}</option>
	</select>	
		
		
		</div>
				<div class="col-xs-2" align="right" style="margin-left: 200px;">
<button class="btn btn-primary btn-lg" 
data-toggle="modal" style="padding: 1px 16px;
font-size: 18px;line-height: 1.3333333;border-radius: 6px;
float:left;margin:0px -180px;" 
data-target="#myModal">数据导入
</button>

				
					<div id="demo"></div>
				</div>
	</div>
	
	
	
	<div
		style="margin-left: 10px; margin-right: 10px; margin-bottom: 20px; margin: 20px;">



		<!-- <table id="list" class="table table-bordered"></table>

<table id="listed" class="table table-bordered"></table> -->
		<%-- <%
 String brand=request.getParameter("brand"); 
%> --%>
		<form id="form1" method="post" action="../fiveAndArea/test.do">
			<input type="hidden" value="${brand}" id="brand" name="brand" /> <input
				type="hidden" value="${spec}" id="spec" name="spec" />
			<!--消息提示框  -->
			

			<div class="row">
				<div class="col-xs-12">
					<%-- 	<input type="hidden" name="brand" value="<%=brand%>"> --%>
					<table border="1" bordercolor="#1addfa" id="table0">
						<tr bgcolor="#4682B4">
							<td colspan="9" align="center">生命周期维度规划</td>
						</tr>



						<tr>
							<td>所属时期</td>
							<td>持续时长（周）</td>
							<td>销量（台）</td>
							<td>收入（元）</td>
							<td>毛利（元）</td>
							<td>覆盖客户（个）</td>
							<td>份额</td>
							<td>库存周转（周）</td>
							<td>操作</td>
						</tr>
						<tr>
							<td>操作</td>
							<td><a href="#" onclick="editInfoNew('1')">
									${lifeDate1.CYCLE==null?"添加":"修改"} </a></td>
							<td><a href="#" onclick="editInfoNew('2')">
									${lifeDate1.CYCLE==null?"添加":"修改"} </a></td>
							<td><a href="#" onclick="editInfoNew('3')">
									${lifeDate1.CYCLE==null?"添加":"修改"} </a></td>
							<td><a href="#" onclick="editInfoNew('4')">
									${lifeDate1.CYCLE==null?"添加":"修改"} </a></td>
							<td><a href="#" onclick="editInfoNew('5')">
									${lifeDate1.CYCLE==null?"添加":"修改"} </a></td>
							<td><a href="#" onclick="editInfoNew('6')">
									${lifeDate1.CYCLE==null?"添加":"修改"} </a></td>
							<td><a href="#" onclick="editInfoNew('7')">
									${lifeDate1.CYCLE==null?"添加":"修改"} </a></td>
							<td></td>
						</tr>
						<tr>

							<td><input type="text" name="CYCLE" align="top" value="导入期"
								disabled="disabled" id="CYCLE" /></td>
							<td><input type="text" name="DURATION" align="top"
								id="DURATION1" readonly="readonly" value="${lifeDate1.DURATION}" /></td>
							<td><input type="text" name="SALEAMOUNT" id="SALEAMOUNT1"
								readonly="readonly" value="${lifeDate1.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="INCOME1"
								readonly="readonly" value="${lifeDate1.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="MAORI1"
								readonly="readonly" value="${lifeDate1.MAORI}" /></td>
							<td><input type="text" name="OVERAMOUNT" id="OVERAMOUNT1"
								readonly="readonly" value="${lifeDate1.OVERAMOUNT}" /></td>
							<td><input type="text" name="SHARE" id="SHARE1"
								readonly="readonly" value="${lifeDate1.SHARE}" /></td>
							<td><input type="text" name="TURNOVERTIME"
								id="TURNOVERTIME1" readonly="readonly"
								value="${lifeDate1.TURNOVERTIME}" /></td>
							<td><a href="#" onclick="editInfo('1')">
									${lifeDate1.CYCLE==null?"添加":"修改"} </a></td>


						</tr>



						<tr>

							<td><input type="text" name="CYCLE" align="top" value="成长期"
								disabled="disabled" id="CYCLE" /></td>
							<td><input type="text" name="DURATION" align="top"
								id="DURATION2" readonly="readonly" value="${lifeDate2.DURATION}" /></td>
							<td><input type="text" name="SALEAMOUNT" id="SALEAMOUNT2"
								readonly="readonly" value="${lifeDate2.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="INCOME2"
								readonly="readonly" value="${lifeDate2.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="MAORI2"
								readonly="readonly" value="${lifeDate2.MAORI}" /></td>
							<td><input type="text" name="OVERAMOUNT" id="OVERAMOUNT2"
								readonly="readonly" value="${lifeDate2.OVERAMOUNT}" /></td>
							<td><input type="text" name="SHARE" id="SHARE2"
								readonly="readonly" value="${lifeDate2.SHARE}" /></td>
							<td><input type="text" name="TURNOVERTIME"
								id="TURNOVERTIME2" readonly="readonly"
								value="${lifeDate2.TURNOVERTIME}" /></td>
							<td><a href="#" onclick="editInfo('2')">
									${lifeDate2.CYCLE==null?"添加":"修改"} </a></td>
						</tr>

						<tr>

							<td><input type="text" name="CYCLE" align="top" value="成熟期"
								disabled="disabled" id="CYCLE" /></td>
							<td><input type="text" name="DURATION" align="top"
								id="DURATION3" readonly="readonly" value="${lifeDate3.DURATION}" /></td>
							<td><input type="text" name="SALEAMOUNT" id="SALEAMOUNT3"
								readonly="readonly" value="${lifeDate3.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="INCOME3"
								readonly="readonly" value="${lifeDate3.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="MAORI3"
								readonly="readonly" value="${lifeDate3.MAORI}" /></td>
							<td><input type="text" name="OVERAMOUNT" id="OVERAMOUNT3"
								readonly="readonly" value="${lifeDate3.OVERAMOUNT}" /></td>
							<td><input type="text" name="SHARE" id="SHARE3"
								readonly="readonly" value="${lifeDate3.SHARE}" /></td>
							<td><input type="text" name="TURNOVERTIME"
								id="TURNOVERTIME3" readonly="readonly"
								value="${lifeDate3.TURNOVERTIME}" /></td>
							<td><a href="#" onclick="editInfo('3')">
									${lifeDate3.CYCLE==null?"添加":"修改"} </a></td>
						</tr>

						<tr>

							<td><input type="text" name="CYCLE" align="top" value="衰退期"
								disabled="disabled" id="CYCLE" /></td>
							<td><input type="text" name="DURATION" align="top"
								id="DURATION4" readonly="readonly" value="${lifeDate4.DURATION}" /></td>
							<td><input type="text" name="SALEAMOUNT" id="SALEAMOUNT4"
								readonly="readonly" value="${lifeDate4.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="INCOME4"
								readonly="readonly" value="${lifeDate4.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="MAORI4"
								readonly="readonly" value="${lifeDate4.MAORI}" /></td>
							<td><input type="text" name="OVERAMOUNT" id="OVERAMOUNT4"
								readonly="readonly" value="${lifeDate4.OVERAMOUNT}" /></td>
							<td><input type="text" name="SHARE" id="SHARE4"
								readonly="readonly" value="${lifeDate4.SHARE}" /></td>
							<td><input type="text" name="TURNOVERTIME"
								id="TURNOVERTIME4" readonly="readonly"
								value="${lifeDate4.TURNOVERTIME}" /></td>
							<td><a href="#" onclick="editInfo('4')">
									${lifeDate4.CYCLE==null?"添加":"修改"} </a></td>
						</tr>
						<tr>
							<td>汇总</td>
							<td id="weekSum"></td>
							<td id="saleAmount"></td>
							<td id="incomeAmount"></td>
							<td id="profitAmount"></td>
							<td id="stockAmount"></td>
							<td id="shareAmount"></td>
							<td id="overAmount"></td>
							<td></td>
						</tr>

					</table>
				</div>
			</div>
		</form>
	
	
	
		
		<!-- c城市维度规划表格 -->
		<div class="row">



			<form id="form1" method="post" action="../fiveAndArea/test.do">

				<div class="col-xs-6">
					<table border="1" bordercolor="#1addfa" id="table1">
						<tr bgcolor="#4682B4">
							<td colspan="5" align="center">城市维度规划</td>
						</tr>
						<tr>
							<td></td>
							<td>销量（台）</td>
							<td>收入（元）</td>
							<td>覆盖客户</td>
							<td>操作</td>

						</tr>
						<tr>
							<td>操作</td>
							<td><a href="#" onclick="cityAmount('1')">
									${gzDate.AREANAME==null?"添加":"修改"} </a></td>
							<td><a href="#" onclick="cityAmount('4')">
									${gzDate.AREANAME==null?"添加":"修改"} </a></td>
							<td><a href="#" onclick="cityAmount('5')">
									${gzDate.AREANAME==null?"添加":"修改"} </a></td>
							<td></td>

						</tr>


						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="广州" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${gzDate.SALEAMOUNTS}" id="areaSALEAMOUNT1" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${gzDate.INCOMES}" id="areaINCOME1" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${gzDate.OVERAMOUNTS}" id="areaOVERAMOUNT1" /></td>
							<td><a href="#" onclick="city('广州')">
									${gzDate.AREANAME==null?"添加":"修改"} </a></td>
						</tr>

						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="肇庆" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${zqDate.SALEAMOUNTS}" id="areaSALEAMOUNT2" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${zqDate.INCOMES}" id="areaINCOME2" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${zqDate.OVERAMOUNTS}" id="areaOVERAMOUNT2" /></td>
							<td><a href="#" onclick="city('肇庆')">
									${zqDate.AREANAME==null?"添加":"修改"} </a></td>
							<%-- <td><a
								href="../parameterSet/addAndUpdateLifeDate.do?AREANAME=肇庆&brand=${brand}&sp=${spec}">
									${zqDate.AREANAME==null?"添加":"修改"} </a>
						   </td> --%>

						</tr>


						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="清远" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${qyDate.SALEAMOUNTS}" id="areaSALEAMOUNT3" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${qyDate.INCOMES}" id="areaINCOME3" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${qyDate.OVERAMOUNTS}" id="areaOVERAMOUNT3" /></td>
							<td><a href="#" onclick="city('清远')">
									${qyDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="韶关" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${sgDate.SALEAMOUNTS}" id="areaSALEAMOUNT4" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${sgDate.INCOMES}" id="areaINCOME4" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${sgDate.OVERAMOUNTS}" id="areaOVERAMOUNT4" /></td>
							<td><a href="#" onclick="city('韶关')">
									${sgDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="云浮" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${yfDate.SALEAMOUNTS}" id="areaSALEAMOUNT5" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${yfDate.INCOMES}" id="areaINCOME5" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${yfDate.OVERAMOUNTS}" id="areaOVERAMOUNT5" /></td>
							<td><a href="#" onclick="city('云浮')">
									${yfDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="深圳" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${szDate.SALEAMOUNTS}" id="areaSALEAMOUNT6" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${szDate.INCOMES}" id="areaINCOME6" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${szDate.OVERAMOUNTS}" id="areaOVERAMOUNT6" /></td>
							<td><a href="#" onclick="city('深圳')">
									${szDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="汕头" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${stDate.SALEAMOUNTS}" id="areaSALEAMOUNT7" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${stDate.INCOMES}" id="areaINCOME7" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${stDate.OVERAMOUNTS}" id="areaOVERAMOUNT7" /></td>
							<td><a href="#" onclick="city('汕头')">
									${stDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="揭阳" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${jyDate.SALEAMOUNTS}" id="areaSALEAMOUNT8" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${jyDate.INCOMES}" id="areaINCOME8" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${jyDate.OVERAMOUNTS}" id="areaOVERAMOUNT8" /></td>
							<td><a href="#" onclick="city('揭阳')">
									${jyDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="梅州" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${mzDate.SALEAMOUNTS}" id="areaSALEAMOUNT9" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${mzDate.INCOMES}" id="areaINCOME9" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${mzDate.OVERAMOUNTS}" id="areaOVERAMOUNT9" /></td>
							<td><a href="#" onclick="city('梅州')">
									${mzDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="潮州" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${czDate.SALEAMOUNTS}" id="areaSALEAMOUNT10" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${czDate.INCOMES}" id="areaINCOME10" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${czDate.OVERAMOUNTS}" id="areaOVERAMOUNT10" /></td>
							<td><a href="#" onclick="city('潮州')">
									${czDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="汕尾" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${swDate.SALEAMOUNTS}" id="areaSALEAMOUNT11" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${swDate.INCOMES}" id="areaINCOME11" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${swDate.OVERAMOUNTS}" id="areaOVERAMOUNT11" /></td>
							<td><a href="#" onclick="city('汕尾')">
									${swDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>

						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="东莞" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${dgDate.SALEAMOUNTS}" id="areaSALEAMOUNT12" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${dgDate.INCOMES}" id="areaINCOME12" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${dgDate.OVERAMOUNTS}" id="areaOVERAMOUNT12" /></td>
							<td><a href="#" onclick="city('东莞')">
									${dgDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="中山" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${zsDate.SALEAMOUNTS}" id="areaSALEAMOUNT13" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${zsDate.INCOMES}" id="areaINCOME13" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${zsDate.OVERAMOUNTS}" id="areaOVERAMOUNT13" /></td>
							<td><a href="#" onclick="city('中山')">
									${zsDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="惠州" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${hzDate.SALEAMOUNTS}" id="areaSALEAMOUNT14" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${hzDate.INCOMES}" id="areaINCOME14" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${hzDate.OVERAMOUNTS}" id="areaOVERAMOUNT14" /></td>
							<td><a href="#" onclick="city('惠州')">
									${hzDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="珠海" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${zhDate.SALEAMOUNTS}" id="areaSALEAMOUNT15" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${zhDate.INCOMES}" id="areaINCOME15" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${zhDate.OVERAMOUNTS}" id="areaOVERAMOUNT15" /></td>
							<td><a href="#" onclick="city('珠海')">
									${zhDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="河源" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${hyDate.SALEAMOUNTS}" id="areaSALEAMOUNT16" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${hyDate.INCOMES}" id="areaINCOME16" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${hyDate.OVERAMOUNTS}" id="areaOVERAMOUNT16" /></td>
							<td><a href="#" onclick="city('河源')">
									${hyDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="佛山" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${fsDate.SALEAMOUNTS}" id="areaSALEAMOUNT17" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${fsDate.INCOMES}" id="areaINCOME17" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${fsDate.OVERAMOUNTS}" id="areaOVERAMOUNT17" /></td>
							<td><a href="#" onclick="city('佛山')">
									${fsDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="江门" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${jmDate.SALEAMOUNTS}" id="areaSALEAMOUNT18" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${jmDate.INCOMES}" id="areaINCOME18" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${jmDate.OVERAMOUNTS}" id="areaOVERAMOUNT18" /></td>
							<td><a href="#" onclick="city('江门')">
									${jmDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="湛江" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${zjDate.SALEAMOUNTS}" id="areaSALEAMOUNT19" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${zjDate.INCOMES}" id="areaINCOME19" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${zjDate.OVERAMOUNTS}" id="areaOVERAMOUNT19" /></td>
							<td><a href="#" onclick="city('湛江')">
									${zjDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="茂名" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${mmDate.SALEAMOUNTS}" id="areaSALEAMOUNT20" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${mmDate.INCOMES}" id="areaINCOME20" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${mmDate.OVERAMOUNTS}" id="areaOVERAMOUNT20" /></td>
							<td><a href="#" onclick="city('茂名')">
									${mmDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td><input type="text" name="AREANAME" align="top"
								value="阳江" disabled="disabled" id="AREANAME" /></td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${yjDate.SALEAMOUNTS}" id="areaSALEAMOUNT21" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${yjDate.INCOMES}" id="areaINCOME21" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${yjDate.OVERAMOUNTS}" id="areaOVERAMOUNT21" /></td>
							<td><a href="#" onclick="city('阳江')">
									${yjDate.AREANAME==null?"添加":"修改"} </a></td>

						</tr>
						<tr>
							<td>省级大客户</td>
							<td><input type="text" name="ALEAMOUNTS" readonly="readonly"
								value="${sjdDate.SALEAMOUNTS}" id="areaSALEAMOUNT22" align="top" /></td>
							<td><input type="text" name="NCOMES" readonly="readonly"
								value="${sjdDate.INCOMES}" id="areaINCOME22" /></td>
							<td><input type="text" name="VERAMOUNTS" readonly="readonly"
								value="${sjdDate.OVERAMOUNTS}" id="areaOVERAMOUNT22" /></td>
							<td></td>
						</tr>
						<tr>
							<td>汇总</td>
							<td id="saleAreaAmount"></td>
							<td id="areaIncomeAmount"></td>
							<td id="areaOverAmount"></td>
							<td></td>
						</tr>
						




					</table>
				</div>
			</form>


			<form id="form1" method="post" action="../fiveAndArea/test.do">
				<!--五线七口数据表  -->
				<div class="col-xs-6" style="padding-left: 0px;">
					<table border="1" bordercolor="#1addfa" id="table2">
						<tr bgcolor="#4682B4">
							<td colspan="6" align="center">五线七口维度规划</td>
						</tr>
						<tr>
							<td>五线名称</td>
							<td>七口名称</td>
							<td>销量（台）</td>
							<td>收入（元）</td>
							<td>毛利</td>
							<td>操作</td>

						</tr>
						<tr>
							<td>操作</td>
							<td></td>
							<td><a href="#" onclick="fineAmount()">
									${fiveLine1_1.SALEAMOUNT==null?"添加":"修改"} </a></td>
							<td><a href="#" onclick="fineAmount()">
									${fiveLine1_1.SALEAMOUNT==null?"添加":"修改"} </a></td>
							<td><a href="#" onclick="fineAmount()">
									${fiveLine1_1.SALEAMOUNT==null?"添加":"修改"} </a></td>
							<td></td>

						</tr>

						<tr>
							<td rowspan="4" name="LINENAME">自有渠道</td>
							<td><input type="text" name="PORTNAME" align="top"
								value="自有渠道整体" disabled="disabled" /></td>
							<td><input type="text" name="SALEAMOUNT"
								id="fiveSALEAMOUNT1" readonly="readonly"
								value="${fiveLine1_1.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="fiveINCOME1"
								readonly="readonly" value="${fiveLine1_1.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="fiveMAORI1"
								readonly="readonly" value="${fiveLine1_1.MAORI}" /></td>
							<td><a href="#" onclick="fineAndSaven('自有渠道','自有渠道整体')">
									${fiveLine1_1.SALEAMOUNT==null?"添加":"修改"} </a></td>
						</tr>
						<tr>


							<td><input type="text" name="PORTNAME" align="top"
								value="自营代销" disabled="disabled" /></td>
							<td><input type="text" name="SALEAMOUNT"
								id="fiveSALEAMOUNT2" readonly="readonly"
								value="${fiveLine1_2.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="fiveINCOME2"
								readonly="readonly" value="${fiveLine1_2.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="fiveMAORI2"
								readonly="readonly" value="${fiveLine1_2.MAORI}" /></td>
							<td><a href="#" onclick="fineAndSaven('自有渠道','自营代销')">
									${fiveLine1_2.SALEAMOUNT==null?"添加":"修改"} </a></td>

						</tr>


						<tr>

							<td><input type="text" name="PORTNAME" align="top"
								value="入柜商" disabled="disabled" /></td>
							<td><input type="text" name="SALEAMOUNT"
								id="fiveSALEAMOUNT3" readonly="readonly"
								value="${fiveLine1_3.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="fiveINCOME3"
								readonly="readonly" value="${fiveLine1_3.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="fiveMAORI3"
								readonly="readonly" value="${fiveLine1_3.MAORI}" /></td>
							<td><a href="#" onclick="fineAndSaven('自有渠道','入柜商')">
									${fiveLine1_3.SALEAMOUNT==null?"添加":"修改"} </a></td>

						</tr>
						<tr>


							<td><input type="text" name="PORTNAME" align="top"
								value="直销代售" disabled="disabled" /></td>
							<td><input type="text" name="SALEAMOUNT"
								id="fiveSALEAMOUNT4" readonly="readonly"
								value="${fiveLine1_4.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="fiveINCOME4"
								readonly="readonly" value="${fiveLine1_4.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="fiveMAORI4"
								readonly="readonly" value="${fiveLine1_4.MAORI}" /></td>
							<td><a href="#" onclick="fineAndSaven('自有渠道','直销代售')">
									${fiveLine1_4.SALEAMOUNT==null?"添加":"修改"} </a></td>

						</tr>

						<tr>
							<td rowspan="4">社会渠道</td>
							<td><input type="text" name="PORTNAME" align="top"
								value="社会渠道整体" disabled="disabled" /></td>
							<td><input type="text" name="SALEAMOUNT"
								id="fiveSALEAMOUNT5" readonly="readonly"
								value="${fiveLine2_1.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="fiveINCOME5"
								readonly="readonly" value="${fiveLine2_1.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="fiveMAORI5"
								readonly="readonly" value="${fiveLine2_1.MAORI}" /></td>
							<td><a href="#" onclick="fineAndSaven('社会渠道','社会渠道整体')">
									${fiveLine2_1.SALEAMOUNT==null?"添加":"修改"} </a></td>

						</tr>
						<tr>

							<td><input type="text" name="PORTNAME" align="top"
								value="WKA" disabled="disabled" /></td>
							<td><input type="text" name="SALEAMOUNT"
								id="fiveSALEAMOUNT6" readonly="readonly"
								value="${fiveLine2_2.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="fiveINCOME6"
								readonly="readonly" value="${fiveLine2_2.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="fiveMAORI6"
								readonly="readonly" value="${fiveLine2_2.MAORI}" /></td>
							<td><a href="#" onclick="fineAndSaven('社会渠道','WKA')">
									${fiveLine2_2.SALEAMOUNT==null?"添加":"修改"} </a></td>

						</tr>


						<tr>

							<td><input type="text" name="PORTNAME" align="top"
								value="KA" disabled="disabled" /></td>
							<td><input type="text" name="SALEAMOUNT"
								id="fiveSALEAMOUNT7" readonly="readonly"
								value="${fiveLine2_3.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="fiveINCOME7"
								readonly="readonly" value="${fiveLine2_3.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="fiveMAORI7"
								readonly="readonly" value="${fiveLine2_3.MAORI}" /></td>
							<td><a href="#" onclick="fineAndSaven('社会渠道','KA')">
									${fiveLine2_3.SALEAMOUNT==null?"添加":"修改"} </a></td>

						</tr>
						<tr>

							<td><input type="text" name="PORTNAME" align="top"
								value="中小客户" disabled="disabled" /></td>
							<td><input type="text" name="SALEAMOUNT"
								id="fiveSALEAMOUNT8" readonly="readonly"
								value="${fiveLine2_4.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="fiveINCOME8"
								readonly="readonly" value="${fiveLine2_4.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="fiveMAORI8"
								readonly="readonly" value="${fiveLine2_4.MAORI}" /></td>
							<td><a href="#" onclick="fineAndSaven('社会渠道','中小客户')">
									${fiveLine2_4.SALEAMOUNT==null?"添加":"修改"} </a></td>

						</tr>
						<tr>

							<td>电商渠道</td>
							<td><input type="text" name="PORTNAME" align="top"
								value="外呼" disabled="disabled" /></td>
							<td><input type="text" name="SALEAMOUNT"
								id="fiveSALEAMOUNT9" readonly="readonly"
								value="${fiveLine3_1.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="fiveINCOME9"
								readonly="readonly" value="${fiveLine3_1.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="fiveMAORI9"
								readonly="readonly" value="${fiveLine3_1.MAORI}" /></td>
							<td><a href="#" onclick="fineAndSaven('电商渠道','外呼')">
									${fiveLine3_1.SALEAMOUNT==null?"添加":"修改"} </a></td>
						</tr>

						<tr>

							<td>家庭政企</td>
							<td><input type="text" name="PORTNAME" align="top"
								value="家庭政企" disabled="disabled" /></td>
							<td><input type="text" name="SALEAMOUNT"
								id="fiveSALEAMOUNT10" readonly="readonly"
								value="${fiveLine4_1.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="fiveINCOME10"
								readonly="readonly" value="${fiveLine4_1.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="fiveMAORI10"
								readonly="readonly" value="${fiveLine4_1.MAORI}" /></td>
							<td><a href="#" onclick="fineAndSaven('家庭政企','家庭政企')">
									${fiveLine4_1.SALEAMOUNT==null?"添加":"修改"} </a></td>
						</tr>
						<tr>
							<td rowspan="3">零售售后</td>
							<td><input type="text" name="PORTNAME" align="top"
								value="零售售后整体" disabled="disabled" /></td>
							<td><input type="text" name="SALEAMOUNT"
								id="fiveSALEAMOUNT11" readonly="readonly"
								value="${fiveLine5_1.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="fiveINCOME11"
								readonly="readonly" value="${fiveLine5_1.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="fiveMAORI11"
								readonly="readonly" value="${fiveLine5_1.MAORI}" /></td>
							<td><a href="#" onclick="fineAndSaven('零售售后','零售售后整体')">
									${fiveLine5_1.SALEAMOUNT==null?"添加":"修改"} </a></td>

						</tr>
						<tr>

							<td><input type="text" name="PORTNAME" align="top"
								value="零售" disabled="disabled" /></td>
							<td><input type="text" name="SALEAMOUNT"
								id="fiveSALEAMOUNT12" readonly="readonly"
								value="${fiveLine5_2.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="fiveINCOME12"
								readonly="readonly" value="${fiveLine5_2.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="fiveMAORI12"
								readonly="readonly" value="${fiveLine5_2.MAORI}" /></td>
							<td><a href="#" onclick="fineAndSaven('零售售后','零售')">
									${fiveLine5_2.SALEAMOUNT==null?"添加":"修改"} </a></td>

						</tr>
						<tr>

							<td><input type="text" name="PORTNAME" align="top"
								value="售后" disabled="disabled" /></td>
							<td><input type="text" name="SALEAMOUNT"
								id="fiveSALEAMOUNT13" readonly="readonly"
								value="${fiveLine5_3.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="fiveINCOME13"
								readonly="readonly" value="${fiveLine5_3.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="fiveMAORI13"
								readonly="readonly" value="${fiveLine5_3.MAORI}" /></td>
							<td><a href="#" onclick="fineAndSaven('零售售后','售后')">
									${fiveLine5_3.SALEAMOUNT==null?"添加":"修改"} </a></td>

						</tr>

						<tr>

							<td>铁通</td>
							<td><input type="text" name="PORTNAME" align="top"
								value="铁通" disabled="disabled" /></td>
							<td><input type="text" name="SALEAMOUNT"
								id="fiveSALEAMOUNT14" readonly="readonly"
								value="${fiveLine6_1.SALEAMOUNT}" /></td>
							<td><input type="text" name="INCOME" id="fiveINCOME14"
								readonly="readonly" value="${fiveLine6_1.INCOME}" /></td>
							<td><input type="text" name="MAORI" id="fiveMAORI14"
								readonly="readonly" value="${fiveLine6_1.MAORI}" /></td>
							<td><a href="#" onclick="fineAndSaven('铁通','铁通')">
									${fiveLine6_1.SALEAMOUNT==null?"添加":"修改"} </a></td>
						</tr>
						<tr>
							<td>汇总</td>
							<td></td>
							<td id="fiveSaleAmount"></td>
							<td id="fiveIncomeAmount"></td>
							<td id="fiveMaoriAmount"></td>
							<td></td>
						</tr>


					</table>
				</div>
			</form>


		</div>









	</div>

	<div id="btSet">


		<!-- <button type="button" style="width: 100px; background-color: #49c9dc"
			onclick="goSubmit()">保存</button> -->
		<button id="bt" type="button"
			onclick="javascript:window.location.href='../productInformationSet/index.do'"
			style="width: 100px; background-color: #49c9dc">返回上一页</button>

	</div>




	<!-- 生命周期 模态框------------------ -->
	<div class="modal fade" id="modal" tabindex="3" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">信息设置</h4>
				</div>
				<div class="modal-body modal-li">
					<form id="form1" method="post"
						action="../parameterSet/addAndUpdateLifeDate1.do">
						<table border="1" bordercolor="#1addfa" id="table0">
							<tr bgcolor="#4682B4">
								<td colspan="2" align="center">生命周期维度规划</td>
							</tr>

							<tr>
								<td>时期</td>
								<td><input type="text" name="modal_CYCLE" align="top"
									id="modal_CYCLE" readonly="readonly" /></td>
								<%-- <c:if test="${lifeDate.cycle==1}">
					<td><input type="text"  align="top" value="导入期" disabled="disabled" id="CYCLE"></input></td>
				</c:if>
				<c:if test="${lifeDate.cycle==2}">
					<td><input type="text"  align="top" value="成长期" disabled="disabled" id="CYCLE"></input></td>
				</c:if>
				<c:if test="${lifeDate.cycle==3}">
					<td><input type="text"  align="top" value="成熟期" disabled="disabled" id="CYCLE"></input></td>
				</c:if>
				<c:if test="${lifeDate.cycle==4}">
					<td><input type="text"  align="top" value="衰退期" disabled="disabled" id="CYCLE"></input></td>
				</c:if>  --%>
							</tr>
							<tr>
								<td>持续时长（周）</td>
								<td><input type="text" name="model_DURATION" align="top" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
									id="model_DURATION" /></td>
							</tr>
							<tr>
								<td>销量（台）</td>
								<td><input type="text" name="model_SALEAMOUNT" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
									id="model_SALEAMOUNT" /></td>
							</tr>
							<tr>
								<td>收入（元）</td>
								<td><input type="text" name="model_INCOME" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
									id="model_INCOME" /></td>
							</tr>
							<tr>
								<td>毛利（元）</td>
								<td><input type="text" name="model_MAORI" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
								 id="model_MAORI" /></td>
							</tr>
							<tr>
								<td>覆盖客户（个）</td>
								<td><input type="text" name="model_OVERAMOUNT" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
									id="model_OVERAMOUNT" /></td>
							</tr>
							<tr>
								<td>份额</td>
								<td><input type="text" name="model_SHARE" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
								 id="model_SHARE" /></td>
							</tr>
							<tr>
								<td>库存周转（周）</td>
								<td><input type="text" name="model_TURNOVERTIME" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
									id="model_TURNOVERTIME" /></td>
							</tr>

						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="update()">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 区域销量 模态框------------------ -->
	<div class="modal fade" id="modal1" tabindex="3" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">城市维度规划信息设置</h4>
				</div>
				<div class="modal-body modal-li">
					<form id="form1" method="post"
						action="../parameterSet/addAndUpdateLifeDate1.do">
						<table border="1" bordercolor="#1addfa" id="table0">
							<tr bgcolor="#4682B4">
								<td colspan="4" align="center">城市维度规划</td>
							</tr>
							<tr>
								<td>城市</td>
								<td>销量（台）</td>
								<td>收入（元）</td>
								<td>覆盖客户</td>

								
							</tr>

							<tr>
								<td><input type="text" name="CITY_AREANAME" align="top"
									readonly="readonly" id="CITY_AREANAME" id="CITY_AREANAME" /></td>
								<td><input type="text" name="CITY_SALEAMOUNTS"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
									id="CITY_SALEAMOUNTS" align="top" /></td>
								<td><input type="text" name="CITY_INCOMES" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
									id="CITY_INCOMES" /></td>
								<td><input type="text" name="CITY_OVERAMOUNTS"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
									id="CITY_OVERAMOUNTS" /></td>


							</tr>


						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateCity()">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!--五线七口模态框  -->
	<div class="modal fade" id="modal2" tabindex="3" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">五线七口规划信息设置</h4>
				</div>
				<div class="modal-body modal-li">
					<form id="form2" method="post"
						action="../parameterSet/addAndUpdateLifeDate1.do">
						<table border="1" bordercolor="#1addfa" id="table0">
							<tr bgcolor="#4682B4">
								<td colspan="5" align="center">五线七口信息</td>
							</tr>
							<tr>
								<td>五线名称</td>
								<td>七口名称</td>
								<td>销量（台）</td>
								<td>收入（元）</td>
								<td>毛利</td>

							</tr>

							<tr>
								<td><input type="text" name="LINENAME" id="fine_LINENAME"
									readonly="readonly" /></td>
								<td><input type="text" name="PORTNAME" id="fine_PORTNAME"
									readonly="readonly" /></td>
								<td><input type="text" name="SALEAMOUNT"
									id="fine_SALEAMOUNT" required="required" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								<td><input type="text" name="INCOME" id="fine_INCOME"
									required="required" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								<td><input type="text" name="MAORI" id="fine_MAORI"
									required="required" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>


							</tr>


						</table>

						<!-- <input type="submit" value="Submit"> -->

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateFine()">保存</button>

				</div>
			</div>
		</div>
	</div>
	<!--生命周期列修改模态框 -------------------------------------------------------------------------------------------- -->

	<!-- 生命周期 模态框------------------ -->
	<div class="modal fade" id="modalWeek" tabindex="3" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">信息设置</h4>
				</div>
				<div class="modal-body modal-li">
					<form id="form1" method="post"
						action="../parameterSet/addAndUpdateLifeDate1.do">
						<table border="1" bordercolor="#1addfa" id="table0">
							<tr bgcolor="#4682B4">
								<td colspan="5" align="center">生命周期维度规划</td>
							</tr>

							<tr>
								<td>时期</td>
								<td id="cycle1">导入期</td>
								<td id="cycle2">成长期</td>
								<td id="cycle3">成熟期</td>
								<td id="cycle4">衰退期</td>
							</tr>
							<tr>
								<td id="change">持续时长（周）</td>
								<td><input type="text" name="model_DURATION" align="top"
									id="model_DURATION1" /></td>
								<td><input type="text" name="model_DURATION" align="top"
									id="model_DURATION2" /></td>
								<td><input type="text" name="model_DURATION" align="top"
									id="model_DURATION3" /></td>
								<td><input type="text" name="model_DURATION" align="top"
									id="model_DURATION4" /></td>
							</tr>
							<input type="hidden" name="tend" align="top" id="tt" />

						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateNew()">保存</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 区域销量列 模态框------------------ -->
	<div class="modal fade" id="modalCity" tabindex="3" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: red;">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">城市维度规划信息设置</h4>

				</div>
				<div class="modal-body modal-li">

					<form id="form1" method="post"
						action="../parameterSet/addAndUpdateCityDateNew.do">


						<table border="1" bordercolor="#1addfa" id="table1">
							<tr bgcolor="#4682B4">
								<td colspan="4" align="center">城市维度规划</td>
							</tr>
							<tr>
								<td>区域</td>
								<td>销量（台）</td>
								<!-- <td>收入（元）</td>
							<td>覆盖客户</td> -->
								<td style="text-align: center;"><select
									name="term_brnd_nam" class="select_searchableMy" id="select1"
									style="background-color: #00063c; border: none; width: 80px;">
										<option value="">请选择品牌</option>
										<option>苹果</option>
										<option>华为</option>
										<option>三星</option>
										<option>中国移动</option>
										<option>小米</option>
										<option>魅族</option>
										<option>OPPO</option>

								</select></td>
								<td><select name="term_mdl_nam" id="select2"
									class="select_searchableMy"
									style="background-color: #00063c; border: none; width: 80px;">
										<option value="">请选择型号</option>
								</select></td>

							</tr>



							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="广州" disabled="disabled" id="AREANAME_GZ" /></td>
								<td><input type="text" name="ALEAMOUNTS" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
									value="${gzDate.SALEAMOUNTS}" id="SALEAMOUNTS_GZ" align="top" /></td>						
								<td id="gzDate" colspan="2"></td>


							</tr>

							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="肇庆" disabled="disabled" id="AREANAME_ZQ" /></td>
								<td><input type="text" name="ALEAMOUNTS" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
									value="${zqDate.SALEAMOUNTS}" id="SALEAMOUNTS_ZQ" align="top" /></td>
								
								<td id="zqDate" colspan="2"></td>

							</tr>


							<tr>
								<td><input type="text" name="AREANAME_QY" align="top"
									id="AREANAME_QY" value="清远" disabled="disabled" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${qyDate.SALEAMOUNTS}" id="SALEAMOUNTS_QY" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="qyDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="韶关" disabled="disabled" id="AREANAME_SG" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${sgDate.SALEAMOUNTS}" id="SALEAMOUNTS_SG" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								

								<td id="sgDate" colspan="2"></td>
							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="云浮" disabled="disabled" id="AREANAME_YF" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${yfDate.SALEAMOUNTS}" id="SALEAMOUNTS_YF" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="yfDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME_SZ" align="top"
									value="深圳" disabled="disabled" id="AREANAME_SZ" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${szDate.SALEAMOUNTS}" id="SALEAMOUNTS_SZ" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="szDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="汕头" disabled="disabled" id="AREANAME_ST" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${stDate.SALEAMOUNTS}" id="SALEAMOUNTS_ST" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="stDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="揭阳" disabled="disabled" id="AREANAME_JY" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${jyDate.SALEAMOUNTS}" id="SALEAMOUNTS_JY" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="jyDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="梅州" disabled="disabled" id="AREANAME_MZ" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${mzDate.SALEAMOUNTS}" id="SALEAMOUNTS_MZ" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="mzDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="潮州" disabled="disabled" id="AREANAME_CZ" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${czDate.SALEAMOUNTS}" id="SALEAMOUNTS_CZ" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="czDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="汕尾" disabled="disabled" id="AREANAME_SW" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${swDate.SALEAMOUNTS}" id="SALEAMOUNTS_SW" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="swDate" colspan="2"></td>

							</tr>

							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="东莞" disabled="disabled" id="AREANAME_DG" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${dgDate.SALEAMOUNTS}" id="SALEAMOUNTS_DG" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="dgDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="中山" disabled="disabled" id="AREANAME_ZS" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${zsDate.SALEAMOUNTS}" id="SALEAMOUNTS_ZS" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="zsDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="惠州" disabled="disabled" id="AREANAME_HZ" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${hzDate.SALEAMOUNTS}" id="SALEAMOUNTS_HZ" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="hzDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="珠海" disabled="disabled" id="AREANAME_ZH" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${zhDate.SALEAMOUNTS}" id="SALEAMOUNTS_ZH" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="zhDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="河源" disabled="disabled" id="AREANAME_HY" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${hyDate.SALEAMOUNTS}" id="SALEAMOUNTS_HY" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="hyDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="佛山" disabled="disabled" id="AREANAME_FS" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${fsDate.SALEAMOUNTS}" id="SALEAMOUNTS_FS" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="fsDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="江门" disabled="disabled" id="AREANAME_JM" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${jmDate.SALEAMOUNTS}" id="SALEAMOUNTS_JM" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="jmDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="湛江" disabled="disabled" id="AREANAME_ZJ" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${zjDate.SALEAMOUNTS}" id="SALEAMOUNTS_ZJ" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="zjDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="茂名" disabled="disabled" id="AREANAME_MM" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${mmDate.SALEAMOUNTS}" id="SALEAMOUNTS_MM" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="mmDate" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="阳江" disabled="disabled" id="AREANAME_YJ" /></td>
								<td><input type="text" name="ALEAMOUNTS"
									value="${yjDate.SALEAMOUNTS}" id="SALEAMOUNTS_YJ" align="top"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" /></td>
								
								<td id="yjDate" colspan="2"></td>
							</tr>
							<tr>
								<td>当前汇总</td>
								<td id="nowSaleAmount"></td>
								<td id="nowIncomeAomount11" style="display: none;"></td>
								<td id="nowStockAmount" style="display: none;"></td>
								<td id="nowSaleAmountDate" colspan="2"></td>
							</tr>

							<tr>
								<td>实际汇总</td>
								<td id="actualSaleAmount"></td>
								<!-- <td id="actualIncomeAmount" style="display: none;"></td> -->
								<td id="actualOverAmount" style="display: none;"></td>
								<td id="nowActualAmountDate" colspan="2"></td>
							</tr>

						</table>

					</form>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateCityNew('1')">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!--区域收入列模态框修改操作  -->
	<div class="modal fade" id="modalIncomeCity" tabindex="3" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: red;">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">城市维度规划信息设置</h4>

				</div>
				<div class="modal-body modal-li">

					<form id="form1" method="post"
						action="../parameterSet/addAndUpdateCityDateNew.do">


						<table border="1" bordercolor="#1addfa" id="table1">
							<tr bgcolor="#4682B4">
								<td colspan="4" align="center">城市维度规划</td>
							</tr>
							<tr>
								<td>区域</td>
								<td>收入（元）</td>
								<!-- <td>收入（元）</td>
							<td>覆盖客户</td> -->
								<td style="text-align: center;"><select
									name="term_brnd_nam" class="select_searchableMy" id="select11"
									style="background-color: #00063c; border: none; width: 80px;">
										<option value="">请选择品牌</option>
										<option>苹果</option>
										<option>华为</option>
										<option>三星</option>
										<option>中国移动</option>
										<option>小米</option>
										<option>魅族</option>
										<option>OPPO</option>

								</select></td>
								<td><select name="term_mdl_nam" id="select22"
									class="select_searchableMy"
									style="background-color: #00063c; border: none; width: 80px;">
										<option value="">请选择型号</option>
								</select></td>

							</tr>



							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="广州" disabled="disabled" id="AREANAME_GZ" /></td>
								
								<td><input type="text" name="NCOMES" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
									value="${gzDate.INCOMES}" id="INCOMES_GZ" />									
								</td>
								
								<td id="gzDate_INCOMES" colspan="2"></td>


							</tr>

							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="肇庆" disabled="disabled" id="AREANAME_ZQ" />
								</td>
								
								<td><input type="text" name="NCOMES" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
									value="${zqDate.INCOMES}" id="INCOMES_ZQ" />
								</td>
								
								<td id="zqDate_INCOMES" colspan="2"></td>

							</tr>


							<tr>
								<td><input type="text" name="AREANAME_QY" align="top"
									value="清远" disabled="disabled" id="AREANAME_QY" />
								</td>
								
								<td><input type="text" name="NCOMES"
									value="${qyDate.INCOMES}" id="INCOMES_QY" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="qyDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="韶关" disabled="disabled" id="AREANAME_SG" />
								</td>
								
								<td><input type="text" name="NCOMES"
									value="${sgDate.INCOMES}" id="INCOMES_SG" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								

								<td id="sgDate_INCOMES" colspan="2"></td>
							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="云浮" disabled="disabled" id="AREANAME_YF" />
								</td>
								
								<td><input type="text" name="NCOMES"
									value="${yfDate.INCOMES}" id="INCOMES_YF" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="yfDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME_SZ" align="top"
									value="深圳" disabled="disabled" id="AREANAME_SZ" />
								</td>
								
								<td><input type="text" name="NCOMES"
									value="${szDate.INCOMES}" id="INCOMES_SZ" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="szDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="汕头" disabled="disabled" id="AREANAME_ST" />
								</td>
								
								<td><input type="text" name="NCOMES"
									value="${stDate.INCOMES}" id="INCOMES_ST" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="stDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="揭阳" disabled="disabled" id="AREANAME_JY" />
								</td>
								
								<td><input type="text" name="NCOMES"
									value="${jyDate.INCOMES}" id="INCOMES_JY" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="jyDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="梅州" disabled="disabled" id="AREANAME_MZ" /></td>
								
								<td><input type="text" name="NCOMES"
									value="${mzDate.INCOMES}" id="INCOMES_MZ" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="mzDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="潮州" disabled="disabled" id="AREANAME_CZ" /></td>
								
								<td><input type="text" name="NCOMES"
									value="${czDate.INCOMES}" id="INCOMES_CZ" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="czDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="汕尾" disabled="disabled" id="AREANAME_SW" /></td>
								
								<td><input type="text" name="NCOMES"
									value="${swDate.INCOMES}" id="INCOMES_SW" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="swDate_INCOMES" colspan="2"></td>

							</tr>

							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="东莞" disabled="disabled" id="AREANAME_DG" /></td>
								
								<td><input type="text" name="NCOMES"
									value="${dgDate.INCOMES}" id="INCOMES_DG" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="dgDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="中山" disabled="disabled" id="AREANAME_ZS" /></td>
								
								<td><input type="text" name="NCOMES"
									value="${zsDate.INCOMES}" id="INCOMES_ZS" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="zsDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="惠州" disabled="disabled" id="AREANAME_HZ" />
								</td>
								
								<td><input type="text" name="NCOMES"
									value="${hzDate.INCOMES}" id="INCOMES_HZ" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="hzDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="珠海" disabled="disabled" id="AREANAME_ZH" />
								</td>
								
								<td><input type="text" name="NCOMES"
									value="${zhDate.INCOMES}" id="INCOMES_ZH" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="zhDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="河源" disabled="disabled" id="AREANAME_HY" />
								</td>
								
								<td><input type="text" name="NCOMES"
									value="${hyDate.INCOMES}" id="INCOMES_HY" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="hyDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="佛山" disabled="disabled" id="AREANAME_FS" />
								</td>
								
								<td><input type="text" name="NCOMES"
									value="${fsDate.INCOMES}" id="INCOMES_FS" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="fsDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="江门" disabled="disabled" id="AREANAME_JM" />
								</td>
								
								<td><input type="text" name="NCOMES"
									value="${jmDate.INCOMES}" id="INCOMES_JM" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="jmDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="湛江" disabled="disabled" id="AREANAME_ZJ" />
								</td>
								
								<td><input type="text" name="NCOMES"
									value="${zjDate.INCOMES}" id="INCOMES_ZJ" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="zjDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="茂名" disabled="disabled" id="AREANAME_MM" />
								</td>
								
								<td><input type="text" name="NCOMES"
									value="${mmDate.INCOMES}" id="INCOMES_MM" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="mmDate_INCOMES" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="阳江" disabled="disabled" id="AREANAME_YJ" />
								</td>
								>
								<td><input type="text" name="NCOMES"
									value="${yjDate.INCOMES}" id="INCOMES_YJ" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								
								<td id="yjDate_INCOMES" colspan="2"></td>
							</tr>
							<tr>
								<td>当前汇总</td>
								<td id="nowSaleAmount" style="display: none;"></td>
								<td id="nowIncomeAomount"></td>
								<td id="nowStockAmount" style="display: none;"></td>
								<td id="nowIncomeAmountDate" colspan="2"></td>
							</tr>

							<tr>
								<td>实际汇总</td>
								<td id="actualSaleAmount" style="display: none;"></td>
								<td id="actualIncomeAmount"></td>
								<td id="actualOverAmount" style="display: none;"></td>
								<td id="nowActualIncomeDate" colspan="2"></td>
							</tr>

						</table>

					</form>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateCityIncome('1')">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!--区域覆盖客户量列模态框修改操作  -->
	<div class="modal fade" id="modalOverCity" tabindex="3" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: red;">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">城市维度规划信息设置</h4>

				</div>
				<div class="modal-body modal-li">

					<form id="form1" method="post"
						action="../parameterSet/addAndUpdateCityDateNew.do">


						<table border="1" bordercolor="#1addfa" id="table1">
							<tr bgcolor="#4682B4">
								<td colspan="4" align="center">城市维度规划</td>
							</tr>
							<tr>
								<td>区域</td>
								<td>覆盖客户</td>
								<!-- <td>收入（元）</td>
							<td>覆盖客户</td> -->
								<td style="text-align: center;"><select
									name="term_brnd_nam" class="select_searchableMy" id="select33" runat="server"
									style="background-color: #00063c; border: none; width: 80px;">
										<option value="">请选择品牌</option> 									
										<option>苹果</option>
										<option>华为</option>
										<option>三星</option>
										<option>中国移动</option>
										<option>小米</option>
										<option>魅族</option>
										<option>OPPO</option>

								</select></td>
								<td><select name="term_mdl_nam" id="select44"
									class="select_searchableMy"
									style="background-color: #00063c; border: none; width: 80px;">
										<option value="">请选择型号</option>
								</select></td>

							</tr>



							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="广州" disabled="disabled" id="AREANAME_GZ" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
									value="${gzDate.OVERAMOUNTS}" id="OVERAMOUNTS_GZ" />
								</td>
								<td id="gzDate_OVERAMOUNTS" colspan="2"></td>


							</tr>

							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="肇庆" disabled="disabled" id="AREANAME_ZQ" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
									value="${zqDate.OVERAMOUNTS}" id="OVERAMOUNTS_ZQ" />
								</td>
								<td id="zqDate_OVERAMOUNTS" colspan="2"></td>

							</tr>


							<tr>
								<td><input type="text" name="AREANAME_QY" align="top"
									value="清远" disabled="disabled" id="AREANAME_QY" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${qyDate.OVERAMOUNTS}" id="OVERAMOUNTS_QY" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="qyDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="韶关" disabled="disabled" id="AREANAME_SG" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${sgDate.OVERAMOUNTS}" id="OVERAMOUNTS_SG" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>

								<td id="sgDate_OVERAMOUNTS" colspan="2"></td>
							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="云浮" disabled="disabled" id="AREANAME_YF" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${yfDate.OVERAMOUNTS}" id="OVERAMOUNTS_YF" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="yfDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME_SZ" align="top"
									value="深圳" disabled="disabled" id="AREANAME_SZ" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${szDate.OVERAMOUNTS}" id="OVERAMOUNTS_SZ" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="szDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="汕头" disabled="disabled" id="AREANAME_ST" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${stDate.OVERAMOUNTS}" id="OVERAMOUNTS_ST" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="stDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="揭阳" disabled="disabled" id="AREANAME_JY" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${jyDate.OVERAMOUNTS}" id="OVERAMOUNTS_JY" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="jyDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="梅州" disabled="disabled" id="AREANAME_MZ" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${mzDate.OVERAMOUNTS}" id="OVERAMOUNTS_MZ" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="mzDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="潮州" disabled="disabled" id="AREANAME_CZ" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${czDate.OVERAMOUNTS}" id="OVERAMOUNTS_CZ" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="czDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="汕尾" disabled="disabled" id="AREANAME_SW" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${swDate.OVERAMOUNTS}" id="OVERAMOUNTS_SW" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="swDate_OVERAMOUNTS" colspan="2"></td>

							</tr>

							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="东莞" disabled="disabled" id="AREANAME_DG" />
								</td>
							
								<td><input type="text" name="VERAMOUNTS"
									value="${dgDate.OVERAMOUNTS}" id="OVERAMOUNTS_DG" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="dgDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="中山" disabled="disabled" id="AREANAME_ZS" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${zsDate.OVERAMOUNTS}" id="OVERAMOUNTS_ZS" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="zsDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="惠州" disabled="disabled" id="AREANAME_HZ" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${hzDate.OVERAMOUNTS}" id="OVERAMOUNTS_HZ" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="hzDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="珠海" disabled="disabled" id="AREANAME_ZH" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${zhDate.OVERAMOUNTS}" id="OVERAMOUNTS_ZH" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="zhDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="河源" disabled="disabled" id="AREANAME_HY" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${hyDate.OVERAMOUNTS}" id="OVERAMOUNTS_HY" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="hyDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="佛山" disabled="disabled" id="AREANAME_FS" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${fsDate.OVERAMOUNTS}" id="OVERAMOUNTS_FS" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="fsDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="江门" disabled="disabled" id="AREANAME_JM" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${jmDate.OVERAMOUNTS}" id="OVERAMOUNTS_JM" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="jmDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="湛江" disabled="disabled" id="AREANAME_ZJ" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${zjDate.OVERAMOUNTS}" id="OVERAMOUNTS_ZJ" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="zjDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="茂名" disabled="disabled" id="AREANAME_MM" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${mmDate.OVERAMOUNTS}" id="OVERAMOUNTS_MM" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="mmDate_OVERAMOUNTS" colspan="2"></td>

							</tr>
							<tr>
								<td><input type="text" name="AREANAME" align="top"
									value="阳江" disabled="disabled" id="AREANAME_YJ" />
								</td>
								
								<td><input type="text" name="VERAMOUNTS"
									value="${yjDate.OVERAMOUNTS}" id="OVERAMOUNTS_YJ" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td id="yjDate_OVERAMOUNTS" colspan="2"></td>
							</tr>
							<tr>
								<td>当前汇总</td>
								<td id="nowSaleAmount" style="display: none;"></td>
								<td id="nowIncomeAomount" style="display: none;"></td>
								<td id="nowOverAmount"></td>
								<td id="nowOverAmountDate" colspan="2"></td>
							</tr>

							<tr>
								<td>实际汇总</td>
								<!--  <td id="actualSaleAmount" style="display: none;"></td> -->
								<!--  <td id="actualIncomeAmount" style="display: none;"></td> -->
								<td id="amountActualOver"></td>
								<td id="amountActualOverDate" colspan="2"></td>
							</tr>

						</table>

					</form>


				</div>
				<div class="modal-footer" align="center">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateCityNewOver('1')">保存</button>
				</div>
			</div>
		</div>
	</div>






	<!--------------------------------五线七口模态框设置修改整个列表的值----------------------------->
	<div class="modal fade" id="fineDateNew" tabindex="3" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">五线七口规划信息设置</h4>
				</div>
				<div class="modal-body modal-li">
					<form id="form1" method="post" action="../fiveAndArea/test.do">
						<!--五线七口数据表  -->

						<table border="1" bordercolor="#1addfa" id="table2">
							<tr bgcolor="#4682B4">
								<td colspan="5" align="center">五线七口维度规划</td>
							</tr>
							<tr>
								<td>五线名称</td>
								<td>七口名称</td>
								<td>销量（台）</td>
								<td>收入（元）</td>
								<td>毛利</td>


							</tr>


							<tr>
								<td rowspan="4" name="LINENAME" id="LINENAME_1">自有渠道</td>
								<td><input type="text" name="PORTNAME" align="top"
									id="PORTNAME1_1" value="自有渠道整体" disabled="disabled" /></td>
								<td><input type="text" name="SALEAMOUNT"
									value="${fiveLine1_1.SALEAMOUNT}" id="fiveSALEAMOUNT1_1"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="INCOME" id="fiveINCOME1_1"
									value="${fiveLine1_1.INCOME}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="MAORI" id="fiveMAORI1_1"
									value="${fiveLine1_1.MAORI}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>

							</tr>
							<tr>


								<td><input type="text" name="PORTNAME" align="top"
									id="PORTNAME1_2" value="自营代销" disabled="disabled" /></td>
								<td><input type="text" name="SALEAMOUNT"
									id="fiveSALEAMOUNT2_1" value="${fiveLine1_2.SALEAMOUNT}"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="INCOME"
									value="${fiveLine1_2.INCOME}" id="fiveINCOME2_1" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="MAORI" id="fiveMAORI2_1"
									value="${fiveLine1_2.MAORI}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>


							</tr>


							<tr>

								<td><input type="text" name="PORTNAME" align="top"
									id="PORTNAME1_3" value="入柜商" disabled="disabled" /></td>
								<td><input type="text" name="SALEAMOUNT"
									id="fiveSALEAMOUNT3_1" value="${fiveLine1_3.SALEAMOUNT}"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="INCOME" id="fiveINCOME3_1"
									value="${fiveLine1_3.INCOME}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="MAORI" id="fiveMAORI3_1"
									value="${fiveLine1_3.MAORI}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>


							</tr>
							<tr>


								<td><input type="text" name="PORTNAME" align="top"
									id="PORTNAME1_4" value="直销代售" disabled="disabled" /></td>
								<td><input type="text" name="SALEAMOUNT"
									id="fiveSALEAMOUNT4_1" value="${fiveLine1_4.SALEAMOUNT}"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="INCOME" id="fiveINCOME4_1"
									value="${fiveLine1_4.INCOME}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="MAORI" id="fiveMAORI4_1"
									value="${fiveLine1_4.MAORI}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>


							</tr>

							<tr>
								<td rowspan="4" id="LINENAME_2">社会渠道</td>
								<td><input type="text" name="PORTNAME" align="top"
									id="PORTNAME2_1" value="社会渠道整体" disabled="disabled" /></td>
								<td><input type="text" name="SALEAMOUNT"
									id="fiveSALEAMOUNT5_1" value="${fiveLine2_1.SALEAMOUNT}"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="INCOME" id="fiveINCOME5_1"
									value="${fiveLine2_1.INCOME}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="MAORI" id="fiveMAORI5_1"
									value="${fiveLine2_1.MAORI}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>


							</tr>
							<tr>

								<td><input type="text" name="PORTNAME" align="top"
									id="PORTNAME2_2" value="WKA" disabled="disabled" /></td>
								<td><input type="text" name="SALEAMOUNT"
									id="fiveSALEAMOUNT6_1" value="${fiveLine2_2.SALEAMOUNT}"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="INCOME" id="fiveINCOME6_1"
									value="${fiveLine2_2.INCOME}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="MAORI" id="fiveMAORI6_1"
									value="${fiveLine2_2.MAORI}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>


							</tr>


							<tr>

								<td><input type="text" name="PORTNAME" align="top"
									id="PORTNAME2_3" value="KA" disabled="disabled" /></td>
								<td><input type="text" name="SALEAMOUNT"
									id="fiveSALEAMOUNT7_1" value="${fiveLine2_3.SALEAMOUNT}"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="INCOME" id="fiveINCOME7_1"
									value="${fiveLine2_3.INCOME}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="MAORI" id="fiveMAORI7_1"
									value="${fiveLine2_3.MAORI}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>


							</tr>
							<tr>

								<td><input type="text" name="PORTNAME" align="top"
									id="PORTNAME2_4" value="中小客户" disabled="disabled" /></td>
								<td><input type="text" name="SALEAMOUNT"
									id="fiveSALEAMOUNT8_1" value="${fiveLine2_4.SALEAMOUNT}"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="INCOME" id="fiveINCOME8_1"
									value="${fiveLine2_4.INCOME}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="MAORI" id="fiveMAORI8_1"
									value="${fiveLine2_4.MAORI}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>


							</tr>
							<tr>

								<td id="LINENAME_3">电商渠道</td>
								<td><input type="text" name="PORTNAME" align="top"
									id="PORTNAME3_1" value="外呼" disabled="disabled" /></td>
								<td><input type="text" name="SALEAMOUNT"
									id="fiveSALEAMOUNT9_1" value="${fiveLine3_1.SALEAMOUNT}"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="INCOME" id="fiveINCOME9_1"
									value="${fiveLine3_1.INCOME}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="MAORI" id="fiveMAORI9_1"
									value="${fiveLine3_1.MAORI}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>

							</tr>

							<tr>

								<td id="LINENAME_4">家庭政企</td>
								<td><input type="text" name="PORTNAME" align="top"
									id="PORTNAME4_1" value="家庭政企" disabled="disabled" /></td>
								<td><input type="text" name="SALEAMOUNT"
									id="fiveSALEAMOUNT10_1" value="${fiveLine4_1.SALEAMOUNT}"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="INCOME" id="fiveINCOME10_1"
									value="${fiveLine4_1.INCOME}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="MAORI" id="fiveMAORI10_1"
									value="${fiveLine4_1.MAORI}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>

							</tr>
							<tr>
								<td rowspan="3" id="LINENAME_5">零售售后</td>
								<td><input type="text" name="PORTNAME" align="top"
									id="PORTNAME5_1" value="零售售后整体" disabled="disabled" /></td>
								<td><input type="text" name="SALEAMOUNT"
									id="fiveSALEAMOUNT11_1" value="${fiveLine5_1.SALEAMOUNT}"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="INCOME" id="fiveINCOME11_1"
									value="${fiveLine5_1.INCOME}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="MAORI" id="fiveMAORI11_1"
									value="${fiveLine5_1.MAORI}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>


							</tr>
							<tr>

								<td><input type="text" name="PORTNAME" align="top"
									id="PORTNAME5_2" value="零售" disabled="disabled" /></td>
								<td><input type="text" name="SALEAMOUNT"
									id="fiveSALEAMOUNT12_1" value="${fiveLine5_2.SALEAMOUNT}"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="INCOME" id="fiveINCOME12_1"
									value="${fiveLine5_2.INCOME}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="MAORI" id="fiveMAORI12_1"
									value="${fiveLine5_2.MAORI}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>


							</tr>
							<tr>

								<td><input type="text" name="PORTNAME" align="top"
									id="PORTNAME5_3" value="售后" disabled="disabled" /></td>
								<td><input type="text" name="SALEAMOUNT"
									id="fiveSALEAMOUNT13_1" value="${fiveLine5_3.SALEAMOUNT}"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="INCOME" id="fiveINCOME13_1"
									value="${fiveLine5_3.INCOME}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="MAORI" id="fiveMAORI13_1"
									value="${fiveLine5_3.MAORI}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>


							</tr>

							<tr>

								<td id="LINENAME_6">铁通</td>
								<td><input type="text" name="PORTNAME" align="top"
									id="PORTNAME6_1" value="铁通" disabled="disabled" /></td>
								<td><input type="text" name="SALEAMOUNT"
									id="fiveSALEAMOUNT14_1" value="${fiveLine6_1.SALEAMOUNT}"
									maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="INCOME" id="fiveINCOME14_1"
									value="${fiveLine6_1.INCOME}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>
								<td><input type="text" name="MAORI" id="fiveMAORI14_1"
									value="${fiveLine6_1.MAORI}" maxlength="9"
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" />
								</td>

							</tr>



						</table>
				</div>
				</form>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateFineNew()">保存</button>

				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	//显示搜索功能的实现
	function showCusOrgacode(customers){	
		var id = "select1";
	    
	    $("#"+id).empty();
	    $("#select1").append("<option value=''>全部门店</option>"); 
	    $("#"+id).select2({    	
	    	data:customers,    	
	    });
	    $("#"+id).off("select2:select");
	    $("#"+id).on("select2:select",function(e){ 
	    	//clickCustomer();
		});
	}
	
	
	//品牌和型号获取的js事件
		$(document).ready(
				function() {
					$('.select_searchableMy').select2();
					// $('.select_searchable').searchableSelect();
					$.ajax({
						async : false, //千万要记住加这个属性配置
						type : "post",
						datatype : 'json',
						url : "../brandEnty/brands.do",
						success : function(data) {
							for (var i = 0; i < data.length; i++) {
						$("#select1").append(
										"<option value='"+data[i]+"'>"
												+ data[i] + "</option>");
						
						$("#select88").append(
								"<option value='"+data[i]+"'>"
										+ data[i] + "</option>");
								/* showCusOrgacode(data); */					
												
												

							}
						}
					});

					$.ajax({
						async : false, //千万要记住加这个属性配置
						type : "post",
						datatype : 'json',
						url : "../brandEnty/brands.do",
						success : function(data) {
							for (var i = 0; i < data.length; i++) {
								$("#select11").append(
										"<option value='"+data[i]+"'>"
												+ data[i] + "</option>");

							}
						}
					});
				
					$.ajax({
						async : false, //千万要记住加这个属性配置
						type : "post",
						datatype : 'json',
						url : "../brandEnty/brands.do",
						success : function(data) {
							for (var i = 0; i < data.length; i++) {
								$("#select33").append(
										"<option value='"+data[i]+"'>"
												+ data[i] + "</option>");

							}
						}
					});
				
				});

		/* $(document).ready(
				function() {
					//$('.select_searchableMy').select2();

					

				});
		
		
 */
		$("#select11").change(
				function(e) {
					$(this).parent().next().trigger('click');
					var roleid = this.value;
					$.ajax({
						url : "../brandEnty/doubles.do",
						type : "post",
						async : false,
						cache : false,
						dataType : "json",
						data : {
							roleid : roleid
						//传入角色id，到后台获取json  
						},
						success : function(result) {
							$("#select22").empty();
							for (var i = 0; i < result.length; i++) { //循环生成option，并且连接成String对象  
								$("#select22").append(
										"<option value='"+result[i]+"'>"
												+ result[i] + "</option>");
							}
							myMethod("2");
						}
					});

				});
		/* 获取型号的js       */

		$("#select1").change(
				function(e) {
					$(this).parent().next().trigger('click');
					var roleid = this.value;
					$.ajax({
						url : "../brandEnty/doubles.do",
						type : "post",
						async : false,
						cache : false,
						dataType : "json",
						data : {
							roleid : roleid
						//传入角色id，到后台获取json  
						},
						success : function(result) {
							$("#select2").empty();
							for (var i = 0; i < result.length; i++) { //循环生成option，并且连接成String对象  
								$("#select2").append(
										"<option value='"+result[i]+"'>"
												+ result[i] + "</option>");
							}
							myMethod("1");
						}
					});

				});

		
		$("#select88").change(
				function(e) {
					$(this).parent().next().trigger('click');
					var roleid = this.value;
					$.ajax({
						url : "../brandEnty/doubles.do",
						type : "post",
						async : false,
						cache : false,
						dataType : "json",
						data : {
							roleid : roleid
						//传入角色id，到后台获取json  
						},
						success : function(result) {
							$("#select99").empty();
							for (var i = 0; i < result.length; i++) { //循环生成option，并且连接成String对象  
								$("#select99").append(
										"<option value='"+result[i]+"'>"
												+ result[i] + "</option>");
							}
						}
					});

				});	
		
		/*城市维度列修改覆盖数 品牌型号js加载事件   */
		/* $(document).ready(
				function() {
					$('.select_searchableMy').select2();

					

				}); */
				
				
				

		$("#select33").change(
				function(e) {
					$(this).parent().next().trigger('click');
					var roleid = this.value;
					$.ajax({
						url : "../brandEnty/doubles.do",
						type : "post",
						async : false,
						cache : false,
						dataType : "json",
						data : {
							roleid : roleid
						//传入角色id，到后台获取json  
						},
						success : function(result) {
							$("#select44").empty();
							for (var i = 0; i < result.length; i++) { //循环生成option，并且连接成String对象  
								$("#select44").append(
										"<option value='"+result[i]+"'>"
												+ result[i] + "</option>");
							}
							myMethod("3");
						}
					});

				});
		/* 型号改变时触发的事件 */
		$("#select2").change(function(e) {
			myMethod("1");

		});

		$("#select22").change(function(e) {
			myMethod("2");

		});
		$("#select44").change(function(e) {
			myMethod("3");

		});
		/*对销量数据进行汇总的方法   */
		function myMethod(obj) {
			var tt = obj;
			var select1 = $("#select1").val();
			var select2 = $("#select2").val();

			// var date={select1,select2};
			if (tt == "1") {

				$
						.ajax({
							type : "post",
							url : "../parameterSet/setNewBrand.do",
							data : {
								"select1" : select1,
								"select2" : select2
							},
							dataType : 'json',
							contentType : "application/x-www-form-urlencoded; charset=utf-8",
							success : function(result) {
								var sum = 0;
								if ($.isEmptyObject(result)) {
									$("#gzDate").html("");
									$("#zqDate").html("");
									$("#qyDate").html("");
									$("#sgDate").html("");
									$("#yfDate").html("");
									$("#szDate").html("");
									$("#stDate").html("");
									$("#jyDate").html("");
									$("#mzDate").html("");
									$("#czDate").html("");
									$("#swDate").html("");
									$("#dgDate").html("");
									$("#zsDate").html("");
									$("#hzDate").html("");
									$("#zhDate").html("");
									$("#hyDate").html("");
									$("#fsDate").html("");
									$("#jmDate").html("");
									$("#zjDate").html("");
									$("#mmDate").html("");
									$("#yjDate").html("");
									$("#nowSaleAmountDate").html("");
									alert("无数据！");

								} else {

									if (result.gzDate) {
										$("#gzDate").html(
												result.gzDate.amount);
										var gz = Number(result.gzDate.amount);
										

										sum = sum + gz;
									} else {

										$("#gzDate").html("");
									}
									if (result.zqDate) {
										$("#zqDate").html(
												result.zqDate.amount);
										var zq = Number(result.zqDate.amount);

										sum = sum + zq;
									} else {

										$("#zqDate").html("");
									}
									if (result.qyDate) {
										$("#qyDate").html(
												result.qyDate.amount);
										var qy = Number(result.qyDate.amount);

										sum = sum + qy;
									} else {

										$("#qyDate").html("");
									}
									/* ------- */
									if (result.sgDate) {
										$("#sgDate").html(
												result.sgDate.amount);
										var sg = Number(result.sgDate.amount);
										sum = sum + sg;
									} else {

										$("#sgDate").html("");
									}
									if (result.yfDate) {
										$("#yfDate").html(
												result.yfDate.amount);
										var yf = Number(result.yfDate.amount);
										sum = sum + yf;

									} else {

										$("#yfDate").html("");
									}

									if (result.szDate) {
										$("#szDate").html(
												result.szDate.amount);
										var sz = Number(result.szDate.amount);
										sum = sum + sz;
									} else {

										$("#szDate").html("");
									}
									if (result.stDate) {
										$("#stDate").html(
												result.stDate.amount);
										var st = Number(result.stDate.amount);
										sum = sum + st;

									} else {

										$("#stDate").html("");
									}
									if (result.jyDate) {
										$("#jyDate").html(
												result.jyDate.amount);
										var jy = Number(result.jyDate.amount);
										sum = sum + jy;

									} else {

										$("#jyDate").html("");
									}
									if (result.mzDate) {
										$("#mzDate").html(
												result.mzDate.amount);
										var mz = Number(result.mzDate.amount);
										sum = sum + mz;

									} else {

										$("#mzDate").html("");
									}
									if (result.czDate) {
										$("#czDate").html(
												result.czDate.amount);
										var cz = Number(result.czDate.amount);
										sum = sum + cz;

									} else {

										$("#czDate").html("");
									}
									if (result.swDate) {
										$("#swDate").html(
												result.swDate.amount);
										var sw = Number(result.swDate.amount);
										sum = sum + sw;

									} else {

										$("#swDate").html("");
									}
									if (result.dgDate) {
										$("#dgDate").html(
												result.dgDate.amount);
										var dg = Number(result.dgDate.amount);
										sum = sum + dg;
									} else {

										$("#dgDate").html("");
									}
									if (result.zsDate) {
										$("#zsDate").html(
												result.zsDate.amount);
										var zs = Number(result.zsDate.amount);
										sum = sum + zs;
									} else {

										$("#zsDate").html("");
									}
									if (result.hzDate) {
										$("#hzDate").html(
												result.hzDate.amount);
										var hz = Number(result.hzDate.amount);
										sum = sum + hz;
									} else {

										$("#hzDate").html("");
									}
									if (result.zhDate) {
										$("#zhDate").html(
												result.zhDate.amount);
										var zh = Number(result.zhDate.amount);
										sum = sum + zh;
									} else {

										$("#zhDate").html("");
									}
									if (result.hyDate) {
										$("#hyDate").html(
												result.hyDate.amount);
										var hy = Number(result.szDate.amount);
										sum = sum + hy;
									} else {

										$("#hyDate").html("");
									}
									if (result.fsDate) {
										$("#fsDate").html(
												result.fsDate.amount);
										var fs = Number(result.fsDate.amount);
										sum = sum + fs;
									} else {

										$("#fsDate").html("");
									}
									if (result.jmDate) {
										$("#jmDate").html(
												result.jmDate.amount);
										var jm = Number(result.jmDate.amount);
										sum = sum + jm;
									} else {

										$("#jmDate").html("");
									}
									if (result.zjDate) {
										$("#zjDate").html(
												result.zjDate.amount);
										var zj = Number(result.zjDate.amount);
										sum = sum + zj;
									} else {

										$("#zjDate").html("");
									}
									if (result.mmDate) {
										$("#mmDate").html(
												result.mmDate.amount);
										var mm =Number(result.mmDate.amount);
										sum = sum + mm;
									} else {

										$("#mmDate").html("");
									}
									if (result.yjDate) {
										$("#yjDate").html(
												result.yjDate.amount);
										var yj = Number(result.yjDate.amount);
										sum = sum + yj;
									} else {

										$("#yjDate").html("");
									}

									/* 当前汇总  */
									$("#nowSaleAmountDate").html(sum);
									/* 实际汇总    document.getElementById('actualSaleAmount').innerHTML=saleTotal;  */
									$("#nowActualAmountDate").html(document.getElementById('actualSaleAmount').innerHTML);

								}

							}
						});
			}
			/* 2 */
			if (tt == "2") {
				var select11 = $("#select11").val();
				var select22 = $("#select22").val();
				$
						.ajax({
							type : "post",
							url : "../parameterSet/setNewBrand.do",
							data : {
								"select1" : select11,
								"select2" : select22
							},
							dataType : 'json',
							contentType : "application/x-www-form-urlencoded; charset=utf-8",
							success : function(result) {
								var sum = 0;
								if ($.isEmptyObject(result)) {
									$("#gzDate_INCOMES").html("");
									$("#zqDate_INCOMES").html("");
									$("#qyDate_INCOMES").html("");
									$("#sgDate_INCOMES").html("");
									$("#yfDate_INCOMES").html("");
									$("#szDate_INCOMES").html("");
									$("#stDate_INCOMES").html("");
									$("#jyDate_INCOMES").html("");
									$("#mzDate_INCOMES").html("");
									$("#czDate_INCOMES").html("");
									$("#swDate_INCOMES").html("");
									$("#dgDate_INCOMES").html("");
									$("#zsDate_INCOMES").html("");
									$("#hzDate_INCOMES").html("");
									$("#zhDate_INCOMES").html("");
									$("#hyDate_INCOMES").html("");
									$("#fsDate_INCOMES").html("");
									$("#jmDate_INCOMES").html("");
									$("#zjDate_INCOMES").html("");
									$("#mmDate_INCOMES").html("");
									$("#yjDate_INCOMES").html("");
									$("#nowSaleAmountDate").html("");
									alert("无数据！");

								} else {

									if (result.gzDate) {
										$("#gzDate_INCOMES").html(
												result.gzDate.amountprice);
										var gz = result.gzDate.amountprice;

										sum = sum + gz;
									} else {

										$("#gzDate_INCOMES").html("");
									}
									if (result.zqDate) {
										$("#zqDate_INCOMES").html(
												result.zqDate.amountprice);
										var zq = result.zqDate.amountprice;

										sum = sum + zq;
									} else {

										$("#zqDate_INCOMES").html("");
									}
									if (result.qyDate) {
										$("#qyDate_INCOMES").html(
												result.qyDate.amountprice);
										var qy = result.qyDate.amountprice;

										sum = sum + qy;
									} else {

										$("#qyDate_INCOMES").html("");
									}
									/* ------- */
									if (result.sgDate) {
										$("#sgDate_INCOMES").html(
												result.sgDate.amountprice);
										var sg = result.sgDate.amountprice;
										sum = sum + sg;
									} else {

										$("#sgDate_INCOMES").html("");
									}
									if (result.yfDate) {
										$("#yfDate_INCOMES").html(
												result.yfDate.amountprice);
										var yf = result.yfDate.amountprice;
										sum = sum + yf;

									} else {

										$("#yfDate_INCOMES").html("");
									}

									if (result.szDate) {
										$("#szDate_INCOMES").html(
												result.szDate.amountprice);
										var sz = result.szDate.amountprice;
										sum = sum + sz;
									} else {

										$("#szDate_INCOMES").html("");
									}
									if (result.stDate) {
										$("#stDate_INCOMES").html(
												result.stDate.amountprice);
										var st = result.stDate.amountprice;
										sum = sum + st;

									} else {

										$("#stDate_INCOMES").html("");
									}
									if (result.jyDate) {
										$("#jyDate_INCOMES").html(
												result.jyDate.amountprice);
										var jy = result.jyDate.amountprice;
										sum = sum + jy;

									} else {

										$("#jyDate_INCOMES").html("");
									}
									if (result.mzDate) {
										$("#mzDate_INCOMES").html(
												result.mzDate.amountprice);
										var mz = result.mzDate.amountprice;
										sum = sum + mz;

									} else {

										$("#mzDate_INCOMES").html("");
									}
									if (result.czDate) {
										$("#czDate_INCOMES").html(
												result.czDate.amountprice);
										var cz = result.czDate.amountprice;
										sum = sum + cz;

									} else {

										$("#czDate_INCOMES").html("");
									}
									if (result.swDate) {
										$("#swDate_INCOMES").html(
												result.swDate.amountprice);
										var sw = result.swDate.amountprice;
										sum = sum + sw;

									} else {

										$("#swDate_INCOMES").html("");
									}
									if (result.dgDate) {
										$("#dgDate_INCOMES").html(
												result.dgDate.amountprice);
										var dg = result.dgDate.amountprice;
										sum = sum + dg;
									} else {

										$("#dgDate_INCOMES").html("");
									}
									if (result.zsDate) {
										$("#zsDate_INCOMES").html(
												result.zsDate.amountprice);
										var zs = result.zsDate.amountprice;
										sum = sum + zs;
									} else {

										$("#zsDate_INCOMES").html("");
									}
									if (result.hzDate) {
										$("#hzDate_INCOMES").html(
												result.hzDate.amountprice);
										var hz = result.hzDate.amountprice;
										sum = sum + hz;
									} else {

										$("#hzDate_INCOMES").html("");
									}
									if (result.zhDate) {
										$("#zhDate_INCOMES").html(
												result.zhDate.amountprice);
										var zh = result.zhDate.amountprice;
										sum = sum + zh;
									} else {

										$("#zhDate_INCOMES").html("");
									}
									if (result.hyDate) {
										$("#hyDate_INCOMES").html(
												result.hyDate.amountprice);
										var hy = result.szDate.amountprice;
										sum = sum + hy;
									} else {

										$("#hyDate_INCOMES").html("");
									}
									if (result.fsDate) {
										$("#fsDate_INCOMES").html(
												result.fsDate.amountprice);
										var fs = result.fsDate.amountprice;
										sum = sum + fs;
									} else {

										$("#fsDate_INCOMES").html("");
									}
									if (result.jmDate) {
										$("#jmDate_INCOMES").html(
												result.jmDate.amountprice);
										var jm = result.jmDate.amountprice;
										sum = sum + jm;
									} else {

										$("#jmDate_INCOMES").html("");
									}
									if (result.zjDate) {
										$("#zjDate_INCOMES").html(
												result.zjDate.amountprice);
										var zj = result.zjDate.amountprice;
										sum = sum + zj;
									} else {

										$("#zjDate_INCOMES").html("");
									}
									if (result.mmDate) {
										$("#mmDate_INCOMES").html(
												result.mmDate.amountprice);
										var mm = result.mmDate.amountprice;
										sum = sum + mm;
									} else {

										$("#mmDate_INCOMES").html("");
									}
									if (result.yjDate) {
										$("#yjDate_INCOMES").html(
												result.yjDate.amountprice);
										var yj = result.yjDate.amountprice;
										sum = sum + yj;
									} else {

										$("#yjDate_INCOMES").html("");
									}

/* 当前汇总  */

//	$("#nowIncomeAomount1").html(document.getElementById('areaIncomeAmount').innerHTML);	
$("#nowIncomeAmountDate").html(sum);
									/* 实际汇总    document.getElementById('actualSaleAmount').innerHTML=saleTotal;  */
$("#actualIncomeAmount").html(document.getElementById('actualOverAmount').innerHTML);
$("#nowActualIncomeDate").html(document.getElementById('actualOverAmount').innerHTML);

								}

							}
						});

			}
			/*3  */
			if (tt == "3") {
				var select33 = $("#select33").val();
				var select44 = $("#select44").val();
				$
						.ajax({
							type : "post",
							url : "../parameterSet/setNewAmountKH.do",
							data : {
								"select1" : select33,
								"select2" : select44
							},
							dataType : 'json',
							contentType : "application/x-www-form-urlencoded; charset=utf-8",
							success : function(result) {
								var sum = 0;
								if ($.isEmptyObject(result)) {
									$("#gzDate_OVERAMOUNTS").html("");
									$("#zqDate_OVERAMOUNTS").html("");
									$("#qyDate_OVERAMOUNTS").html("");
									$("#sgDate_OVERAMOUNTS").html("");
									$("#yfDate_OVERAMOUNTS").html("");
									$("#szDate_OVERAMOUNTS").html("");
									$("#stDate_OVERAMOUNTS").html("");
									$("#jyDate_OVERAMOUNTS").html("");
									$("#mzDate_OVERAMOUNTS").html("");
									$("#czDate_OVERAMOUNTS").html("");
									$("#swDate_OVERAMOUNTS").html("");
									$("#dgDate_OVERAMOUNTS").html("");
									$("#zsDate_OVERAMOUNTS").html("");
									$("#hzDate_OVERAMOUNTS").html("");
									$("#zhDate_OVERAMOUNTS").html("");
									$("#hyDate_OVERAMOUNTS").html("");
									$("#fsDate_OVERAMOUNTS").html("");
									$("#jmDate_OVERAMOUNTS").html("");
									$("#zjDate_OVERAMOUNTS").html("");
									$("#mmDate_OVERAMOUNTS").html("");
									$("#yjDate_OVERAMOUNTS").html("");
									$("#nowSaleAmountDate").html("");
									alert("无数据！");

								} else {

									if (result.gzDate) {
										$("#gzDate_OVERAMOUNTS").html(
												result.gzDate.cnt);
										var gz = result.gzDate.cnt;

										sum = sum + gz;
									} else {

										$("#gzDate_OVERAMOUNTS").html("");
									}
									if (result.zqDate) {
										$("#zqDate_OVERAMOUNTS").html(
												result.zqDate.cnt);
										var zq = result.zqDate.cnt;

										sum = sum + zq;
									} else {

										$("#zqDate_OVERAMOUNTS").html("");
									}
									if (result.qyDate) {
										$("#qyDate_OVERAMOUNTS").html(
												result.qyDate.cnt);
										var qy = result.qyDate.cnt;

										sum = sum + qy;
									} else {

										$("#qyDate_OVERAMOUNTS").html("");
									}
									/* ------- */
									if (result.sgDate) {
										$("#sgDate_OVERAMOUNTS").html(
												result.sgDate.cnt);
										var sg = result.sgDate.cnt;
										sum = sum + sg;
									} else {

										$("#sgDate_OVERAMOUNTS").html("");
									}
									if (result.yfDate) {
										$("#yfDate_OVERAMOUNTS").html(
												result.yfDate.cnt);
										var yf = result.yfDate.cnt;
										sum = sum + yf;

									} else {

										$("#yfDate_OVERAMOUNTS").html("");
									}

									if (result.szDate) {
										$("#szDate_OVERAMOUNTS").html(
												result.szDate.cnt);
										var sz = result.szDate.cnt;
										sum = sum + sz;
									} else {

										$("#szDate_OVERAMOUNTS").html("");
									}
									if (result.stDate) {
										$("#stDate_OVERAMOUNTS").html(
												result.stDate.cnt);
										var st = result.stDate.cnt;
										sum = sum + st;

									} else {

										$("#stDate_OVERAMOUNTS").html("");
									}
									if (result.jyDate) {
										$("#jyDate_OVERAMOUNTS").html(
												result.jyDate.cnt);
										var jy = result.jyDate.cnt;
										sum = sum + jy;

									} else {

										$("#jyDate_OVERAMOUNTS").html("");
									}
									if (result.mzDate) {
										$("#mzDate_OVERAMOUNTS").html(
												result.mzDate.cnt);
										var mz = result.mzDate.cnt;
										sum = sum + mz;

									} else {

										$("#mzDate_OVERAMOUNTS").html("");
									}
									if (result.czDate) {
										$("#czDate_OVERAMOUNTS").html(
												result.czDate.cnt);
										var cz = result.czDate.cnt;
										sum = sum + cz;

									} else {

										$("#czDate_OVERAMOUNTS").html("");
									}
									if (result.swDate) {
										$("#swDate_OVERAMOUNTS").html(
												result.swDate.cnt);
										var sw = result.swDate.cnt;
										sum = sum + sw;

									} else {

										$("#swDate_OVERAMOUNTS").html("");
									}
									if (result.dgDate) {
										$("#dgDate_OVERAMOUNTS").html(
												result.dgDate.cnt);
										var dg = result.dgDate.cnt;
										sum = sum + dg;
									} else {

										$("#dgDate_OVERAMOUNTS").html("");
									}
									if (result.zsDate) {
										$("#zsDate_OVERAMOUNTS").html(
												result.zsDate.cnt);
										var zs = result.zsDate.cnt;
										sum = sum + zs;
									} else {

										$("#zsDate_OVERAMOUNTS").html("");
									}
									if (result.hzDate) {
										$("#hzDate_OVERAMOUNTS").html(
												result.hzDate.cnt);
										var hz = result.hzDate.cnt;
										sum = sum + hz;
									} else {

										$("#hzDate_OVERAMOUNTS").html("");
									}
									if (result.zhDate) {
										$("#zhDate_OVERAMOUNTS").html(
												result.zhDate.cnt);
										var zh = result.zhDate.cnt;
										sum = sum + zh;
									} else {

										$("#zhDate_OVERAMOUNTS").html("");
									}
									if (result.hyDate) {
										$("#hyDate_OVERAMOUNTS").html(
												result.hyDate.cnt);
										var hy = result.szDate.cnt;
										sum = sum + hy;
									} else {

										$("#hyDate_OVERAMOUNTS").html("");
									}
									if (result.fsDate) {
										$("#fsDate_OVERAMOUNTS").html(
												result.fsDate.cnt);
										var fs = result.fsDate.cnt;
										sum = sum + fs;
									} else {

										$("#fsDate_OVERAMOUNTS").html("");
									}
									if (result.jmDate) {
										$("#jmDate_OVERAMOUNTS").html(
												result.jmDate.cnt);
										var jm = result.jmDate.cnt;
										sum = sum + jm;
									} else {

										$("#jmDate_OVERAMOUNTS").html("");
									}
									if (result.zjDate) {
										$("#zjDate_OVERAMOUNTS").html(
												result.zjDate.cnt);
										var zj = result.zjDate.cnt;
										sum = sum + zj;
									} else {

										$("#zjDate_OVERAMOUNTS").html("");
									}
									if (result.mmDate) {
										$("#mmDate_OVERAMOUNTS").html(
												result.mmDate.cnt);
										var mm = result.mmDate.cnt;
										sum = sum + mm;
									} else {

										$("#mmDate_OVERAMOUNTS").html("");
									}
									if (result.yjDate) {
										$("#yjDate_OVERAMOUNTS").html(
												result.yjDate.cnt);
										var yj = result.yjDate.cnt;
										sum = sum + yj;
									} else {

										$("#yjDate_OVERAMOUNTS").html("");
									}

									/* 当前汇总  */
									$("#nowOverAmountDate").html(sum);
									/* 实际汇总    document.getElementById('actualSaleAmount').innerHTML=saleTotal;  */

									$("#amountActualOver").html(document.getElementById('stockAmount').innerHTML);
									$("#amountActualOverDate").html(document.getElementById('stockAmount').innerHTML);

								}

							}
						});

			}

		}
//数据导入功能的设置		
		function loadFile(file) {
            
			var formdata = new FormData($('form')[0]);

			$.ajax({
				url : '../parameterSet/allDate.do',
				type : 'POST',
				datatype : 'json',
				data : formdata,
				cache : false,
				traditional : true,
				contentType : false,
				processData : false,
				success : function(data) {
					if (data.i ==1 || data.t==1 ) {

						alert("导入成功！");
						location.reload();
					} else if(data.i !=1 || data.t!=1 ){
						
					alert("导入失败，请检查数据是否正确。");	
					location.reload(); 
					}

				},

				error : function() {

				}
			});
		}		
		
		
		
		
	</script>











</body>
</html>