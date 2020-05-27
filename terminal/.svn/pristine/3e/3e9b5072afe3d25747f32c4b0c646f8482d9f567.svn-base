$(document).ready(function() {
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
	
	getAllList();
	
	
	jqgridInit();
	
});


function getAllList(){
	
	$.ajax({
	      url:basePath+'/getInformation/majorList.do',
	      type: 'POST',
	      datatype: 'json',
	      data: {},
	      cache:false,
	      traditional: true,
	      contentType: false,
	      processData: false,
	      success: function (data) {
	    	
	    	  
	      },
	      
	      error: function () {
	    	  
	      }
	    });
	
	
	
}








function pageInit(){

}

function jqgridInit(){
	  jQuery("#list").jqGrid(
	      {
	        //datatype : "local",
 	        url:basePath+'/getInformation/selectProductList.do',
	        mtype:'post',
	        datatype: "json",
	        loadonce:true,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	       // postData:$("form").serialize(), 
 	        rowNum:10,  
 	        gridview: true,
	        rowList : [5,10], 
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
//              $("#list").jqGrid("restoreCell",rowid,iCol);
//		  		$("#list").jqGrid("saveCell",iRow,iCol);
//		  		$("#list").jqGrid('setCell', rowid, iCol/cellname, '', 'not-editable-cell');
                return false;
			},
			afterSaveCell : function(rowid,name,val,iRow,iCol){ //需要解决的问题，为什么触发不了
				alert("afterSaveCell");
			},
			
	        colNames : [
	                     '操盘产品', '所属生命周期', '产品经理','操作', 
	                   
	                      ],
	        colModel : [ 
                         /*{name : 'city',index : 'city',sorttype : "string"}, */
	                    
	                     {name : 'brandname',index : 'total',sorttype : "int",align:"center",}, 
	                     {name : 'ranger',index : 'OPPO',sorttype : "date",align:"center",}, 
	                     {name : 'pm',index : 'VIVO',align:"center",}, 
	                     {name : 'apple',index : 'apple',sorttype : "float",align:"center",fixed: true, sortable: false, resize: false,formatter: tiaohuan}, 
	                    
	                     
	               
	                   ],
	      });
	 /* var mydata = [ 
						{total : "1",OPPO : "2007",VIVO : "123",apple : "note"},
						{total : "1",OPPO : "2007",VIVO : "123",apple : "note"},
						{total : "1",OPPO : "2007",VIVO : "123",apple : "note"},
						{total : "1",OPPO : "2007",VIVO : "123",apple : "note"},
						{total : "1",OPPO : "2007",VIVO : "123",apple : "note"},
					

	               ];*/
	 /* for ( var i = 0; i <= mydata.length; i++){
	    jQuery("#list").jqGrid('addRowData', i + 1, mydata[i]);
	  }*/
	  
	  //合并最顶表头
	  jQuery("#list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    {startColumnName: 'total', numberOfColumns: 5, titleText: '产品经理操盘视图'},
		  
		    ]  
	  });
	  //合并二级表格
	  jQuery("#list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		  
		    ]  
	  });
	  

    }
