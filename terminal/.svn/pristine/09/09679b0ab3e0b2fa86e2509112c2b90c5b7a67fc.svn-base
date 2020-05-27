
//页面一加载就执行的js事件

window.onload = function() {

	jqgridInit();
	 
}











$.extend({
    StandardPost:function(url,args){
        var form = $("<form method='post'></form>"),
            input;
        form.attr({"action":url});
        form.attr({"target":"_self"});
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



// 查询功能的实现

function selelctAll(){
	
} 	 

//get提交的方式
$.extend({
    StandardGet:function(url,args){
        var form = $("<form method='get'></form>"),
            input;
        form.attr({"action":url});
        form.attr({"target":"_self"});
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

//-----------------------------------表格


function jqgridInit(){
	  jQuery("#list").jqGrid(
	      {
	        //datatype : "local",
	        url:basePath+'/modelInternet/selectProductList.do',
	        mtype:'post',
	        datatype: "json",
	        loadonce:true,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	       // postData:$("form").serialize(), 
	        rowNum:15,
	        regional : 'cn',
	        gridview: true,
	       
	        //rowList : [15,10], 
	        //rownumbers: true,    //行首添加顺序编码
	        rownumWidth: 60,     //行首添加顺序编码的列宽
	        autowidth: true,     //表格宽度自动适应父div
	        height : "100%",     //表格宽度自动适应行数
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
	        onCellSelect : function(rowid,iCol,cellcontent,e){ },
	        //点击可编辑的框时触发
	        afterEditCell : function(rowid, cellname, value, iRow, iCol){
	        	lastValue = value
	        },
	        //保存前触发
		  	beforeSaveCell : function(rowid, cellname, value, iRow, iCol){ //行id,单元格名称,单元格值 ,行的index,列的index 
//		  		alert('行id:'+rowid+",单元格名称:"+cellname+",单元格值:"+value+",行的index:"+iRow+",列的index:"+iCol);		  	    
//            $("#list").jqGrid("restoreCell",rowid,iCol);
//		  		$("#list").jqGrid("saveCell",iRow,iCol);
//		  		$("#list").jqGrid('setCell', rowid, iCol/cellname, '', 'not-editable-cell');
              return false;
			},
			afterSaveCell : function(rowid,name,val,iRow,iCol){ //需要解决的问题，为什么触发不了
				alert("afterSaveCell");
			},
          
			
	        colNames : [
	                     '类型', '品牌', '型号','周转','库存','销量','10086商城','京东商城','拼多多店铺','手机商城自营','天猫中国店','天猫中国移动手机官方旗舰店','中国移动平安银行手机官方旗舰店',
	                     '手机商城广东','中国移动拼多多手机官方旗舰店','浙江天猫店','工商银行','和助力','微信商城'
	                   
	                      ],
	        colModel : [ 
                     
	                     {name : 'type',index : 'type',sorttype : "string",align:"center", cellattr: function(rowId, tv, rawObject, cm, rdata) {

	                         //合并单元格
	                    	
	                           return 'id=\'type' + rowId + "\'";

	                     }}, 
	                     {name : 'brand',index : 'brand',sorttype : "string",align:"center",}, 
	                     {name : 'spec',index : 'spec',align:"center",sorttype : "string",},
	                     {name : 'kczz',index : 'kczz',align:"center",sorttype : "string",},
	                     {name : 'stock',index : 'stock',align:"center",sorttype : "string",},
	                     {name : 'saleamount',index : 'saleamount',align:"center",sorttype : "string",},
	                     {name : 'mall10086',index : 'mall10086',align:"center",sorttype : "string",},
	                     {name : 'jdmall',index : 'jdmall',align:"center",sorttype : "string",},
	                     {name : 'pddmall',index : 'pddmall',align:"center",sorttype : "string",},
	                     {name : 'phonemall',index : 'phonemall',align:"center",sorttype : "string",},
	                     {name : 'tmchinamall',index : 'tmchinamall',align:"center",sorttype : "string",},
	                     {name : 'tmphonemall',index : 'tmphonemall',align:"center",sorttype : "string",},
	                     {name : 'pabankmall',index : 'pabankmall',align:"center",sorttype : "string",},
	                     {name : 'gdphonemall',index : 'gdphonemall',align:"center",sorttype : "string",},
	                     {name : 'ydpddmall',index : 'ydpddmall',align:"center",sorttype : "string",},
	                     {name : 'zjtmmall',index : 'zjtmmall',align:"center",sorttype : "string",},
	                     {name : 'gsbankmall',index : 'gsbankmall',align:"center",sorttype : "string",},
	                     {name : 'hzlmall',index : 'hzlmall',align:"center",sorttype : "string",},
	                     {name : 'wecatmall',index : 'wecatmall',align:"center",sorttype : "string",},
	                     
	                    
	 	       				
	 	       				
	 	       				
	 	       			
	                     
	               
	                   ],
	                   gridComplete:function(){

	                       //在gridComplete调用合并方法

	                	  // MergeTableColumn('list', 'type', 2, 2)

	                      

	                       //隐藏grid底部滚动条

	                       $("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 

	                       }
	                   
	      });
	
	  //合并最顶表头
//	  jQuery("#list").jqGrid('setGroupHeaders', {
//		    useColSpanStyle: true, 
//		    groupHeaders:[
//		    {startColumnName: 'total', numberOfColumns: 5, titleText: '产品经理操盘视图'},
//		  
//		    ]  
//	  });
//	  //合并二级表格
//	  jQuery("#list").jqGrid('setGroupHeaders', {
//		    useColSpanStyle: true, 
//		    groupHeaders:[
//		  
//		    ]  
//	  });
	  

  }




//库存周转表的查询框绑定事件
function selelctPort(){
	//首先获取查询事件
	var time=$("#day_1").val();
	if(time=="null" || time==""){		
		alert("请选择时间。");
		return false;		
	} 
	 
	    $("#list").jqGrid('setGridParam',{  
	        datatype:'json',  
	        postData:{'time':time},
	        page:1  
	    }).trigger("reloadGrid");

	
}

function MergeTableColumn() {

    if(gridName==null || gridName==""){

    gridName="list";

    }

    var colIdx= $("#list").getCell(id,"type");
   
    var newColIdxes = colIdxes.concat();
    newColIdxes.splice(0,1);
    var delRows = new Array();
    //var rs = tbl.rows;
    var rs =  tbl.find("tbody tr");
    //endRow为0的时候合并到最后一行，小于0时表示最后有-endRow行不合并  
    if(endRow === 0){
        endRow = rs.length - 1;
    }else if(endRow < 0){
        endRow = rs.length - 1 + endRow;
    }
    var rowSpan = 1; //要设置的rowSpan的值  
    var rowIdx = beginRow; //要设置rowSpan的cell行下标  
    var cellValue; //存储单元格里面的内容  
    var cellValue2; //存储单元格里面的内容  
    for(var i=beginRow; i<= endRow + 1; i++){  
        if(i === endRow + 1){//过了最后一行的时候合并前面的单元格 
            if(newColIdxes.length > 0){  
                me.mergeSameCell(tbl,rowIdx,endRow,newColIdxes);  
            }  
            rs[rowIdx].cells[colIdx].rowSpan = rowSpan;  
        }else{  
            debugger;
            var cell = rs[i].cells[colIdx];  
 
            if(i == beginRow){//第一行的时候初始化各个参数  
                cellValue = cell.innerHTML;
                rowSpan = 1;
                rowIdx = i;
            }else if(cellValue != cell.innerHTML){//数据改变合并前面的单元格  
                cellValue = cell.innerHTML;
                //                 if(newColIdxes.length > 0){//每一列确定各自是否合并
                //                     me.mergeSameCell(tbl,rowIdx,i - 1,newColIdxes);
                //                 }
                rs[rowIdx].cells[colIdx].rowSpan = rowSpan;
                for(var k=1;k<colIdxes.length;k++){//仅用第一列确定其他列是否合并，第一列合并则其他列也合并。
                    rs[rowIdx].cells[colIdxes[k]].rowSpan = rowSpan;
                }
 
                rowSpan = 1;
                rowIdx = i;
            }else if(cellValue == cell.innerHTML){//数据和前面的数据重复的时候删除单元格
                rowSpan++;
                delRows.push(i);
            }
        }
    }
    for(var j=0;j<delRows.length; j++){
        //rs[delRows[j]].deleteCell(colIdx); //删除
        debugger;
        rs[delRows[j]].cells[colIdx].style.display = 'none';//隐藏字段,不删除
        for(var k=1;k<colIdxes.length;k++){
            rs[delRows[j]].cells[colIdxes[k]].style.display = 'none';//隐藏字段,不删除
        }
    }




    }






