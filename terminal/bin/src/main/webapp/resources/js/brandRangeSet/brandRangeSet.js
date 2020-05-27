$(document).ready(function() {
	//顶部菜单切换
    $("#menu li").attr("class","drop");
    $("#brand_capacity_set").attr("class","active");
	
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


function pageInit(){

}

/*function jqgridInit_1(){
	  jQuery("#list").jqGrid(
	      {
	        sdatatype : "remote",
 	        url:"../uploadControl/selectList.do",
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
			
	        colNames : [ '',
	                     '整体容量', 'OPPO', 'VIVO','苹果', '华为', 
	                     '整体容量', 'OPPO', 'VIVO','苹果', '华为',
	                     '塞诺数据','广东移动换机预测数据',
	                     '整体容量', 'OPPO', 'VIVO','苹果', '华为' ],
	        colModel : [ 
                         {name : 'city',index : 'city',sorttype : "string"}, 
	                    
	                     {name : 'total',index : 'total',sorttype : "int",}, 
	                     {name : 'OPPO',index : 'OPPO',sorttype : "date",}, 
	                     {name : 'VIVO',index : 'VIVO'}, 
	                     {name : 'apple',index : 'apple',sorttype : "float"}, 
	                     {name : 'hawei',index : 'hawei',sorttype : "float"},
	                     
	                     {name : 'total2',index : 'total2',sorttype : "float"}, 
	                     {name : 'OPPO2',index : 'OPPO2',sorttype : "float"}, 
	                     {name : 'VIVO2',index : 'VIVO2',sortable : false} ,
	                     {name : 'apple2',index : 'apple2',sorttype : "int"}, 
	                     {name : 'hawei2',index : 'hawei2',sorttype : "float"},
	                     
	                     {name : 'invdate',index : 'invdate',sorttype : "date",editable : true,edittype :'selected'}, 
	                     {name : 'name',index : 'name',width : 100,editable : true,edittype :'select'}, 
	                     
	                     {name : 'total3',index : 'total3',sorttype : "float"},
	                     {name : 'OPPO3',index : 'OPPO3',sorttype : "int"}, 
	                     {name : 'VIVO3',index : 'VIVO3',sorttype : "date"}, 
	                     {name : 'apple3',index : 'apple3'},
	                     {name : 'hawei3',index : 'hawei3',sorttype : "float"},
	                   ],
	      });
	  var mydata = [ 
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2008",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2009",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},
						{city : '广州',total : "1",OPPO : "2007",VIVO : "123",apple : "note",hawei : "200",total2 : "1",OPPO2 : "2007",VIVO2 : "123",apple2 : "note",hawei2 : "200",invdate : "200",name : "1",total3 : "1",OPPO3 : "2007",VIVO3 : "123",apple3 : "note",hawei3 : "200"},

	               ];
	  for ( var i = 0; i <= mydata.length; i++){
	    jQuery("#list").jqGrid('addRowData', i + 1, mydata[i]);
	  }
	  
	  //合并最顶表头
	  jQuery("#list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    {startColumnName: 'total', numberOfColumns: 5, titleText: '基于塞诺数据'},
		    {startColumnName: 'total2', numberOfColumns: 5, titleText: '基于广东移动换机预测数据'},
		    {startColumnName: 'total3', numberOfColumns: 5, titleText: '加权参考值'}
		    ]  
	  });
	  //合并二级表格
	  jQuery("#list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    {startColumnName: 'OPPO', numberOfColumns: 4, titleText: '品牌容量'},
		    {startColumnName: 'OPPO2', numberOfColumns: 4, titleText: '品牌容量'},
		    {startColumnName: 'OPPO3', numberOfColumns: 4, titleText: '品牌容量'}
		    ]  
	  });
	  

    }
*/















