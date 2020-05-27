<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增产品信息设置</title>
</head> 

<body>
<style   type="text/css">
#table5 input {
            background: #00063c;  /*设置输入框背景色*/
            height: 100%;
            width:100%;
            padding:0px;
            margin:0px;
            text-align:center;
            word-wrap:break-word;word-break:break-all;
            
             border:none;
        } 
#table5 tr td {

text-align: center;
/* padding-top:0px !important;
padding-bottom:0px !important; */

}

select {

height: 50px;
}
.select_searchableMy {
    padding: 4px;
    width: 100%;
    background-color: transparent;
  
    box-sizing: border-box;


}
</style>
<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
<script src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>

 <script type="text/javascript" src="<%=basePath%>resources/js/customerChannel/customerChannel.js?"></script>
     <!-- <link href="resources/css/main.css" rel="stylesheet">
    <script type="text/javascript" src="resources/js/plugin/jquery-3.3.1.min.js"></script> -->
  
   <link rel="stylesheet" href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap.css">
    <script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>
 <!-- <form id="userAdd" method="post" action="../productInformationSet/saved.do"> -->
   
  <div class="row" style="margin-top: 50px;">
	<div class="col-xs-12">
		
		<table border="1" bordercolor="#1addfa" id="table5">
		
		
			<tr  bgcolor="#4682B4">
			<td colspan="22" align="center" height="40px;"style="font-size: 25px;">新增产品信息设置</td>
			</tr>
			
			<tr>
				<td rowspan="1">品牌</td>
				<td rowspan="1">CTMS型号</td>
				<td rowspan="1">SCM物料组</td>
				<td rowspan="1">SCM物料组描述</td>
				<td rowspan="1">俗称</td>
				<td rowspan="1">产品经理</td>
				<td rowspan="1">价位段</td>
				<td rowspan="1">采购低价</td>
                <td rowspan="1">代理类型</td>
                <td colspan="1">合作模式</td>
                <td colspan="6">合约机竞品</td>
                <td colspan="6">公开市场竞品</td>

			</tr>
			
			
			
			
			
			
			<tr>
			
			<td style="text-align: center;">
					<select name="term_brnd_nam" class="select_searchableMy"   id="select1" style="background-color: #00063c;border: none;width:80px;"> 
					<option value="">请选择品牌</option>
	                 <option>苹果</option>
			         <option>华为</option>	
			         <option>三星</option>	
			         <option>中国移动</option>	
			         <option>小米</option>	
			         <option>魅族</option>	
			         <option>OPPO</option>
	                 
	                 </select>
                 </td>
				
				<td >
				<select name="term_mdl_nam"  id="select2" class="select_searchableMy"  style="background-color: #00063c;border: none;width: 80px;"> 
					<option value="">请选择型号</option>
	                 </select>
				
				</td>
				<td><input type="text" name="METERDES" id="METERDES"/></td>
				<td><input type="text" name="METER" id="METER"/></td>
				<td><input type="text" name="SNAME" id="SNAME" /></td>
				<td><input type="text" name="PM" id="PM"/></td>
				<td>
				
				<select name="PRICELEVLE"  id="PRICELEVLE" style="background-color: #00063c;border: none;width: 70px;"> 
					 <option value="">请选择价格</option>
	                 <option>0~399</option>
	                 <option>400~700</option>
	                 <option>700~1000</option>
	                 <option >1000~1500</option>
	                 <option >1500~2000</option>
	                 <option >2000~2500</option>
	                 <option >2500~3000</option>
	                 <option >3000 以上</option>
                 </select>
				</td>
				                         
				<td><input type="text" maxlength="9" onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" name="PURPRICE" id="PURPRICE" /></td>
			    <td>
			    <select name="PROXYTYPE"  id="PROXYTYPE" style="background-color: #00063c;border: none;width: 80px;"> 
			     <option value="">请选择类型</option>
			     <option>总部代理</option>
	             <option>省份代理</option>
			    </select>
			    </td>
			
			<td >
				<select name="COPERMODEL"  id="COPERMODEL"  style="background-color: #00063c;border: none;width: 80px;"> 
			     <option value="">请选择模式</option>
			     <option>常规代理</option>
	             <option>平台切换</option>
	             <option>尾货包销</option>
			    </select>
				
				</td>
			
			<td>
				<select name="COMPETBRANDNAME1"   id="COMPETBRANDNAME1" class="select_searchableMy" style="background-color: #00063c;border: none;width:90px;"> 
					<option value="">请选择竞品</option>
	                 </select>
				
				</td>
				<td>
				<select name="COMPETSPEC1"  id="COMPETSPEC1" class="select_searchableMy"  style="background-color: #00063c;border: none;width: 80px;"> 
					<option value="">请选择型号</option>
	                 </select>
				</td>
				<td>
				<select name="COMPETBRANDNAME2"   id="COMPETBRANDNAME2" class="select_searchableMy" style="background-color: #00063c;border: none;width:80px;"> 
					<option value="">请选择竞品</option>
	            </select>
	                 </td>
				<td>
				<select name="COMPETSPEC2"  id="COMPETSPEC2" class="select_searchableMy"  style="background-color: #00063c;border: none;width: 80px;"> 
					<option value="">请选择型号</option>
	            </select>
				</td>
				<td>
				<select name="COMPETBRANDNAME3" class="select_searchableMy"   id="COMPETBRANDNAME3" style="background-color: #00063c;border: none;width:80px;"> 
					<option value="">请选择竞品</option>
	            </select>
				</td>
				<td>
				<select name="COMPETSPEC3"  id="COMPETSPEC3" class="select_searchableMy"  style="background-color: #00063c;border: none;width: 80px;"> 
					<option value="">请选择型号</option>
	            </select>
				</td>
			
			<td>
				<select name="BIBRANDNAME1"  class="select_searchableMy"  id="BIBRANDNAME1" style="background-color: #00063c;border: none;width:80px;"> 
					<option value="">请选择竞品</option>
	                 </select>
				
				</td>
				<td>
				<select name="BISPEC1"  id="BISPEC1" class="select_searchableMy"  style="background-color: #00063c;border: none;width: 80px;"> 
					<option value="">请选择型号</option>
	                 </select>
				</td>
				<td>
				<select name="BIBRANDNAME2" class="select_searchableMy"  id="BIBRANDNAME2" style="background-color: #00063c;border: none;width:80px;"> 
					<option value="">请选择竞品</option>
	            </select>
	                 </td>
				<td>
				<select name="BISPEC2"  id="BISPEC2" class="select_searchableMy"  style="background-color: #00063c;border: none;width: 80px;"> 
					<option value="">请选择型号</option>
	            </select>
				</td>
				<td>
				<select name="BIBRANDNAME3" class="select_searchableMy"  id="BIBRANDNAME3" style="background-color: #00063c;border: none;width:80px;"> 
					<option value="">请选择竞品</option>
	            </select>
				</td>
				<td>
				<select name="BISPEC3"  id="BISPEC3" class="select_searchableMy"  style="background-color: #00063c;border: none;width: 80px;"> 
					<option value="">请选择型号</option>
	            </select>
				</td>
			
			
			
			</tr>
			
			
			
			
		
		
	   
		
		</table>
</div>	
</div>
   
   
   
<div class="row" style="margin-top: 100px;">
<div class="col-xs-6">
   <button type="button" onclick="tijiao()" style="width: 100px;float:right; background-color:#49c9dc" id="btt">保存</button>
    
  </div>
   <div class="col-xs-6">
    
<button id="bt" type="button" onclick="goback()" style="width: 100px; background-color:#49c9dc ">取消</button>
</div>

</div>
<!-- </form> -->

<script type="text/javascript">

/* 返回按钮   */
function goback(){
	
	
	window.history.go(-1);
	
	
}
 
/*获取品牌的select */




$(document).ready(function(){
	  $('.select_searchableMy').select2();
	
	$.ajax({
	 		async: false,  //千万要记住加这个属性配置
	 		type: "post",
	 		datatype: 'json',
	 		url: "../brandEnty/brands.do",
	 		success: function(data) {
	 			for(var i=0; i < data.length; i++) {
                	$("#select1").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
	 			  $("#COMPETBRANDNAME1").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
	 			    $("#COMPETBRANDNAME2").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
	 			    $("#COMPETBRANDNAME3").append("<option value='"+data[i]+"'>"+data[i]+"</option>") ;
	 			   $("#BIBRANDNAME1").append("<option value='"+data[i]+"'>"+data[i]+"</option>") ;
	 			  $("#BIBRANDNAME2").append("<option value='"+data[i]+"'>"+data[i]+"</option>") ;
	 			 $("#BIBRANDNAME3").append("<option value='"+data[i]+"'>"+data[i]+"</option>") ;
	 			
	 			}
	 		}
	 	}); 

});

/* 获取型号的js       */

 
 $("#select1").change(function(e){
	$(this).parent().next().trigger('click');
    var roleid=this.value;
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
        	$("#select2").empty();      
        	for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象  
            	$("#select2").append("<option value='"+result[i]+"'>"+result[i]+"</option>");           
            }            
        }  
    });
  
});



 $("#COMPETBRANDNAME1").change(function(e){
		$(this).parent().next().trigger('click');
	    var roleid=this.value;
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
	        	$("#COMPETSPEC1").empty();	  
	        	for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象  
	            	$("#COMPETSPEC1").append("<option value='"+result[i]+"'>"+result[i]+"</option>");
	            	
	            }            
	        }  
	    });

	});

 
 
 
 $("#COMPETBRANDNAME2").change(function(e){
		$(this).parent().next().trigger('click');
	    var roleid=this.value;
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
	        	$("#COMPETSPEC2").empty();	        	
	        	for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象 
	            	$("#COMPETSPEC2").append("<option value='"+result[i]+"'>"+result[i]+"</option>");
	               
	            }            
	        }  
	    });

	});
 
 
 
 
 
 $("#COMPETBRANDNAME3").change(function(e){
		$(this).parent().next().trigger('click');
	    var roleid=this.value;
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
	        	$("#COMPETSPEC3").empty();
	        	for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象  	            	
	                $("#COMPETSPEC3").append("<option value='"+result[i]+"'>"+result[i]+"</option>");
	            }            
	        }  
	    });

	});
 
 $("#BIBRANDNAME1").change(function(e){
		$(this).parent().next().trigger('click');
	    var roleid=this.value;
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
	        	$("#BISPEC1").empty();
	        	for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象  	            	
	                $("#BISPEC1").append("<option value='"+result[i]+"'>"+result[i]+"</option>");
	            }            
	        }  
	    });

	});
 
 $("#BIBRANDNAME2").change(function(e){
		$(this).parent().next().trigger('click');
	    var roleid=this.value;
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
	        	$("#BISPEC2").empty();
	        	for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象  	            	
	                $("#BISPEC2").append("<option value='"+result[i]+"'>"+result[i]+"</option>");
	            }            
	        }  
	    });

	});
 
 $("#BIBRANDNAME3").change(function(e){
		$(this).parent().next().trigger('click');
	    var roleid=this.value;
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
	        	$("#BISPEC3").empty();
	        	for (var i = 0; i < result.length; i++) {   //循环生成option，并且连接成String对象  	            	
	                $("#BISPEC3").append("<option value='"+result[i]+"'>"+result[i]+"</option>");
	            }            
	        }  
	    });

	});

 /*表格内容保存功能的实现    ----------------------------------------------------------------------------- */

		
		function tijiao(){
			var term_brnd_nam=	$("#select1").val();
	     	 var term_mdl_nam=	$("#select2").val(); 
	     	 var METERDES=	$("#METERDES").val();
	     	 var METER=	$("#METER").val();
	     	 var SNAME=	$("#SNAME").val();
	     	 var PM= $("#PM").val();
	     	 var PRICELEVLE= $("#PRICELEVLE").val();
	     	 var PURPRICE=	$("#PURPRICE").val();
	     	 var PROXYTYPE=	$("#PROXYTYPE").val();
	     	 var COPERMODEL= $("#COPERMODEL").val();
	     	 var COMPETBRANDNAME1=	$("#COMPETBRANDNAME1").val();
	     	 var COMPETSPEC1=	$("#COMPETSPEC1").val();
	     	 var COMPETBRANDNAME2=	$("#COMPETBRANDNAME2").val();
	     	 var COMPETSPEC2=	$("#COMPETSPEC2").val();
	     	 var COMPETBRANDNAME3=	$("#COMPETBRANDNAME3").val();
	     	 var COMPETSPEC3= $("#COMPETSPEC3").val();
	     	/*公开竞品获取值   */
	     	 var BIBRANDNAME1=$("#BIBRANDNAME1").val();
	     	 var BISPEC2=$("#BISPEC1").val();
	     	 var BIBRANDNAME2=	$("#BIBRANDNAME2").val();
	     	 var BISPEC2=$("#BISPEC2").val();
	     	 var BIBRANDNAME3=$("#BIBRANDNAME3").val();
	     	 var BISPEC3=$("#BISPEC3").val();
			
			if(term_brnd_nam==""){
				alert("请选择品牌！"); 
				return false;		
			}	 
				 if(term_mdl_nam==""){
						alert("请选择型号！"); 
						return false;		
					}	 	 
				 if(METERDES==""){
						alert("请输入SCM物料组名称！"); 
						return false;		
					}	 
				 if(METER==""){
						alert("请SCM物料组描述！"); 
						return false;		
					}	  
				 if(SNAME==""){
						alert("请输入俗称！"); 
						return false;		
					}	 
				 
				 if(PM==""){
						alert("请输入产品经理！"); 
						return false;		
					}	 
				 if(PRICELEVLE==""){
						alert("请选择价位！"); 
						return false;		
					}	  
				 if(PURPRICE==""){
						alert("请输入采购低价！"); 
						return false;		
					}	  
				 if(PROXYTYPE==""){
						alert("请选择代理类型！"); 
						return false;		
					}	 
				 if(COPERMODEL==""){
						alert("请选择合作模式！"); 
						return false;		
					}	 
				 if(COMPETBRANDNAME1==""){
						alert("请选择竞品！"); 
						return false;		
					}	 
				 if(COMPETSPEC1==""){
						alert("请选择型号！"); 
						return false;		
					}	 
				 if(COMPETBRANDNAME2==""){
						alert("请选择竞品！"); 
						return false;		
					}	 
				 if(COMPETSPEC2==""){
						alert("请选择型号！"); 
						return false;		
					}	 
				 if(COMPETBRANDNAME3==""){
						alert("请选择竞品！"); 
						return false;		
					}	 
				 if(COMPETSPEC3==""){
						alert("请选择型号！"); 
						return false;		
					}
			/*公开竞品 非空效验   */
				 
				 if(BIBRANDNAME1==""){
						alert("请选择竞品！"); 
						return false;		
					}	 
				 if(BISPEC1==""){
						alert("请选择型号！"); 
						return false;		
					}
				 if(BIBRANDNAME2==""){
						alert("请选择竞品！"); 
						return false;		
					}	 
				 if(BISPEC2==""){
						alert("请选择型号！"); 
						return false;		
					}
				 if(BIBRANDNAME3==""){
						alert("请选择竞品！"); 
						return false;		
					}	 
				 if(BISPEC3==""){
						alert("请选择型号！"); 
						return false;		
					}
				 
			
			//非空校验
			doVerify();
			
		
		
		}
		
		
		
		
		
		
		function doVerify(){
			
			var term_brnd_nam=	$("#select1").val();
	     	 var term_mdl_nam=	$("#select2").val(); 
	     	 var METERDES=	$("#METERDES").val();
	     	 var METER=	$("#METER").val();
	     	 var SNAME=	$("#SNAME").val();
	     	 var PM= $("#PM").val();
	     	 var PRICELEVLE= $("#PRICELEVLE").val();
	     	 var PURPRICE=	$("#PURPRICE").val();
	     	 var PROXYTYPE=	$("#PROXYTYPE").val();
	     	 var COPERMODEL= $("#COPERMODEL").val();
	     	 var COMPETBRANDNAME1=	$("#COMPETBRANDNAME1").val();
	     	 var COMPETSPEC1=	$("#COMPETSPEC1").val();
	     	 var COMPETBRANDNAME2=	$("#COMPETBRANDNAME2").val();
	     	 var COMPETSPEC2=	$("#COMPETSPEC2").val();
	     	 var COMPETBRANDNAME3=	$("#COMPETBRANDNAME3").val();
	     	 var COMPETSPEC3= $("#COMPETSPEC3").val();
	     	 var BIBRANDNAME1=$("#BIBRANDNAME1").val();
	     	 var BISPEC1=$("#BISPEC1").val();
	     	 var BIBRANDNAME2=	$("#BIBRANDNAME2").val();
	     	 var BISPEC2=$("#BISPEC2").val();
	     	 var BIBRANDNAME3=$("#BIBRANDNAME3").val();
	     	 var BISPEC3=$("#BISPEC3").val();
	     	 
	     	 var data = {'term_brnd_nam': term_brnd_nam,//传入角色id，到后台获取json  
	        	'term_mdl_nam':term_mdl_nam,
	        	'METERDES':METERDES,
	        	'METER':METER,
	        	'SNAME':SNAME,
	        	'PM':PM,
	        	'PRICELEVLE':PRICELEVLE,
	        	'PURPRICE':PURPRICE,
	        	'PROXYTYPE':PROXYTYPE,
	        	'COPERMODEL':COPERMODEL,
	        	'COMPETBRANDNAME1':COMPETBRANDNAME1,
	        	'COMPETSPEC1':COMPETSPEC1,
	        	'COMPETBRANDNAME2':COMPETBRANDNAME2,
	        	'COMPETSPEC2':COMPETSPEC2,
	        	'COMPETBRANDNAME3':COMPETBRANDNAME3,
	        	'COMPETSPEC3':COMPETSPEC3,
	        	'BIBRANDNAME1':BIBRANDNAME1,
	        	'BISPEC1':BISPEC1,
	        	'BIBRANDNAME2':BIBRANDNAME2,
	        	'BISPEC2':BISPEC2,
	        	'BIBRANDNAME3':BIBRANDNAME3,
	        	'BISPEC3':BISPEC3};	

				//校验
				$.ajax({
					url:basePath+'/productInformationSet/saved.do',
					data:data,
					type:'POST',
					async:false,//非异步
					success:function(data){
					if(data==1){
						alert("保存成功！");
						window.location.reload();
					}
					if(data==0){
						
					alert("数据已更新！");	
					window.location.reload();
					
					}
					
					}
				});
				
			 
		};
		
		 
		//品牌

		function showTermBrnd(arr){
			var id = "select1";   
		    $("#"+id).empty();     
		    $("#"+id).select2({});
		    
		    arr = isEmptyObject(arr)?[]:arr;
		    $.each(arr,function(index,item){   	
		    	$("#"+id).append("<option value='"+item+"'>"+item+"</option>"); 
		    });
		    
		    $("#"+id).off("select2:select").on("select2:select",function(e){ 
		    	querySubmit();
			});
		}		 
		 
		
		 
		//品牌

		function showTermBrnd(arr){
			var id = "COMPETBRANDNAME1";   
		    $("#"+id).empty();     
		    $("#"+id).select2({});
		    
		    arr = isEmptyObject(arr)?[]:arr;
		    $.each(arr,function(index,item){   	
		    	$("#"+id).append("<option value='"+item+"'>"+item+"</option>"); 
		    });
		    
		    $("#"+id).off("select2:select").on("select2:select",function(e){ 
		    	querySubmit();
			});
		}		 	 
		//品牌

		function showTermBrnd(arr){
			var id = "COMPETBRANDNAME2";   
		    $("#"+id).empty();     
		    $("#"+id).select2({});
		    
		    arr = isEmptyObject(arr)?[]:arr;
		    $.each(arr,function(index,item){   	
		    	$("#"+id).append("<option value='"+item+"'>"+item+"</option>"); 
		    });
		    
		    $("#"+id).off("select2:select").on("select2:select",function(e){ 
		    	querySubmit();
			});
		}		 	 	 
	 
	 
		//品牌

		function showTermBrnd(arr){
			var id = "COMPETBRANDNAME3";   
		    $("#"+id).empty();     
		    $("#"+id).select2({});
		    
		    arr = isEmptyObject(arr)?[]:arr;
		    $.each(arr,function(index,item){   	
		    	$("#"+id).append("<option value='"+item+"'>"+item+"</option>"); 
		    });
		    
		    $("#"+id).off("select2:select").on("select2:select",function(e){ 
		    	querySubmit();
			});
		}		 	  

		//品牌

		function showTermBrnd(arr){
			var id = "BIBRANDNAME1";   
		    $("#"+id).empty();     
		    $("#"+id).select2({});
		    
		    arr = isEmptyObject(arr)?[]:arr;
		    $.each(arr,function(index,item){   	
		    	$("#"+id).append("<option value='"+item+"'>"+item+"</option>"); 
		    });
		    
		    $("#"+id).off("select2:select").on("select2:select",function(e){ 
		    	querySubmit();
			});
		}		 	 		
		
		//品牌

		function showTermBrnd(arr){
			var id = "BIBRANDNAME2";   
		    $("#"+id).empty();     
		    $("#"+id).select2({});
		    
		    arr = isEmptyObject(arr)?[]:arr;
		    $.each(arr,function(index,item){   	
		    	$("#"+id).append("<option value='"+item+"'>"+item+"</option>"); 
		    });
		    
		    $("#"+id).off("select2:select").on("select2:select",function(e){ 
		    	querySubmit();
			});
		}		 	 		
		
		//品牌

		function showTermBrnd(arr){
			var id = "BIBRANDNAME3";   
		    $("#"+id).empty();     
		    $("#"+id).select2({});
		    
		    arr = isEmptyObject(arr)?[]:arr;
		    $.each(arr,function(index,item){   	
		    	$("#"+id).append("<option value='"+item+"'>"+item+"</option>"); 
		    });
		    
		    $("#"+id).off("select2:select").on("select2:select",function(e){ 
		    	querySubmit();
			});
		}		 	        
 
 //input框输入非数字进行提示
 
/*  function keyPress(){
	var PURPRICE=$("#PURPRICE").val();
	 
	
	
	 
	 
	 
 } */
 
 
 
		
		
		
		
		
		
		
 
 
 
 </script>



</body>
</html>