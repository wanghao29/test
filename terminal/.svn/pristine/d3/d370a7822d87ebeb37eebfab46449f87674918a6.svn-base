<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="sharainy" tagdir="/WEB-INF/tags" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>渠道客户画像</title>
</head> 

<body>
<style   type="text/css">
.box{
	height:300px;
}
.title{
	margin-bottom:3px;
}
.billcyc{
	color: red;
	/* font-weight: 600; */
    font-size: 16px;
    margin-bottom: -10px;
    z-index: 9999999999;
    position:absolute;
    padding-bottom: -10px;
}
.box-content{
    margin-top:0px;
	height:300px;
}

</style>
 <script type="text/javascript" src="<%=basePath%>resources/js/consumerBigData/xfzzlIndex.js"></script>
 <script type="text/javascript" src="<%=basePath%>resources/js/plugin/jquery.blockUI.js"></script>
 
 
<!--   标签页 -- 标签  -->
<div class="row" style="margin-top:10px;">
    <div class="col-xs-12" >
		<ul id="myTab" class="nav nav-tabs">
		    <li class="active" style="width:34%;text-align:center;" onclick="showBrand1();">
		        <a href="#xfz" data-toggle="tab">
		           	 消费者总览
		        </a>
		    </li>
		    <li style="width:33%;text-align:center;" onclick="showBrand2();">
		    	<a href="#zdtz" data-toggle="tab">
		    		终端特征总览
		    	</a>
		    </li>
		    <li style="width:33%;text-align:center;" onclick="showJiLing();">
		    	<a href="#jlfx" data-toggle="tab">
                   	 消费者机龄分析
		    	</a>
		    </li>
	<!-- 	    <li style="width:20%;text-align:center;">
		    	<a href="" data-toggle="tab">
                   &nbsp;
		    	</a>
		    </li>	
		    <li style="width:20%;text-align:center;">
		    	<a href="" data-toggle="tab">
                   &nbsp;
		    	</a>
		    </li>		 -->    			    		    		    
		</ul>
	</div>
</div>
 
 
 <div style="margin-left: 0px;margin-right: 0px;margin-top:25px;"> 
  <div class="row" style="margin-top:10px;">
  
  <div class='col-xs-12'> 
		<div class='panel panel-default' style='width: 100%;'> 
			<div class='panel-body' >
  
	<form id="memuForm">
	       <div  class="row" style="margin-top:10px;margin-left: 0px;">
	           <div class="col-xs-3"  style="padding-left:0px;">
		        <div class="input-group">
		        	<span class="input-group-addon">月份</span>
		
				   	<input name="statMo" id="statMo" type="text" style="width:100%" readonly="readonly" class="form-control"
				   	  	onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M-1}'})"  value="${vo.statMo}" onchange="cmBrandReload()"/>			            	            
		        </div>	
		    </div>	
		    
            <div class="col-xs-3">
		        <div class="input-group">
		        	<span class="input-group-addon">地市</span>
 				   	<select name="cmccCtyNam" id="cmccCtyNam" onchange="clickCmccBranchCd()" class="form-control" style="width: 100%;padding-top:2px;padding-bottom:2px;">
 				   	               <shiro:hasPermission name="QS"><option value="">全省</option></shiro:hasPermission>
				<shiro:hasPermission name="GZ"><option value="广州">广州</option></shiro:hasPermission>
				<shiro:hasPermission name="QY"><option value="清远">清远</option></shiro:hasPermission>
				<shiro:hasPermission name="ZQ"><option value="肇庆">肇庆</option></shiro:hasPermission>
				<shiro:hasPermission name="SQ"><option value="韶关">韶关</option></shiro:hasPermission>
				<shiro:hasPermission name="YF"><option value="云浮">云浮</option></shiro:hasPermission>
				<shiro:hasPermission name="FS"><option value="佛山">佛山</option></shiro:hasPermission>
				<shiro:hasPermission name="JM"><option value="江门">江门</option></shiro:hasPermission>
				<shiro:hasPermission name="MM"><option value="茂名">茂名</option></shiro:hasPermission>
				<shiro:hasPermission name="YJ"><option value="阳江">阳江</option></shiro:hasPermission>
				<shiro:hasPermission name="ZJ"><option value="湛江">湛江</option></shiro:hasPermission>
				<shiro:hasPermission name="SZ"><option value="深圳">深圳</option></shiro:hasPermission>
				<shiro:hasPermission name="ST"><option value="汕头">汕头</option></shiro:hasPermission>
				<shiro:hasPermission name="MZ"><option value="梅州">梅州</option></shiro:hasPermission>
				<shiro:hasPermission name="SW"><option value="汕尾">汕尾</option></shiro:hasPermission>
				<shiro:hasPermission name="YJ"><option value="揭阳">揭阳</option></shiro:hasPermission>
				<shiro:hasPermission name="CZ"><option value="潮州">潮州</option></shiro:hasPermission>
				<shiro:hasPermission name="DG"><option value="东莞">东莞</option></shiro:hasPermission>
				<shiro:hasPermission name="HZ"><option value="惠州">惠州</option></shiro:hasPermission>
				<shiro:hasPermission name="ZH"><option value="珠海">珠海</option></shiro:hasPermission>
				<shiro:hasPermission name="ZS"><option value="中山">中山</option></shiro:hasPermission>
				<shiro:hasPermission name="HY"><option value="河源">河源</option></shiro:hasPermission>
	       		</select>				   	  	
				   	  			            	            
		        </div>	
		    </div>
	    
            <div class="col-xs-3">
		        <div class="input-group">
		        	<span class="input-group-addon">区县</span>
				   	<select id="cmccCntyNam" name="cmccCntyNam" onchange="cmBrandReload()" class="form-control"  style="width: 100%;padding-top:2px;padding-bottom:2px;">
				   		<option value="">全部</option>
				   	</select>	            	            
		        </div>	
		    </div>
		    
        
	       
	       
	       
	       </div>
	        <div  class="row" style="margin-top:10px;margin-left: 0px;">
	        
			       	 <div class="col-xs-3" style="display:block;" id="brand">
				        	<span class="">当前号码品牌</span>
						   	<select class="select" id="brndCd" name="brndCd" style="width: 80%;">
						   	        <option value="">全部</option>
				   		       		<option value="全球通">全球通</option>
				   		       		<option value="神州行">神州行</option>
				   		       		<option value="动感地带">动感地带</option>
				   		       		<option value="神州大众卡">神州大众卡</option>
				   		       		<option value="未知">未知</option>			   	
						   	</select>	
				 	    </div>
			        
			        	 <div class="col-xs-3">
				        	<span class="">当前终端品牌</span>
						   	<select class="select" id="cmBrand" name="cmBrand" style="width: 60%">
						   	    <option value="">全部</option>
								<c:forEach var="item" items="${curBrands}">
								         <option value="${item.id}">
								         	  <c:out value="${item.text}" />
								         </option>
								</c:forEach> 				   	
						   	</select>	
				    </div>
				    
		            <div class="col-xs-3" >
				        	<span class="">当前终端型号</span>
						   	<select class="select" id="cmTerType" name="cmTerType" style="width: 60%">
						   		<option value="">全部</option>
						   	</select>	
				    </div>		    
				    
				     <div class="col-xs-3" style="display:none;" id="jiLing">
				        	<span class="">机龄分布</span>
						   	<select class="select" id="jiAgeRak" name="jiAgeRak" onchange="changeColor()" style="width: 80%;" multiple>
						   	        <option value="">全部</option>
				   		       		<option value="小于3个月">小于3个月</option>
				   		       		<option value="[3-6)月">[3-6)月</option>
				   		       		<option value="[6-12)月">[6-12)月</option>
				   		       		<option value="[12-24)月">[12-24)月</option>
				   		       		<option value="[24-36)月">[24-36)月</option>			   	
				   		       		<option value="[36-60)月">[36-60)月</option>			   	
				   		       		<option value="[60-120)月">[60-120)月</option>			   	
				   		       		<option value="大于120月">大于120月</option>			   	
				   		       		<option value="未知">未知</option>			   	
						   	</select>	
				    </div>
				    		    		    		    		      
					<!-- 隐藏域 -->
					<input type="hidden" id="tableName" name="tableName" value="xfz"/> <!-- 标记所在的指标 -->
					
					<div class="col-xs-1" style="margin-left:1%;"> 
						<button type="button" onclick="query();" class="btn btn-primary" style="width:100px">搜索</button>
					</div>	
			        
	        </div>
	       
	       
           
		    
		   
           
     </form>  
     </div>
     </div>
     </div>
     
     		
	 </div>	 
 </div> 

<!--   标签页 -- 页  -->
<div id="myTabContent" class="tab-content">

<!-- 消费者总览 -->
<div class="tab-pane fade in active" id="xfz">
 <div class="row" style="margin-top:10px;">
 <div class='col-xs-4'> 
		<div class='panel panel-default' style='width: 100%;'> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="6">在网套餐用户数</font></p>
	 			<p><font size="4" color="#3399FF">(办理套餐的在网用户数)</font></p>
	 			 <span class="billcyc" id="billcyc_xfz_1"> </span>
				<h1  style='float:right;margin:0px;' id="zwtcyhs">&nbsp;</h1>
			</div>
		</div>
	</div>
	<div class='col-xs-4'> 
		<div class='panel panel-default' style='width: 100%;'> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="6">在网身份证客户数</font></p>
				<p><font size="4" color="#3399FF">(在网真实客户，一个客户有多个号码算一个客户)</font></p>
				 <span  class="billcyc" id="billcyc_xfz_2"> </span>
				<h1  style='float:right;margin:0px;' id="txyh">&nbsp;</h1>
			</div>
		</div>
	</div>
	<div class='col-xs-4'> 
		<div class='panel panel-default' style='width: 100%;'> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="6">主动通信用户数</font></p>
				<p><font size="4" color="#3399FF">(主动呼叫的用户（号码）数)</font></p>
				<span  class="billcyc" id="billcyc_xfz_3"> </span>
				<h1  style='float:right;margin:0px;' id="zxtxyh">&nbsp;</h1>
			</div>
		</div>
	</div>		
 </div>

 <div class="row" style="margin-top:10px;">
     <div class="col-xs-9" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="p1_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			    <span  class="billcyc" id="billcyc_xfz1"></span>
	            <div class="box-content"  id="p1">
	            </div>
	        </div>
     </div>    
     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="p2_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			 <span  class="billcyc" id="billcyc_xfz2"></span>
	            <div class="box-content"  id="p2">
	            </div>
	        </div>
     </div>                 
  </div>  

 <div class="row" style="margin-top:10px;">
     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;" id="p3_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			 <span  class="billcyc" id="billcyc_xfz3"></span>
	            <div class="box-content"  id="p3">
	            </div>
	        </div>
     </div>   
     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;" id="p4_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			 <span class="billcyc" id="billcyc_xfz4"></span>
	            <div class="box-content"  id="p4">
	            </div>
	        </div>
     </div>     
     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="p5_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			 <span  class="billcyc" id="billcyc_xfz5"></span>
	            <div class="box-content"  id="p5">
	            </div>
	        </div>
     </div>    
     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="p6_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			 <span class="billcyc" id="billcyc_xfz6"></span>
	            <div class="box-content"  id="p6">
	            </div>
	        </div>
     </div>               
 </div>
  
 <div class="row" style="margin-top:10px;">
     <div class="col-xs-9" >
			<div class="box-head">
				<a href="#" class="tooltip-test" data-toggle="tooltip" title="ARPU:即每用户平均收入">
					<span class="title" style="width:245px;"  id="p7_text"></span>
				</a>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			 <span class="billcyc" id="billcyc_xfz7"></span>
	            <div class="box-content"  id="p7">
	            </div>
	        </div>
     </div>   
     <div class="col-xs-3" >
			<div class="box-head">
				<a href="#" class="tooltip-test" data-toggle="tooltip" title="DOU:平均每户每月上网流量">
					<span class="title" style="width:245px;"  id="p8_text"></span>
				</a>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			 <span class="billcyc" id="billcyc_xfz8"></span>
	            <div class="box-content"  id="p8">
	            </div>
	        </div>
     </div>                
 </div>  
  
 <div class="row" style="margin-top:10px;">
     <div class="col-xs-9" >
			<div class="box-head">
				<a href="#" class="tooltip-test" data-toggle="tooltip" title="MOU:平均每户每月通话时间">
					<span class="title" style="width:245px;"  id="p9_text"></span>
				</a>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			 <span class="billcyc"  id="billcyc_xfz9"></span>
	            <div class="box-content"  id="p9">
	            </div>
	        </div>
     </div>    
     <div class="col-xs-3" >
			<div class="box-head">
				<a href="#" class="tooltip-test" data-toggle="tooltip" title="SOU:每月短信条数">
					<span class="title" style="width:245px;"  id="p10_text"></span>
				</a>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			 <span  class="billcyc" id="billcyc_xfz10"></span>
	            <div class="box-content"  id="p10">
	            </div>
	        </div>
     </div>                 
  </div>   
</div>
<!-- 消费者总览 -->

<!-- 终端特征总览 -->
<div class="tab-pane fade" id="zdtz">
 <div class="row" style="margin-top:10px;">
	<div class='col-xs-3'> 
		<div class='panel panel-default' style='width: 100%;'> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="6">在网手机终端数</font></p>
	 			 <span  class="billcyc" id="billcyc_zdtz_1"></span>
				<h1  style='float:right;margin:0px;' id="zwzd">&nbsp;</h1>
			</div>
		</div>
	</div>
    <div class='col-xs-3'> 
		<div class='panel panel-default' style='width: 100%;'> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="6">在网物联网终端数</font></p>
	 			<span  class="billcyc" id="billcyc_zdtz_2"></span>
				<h1  style='float:right;margin:0px;' id="zwwlwzd">&nbsp;</h1>
			</div>
		</div>
	</div>
	<div class='col-xs-3'> 
		<div class='panel panel-default' style='width: 100%;'> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="6">新入网手机终端数</font></p>
	 			<span  class="billcyc" id="billcyc_zdtz_3"></span>
				<h1  style='float:right;margin:0px;' id="xrwzd">&nbsp;</h1>
			</div>
		</div>
	</div>	

	<div class='col-xs-3'> 
		<div class='panel panel-default' style='width: 100%;'> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="6">新入网物联网终端数</font></p>
	 			<span  class="billcyc" id="billcyc_zdtz_4"></span>
				<h1  style='float:right;margin:0px;' id="xrwwlwzd">&nbsp;</h1>
			</div>
		</div>
	</div>		
 </div>
<!--  <div class="row" style="margin-top:10px;">
	<div class='col-xs-3'> 
		<div class='panel panel-default' style='width: 100%;'> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="6">在网手机终端平均机龄</font></p>
	 			 <span  class="billcyc" id="billcyc_zdtz_5"></span>
				<h1  style='float:right;margin:0px;' id="zwsjzdpjjl">&nbsp;</h1>
			</div>
		</div>
	</div>
    <div class='col-xs-4'> 
		<div class='panel panel-default' style='width: 100%;'> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="6">在网手机终端平均换机周期</font></p>
	 			<span  class="billcyc" id="billcyc_zdtz_6"></span>
				<h1  style='float:right;margin:0px;' id="zwsjzdpjhjzq">&nbsp;</h1>
			</div>
		</div>
	</div>
 
 </div> -->
  <div class="row" style="margin-top:10px;">
     <div class="col-xs-12" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="zdtz1_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			    <span  class="billcyc" id="billcyc_zdtz1"></span>
	            <div class="box-content"  id="zdtz1">
	            </div>
	        </div>
     </div>                  
  </div> 
  
  <div class="row" style="margin-top:10px;">
     <div class="col-xs-12" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="zdtz2_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
				<span  class="billcyc" id="billcyc_zdtz2"></span>
	            <div class="box-content"  id="zdtz2">
	            </div>
	        </div>
     </div>                  
  </div> 

  <div class="row" style="margin-top:10px;">
     <div class="col-xs-12" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="zdtz3_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
				<span  class="billcyc" id="billcyc_zdtz3"></span>
	            <div class="box-content"  id="zdtz3">
	            </div>
	        </div>
     </div>                  
  </div> 
  
  <div class="row" style="margin-top:10px;">
     <div class="col-xs-12" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="zdtz4_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
				<span  class="billcyc" id="billcyc_zdtz4"></span>
	            <div class="box-content"  id="zdtz4">
	            </div>
	        </div>
     </div>                  
  </div> 
 <div class="row" style="margin-top:10px;">
     <div class="col-xs-12" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="zdtz5_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			    <span  class="billcyc" id="billcyc_zdtz5"></span>
	            <div class="box-content"  id="zdtz5">
	            </div>
	        </div>
     </div>                  
  </div> 

  <div class="row" style="margin-top:10px;">
<!--      <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;" id="zdtz5_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
	            <div class="box-content"  id="zdtz5">
	            </div>
	        </div>
     </div>    -->
     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;" id="zdtz6_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
				<span  class="billcyc" id="billcyc_zdtz6"></span>
	            <div class="box-content"  id="zdtz6">
	            </div>
	        </div>
     </div>     
     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="zdtz7_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			<span  class="billcyc" id="billcyc_zdtz7"></span>
	            <div class="box-content"  id="zdtz7">
	            </div>
	        </div>
     </div>    
     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="zdtz8_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
	            <div class="box-content"  id="zdtz8">
	            </div>
	        </div>
     </div>    
     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;" id="zdtz9_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			<span  class="billcyc" id="billcyc_zdtz9"></span>
	            <div class="box-content"  id="zdtz9">
	            </div>
	        </div>
     </div>              
  </div>
  
  <div class="row" style="margin-top:10px;">

     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;" id="zdtz10_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			<span  class="billcyc" id="billcyc_zdtz10"></span>
	            <div class="box-content"  id="zdtz10">
	            </div>
	        </div>
     </div>     
     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="zdtz11_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			<span  class="billcyc" id="billcyc_zdtz11"></span>
	            <div class="box-content"  id="zdtz11">
	            </div>
	        </div>
     </div>    
     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="zdtz12_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			<span  class="billcyc" id="billcyc_zdtz12"></span>
	            <div class="box-content"  id="zdtz12">
	            </div>
	        </div>
     </div>    
     
     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;" id="zdtz13_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			<span  class="billcyc" id="billcyc_zdtz13"></span>
	            <div class="box-content"  id="zdtz13">
	            </div>
	        </div>
     </div>              
  </div>
  
  <div class="row" style="margin-top:10px;">

     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;" id="zdtz14_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
				<span  class="billcyc" id="billcyc_zdtz14"></span>
	            <div class="box-content"  id="zdtz14">
	            </div>
	        </div>
     </div>     
     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="zdtz15_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			<span  class="billcyc" id="billcyc_zdtz15"></span>
	            <div class="box-content"  id="zdtz15">
	            </div>
	        </div>
     </div>    
     <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="zdtz16_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			<span  class="billcyc" id="billcyc_zdtz16"></span>
	            <div class="box-content"  id="zdtz16">
	            </div>
	        </div>
     </div>           
          <div class="col-xs-3" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="zdtz17_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
				<span  class="billcyc" id="billcyc_zdtz17"></span>
	            <div class="box-content"  id="zdtz17">
	            </div>
	        </div>
     </div>         
  </div>  
</div>
<!-- 终端特征总览 -->

<!-- 消费者机龄分布 -->
<div class="tab-pane fade" id="jlfx">
<!-- 
	<div class="row" style="margin-top:10px;">
	<div class='col-xs-4'> 
		<div class='panel panel-default' style='width: 100%;background-color:#6666CC;' id="jlfb_zl1"> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="4">小于3个月</font></p>
				<h1  style='float:right;margin:0px;' id="jlfb_3">&nbsp;</h1>
			</div>
		</div>
	</div>
	<div class='col-xs-4'> 
		<div class='panel panel-default' style='width: 100%;background-color:#6666CC;'  id="jlfb_zl2"> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="4">[3-6)月</font></p>
				<h1  style='float:right;margin:0px;' id="jlfb_3_6">&nbsp;</h1>
			</div>
		</div>
	</div>		
	<div class='col-xs-4'> 
		<div class='panel panel-default' style='width: 100%;background-color:#6666CC;'  id="jlfb_zl3"> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="4">[6-12)月</font></p>
				<h1  style='float:right;margin:0px;' id="jlfb_6_12">&nbsp;</h1>
			</div>
		</div>
	</div>		
	<div class='col-xs-4'> 
		<div class='panel panel-default' style='width: 100%;background-color:#6666CC;' id="jlfb_zl4"> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="4">[12-24)月</font></p>
				<h1  style='float:right;margin:0px;' id="jlfb_12_24">&nbsp;</h1>
			</div>
		</div>
	</div>		
	<div class='col-xs-4'> 
		<div class='panel panel-default' style='width: 100%;background-color:#6666CC;' id="jlfb_zl5"> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="4">[24-36)月</font></p>
				<h1  style='float:right;margin:0px;' id="jlfb_24_36">&nbsp;</h1>
			</div>
		</div>
	</div>		
	<div class='col-xs-4'> 
		<div class='panel panel-default' style='width: 100%;background-color:#6666CC;' id="jlfb_zl6"> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="4">[36-60)月</font></p>
				<h1  style='float:right;margin:0px;' id="jlfb_36_60">&nbsp;</h1>
			</div>
		</div>
	</div>		
	<div class='col-xs-4'> 
		<div class='panel panel-default' style='width: 100%;background-color:#6666CC;' id="jlfb_zl7"> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="4">[60-120)月</font></p>
				<h1  style='float:right;margin:0px;' id="jlfb_60_120">&nbsp;</h1>
			</div>
		</div>
	</div>		
	<div class='col-xs-4'> 
		<div class='panel panel-default' style='width: 100%;background-color:#6666CC;' id="jlfb_zl8"> 
			<div class='panel-body'  >
	 			<p style="margin:0px;"><font size="4">大于120月</font></p>
				<h1  style='float:right;margin:0px;' id="jlfb_120">&nbsp;</h1>
			</div>
		</div>
	</div>	
	<div class='col-xs-4'> 
		<div class='panel panel-default' style='width: 100%;background-color:#6666CC;' id="jlfb_zl9"> 
			<div class='panel-body' >
	 			<p style="margin:0px;"><font size="4">未知</font></p>
				<h1  style='float:right;margin:0px;' id="jlfb_wz">&nbsp;</h1>
			</div>
		</div>
	</div>		
 </div>
-->
 
     <div class="row" style="margin-top:10px;">
			<div class="box-head">
				<span class="title" style="width:245px;"  id="jlfx1_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			<span  class="billcyc" id="billcyc_jlfx1"></span>
	            <div class="box-content"  id="jlfx1">
	            </div>
	        </div>
     </div>    
     <div class="row" style="margin-top:10px;">
     <div class="col-xs" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="jlfx2_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			<span  class="billcyc" id="billcyc_jlfx2"></span>
	            <div class="box-content"  id="jlfx2">
	            </div>
	        </div>
	   </div>     
     </div>               
 	
 	<div class="row" style="margin-top:10px;">
     <div class="col-xs" >
			<div class="box-head">
				<span class="title" style="width:245px;"  id="jlfx3_text"></span>
			</div>		
			<div class="box" style="border: 1px solid #558baf!important;">
			<span  class="billcyc" id="billcyc_jlfx3"></span>
	            <div class="box-content"  id="jlfx3">
	            </div>
	        </div>
     </div>    
  </div> 
 	
</div>
<!-- 消费者机龄分析 -->
</div>
<!--   标签页 -- 页  -->



  


<script type="text/javascript">
$(function () { $("[data-toggle='tooltip']").tooltip(); });
$(document).ready(function() {
	blockImg();
	//listPortray();
	setTimeout(function () {$.unblockUI(); }, 500);//细微延迟后关闭进度效果
});

//进度效果
function blockImg(){
	$.blockUI({ message: '<h1><img src="${pageContext.request.contextPath}/resources/images/wait.gif" /> 加载中。。。。。</h1>' });
}

//区县cmccCntyNam 重新加载
function cmccCntyNamReload(){
	var cmccCtyNam = $("#cmccCtyNam").val();
	if(cmccCtyNam==null || cmccCtyNam==""){
		$("#cmccCntyNam").empty();
		$("#cmccCntyNam").append("<option value=''>全部</option>"); 
	}
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}xfzzlBigData/cmccCntyNamReload.do",
	    contentType: 'application/x-www-form-urlencoded',
	    data: $("#memuForm").serialize(),
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	cmccCntyNam(result);
	    }
	}); 

	/* $('#cmBrand').select2({
	    placeholder: '请选择',
	    language: "zh-CN",
	    // data:[{ id: employeeId, text: partmentName}],  //  默认值填写  value 是id  text:是名字 不能使用其他字段
	    // inputMessage:'信息科',
	    ajax: {
	        url: "${basePath}xfzzlBigData/cmccCntyNamReload.do",
	        type: "post",
	        dataType: "json",
	        delay: 250,
	        headers: {
	            apikey: sessionStorage.getItem('apikey') || 'test'
	        },
	        data: function(params){
	            // 传递到后端的参数
	            return {
	                // 搜索框内输入的内容
	                // selectInput: params.term,
	                // 当前页
	                // page: params.page || 0,
	                // 每页显示多少条记录，默认10条
	                // row: 10,
	                cmd: cmd,
	                data: JSON.stringify({
	                            isJoin: 2,
	                            page: params.page || 0,
	                            row: 10,
	                            userId: userId,
	                            keyWord: params.term
	                        }), 
	            };
	        },
	        
	        processResults: function (data, params) {
	            params.page = params.page || 0;
	            var d_l = data.data;
	 
	            return {
	                results: d_l,
	                pagination: {
	                    more: (params.page) < data.total
	                }
	            };
	        },
	        cache: true
	    },
	    escapeMarkup: function (markup) {
	        return markup;
	    },
	    templateResult: function (repo) {
	        if (repo.loading) {
	            return repo.text;
	        } else {
	            return repo.circleName;      //选中 显示的名称
	        }
	 
	    },
	    templateSelection: function (data) {
	        return data.circleName||data.text;
	    }
	}); */
 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

//当前终端品牌cmBrand 重新加载
function cmBrandReload(){			
/* 	$.ajax({
	    type: "post",
	    url:  "${basePath}xfzzlBigData/cmBrandReload.do",
	    contentType: 'application/x-www-form-urlencoded',
	    data: $("#memuForm").serialize(),
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	cmBrand(result);
	    }
	});
	 */
	 var tableName = $("#tableName").val();
	 var dataBaseTable= "";
	 if("xfz"==tableName){
		 dataBaseTable = "ZD_RESULT_CONSUMER_ZL_XFZ_";
	 }else if("zdtz"==tableName){
		 dataBaseTable = "ZD_RESULT_CONSUMER_ZL_XFZ_";
	 }else if("jlfx"==tableName){
		 dataBaseTable = "ZD_RESULT_CONSUMER_ZL_XFZ_";
	 }
   
	 $('#cmBrand').select2({
	    language : "zh-CN",// 指定语言为中文，国际化才起效
	    inputMessage :"",// 添加默认参数
	    placeholder: "请选择",
        placeholderOption: "first",
	    allowClear: true,
	    ajax : {
	     url : "${basePath}xfzzlBigData/cmBrandReload.do",
	     dataType : 'json',
	     delay : 250,// 延迟显示k
	     data : function(params) {
	      return {
	       cmBrand : params.term, // 搜索框内输入的内容，传递到Java后端的parameter为username
	       page : params.page,// 第几页，分页哦
	       rows : 10,// 每页显示多少行
	       statMo : $("#statMo").val(),
	       cmccCtyNam: $("#cmccCtyNam").val(),
	       cmccCntyNam: $("#cmccCntyNam").val(),
	       tableName: dataBaseTable+$("#statMo").val(),//'ZD_RESULT_CONSUMER_ZL_XFZ_201901'
	       brndCd:$("#brndCd").val(),
	      };
	     },
	     // 分页
	     processResults : function(data, params) {
	      params.page = params.page || 1;
	      return {
	       results : data.list,// 后台返回的数据集
	       pagination : {
	        more : params.page < data.total// 总页数为10，那么1-9页的时候都可以下拉刷新
	       }
	      };
	     },
	     cache : false
	    },
	    escapeMarkup : function(markup) {
	     return markup;
	    }, // let our custom formatter work
	    minimumInputLength : 0,// 最少输入一个字符才开始检索
	    templateResult : function(repo) {// 显示的结果集格式，这里需要自己写css样式，可参照demo
	     // 正在检索
	     if (repo.loading)
	      return repo.text;
	     var markup = repo.username;
	     markup += repo.realname;
	     var markup = "<div class='select2-result-repository clearfix'>" + "<div class='select2-result-repository__meta'>"
	       + "<div class='select2-result-repository__title'>" + repo.id + "</div>";
	     if (repo.realname) {
	      markup += "<div class='select2-result-repository__description'>" + repo.test + "</div>";
	     }
/* 	     markup += "<div class='select2-result-repository__statistics'>"
	       + "<div class='select2-result-repository__forks'><i class='fa fa-user'></i> 下级会员数" + repo.children_count + " </div>"
	       + "</div>" + "</div></div>"; */
	     return markup;
	    }, 
	    templateSelection : function(repo) {
	     return repo.realname || repo.text;
	    }// 列表中选择某一项后显示到文本框的内容
	   });
	
	    $("#cmBrand").off("select2:select").on("select2:select",function(e){ 
	    	cmTerTypeReload();
		});
	
	
	
	
	
	
}

//当前终端型号cmTerType 重新加载
function cmTerTypeReload(){
	var cmBrand = $("#cmBrand").val();
	if(cmBrand==null || cmBrand==""){
		$("#cmTerType").empty();
		$("#cmTerType").append("<option value=''>全部</option>"); 
	}
	
/* 	$.ajax({
	    type: "post",
	    url:  "${basePath}xfzzlBigData/cmTerTypeReload.do",
	    contentType: 'application/x-www-form-urlencoded',
	    data: $("#memuForm").serialize(),
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	cmTerType(result);
	    }
	}); */
	
	
	 var tableName = $("#tableName").val();
	 var dataBaseTable= "";
	 if("xfz"==tableName){
		 dataBaseTable = "ZD_RESULT_CONSUMER_ZL_XFZ_";
	 }else if("zdtz"==tableName){
		 dataBaseTable = "ZD_RESULT_CONSUMER_ZL_XFZ_";
	 }else if("jlfx"==tableName){
		 dataBaseTable = "ZD_RESULT_CONSUMER_ZL_XFZ_";
	 }
   
	 $('#cmTerType').select2({
	    language : "zh-CN",// 指定语言为中文，国际化才起效
	    inputMessage :"",// 添加默认参数
	    placeholder: "请选择",
        placeholderOption: "first",
	    allowClear: true,
	    ajax : {
	     url : "${basePath}xfzzlBigData/cmTerTypeReload.do",
	     dataType : 'json',
	     delay : 250,// 延迟显示k
	     data : function(params) {
	      return {
	       cmTerType :params.term, // 搜索框内输入的内容，传递到Java后端的parameter为username
	       page : params.page,// 第几页，分页哦
	       rows : 10,// 每页显示多少行
	       statMo : $("#statMo").val(),
	       cmccCtyNam: $("#cmccCtyNam").val(),
	       cmBrand: $("#cmBrand").val(),
	       cmccCntyNam: $("#cmccCntyNam").val(),
	       tableName: dataBaseTable+$("#statMo").val(),//'ZD_RESULT_CONSUMER_ZL_XFZ_201901'
	       brndCd:$("#brndCd").val(),
	      };
	     },
	     // 分页
	     processResults : function(data, params) {
	      params.page = params.page || 1;
	      return {
	       results : data.list,// 后台返回的数据集
	       pagination : {
	        more : params.page < data.total// 总页数为10，那么1-9页的时候都可以下拉刷新
	       }
	      };
	     },
	     cache : false
	    },
	    escapeMarkup : function(markup) {
	     return markup;
	    }, // let our custom formatter work
	    minimumInputLength : 0,// 最少输入一个字符才开始检索
	    templateResult : function(repo) {// 显示的结果集格式，这里需要自己写css样式，可参照demo
	     // 正在检索
	     if (repo.loading)
	      return repo.text;
	     var markup = repo.username;
	     markup += repo.realname;
	     var markup = "<div class='select2-result-repository clearfix'>" + "<div class='select2-result-repository__meta'>"
	       + "<div class='select2-result-repository__title'>" + repo.id + "</div>";
	     if (repo.realname) {
	      markup += "<div class='select2-result-repository__description'>" + repo.test + "</div>";
	     }
/* 	     markup += "<div class='select2-result-repository__statistics'>"
	       + "<div class='select2-result-repository__forks'><i class='fa fa-user'></i> 下级会员数" + repo.children_count + " </div>"
	       + "</div>" + "</div></div>"; */
	     return markup;
	    }, 
	    templateSelection : function(repo) {
	     return repo.realname || repo.text;
	    }// 列表中选择某一项后显示到文本框的内容
	   });
	
	/*     $("#cmBrand").off("select2:select").on("select2:select",function(e){ 
	    	cmTerTypeReload();
		}); */
	
	
	
	
}

//加载画像
function listPortray(ids,shapeId){
	var form = $("#memuForm").serializeObject();
	form["ids"] = ids;
	var jiAgeRak = $('#jiAgeRak').val();
	if(jiAgeRak==null || jiAgeRak==""){
		form["jiAgeRak"] =null
	}else{
		form["jiAgeRak"] = jiAgeRak.toString();
	}
	
	
	form = JSON.stringify(form);
	$.ajax({
	    type: "POST",
	    url:  "${basePath}xfzzlBigData/listPortray.do",
	    contentType: 'application/json',
	    data: form,
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	showPortrays(result,"p",ids,shapeId,listPortray);
	    	
	    	$("#billcyc_text").text($("#statMo").val());
	    }
	});
	//数目
	if(ids!=null){
		return;
	}
	$.ajax({
	    type: "POST",
	    url:  "${basePath}xfzzlBigData/getTxyhAndZxtxyh.do",
	    contentType: 'application/json',
	    data: form,
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	$("#txyh").text(isEmptyObject(result)?0:result.TXYH);
	    	$("#zxtxyh").text(isEmptyObject(result)?0:result.ZDTXYH);
	    	$("#zwtcyhs").text(isEmptyObject(result)?0:result.ZWTCYHS);
	    	
	    	$("#billcyc_xfz_1").text($("#statMo").val());
	    	$("#billcyc_xfz_2").text($("#statMo").val());
	    	$("#billcyc_xfz_3").text($("#statMo").val());
	    }
	});
}

//加载终端特征画像
function listPortrayZdtz(ids,shapeId){	
	var form = $("#memuForm").serializeObject();
	form["ids"] = ids;
	
	var jiAgeRak = $('#jiAgeRak').val();
	if(jiAgeRak==null || jiAgeRak==""){
		form["jiAgeRak"] =null
	}else{
		form["jiAgeRak"] = jiAgeRak.toString();
	}
	form = JSON.stringify(form);

	$.ajax({
	    type: "POST",
	    url:  "${basePath}xfzzlBigData/listPortrayZdtz.do",
	    contentType: 'application/json',
	    data: form,
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	showPortrays(result,"zdtz",ids,shapeId,listPortrayZdtz);
	    }
	});
	
	//数目
	if(ids!=null){
		return;
	}
	$.ajax({
	    type: "POST",
	    url:  "${basePath}xfzzlBigData/getZwzdAndXrwzd.do",
	    contentType: 'application/json',
	    data: form,
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	$("#zwzd").text(isEmptyObject(result)?0:result.ZWZD);
	    	$("#xrwzd").text(isEmptyObject(result)?0:result.XRWZD);
	    	$("#zwwlwzd").text(isEmptyObject(result)?0:result.ZWWLWZD);
	    	$("#xrwwlwzd").text(isEmptyObject(result)?0:result.XRWWLWZD);
	    	$("#zwsjzdpjjl").text(isEmptyObject(result)?0:result.ZWSJZDPJJL);
	    	$("#zwsjzdpjhjzq").text(isEmptyObject(result)?0:result.ZWSJZDPJHJZQ);
	    	
	    	
	    	$("#billcyc_zdtz_1").text($("#statMo").val());
	    	$("#billcyc_zdtz_2").text($("#statMo").val());
	    	$("#billcyc_zdtz_3").text($("#statMo").val());
	    	$("#billcyc_zdtz_4").text($("#statMo").val());
	    	$("#billcyc_zdtz_5").text($("#statMo").val());
	    	$("#billcyc_zdtz_6").text($("#statMo").val());
	    	
	    }
	});
}

//加载消费者机龄分析
function listPortrayJlfx(ids,shapeId){	
	var form = $("#memuForm").serializeObject();
	form["ids"] = ids;
	var jiAgeRak = $('#jiAgeRak').val();
	if(jiAgeRak==null || jiAgeRak==""){
		form["jiAgeRak"] =null
	}else{
		form["jiAgeRak"] = jiAgeRak.toString();
	}
	
	form = JSON.stringify(form);
	
	
	$.ajax({
	    type: "POST",
	    url:  "${basePath}xfzzlBigData/listPortrayJlfx.do",
	    contentType: 'application/json',
	    data: form,
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	showPortrays(result,"jlfx",ids,shapeId,listPortrayJlfx);
	    }
	});
	
	//数目
	if(ids!=null){
		return;
	}
	/*
$.ajax({//总览
	    type: "POST",
	    url:  "${basePath}xfzzlBigData/getJlfxList.do",
	    contentType: 'application/json',
	    data: form,
	    dataType: "json",
	    async: false,
	    success: function(result){
	    	$("#jlfb_3").text(isEmptyObject(result)?0:unit(result.JLFB_3));
	    	$("#jlfb_3_6").text(isEmptyObject(result)?0:unit(result.JLFB_3_6));
	    	$("#jlfb_6_12").text(isEmptyObject(result)?0:unit(result.JLFB_6_12));
	    	$("#jlfb_12_24").text(isEmptyObject(result)?0:unit(result.JLFB_12_24));
	    	$("#jlfb_24_36").text(isEmptyObject(result)?0:unit(result.JLFB_24_36));
	    	$("#jlfb_36_60").text(isEmptyObject(result)?0:unit(result.JLFB_36_60));
	    	$("#jlfb_60_120").text(isEmptyObject(result)?0:unit(result.JLFB_60_120));
	    	$("#jlfb_120").text(isEmptyObject(result)?0:unit(result.JLFB_120));
	    	$("#jlfb_wz").text(isEmptyObject(result)?0:unit(result.JLFB_WZ));
	    }
	});	
	*/
}

function showBrand1(){
	blockImg();
	var brand=document.getElementById("brand");
	var jiLing=document.getElementById("jiLing");
	brand.style.display="block";
	jiLing.style.display="none";
	$("#tableName").val("xfz");
	setTimeout(function () {$.unblockUI(); }, 500);//细微延迟后关闭进度效果
}

function showBrand2(){
	blockImg();
	var brand=document.getElementById("brand");
	var jiLing=document.getElementById("jiLing");
	brand.style.display="block";
	jiLing.style.display="none";
	$("#tableName").val("zdtz");
	setTimeout(function () {$.unblockUI(); }, 500);//细微延迟后关闭进度效果
}

function showJiLing(){
	blockImg();
	var brand=document.getElementById("brand");
	var jiLing=document.getElementById("jiLing");
	brand.style.display="none";
	jiLing.style.display="block";
	$("#tableName").val("jlfx");
	setTimeout(function () {$.unblockUI(); }, 1000);//细微延迟后关闭进度效果
}

function unit(value){
	if(value/100000000>1){//亿
		return (value/100000000).toFixed(2)+"亿";
	}else if(value/10000>10){//十万
		return  (value/10000).toFixed(2)+"万";
	}else{
		return value;
	}
}

//function changeColor(){
//	var jiAgeRak=$("#jiAgeRak").val();//数组
//	
//	if(jiAgeRak==null || jiAgeRak.length ==0){
//		return;
//	}
	
//	var jlfb=["jlfb_zl1","jlfb_zl2","jlfb_zl3","jlfb_zl4","jlfb_zl5","jlfb_zl6","jlfb_zl7","jlfb_zl8","jlfb_zl9"];
//	var jl_x=['小于3个月','[3-6)月','[6-12)月','[12-24)月','[24-36)月','[36-60)月','[60-120)月','大于120月','未知'];
//	var yesColor=new Array();//改颜色的id
	
//	for(var i = 0; i < jiAgeRak.length; i++){
//		var jiAge=jiAgeRak[i];
//		for(var j = 0; j < jl_x.length; j++){
//			if(jiAge==jl_x[j]){
//				yesColor.push(jlfb[j]);
//			}
//		}
//	}
//	for(var i = 0; i < jlfb.length; i++){
//		$("#"+jlfb[i]).css({"background-color":"#6666CC"});
//	}
	//	for(var i = 0; i < yesColor.length; i++){
//		$("#"+yesColor[i]).css({"background-color":"#000099"});
//	}
	
//}

</script>

</body>
</html>