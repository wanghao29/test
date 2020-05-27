
var grid_selector = "#list";  
 var pager_selector = "#pager";

$(document).ready(function() {
	//顶部菜单切换
    $("#menu li").attr("class","drop");
    $("#product_information").attr("class","active");
	
	
	   //带搜索的下拉框样式初始化
	   $('.select_searchable').searchableSelect();
	   //时间控件设置初始时间
	   $(".prevMonth").val(getPrevMonthValue());
	   //城市下拉框初始化
	   citySelectInit($('#citySelect'));
	   //顶部菜单切换
//	   $("#menu li").attr("class","drop");
//	   $("#customerChannel").attr("class","active");  

  
	   $("#citySelect").change(function(){
		   pageInit();
	   });

});








$(document).ready(function() {
	jqgridInit();
	
	
});

function pageInit(){

}

function jqgridInit(){
	  jQuery("#list").jqGrid(
	      {
	        //datatype : "local",
 	        url:"../productInformationSet/selectAllListed.do",
	        mtype:'post',
	        datatype: "json",
	        loadonce:true,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:$("form").serialize(), 
 	        rowNum:10,  
 	        gridview: true,
	        rowList : [5,10], 
	        //rownumbers: true,    //行首添加顺序编码
	       /* rownumWidth: 60, */    //行首添加顺序编码的列宽
	        autowidth: true,     //表格宽度自动适应父div
	        //height : "80%", //表格宽度自动适应行数
	        height: 300,//表格高度，可以是数字，像素值或者百分比
	        width: "100%",
	        sortorder: "asc",    //指定列排序的次序
	        viewrecords : true,  //显示当前记录，和总记录数 
	        sortname: 'invdate', //默认排序
	        repeatitems: true,   //是否可重复
	        pager: '#pager',     //指定分页组件所在div id
	        jsonReader: {        //描述json 数据格式的数组,需修改
	        	root: 'list',
		    	page: "current",        // json中代表当前页码的数据
		    	total: "pages",         // json中代表页码总数的数据
		    	records: "total",       // json中代表数据行总数的数据
		    	repeatitems: false,     // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
		    	cell: "cell",
		    	id: "fRoleId",
		    	userdata: "userdata",
		    },               
	        caption : "",
	        
	        //编辑单元格
	        cellEdit : true,
	        cellsubmit : 'rclientArray',
	        //编辑框切换到文本框时触发
	     /*   onCellSelect : function(rowid,iCol,cellcontent,e){
	        	
	        	alert($("#1_1").val());
	        },*/
	        //点击可编辑的框时触发
	        afterEditCell : function(rowid, cellname, value, iRow, iCol){
	        	lastValue = value
	        },
	        
	        //保存前触发
		  	beforeSaveCell : function(rowid, cellname, value, iRow, iCol){ //行id,单元格名称,单元格值 ,行的index,列的index 
//		  		alert('行id:'+rowid+",单元格名称:"+cellname+",单元格值:"+value+",行的index:"+iRow+",列的index:"+iCol);		  	    
//              $("#list").jqGrid("restoreCell",rowid,iCol);
//		  		$("#list").jqGrid("saveCell",iRow,iCol);
//		  		$("#list").jqGrid('setCell', rowid, iCol/cellname, '', 'not-editable-cell');
                return false;
			},
			afterSaveCell : function(rowid,name,val,iRow,iCol){ //需要解决的问题，为什么触发不了
				alert("afterSaveCell");
			},
			gridComplete:function(){
				var lines= $("#list").jqGrid('getDataIDs');
				for(var j=0;j<lines.length;j++){
                	//  radiovalue[j]  = $("input:radio[name='radio"+j+"'][checked]").val();
        
				}
				$("#1_1").change(function (){ 
				    alert("dfsf"); 
			}); 
			},
	        colNames : [
	        	'操作','品牌', 'CTMS型号', 'SCM物料组描述','SCM物料组', '俗称','产品经理','价位段','采购低价','代理类型',' 合作模式',//10
	                     '品牌1', '型号1', '品牌2','型号2','品牌3','型号3','品牌1', '型号1', '品牌2','型号2','品牌3','型号3','总销量（台）', '总收入（元）','总毛利（元）','份额',
	                     '总覆盖客户','库存周转'//10   
	                      ],
	        colModel : [ {name : '23',index : '23',width:80,height:50,sorttype : "float",align:"center", fixed: true, sortable: false, resize: false,formatter: tiaohuan}, 
	        	         {name:'brandname', index:'brandname', width:80, height:50,editable: true,},	//
	        	         {name:'spec', index:'SPEC', width:80,height:50, editable: true},                   
	                     {name : 'meterdes',index : 'METERDES',width:80,height:50,sorttype : "int", editable: true}, 
	                     {name : 'meter',index : 'METER',width:80,height:50,sorttype : "date", editable: true}, 
	                     {name : 'sname',index : 'SNAME',width:80,height:50,sorttype : "date", editable: true}, 
	                     {name : 'pm',index : 'PM',width:80,height:50,sorttype : "float", editable: true},
	                     {name:'pricelevle', index:'PRICELEVLE',width:80,height:50,  editable: true},
	                     {name : 'purprice',index : 'PURPRICE',width:80,height:50,sorttype : "float", editable: true}, 
	                     {name:'proxytype', index:'PROXYTYPE', width:80,height:50, editable: true},  
	                     {name:'copermodel', index:'COPERMODEL',width:80,height:50,  editable: true},  
	                     
	                     {name:'competbrandname1', index:'competbrandname1', width:80,height:50, editable: true}, 
	                     {name:'competspec1', index:'COMPETSPEC1',width:80,height:50, editable: true},  
	                     {name : 'competbrandname2',index : 'COMPETBRANDNAME2',width:80,height:50,sorttype : "float",editable: true},  
	                     {name : 'competspec2',index : 'COMPETSPEC2',width:80,height:50,editable: true,sorttype : "float"}, 
	                     {name : 'competbrandname3',index : 'COMPETBRANDNAME3',height:50,editable: true,width:80,sorttype : "float"}, 
	                     {name : 'competspec3',index : 'COMPETSPEC3',width:80,height:50,editable: true,sorttype : "float"}, 
	                     
	                     {name:'bibrandname1', index:'bibrandname1', width:80,height:50, editable: true}, 
	                     {name:'bispec1', index:'bispec1',width:80,height:50, editable: true},  
	                     {name : 'bibrandname2',index : 'bibrandname2',width:80,height:50,sorttype : "float",editable: true},  
	                     {name : 'bispec2',index : 'bispec2',width:80,height:50,editable: true,sorttype : "float"}, 
	                     {name : 'bibrandname3',index : 'bibrandname3',editable: true,width:80,height:50,sorttype : "float"}, 
	                     {name : 'bispec3',index : 'bispec3',width:80,height:50,editable: true,sorttype : "float"},
	                     
	                     {name : 'totalsaleamount',index : 'TOTAL_SALEAMOUNT',width:80,height:50,sorttype : "float"}, 
	                     {name : 'totalincome',index : 'TOTAL_INCOME',width:80,height:50,sorttype : "float"}, 
	                     {name : 'totalmaori',index : 'TOTAL_MAORI',width:80,height:50,sorttype : "float"}, 
	                     {name : 'totalshare',index : 'TOTAL_SHARE',width:80,height:50,sorttype : "float"}, 
	                     
	                     {name : 'totaloveramount',index : 'TOTAL_OVERAMOUNT',width:80,height:50,sorttype : "float"}, 
	                     {name : 'totalturnovertime',index : 'TOTAL_TURNOVER_TIME',width:80,height:50,sorttype : "float"}, 
	                     
						 /*{name : '24',index : '24',width:80,sorttype : "float",align:"center", fixed: true, sortable: false, resize: false,formatter: tiaohuan},*/ 
	                  
	                 ],
	      });
	  //jQuery("#list").jqGrid('filterToolbar',{searchOperators : true});
/*	 var mydata = [ 
						{1 : "品牌",2 : "2007",3 : "123",4 : "note",5 : "1",6 : "2007",7 : "123",8 : "note",9:"总部代理",10:"常规代理",11:"yes",12:"yes",13:"yes",14:"yes",15:"yes",16:"yes",17:"yes",18:"yes",19:"19"},
						
					

	               ];
  for ( var i = 0; i <= mydata.length; i++){
    jQuery("#list").jqGrid('addRowData', i + 1, mydata[i]);
	  }*/
	  
	  //合并最顶表头
	  jQuery("#list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: false, 
		    groupHeaders:[
		    	{startColumnName: '23', numberOfColumns: 29, titleText: '产品信息及规划设置'},
		    	
		    	
		    ]  
	  });
	  //合并二级表格
	  jQuery("#list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    	{startColumnName: 'competbrandname1', numberOfColumns: 6, titleText: '竞品信息'},
		    	{startColumnName: 'bibrandname1', numberOfColumns: 6, titleText: '公开市场竞品信息'},
		    	
		    	{startColumnName: 'bispec3', numberOfColumns: 7, titleText: '全生命周期主要指标规划'},
		    	/*{startColumnName: '23', numberOfColumns: 1, titleText: ''}*/
		    	
		    ]  
	  });
	  

	  /*jQuery("#test").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    	{startColumnName: 'hezuo', numberOfColumns: 3, titleText: '竞品信息'},
		    	{startColumnName: 'hezuo', numberOfColumns: 3, titleText: '竞品信息'},	
		    	{startColumnName: '869', numberOfColumns: 7, titleText: '全生命周期主要指标规划'}
		    
		    	
		    	{name:'1', index:'1', width:60, editable: true, edittype:"select", editoptions:{value:{一:'一年级', 二:'二年级', 三:'三年级'}}},

		    	
		    	
		    ]  
	  });  */
	  
	  
	  
    }

/**
 * 设置下拉选择品牌和型号
 */
function getroleid(){

	var roleid = "请选择品牌:请选择品牌;";

	 	var i = 0;
	 	$.ajax({
	 		async: false,  //千万要记住加这个属性配置
	 		type: "post",
	 		datatype: 'json',
	 		url: "../brandEnty/brands.do",
	 		success: function(data) {
	 			for(i; i < data.length; i++) {
	 				if(i != data.length - 1) {
	 					roleid += data[i] + ":" + data[i] + ";";
	 				} else {
	 					roleid += data[i] + ":" + data[i];
	 				}
	 			}
	 		}
	 	});
	 	return roleid;

} 

/*****获取角色下对应的用户名列表 **************/

function getUsername(selectNum, roleid) {
    var str = ""; //用来存放option值  
    //将增加操作的弹出菜单中的roleid的下拉框内容清空（因为每次切换内容都需要变更）  
    $("select#term_brnd_nam").empty();  
    //将修改操作中的1_roleid（1是行号）的下拉框内容清空（因为每次切换内容都需要变更）  
    $("select#" + selectNum + "_term_brnd_nam").empty(); 
    if (roleid == '请选择品牌') {  
        str += "<option>" + "请选择机型" + "</option>";  
    }  
    else {  
 
            $.ajax({  
                url: "../brandEnty/doubles.do",  
                type: "post", 
                async: false,  
                cache: false,  
                dataType: "json",  
                data: {  
                    roleid: roleid  //传入角色id，到后台获取json  
                },  
                success: function (result) {
                 
                    if (result.length > 0) {  
                        for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象  
                            str += "<option value='" + result[i] + "'>" + result[i] + "</option>"; 
                        
                           
                        }  
                    }  
                    else {  
                        str += "<option>" + "该角色下暂无用户" + "</option>";  
                    }  
                }  
            });
            
         
    }  
    //获取下面下拉框username对象  
    var term_mdl_nam = $("select#term_mdl_nam");     
    term_mdl_nam.append(str);//渲染option  
    var term_mdl_nam2 = $("#1_term_mdl_nam");     
    term_mdl_nam2.append(str);//渲染option  

}
/*---------------------------竞品1-----------------------------------------*/

function getroleid1(){

	var roleid = "请选择品牌:请选择品牌;";

	 	var i = 0;
	 	$.ajax({
	 		async: false,  //千万要记住加这个属性配置
	 		type: "post",
	 		datatype: 'json',
	 		url: "../brandEnty/brands.do",
	 		success: function(data) {
	 			for(i; i < data.length; i++) {
	 				if(i != data.length - 1) {
	 					roleid += data[i] + ":" + data[i] + ";";
	 				} else {
	 					roleid += data[i] + ":" + data[i];
	 				}
	 			}
	 		}
	 	});
	 	return roleid;

} 

/*****获取角色下对应的用户名列表 **************/

function getUsername1(selectNum, roleid) {
    var str = ""; //用来存放option值  
    //将增加操作的弹出菜单中的roleid的下拉框内容清空（因为每次切换内容都需要变更）  
    $("select#COMPETBRANDNAME1").empty();  
    //将修改操作中的1_roleid（1是行号）的下拉框内容清空（因为每次切换内容都需要变更）  
    $("select#" + selectNum + "_COMPETBRANDNAME1").empty(); 
    if (roleid == '请选择品牌') {  
        str += "<option>" + "请选择机型" + "</option>";  
    }  
    else {  
 
            $.ajax({  
                url: "../brandEnty/doubles.do",  
                type: "post", 
                async: false,  
                cache: false,  
                dataType: "json",  
                data: {  
                    roleid: roleid  //传入角色id，到后台获取json  
                },  
                success: function (result) {
                 
                    if (result.length > 0) {  
                        for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象  
                            str += "<option value='" + result[i] + "'>" + result[i] + "</option>"; 
                        
                           
                        }  
                    }  
                    else {  
                        str += "<option>" + "该角色下暂无用户" + "</option>";  
                    }  
                }  
            });
            
         
    }  
    //获取下面下拉框username对象  
    var term_mdl_nam = $("select#COMPETSPEC1");     
    term_mdl_nam.append(str);//渲染option  
    var term_mdl_nam2 = $("#1_COMPETSPEC1");     
    term_mdl_nam2.append(str);//渲染option  

}

/*-----------------------------------竞品2------------------------------------------*/


function getroleid2(){

	var roleid = "请选择品牌:请选择品牌;";

	 	var i = 0;
	 	$.ajax({
	 		async: false,  //千万要记住加这个属性配置
	 		type: "post",
	 		datatype: 'json',
	 		url: "../brandEnty/brands.do",
	 		success: function(data) {
	 			for(i; i < data.length; i++) {
	 				if(i != data.length - 1) {
	 					roleid += data[i] + ":" + data[i] + ";";
	 				} else {
	 					roleid += data[i] + ":" + data[i];
	 				}
	 			}
	 		}
	 	});
	 	return roleid;

} 

/*****获取角色下对应的用户名列表 **************/

function getUsername2(selectNum, roleid) {
    var str = ""; //用来存放option值  
    //将增加操作的弹出菜单中的roleid的下拉框内容清空（因为每次切换内容都需要变更）  
    $("select#COMPETBRANDNAME2").empty();  
    //将修改操作中的1_roleid（1是行号）的下拉框内容清空（因为每次切换内容都需要变更）  
    $("select#" + selectNum + "_COMPETBRANDNAME2").empty(); 
    if (roleid == '请选择品牌') {  
        str += "<option>" + "请选择机型" + "</option>";  
    }  
    else {  
 
            $.ajax({  
                url: "../brandEnty/doubles.do",  
                type: "post", 
                async: false,  
                cache: false,  
                dataType: "json",  
                data: {  
                    roleid: roleid  //传入角色id，到后台获取json  
                },  
                success: function (result) {
                 
                    if (result.length > 0) {  
                        for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象  
                            str += "<option value='" + result[i] + "'>" + result[i] + "</option>"; 
                        
                           
                        }  
                    }  
                    else {  
                        str += "<option>" + "该角色下暂无用户" + "</option>";  
                    }  
                }  
            });
            
         
    }  
    //获取下面下拉框username对象  
    var term_mdl_nam = $("select#COMPETSPEC2");     
    term_mdl_nam.append(str);//渲染option  
    var term_mdl_nam2 = $("#1_COMPETSPEC2");     
    term_mdl_nam2.append(str);//渲染option  

}

/*-------------------------------竞品3----------------------------------------------*/

function getroleid3(){

	var roleid = "请选择品牌:请选择品牌;";

	 	var i = 0;
	 	$.ajax({
	 		async: false,  //千万要记住加这个属性配置
	 		type: "post",
	 		datatype: 'json',
	 		url: "../brandEnty/brands.do",
	 		success: function(data) {
	 			for(i; i < data.length; i++) {
	 				if(i != data.length - 1) {
	 					roleid += data[i] + ":" + data[i] + ";";
	 				} else {
	 					roleid += data[i] + ":" + data[i];
	 				}
	 			}
	 		}
	 	});
	 	return roleid;

} 



function tiaohuan(value, grid, rows, state) { 
var url="../parameterSet/setOne.do";
	

    return "<a href='#' style='color: #1addfa;' onclick=\"$.StandardPost('"+url+"',{'brand':'"+rows.brandname+"','sp':'"+rows.spec+"'})\">规划值设置</a>";
    /*return "<a href=../parameterSet/setOne.do?brand="+brand+"sp="+sp+" style=\"color:#1addfa; \" >规划值设置</a>" */
};
//post提交

$.extend({
    StandardPost:function(url,args){
        var form = $("<form method='post'></form>"),
            input;
        form.attr({"action":url});
        form.attr({"target":""});
        $.each(args,function(key,value){
            input = $("<input type='hidden'>");
            input.attr({"name":key});
            input.val(value);
            form.append(input);
        });
        form.prependTo(document.body);
        form.submit();
        document.body.removeChild(form[0]);
    }
});

/*****获取角色下对应的用户名列表 **************/

function getUsername3(selectNum, roleid) {
    var str = ""; //用来存放option值  
    //将增加操作的弹出菜单中的roleid的下拉框内容清空（因为每次切换内容都需要变更）  
    $("select#COMPETBRANDNAME3").empty();  
    //将修改操作中的1_roleid（1是行号）的下拉框内容清空（因为每次切换内容都需要变更）  
    $("select#" + selectNum + "_COMPETBRANDNAME3").empty(); 
    if (roleid == '请选择品牌') {  
        str += "<option>" + "请选择机型" + "</option>";  
    }  
    else {  
 
            $.ajax({  
                url: "../brandEnty/doubles.do",  
                type: "post", 
                async: false,  
                cache: false,  
                dataType: "json",  
                data: {  
                    roleid: roleid  //传入角色id，到后台获取json  
                },  
                success: function (result) {
                 
                    if (result.length > 0) {  
                        for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象  
                            str += "<option value='" + result[i] + "'>" + result[i] + "</option>"; 
                        
                           
                        }  
                    }  
                    else {  
                        str += "<option>" + "该角色下暂无用户" + "</option>";  
                    }  
                }  
            });
            
         
    }  
    //获取下面下拉框username对象  
    var term_mdl_nam = $("select#COMPETSPEC3");     
    term_mdl_nam.append(str);//渲染option  
    var term_mdl_nam2 = $("#1_COMPETSPEC3");     
    term_mdl_nam2.append(str);//渲染option  

}
/**********************************************搜索框设置**********************************************************/
$(function() {
	$("#local-dynamic-select").bind('input propertychange', function() {
		// alert($(this).val())
		var searchStr = $(this).val();
		var obj = $("#list").jqGrid("getRowData");
		for (i = 0; i < obj.length; i++) {
			if (obj[i]['brandname'].indexOf(searchStr) < 0) {
				$("#list").setRowData(i+1, null, {display : 'none'});
			} else {
				$("#list").setRowData(i+1, null, {display : ''});
			}
		}
	});
});









