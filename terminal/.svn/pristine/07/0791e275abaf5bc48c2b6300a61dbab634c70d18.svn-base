$(document).ready(function() {
    $("#menu li").attr("class","drop");
    $("#crossAnalysis").attr("class","active"); 	
	//时间控件设置初始时间
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    var startDay = String(year)+month;
/*	var startDay = year  + month  ;*/
	$("#billcyc").val("201910");
		// 绑定按钮事件
	$("#searchBtn").click(function() {
	  
	   var queryParams  = getSelectVals();
	   queryParams["city"]=$("#citySelect").val();
	   queryParams["billcyc"]=$("#billcyc").val();
	   jqgridReload(queryParams)
	});
	jqgridInit();
});

function getSelectVals(){
    //var vals = [];
    var vals = {};
    $("input:hidden",$(".latitude-check-list-c")).each(function(){
       // vals.push(this.value);
    	vals[this.name.replace("wd","")] = this.value;
    	
    });
    return vals;
}
 
//根据电脑时间 获取上个月份
function getPrevMonthValue(){
	var myDate = new Date();	
	var year = myDate.getFullYear(); 
	var month = myDate.getMonth();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
	return year+""+month;
}


function jqgridInit(){
	  jQuery("#list").jqGrid(
	      {
	        url:basePath+"/consumerBigData/cross_analysis_list.do",
	        mtype:'post',
	        datatype: "json",
	        loadonce:false,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:{"billcyc":$("#billcyc").val(),"city":$("#citySelect").val()},
	        //scroll:1, 滚动加载
	        //datatype : "local",
	        colNames : [ '月份','地市','客户群','客户群数量','异网渗透用户数','移动副卡用户数','移动副卡高流量用户数（高于500M）','低流量（<500M）高WIFI流量（>1000M）用户数'],
	        colModel : [ 
	                     {name : 'statMo',index : 'list.statMo',sorttype : "string"}, 
	                     {name : 'cmccBranchCd',index : 'list.cmccBranchCd',sorttype : "string"}, 
	                     {name : 'custGpNam',index : 'list.custGpNam',sorttype : "string"}, 
	                     {name : 'custGpCnt',index : 'list.custGpCnt',sorttype : "string"}, 
	                     {name : 'ywstUsrCnt',index : 'list.ywstUsrCnt',sorttype : "string"}, 
	                     {name : 'ydfkUsrCnt',index : 'list.ydfkUsrCnt',sorttype : "string"}, 
	                     {name : 'ydfkHighFluxUsrCnt',index : 'list.ydfkHighFluxUsrCnt',sorttype : "string"}, 
	                     {name:'ydfkLowgprsHighwifiUsrCnt',index:'list.ydfkLowgprsHighwifiUsrCnt',sortable: false, search:false }
	                   ],
	                   
	                   gridComplete:function(){//表格加载执行 
	                	   $("#list").setGridWidth($(window).width()*0.965);
	                  	 
	                  	   $(window).resize(function(){  
	                  		 $("#list").setGridWidth($(window).width()*0.965);
	                       });
	                  
	                  	 
	                 	},             
	        rowNum:10,        
	        rowList : [10,20,50,100], 
	        rownumbers: true,    //行首添加顺序编码
//	        rownumWidth: 60,     //行首添加顺序编码的列宽
	        autowidth: true,     //表格宽度自动适应父div
	        height : "100%",     //表格宽度自动适应行数
	        sortorder: "asc",    //指定列排序的次序
	        viewrecords : true,  //显示当前记录，和总记录数 
	        sortname: 'invdate', //默认排序
	        repeatitems: true,   //是否可重复
	        forceFit: true,
	        shrinkToFit:true,
	        autoScroll: true,
	        pager: '#pager',     //指定分页组件所在div id
	        caption : "",
	      });
	//合并最顶表头
	  jQuery("#list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    	{startColumnName: 'statMo', numberOfColumns: 8, titleText: '消费者大数据分类'},
		    	
		    	
		    ]  
	  });
	  //合并二级表格
	  jQuery("#list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    	{startColumnName: 'ywstUsrCnt', numberOfColumns: 3, titleText: '用户回挖'},
		    	/*{startColumnName: 'hezuo', numberOfColumns: 3, titleText: '竞品信息'},	*/
		    	{startColumnName: 'ydfkLowgprsHighwifiUsrCnt', numberOfColumns: 1, titleText: '流量升级'}
		    	
		    ]  
	  });

};


function jqgridReload(postData){
	//$("#list").jqGrid('clearGridData'); 
	$("#list").jqGrid('setGridParam',{  
		  postData : postData,
		  datatype:'json',
	      page:1
	}).trigger("reloadGrid");
};
