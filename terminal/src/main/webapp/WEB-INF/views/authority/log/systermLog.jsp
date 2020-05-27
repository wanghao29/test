<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro"  uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="sharainy" tagdir="/WEB-INF/tags" %>
 
<html>
    <head>
        <title>登录日志</title>
      
    </head>
    <body>
      <style type="text/css">
        .info th{
           background-color: #00194e;
        }

        </style>
<script type="text/javascript">
$(document).ready(function() {
	setdate();
	jqgridInit();
	$("#searchBtn").click(function() {
		   var queryParams  ={};
		   queryParams["startTime"]=$("#startTime").val();
		   queryParams["endTime"]=$("#endTime").val();
		 $("#grid").setGridParam({postData :queryParams,datatype:'json', page:1}).trigger('reloadGrid');
	});
	
	

	$("#exportBtn").on("click",function(){
		var exportUrl=basePath+'/systemLog/exportExcel.do?startTime='+$("#startTime").val()+'&endTime='+$("#endTime").val();
		location.href=exportUrl;
	});
});

//日期框添加默认值
function  setdate(){
    var sd=new Date();
    sd.setDate(sd.getDate()-1);
    var sy=sd.getFullYear();
    var sm = sd.getMonth()+1;
    var sdd=sd.getDate();
    if (sm >= 1 && sm <= 9) {
        sm = "0" + sm;
    }
    if (sdd >= 0 && sdd <= 9) {
        sdd = "0" + sdd;
    }

    var ed=new Date();
    ed.setDate(ed.getDate());
    var ey=ed.getFullYear();
    var em = ed.getMonth()+1;
    var edd=ed.getDate();
    if (em >= 1 && em <= 9) {
        em = "0" + em;
    }
    if (edd >= 0 && edd <= 9) {
        edd = "0" + edd;
    }
    $("#startTime").val(sy+""+sm+""+sdd);
    $("#endTime").val(ey+""+em+""+edd);
}
 
 
function jqgridInit(){
	  jQuery("#grid").jqGrid(
		      {
		        url:basePath+"/systemLog/queryData.do",
		        mtype:'post',
		        datatype: "json",
		        loadonce:false,     //一次性加载
		        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
		        postData:{"startTime":$("#startTime").val(),"endTime":$("#endTime").val()},
		        //scroll:1, 滚动加载
		        //datatype : "local",
		        colNames : [ '用户名称','用户名','模块','登录ip','描述','登录时间','登出时间'],
		        colModel : [ 
		           {name : 'userName',index : 'userName' }, 
				   {name : 'userId',index : 'userId'   }, 
				   {name : 'module',index : 'module'  }, 
	               {name : 'ip',index : 'ip'  }, 
				   {name : 'description',index : 'description'  }, 
	               {name : 'loginTime',index : 'loginTime'  }, 
	               {name : 'loginOutTime',index : 'loginOutTime'  }, 
	             
	             ],
	             onSelectRow: function (rowId, status, e) {
	          	           var rowData=jQuery("#grid").jqGrid("getRowData",rowId);
	          	   			 
	             },
		           gridComplete:function(){//表格加载执行 
		                	/*    $("#grid").setGridWidth($(window).width()*0.965);
		                  	   $(window).resize(function(){  
		                  		 $("#grid").setGridWidth($(window).width()*0.965);
		                       }); */
		        },             
		        rowNum:24,        
		        rowList : [12,24], 
		        rownumbers: true,    //行首添加顺序编码
		        rownumWidth: 60,     //行首添加顺序编码的列宽
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
		      }) ;
		  
		  //jQuery("#list").jqGrid('filterToolbar',{searchOperators : true});
		  //jQuery("#list").jqGrid('navGrid','#pager',{add:false,edit:false,del:false});
	
};

</script>
       <div class="container">       
          <jsp:include page="inc.jsp"></jsp:include>  
 
 <div class="row">
 <div  class="col-xs-12" style="">
	  <form class="form-inline">
	  <div class="form-group">
	    <label for="exampleInputName2">开始时间:</label>
	       <input id="startTime"  name="startTime" type="text" style="width:70%" onClick="WdatePicker({dateFmt:'yyyyMMdd',maxDate:'%y-%M-%d'})" readonly="readonly"class="form-text select"/>
	  </div>
	  <div class="form-group">
	    <label for="exampleInputEmail2">结束时间:</label>
	  
	     <input id="endTime" name="endTime" type="text" style="width:70%" onClick="WdatePicker({dateFmt:'yyyyMMdd',maxDate:'%y-%M-%d '})" readonly="readonly"class="form-text select"/>
	  </div>
	  <button type="button" id="searchBtn" class="btn btn-default">查询</button>
	  <button type="button" id="exportBtn" class="btn btn-default">导出Excel</button>
	  
	</form>
 
 </div>
 </div>
<div class="row"style="margin-top: 10px;" >
  		<div  class="col-xs-12" style="">

		     <table id="grid" style=""></table> 
		     <div id="pager"></div> 
	    </div>
</div>
        <%-- 不要使用自结束 --%>
  <%--       <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.1.0.min.js"></script> --%>
     </div>
    </body>
</html>
