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
<title>基站覆盖情况</title>
</head>

    

 
<body>

<style   type="text/css">
	.type_store{
		width: 100%;
		height: 250px;
	}
	.conditions_select li{
		float: left;
		width: 20%;
		list-style: none;
	}
	.absolute-div{
		width:100%;
	}
	.box-content{
		height:350px;
	}	
	.content>div div {
	  	color: #FFFFFF !important;
	}
	
	
	.fieldGroup{
		color:#67f8ff;
		clear:both;
	} 
	input[type="checkbox"], input[type="radio"] {
	    height: 18px;
	    width: 18px;
	}
	label {
	    font-size: 20px;
	}
	.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
	    height: 27px;
	}		
</style>

<script type="text/javascript" src="<%=basePath%>resources/js/brandCoverage/shop_cover.js?"></script>
 	<div class="row" style="">
 	 	<div  class="col-xs-6">
 	 			<div class="row"  >
 	 				<div class="col-xs-2">
 	 				   <p>
	 	 				   	<select name="cityNam" class="select" style="width: 100%;" id="citySelect">
				       		</select>
			       		</p>
 	 				</div>
 	 				<div class="col-xs-2">
 	 				   <p>
					   	     <input name="month" type="text" style="width: 100%;" readonly="readonly"class="form-text select prevMonth"
					   	  		onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M-1}',onpicked:querySubmit})" />
			       		</p>
 	 				</div>
 	 				<div class="col-xs-2"  >
 	 				   <p style="position:absolute;" class="absolute-div" >
					        <select name="termBrndNam" id="termBrndNam" style="float:left;width: 100%;" class="select_searchable">
					        </select>
			       		</p>
 	 				</div>
 	 				<div class="col-xs-2" style="margin-left: 1%">
 	 				   <p>
	 	 				   	<select name="type" class="select typeSelect" style="width: 100%;">
	 	 				   	    <option  value="0">存量基站</option>
				            	<option  value="1">新增基站</option>				            	
				       		</select>
			       		</p>
 	 				</div>
 	 			</div>
 	 	</div>
 	 	<!-- <div  class="col-xs-6">
 	 		<div class="col-xs-12"> <button type="button" class="btn btn-primary" style="width:100px;float: right;" > 导出EXCEL</button></div>
 	 	</div> -->
 	
 	</div>
 	<div class="row" style="">
 		<div  class="col-xs-4">
 					<div class="box">
		                <div class="box-head"><span class="title" title="品牌覆盖基站总数">基站总数</span></div>
		                <div class="box-content"  style="border: 1px solid #4cb3c2!important;margin-top: 10px;" id="hall_count">
		                    <!--<img src="images/m21.png">-->
		                </div>
		            </div>
 			
 		</div>
 		<div  class="col-xs-8">
 					<div class="box">
		                <div class="box-head"><span class="title" style="width:120px">基站类型</span>
		                	 <a id="ModalShow_ttttTyp" style="height:100%;margin-left:60px;">明细查询</a>	     
		                </div>
		                <div class="box-content" id="stockUser" style="border: 1px solid #4cb3c2!important;margin-top: 10px;">
		                      <ul id="myTab" class="nav nav-tabs nav-justified" style="margin-top: -5px;">
									<li class="active">
										<a href="" data-toggle="tab" class="type ttttTyp" value="T1" title="">
											高价值基站
										</a>
									</li>
									<li><a href="" data-toggle="tab" class="type ttttTyp" value="T2" title="">较高价值基站</a></li>
									<li><a href="" data-toggle="tab" class="type ttttTyp" value="T3" title="">偏高价值基站</a></li>
									<li><a href="" data-toggle="tab" class="type ttttTyp" value="T4" title="">偏低价价值基站</a></li>
									<li><a href="" data-toggle="tab" class="type ttttTyp" value="T5" title="">较低价值基站</a></li>
									<li><a href="" data-toggle="tab" class="type ttttTyp" value="T6" title="">低价值基站</a></li>
								</ul>
								<div id="myTabContent" class="tab-content">
									<div class="tab-pane fade in active" id="">
										 
											<div class="col-xs-6">
												 <p style="color: #54abd6;margin-left: 10px;"><span style="background-color:#54abd6 ">|&nbsp;</span><label>基站覆盖占比</label></p>
												 <div id="store_coverage"  class="type_store">
											 
												 </div>
											
											</div>
											<div class="col-xs-6">
												 <p style="color: #54abd6;margin-left: 10px;"><span style="background-color:#54abd6 ">|&nbsp;</span><label>基站覆盖客户数</label></p>
												 <div id="store_customer_number" class="type_store">
											 
												 </div>
											
											</div>
									</div>
								</div>
		                </div>
		            </div>
 		</div>
 	
 	</div>
	<div class="row" style="margin-top: 25px;">
 		<div  class="col-xs-4">
 					<div class="box">
		                <div class="box-head"><span class="title" title="新增品牌用户数">新增客户数</span></div>
		                <div class="box-content"   style="border: 1px solid #4cb3c2!important;margin-top: 10px;" id="customer_num">
		                    <!--<img src="images/m21.png">-->
		                </div>
		            </div>
 			
 		</div>
 		<div  class="col-xs-8">
 					<div class="box">
		                <div class="box-head">
		                	<span class="title" style="width:120px;">基站覆盖类型</span>
		                	<a id="ModalShow_brndFfffTyp" style="height:100%;margin-left:60px;">明细查询</a>	  
		                </div>
		                <div class="box-content" id="stockUser" style="border: 1px solid #4cb3c2!important;margin-top: 10px;">
		                      <ul id="myTab" class="nav nav-tabs nav-justified" style="margin-top: -5px;">
									<li class="active">
										<a href="" data-toggle="tab" class="type brndFfffTyp" value="高覆盖" title="">
											品牌高覆盖
										</a>
									</li>
									<li><a href="" data-toggle="tab" class="type brndFfffTyp" value="中高覆盖" title="">品牌中高覆盖</a></li>
									<li><a href="" data-toggle="tab" class="type brndFfffTyp" value="中覆盖" title="">品牌中覆盖</a></li>
									<li><a href="" data-toggle="tab" class="type brndFfffTyp" value="中低覆盖" title="">品牌中低覆盖</a></li>
									<li><a href="" data-toggle="tab" class="type brndFfffTyp" value="低覆盖" title="">品牌低覆盖</a></li>
									<li><a href="" data-toggle="tab" class="type brndFfffTyp" value="超低覆盖" title="">品牌超低覆盖</a></li>
									<li><a href="" data-toggle="tab" class="type brndFfffTyp" value="零覆盖" title="">品牌零覆盖</a></li>

								</ul>
								<div id="myTabContent" class="tab-content">
 								    <div class="tab-pane fade in active" id="T1">
										    <div class="col-xs-6">
												 <p style="color: #54abd6;margin-left: 10px;"><span style="background-color:#54abd6 ">|&nbsp;</span><label>基站覆盖占比</label></p>
												 <div id="store_coverage2"  class="type_store">
											 
												 </div>
											
											</div>
											<div class="col-xs-6">
												 <p style="color: #54abd6;margin-left: 10px;"><span style="background-color:#54abd6 ">|&nbsp;</span><label>基站覆盖客户数</label></p>
												 <div id="store_customer_number2" class="type_store">
											 
												 </div>
											
											</div>
									</div>
								</div>
		                </div>
		            </div>
 		</div>
 	
 	</div>


<!-- ttttTyp 各类型门店的覆盖程度 start-->
<div class="modal fade" id="modal_ttttTyp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  aria-hidden="true" data-dismiss="modal" style="">
  <div class="modal-dialog" role="document" style=" width: 80%;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">| 定制查询 </h4>
      </div>
      <div class="modal-body" id="frame_type_all" style="">
          <div class="row" style="">
          
      	  <div class="row">
      	  	<span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;查询条件 &nbsp;</span>
      	  </div> 
		  <div class="row" id="" >
				<div class="col-xs-2">
				   <p>
					   	<select name="ttttTyp_cityNam" class="select" style="width: 100%;" onchange="ttttTyp_getbrands()">
	       				</select>
	      			</p>
				</div>
				<div class="col-xs-2">
				    <p>
		   	     		<input name="ttttTyp_month" type="text" style="width: 100%;" readonly="readonly" class="form-text select"
		   	  			onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M-1}',onpicked:ttttTyp_getbrands})" />
	      			</p>
				</div>
				<div class="col-xs-2">
				    <p>
		   	     		<input name="end_month" type="text" style="width: 100%;" readonly="readonly" class="form-text select"
		   	  			onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M-1}',onpicked:ttttTyp_getbrands})" />
	      			</p>
				</div>
				<div class="col-xs-2"  >
				   	<p style="position:absolute;" class="absolute-div" >
		        		<select name="ttttTyp_termBrndNam" id="ttttTyp_termBrndNam" style="float:left;width: 100%;" class="select_searchable">
		        		</select>
	      			</p>
				</div>
				<div class="col-xs-2" style="">
				    <p>
					   	<select name="ttttTyp_type" class="select typeSelect" style="width: 96%;">
					   	    <option  value="0">存量门店</option>
	            			<option  value="1">新增门店</option>				            	
	       				</select>
	      			</p>
				</div>
				
				<div class="col-xs-2" style=""> 
					<button type="button" onclick="jqgrid_reload('ttttTyp_list',getparam_ttttTyp())" class="btn btn-primary" style="width:100%"> 查询</button>
				</div> 
				
			    <div class="col-xs-2" style=""> 
					<button type="button" 
						onclick="exportExcel('ttttTyp_list','基站覆盖情况-基站类型')" 
						class="btn btn-primary" style="width:100%" > 导出EXCEL</button>
				</div>								
		  </div>      	       

      	  <div class="row">
      	  	<span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;可选信息</span>
      	  </div>
		  <div  class="col-xs-12">
			   <div class="panel panel-default jqgrid_width">
				    <div class="panel-body" >
			        	<div  class="col-xs-12" id="">
				       		 <ul class="conditions_select" id="query_ttttTyp_fields_ul">
				       		        <li class="fieldGroup"><label><input type="checkbox" class="type1_ttttTyp_all" checked/>&nbsp;基础信息：</label></li>	    
				       		    	<li><label><input type="checkbox" value="cityNam" class="type1_ttttTyp" checked />&nbsp;地市</label></li> 
				       		    	<li><label><input type="checkbox" value="month" class="type1_ttttTyp" checked />&nbsp;月份</label></li> 
				       		    	<li><label><input type="checkbox" value="termBrndNam" class="type1_ttttTyp" checked />&nbsp;品牌名称</label></li> 
				       		    	<li><label><input type="checkbox" value="type" class="type1_ttttTyp" checked />&nbsp;类型(新增/存量)</label></li> 
				       		    	<li><label><input type="checkbox" value="cellCnt" class="type1_ttttTyp" checked />&nbsp;基站总数</label></li> 
				       		    	<li><label><input type="checkbox" value="num" class="type1_ttttTyp" checked />&nbsp;客户数</label></li> 
				       		    	<li><label><input type="checkbox" value="ttttTyp" class="type1_ttttTyp" checked />&nbsp;基站类型</label></li> 
				       		    	
				       		    	<li class="fieldGroup"><label><input type="checkbox" class="type2_ttttTyp_all" />&nbsp;覆盖占比：</label></li>	 
				       		    	<li><label><input type="checkbox" value="rete01" class="type2_ttttTyp" />&nbsp;高覆盖基站占比 </label></li>
				       		    	<li><label><input type="checkbox" value="rete03" class="type2_ttttTyp" />&nbsp;中高覆盖基站占比</label></li> 
				       		    	<li><label><input type="checkbox" value="rete05" class="type2_ttttTyp" />&nbsp;中覆盖基站占比</label></li> 
				       		    	<li><label><input type="checkbox" value="rete07" class="type2_ttttTyp" />&nbsp;中低覆盖基站占比</label></li> 
				       		    	<li><label><input type="checkbox" value="rete09" class="type2_ttttTyp" />&nbsp;低覆盖基站占比</label></li> 
				       		    	<li><label><input type="checkbox" value="rete11" class="type2_ttttTyp" />&nbsp;超低覆盖基站占比</label></li> 
				       		    	<li><label><input type="checkbox" value="rete13" class="type2_ttttTyp" />&nbsp;零覆盖基站占比</label></li>
				       		    	 
				       		    	<li class="fieldGroup"><label><input type="checkbox" class="type3_ttttTyp_all"/>&nbsp;覆盖客户数占比：</label></li>	 
				       		    	<li><label><input type="checkbox" value="rete02" class="type3_ttttTyp" />&nbsp;高覆盖基站覆盖客户数占比</label></li> 				       		    	
				       		    	<li><label><input type="checkbox" value="rete04" class="type3_ttttTyp" />&nbsp;中高覆盖基站覆盖客户数占比</label></li> 				       		    	
				       		    	<li><label><input type="checkbox" value="rete06" class="type3_ttttTyp" />&nbsp;中覆盖基站覆盖客户数占比</label></li> 				       		    	
				       		    	<li><label><input type="checkbox" value="rete08" class="type3_ttttTyp" />&nbsp;中低覆盖基站覆盖客户数占比</label></li> 				       		    	
				       		    	<li><label><input type="checkbox" value="rete10" class="type3_ttttTyp" />&nbsp;低覆盖基站覆盖客户数占比</label></li> 				       		    	
				       		    	<li><label><input type="checkbox" value="rete12" class="type3_ttttTyp" />&nbsp;超低覆盖基站覆盖客户数占比</label></li> 				       		    	 
				       		    	<li><label><input type="checkbox" value="rete14" class="type3_ttttTyp" />&nbsp;零覆盖基站覆盖客户数占比</label></li> 

				       		 </ul> 
			        	</div>				       
				    </div>
			   </div>
		  </div>

<!--       	  <div class="row">
      	  	<span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;所选信息</span>
      	  </div>
		  <div  class="col-xs-12">
			   <div class="panel panel-default" style="  ">
				    <div class="panel-body" >
			        	<div  class="col-xs-12" id="query_conditions">
				       		 <ul class="conditions_select" id="query_ttttTyp_conditions_ul">
       		    
				       		 </ul> 
			        	</div>				       
				    </div>
			   </div>
		  </div> -->
          
      	  <div class="row">
      	  	<span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;查询结果</span>
	       	<div class="col-xs-12" style="margin-left:6px;padding-right:15px;">
	    	     <table id="ttttTyp_list"></table> 
				 <div id="ttttTyp_pager"></div>
			</div>        	  	
      	  </div>
         
          
      </div>
    </div>
  </div>
</div>
</div>
<!-- ttttTyp 各类型门店的覆盖程度 end-->	
 	
<!-- brndFfffTyp 各覆盖程度中各门店类型占比 start-->
<div class="modal fade" id="modal_brndFfffTyp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  aria-hidden="true" style="">
  <div class="modal-dialog" role="document" style=" width: 80%;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">| 定制查询 </h4>
      </div>
      <div class="modal-body" id="frame_type_all" style="">
          <div class="row" style="">
          
      	  <div class="row" id="modal_brndFfffTyp_relation_condition">
      	  	<span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;查询条件 &nbsp;</span>
      	  </div>
		  <div class="row"  >
				<div class="col-xs-2">
				   <p>
					   	<select name="brndFfffTyp_cityNam" class="select" style="width: 100%;;" id="citySelect" onchange="brndFfffTyp_getbrands()">
	       				</select>
	      			</p>
				</div>
				<div class="col-xs-2">
				    <p>
		   	     		<input name="brndFfffTyp_month" type="text" style="width: 100%;" readonly="readonly"class="form-text select"
		   	  			onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M-1}',onpicked:brndFfffTyp_getbrands})" />
	      			</p>
				</div>
				<div class="col-xs-2">
				    <p>
		   	     		<input name="ends_month" type="text" style="width: 100%;" readonly="readonly" class="form-text select"
		   	  			onClick="WdatePicker({dateFmt:'yyyyMM',maxDate:'%y-{%M-1}',onpicked:ttttTyp_getbrands})" />
	      			</p>
				</div>
				<div class="col-xs-2"  >
				   	<p style="position:absolute;" class="absolute-div" >
		        		<select name="brndFfffTyp_termBrndNam" id="brndFfffTyp_termBrndNam" style="float:left;width: 96%;" class="select_searchable">
		        		</select>
	      			</p>
				</div>
				<div class="col-xs-2" style="">
				    <p>
					   	<select name="brndFfffTyp_type" class="select typeSelect" style="width: 100%;">
					   	    <option  value="0">存量门店</option>
	            			<option  value="1">新增门店</option>				            	
	       				</select>
	      			</p>
				</div>
				
				<div class="col-xs-2" style=""> 
					<button type="button" onclick="jqgrid_reload('brndFfffTyp_list',getparam_brndFfffTyp())" class="btn btn-primary" style="width:100%"> 查询</button>
				</div> 	
				
			    <div class="col-xs-2" style=""> 
					<button type="button" 
						onclick="exportExcel('brndFfffTyp_list','基站覆盖情况-基站覆盖类型')" 
						class="btn btn-primary" style="width:100%" > 导出EXCEL</button>
				</div>									
		  </div>      	        

      	  <div class="row">
      	  	<span class="col-xs-12" style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;可选信息</span>      	  
		  <div  class="col-xs-12">
			   <div class="panel panel-default jqgrid_width" style="  ">
				    <div class="panel-body" >
			        	<div  class="col-xs-12" id="query_conditions">
				       		 <ul class="conditions_select" id="query_brndFfffTyp_fields_ul">	    
				       		      <li class="fieldGroup"><label><input type="checkbox" class="type1_brndFfffTyp_all" checked/>&nbsp;基础信息：</label></li>	    
				       		    	<li><label><input type="checkbox" value="cityNam" class="type1_brndFfffTyp" checked />&nbsp;地市</label></li> 
				       		    	<li><label><input type="checkbox" value="month" class="type1_brndFfffTyp" checked />&nbsp;月份</label></li> 
				       		    	<li><label><input type="checkbox" value="termBrndNam" class="type1_brndFfffTyp" checked />&nbsp;品牌名称</label></li> 
				       		    	<li><label><input type="checkbox" value="type" class="type1_brndFfffTyp" checked />&nbsp;类型(新增/存量)</label></li> 
				       		    	<li><label><input type="checkbox" value="cellCnt" class="type1_brndFfffTyp" checked />&nbsp;基站总数</label></li> 
				       		    	<li><label><input type="checkbox" value="num" class="type1_brndFfffTyp" checked />&nbsp;客户数</label></li> 
				       		    	<li><label><input type="checkbox" value="brndFfffTyp" class="type1_brndFfffTyp" checked />&nbsp;基站类型</label></li> 
				       		    	
				       		    	<li class="fieldGroup"><label><input type="checkbox" class="type2_brndFfffTyp_all" />&nbsp;基站占比：</label></li>	 
				       		    	<li><label><input type="checkbox" value="rete01" class="type2_brndFfffTyp" />&nbsp;T1基站占比</label></li>
				       		    	<li><label><input type="checkbox" value="rete03" class="type2_brndFfffTyp" />&nbsp;T2基站占比</label></li> 
				       		    	<li><label><input type="checkbox" value="rete05" class="type2_brndFfffTyp" />&nbsp;T3基站占比</label></li> 
				       		    	<li><label><input type="checkbox" value="rete07" class="type2_brndFfffTyp" />&nbsp;T4基站占比</label></li> 
				       		    	<li><label><input type="checkbox" value="rete09" class="type2_brndFfffTyp" />&nbsp;T5基站占比</label></li> 
				       		    	<li><label><input type="checkbox" value="rete11" class="type2_brndFfffTyp" />&nbsp;T6基站占比</label></li> 
				       		    	 
				       		    	<li class="fieldGroup"><label><input type="checkbox" class="type3_brndFfffTyp_all"/>&nbsp;基站客户数占比：</label></li>	 
				       		    	<li><label><input type="checkbox" value="rete02" class="type3_brndFfffTyp" />&nbsp;T1基站客户数占比</label></li> 				       		    	
				       		    	<li><label><input type="checkbox" value="rete04" class="type3_brndFfffTyp" />&nbsp;T1基站客户数占比</label></li> 				       		    	
				       		    	<li><label><input type="checkbox" value="rete06" class="type3_brndFfffTyp" />&nbsp;T1基站客户数占比</label></li> 				       		    	
				       		    	<li><label><input type="checkbox" value="rete08" class="type3_brndFfffTyp" />&nbsp;T1基站客户数占比</label></li> 				       		    	
				       		    	<li><label><input type="checkbox" value="rete10" class="type3_brndFfffTyp" />&nbsp;T1基站客户数占比</label></li> 				       		    	
				       		    	<li><label><input type="checkbox" value="rete12" class="type3_brndFfffTyp" />&nbsp;T1基站客户数占比</label></li> 			       		    		    
				       		 </ul> 
			        	</div>				       
				    </div>
			   </div>
		  </div>
		  </div>
          
      	  <div class="row">
      	  	<span class=" " style="color: yellow; margin-left: 12px;" ><span >&nbsp;*</span>&nbsp;查询结果</span>
	       	<div class="col-xs-12" style="margin-left:6px;padding-right:15px;">
	    	     <table id="brndFfffTyp_list"></table> 
				 <div id="brndFfffTyp_pager"></div>
			</div>        	  	
      	  </div>
      	          
      </div>
    </div>
  </div>
</div>
</div>
<!-- brndFfffTyp 各覆盖程度中各门店类型占比 end--> 		


<script type="text/javascript">
$(document).ready(function() {	
	querySubmit();
	brndFfffTyp_jqgridInit();
	ttttTyp_jqgridInit();
	
	$(".typeSelect").click(function(){
		querySubmit();
	});
	//给ul的li绑点点击事件
	$(".type").click(function(){
		var data = {};
		data["cityNam"] = $("select[name='cityNam']").val();
		data["month"] = $("input[name='month']").val();
		data["termBrndNam"] = $("select[name='termBrndNam']").val();
		data["type"] = $("select[name='type']").val();
		
		if($(this).hasClass("brndFfffTyp")){
			data["brndFfffTyp"] = $(this).attr("value");
		}else{
			data["ttttTyp"] = $(this).attr("value");
		}

		$.ajax({
		    type: "post",
		    url:  "${basePath}/baseStationCoverage/getShopCover.do",
		    contentType: 'application/json',
		    data: JSON.stringify(data),
		    dataType: "json",
		    async: true,
		    success: function(result){
		    	showNumCnt(result.months,result.cnts,result.nums);
		    	if("brndFfff" in result){
		    		brndFfff(result.brndFfff);
		    	}else{
			    	brndTttt(result.brndTttt);	    		
		    	}
		    }
		});
	});
	
	
    var arr = ['type1_ttttTyp','type2_ttttTyp','type3_ttttTyp','type1_brndFfffTyp','type2_brndFfffTyp','type3_brndFfffTyp'];
    for(var h=0; h<arr.length; h++){
    	var cls = arr[h];
    	var all_cls = cls+"_all";
    	ttttTyp_quanxuan(all_cls,cls);
    } 
    citySelectInit($("select[name='ttttTyp_cityNam']"));
    citySelectInit($("select[name='brndFfffTyp_cityNam']"));
	
	
    //页面传过来的查询条件
	$("#ModalShow_ttttTyp").click(function() {    	
    	$("select[name='ttttTyp_cityNam']").val($("select[name='cityNam']").val());
		$("input[name='ttttTyp_month']").val($("input[name='month']").val());
		$("input[name='ttttTyp_type']").val($("input[name='type']").val());
		
   		var termBrnds = getAllOption("#termBrndNam");
		var termBrnd = $("select[name='termBrndNam']").val();
		$("#ttttTyp_termBrndNam").empty();
		if(termBrnds.length>0){
			 $("#ttttTyp_termBrndNam").select2({data: termBrnds});
			 $("#ttttTyp_termBrndNam").val(termBrnd).trigger("change"); 
		}	   	   
	    
        setTimeout(function(){jqgrid_reload("ttttTyp_list",{})},200);
        
        $('#modal_ttttTyp').modal('show');
    }); 
	
	$("#ModalShow_brndFfffTyp").click(function() {
    	$("select[name='brndFfffTyp_cityNam']").val($("select[name='cityNam']").val());
		$("input[name='brndFfffTyp_month']").val($("input[name='month']").val());
		$("input[name='brndFfffTyp_type']").val($("input[name='type']").val());
		
   		var termBrnds = getAllOption("#termBrndNam");
		var termBrnd = $("select[name='termBrndNam']").val();
		$("#brndFfffTyp_termBrndNam").empty();
		if(termBrnds.length>0){
			 $("#brndFfffTyp_termBrndNam").select2({data: termBrnds});
			 $("#brndFfffTyp_termBrndNam").val(termBrnd).trigger("change"); 
		}
	    
        setTimeout(function(){jqgrid_reload("brndFfffTyp_list",{})},200);
        
        $('#modal_brndFfffTyp').modal('show');
    });	
	
	//click事件会触发change事件
    $("#query_ttttTyp_fields_ul input:checkbox").click(function(){  	    	
 	    var isChecked = $(this).prop("checked");
 	    var col = $(this).val();
 	    if(isChecked){
 	    	jQuery("#ttttTyp_list").setGridParam().showCol(col).trigger("reloadGrid");
 	    }else{
 	    	jQuery("#ttttTyp_list").setGridParam().hideCol(col).trigger("reloadGrid");
 	    }
 	    jqgrid_colChange("ttttTyp_list");
    });
	
    $("#query_brndFfffTyp_fields_ul input:checkbox").click(function(){  	    	
 	    var isChecked = $(this).prop("checked");
 	    var col = $(this).val();
 	    if(isChecked){
 	    	jQuery("#brndFfffTyp_list").setGridParam().showCol(col).trigger("reloadGrid");
 	    }else{
 	    	jQuery("#brndFfffTyp_list").setGridParam().hideCol(col).trigger("reloadGrid");
 	    }
 	    jqgrid_colChange("brndFfffTyp_list");
    });
	
	
});

//modal result ttttTyp 各类型门店的覆盖程度 
/* 初始化表格 */
function ttttTyp_jqgridInit(){
    var colNames = ['地市','月份','品牌名称','类型(新增/存量)','基站总数','客户数','基站类型',
       		    	'高覆盖基站占比','中高覆盖基站占比','中覆盖基站占比','中低覆盖基站占比','低覆盖基站占比','超低覆盖基站占比','零覆盖基站占比',
       		    	'高覆盖基站覆盖客户数占比','中高覆盖基站覆盖客户数占比','中覆盖基站覆盖客户数占比',
       		    	'中低覆盖基站覆盖客户数占比','低覆盖基站覆盖客户数占比','超低覆盖基站覆盖客户数占比','零覆盖基站覆盖客户数占比'
               ];
    var colModel = [ 
                 {name : 'cityNam',index : 'cityNam',sorttype : "string",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'month',index : 'month',sorttype : "string",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'termBrndNam',index : 'termBrndNam',sorttype : "string",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'type',index : 'type',sorttype : "string",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']},formatter:formatter_type}, 
                 {name : 'cellCnt',index : 'hallCnt',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'num',index : 'num',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'ttttTyp',index : 'ttttTyp',sorttype : "string",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},  
                 
                 {name : 'rete01',index : 'rete01',hidden:true,sorttype:"int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 	                     
                 {name : 'rete03',index : 'rete03',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete05',index : 'rete05',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete07',index : 'rete07',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete09',index : 'rete09',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete11',index : 'rete11',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete13',index : 'rete13',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 

                 {name : 'rete02',index : 'rete02',hidden:true,sorttype:"int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 	                     
                 {name : 'rete04',index : 'rete04',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete06',index : 'rete06',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete08',index : 'rete08',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete10',index : 'rete10',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete12',index : 'rete12',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete14',index : 'rete14',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},
               ];
	jqgrid_init("ttttTyp_list","ttttTyp_pager","${basePath}/baseStationCoverage/queryConditions.do",{},colNames,colModel,"termBrndNam");
};

function ttttTyp_list_setGroupHeaders(){
	  jQuery("#ttttTyp_list").jqGrid('destroyGroupHeader');
	  //合并最顶表头
	  jQuery("#ttttTyp_list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    {startColumnName: 'cityNam', numberOfColumns: 7, titleText: '基础信息'},
		    {startColumnName: 'rete01', numberOfColumns: 7, titleText: '覆盖占比'},
		    {startColumnName: 'rete02', numberOfColumns: 7, titleText: '覆盖客户数占比'},
		    ]  
	  });
}

function brndFfffTyp_jqgridInit(){
    var colNames2 = ['地市','月份','品牌名称','类型(新增/存量)','基站总数','客户数','基站类型',
       		    	'T1基站占比','T2基站占比','T3基站占比','T4基站占比','T5基站占比','T6基站占比',
       		    	'T1基站客户数占比','T2基站客户数占比','T3基站客户数占比','T4基站客户数占比','T5基站客户数占比','T6基站客户数占比'
               ];
    var colModel2 = [ 
                 {name : 'cityNam',index : 'cityNam',sorttype : "string",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'month',index : 'month',sorttype : "string",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'termBrndNam',index : 'termBrndNam',sorttype : "string",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'type',index : 'type',sorttype : "string",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']},formatter:formatter_type}, 
                 {name : 'cellCnt',index : 'hallCnt',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'num',index : 'num',sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'brndFfffTyp',index : 'brndFfffTyp',sorttype : "string",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}},  
                 
                 {name : 'rete01',index : 'rete01',hidden:true,sorttype:"int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 	                     
                 {name : 'rete03',index : 'rete03',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete05',index : 'rete05',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete07',index : 'rete07',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete09',index : 'rete09',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete11',index : 'rete11',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 

                 {name : 'rete02',index : 'rete02',hidden:true,sorttype:"int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 	                     
                 {name : 'rete04',index : 'rete04',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete06',index : 'rete06',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete08',index : 'rete08',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete10',index : 'rete10',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
                 {name : 'rete12',index : 'rete12',hidden:true,sorttype : "int",searchoptions:{sopt:['eq','lt','le','gt','ge','ne','cn']}}, 
               ];
	jqgrid_init("brndFfffTyp_list","brndFfffTyp_pager","${basePath}/baseStationCoverage/queryConditions.do",{},colNames2,colModel2,"termBrndNam");
};

function brndFfffTyp_list_setGroupHeaders(){
	  jQuery("#brndFfffTyp_list").jqGrid('destroyGroupHeader');
	  //合并最顶表头
	  jQuery("#brndFfffTyp_list").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
		    {startColumnName: 'cityNam', numberOfColumns: 7, titleText: '基础信息'},
		    {startColumnName: 'rete01', numberOfColumns: 6, titleText: '基站占比'},
		    {startColumnName: 'rete02', numberOfColumns: 6, titleText: '基站客户数占比'},
		    ]  
	  });
}

function formatter_type (cellvalue, options, rowObject) {
    if(cellvalue == 0){
        return "存量";
    }else{
        return "新增";
    }
}


function getparam_ttttTyp(){
	var data = {};	
	data["cityNam"] = $("select[name='ttttTyp_cityNam']").val();
	//data["month"] = $("input[name='ttttTyp_month']").val();
	data["startMonth"] = $("input[name='ttttTyp_month']").val();
	data["endMonth"] = $("input[name='end_month']").val();
	data["termBrndNam"] = $("select[name='ttttTyp_termBrndNam']").val();
	data["type"] = $("select[name='ttttTyp_type']").val();
	data["ttttTyp"] = "choose";  //填充任意值，以访问以该类型分类做分类的该
	return data;
}

function getparam_brndFfffTyp(){
	var data = {};	
	data["cityNam"] = $("select[name='brndFfffTyp_cityNam']").val();
	//data["month"] = $("input[name='brndFfffTyp_month']").val();
	data["startMonth"] = $("input[name='brndFfffTyp_month']").val();
	data["endMonth"] = $("input[name='ends_month']").val();
	data["termBrndNam"] = $("select[name='brndFfffTyp_termBrndNam']").val();
	data["type"] = $("select[name='brndFfffTyp_type']").val();
	data["brndFfffTyp"] = "choose";
	return data;
}


function ttttTyp_getbrands(){
	var data = {};	
	data["cityNam"] = $("select[name='ttttTyp_cityNam']").val();
	data["month"] = $("input[name='ttttTyp_month']").val();
	$.ajax({
	    type: "post",
	    url:  "${basePath}/baseStationCoverage/getBrands.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(data){	
	    	var id = "ttttTyp_termBrndNam";   
	        $("#"+id).empty();     
	        $("#"+id).select2({});
	        
	        data = isEmptyObject(data)?[]:data;
	        $.each(data,function(index,item){   	
	        	$("#"+id).append("<option value='"+item+"'>"+item+"</option>"); 
	        });   	
	    }
	});
	
	//jqgrid_reload('ttttTyp_list',getparam_ttttTyp());
}

function brndFfffTyp_getbrands(){
	var data = {};	
	data["cityNam"] = $("select[name='brndFfffTyp_cityNam']").val();
	data["month"] = $("input[name='brndFfffTyp_month']").val();
	$.ajax({
	    type: "post",
	    url:  "${basePath}/baseStationCoverage/getBrands.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(data){	
	    	var id = "brndFfffTyp_termBrndNam";   
	        $("#"+id).empty();     
	        $("#"+id).select2({});
	        
	        data = isEmptyObject(data)?[]:data;
	        $.each(data,function(index,item){   	
	        	$("#"+id).append("<option value='"+item+"'>"+item+"</option>"); 
	        });   	
	    }
	});
	
	//jqgrid_reload('brndFfffTyp_list',getparam_brndFfffTyp());
} 

//全选取消
function ttttTyp_quanxuan(type_all,type){
	$("."+type_all).click(function(){
		var isChecked = $(this).prop("checked");
		$("."+type).prop("checked",isChecked);
		
     	var jqgridId = "ttttTyp_list";
     	var cols = [];
    	$("."+type).each(function(){
         	var col = $(this).val();
         	cols.push(col);
    	});  

    	if(isChecked){
       		jQuery("#"+jqgridId).setGridParam().showCol(cols).trigger("reloadGrid");		
    	}else{
       		jQuery("#"+jqgridId).setGridParam().hideCol(cols).trigger("reloadGrid");		
    	} 
	});
}
//modal end

function getAllOption(id){
	var options = [];
	$(id+" option").each(function(i, selected) {
		var map = {};
		map["id"] = $(this).val();
		map["text"] = $(this).text();
		options.push(map);
	});
	return options;
}
function pageInit(){
	var data = {};
	data["cityNam"] = $("select[name='cityNam']").val();
	data["month"] = $("input[name='month']").val();
	data["termBrndNam"] = $("select[name='termBrndNam']").val();
	data["type"] = $("select[name='type']").val();
	data["ttttTyp"] = "t1";
	data["brndFfffTyp"] = "高覆盖";
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}/shopCover/getShopCover.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	showNumCnt(result.months,result.cnts,result.nums);
	    	brndFfff(result.brndFfff);
	    	brndTttt(result.brndTttt);
	    	showTermBrnd(result.brands);    	
	    }
	});
}


function querySubmit(){	
	var data = {};
	data["cityNam"] = $("select[name='cityNam']").val();
	data["month"] = $("input[name='month']").val();
	data["termBrndNam"] = $("select[name='termBrndNam']").val();
	data["type"] = $("select[name='type']").val();
	data["ttttTyp"] = "t1";
	data["brndFfffTyp"] = "高覆盖";
	
	$.ajax({
	    type: "post",
	    url:  "${basePath}/baseStationCoverage/getShopCover.do",
	    contentType: 'application/json',
	    data: JSON.stringify(data),
	    dataType: "json",
	    async: true,
	    success: function(result){
	    	showNumCnt(result.months,result.cnts,result.nums);
	    	brndFfff(result.brndFfff);
	    	brndTttt(result.brndTttt);
	    	if(!isEmptyObject(result.brands)){
	    		showTermBrnd(result.brands);
	    	}	
	    }
	});
}
</script>

</body>
</html>