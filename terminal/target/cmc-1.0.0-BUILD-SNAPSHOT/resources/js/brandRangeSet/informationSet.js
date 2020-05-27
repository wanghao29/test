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
	jqgridInit();
	jqgridInit1();
	
});

function pageInit(){

}

function jqgridInit(){
	  jQuery("#list").jqGrid(
	      {
	        datatype : "local",
/* 	        url:"${basePath}followCustomerSearch/query.do",
	        mtype:'post',
	        datatype: "json",
	        loadonce:true,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:$("form").serialize(), */
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
	        pager: '',     //指定分页组件所在div id
	        shrinkToFit:true,     //可伸缩, true时使列宽可调整   false时设置的水平滚动才有效/也可能留出空白右侧
	        forceFit:true,
	        autoScroll: false,
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
			
	        colNames : ['',
	                     '持续时长（周）', '销量（台）', '收入（元）','毛利（元）', '覆盖客户（个）','份额','库存周期（周）',//8
	                     
	                      ],
	        colModel : [ 
	        	{name:'', index:'1', width:60, sorttype:"int", editable: false,align:"center",},
	        	{name:'2', index:'2', width:60, sorttype:"int", editable: true,},                  
	        	{name:'3', index:'3', width:60, sorttype:"int", editable: true,},
	        	{name:'4', index:'4', width:60, sorttype:"int", editable: true,},
	        	{name:'5', index:'5', width:60, sorttype:"int", editable: true,},
	        	{name:'6', index:'6', width:60, sorttype:"int", editable: true,},
	        	{name:'7', index:'7', width:60, sorttype:"int", editable: true,},
	        	{name:'8', index:'8', width:60, sorttype:"int", editable: true,},
	                    

	                  
	                     ],
	      });
	 var mydata = [ 
						{1 : "导入期",2 : "",3 : "",4 : "",5 : "",6 : "",7 : "",8 : "",},
						{1 : "成长期",2 : "",3 : "",4 : "",5 : "",6 : "",7 : "",8 : "",},
						{1 : "成熟期",2 : "",3 : "",4 : "",5 : "",6 : "",7 : "",8 : "",},
						{1 : "退期",  2 : "",3 : "",4 : "",5 : "",6 : "",7 : "",8 : "",},
						
						/*{5 : "1",OPPO : "2007",VIVO : "123",apple : "note"},
						{6 : "1",OPPO : "2007",VIVO : "123",apple : "note"},
						{7 : "1",OPPO : "2007",VIVO : "123",apple : "note"},
						{8 : "1",OPPO : "2007",VIVO : "123",apple : "note"},*/
					

	               ];
	  for ( var i = 0; i <= mydata.length; i++){
	    jQuery("#list").jqGrid('addRowData', i + 1, mydata[i]);
	  }
	  
	  //合并最顶表头
	  jQuery("#list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    	{startColumnName: '1', numberOfColumns: 8, titleText: '生命周期维度规划'},
		    	
		    	
		    ]  
	  });
	  //合并二级表格
	  jQuery("#list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    	{startColumnName: '11', numberOfColumns: 3, titleText: '竞品信息'},
		    	/*{startColumnName: 'hezuo', numberOfColumns: 3, titleText: '竞品信息'},	*/
		    	{startColumnName: '13', numberOfColumns: 6, titleText: '全生命周期主要指标规划'},
		    	{startColumnName: '19', numberOfColumns: 1, titleText: '操作'}
		    	
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


function jqgridInit1(){
	  jQuery("#listed").jqGrid(
	      {
	        datatype : "local",
/* 	        url:"${basePath}followCustomerSearch/query.do",
	        mtype:'post',
	        datatype: "json",
	        loadonce:true,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:$("form").serialize(), */
	        rowNum:10,  
	        gridview: true,
	        rowList : [5,10], 
	       // rownumbers: true,    //行首添加顺序编码
	        rownumWidth: 60,     //行首添加顺序编码的列宽
	        autowidth: true,     //表格宽度 刚加载时自动适应父div   ,然后随列调整宽度
	        height : "50%",     //表格宽度自动适应行数
	        //sortorder: "asc",    //指定列排序的次序
	        viewrecords : true,  //显示当前记录，和总记录数 
	        //sortname: 'cityCd', //默认排序
	        repeatitems: true,   //是否可重复
	        shrinkToFit:true,     //可伸缩, true时使列宽可调整   false时设置的水平滚动才有效/也可能留出空白右侧
	        forceFit:true,
	        autoScroll: true,
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
			
	        colNames : ['',
	                     '销量（台）', '收入（台）', '覆盖客户','','','销量（台）','收入（台）','毛利',//4
	                     
	                      ],
	        colModel : [ 
	        	{name:'1', index:'1', width:180, sorttype:"int", editable: false,align:"center",},
	        	{name:'2', index:'2', width:180, sorttype:"int", editable: true,},                  
	        	{name:'3', index:'3', width:180, sorttype:"int", editable: true,},
	        	{name:'4', index:'4', width:180, sorttype:"int", editable: true,},
	        	{name:'5', index:'5', width:60, sorttype:"int", editable: true,
	        		 cellattr: function(rowId, tv, rawObject, cm, rdata) {
                         //合并单元格
                         return 'id=\'name' + rowId + "\'";
                         //if (Number(rowId) < 5) { return ' colspan=2' }
                     }

	                },
	        	
	        	
	        	{name:'6', index:'6', width:60, sorttype:"int", editable: true,},
	        	{name:'7', index:'7', width:60, sorttype:"int", editable: true,},
	        	{name:'8', index:'8', width:60, sorttype:"int", editable: true,},
	        	{name:'9', index:'9', width:60, sorttype:"int", editable: true,},      

	                  
	                     ],
	      });
	 var mydata = [ 
						{1 : "广州",2 : "",3 : "",4 : "",},
						{1 : "肇庆",2 : "",3 : "",4 : "",},
						{1 : "清远",2 : "",3 : "",4 : "",},
						{1 : "韶关",  2 : "",3 : "",4 : "",},
						{1 : "云浮",  2 : "",3 : "",4 : "",},
						{1 : "深圳",  2 : "",3 : "",4 : "",},
						{1 : "汕头",  2 : "",3 : "",4 : "",},
						{1 : "揭阳",  2 : "",3 : "",4 : "",},
						{1 : "梅州",  2 : "",3 : "",4 : "",},
						{1 : "潮州",  2 : "",3 : "",4 : "",},
						{1 : "汕尾",  2 : "",3 : "",4 : "",},
						{1 : "汕头",  2 : "",3 : "",4 : "",},
						{1 : "东莞",  2 : "",3 : "",4 : "",},
						{1 : "中山",  2 : "",3 : "",4 : "",},
						{1 : "惠州",  2 : "",3 : "",4 : "",},
						{1 : "珠海",  2 : "",3 : "",4 : "",},
						{1 : "河源",  2 : "",3 : "",4 : "",},
						{1 : "佛山",  2 : "",3 : "",4 : "",},
						{1 : "江门",  2 : "",3 : "",4 : "",},
						{1 : "湛江",  2 : "",3 : "",4 : "",},
						{1 : "茂名",  2 : "",3 : "",4 : "",},
						{1 : "阳江",  2 : "",3 : "",4 : "",},
						
						/*{5 : "1",OPPO : "2007",VIVO : "123",apple : "note"},
						{6 : "1",OPPO : "2007",VIVO : "123",apple : "note"},
						{7 : "1",OPPO : "2007",VIVO : "123",apple : "note"},
						{8 : "1",OPPO : "2007",VIVO : "123",apple : "note"},*/
					

	               ];
	  for ( var i = 0; i <= mydata.length; i++){
	    jQuery("#listed").jqGrid('addRowData', i + 1, mydata[i]);
	  }
	  
	  //合并最顶表头
	  jQuery("#listed").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    	{startColumnName: '1', numberOfColumns: 4, titleText: '地市维度规划'},
		    	{startColumnName: '5', numberOfColumns: 5, titleText: '五线七口规划'},
		    	
		    ]  
	  });
	  //合并二级表格
	  jQuery("#listed").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    	{startColumnName: '11', numberOfColumns: 3, titleText: '竞品信息'},
		    	/*{startColumnName: 'hezuo', numberOfColumns: 3, titleText: '竞品信息'},	*/
		    	{startColumnName: '13', numberOfColumns: 6, titleText: '全生命周期主要指标规划'},
		    	{startColumnName: '19', numberOfColumns: 1, titleText: '操作'}
		    	
		    ]  
	  });
	  

	  
	  /*设置按钮*/
		jQuery("#listed")   
		.navGrid('#pager',{edit:false,add:false,del:false,search:false})   
		.navButtonAdd('#pager',{   
		   caption:"保存",    
		   buttonicon:"ui-icon-add",    
		   onClickButton: function(){    
		     alert("Adding Row");   
		   },    
		   position:"last"  
		})
		
		
		
	}	  
	  
	  
	  
	  
	  
	  /*jQuery("#test").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    	{startColumnName: 'hezuo', numberOfColumns: 3, titleText: '竞品信息'},
		    	{startColumnName: 'hezuo', numberOfColumns: 3, titleText: '竞品信息'},	
		    	{startColumnName: '869', numberOfColumns: 7, titleText: '全生命周期主要指标规划'}
		    
		    	
		    	{name:'1', index:'1', width:60, editable: true, edittype:"select", editoptions:{value:{一:'一年级', 二:'二年级', 三:'三年级'}}},

		    	
		    	
		    ]  
	  });  */
	  
	  
	  
  






/*function jqgridInit2(){
	  jQuery("#lists").jqGrid(
	      {
	        datatype : "local",
 	        url:"${basePath}followCustomerSearch/query.do",
	        mtype:'post',
	        datatype: "json",
	        loadonce:true,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:$("form").serialize(), 
	        rowNum:10,  
	        gridview: true,
	        rowList : [5,10], 
	        //rownumbers: true,    //行首添加顺序编码
	        rownumWidth: 60,     //行首添加顺序编码的列宽
	        //autowidth: true,     //表格宽度自动适应父div
	        height : "50%",     //表格宽度自动适应行数
	        sortorder: "asc",    //指定列排序的次序
	        //viewrecords : true,  //显示当前记录，和总记录数 
	       // sortname: 'invdate', //默认排序
	        repeatitems: true,   //是否可重复
	       // pager: '',     //指定分页组件所在div id
	        shrinkToFit:true,     //可伸缩, true时使列宽可调整   false时设置的水平滚动才有效/也可能留出空白右侧
	        forceFit:true,
	        autoScroll: false,
	        jsonReader: {        //描述json 数据格式的数组,需修改
	        	root: 'list',
		    	page: "current",        // json中代表当前页码的数据
		    	//total: "pages",         // json中代表页码总数的数据
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
			
	        colNames : ['',
	                     '持续时长（周）', '销量（台）', '收入（元）','毛利（元）', '覆盖客户（个）','份额','库存周期（周）',//8
	                     
	                      ],
	        colModel : [ 
	        	{name:'1', index:'1', width:60, sorttype:"int", editable: false,align:"center",},
	        	{name:'2', index:'2', width:60, sorttype:"int", editable: true,},                  
	        	{name:'3', index:'3', width:60, sorttype:"int", editable: true,},
	        	{name:'4', index:'4', width:60, sorttype:"int", editable: true,},
	        	{name:'5', index:'5', width:60, sorttype:"int", editable: true,},
	        	{name:'6', index:'6', width:60, sorttype:"int", editable: true,},
	        	{name:'7', index:'7', width:60, sorttype:"int", editable: true,},
	        	{name:'8', index:'8', width:60, sorttype:"int", editable: true,},
	                    

	                  
	                     ],
	      });
	 var mydata = [ 
						{1 : "导入期",2 : "",3 : "",4 : "",5 : "",6 : "",7 : "",8 : "",},
						{1 : "成长期",2 : "",3 : "",4 : "",5 : "",6 : "",7 : "",8 : "",},
						{1 : "成熟期",2 : "",3 : "",4 : "",5 : "",6 : "",7 : "",8 : "",},
						{1 : "退期",  2 : "",3 : "",4 : "",5 : "",6 : "",7 : "",8 : "",},
						
						{5 : "1",OPPO : "2007",VIVO : "123",apple : "note"},
						{6 : "1",OPPO : "2007",VIVO : "123",apple : "note"},
						{7 : "1",OPPO : "2007",VIVO : "123",apple : "note"},
						{8 : "1",OPPO : "2007",VIVO : "123",apple : "note"},
					

	               ];
	  for ( var i = 0; i <= mydata.length; i++){
	    jQuery("#lists").jqGrid('addRowData', i + 1, mydata[i]);
	  }
	  
	  //合并最顶表头
	  jQuery("#lists").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    	{startColumnName: '1', numberOfColumns: 8, titleText: '生命周期维度规划'},
		    	
		    	
		    ]  
	  });
	  //合并二级表格
	  jQuery("#lists").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    	{startColumnName: '11', numberOfColumns: 3, titleText: '竞品信息'},
		    	{startColumnName: 'hezuo', numberOfColumns: 3, titleText: '竞品信息'},	
		    	{startColumnName: '13', numberOfColumns: 6, titleText: '全生命周期主要指标规划'},
		    	{startColumnName: '19', numberOfColumns: 1, titleText: '操作'}
		    	
		    ]  
	  });
	  

	  jQuery("#test").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    	{startColumnName: 'hezuo', numberOfColumns: 3, titleText: '竞品信息'},
		    	{startColumnName: 'hezuo', numberOfColumns: 3, titleText: '竞品信息'},	
		    	{startColumnName: '869', numberOfColumns: 7, titleText: '全生命周期主要指标规划'}
		    
		    	
		    	{name:'1', index:'1', width:60, editable: true, edittype:"select", editoptions:{value:{一:'一年级', 二:'二年级', 三:'三年级'}}},

		    	
		    	
		    ]  
	  });  
	  
	  
	  
  }
*/



