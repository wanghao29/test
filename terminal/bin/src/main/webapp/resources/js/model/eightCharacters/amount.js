
var sub_dim_html ="<div class='row'  id='dim_row' style='width: 100%;height: 100%;'>"+
	"<div class='col-xs' align='left'>"+
	"			<input type='text'hidden='hidden' id='parent_dim' style='color:blue;'> <label>&nbsp;&nbsp;&nbsp;维度2:</label>"+
	"			<select class='select_square' sub_num='sub_num_value' id='sub_dim_id'>"+
	"			</select>"+
	"			<input type='text'  id='parent_mdim' style='color:blue;'>"+
"	</div>"+
 
"	<div class='col-xs-12'  align='center'  style='width: 100%;height: 100%;'>"+
"	 	  <div class='panel panel-default' style='width: 100%;height: 100%;'>"+
"			  <div class='panel-body' style='width: 100%;height: 100%;' >"+

 
"<div id ='sub_char_row' style='height:100%;width: 100%;'>"+

"</div>"+
 

"			  </div>"+
"		</div>"+
"	</div>"+
"</div>";

var pie_html ="<div class='col-xs-4' style='height:100%;' >"+
 " <div  id='pie_char' style='height:100%;width: 100%;'> "+
  
"  </div>"+
"</div>"+
"<div class='col-xs-4'  style='height:100%;'>"+
"	 <div  id='pie_char_Year' style='height:100%;width: 100%;'> "+

"  </div>"+
"</div>"+
"<div class='col-xs-4'  style='height:100%;'>"+
"	  <div  id='pie_char_Mom' style='height:100%;width: 100%;'> "+

"   </div>"+
"</div>";
var bar_html =  " <div  id='bar_char' style='height:100%;width: 100%;'> "+
  
"  </div>";
 
var jqGrid_html = "<table id='jqGridlist_char'></table> <div id='jqGridNav_char'></div>"+
"<div class='col-xs-2' align='left'><button type='button' id='btn_char'style='background-color:#000099;color:#fff;' >开始导出数据</button></div>";

//var jqGridRR_html = "<table id='jqGridlist_char'></table> <div id='jqGridNav_char'></div>"+
//"<div class='col-xs-2' align='left'>";

$(document).ready(function() {

	$("#startMonth").val(getPrevMonthValue());
	$("#stopMonth").val(getPrevMonthValue());
	//初始化页面
	$.ajax({
		type : 'post',
		url : basePath+'/amount/getKpis.do',
		dataType : 'json',
		data: {"type_8":$("#type_8").text(),"startMonth":$("#startMonth").val(),"stopMonth":$("#stopMonth").val()},
		async: false,
		success : function(result, textStatus) {
			
			blockImg();
			 $("#kpi").empty();
			/* $("#kpi").append("<option index='-1'  value =''>请选择</option>");*/
			 var i=0;
			 
//			//毛利额 总览的特殊处理  （脱离配置表）
//			 if($("#type_8").text()=='利'){
//				 gross_profit_zl();
//			 }
			 if($("#type_8").text()=='进'){//进的总览处理 特殊化 【退货率】
				 var flag=true;
				//前三个非退货率的总览
				 $.each(result.rows, function(idx, item) {
					 var infos = result.infos;
					 var infoPerson =infos[i].infoPerson;
					 var confirm = infos[i].confirm;
					var valueUnit =value_unit(result.list[i].value);
					  if(flag==true){
						  $("#kpi").append("<div class='col-xs-4'  onclick=\"chooseDim(\'"+item.kpiKey+"\')\"> <div class='panel panel-default' id="+item.kpiKey+" style=' width: 100%;'> <div class='panel-body' >"
								  +" <p class='ww'>"+item.KpiName+"</p>"
								    +"<h4><span style='color:#FFFFF'>数据来源:</span>"+infoPerson+"</h4>"
								    +"<h4><span style='color:#FFFFF'>确认人:</span>"+confirm+"</h4> "
								    +" <h1  style='float: right;'>"+valueUnit+result.list[i].unit+"</h1></div> </div></div>");
						  i+=1;
						  if(idx==2){
							  flag=false;
						  }
					  }
					 });
				 //第四个开始退货率的总览
				 $.each(result.rows, function(idx, item) {
					 var infos = result.infos;
					 var infoPerson =infos[i].infoPerson;
					 var confirm = infos[i].confirm;
					var valueUnit =value_unit(result.list[i].value);
					  if(idx>=3){
						  var id =item.kpiKey+"1";
						  $("#kpi").append("<div class='col-xs-4' style='display:none;' id='"+id+"'  onclick=\"chooseDim(\'"+item.kpiKey+"\')\"> <div class='panel panel-default' id="+item.kpiKey+" style=' width: 100%;'> <div class='panel-body' >"
								  +" <p class='ww'>"+item.KpiName+"</p>"
								    +"<h4><span style='color:#FFFFF'>数据来源:</span>"+infoPerson+"</h4>"
								    +"<h4><span style='color:#FFFFF'>确认人:</span>"+confirm+"</h4> "
								    +" <h1  style='float: right;'>"+valueUnit+result.list[i].unit+"</h1></div> </div></div></div>"); 
						  i+=1;
					  }
					 });
				 $("#kpi").append("<div class='col-xs-4'> " +
				 		"<select id ='showReturnRate' style='background-color:blue;height:50px;' onchange='showRR()'>" +
				 		"<option value='return_rate'>各地市退货率</option>" +
				 		"<option value='retail_return_rate'>零售各地市退货率</option>" +
				 		"<option value='tt_return_rate'>铁通各地市退货率</option>" +
				 		"<option value='zgds_return_rate'>直供代售各地市退货率</option>" +
				 		"<option value='rgs_return_rate'>入柜商各地市退货率</option>" +
				 		"<option value='zydx_return_rate'>自营代销各地市退货率</option>" +
				 		"<option value='znyj_return_rate'>智能硬件发货与退货情况</option>" +
				 		"<option value='cpjl_return_rate'>产品经理退货台数</option>" +
				 		"</select> </div>");
				 $("#showRr").val("return_rate");
				 $("#return_rate_up1")[0].style.display="block";
				 $("#return_rate_down1")[0].style.display="block";
				 
			 }else{
				 $.each(result.rows, function(idx, item) {
					 var infos = result.infos;
					 var infoPerson =infos[i].infoPerson;
					 var confirm = infos[i].confirm;
					var valueUnit =value_unit(result.list[i].value);
				  $("#kpi").append("<div class='col-xs-3'  onclick=\"chooseDim(\'"+item.kpiKey+"\')\"> <div class='panel panel-default' id="+item.kpiKey+" style=' width: 100%;'> <div class='panel-body' >"
						    +" <p class='ww'>"+item.KpiName+"</p>"
						    +"<h4><span style='color:#FFFFF'>数据来源:</span>"+infoPerson+"</h4>"
						    +"<h4><span style='color:#FFFFF'>确认人:</span>"+confirm+"</h4> "
						    +" <h1  style='float: right;'>"+valueUnit+result.list[i].unit+"</h1></div> </div></div>");
				  i+=1;
				 });
			 }
			 
			
			 if($("#type_8").text()=='存'){
			 
			//三个月以上存货占比
			 //threeMonth();
			 //存货周转率
			 stockTurnoverRatio();
			 }
			 if($("#type_8").text()=='回'){
				//应收帐款周转率
				 accountReceivableTurnoverRatio();
				 //三个月以上应收账款占比
				 accountReceivableRatio();
				 }
			 //初始化图表    以第一个指标为准
			 if($("#type_8").text()=='回'){
				 clickARTR("accountReceivableTurnoverRatio");
			 }
//			 else if($("#type_8").text()=='利'){
//				 clickGrossProfit("gross_profit");
//			 }
			 else{
				 chooseDim(result.rows[0].kpiKey);
			 }
			 
			 setTimeout(function () {$.unblockUI(); }, 500);//细微延迟后关闭进度效果
		},
		error : function(data) {
			console.log("----------------------------------------1、获取后台数据失败：");
		}
	});

});

//退货率的总览显示
function showRR(){
	var id=$("#showReturnRate").val();
	var didId=$("#showRr").val();
	$("#"+id+"_up1")[0].style.display="block";
	$("#"+id+"_down1")[0].style.display="block";
	$("#"+didId+"_up1")[0].style.display="none";
	$("#"+didId+"_down1")[0].style.display="none";
	$("#showRr").val(id);
}

////毛利额总览
//function  gross_profit_zl(){
//	 var gross_profit='gross_profit';
//	 $("#hid_kpikey").val(gross_profit);
//	 var gross_profit_name='毛利额';
//	 var resultMap= overview(gross_profit);
//	 $("#kpi").append("<div class='col-xs-5'  onclick=\"clickGrossProfit(\'"+gross_profit+"\')\"> <div class='panel panel-default' id="+gross_profit+" style=' width: 100%;'> <div class='panel-body' >"
//			    +" <p>"+gross_profit_name+"</p>"
//			    +" <h1  style='float: left;'>地市:"+resultMap.city+"元</h1>"
//			    +" <h1  style='float: right;'>品牌:"+resultMap.brand+"元</h1></div> </div></div>");
//}

//三个月以上存货占比
function threeMonth(){
		 var id ='three_month';
		 var resultMap=overview(id);
		// khknld90zb  khknld180zb  khknld360zb
		 var value=Number($('#overview').val()).toFixed(1);
		 $("#kpi").append("<div class='col-xs-3'  onclick=\"clickThreeMonth(\'"+id+"\')\"> <div class='panel panel-default' id="+id+" style=' width: 100%;'> <div class='panel-body' >"
				 +" <p>三个月以上存货占比</p>"
				 +"<div  style='width:120px;height:70px;float:left;'> <div class='panel panel-default' style=' width: 100%;height:70px;'> <div class='panel-body'  style='padding:0px;margin:0px;'>"
				 +" <p>90-180天</p>"
				 +" <p  style='float: right;'><strong style='font-size:20px;'>"+resultMap.khknld90zb+"%"+"</strong></p>"
				 +"</div> </div></div>"
				 +"<div  style='width:120px;height:70px;float:left;'> <div class='panel panel-default' style=' width: 100%;height:70px;'> <div class='panel-body' style='padding:0px;margin:0px;' >"
				 +" <p>180-360天</p>"
				 +" <p  style='float: right;x'><strong style='font-size:20px;'>"+resultMap.khknld180zb+"%"+"</strong></p>"
				 +"</div> </div></div>"
				 +"<div  style='width:120px;height:70px;float:left;'> <div class='panel panel-default' style=' width: 100%;height:70px;'> <div class='panel-body' style='padding:0px;margin:0px;'>"
				 +" <p>360天以上</p>"
				 +" <p  style='float: right;'><strong style='font-size:20px;'>"+resultMap.khknld360zb+"%"+"</strong></p>"
				 +"</div> </div></div>"
				 +"</div> </div></div>");
}
//应收帐款周转率
function accountReceivableTurnoverRatio(){
	var id ='accountReceivableTurnoverRatio';
	var result= overview(id);
	var value=Number(result).toFixed(1);
	$("#kpi").append("<div class='col-xs-3'  onclick=\"clickARTR(\'"+id+"\')\"> <div class='panel panel-default' id="+id+" style=' width: 100%;'> <div class='panel-body' >"
			    +" <p>应收帐款周转率</p>"
			    +"<h4><span style='color:#FFFFF'>数据来源:</span>null</h4>"
			    +"<h4><span style='color:#FFFFF'>确认人:</span>null</h4> "
			    +" <h1  style='float: right;'>"+value+"%"+"</h1></div> </div></div>");
}
//三个月以上应收账款占比
function accountReceivableRatio(){
	var id ='accountReceivableRatio';
	//yszkzb90 yszkzb180
	var resultMap= overview(id);
	 $("#kpi").append("<div class='col-xs-3'  onclick=\"clickARR(\'"+id+"\')\"> <div class='panel panel-default' id="+id+" style=' width: 100%;'> <div class='panel-body' >"
			    +" <p>三个月以上应收账款占比</p>"
			    +"<h4><span style='color:#FFFFF'>数据来源:</span>null</h4>"
			    +"<h4><span style='color:#FFFFF'>确认人:</span>null</h4> "
			    +"<div  style='width:180px;height:70px;float:left;'> <div class='panel panel-default' style=' width: 100%;height:70px;'> <div class='panel-body' style='padding:0px;margin:0px;'>"
				 +" <p>90-180天占比</p>"
				 +" <p  style='float: right;'><strong style='font-size:20px;'>"+resultMap.yszkzb90+"%"+"</strong></h3>"
				 +"</div> </div></div>"
				 +"<div  style='width:180px;height:70px;float:left;'> <div class='panel panel-default' style=' width: 100%;height:70px;'> <div class='panel-body' style='padding:0px;margin:0px;'>"
				 +" <p>180天以上占比</p>"
				 +" <p  style='float: right;'><strong style='font-size:20px;'>"+resultMap.yszkzb180+"%"+"</strong></h3>"
				 +"</div> </div></div>"
			    +"</div> </div></div>");
}
//存货周转率
function stockTurnoverRatio(){
	var id ='stockTurnoverRatio';
	var result =overview(id);
	var value=Number(result).toFixed(1);
	 $("#kpi").append("<div class='col-xs-3'  onclick=\"clickRatio(\'"+id+"\')\"> <div class='panel panel-default' id="+id+" style=' width: 100%;'> <div class='panel-body' >"
			    +" <p>存货周转率</p>"
			    +"<h4><span style='color:#FFFFF'>数据来源:</span>null</h4>"
			    +"<h4><span style='color:#FFFFF'>确认人:</span>null</h4> "
			    +" <h1  style='float: right;'>"+value+"</h1></div> </div></div>");
}

//点击三个月以上存货占比 显示列表数据
function clickThreeMonth(kpi_value){
	//移除之前选中的css
	var hid=$("#hid_kpikey").val();
	if(hid!=null){
		$("#"+hid).removeClass("changeColor");
	}
	$("#hid_kpikey").val(kpi_value);
	//选中的添加css
	$("#"+kpi_value).addClass("changeColor");
	
	//拼接数据列表
	$("#dim_one").empty();
	$("#dim_one").append("<option>三个月以上存货占比</option>");
	$("#char_row").empty();
	$("#char_row").append("<table id='grid'></table> <div id='list_id'></div>");
	//维度2及以下为空
	$("#sub_dim").empty();
	loadTable('#grid',
            basePath + "/assetsTurnoverRate/threeMonthStockRatio/list.do",
            ['month','khknld90zb','khknld180zb','khknld360zb'],
            ['月份','考核库龄段90-180天占比','考核库龄段180-360天占比','考核库龄段360天以上天占比'],
            true);
}
//存货周转率点击事件
function clickRatio(kpi_value){
	//移除之前选中的css
	var hid=$("#hid_kpikey").val();
	if(hid!=null){
		$("#"+hid).removeClass("changeColor");
	}
	$("#hid_kpikey").val(kpi_value);
	//选中的添加css
	$("#"+kpi_value).addClass("changeColor");
	
	//拼接数据列表
	$("#dim_one").empty();
	$("#dim_one").append("<option>存货周转率</option>");
	$("#char_row").empty();
	$("#char_row").append("<table id='grid'></table> <div id='list_id'></div>");
	//维度2及以下为空
	$("#sub_dim").empty();
	loadTable('#grid',
            basePath + "/assetsTurnoverRate/stockTurnoverRatio/list.do",
            ['month','yycb','hlwcb','sjdbcb','qnzjywcb','chjz','hlwchjz','chzzl','ljchzzl'],
            ['月份','运营成本','互联网成本','省间调拨成本','全年直接业务成本','存货净值','互联网存货净值','存货周转率','累计存货周转率'],
            true);
}
//应收帐款周转率
function clickARTR(kpi_value){
	//移除之前选中的css
	var hid=$("#hid_kpikey").val();
	if(hid!=null){
		$("#"+hid).removeClass("changeColor");
	}
	$("#hid_kpikey").val(kpi_value);
	//选中的添加css
	$("#"+kpi_value).addClass("changeColor");
	
	//拼接数据列表
	$("#dim_one").empty();
	$("#dim_one").append("<option>应收帐款周转率</option>");
	$("#char_row").empty();
	$("#char_row").append("<table id='grid'></table> <div id='list_id'></div>");
	//维度2及以下为空
	$("#sub_dim").empty();
	loadTable('#grid',
            basePath + "/assetsTurnoverRate/accountReceivableTurnoverRatio/list.do",
            ['month','yysr','sjdb','yszkkhsr','yszkjz','byyskzzl','ndyskzzl'],
            ['月份','运营收入','省间调拨','应收账款考核收入','应收帐款净值','本月应收款周转率','年度应收款周转率'],
            true);
}
//三个月以上应收账款占比
function clickARR(kpi_value){
	//移除之前选中的css
	var hid=$("#hid_kpikey").val();
	if(hid!=null){
		$("#"+hid).removeClass("changeColor");
	}
	$("#hid_kpikey").val(kpi_value);
	//选中的添加css
	$("#"+kpi_value).addClass("changeColor");
	
	//拼接数据列表
	$("#dim_one").empty();
	$("#dim_one").append("<option>三个月以上应收账款占比</option>");
	$("#char_row").empty();
	$("#char_row").append("<table id='grid'></table> <div id='list_id'></div>");
	//维度2及以下为空
	$("#sub_dim").empty();
	loadTable('#grid',
            basePath + "/assetsTurnoverRate/accountReceivableRatio/list.do",
            ['month','cflhysye','yszk90','yszkzb90','yszk180','yszkzb180'],
            ['月份','重分类后应收余额','90（不含）-180天（含）应收账款','90（不含）-180天（含）应收账款占比(%)','180天（不含）以上应收账款','180天（不含）以上应收账款占比(%)'],
            true);
}

////毛利额点击事件
//function clickGrossProfit(kpi_value){
//	//移除之前选中的css
//	var hid=$("#hid_kpikey").val();
//	if(hid!=null){
//		$("#"+hid).removeClass("changeColor");
//	}
//	$("#hid_kpikey").val(kpi_value);
//	//选中的添加css
//	$("#"+kpi_value).addClass("changeColor");
//	
//		 $('#export_CostExcel')[0].style.display='none';
//		 $('#export_GrossExcel')[0].style.display='block';
//		 $('#export_GrossExcel_brand')[0].style.display='block';
//	
//	//拼接数据列表
//	$("#dim_one").empty();
//	$("#dim_one").append("<option value='gross_profit_brand'>品牌</option>");
//	$("#dim_one").append("<option value='gross_profit_city'>地市</option>");
//	$("#char_row").empty();
//	$("#sub_dim").empty();//维度2及以下为空
//	$("#char_row").append(bar_html);
//	$("#dim_one").change(function(){
//		changeGross();
//		});
//	grossData("gross_profit_brand");
//	
//	
//}

////选择维度
//function changeGross(){
//	var hid=$("#hid_kpikey").val();
//	if(hid=="gross_profit"){
//		var dim=$("#dim_one").val();
//		grossData(dim);
//	}
//	
//}	

//function grossData(dim){
//	blockImg();
//	var paramObj=new Object();
//	paramObj.startMonth=$("#startMonth").val();
//	paramObj.stopMonth=$("#stopMonth").val();
//	paramObj.dim_key = dim;
//	$.ajax({
//		type : 'post',
//		url : basePath+'/amount/getCharData.do',
//		dataType : 'json',
//		data:paramObj,
//		async: false,
//		success : function(result_data, textStatus) {
//			barChar_grossprofit(result_data);
//		},
//		error : function(data) {
//			//alert(' '+data);
//			console.log("--------------4、方法error：queryCharData");
//		}
//	});
//	setTimeout(function () {$.unblockUI(); }, 500);//细微延迟后关闭进度效果
//}

function barChar_grossprofit(result_data){
	  var paint = initEcharts(echarts,"bar_char");
	  var option = buildStandardBar(); 
		  option.xAxis[0].data=result_data.xAxis_data;
		   option.series[0].data= result_data.data;
		   option.series[1].data=result_data.data_year;
		   option.series[2].data= result_data.data_mom;
	   
	   paint.setOption(option);
}

//三个月存货量占比的jqGrid列表
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
            pageList: [5, 10, 12],        //可供选择的每页的行数（*）
            search: false,                      //是否显示表格搜索
            strictSearch: true,
            // showColumns: true,                  //是否显示所有的列（选择显示的列）
            // showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            paginationPreText: "上一页",
            paginationNextText: "下一页",
//            height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            // showToggle: false,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                  //是否显示父子表
            //得到查询的参数
            queryParams : queryParams,
            columns: createCols(params,titles),
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
        });
}

function createCols(params,titles) {
    if(params.length!=titles.length)
        return null;
    var arr = [];
    for(var i = 0;i<params.length;i++) {
        var obj = {};
        if(titles[i] == '免考核机型'){
            obj.editable={
            		 type : 'select2',
            		 title : '免考核机型',
            		 field : 'mkhjx',
            		 mode:'inline',
            		 emptytext : "请选择免考核机型",
            		 placement : 'top',
            		 source : function() {
            			 //动态获取数据 
            			 var result = [];
            			 $.ajax({                               
            				 url : basePath + "/assetsTurnoverRate/threeMonthStockRatio/querySelect2.do",
            				 async : false,
            				 type : "get",
            				 data : {},
            				 success : function(data, status) {
            					 $.each(data, function(key, value) {
            						 result.push({   
            							 value : value.value, 
            							 text : value.text 
            							 });        
            						 });              
            					 }             
            				 });             
            			 return result;
            		 },
	  /*             inputclass:'input-large', */               
	                 select2:{                    
	                	allowClear : true,                    
	                	multiple : true,
	                	//多选                    
	                	tokenSeparators : [",", " "],                   
	                	width : '250px'//设置宽               
	                }
            };
           
            
     

        }
        else if(titles[i] == '手工调整项'){
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
        startMonth:$("#startMonth").val(),
        endMonth:$("#stopMonth").val()
    };
    return temp;
}

function chooseDim(kpi_value){
	blockImg();
	//移除之前选中的css
	var hid=$("#hid_kpikey").val();
	if(hid!=null){
		$("#"+hid).removeClass("changeColor");
	}
	$("#hid_kpikey").val(kpi_value);
	//选中的添加css
	$("#"+kpi_value).addClass("changeColor");
	if(kpi_value !=""){
		 if(kpi_value == "per_capita_sales"){//人均销量per_capita_sales      
			 $('#export_promotersExcel')[0].style.display='block';
			 clickEditPerson();
		 }else{
			 $('#export_promotersExcel')[0].style.display='none';
		 }
		 if(kpi_value == "after_sale_team_income"){//售后团队收入after_sale_team_income
			 $('#export_team_incomeExcel')[0].style.display='block';
			 clickEditTeam();
		 }else{
			 $('#export_team_incomeExcel')[0].style.display='none';
		 }
		 if(kpi_value == "net_profit"){//净利net_profit  
			 $('#export_CostExcel')[0].style.display='block';
			 clickCost();
		 }else{
			 $('#export_CostExcel')[0].style.display='none';
		 }
		 if(kpi_value == "gross_profit"){//毛利额gross_profit
			 $('#export_GrossExcel')[0].style.display='block';
			 $('#export_GrossExcel_brand')[0].style.display='block';
//			 clickGross();
		 }else{
			 $('#export_GrossExcel')[0].style.display='none';
			 $('#export_GrossExcel_brand')[0].style.display='none';
		 }
		 //退货率 ----【1-9】类都是统一的查询条件
		 if(kpi_value.indexOf("return_rate")!=-1){		//包含有退货率 
			 $('#hiddiv1')[0].style.display='none';
		 }else{
			 $('#hiddiv1')[0].style.display='block';
		 }
			$.ajax({
				type : 'post',
				url : basePath+'/amount/getDimMods.do',
				dataType : 'json',
				data: {"kpi_value":kpi_value},
				async: false,
				success : function(result, textStatus) {
					if(result.retFlag==1){
						var dimData = listToTree(result.rows,'dim','parentDim');
						writeDim1(dimData);
					}
					
				},
				error : function(data) {
					console.log("------------------------------------------2、获取后台数据失败：");
				}
			});
	 }
	setTimeout(function () {$.unblockUI(); }, 500);//细微延迟后关闭进度效果
}

//查询按钮   改变时间后，在已经选中指标的前提下，重新查询指标列表和图表数据
function query(){
	//账期区间校验
	var flag=checkTime();
	if(flag==false){
		return;
	}
	//loading....
	blockImg();
	//被选中的指标的id
	var kpi_value =$("#hid_kpikey").val();
	
	//更新指标列表
	$.ajax({
		type : 'post',
		url : basePath+'/amount/getKpis.do',
		dataType : 'json',
		data: {"type_8":$("#type_8").text(),"startMonth":$("#startMonth").val(),"stopMonth":$("#stopMonth").val()},
		async: false,
		success : function(result, textStatus) {
			
			 $("#kpi").empty();
			 
//			//毛利额 总览的特殊处理  （脱离配置表）
//			 if($("#type_8").text()=='利'){
//				 gross_profit_zl();
//			 }
			 
			 var i=0;
			 if($("#type_8").text()=='进'){//进的总览处理 特殊化 【退货率】
				 var flag=true;
				//前三个非退货率的总览
				 $.each(result.rows, function(idx, item) {
					 var infos = result.infos;
					 var infoPerson =infos[i].infoPerson;
					 var confirm = infos[i].confirm;
					var valueUnit =value_unit(result.list[i].value);
					  if(flag==true){
						  $("#kpi").append("<div class='col-xs-4'  onclick=\"chooseDim(\'"+item.kpiKey+"\')\"> <div class='panel panel-default' id="+item.kpiKey+" style=' width: 100%;'> <div class='panel-body' >"
								  +" <p class='ww'>"+item.KpiName+"</p>"
								    +"<h4><span style='color:#FFFFF'>数据来源:</span>"+infoPerson+"</h4>"
								    +"<h4><span style='color:#FFFFF'>确认人:</span>"+confirm+"</h4> "
								    +" <h1  style='float: right;'>"+valueUnit+result.list[i].unit+"</h1></div> </div></div>");
						  i+=1;
						  if(idx==2){
							  flag=false;
						  }
					  }
					 });
				 //第四个开始退货率的总览
				 $.each(result.rows, function(idx, item) {
					 var infos = result.infos;
					 var infoPerson =infos[i].infoPerson;
					 var confirm = infos[i].confirm;
					var valueUnit =value_unit(result.list[i].value);
					  if(idx>=3){
						  var id =item.kpiKey+"1";
						  $("#kpi").append("<div class='col-xs-4' style='display:none;' id='"+id+"'  onclick=\"chooseDim(\'"+item.kpiKey+"\')\"> <div class='panel panel-default' id="+item.kpiKey+" style=' width: 100%;'> <div class='panel-body' >"
								  +" <p class='ww'>"+item.KpiName+"</p>"
								    +"<h4><span style='color:#FFFFF'>数据来源:</span>"+infoPerson+"</h4>"
								    +"<h4><span style='color:#FFFFF'>确认人:</span>"+confirm+"</h4> "
								    +" <h1  style='float: right;'>"+valueUnit+result.list[i].unit+"</h1></div> </div></div></div>"); 
						  i+=1;
					  }
					 });
				 $("#kpi").append("<div class='col-xs-4'> " +
				 		"<select id ='showReturnRate' style='background-color:blue;height:50px;' onchange='showRR()'>" +
				 		"<option value='return_rate'>各地市退货率</option>" +
				 		"<option value='retail_return_rate'>零售各地市退货率</option>" +
				 		"<option value='tt_return_rate'>铁通各地市退货率</option>" +
				 		"<option value='zgds_return_rate'>直供代售各地市退货率</option>" +
				 		"<option value='rgs_return_rate'>入柜商各地市退货率</option>" +
				 		"<option value='zydx_return_rate'>自营代销各地市退货率</option>" +
				 		"<option value='znyj_return_rate'>智能硬件发货与退货情况</option>" +
				 		"<option value='cpjl_return_rate'>产品经理退货台数</option>" +
				 		"</select> </div>");
				 $("#showRr").val("return_rate");
				 $("#return_rate_up1")[0].style.display="block";
				 $("#return_rate_down1")[0].style.display="block";
				 
			 }else{
				 $.each(result.rows, function(idx, item) {
					 var infos = result.infos;
					 var infoPerson =infos[i].infoPerson;
					 var confirm = infos[i].confirm;
					var valueUnit =value_unit(result.list[i].value);
				  $("#kpi").append("<div class='col-xs-3'  onclick=\"chooseDim(\'"+item.kpiKey+"\')\"> <div class='panel panel-default' id="+item.kpiKey+" style=' width: 100%;'> <div class='panel-body' >"
						    +" <p class='ww'>"+item.KpiName+"</p>"
						    +"<h4><span style='color:#FFFFF'>数据来源:</span>"+infoPerson+"</h4>"
						    +"<h4><span style='color:#FFFFF'>确认人:</span>"+confirm+"</h4> "
						    +" <h1  style='float: right;'>"+valueUnit+result.list[i].unit+"</h1></div> </div></div>");
				  i+=1;
				 });
			 }
			 
			 if($("#type_8").text()=='存'){
			//三个月以上存货占比
			 //threeMonth();
			//存货周转率
			 stockTurnoverRatio();
			 //直接触发点击事件查询
			 if(kpi_value=='three_month'){
				 clickThreeMonth(kpi_value);
			 }
			 if(kpi_value=='stockTurnoverRatio'){
				 clickRatio(kpi_value);
			 }
			 if(kpi_value=='inventory_number' || kpi_value=='inventory_money'){
				 clickInventory(kpi_value);
			 }
			 }
			 if($("#type_8").text()=='回'){
				//应收帐款周转率
				 accountReceivableTurnoverRatio();
				 //三个月以上应收账款占比
				 accountReceivableRatio();
				 //直接触发点击事件查询
				 if(kpi_value=='accountReceivableTurnoverRatio'){
					 clickARTR(kpi_value);
				 }
				 if(kpi_value=='accountReceivableRatio'){
					 clickARR(kpi_value);
				 }
			 }
			$("#"+kpi_value).addClass("changeColor");
			 
			 //重新查询指标列表和图表数据
//			 chooseDim(kpi_value);
			dimOne();
			
		},
		error : function(data) {
			console.log("----------------------------------------1、获取后台数据失败：");
		}
	});
	setTimeout(function () {$.unblockUI(); }, 500);//细微延迟后关闭进度效果
}


function dimOne(){//查询按钮

	 var date_str = $("#dim_one  option:selected").attr("sub_data");
	 var char_type = $("#dim_one  option:selected").attr("char_type");
	 var select_value = $("#dim_one  option:selected").val();
	 var sub_data ;
	 if(date_str != "undefined" && date_str != undefined){
		 sub_data = CircularJSON.parse(date_str);
	 }else{
		 sub_data ="undefined";
	 }
	 //var sub_data =  JSON.parse(date_str=="undefined"?"undefined":date_str);
	 switch(char_type){
	 case "bar":
		 var  result_data = queryCharData(select_value,1);
		 $("#char_row").empty();
		 $("#char_row").append(bar_html);
		 barCharShow(1,"bar_char",result_data);
	   break;
	 case "pie":
		 var  result_data = queryCharData(select_value,1);
		 $("#char_row").empty();
		 $("#char_row").append(pie_html);
		 pieChartShow(1,"pie_char",result_data);
	   break;
	 case "nestPie":
		 var  result_data = queryCharData(select_value,1);
		 $("#char_row").empty();
		 $("#char_row").append(pie_html);
		 nestPieChartShow(1,"pie_char",result_data);
		 
	 break; 
	 case "jqGrid":
		 var  result_data = queryCharData(select_value,1);
		 $("#char_row").empty();
		 $("#char_row").append(jqGrid_html);	//客户  机型  退货率
		 jqGridData(select_value,1);
	   break;
	 case "barline":
		 var  result_data = queryCharData(select_value,1);
		 $("#char_row").empty();
		 $("#char_row").append(bar_html);
		 barlineCharShow(1,"bar_char",result_data);
	 break; 
	 };
	 if(sub_data !="undefined" && sub_data != undefined){
		 $("#sub_dim").empty();
		 $("#sub_dim").append(sub_dim_html.replace("sub_dim_id","dim_2")
										  .replace("dim_row","dim_row_2")
										  .replace("sub_num_value","2")
										  .replace("parent_dim","parent_dim_1")
										  .replace("parent_mdim","parent_mdim_1")
										  .replace("维度2:","维度2:")
										  .replace("sub_char_row","sub_char_row2")
				 
		 );
		 writeSubDim(sub_data,"dim_",1);
	 }else{
		 $("#dim_row_2").remove();
	 	 $("#sub_dim").empty();
	 }
	 
	
}

function writeDim1(dimData){
	 var dim_one = $("#dim_one");
	 dim_one.empty();
	 $("#char_row").empty();
	 $.each(dimData, function(idx, item) {
		// alert(CircularJSON.stringify(item.children));
		 dim_one.append("<option index='"+idx+"' char_type='"+item.charType+"' sub_data='"+CircularJSON.stringify(item.children)+"' value ='"+item.dim+"'>"+item.dimDesc+"</option>");
	 });
	 dim_one.change(function(){
		// var select_idx = $("#dim_one  option:selected").attr("index");
		 var date_str = $("#dim_one  option:selected").attr("sub_data");
		 var char_type = $("#dim_one  option:selected").attr("char_type");
		 var select_value = $("#dim_one  option:selected").val();
		 var sub_data ;
		 if(date_str != "undefined" && date_str != undefined){
			 sub_data = CircularJSON.parse(date_str);
		 }else{
			 sub_data ="undefined";
		 }
		 //var sub_data =  JSON.parse(date_str=="undefined"?"undefined":date_str);
		 switch(char_type){
		 case "bar":
			 var  result_data = queryCharData(select_value,1);
			 $("#char_row").empty();
			 $("#char_row").append(bar_html);
			 barCharShow(1,"bar_char",result_data);
		   break;
		 case "pie":
			 var  result_data = queryCharData(select_value,1);
			 $("#char_row").empty();
			 $("#char_row").append(pie_html);
			 pieChartShow(1,"pie_char",result_data);
		   break;
		 case "nestPie":
			 var  result_data = queryCharData(select_value,1);
			 $("#char_row").empty();
			 $("#char_row").append(pie_html);
			 nestPieChartShow(1,"pie_char",result_data);
			 
		 break; 
		 case "jqGrid":
			 var  result_data = queryCharData(select_value,1);
			 $("#char_row").empty();
			 $("#char_row").append(jqGrid_html);	//客户  机型
			 jqGridData(select_value,1);
		   break;
		 case "barline":
			 var  result_data = queryCharData(select_value,1);
			 $("#char_row").empty();
			 $("#char_row").append(bar_html);
			 barlineCharShow(1,"bar_char",result_data);
		 break; 
		 };
		 if(sub_data !="undefined" && sub_data != undefined){
			 $("#sub_dim").empty();
			 $("#sub_dim").append(sub_dim_html.replace("sub_dim_id","dim_2")
											  .replace("dim_row","dim_row_2")
											  .replace("sub_num_value","2")
											  .replace("parent_dim","parent_dim_1")
											  .replace("parent_mdim","parent_mdim_1")
											  .replace("维度2:","维度2:")
											  .replace("sub_char_row","sub_char_row2")
					 
			 );
			 writeSubDim(sub_data,"dim_",1);
		 }else{
			 $("#dim_row_2").remove();
		 	 $("#sub_dim").empty();
		 }
		 
		
		 
		 
	 });
	 
	 dim_one.trigger('change');
}
function writeSubDim(subDimData,dim_select,sub_num){
	   sub_num = Number(sub_num)+1;
	   var dim_select_id = dim_select +sub_num;
	   var dim_select = $("#"+dim_select_id);
	   dim_select.empty();
	 /*  dim_select.append("<option index='' value =''>请选择</option>")*/
	   $.each(subDimData, function(idx, item) {
		  // alert(CircularJSON.stringify(item.children));
		   dim_select.append("<option index='"+idx+"' char_type='"+item.charType+"' sub_num='"+sub_num+"' sub_data='"+CircularJSON.stringify(item.children)+"'  value ='"+item.dim+"'>"+item.dimDesc+"</option>");
	   });
	   
	   dim_select.change(function(){
			// var sub_num = $("#dim_one  option:selected").attr("sub_num");
		   var current_sub_num = $(this).attr("sub_num");
		   var char_type = $("#dim_"+current_sub_num+"  option:selected").attr("char_type");
		   var select_value =  $("#dim_"+current_sub_num+"  option:selected").val();
			 //var sub_data =  JSON.parse($("#dim_one  option:selected").attr("sub_data"));
		    var date_str = $("#dim_"+current_sub_num+"  option:selected").attr("sub_data");
			 var sub_data ;
			 if(date_str != undefined && date_str != "undefined" ){
				 sub_data = CircularJSON.parse(date_str);
			 }else{
				 sub_data =undefined;
			 }
			 if(sub_data !=undefined && sub_data != "undefined" ){
				// var  sub_dim_select = 
				 $("#dim_row_"+(current_sub_num)).nextAll().remove();
				 $("#sub_dim").append(sub_dim_html.replace("sub_dim_id","dim_"+(Number(current_sub_num)+1))
												  .replace("dim_row","dim_row_"+(Number(current_sub_num)+1))
												  .replace("sub_num_value",(Number(current_sub_num)+1))
												   .replace("parent_dim","parent_dim_"+(Number(current_sub_num)))
												   .replace("parent_mdim","parent_mdim_"+(Number(current_sub_num)))
												  .replace("维度2:","维度"+(Number(current_sub_num)+1)+":")
												  .replace("sub_char_row","sub_char_row"+(Number(current_sub_num)+1))
									);
				 writeSubDim(sub_data,"dim_",current_sub_num);
				 
			 }else{
				 $("#dim_row_"+(current_sub_num)).nextAll().remove();
			 }
			 writeChar(char_type,current_sub_num,select_value);
			
	  });
	   dim_select.trigger("change");
}




function LineCharShow(divId){
	  var sexPaint = initEcharts(echarts,divId);
	  var sexOption = buildLineAreaChart2(); 
	  var xdata = ['201801','201802','201803','201804','201805'];
	   var  series=[
	         {
	             name:'邮件营销',
	             type:'bar',
	             stack: '总量',
	             data:[120, 132, 101, 134, 90, 230, 210]
	         },
	         {
	             name:'联盟广告',
	             type:'line',
	             stack: '总量',
	             data:[220, 182, 191, 234, 290, 330, 310]
	         },
	         {
	             name:'视频广告',
	             type:'line',
	             stack: '总量',
	             data:[150, 232, 201, 154, 190, 330, 410]
	         } 
	     ];
	   sexOption.xAxis.data=xdata;
	   sexOption.series= series;
	   sexPaint.setOption(sexOption);
	
}
function barCharShow(curr_dim,divId,result_data){
	mutilDim(curr_dim);//维度信息
	  var paint = initEcharts(echarts,divId);
	  var option = buildStandardBar(); 
	  if($("#type_8").text()=='份'){//为份时，数据为百分数
		  option= buildStandardBarShare();
		  option.xAxis[0].data=result_data.xAxis_data;
		   option.series[0].data= result_data.data;
		   option.series[1].data=result_data.data_year;
		   option.series[2].data= result_data.data_mom;
	  }
//	  else if($("#type_8").text()=='收' && $("#hid_kpikey").val()!='phone_average_price' && $("#hid_kpikey").val()!='much_average_price'){
//		  option= buildStandardBarIncome();
//		  option.title.text = "单位：万";
//		  option.xAxis[0].data=result_data.xAxis_data;
//		  var data=result_data.data;
//		  var data_year=result_data.data_year;
//		  var data_mom=result_data.data_mom;
//		  var data0=new Array();
//		  var data1=new Array();
//		  var data2=new Array();
//		  for (var i = 0; i < data.length; i++) {
//			data0[i]=(data[i]/10000).toFixed(1);
//		}
//		  for (var i = 0; i < data_year.length; i++) {
//				data1[i]=(data_year[i]/10000).toFixed(1);
//			}
//		  for (var i = 0; i < data_mom.length; i++) {
//				data2[i]=(data_mom[i]/10000).toFixed(1);
//			}
//		   option.series[0].data= data0;
//		   option.series[1].data= data1;
//		   option.series[2].data= data2;
//	  }
	  else if($("#hid_kpikey").val()=='bra_loyalty'){//品牌忠诚度
		  option=buildStandardBarLoyalty();
		  option.xAxis[0].data=result_data.xAxis_data;
		   option.series[0].data= result_data.data;
		   option.series[1].data=result_data.data_year;
		   option.series[2].data= result_data.data_mom;
	  }else{
		  
		  option= buildStandardBarIncome();
		  option.title.text = "单位：万";
		  option.xAxis[0].data=result_data.xAxis_data;
		  var data=result_data.data;
		  var data_year=result_data.data_year;
		  var data_mom=result_data.data_mom;
		  var data0=new Array();
		  var data1=new Array();
		  var data2=new Array();
		  for (var i = 0; i < data.length; i++) {
			  var data_d=data[i]/10000;
			  if(data_d<0.1){
				  data0[i]=(data_d).toFixed(2);
			  }else{
				  data0[i]=(data_d).toFixed(1);
			  }
			
		}
		  for (var i = 0; i < data_year.length; i++) {
			  var data_y=data_year[i]/10000;
			  if(data_y<0.1){
				  data1[i]=(data_y).toFixed(2);
			  }else{
				  data1[i]=(data_y).toFixed(1);
			  }
//				data1[i]=(data_year[i]/10000).toFixed(1);
			}
		  for (var i = 0; i < data_mom.length; i++) {
			  var data_m=data_mom[i]/10000;
			  if(data_m<0.1){
				  data2[i]=(data_m).toFixed(2);
			  }else{
				  data2[i]=(data_m).toFixed(1);
			  }
//				data2[i]=(data_mom[i]/10000).toFixed(1);
			}
		   option.series[0].data= data0;
		   option.series[1].data= data1;
		   option.series[2].data= data2;
		  
//		  option.xAxis[0].data=result_data.xAxis_data;
//		   option.series[0].data= result_data.data;
//		   option.series[1].data=result_data.data_year;
//		   option.series[2].data= result_data.data_mom;
	  }
	   
	   paint.setOption(option);
	   var select_dim_id = "dim_"+(Number(curr_dim)+1);
	   paint.on('click', function (params) {
		   option.series[0].itemStyle.normal.color=function (param){//params.seriesIndex
			   if(params.dataIndex == param.dataIndex &&$("#parent_dim_"+curr_dim).val()!=params.name){
              	 return '#FF3333';
               }else{
              	 return '#00FFCC';
               } 
			   
		   };
		   option.series[1].itemStyle.normal.color=function (param){
			   if(params.dataIndex == param.dataIndex &&$("#parent_dim_"+curr_dim).val()!=params.name){
              	 return '#FF3333';
               }else{
              	 return '#999933';
               } 
			   
		   };
		   option.series[2].itemStyle.normal.color=function (param){
			   if(params.dataIndex == param.dataIndex &&$("#parent_dim_"+curr_dim).val()!=params.name){
              	 return '#FF3333';
               }else{
              	 return '#66FF00';
               } 
			   
		   };
		   paint.setOption(option);
 
		  	//alert(params);
			  //$("#"+select_dim_id).val(params.data.key);
		   
		      
		      if($("#parent_dim_"+curr_dim).val()==params.name){
		    	//取消维度选择
		    	  $("#parent_dim_"+curr_dim).val(null);
		      }else{
		    	//维度选择
		    	  $("#parent_dim_"+curr_dim).val(params.name);
		      }
		      
		      //获取全部维度-拼维度
			   var str="";
			   for (var i = 1; i <=curr_dim; i++) {
				if($("#parent_dim_"+i).val()!=""&&$("#parent_dim_"+i).val()!=null){
					if(i>1){
						str+="-";
					}
					str+=$("#parent_dim_"+i).val();
				}
			}
			   $("#parent_mdim_"+curr_dim).val(str);
			   
		      
			  $("#"+select_dim_id).trigger("change");
			 
			//  
			 
		  });
 
}

//柱状图与折线图的混搭
function barlineCharShow(curr_dim,divId,result_data){
	mutilDim(curr_dim);//维度信息
	  var paint = initEcharts(echarts,divId);
	  var option = buildStandardBarLine(); 
		  option.xAxis[0].data=result_data.xAxis_data;
		  //柱状图
		  option.series[0].data= result_data.data;
		  //折线图
		  option.series[1].data= result_data.nest_data;
	   
	   paint.setOption(option);
	   var select_dim_id = "dim_"+(Number(curr_dim)+1);
	   paint.on('click', function (params) {
		   option.series[0].itemStyle.normal.color=function (param){//params.seriesIndex
			   if(params.dataIndex == param.dataIndex &&$("#parent_dim_"+curr_dim).val()!=params.name){
            	 return '#FF3333';
             }else{
            	 return '#00FFCC';
             } 
			   
		   };
		   option.series[1].lineStyle.normal.color=function (param){
			   if(params.dataIndex == param.dataIndex &&$("#parent_dim_"+curr_dim).val()!=params.name){
            	 return '#996600';
             }else{
            	 return '#996600';
             } 
			   
		   };
		   paint.setOption(option);
		      
		      if($("#parent_dim_"+curr_dim).val()==params.name){
		    	//取消维度选择
		    	  $("#parent_dim_"+curr_dim).val(null);
		      }else{
		    	//维度选择
		    	  $("#parent_dim_"+curr_dim).val(params.name);
		      }
		      
		      //获取全部维度-拼维度
			   var str="";
			   for (var i = 1; i <=curr_dim; i++) {
				if($("#parent_dim_"+i).val()!=""&&$("#parent_dim_"+i).val()!=null){
					if(i>1){
						str+="-";
					}
					str+=$("#parent_dim_"+i).val();
				}
			}
			   $("#parent_mdim_"+curr_dim).val(str);
			   
		      
			  $("#"+select_dim_id).trigger("change");
			 
			//  
			 
		  });
}


//拼多维度
function mutilDim(curr_dim){
	 //获取全部维度-拼维度
	   var str="";
	   for (var i = 1; i <=curr_dim; i++) {
		if($("#parent_dim_"+i).val()!=""&&$("#parent_dim_"+i).val()!=null){
			if(i>1){
				str+="-";
			}
			str+=$("#parent_dim_"+i).val();
		}
	}
	   $("#parent_mdim_"+curr_dim).val(str);
	   
}


function pieChartShow(curr_dim,divId,result_data){
	mutilDim(curr_dim);//维度信息
	  var piePaint = initEcharts(echarts,divId);
	  var pieOption = buildChartOption();
	  if($("#type_8").text()=='份'){//为份时，数据为百分数
		  pieOption= buildChartOptionShare();
		  pieOption.title.text="";//我司销量
		  pieOption.series[0].name="";//我司销量
		  pieOption.series[0].data = result_data.data;
		  pieOption.legend.data=result_data.legend_data;

		  piePaint.setOption(pieOption);
	  }else{
		  if($("#type_8").text()=='存'){//为存时，库龄库存
			  pieOption= buildInventoryOption();
		  }
		  pieOption.title.text="单位：万";//我司销量
		  pieOption.series[0].name="";//我司销量
		  
		  var data=result_data.data;
		  for (var i = 0; i < data.length; i++) {
			  var data_d=Number(data[i].value)/10000;
			  if(data_d<0.1){
				  data[i].value=(data_d).toFixed(2);
			  }else{
				  data[i].value=(data_d).toFixed(1);
			  }
			
		}
		  
		  pieOption.series[0].data = data;
		  pieOption.legend.data=result_data.legend_data;

		  piePaint.setOption(pieOption);
	  }
	  
	  var select_dim_id = "dim_"+(Number(curr_dim)+1);
	// 处理点击事件并且跳转到相应的百度搜索页面
	  piePaint.on('click', function (params) {
	  	//alert(params);
		  //$("#"+select_dim_id).val(params.data.key);
	      
	      if($("#parent_dim_"+curr_dim).val()==params.name){
	    	//取消维度选择
	    	  $("#parent_dim_"+curr_dim).val(null);
	      }else{
	    	//维度选择
	    	  $("#parent_dim_"+curr_dim).val(params.name);
	      }
	      
		  //获取全部维度
		   var str="";
		   for (var i = 1; i <=curr_dim; i++) {
			if($("#parent_dim_"+i).val()!=""&&$("#parent_dim_"+i).val()!=null){
				if(i>1){
					str+="-";
				}
				str+=$("#parent_dim_"+i).val();
			}
		}
		   $("#parent_mdim_"+curr_dim).val(str);
		   
		  
		  $("#"+select_dim_id).trigger("change");
		
		//  
		 
	  });
	  
	  
	  
	  
	  // 同比
	  var piePaint_Year = initEcharts(echarts,divId+"_Year");
	  var pieOption_Year = buildChartOption(); 
	  if($("#type_8").text()=='份'){//为份时，数据为百分数
		  pieOption_Year= buildChartOptionShare();
		  pieOption_Year.title.text="去年同期";
		  pieOption_Year.series[0].name="我司销量";
		  pieOption_Year.series[0].data =result_data.data_year;
		  pieOption.legend.data=result_data.legend_data;
		  piePaint_Year.setOption(pieOption_Year);
		  
	  }else{
		  if($("#type_8").text()=='存'){//为存时，库龄库存
			  pieOption_Year= buildInventoryOption();
		  }
		  pieOption_Year.title.text="去年同期";
		  pieOption_Year.series[0].name="我司销量";
		  
		  var data=result_data.data_year;
		  for (var i = 0; i < data.length; i++) {
			  var data_d=Number(data[i].value)/10000;
			  if(data_d<0.1){
				  data[i].value=(data_d).toFixed(2);
			  }else{
				  data[i].value=(data_d).toFixed(1);
			  }
			
		}
		  
		  pieOption_Year.series[0].data = data;
		  pieOption.legend.data=result_data.legend_data;
		  piePaint_Year.setOption(pieOption_Year);
	  }
	  
	  
	  //环比
	  var piePaint_Mon = initEcharts(echarts,divId+"_Mom");
	  var pieOption_Mon = buildChartOption(); 
	  if($("#type_8").text()=='份'){//为份时，数据为百分数
		  pieOption_Mon= buildChartOptionShare();
		  pieOption_Mon.title.text="上月";
		  pieOption_Mon.series[0].name="我司销量";
		  pieOption_Mon.series[0].data =result_data.data_mom;
		  pieOption.legend.data=result_data.legend_data;
		  piePaint_Mon.setOption(pieOption_Mon);
	  }else{
		  if($("#type_8").text()=='存'){//为存时，库龄库存
			  pieOption_Mon= buildInventoryOption();
		  }
		  pieOption_Mon.title.text="上月";
		  pieOption_Mon.series[0].name="我司销量";
		  
		  var data=result_data.data_mom;
		  for (var i = 0; i < data.length; i++) {
			  var data_d=Number(data[i].value)/10000;
			  if(data_d<0.1){
				  data[i].value=(data_d).toFixed(2);
			  }else{
				  data[i].value=(data_d).toFixed(1);
			  }
			
		}
		  pieOption_Mon.series[0].data =data;
		  pieOption.legend.data=result_data.legend_data;
		  piePaint_Mon.setOption(pieOption_Mon);
	  }
	 
	  
	  
	  
	  
}
function nestPieChartShow(curr_dim,divId,result_data){
	mutilDim(curr_dim);//维度信息
	 var nestPiePaint = initEcharts(echarts,divId);
	 var nestPieOption = nestPieChart();
	 nestPieOption.legend.data=result_data.legend_data;
	 nestPieOption.title.text="单位：万";
	 
	 var data= result_data.data;
	 var nest_data= result_data.nest_data;
	 
	 for (var i = 0; i < data.length; i++) {
		  var data_d=Number(data[i].value)/10000;
		  if(data_d<0.1){
			  data[i].value=(data_d).toFixed(2);
		  }else{
			  data[i].value=(data_d).toFixed(1);
		  }
	 }
	for (var i = 0; i < nest_data.length; i++) {
		var data_d=Number(nest_data[i].value)/10000;
			if(data_d<0.1){
				nest_data[i].value=(data_d).toFixed(2);
			}else{
				nest_data[i].value=(data_d).toFixed(1);
			}	  
	}
	 nestPieOption.series[0].data= nest_data;
	 nestPieOption.series[1].data= data;
	 nestPiePaint.setOption(nestPieOption);
	 var select_dim_id = "dim_"+(Number(curr_dim)+1);
	 nestPiePaint.on('click', function (params) {
		  	//alert(params);
			  //$("#"+select_dim_id).val(params.data.key);
	      
	      if($("#parent_dim_"+curr_dim).val()==params.name){
	    	//取消维度选择
	    	  $("#parent_dim_"+curr_dim).val(null);
	      }else{
	    	//维度选择
	    	  $("#parent_dim_"+curr_dim).val(params.name);
	      }
	      
			  //获取全部维度
			   var str="";
			   for (var i = 1; i <=curr_dim; i++) {
				if($("#parent_dim_"+i).val()!=""&&$("#parent_dim_"+i).val()!=null){
					if(i>1){
						str+="-";
					}
					str+=$("#parent_dim_"+i).val();
				}
			}
			   $("#parent_mdim_"+curr_dim).val(str);
			   
			  
			  $("#"+select_dim_id).trigger("change");
			
			//  
			 
	 });
	 
	 
	 
	 
	  //同比
	  var piePaint_Year = initEcharts(echarts,divId+"_Year");
	  var pieOption_Year = nestPieChart(); 
	  pieOption_Year.title.text="去年同期";
	 // piePaint_Year.legend.data=result_data.legend_data;
		 
	  var data_year= result_data.data_year;
		 var nest_data_year= result_data.nest_data_year;
		 
		 for (var i = 0; i < data_year.length; i++) {
			  var data_d=Number(data_year[i].value)/10000;
			  if(data_d<0.1){
				  data_year[i].value=(data_d).toFixed(2);
			  }else{
				  data_year[i].value=(data_d).toFixed(1);
			  }
		 }
		for (var i = 0; i < nest_data_year.length; i++) {
			var data_d=Number(nest_data_year[i].value)/10000;
				if(data_d<0.1){
					nest_data_year[i].value=(data_d).toFixed(2);
				}else{
					nest_data_year[i].value=(data_d).toFixed(1);
				}	  
		}
	  
	  pieOption_Year.series[0].data= nest_data_year;
	  pieOption_Year.series[1].data= data_year;
	  /*pieOption_Year.series[0].data = [
	                               {value:135, name:'四大梯队', selected:true},
	                               {value:410, name:'无线七口'},
	                               {value:204, name:'四大尖刀排'},
	                               {value:105, name:'五大战区'},
	                               {value:1048, name:'品牌'}];*/
	  piePaint_Year.setOption(pieOption_Year);
	  
	  // 环比
	  var piePaint_Mon = initEcharts(echarts,divId+"_Mom");
	  var pieOption_Mon = nestPieChart(); 
	  pieOption_Mon.title.text="上月";
	  //pieOption_Mon.legend.data=result_data.legend_data;
		 
	  var data_mom= result_data.data_mom;
		 var nest_data_mom= result_data.nest_data_mom;
		 
		 for (var i = 0; i < data_mom.length; i++) {
			  var data_d=Number(data_mom[i].value)/10000;
			  if(data_d<0.1){
				  data_mom[i].value=(data_d).toFixed(2);
			  }else{
				  data_mom[i].value=(data_d).toFixed(1);
			  }
		 }
		for (var i = 0; i < nest_data_mom.length; i++) {
			var data_d=Number(nest_data_mom[i].value)/10000;
				if(data_d<0.1){
					nest_data_mom[i].value=(data_d).toFixed(2);
				}else{
					nest_data_mom[i].value=(data_d).toFixed(1);
				}	  
		}
	  
	  pieOption_Mon.series[0].data= nest_data_mom;
	  pieOption_Mon.series[1].data= data_mom;
	  /*pieOption_Mon.series[0].data = [
	                               {value:1335, name:'四大梯队', selected:true},
	                               {value:610, name:'无线七口'},
	                               {value:234, name:'四大尖刀排'},
	                               {value:135, name:'五大战区'},
	                               {value:1548, name:'品牌'}];*/
	  piePaint_Mon.setOption(pieOption_Mon);
	 
	 
	 
	 

}

function querySubDim(parentDim){
	$.ajax({
		type : 'post',
		url : basePath+'/amount/getDimMods.do',
		dataType : 'json',
		 data: {"parentDim":parentDim},
		async: false,
		success : function(result, textStatus) {
			if(result.retFlag==1){
				//var dimData = listToTree(result.rows,'dim','parentDim');
				writeDim1(dimData);
			}
		},
		error : function(data) {
			alert('加载发生错误'+data);
		}
	});
	
	
}

function  writeChar(char_type,current_sub_num,select_value){
//	alert(char_type);
	 switch(char_type){
	 case "bar":
		 var  result_data = queryCharData(select_value,current_sub_num);
		 $("#sub_char_row"+(Number(current_sub_num))).empty();
		 $("#sub_char_row"+(Number(current_sub_num))).append(bar_html.replace("bar_char","bar_char"+(Number(current_sub_num))));
		 barCharShow((Number(current_sub_num)),"bar_char"+(Number(current_sub_num)),result_data);
	   break;
	 case "pie":
		 var  result_data = queryCharData(select_value,current_sub_num);
		 $("#sub_char_row"+(Number(current_sub_num))).empty();
		 $("#sub_char_row"+(Number(current_sub_num))).append(pie_html.replace("pie_char", (Number(current_sub_num))+"pie_char") 
									   .replace("pie_char_Year",(Number(current_sub_num))+"pie_char_Year") 
									   .replace("pie_char_Mom", (Number(current_sub_num))+"pie_char_Mom")
								);
		 pieChartShow((Number(current_sub_num)),(Number(current_sub_num))+"pie_char",result_data);
	   break;
	 case "nestPie":
		 var  result_data = queryCharData(select_value,current_sub_num);
		 $("#sub_char_row"+(Number(current_sub_num))).empty();
		 $("#sub_char_row"+(Number(current_sub_num))).append(pie_html.replace("pie_char", (Number(current_sub_num))+"pie_char") 
									   .replace("pie_char_Year",(Number(current_sub_num))+"pie_char_Year") 
									   .replace("pie_char_Mom", (Number(current_sub_num))+"pie_char_Mom")
								);
		 nestPieChartShow((Number(current_sub_num)),(Number(current_sub_num))+"pie_char",result_data);
	   break;
	 case "jqGrid":
		 var  result_data = queryCharData(select_value,current_sub_num);
		 $("#sub_char_row"+(Number(current_sub_num))).empty();
		 $("#sub_char_row"+(Number(current_sub_num))).append(jqGrid_html.replace("jqGridlist_char", ("jqGridlist_char"+Number(current_sub_num))) 
					   .replace("jqGridNav_char",("jqGridNav_char"+Number(current_sub_num)))
					   .replace("btn_char",("btn_char"+Number(current_sub_num))) 
			 		);	//客户  机型
		jqGridData(select_value,(Number(current_sub_num)));
			 break;
	 case "barline":
		 var  result_data = queryCharData(select_value,current_sub_num);
		 $("#sub_char_row"+(Number(current_sub_num))).empty();
		 $("#sub_char_row"+(Number(current_sub_num))).append(bar_html.replace("bar_char","bar_char"+(Number(current_sub_num))));
		 barlineCharShow((Number(current_sub_num)),"bar_char"+(Number(current_sub_num)),result_data);
	   break;
	 };
	
}

function queryCharData(sub_key,current_sub_num){
	var paramObj=new Object();
	var result_Data ={};
	paramObj.startMonth=$("#startMonth").val();
	paramObj.stopMonth=$("#stopMonth").val();
	paramObj.dim_key = sub_key;
	paramObj.type = "量";
	for(var i=(Number(current_sub_num)-1) ;i>0;i--){
		var parent_key = "parent_dim_"+(i);
		paramObj[parent_key]=$("#"+parent_key).val();
	}
	
	$.ajax({
		type : 'post',
		url : basePath+'/amount/getCharData.do',
		dataType : 'json',
		data:paramObj,
		async: false,
		success : function(result, textStatus) {
			result_Data =result;
		},
		error : function(data) {
			//alert(' '+data);
			console.log("--------------4、方法error：queryCharData");
		}
	});

	
	return result_Data;
	
}


function listToTree(list,idField,pidField){
	if(list == null)
		return [];
	listData = list;
	var m = new Map();
	for(var n=0;n<list.length;n++){
		var key = list[n][pidField];
		if(m[key]==null)
			m[key] = [];
		m[key].push(list[n]);	
	}
	var root = [];
	for(var i=0;i<list.length;i++){
		var item = list[i];
		item.children = m[item[idField]];
		if(list[i][pidField]==0||list[i][pidField]==-1||list[i][pidField]==null){
			root.push(item);
		};
	}
	return root;
}


//导入Excel文件
function exportExcel(){
	
	 var epath = $('#uploadFile').val();  
     
     if(epath==""){  
         alert( '导入文件不能为空!');  
         return;  
     }  
       
//     if(epath.substring(epath.lastIndexOf(".") + 1).toLowerCase()=="xlsx"){  
//         alert( '03以上版本Excel导入暂不支持!');  
//         return;  
//     }  
     if (epath.substring(epath.lastIndexOf(".") + 1).toLowerCase()!="xls" && epath.substring(epath.lastIndexOf(".") + 1).toLowerCase()!="xlsx") {  
         alert( '导入文件类型必须为excel!');  
         return;  
     } 
     var formData = new FormData($( "#form1" )[0]); 
     $.ajax({
        //几个参数需要注意一下
            type: 'post',//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: basePath+'/amount/exportExcel.do' ,//url
            data: formData,
            async: false,
            contentType: false,  
            processData: false, 
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if (result.code == 200) {
                //	$("#myModal").Modal("hide");
                    alert("SUCCESS");
                }else{
                //	$("#myModal").Modal("hide");
                	alert(result.code);
                }
            },
            error : function() {
                alert(result.code);
            }
        })
}

function exportTeamExcel(){
	var epath = $('#uploadTeam').val();  
    
    if(epath==""){  
        alert( '导入文件不能为空!');  
        return;  
    }  
      
    if (epath.substring(epath.lastIndexOf(".") + 1).toLowerCase()!="xls" && epath.substring(epath.lastIndexOf(".") + 1).toLowerCase()!="xlsx") {  
        alert( '导入文件类型必须为excel!');  
        return;  
    } 
    var formData = new FormData($( "#form2" )[0]); 
    $.ajax({
       //几个参数需要注意一下
           type: 'post',//方法类型
           dataType: "json",//预期服务器返回的数据类型
           url: basePath+'/amount/exportTeamExcel.do' ,//url
           data: formData,
           async: false,
           contentType: false,  
           processData: false, 
           success: function (result) {
               console.log(result);//打印服务端返回的数据(调试用)
               if (result.code == 200) {
               //	$("#myModal").Modal("hide");
                   alert("SUCCESS");
               }else{
               //	$("#myModal").Modal("hide");
               	alert(result.code);
               }
           },
           error : function() {
               alert(result.code);
           }
       })
}

function exportCost(){
	var epath = $('#uploadCost').val();  
    
    if(epath==""){  
        alert( '导入文件不能为空!');  
        return;  
    }  
      
    if (epath.substring(epath.lastIndexOf(".") + 1).toLowerCase()!="xls" && epath.substring(epath.lastIndexOf(".") + 1).toLowerCase()!="xlsx") {  
        alert( '导入文件类型必须为excel!');  
        return;  
    } 
    var formData = new FormData($( "#form3" )[0]); 
    $.ajax({
       //几个参数需要注意一下
           type: 'post',//方法类型
           dataType: "json",//预期服务器返回的数据类型
           url: basePath+'/amount/exportCost.do' ,//url
           data: formData,
           async: false,
           contentType: false,  
           processData: false, 
           success: function (result) {
               console.log(result);//打印服务端返回的数据(调试用)
               if (result.code == 200) {
               //	$("#myModal").Modal("hide");
                   alert("SUCCESS");
               }else{
               //	$("#myModal").Modal("hide");
               	alert(result.code);
               }
           },
           error : function() {
               alert(result.code);
           }
       })
}

//毛利额-地市  手工导入
function exportGross(){
	var epath = $('#uploadGross').val();  
    
    if(epath==""){  
        alert( '导入文件不能为空!');  
        return;  
    }  
      
    if (epath.substring(epath.lastIndexOf(".") + 1).toLowerCase()!="xls" && epath.substring(epath.lastIndexOf(".") + 1).toLowerCase()!="xlsx") {  
        alert( '导入文件类型必须为excel!');  
        return;  
    } 
    var formData = new FormData($( "#form4" )[0]); 
    $.ajax({
       //几个参数需要注意一下
           type: 'post',//方法类型
           dataType: "json",//预期服务器返回的数据类型
           url: basePath+'/amount/exportGross.do' ,//url
           data: formData,
           async: false,
           contentType: false,  
           processData: false, 
           success: function (result) {
//               console.log(result);//打印服务端返回的数据(调试用)
               if (result.code == 200) {
               //	$("#myModal").Modal("hide");
                   alert("SUCCESS");
               }else{
               //	$("#myModal").Modal("hide");
               	alert(result.code);
               }
           },
           error : function() {
               alert(result.code);
           }
       })
}

//毛利额-品牌  手工导入
function exportGross_brand(){
	var epath = $('#uploadGross_brand').val();  
    
    if(epath==""){  
        alert( '导入文件不能为空!');  
        return;  
    }  
      
    if (epath.substring(epath.lastIndexOf(".") + 1).toLowerCase()!="xls" && epath.substring(epath.lastIndexOf(".") + 1).toLowerCase()!="xlsx") {  
        alert( '导入文件类型必须为excel!');  
        return;  
    } 
    var formData = new FormData($( "#form5" )[0]); 
    $.ajax({
       //几个参数需要注意一下
           type: 'post',//方法类型
           dataType: "json",//预期服务器返回的数据类型
           url: basePath+'/amount/exportGross_brand.do' ,//url
           data: formData,
           async: false,
           contentType: false,  
           processData: false, 
           success: function (result) {
//               console.log(result);//打印服务端返回的数据(调试用)
               if (result.code == 200) {
               //	$("#myModal").Modal("hide");
                   alert("SUCCESS");
               }else{
               //	$("#myModal").Modal("hide");
               	alert(result.code);
               }
           },
           error : function() {
               alert(result.code);
           }
       })
}


//客户明细表
function jqGridData(sub_key,current_sub_num){
//	查询条件
	var paramObj=new Object();
	var result_Data ={};
	paramObj.startMonth=$("#startMonth").val();
	paramObj.stopMonth=$("#stopMonth").val();
	paramObj.dim_key = sub_key;
	paramObj.type = "量";
	for (var i = 1; i <=Number(current_sub_num); i++) {
		var parent_key = "parent_dim_"+(i);
		paramObj[parent_key]=$("#"+parent_key).val();
	}
	var JqGridUrl=basePath+'/amount/initJqGrid.do';
	//初始化明细表----有多种标得数据详细  字段不同，所以jqgrid对应的方法不同。
	if($('#hid_kpikey').val().indexOf('return_rate')!=-1){
		//退货率
		var names=new Array();
		var model=new Array();
		var rownum=15;
		if($('#hid_kpikey').val().indexOf('cpjl_return_rate')!=-1){
			$("#sub_dim").css({"height":650});
			rownum=21;
			names=['账期', '所在线条','产品经理','已发量（台）','退货量（台）-普通机', '退货量（台）-体验机','退货量（台）','退货率'];
			model=[  {name : 'month',index : 'list.month',width : 100}, 
		             {name : 'pmBelone',index : 'list.pmBelone',width : 150}, 
		             {name : 'pmName',index : 'list.pmName',width : 100}, 
		             {name : 'sendAmount',index : 'list.sendAmount',width : 250}, 
		             {name : 'normalReturnAmount',index : 'list.normalReturnAmount',width : 250}, 
		             {name : 'experienceReturnAmount',index : 'list.experienceReturnAmount',width : 250}, 
		             {name : 'returnAmount',index : 'list.returnAmount',width : 150,align : "right"}, 
		             {name : 'returnRatio',index : 'list.returnRatio',width : 250,align : "right",formatter:function(cellvalue, options, rowObject){return cellvalue+'%';}}
		           ];
			//initJqGridRR_pm(JqGridUrl,paramObj,current_sub_num);	//	产品经理退货台数	8
		}else if($('#hid_kpikey').val().indexOf('hsfs_return_rate')!=-1){	
			names=['账期', '全省退货量','非自主回收','非自主回收占总退货率','非自主回收环比', '自主回收','自主回收占总退货率','自主回收环比'];
			model=[  {name : 'month',index : 'list.month',width : 100}, 
		             {name : 'provinceReturnAmount',index : 'list.province_Return_Amount',width : 150}, 
		             {name : 'involuntaryReturnAmount',index : 'list.involuntary_Return_Amount',width : 100}, 
		             {name : 'involuntary_Return_Ratio',index : 'list.involuntaryReturnRatio',width : 250}, 
		             {name : 'involuntaryReturnRinkRatio',index : 'list.involuntaryReturnRinkRatio',width : 250}, 
		             {name : 'autonomousReturnAmount',index : 'list.autonomousReturnAmount',width : 250}, 
		             {name : 'autonomousReturnRatio',index : 'list.autonomousReturnRatio',width : 150,align : "right"}, 
		             {name : 'autonomousReturnRinkRatio',index : 'list.autonomousReturnRinkRatio',width : 250,align : "right"}
		           ];
			//initJqGridRR_method(JqGridUrl,paramObj,current_sub_num);		//回收方式
		}else if($('#hid_kpikey').val().indexOf('znyj_return_rate')!=-1){
			$("#sub_dim").css({"height":400});
			rownum=20;
			names = ['账期','行业名称', '发货量','退货量', '退货率'];//jqGrid的列显示名字
			model = [	 {name : 'month',index : 'list.month',width : 100}, 
			             {name : 'pmName',index : 'list.pmName',width : 100}, 
			             {name : 'sendAmount',index : 'list.sendAmount',width : 250}, 
			             {name : 'returnAmount',index : 'list.returnAmount',width : 150,align : "right"}, 
			             {name : 'returnRatio',index : 'list.returnRatio',width : 250,align : "right",formatter:function(cellvalue, options, rowObject){return cellvalue+'%';}}
			           ];
			//initJqGridRR2(JqGridUrl,paramObj,current_sub_num);	//	退货率  智能硬件发货与退货情况    7
		}else{
			$("#sub_dim").css({"height":650});
			rownum=22;
			names = ['账期', '地市', '发货量','退货量', '退货率'];//jqGrid的列显示名字
			model = [ 	 {name : 'month',index : 'list.month',width : 100}, 
			             {name : 'city',index : 'list.city',width : 80},
			             {name : 'sendAmount',index : 'list.sendAmount',width : 250}, 
			             {name : 'returnAmount',index : 'list.returnAmount',width : 150,align : "right"}, 
			             {name : 'returnRatio',index : 'list.returnRatio',width : 250,align : "right",formatter:function(cellvalue, options, rowObject){return cellvalue+'%';}}
			           ];
			//initJqGridRR1(JqGridUrl,paramObj,current_sub_num);	//	退货率  一类的详情表格1-6张表
		}
		
		initJqGridRR(JqGridUrl,paramObj,current_sub_num,names,model,rownum);
	}else{
		initJqGrid(JqGridUrl,paramObj,current_sub_num);			//	客户 或  机型    一类的详情表格
	}
	//初始化 批量导出Excel按钮
	initBatchExport(sub_key,current_sub_num);
}

//客户   机型 的详情表格
function initJqGrid(url,paramObj,current_sub_num){
	mutilDim(current_sub_num);//维度信息
	var table_id="#jqGridlist_char"+current_sub_num;
	var list_id="#jqGridNav_char"+current_sub_num;
//	alert(table_id+"---"+list_id);
	if(Number(current_sub_num)==1){
		table_id="#jqGridlist_char";
		list_id="#jqGridNav_char";
	}
	//创建jqGrid组件
	jQuery(table_id).jqGrid({
				url : url,//组件创建完成之后请求数据的url
				datatype : "json",//请求数据返回的类型。可选json,xml,txt
				postData:paramObj,
				rownumbers: true,
				rowNum : 15,//一页显示多少条
//				rowList : [ 10, 20,30 ],//可供用户选择一页显示多少条
				pager : list_id,//表格页脚的占位符(一般是div)的id
				height:'auto',
				jsonReader:{
					sidx:"sidx",
					root:"list",
					total:"totalPage",
					page:"currentPage",
					records:"rowNumber",
					repeatitems:false
				},
//				sortname : 'id',//初始化的时候排序的字段
//				sortorder : "desc",//排序方式,可选desc,asc
				mtype : "post",//向后台请求数据的ajax的类型。可选post,get
				viewrecords : true,//定义是否要显示总记录数
				caption :'',//表格的标题名字
				colNames : ['账期', '地市', '品牌','机型', '价格段', '客户','分类客户', '子类','值'],//jqGrid的列显示名字
				colModel : [ //jqGrid每一列的配置信息。包括名字，索引，宽度,对齐方式.....
				             {name : 'statDay',index : 'list.statDay',width : 100}, 
				             {name : 'areaName',index : 'list.areaName',width : 80}, 
				             {name : 'brandName',index : 'list.brandName',width : 150}, 
				             {name : 'spec',index : 'list.spec',width : 250}, 
				             {name : 'priceRange',index : 'list.priceRange',width : 150,align : "right"}, 
				             {name : 'custName',index : 'list.custName',width : 250,align : "right"}, 
				             {name : 'custStage',index : 'list.custStage',width : 100,align : "right"}, 
				             {name : 'subType',index : 'list.subType',width : 150,sortable : false} ,
				             {name : 'value',index : 'list.value',width : 150,sortable : false} 
				           ],
				onSelectRow:function(rowid, status){
					var rowData = $(table_id).jqGrid('getRowData',rowid);
					var select_dim_id = "dim_"+(Number(current_sub_num)+1);
						  //$("#"+select_dim_id).val(params.data.key);
//					alert($("#dim_"+current_sub_num+" option:selected").text());
					
					if($("#dim_"+current_sub_num+" option:selected").text()=='机型'){
						$("#parent_dim_"+current_sub_num).val(rowData.spec);
					}else{
						$("#parent_dim_"+current_sub_num).val(rowData.custName);
					}
					 //获取全部维度
					   var str="";
					   for (var i = 1; i <=current_sub_num; i++) {
						if($("#parent_dim_"+i).val()!=""&&$("#parent_dim_"+i).val()!=null){
							if(i>1){
								str+="-";
							}
							str+=$("#parent_dim_"+i).val();
						}
					}
					   $("#parent_mdim_"+current_sub_num).val(str);
					   
						  $("#"+select_dim_id).trigger("change");
				},
			}).trigger('reloadGrid');
	/*创建jqGrid的操作按钮容器*/
	/*可以控制界面上增删改查的按钮是否显示*/
	jQuery(table_id).jqGrid('navGrid', list_id, {edit : false,add : false,del : false});
}


//退货率  的详情表格	1-9
function initJqGridRR(url,paramObj,current_sub_num,names,model,rownum){
	mutilDim(current_sub_num);//维度信息
	var table_id="#jqGridlist_char"+current_sub_num;
	var list_id="#jqGridNav_char"+current_sub_num;
//	alert(table_id+"---"+list_id);
	if(Number(current_sub_num)==1){
		table_id="#jqGridlist_char";
		list_id="#jqGridNav_char";
	}
	//创建jqGrid组件
	jQuery(table_id).jqGrid({
				url : url,//组件创建完成之后请求数据的url
				datatype : "json",//请求数据返回的类型。可选json,xml,txt
				postData:paramObj,
				rownumbers: true,
				rowNum : rownum,//一页显示多少条
//				rowList : [ 10, 20,30 ],//可供用户选择一页显示多少条
				pager : list_id,//表格页脚的占位符(一般是div)的id
				height:'auto',
				jsonReader:{
					sidx:"sidx",
					root:"list",
					total:"totalPage",
					page:"currentPage",
					records:"rowNumber",
					repeatitems:false
				},
//				sortname : 'id',//初始化的时候排序的字段
//				sortorder : "desc",//排序方式,可选desc,asc
				footerrow:true,
        		gridComplete:function(){
        			if(rownum!=15){
        				 var sum_sent=$(table_id).getCol('sendAmount',false,'sum');
            			 var sum_return=$(table_id).getCol('returnAmount',false,'sum');
            			 
            			 var sum_ratio =0;
            			 if(Number(sum_sent)!=0){
            				 sum_ratio =(Number(sum_return)/Number(sum_sent))*100;
            			 }
            			 var ratio=sum_ratio.toFixed(2);
            			 
            			 if(rownum==22){
                			 $(table_id).footerData('set', {city: '总计',sendAmount:sum_sent,returnAmount:sum_return,returnRatio:ratio});
            			 }else if(rownum==20){
                			 $(table_id).footerData('set', {pmName: '总计',sendAmount:sum_sent,returnAmount:sum_return,returnRatio:ratio});
            			 }else if(rownum==21){
            				 var normal_return_amount=$(table_id).getCol('normalReturnAmount',false,'sum');
                			 var experience_return_amount=$(table_id).getCol('experienceReturnAmount',false,'sum');
                			 $(table_id).footerData('set', {pmName: '总计',sendAmount:sum_sent,normalReturnAmount:normal_return_amount,experienceReturnAmount:experience_return_amount,returnAmount:sum_return,returnRatio:ratio});
            			 }
        			}
        			 
        		},
				mtype : "post",//向后台请求数据的ajax的类型。可选post,get
				viewrecords : true,//定义是否要显示总记录数
				caption :'',//表格的标题名字
				colNames :names,//jqGrid的列显示名字
				colModel : model
			}).trigger('reloadGrid');
	/*创建jqGrid的操作按钮容器*/
	/*可以控制界面上增删改查的按钮是否显示*/
	jQuery(table_id).jqGrid('navGrid', list_id, {edit : false,add : false,del : false});
}

//初始化 批量导出Excel按钮
function initBatchExport(sub_key,current_sub_num){
	var btn_id="#btn_char"+current_sub_num;
	if(Number(current_sub_num)==1){
		btn_id="#btn_char";
	}
//	查询条件
	//var paramObj=new Object();
	//var result_Data ={};
	startMonth=$("#startMonth").val();
	stopMonth=$("#stopMonth").val();
	dim_key = sub_key;
	type = "量";
	var exportUrl=basePath+'/amount/initBatchExport.do?startMonth='+startMonth+'&stopMonth='+stopMonth+'&dim_key='+dim_key+'&type='+type+'&current_sub_num='+current_sub_num;
	for (var i = 1; i <=Number(current_sub_num); i++) {
		var parent_key = "parent_dim_"+(i);
		exportUrl+='&'+parent_key+'='+$("#"+parent_key).val();
	}
	$(btn_id).on("click",function(){
		
	//	var excelurl ="<%=basePath%>/hfx/unwantExport.action?impId="+impId;
		
		location.href=exportUrl;
	});
}

//给导入Excel  文件添加 导入数据的再编辑功能   （做弹窗）
//1、导入促销人员的编辑
function clickEditPerson(){
	$("#editPerson").click(function(){
		 BootstrapDialog.show({
	            title: '促销人员数',
	            size :BootstrapDialog.SIZE_WIDE,
	            message: $('<div></div>').load(basePath + '/amount/dialog/editPersonDialog.do',{limit: 25}, 
	           function(data){
	            }),
	            buttons: [{
	                label: '关闭',
	                action: function(dialog) {
	                    dialog.close();
	                }
	            }]
	        });
	});
}
//售后团队收入  的信息 编辑功能
function clickEditTeam(){
	$("#editTeam").click(function(){
		 BootstrapDialog.show({
	            title: '售后团队收入',
	            size :BootstrapDialog.SIZE_WIDE,
	            message: $('<div></div>').load(basePath + '/amount/dialog/editTeamIncome_dialog.do',{limit: 25}, 
	           function(data){
	            }),
	            buttons: [{
	                label: '关闭',
	                action: function(dialog) {
	                    dialog.close();
	                }
	            }]
	        });
	});
}
//净利 费用  的信息 编辑功能
function clickCost(){
	$("#editCost").click(function(){
		 BootstrapDialog.show({
	            title: '酬金和费用',
	            size :BootstrapDialog.SIZE_WIDE,
	            message: $('<div></div>').load(basePath + '/amount/dialog/editCost_dialog.do',{limit: 25}, 
	           function(data){
	            }),
	            buttons: [{
	                label: '关闭',
	                action: function(dialog) {
	                    dialog.close();
	                }
	            }]
	        });
	});
}

//毛利额  的信息 编辑功能
function clickGross(){
	$("#editGross").click(function(){
		 BootstrapDialog.show({
	            title: '毛利额',
	            size :BootstrapDialog.SIZE_WIDE,
	            message: $('<div></div>').load(basePath + '/amount/dialog/editGross_dialog.do',{limit: 25}, 
	           function(data){
	            }),
	            buttons: [{
	                label: '关闭',
	                action: function(dialog) {
	                    dialog.close();
	                }
	            }]
	        });
	});
}

//值数据改  万   亿单位
function value_unit(value){
	if(Math.abs(value/100000000)>=1){
		return (value/100000000).toFixed(2)+'亿';
	}else if(Math.abs(value/10000)>=1){
		return (value/10000).toFixed(2)+'万';
	}else{
		return value;
	}
}


function overview(kpi_value){
	var  url;
	//三月以上存货占比
	if(kpi_value=='three_month'){//三个月以上存货占比
		url=basePath + "/assetsTurnoverRate/threeMonthStockRatio/overview.do";
	}else if(kpi_value=='stockTurnoverRatio'){//存货周转率
		url=basePath + "/assetsTurnoverRate/stockTurnoverRatio/overview.do";
	}else if(kpi_value=='accountReceivableTurnoverRatio'){//应收帐款周转率
		url=basePath + "/assetsTurnoverRate/accountReceivableTurnoverRatio/overview.do";
	}else if(kpi_value=='accountReceivableRatio'){//三个月以上应收账款占比
		url=basePath + "/assetsTurnoverRate/accountReceivableRatio/overview.do";
	}else if(kpi_value=='gross_profit'){//毛利额
		url=basePath + "/amount/gross_profit_zl.do";
	}
	
	var resultMap;
	$.ajax({
        //几个参数需要注意一下
            type: 'post',//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: url,//url
            data: JSON.stringify({'startMonth':$('#startMonth').val(),'stopMonth':$('#stopMonth').val()}),
            async: false,
            contentType: 'application/json',  
            processData: false, 
            success: function (result) {
//            	$('#overview').val(result);
            	resultMap=result;
            },
            error : function() {
            	alert('false');
            	return;
            }
        })
        
        return resultMap;
}

//校验 开始时间   不能晚于  结束时间 
function checkTime(){
	var star = $('#startMonth').val();
	var stop = $('#stopMonth').val();
	
	var star_y=star.substring(0,4);
	var star_m=star.substring(4,6);
	var stop_y=stop.substring(0,4);
	var stop_m=stop.substring(4,6);
	//先比较  年份
	if(Number(star_y)>Number(stop_y)){//开始年份  >  结束年份
		alert('结束时间不能早于开始时间，请确认账期区间');
		return false;
	}else if(Number(star_y)==Number(stop_y)){//开始年份  ==  结束年份  再判断月份
		if(Number(star_m)>Number(stop_m)){//开始月份  >  结束月份  
			alert('结束时间不能早于开始时间，请确认账期区间');
			return false;
		}
	}
}