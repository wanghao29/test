function title_tip(){
	var oldTitle = null;
	$('.title,.type').bind('mouseover mouseout mousemove',function(event){           
	    var left = event.pageX ;
	    var top = event.pageY +10;
	    var ele = event.target;
	    var title = ele.title1;	    
         var title1 = $(this).attr("title1");
	    var type = event.originalEvent.type;
	    if(type == 'mouseover'){
	        oldTitle = title1;
	       // ele.title = '';
	        //if(title && title.length > 0){                
	        if(title1 != null){             
	            var showEle = $('<div></div>',{text:title1,class:'showTitleBox'}).css({
	                position:'absolute',
	                top:top,
	                left:left,
	                border:'1px solid #CCC',
	                borderRadius:'5px',
	                fontSize:22,
	                color:'#fff',
	                //fontFamily:'SimHei',
		            background:'#00093f',
		            opacity:1, //0完全透明
	            })
	            showEle.appendTo('body');               
	        }
	    }else if(type == 'mouseout'){
	        //ele.title = oldTitle;
	        $('.showTitleBox').remove();
	    }else if(type == 'mousemove'){
	        $('.showTitleBox').css({
	            top:top+10,
	            left:left
	        })
	    }
	});	
};

(function($){
    $.fn.serializeObject = function(){  
        var serializeObj={};  
        var array=this.serializeArray();  
        var str=this.serialize();  
        $(array).each(function(){  
            if(serializeObj[this.name]){  
                if($.isArray(serializeObj[this.name])){  
                    serializeObj[this.name].push(this.value);  
                }else{  
                    serializeObj[this.name]=[serializeObj[this.name],this.value];  
                }  
            }else{  
                serializeObj[this.name]=this.value;   
            }  
        });  
        return serializeObj;  
    };
})(jQuery);
(function($){
	//contentType: 'application/json',json对象的字符串形式提交
	//@RequestBody接收
	//data: $("#memuForm").serializeObject(),
    $.fn.serializeObjectStr = function(){  
        var serializeObj={};  
        var array=this.serializeArray();  
        var str=this.serialize();  
        $(array).each(function(){  
            if(serializeObj[this.name]){  
                if($.isArray(serializeObj[this.name])){  
                    serializeObj[this.name].push(this.value);  
                }else{  
                    serializeObj[this.name]=[serializeObj[this.name],this.value];  
                }  
            }else{  
                serializeObj[this.name]=this.value;   
            }  
        });  
        return JSON.stringify(serializeObj);  
    };
//    get/post传参形式：key=fdsa&lang=zh，只能简单键值对
//    contentType: 'application/x-www-form-urlencoded',
//    data: $("#memuForm").serialize(),
})(jQuery);


/* 初始化表格 */ 
function jqgrid_init(tableId,pager,url,params,colNames,colModel,sortname){
	  jQuery("#"+tableId).jqGrid({
	        url:url,
	        mtype:'post',
	        datatype: "json",
	        loadonce:true,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:params,	        
	        colNames : colNames,	        
	        colModel : colModel,
            //sortable : 默认true
            //search   : 默认true
            //sorttype : "float"、"int"...
            //searchoptions:{sopt:['eq','bw']：op=、 eq=等于、ne=不等、lt=小于、le=小于等于、gt=大于、
            //ge=大于等于、bw=开始于、bn=不开始、in=在内、ni=不在内、ew=结束于、en=不结束于、cn=包含、nc=不包含
	        //formatter:number \integer \email \date \格式化函数名
	        
            gridComplete:function(){//表格加载执行 
                 try {
                	 eval(tableId+"_setGroupHeaders");
            		 var setGroupHeaders = eval(tableId+"_setGroupHeaders");
            		 setGroupHeaders();
                 }catch(err){
                	 
                 }
            	 
            	 jqgrid_setGridWidth(tableId);        	 
            	 
            	 
            	 $(window).resize(function(){  
            		 jqgrid_setGridWidth(tableId);
                 });
           	},  
           	
	        rowNum:5,        
	        rowList : [5,10,30,50], 
	        rownumbers: true,    //行首添加顺序编码
	        rownumWidth: 60,     //行首添加顺序编码的列宽
	        autowidth: false,     //表格宽度 刚加载时自动适应父div   ,然后随列调整宽度
	        height : "100%",     //表格宽度自动适应行数
	        sortorder: "asc",    //指定列排序的次序
	        viewrecords : true,  //显示当前记录，和总记录数 
	        sortname: sortname,  //默认排序
	        repeatitems: true,   //是否可重复
	        forceFit:false,      //当为ture时，调整列宽度不会改变表格的宽度。当shrinkToFit 为false时，此属性会被忽略
	        shrinkToFit:true,    //可伸缩, true时使列宽可调整   false时设置的水平滚动才有效/也可能留出空白右侧	        
	        autoScroll:false,    //false,宽度超出才展示滚动条
	        jsonReader: {        //描述json 数据格式的数组,需修改
	        	root: 'list',
 		    	page: 'current',        // json中代表当前页码的数据
		    	total: "pages",         // json中代表页码总数的数据
		    	records: "total",       // json中代表数据行总数的数据
		    	repeatitems: false,     // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
		    	cell: "cell",
		    	id: "fRoleId",
		    	userdata: "userdata", 
		    }, 
	        pager: '#'+pager,     //指定分页组件所在div id 
	        pagination: true,
	        caption : "",
	      });

};

//再次加载表格
function jqgrid_reload(tableId,params){
	$("#"+tableId).jqGrid('clearGridData'); 
	$("#"+tableId).jqGrid('setGridParam',{  
		  postData :params,
		  datatype:'json',
	      page:1
	}).trigger("reloadGrid");
};

//自适应或者滚动
function jqgrid_setGridWidth(tableId){
	 //jqgrid的宽度
	 var jqgrid_width;
	 if($(".jqgrid_width").length>0){
		 for(var n=0;n<$(".jqgrid_width").length;n++){
			 if($(".jqgrid_width").eq(n).width()>0){
				 jqgrid_width = $(".jqgrid_width").eq(n).width();
			 }
		 }		 
	 }else{
		 jqgrid_width = $(window).width()*0.975;
	 }	
	 
	 console.log(jqgrid_width);
	
	 var colModel = $("#"+tableId).jqGrid('getGridParam','colModel');
	 var colNum = 0;
     for (var i=0; i<colModel.length; i++) {    	   	 
    	 if (colModel[i].hidden == false){
    		 colNum = colNum+1;
     	 }
     }    
     if(colNum>14){
    	 $("#"+tableId).setGridWidth(jqgrid_width,false);
     }else{
    	 $("#"+tableId).setGridWidth(jqgrid_width,true);
     }	 
}

//列动态隐藏或者显示
function jqgrid_colChange(tableId){
	 jqgrid_setGridWidth(tableId);
     try {
    	 //colModel[] 中指定了宽度，可能使自适应失效，从而表头与列无法对齐
    	 eval(tableId+"_setGroupHeaders");
		 var setGroupHeaders = eval(tableId+"_setGroupHeaders");
		 setGroupHeaders();
     }catch(err){
    	 console.log(err);
     };
}




//jqgrid导出
function exportExcel(tableid,name) { 
	
	if ( name.indexOf(".xls") < 0 ) {
		name += ".xls";	 // 如果没有带xls后缀名称，则加上
	}
	
    if ( getExplorer()=='ie' ){  
    	var outstr = getExcelContextForIECvs(tableid);
    	doFileExportIE(name,outstr);
    }else{  
    	var outstr = getExcelContextCvs(tableid);
    	doFileExport(name,outstr);  
    }  
} 

function  getExplorer() {  
    var explorer = window.navigator.userAgent ;  
    //ie  
    if (explorer.indexOf("MSIE") >= 0 || (explorer.indexOf("Windows NT 6.1;") >= 0 && explorer.indexOf("Trident/7.0;") >= 0) ) {  
        return 'ie';  
    }  
    //firefox  
    else if (explorer.indexOf("Firefox") >= 0) {  
        return 'Firefox';  
    }  
    //Chrome  
    else if(explorer.indexOf("Chrome") >= 0){  
        return 'Chrome';  
    }  
    //Opera  
    else if(explorer.indexOf("Opera") >= 0){  
        return 'Opera';  
    }  
    //Safari  
    else if(explorer.indexOf("Safari") >= 0){  
        return 'Safari';  
    }  
}  

/*输出的是伪excel，虽说生成xls为后缀的文件，但文件形式上还是html*/
function exportExcel2(tableid,name) { 
	
	if ( name.indexOf(".xls") < 0 ) {
		name += ".xls";	 // 如果没有带xls后缀名称，则加上
	}
	
    if ( getExplorer()=='ie' ){  //慢得怀疑人生
    	var outstr = getExcelContextIE2(tableid);
    	doFileExportIE2(name,outstr);
    }else{  
    	var outstr = getExcelContext2(tableid);
    	doFileExport2(name,outstr);  
    }  
} 

function getExcelContext2(table) {	
	if (!table.nodeType) {
		 table = document.getElementById(table);
	}

	var space = "    ";// 4个空格，
	var outqueue = []; // 经过调整后输出的队列(也即数组结构)， IE先将分组字段输出在最前列， 隐藏字段（分组字段除外）和actions字段不输出
	var outmap = {};   // 这里使用对象的属性（key:value结构）来存放输出字段，方便存取属性
	var colnamemap = {}; // 存储英文列对应中文名称的对应关系， 因为导出时，列可能会被重新调整顺序输出

	// 这里针对jqgrid专门处理, 生成对应的excel 列头
	var colModel = $(table).jqGrid('getGridParam','colModel'); // 英文字段
	var colNames = $(table).jqGrid('getGridParam','colNames'); // 中文列头    

	for (var i=1; i<colModel.length; i++) {    	 //i=0 第一列不要
		 colnamemap[colModel[i].name] =  colNames[i];  // 存储英、中文的对应关系
		 
		 //if ((colModel[i].hidden == true && colModel[i].name.substring(0,4) != "bbjr") || colModel[i].name == "actions" || colModel[i].name == "cb"){
			 // 隐藏 、 操作（actions）、复选框的列跳过，不输出到excel, 分组的列在前面已经加入到输出队列了
		 if (colModel[i].name == "actions" || colModel[i].name == "cb"){
			 continue;
		 }
		
	 	 if ( outmap.hasOwnProperty(colModel[i].name) ) {
	    	 // 当前属性已经存在输出列表中,直接跳过
	    	 continue;
		 }
	 	 
		 outqueue.push(colModel[i].name);
		 outmap[colModel[i].name] = ""; 
	}

	var outcol = ""; // 规整后，结构化输出对应的列头和行记录数据,\t作为列分隔 \r\n作为行分隔
	for (var i=0; i<outqueue.length; i++) {	 
		outcol +=  "<td>" + colnamemap[outqueue[i]] + "</td>";
	}
	outcol = "<thead><tr>" + outcol + "</tr></thead>"; // 输出的列头已经准备完成  

	var rowdata = $(table).jqGrid('getGridParam', 'data'); // 获得jqgrid的所有行数据
	outcol =  outcol + "<tbody>";
	for (var rowid = 0; rowid < rowdata.length; rowid++) { 
	   var row = eval(rowdata[rowid]);
       outcol += "<tr>" 
       for (var i=0; i<outqueue.length; i++) {  
      	 outcol +=  "<td>" + row[outqueue[i]] +"</td>" ;
       }       
       outcol += "</tr>";	   
	}   
	outcol =  outcol + "</tbody>";
	return outcol;
}
var doFileExport2 = function(name,outstr) {
    var uri = 'data:application/vnd.ms-excel;base64,'
        , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
        , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
        , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
   
    var ctx = {worksheet: name || 'Worksheet', table: outstr};      
    var out =uri + base64(format(template, ctx));
    
    if (!document.all("hrefid")) { 
        var hideFrmDiv = $('"<a id="hrefid"  style="display: none"></a>"');
        hideFrmDiv.prependTo(document.body);
    }
    document.getElementById("hrefid").href = out;
    document.getElementById("hrefid").download = name;
    document.getElementById("hrefid").click();
}

function getExcelContextIE2(table) {	
	if (!table.nodeType) {
		 table = document.getElementById(table);
	}

	var space = "    ";// 4个空格，
	var outqueue = []; // 经过调整后输出的队列(也即数组结构)， IE先将分组字段输出在最前列， 隐藏字段（分组字段除外）和actions字段不输出
	var outmap = {};   // 这里使用对象的属性（key:value结构）来存放输出字段，方便存取属性
	var colnamemap = {}; // 存储英文列对应中文名称的对应关系， 因为导出时，列可能会被重新调整顺序输出

	// 这里针对jqgrid专门处理, 生成对应的excel 列头
	var colModel = $(table).jqGrid('getGridParam','colModel'); // 英文字段
	var colNames = $(table).jqGrid('getGridParam','colNames'); // 中文列头    

	for (var i=1; i<colModel.length; i++) {    	 //i=0 第一列不要
		 colnamemap[colModel[i].name] =  colNames[i];  // 存储英、中文的对应关系
		 
		 //if ((colModel[i].hidden == true && colModel[i].name.substring(0,4) != "bbjr") || colModel[i].name == "actions" || colModel[i].name == "cb"){
			 // 隐藏 、 操作（actions）、复选框的列跳过，不输出到excel, 分组的列在前面已经加入到输出队列了
		 if (colModel[i].name == "actions" || colModel[i].name == "cb"){
			 continue;
		 }
		
	 	 if ( outmap.hasOwnProperty(colModel[i].name) ) {
	    	 // 当前属性已经存在输出列表中,直接跳过
	    	 continue;
		 }
	 	 
		 outqueue.push(colModel[i].name);
		 outmap[colModel[i].name] = ""; 
	}

	var outcol = []; // 规整后，结构化输出对应的列头和行记录数据,\t作为列分隔 \r\n作为行分隔
	var thead = []; 
	for (var i=0; i<outqueue.length; i++) {	 
		thead.push(colnamemap[outqueue[i]]);
	}
	outcol.push(thead); // 输出的列头已经准备完成  

	var rowdata = $(table).jqGrid('getGridParam', 'data'); // 获得jqgrid的所有行数据	
	for (var rowid = 0; rowid < rowdata.length; rowid++) { 
	   var row = eval(rowdata[rowid]);
	   var tbody = []; 
       for (var i=0; i<outqueue.length; i++) {  
    	   tbody.push(row[outqueue[i]]);
       } 
       outcol.push(tbody);
   
	}   	
	return outcol;
}

var doFileExportIE2 = function(name,datas) {	
    var oXL = new ActiveXObject("Excel.Application");
    var oWB = oXL.Workbooks.Add();
    var oSheet = oWB.ActiveSheet;

   if(typeof datas === 'string'){	   
       var elem = document.getElementById(datas); 
       var sel = document.body.createTextRange(); 
       sel.moveToElementText(elem); 
       try{
            sel.select(); 
            //there ie10、11 will be error, i don't know why, but also can export
       } catch(e){}
       sel.execCommand("Copy"); 
       oSheet.Paste();
   } else {
	    console.log(datas);
        for(var i=0; i < datas.length; i++){  
             var row = datas[i]; 
             for (var j = 0; j < row.length; j++) { 
                  oSheet.Cells(i + 1, j + 1).value = row[j]; 

             }   
        }                
   }  
	oXL.Visible = true;  
	
	try {
	    var fname = oXL.Application.GetSaveAsFilename(name, "Excel Spreadsheets (*.xls), *.xls");
	} catch (e) {
	    print("Nested catch caught " + e);
	} finally {
	    oWB.SaveAs(fname);	    
	    oWB.Close(savechanges = false);
	    //xls.visible = false;
	    oXL.Quit();
	    oXL = null;
	    //结束excel进程，退出完成
	    //window.setInterval("Cleanup();",1);
	    //idTmr = window.setInterval("Cleanup();", 1);	
	}
}
/*输出的是伪excel，虽说生成xls为后缀的文件，但文件形式上还是html*/

function getExcelContextForIECvs(table) {	
	if (!table.nodeType) {
		 table = document.getElementById(table);
	}
	
	var space = "    ";// 4个空格，
	var outqueue = []; // 经过调整后输出的队列(也即数组结构)， IE先将分组字段输出在最前列， 隐藏字段（分组字段除外）和actions字段不输出
	var outmap = {};   // 这里使用对象的属性（key:value结构）来存放输出字段，方便存取属性
	var colnamemap = {}; // 存储英文列对应中文名称的对应关系， 因为导出时，列可能会被重新调整顺序输出
	
	// 这里针对jqgrid专门处理, 生成对应的excel 列头
	var colModel = $(table).jqGrid('getGridParam','colModel'); // 英文字段
	var colNames = $(table).jqGrid('getGridParam','colNames'); // 中文列头    
	
	for (var i=1; i<colModel.length; i++) {    //i=0 第一列不要
		 colnamemap[colModel[i].name] =  colNames[i];  // 存储英、中文的对应关系
		 
		 //if ((colModel[i].hidden == true && colModel[i].name.substring(0,4) != "bbjr") || colModel[i].name == "actions" || colModel[i].name == "cb"){
			 // 隐藏 、 操作（actions）、复选框的列跳过，不输出到excel, 分组的列在前面已经加入到输出队列了
		 if (colModel[i].name == "actions" || colModel[i].name == "cb"){
			 continue;
		 }
		
	 	 if ( outmap.hasOwnProperty(colModel[i].name) ) {
	    	 // 当前属性已经存在输出列表中,直接跳过
	    	 continue;
		 }
	 	 
		 outqueue.push(colModel[i].name);
		 outmap[colModel[i].name] = ""; 
	}
	
	var outcol = ""; // 规整后，结构化输出对应的列头和行记录数据,\t作为列分隔 \r\n作为行分隔
	for (var i=0; i<outqueue.length; i++) {	 
		 outcol += colnamemap[outqueue[i]] + "\t";
	}
	outcol += "\r\n"; // 输出的列头已经准备完成  
	
	var rowdata = $(table).jqGrid('getGridParam', 'data'); // 获得jqgrid的所有行数据
	for (var rowid = 0; rowid < rowdata.length; rowid++) { 
	   var row = eval(rowdata[rowid]);  
	   for (var i=0; i<outqueue.length; i++) { 
		   var value = row[outqueue[i]]==null?'':(row[outqueue[i]]+'').replace(/[\t\r\n]/g, ''); // 去掉转义字符 ,主要是去掉内容中的 \t \r\n 以免影响excel的分列
		   value = outqueue[i]!='type'?value:value==0?'存量':'新增';  //贪懒，只用来处理覆盖情况的格式化
		   outcol += value + "\t";
	   }   
	   outcol += "\r\n"; // 一条行记录输出完成
	}   
    return outcol;
}

function doFileExportIE(inName, inStr) {  
    var csvContent = "data:text/csv;charset=utf-8,\ufeff";//\ufeff去除中文数据乱码
    if (window.navigator.msSaveOrOpenBlob) {
        csvContent = "\ufeff";
    }
    csvContent += inStr;
	
    var xlsWin = null;  
    if (!document.all("HideFrm")) { 
        var hideFrmDiv = $('"<iframe id="HideFrm" style="display: none"></iframe>"');
        hideFrmDiv.prependTo(document.body);
    }
    if (!!document.all("HideFrm")) {  
        xlsWin = HideFrm;  
    }  
    else {  
        var width = 6;  
        var height = 4;  
        var openPara = "left=" + (window.screen.width / 2 - width / 2)  
                + ",top=" + (window.screen.height / 2 - height / 2)  
                + ",scrollbars=no,width=" + width + ",height=" + height;  
        xlsWin = window.open("", "_blank", openPara);  
    }  
    xlsWin.document.write(csvContent);  
    xlsWin.document.close();  
    xlsWin.document.execCommand('Saveas', true, inName);  
    xlsWin.close();  
} 

function getExcelContextCvs(table) {	
	if (!table.nodeType) {
		 table = document.getElementById(table);
	}
	
	var space = "    ";// 4个空格，
	var outqueue = []; // 经过调整后输出的队列(也即数组结构)， IE先将分组字段输出在最前列， 隐藏字段（分组字段除外）和actions字段不输出
	var outmap = {};   // 这里使用对象的属性（key:value结构）来存放输出字段，方便存取属性
	var colnamemap = {}; // 存储英文列对应中文名称的对应关系， 因为导出时，列可能会被重新调整顺序输出
	
	// 这里针对jqgrid专门处理, 生成对应的excel 列头
	var colModel = $(table).jqGrid('getGridParam','colModel'); // 英文字段
	var colNames = $(table).jqGrid('getGridParam','colNames'); // 中文列头    
	
	for (var i=1; i<colModel.length; i++) {    //i=0 第一列不要
		 colnamemap[colModel[i].name] =  colNames[i];  // 存储英、中文的对应关系
		 
		 //if ((colModel[i].hidden == true && colModel[i].name.substring(0,4) != "bbjr") || colModel[i].name == "actions" || colModel[i].name == "cb"){
			 // 隐藏 、 操作（actions）、复选框的列跳过，不输出到excel, 分组的列在前面已经加入到输出队列了
		 if (colModel[i].name == "actions" || colModel[i].name == "cb"){
			 continue;
		 }
		
	 	 if ( outmap.hasOwnProperty(colModel[i].name) ) {
	    	 // 当前属性已经存在输出列表中,直接跳过
	    	 continue;
		 }
	 	 
		 outqueue.push(colModel[i].name);
		 outmap[colModel[i].name] = ""; 
	}
	
	var outcol = ""; // 规整后，结构化输出对应的列头和行记录数据,\t作为列分隔 \r\n作为行分隔
	for (var i=0; i<outqueue.length; i++) {	 
		 outcol += colnamemap[outqueue[i]] + ",";
	}
	outcol += "\n"; // 输出的列头已经准备完成  
	
	var rowdata = $(table).jqGrid('getGridParam', 'data'); // 获得jqgrid的所有行数据
	for (var rowid = 0; rowid < rowdata.length; rowid++) { 
	   var row = eval(rowdata[rowid]);  
	   for (var i=0; i<outqueue.length; i++) {  
		   var value = row[outqueue[i]]==null?'':(row[outqueue[i]]+'').replace(/[\n,]/g, ''); // 去掉转义字符 ,主要是去掉内容中的 \t \r\n 以免影响excel的分列
		   value = outqueue[i]!='type'?value:value==0?'存量':'新增';  //贪懒，只用来处理覆盖情况的格式化
	  	   outcol += value + ",";
	   }   
	   outcol += "\n"; // 一条行记录输出完成
	}   
    return outcol;
}
var doFileExport = function(filename,inStr) {
    var csvContent = "data:text/csv;charset=utf-8,\ufeff";//\ufeff去除中文数据乱码
    if (window.navigator.msSaveOrOpenBlob) {
        csvContent = "\ufeff";
    }
    csvContent += inStr;
    
    if (window.navigator.msSaveOrOpenBlob) {
        var blob = new Blob([decodeURIComponent(encodeURI(csvContent))], {
            type: "text/csv;charset=utf-8;"
        });
        navigator.msSaveBlob(blob, filename);//filename文件名包括扩展名，下载路径为浏览器默认路径
    } else {
    	
    	var blob = new Blob([csvContent], {type: "text/plain;charset=utf-8"});  	
    	//解决中文乱码问题
    	blob =  new Blob([String.fromCharCode(0xFEFF), blob], {type: blob.type});  
    	object_url = window.URL.createObjectURL(blob); 
    	var link = document.createElement("a");
    	link.href = object_url;
    	link.download =  filename+".csv";
    	document.body.appendChild(link);
    	link.click();
    	document.body.removeChild(link);	
    	
    	
      /*  var encodedUri = encodeURI(csvContent);//encodeURI识别转义符
        var link = document.createElement("a");
        link.setAttribute("href", encodedUri);
        link.setAttribute("download", filename);

        document.body.appendChild(link);
        link.click();*/
    }
}

//function getExcelContextForIE(table) {	
//	 if (!table.nodeType) {
//		 table = document.getElementById(table);
//	 }
//	 
//	 var space = "    ";// 4个空格，
//	 var outqueue = []; // 经过调整后输出的队列(也即数组结构)， IE先将分组字段输出在最前列， 隐藏字段（分组字段除外）和actions字段不输出
//	 var outmap = {};   // 这里使用对象的属性（key:value结构）来存放输出字段，方便存取属性
//	 var keycol = {};   // 存储上一行分组字段的值，作为是否产生新组的判断依据
//	 var keycount = 0;  // 存储分组字段个数
//	 var colnamemap = {}; // 存储英文列对应中文名称的对应关系， 因为导出时，列可能会被重新调整顺序输出
//	 
//    // 这里针对jqgrid专门处理, 生成对应的excel 列头
//    var colModel = $(table).jqGrid('getGridParam','colModel'); // 英文字段
//    var colNames = $(table).jqGrid('getGridParam','colNames'); // 中文列头    
//    
//    // 经过调试，字段的hidden属性就可以决定字段是否显示， 分组的字段的groupColumnShow属性设置最终也是体现在hidden上
//    var groupview = $(table).jqGrid('getGridParam','groupingView'); // 获得分组对象 
//    if (groupview != null && groupview != undefined) {
//   	 keycount = groupview.groupField.length;
//        for (var i=0; i<keycount; i++) {
//       	 outqueue.push(groupview.groupField[i]);
//       	 outmap[groupview.groupField[i]] = "";
//       	 keycol[groupview.groupField[i]] = "";
//        }
//    }
//    
//    for (var i=0; i<colModel.length; i++) {    	 
//   	 colnamemap[colModel[i].name] =  colNames[i];  // 存储英、中文的对应关系
//   	 
//   	 //if ((colModel[i].hidden == true && colModel[i].name.substring(0,4) != "bbjr") || colModel[i].name == "actions" || colModel[i].name == "cb"){
//   		 // 隐藏 、 操作（actions）、复选框的列跳过，不输出到excel, 分组的列在前面已经加入到输出队列了
//   	 if (colModel[i].name == "actions" || colModel[i].name == "cb"){
//   		 continue;
//    	 }
//    	
//      	 if ( outmap.hasOwnProperty(colModel[i].name) ) {
//	     	 // 当前属性已经存在输出列表中,直接跳过
//	     	 continue;
//	 	 }
//      	 
//    	 outqueue.push(colModel[i].name);
//    	 outmap[colModel[i].name] = ""; 
//    }
//    
//    var outcol = ""; // 规整后，结构化输出对应的列头和行记录数据,\t作为列分隔 \r\n作为行分隔
//    for (var i=0; i<outqueue.length; i++) {
//   	 if (i>0 && i<keycount) {
//   		 // 分组字段除第一个字段显示外，其它都不显示（以树形结构显示了）
//   		 continue;
//   	 }
//   	 
//   	 outcol += colnamemap[outqueue[i]] + "\t";
//    }
//    
//    outcol += "\r\n"; // 输出的列头已经准备完成  
//    
//    var rowNum =  $(table).jqGrid('getGridParam', 'rowNum');   //获取当前页条数
//    var total   = $(table).jqGrid('getGridParam', 'records');  //获取总数 （包含未显示的数据）
//    $(table).jqGrid('setGridParam', {'rowNum':total}).trigger('reloadGrid'); 
//    var rowdata = $(table).jqGrid("getRowData"); // 获得jqgrid的所有行数据
//    $(table).jqGrid('setGridParam', {'rowNum':rowNum}).trigger('reloadGrid');
//    //alert(rowdata.length);
//    for (var rowid = 0; rowid < rowdata.length; rowid++) { 
//        var row = eval(rowdata[rowid]);
//        //alert(row.length);
//        for (each in row) { 
//            if ( !outmap.hasOwnProperty(each) ) {
//           	 // 当前属性不在输出列表中,直接跳过
//           	 continue;
//       	 } 
//            
//            var value = row[each];
//            outmap[each] = value.replace(/[\b\f\n\r\t]/g, ''); // 去掉转义字符 ,主要是去掉内容中的 \t \r\n 以免影响excel的分列
//        }
//        
//        var bnewRecord = false;
//        var treespace = "";
//        for (var i=0; i<keycount; i++) {
//       	// 检查是否产生新的分组
//       	 if ( (keycol[outqueue[i]] != outmap[outqueue[i]]) || (bnewRecord == true) ) {
//       		 outcol += treespace + outmap[outqueue[i]] + "\t\t\t\t\r\n"; // 输出一个分组子目录,多加几个\t是为了使输出的头不要占据过长
//       		 bnewRecord = true;
//       	 }
//       	 
//       	 treespace += space; // 分组头的每一级子目录实现缩进效果
//        }
//        
//        for (var i=0; i<outqueue.length; i++) {
//       	 
//            if ( keycol.hasOwnProperty(outqueue[i]) ) {
//           	 // 如果是分组属性,属性keycol值
//           	 keycol[outqueue[i]] = outmap[outqueue[i]];
//       	 } 
//       	 
//       	 if (i==0 && keycount>0) {
//       		 outcol += "\t"; //第一列分组列全部不输出内容
//       		 continue;
//       	 }
//       	 
//       	 // 进行行记录体输出
//       	 if ( i>0 && i<keycount ) {
//       		 // 不是新的分组，且输出的列范围在分组内的，不输出内容， 这样达到在excel中显示出树形结构的效果
//        		 continue;
//       	 }
//       	 
//       	 outcol += outmap[outqueue[i]] + "\t";
//        }
//        
//        outcol += "\r\n"; // 一条行记录输出完成
//    }   
//    
//    return outcol;
//}
//jqgrid导出end