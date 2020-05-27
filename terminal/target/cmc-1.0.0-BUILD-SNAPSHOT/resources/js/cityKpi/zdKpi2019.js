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

/* 季度更换数据呈现功能的实现  */
function selectTwo(){

//alert($(this).children('option:selected').val());  
//var p1=$(this).children('option:selected').val();//这就是selected的值  
//var p2=$('#param2').val();//获取本页面其他标签的值  
var value=$('#quarter').find("option:selected").val();
 //window.location.href="../zdResultCitykpi2019/allList?quarter="+value;//页面跳转并传参 
if(value==1){
	 $.StandardPost(basePath+'/zdResultCitykpi2019/allList.do',{'quarter':value});	
}
if(value==2){
	 $.StandardPost(basePath+'/zdResultCitykpi2019/allList02.do',{'quarter':value});	
}
if(value==3){
	$.StandardPost(basePath+'/zdResultCitykpi2019/allList03.do',{'quarter':value});
	alert("无数据！");	
}
if(value==4){
	$.StandardPost(basePath+'/zdResultCitykpi2019/allList03.do',{'quarter':value});
	alert("无数据！");	
}
}


/*导入功能的实现   */
function loadFile(file){
	
	$.ajax({
      url: '../zdResultCitykpi2019/upload.do',
      type: 'POST',
      data: new FormData($('#uploadForm')[0]),
      datatype: 'json',
      cache:false,
      traditional: true,
      contentType: false,
      processData: false,
      success: function (data) {
    	if(data=="ok"){
    		alert("导入成功！");
    		location.reload(); 
    	}else if(data=='update'){
    		alert("数据已导入请勿重复导入！");
    		location.reload(); 
    	}else if(data=='no'){
    		alert("导入失败，请导入正确的数据！");
    		location.reload(); 
    		
    	}
      },
      error: function () {
    	  alert("导入失败，请导入正确的数据！");
      }
    });
}

function selelctAll(){
	
	var quarter= $('#quarter').val();
	var cityArea=$('#cityArea').val();
	var showDu=$('#showDu').val();
	  
	//var showDu=fun();
	if(quarter!="1" && quarter!="2"){
		alert("无数据！");
		return false;
	}
	if(cityArea=="" || cityArea==null){
		alert("请选择运营中心。");
		return false;
	}
	if(showDu=="" || showDu==null){
		alert("请选择展示维度。");
		return false;
	}
	/* 如果选全省  */
	if(cityArea[0]=="1"){
		    
		    $(".guangzhou").show();  
		    $(".guangzhou1").show();
		    $(".guangzhou2").show();
			$(".guangzhou3").show();
			
			$(".shenzhen").show();
			$(".shenzhen1").show();
			$(".shenzhen2").show();
			$(".shenzhen3").show();
			
			$(".foshan").show();
			$(".foshan1").show();
			$(".foshan2").show();
			$(".foshan3").show();
			
			$(".dongguan").show();
			$(".dongguan1").show();
			$(".dongguan2").show();
			$(".dongguan3").show();
		
		 if(showDu[0]=="1"){
			   
			   var x=document.getElementById('tptable').rows[2].cells;
				var y=document.getElementById('tptable').rows[1].cells;
				var z=document.getElementById('tptable').rows[0].cells;
				/*季度行  */
				z[3].colSpan="6";
				z[4].colSpan="7";
				z[5].colSpan="6";
				z[6].colSpan="6";
				/* 运营中心行  */
				y[0].colSpan="6";
				y[1].colSpan="7";
				y[2].colSpan="6";
				y[3].colSpan="6";
				/* 地市行 */
				x[0].colSpan="1";
				x[1].colSpan="1";
				x[2].colSpan="1";
				x[3].colSpan="1";
				x[4].colSpan="1";
				x[5].colSpan="1";
				x[6].colSpan="1";
				x[7].colSpan="1";
				x[8].colSpan="1";
				x[9].colSpan="1";
				x[10].colSpan="1";
				x[11].colSpan="1";
				x[12].colSpan="1";
				x[13].colSpan="1";
				x[14].colSpan="1";
				x[15].colSpan="1";
				x[16].colSpan="1";
				x[17].colSpan="1";
				x[18].colSpan="1";
				x[19].colSpan="1";
				x[20].colSpan="1";
				x[21].colSpan="1";
				x[22].colSpan="1";
				x[23].colSpan="1";
				x[24].colSpan="1";
			
			    $(".guangzhou").show();  
			    $(".guangzhou1").show();
			    $(".guangzhou2").hide();
				$(".guangzhou3").hide();
				
				$(".shenzhen").show();
				$(".shenzhen1").show();
				$(".shenzhen2").hide();
				$(".shenzhen3").hide();
				
				$(".foshan").show();
				$(".foshan1").show();
				$(".foshan2").hide();
				$(".foshan3").hide();
				
				$(".dongguan").show();
				$(".dongguan1").show();
				$(".dongguan2").hide();
				$(".dongguan3").hide();

		 }
		 if(showDu[0]=="2"){
			 var x=document.getElementById('tptable').rows[2].cells;
				var y=document.getElementById('tptable').rows[1].cells;
				var z=document.getElementById('tptable').rows[0].cells;
				/*季度行  */
				z[3].colSpan="6";
				z[4].colSpan="7";
				z[5].colSpan="6";
				z[6].colSpan="6";
				/* 运营中心行  */
				y[0].colSpan="6";
				y[1].colSpan="7";
				y[2].colSpan="6";
				y[3].colSpan="6";
				/* 地市行 */
				x[0].colSpan="1";
				x[1].colSpan="1";
				x[2].colSpan="1";
				x[3].colSpan="1";
				x[4].colSpan="1";
				x[5].colSpan="1";
				x[6].colSpan="1";
				x[7].colSpan="1";
				x[8].colSpan="1";
				x[9].colSpan="1";
				x[10].colSpan="1";
				x[11].colSpan="1";
				x[12].colSpan="1";
				x[13].colSpan="1";
				x[14].colSpan="1";
				x[15].colSpan="1";
				x[16].colSpan="1";
				x[17].colSpan="1";
				x[18].colSpan="1";
				x[19].colSpan="1";
				x[20].colSpan="1";
				x[21].colSpan="1";
				x[22].colSpan="1";
				x[23].colSpan="1";
				x[24].colSpan="1";
			
			    $(".guangzhou").show();  
			    $(".guangzhou2").show();
			    $(".guangzhou1").hide();
				$(".guangzhou3").hide();
				
				$(".shenzhen").show();
				$(".shenzhen2").show();
				$(".shenzhen1").hide();
				$(".shenzhen3").hide();
				
				$(".foshan").show();
				$(".foshan2").show();
				$(".foshan1").hide();
				$(".foshan3").hide();
				
				$(".dongguan").show();
				$(".dongguan2").show();
				$(".dongguan1").hide();
				$(".dongguan3").hide();
			 
			 
		 } 
		 if(showDu[0]=="3"){
			 var x=document.getElementById('tptable').rows[2].cells;
				var y=document.getElementById('tptable').rows[1].cells;
				var z=document.getElementById('tptable').rows[0].cells;
				/*季度行  */
				z[3].colSpan="6";
				z[4].colSpan="7";
				z[5].colSpan="6";
				z[6].colSpan="6";
				/* 运营中心行  */
				y[0].colSpan="6";
				y[1].colSpan="7";
				y[2].colSpan="6";
				y[3].colSpan="6";
				/* 地市行 */
				x[0].colSpan="1";
				x[1].colSpan="1";
				x[2].colSpan="1";
				x[3].colSpan="1";
				x[4].colSpan="1";
				x[5].colSpan="1";
				x[6].colSpan="1";
				x[7].colSpan="1";
				x[8].colSpan="1";
				x[9].colSpan="1";
				x[10].colSpan="1";
				x[11].colSpan="1";
				x[12].colSpan="1";
				x[13].colSpan="1";
				x[14].colSpan="1";
				x[15].colSpan="1";
				x[16].colSpan="1";
				x[17].colSpan="1";
				x[18].colSpan="1";
				x[19].colSpan="1";
				x[20].colSpan="1";
				x[21].colSpan="1";
				x[22].colSpan="1";
				x[23].colSpan="1";
				x[24].colSpan="1";
			
			    $(".guangzhou").show();  
			    $(".guangzhou3").show();
			    $(".guangzhou1").hide();
				$(".guangzhou2").hide();
				
				$(".shenzhen").show();
				$(".shenzhen3").show();
				$(".shenzhen1").hide();
				$(".shenzhen2").hide();
				
				$(".foshan").show();
				$(".foshan3").show();
				$(".foshan1").hide();
				$(".foshan2").hide();
				
				$(".dongguan").show();
				$(".dongguan3").show();
				$(".dongguan1").hide();
				$(".dongguan2").hide();
			 
			 
		 }
		 if(showDu[0]=="1" && showDu[1]=="2"){
			 var x=document.getElementById('tptable').rows[2].cells;
				var y=document.getElementById('tptable').rows[1].cells;
				var z=document.getElementById('tptable').rows[0].cells;
				/*季度行  */
				z[3].colSpan="12";
				z[4].colSpan="14";
				z[5].colSpan="12";
				z[6].colSpan="12";
				/* 运营中心行  */
				y[0].colSpan="12";
				y[1].colSpan="14";
				y[2].colSpan="12";
				y[3].colSpan="12";
				/* 地市行 */
				x[0].colSpan="2";
				x[1].colSpan="2";
				x[2].colSpan="2";
				x[3].colSpan="2";
				x[4].colSpan="2";
				x[5].colSpan="2";
				x[6].colSpan="2";
				x[7].colSpan="2";
				x[8].colSpan="2";
				x[9].colSpan="2";
				x[10].colSpan="2";
				x[11].colSpan="2";
				x[12].colSpan="2";
				x[13].colSpan="2";
				x[14].colSpan="2";
				x[15].colSpan="2";
				x[16].colSpan="2";
				x[17].colSpan="2";
				x[18].colSpan="2";
				x[19].colSpan="2";
				x[20].colSpan="2";
				x[21].colSpan="2";
				x[22].colSpan="2";
				x[23].colSpan="2";
				x[24].colSpan="2";
			
			    $(".guangzhou").show();  
			    $(".guangzhou2").show();
			    $(".guangzhou1").show();
				$(".guangzhou3").hide();
				
				$(".shenzhen").show();
				$(".shenzhen2").show();
				$(".shenzhen1").show();
				$(".shenzhen3").hide();
				
				$(".foshan").show();
				$(".foshan2").show();
				$(".foshan1").show();
				$(".foshan3").hide();
				
				$(".dongguan").show();
				$(".dongguan2").show();
				$(".dongguan1").show();
				$(".dongguan3").hide();
			 
			 
		 }
		 if(showDu[0]=="1" && showDu[1]=="3"){
			 var x=document.getElementById('tptable').rows[2].cells;
				var y=document.getElementById('tptable').rows[1].cells;
				var z=document.getElementById('tptable').rows[0].cells;
				/*季度行  */
				z[3].colSpan="12";
				z[4].colSpan="14";
				z[5].colSpan="12";
				z[6].colSpan="12";
				/* 运营中心行  */
				y[0].colSpan="12";
				y[1].colSpan="14";
				y[2].colSpan="12";
				y[3].colSpan="12";
				/* 地市行 */
				x[0].colSpan="2";
				x[1].colSpan="2";
				x[2].colSpan="2";
				x[3].colSpan="2";
				x[4].colSpan="2";
				x[5].colSpan="2";
				x[6].colSpan="2";
				x[7].colSpan="2";
				x[8].colSpan="2";
				x[9].colSpan="2";
				x[10].colSpan="2";
				x[11].colSpan="2";
				x[12].colSpan="2";
				x[13].colSpan="2";
				x[14].colSpan="2";
				x[15].colSpan="2";
				x[16].colSpan="2";
				x[17].colSpan="2";
				x[18].colSpan="2";
				x[19].colSpan="2";
				x[20].colSpan="2";
				x[21].colSpan="2";
				x[22].colSpan="2";
				x[23].colSpan="2";
				x[24].colSpan="2";
			
			    $(".guangzhou").show();  
			    $(".guangzhou3").show();
			    $(".guangzhou1").show();
				$(".guangzhou2").hide();
				
				$(".shenzhen").show();
				$(".shenzhen3").show();
				$(".shenzhen1").show();
				$(".shenzhen2").hide();
				
				$(".foshan").show();
				$(".foshan3").show();
				$(".foshan1").show();
				$(".foshan2").hide();
				
				$(".dongguan").show();
				$(".dongguan3").show();
				$(".dongguan1").show();
				$(".dongguan2").hide();
			 
			 
		 }
		 if(showDu[0]=="2" && showDu[1]=="3"){
			    var x=document.getElementById('tptable').rows[2].cells;
				var y=document.getElementById('tptable').rows[1].cells;
				var z=document.getElementById('tptable').rows[0].cells;
				/*季度行  */
				z[3].colSpan="12";
				z[4].colSpan="14";
				z[5].colSpan="12";
				z[6].colSpan="12";
				/* 运营中心行  */
				y[0].colSpan="12";
				y[1].colSpan="14";
				y[2].colSpan="12";
				y[3].colSpan="12";
				/* 地市行 */
				x[0].colSpan="2";
				x[1].colSpan="2";
				x[2].colSpan="2";
				x[3].colSpan="2";
				x[4].colSpan="2";
				x[5].colSpan="2";
				x[6].colSpan="2";
				x[7].colSpan="2";
				x[8].colSpan="2";
				x[9].colSpan="2";
				x[10].colSpan="2";
				x[11].colSpan="2";
				x[12].colSpan="2";
				x[13].colSpan="2";
				x[14].colSpan="2";
				x[15].colSpan="2";
				x[16].colSpan="2";
				x[17].colSpan="2";
				x[18].colSpan="2";
				x[19].colSpan="2";
				x[20].colSpan="2";
				x[21].colSpan="2";
				x[22].colSpan="2";
				x[23].colSpan="2";
				x[24].colSpan="2";
			
			    $(".guangzhou").show();  
			    $(".guangzhou3").show();
			    $(".guangzhou2").show();
				$(".guangzhou1").hide();
				
				$(".shenzhen").show();
				$(".shenzhen3").show();
				$(".shenzhen2").show();
				$(".shenzhen1").hide();
				
				$(".foshan").show();
				$(".foshan3").show();
				$(".foshan2").show();
				$(".foshan1").hide();
				
				$(".dongguan").show();
				$(".dongguan3").show();
				$(".dongguan2").show();
				$(".dongguan1").hide();
			 
			 
		 }
		 if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3"){
			   
			 var x=document.getElementById('tptable').rows[2].cells;
				var y=document.getElementById('tptable').rows[1].cells;
				var z=document.getElementById('tptable').rows[0].cells;
				/*季度行  */
				z[3].colSpan="18";
				z[4].colSpan="21";
				z[5].colSpan="18";
				z[6].colSpan="18";
				/* 运营中心行  */
				y[0].colSpan="18";
				y[1].colSpan="21";
				y[2].colSpan="18";
				y[3].colSpan="18";
				/* 地市行 */
				x[0].colSpan="3";
				x[1].colSpan="3";
				x[2].colSpan="3";
				x[3].colSpan="3";
				x[4].colSpan="3";
				x[5].colSpan="3";
				x[6].colSpan="3";
				x[7].colSpan="3";
				x[8].colSpan="3";
				x[9].colSpan="3";
				x[10].colSpan="3";
				x[11].colSpan="3";
				x[12].colSpan="3";
				x[13].colSpan="3";
				x[14].colSpan="3";
				x[15].colSpan="3";
				x[16].colSpan="3";
				x[17].colSpan="3";
				x[18].colSpan="3";
				x[19].colSpan="3";
				x[20].colSpan="3";
				x[21].colSpan="3";
				x[22].colSpan="3";
				x[23].colSpan="3";
				x[24].colSpan="3";
			 
			    $(".guangzhou").show();  			    
			    $(".guangzhou1").show();
			    $(".guangzhou2").show();
				$(".guangzhou3").show();
				
				$(".shenzhen").show();
				$(".shenzhen1").show();
				$(".shenzhen2").show();
				$(".shenzhen3").show();
				
				$(".foshan").show();
				$(".foshan1").show();
				$(".foshan2").show();
				$(".foshan3").show();
				
				$(".dongguan").show();
				$(".dongguan1").show();
				$(".dongguan2").show();
				$(".dongguan3").show();
		 }
		 
	}
	
  // <!--  $.StandardPost(basePath+'/zdResultCitykpi2019/allList.do',{'quarter':quarter}) -->
//<!-- 如果选择广东运营中心-->
    if(cityArea[0]=="2"){
    	
    	
    	$(".shenzhen").hide();
		$(".shenzhen1").hide();
		$(".shenzhen2").hide();
		$(".shenzhen3").hide();
    	
    	$(".guangzhou").show();
		$(".guangzhou1").show();
		$(".guangzhou2").show();
		$(".guangzhou3").show();
		$(".foshan").hide();
		$(".foshan1").hide();
		$(".foshan2").hide();
		$(".foshan3").hide();
		$(".dongguan").hide();
		$(".dongguan1").hide();
		$(".dongguan2").hide();
		$(".dongguan3").hide();
		//如果只选指标值
		if(showDu[0]=="1"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			y[0].colSpan="6";
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			    $(".guangzhou1").show();
			    $(".guangzhou2").hide();
	    		$(".guangzhou3").hide(); 
 
		}
		
		if(showDu[0]=="2"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			y[0].colSpan="6";
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			$(".guangzhou2").show();
			$(".guangzhou1").hide();
    		$(".guangzhou3").hide(); 
			
		}
		if(showDu[0]=="3"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			y[0].colSpan="6";
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			$(".guangzhou3").show();
			$(".guangzhou1").hide();
    		$(".guangzhou2").hide(); 
			
		}
		
		
		if(showDu[0]=="1" && showDu[1]=="2"){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			y[0].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			 $(".guangzhou1").show();
			 $(".guangzhou2").show();
			 $(".guangzhou3").hide(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="3"){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			y[0].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			 $(".guangzhou1").show();
			 $(".guangzhou3").show();
			 $(".guangzhou2").hide(); 
			
		}
		if(showDu[0]=="2" && showDu[1]=="3"){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			y[0].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			 $(".guangzhou2").show();
			 $(".guangzhou3").show();
			 $(".guangzhou1").hide(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="18";
			y[0].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			 $(".guangzhou1").show();
			 $(".guangzhou2").show();
			 $(".guangzhou3").show();
			
		}	
		
		}
  /*如果选择深圳运营中心  。。。。。。。。。。。。。。。。。   */   
		
    if(cityArea[0]=="3"){
		
    	$(".shenzhen").show();
		$(".shenzhen1").show();
		$(".shenzhen2").show();
		$(".shenzhen3").show();
    	
    	$(".guangzhou").hide();
		$(".guangzhou1").hide();
		$(".guangzhou2").hide();
		$(".guangzhou3").hide();
		$(".foshan").hide();
		$(".foshan1").hide();
		$(".foshan2").hide();
		$(".foshan3").hide();
		$(".dongguan").hide();
		$(".dongguan1").hide();
		$(".dongguan2").hide();
		$(".dongguan3").hide();
		//如果只选指标值
		if(showDu[0]=="1"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[4].colSpan="7";
			y[1].colSpan="7";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			    $(".shenzhen1").show();
			    $(".shenzhen2").hide();
	    		$(".shenzhen3").hide(); 
 
		}
		
		if(showDu[0]=="2"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[4].colSpan="7";
			y[1].colSpan="7";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			$(".shenzhen2").show();
			$(".shenzhen1").hide();
    		$(".shenzhen3").hide(); 
			
		}
		if(showDu[0]=="3"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[4].colSpan="7";
			y[1].colSpan="7";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			$(".shenzhen3").show();
			$(".shenzhen1").hide();
    		$(".shenzhen2").hide(); 
			
		}
		
		
		if(showDu[0]=="1" && showDu[1]=="2"){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[4].colSpan="14";
			y[1].colSpan="14";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			 $(".shenzhen1").show();
			 $(".shenzhen2").show();
			 $(".shenzhen3").hide(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="3"){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[4].colSpan="14";
			y[1].colSpan="14";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			 $(".shenzhen1").show();
			 $(".shenzhen3").show();
			 $(".shenzhen2").hide(); 
			
		}
		if(showDu[0]=="2" && showDu[1]=="3"){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[4].colSpan="14";
			y[1].colSpan="14";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			 $(".shenzhen2").show();
			 $(".shenzhen3").show();
			 $(".shenzhen1").hide(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[4].colSpan="21";
			y[1].colSpan="21";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";
			 $(".shenzhen1").show();
			 $(".shenzhen2").show();
			 $(".shenzhen3").show();
			
		}	
		
		}	
	
  /* 如果选择佛山运营中心  ///////////////////////////// */
  
    if(cityArea[0]=="4"){
    	
    	
    	$(".shenzhen").hide();
		$(".shenzhen1").hide();
		$(".shenzhen2").hide();
		$(".shenzhen3").hide();
    	
    	$(".guangzhou").hide();
		$(".guangzhou1").hide();
		$(".guangzhou2").hide();
		$(".guangzhou3").hide();
		$(".foshan").show();
		$(".foshan1").show();
		$(".foshan2").show();
		$(".foshan3").show();
		$(".dongguan").hide();
		$(".dongguan1").hide();
		$(".dongguan2").hide();
		$(".dongguan3").hide();
		//如果只选指标值
		if(showDu[0]=="1"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[5].colSpan="6";
			y[2].colSpan="6";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			    $(".foshan1").show();
			    $(".foshan2").hide();
	    		$(".foshan3").hide(); 
 
		}
		
		if(showDu[0]=="2"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[5].colSpan="6";
			y[2].colSpan="6";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			$(".foshan2").show();
			$(".foshan1").hide();
    		$(".foshan3").hide(); 
			
		}
		if(showDu[0]=="3"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[5].colSpan="6";
			y[2].colSpan="6";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			$(".foshan3").show();
			$(".foshan1").hide();
    		$(".foshan2").hide(); 
			
		}
		
		
		if(showDu[0]=="1" && showDu[1]=="2"){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[5].colSpan="12";
			y[2].colSpan="12";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			 $(".foshan1").show();
			 $(".foshan2").show();
			 $(".foshan3").hide(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="3"){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[5].colSpan="12";
			y[2].colSpan="12";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			 $(".foshan1").show();
			 $(".foshan3").show();
			 $(".foshan2").hide(); 
			
		}
		if(showDu[0]=="2" && showDu[1]=="3"){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[5].colSpan="12";
			y[2].colSpan="12";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			 $(".foshan2").show();
			 $(".foshan3").show();
			 $(".foshan1").hide(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[5].colSpan="18";
			y[2].colSpan="18";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			x[16].colSpan="3";
			x[17].colSpan="3";
			x[18].colSpan="3";
			 $(".foshan1").show();
			 $(".foshan2").show();
			 $(".foshan3").show();
			
		}	
		
		}
  
  /*如果选择东莞运营 中心////////////////////////////////////////////  */

    if(cityArea[0]=="5"){
    	
    	
    	$(".shenzhen").hide();
		$(".shenzhen1").hide();
		$(".shenzhen2").hide();
		$(".shenzhen3").hide();
    	
    	$(".guangzhou").hide();
		$(".guangzhou1").hide();
		$(".guangzhou2").hide();
		$(".guangzhou3").hide();
		$(".foshan").hide();
		$(".foshan1").hide();
		$(".foshan2").hide();
		$(".foshan3").hide();
		$(".dongguan").show();
		$(".dongguan1").show();
		$(".dongguan2").show();
		$(".dongguan3").show();
		//如果只选指标值
		if(showDu[0]=="1"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="6";
			y[3].colSpan="6";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
			    $(".dongguan1").show();
			    $(".dongguan2").hide();
	    		$(".dongguan3").hide(); 
 
		}
		
		if(showDu[0]=="2"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="6";
			y[3].colSpan="6";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
			$(".dongguan2").show();
			$(".dongguan1").hide();
    		$(".dongguan3").hide(); 
			
		}
		if(showDu[0]=="3"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="6";
			y[3].colSpan="6";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
			$(".dongguan3").show();
			$(".dongguan1").hide();
    		$(".dongguan2").hide(); 
			
		}
		
		
		if(showDu[0]=="1" && showDu[1]=="2"){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="12";
			y[3].colSpan="12";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
			 $(".dongguan1").show();
			 $(".dongguan2").show();
			 $(".dongguan3").hide(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="3"){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="12";
			y[3].colSpan="12";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
			 $(".dongguan1").show();
			 $(".dongguan3").show();
			 $(".dongguan2").hide(); 
			
		}
		if(showDu[0]=="2" && showDu[1]=="3"){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="12";
			y[3].colSpan="12";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
			 $(".dongguan2").show();
			 $(".dongguan3").show();
			 $(".dongguan1").hide(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="18";
			y[3].colSpan="18";
			x[19].colSpan="3";
			x[20].colSpan="3";
			x[21].colSpan="3";
			x[22].colSpan="3";
			x[23].colSpan="3";
			x[24].colSpan="3";
			 $(".dongguan1").show();
			 $(".dongguan2").show();
			 $(".dongguan3").show();
			
		}	
		
		}
/*  如果选择广州运营中心和 深圳运营中心****************************************   */	
    if(cityArea[0]=="2" && cityArea[1]=="3"){
    	$(".shenzhen").show();
		$(".shenzhen1").show();
		$(".shenzhen2").show();
		$(".shenzhen3").show();
    	
    	$(".guangzhou").show();
		$(".guangzhou1").show();
		$(".guangzhou2").show();
		$(".guangzhou3").show();
		$(".foshan").hide();
		$(".foshan1").hide();
		$(".foshan2").hide();
		$(".foshan3").hide();
		$(".dongguan").hide();
		$(".dongguan1").hide();
		$(".dongguan2").hide();
		$(".dongguan3").hide();
		if(showDu[0]=="1"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[4].colSpan="7";
			y[0].colSpan="6";
			y[1].colSpan="7";
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			    $(".guangzhou1").show();
			    $(".guangzhou2").hide();
	    		$(".guangzhou3").hide(); 
	    		$(".shenzhen1").show();
				$(".shenzhen2").hide();
		        $(".shenzhen3").hide(); 
		}
		if(showDu[0]=="2"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[4].colSpan="7";
			y[0].colSpan="6";
			y[1].colSpan="7";
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			    $(".guangzhou1").hide();
			    $(".guangzhou2").show();
	    		$(".guangzhou3").hide(); 
	    		$(".shenzhen1").hide();
				$(".shenzhen2").show();
		        $(".shenzhen3").hide(); 
		}
		if(showDu[0]=="3"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[4].colSpan="7";
			y[0].colSpan="6";
			y[1].colSpan="7";
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			    $(".guangzhou1").hide();
			    $(".guangzhou2").hide();
	    		$(".guangzhou3").show(); 
	    		$(".shenzhen1").hide();
				$(".shenzhen2").hide();
		        $(".shenzhen3").show(); 
		}
		if(showDu[0]=="1" && showDu[1]=="2"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[4].colSpan="14";
			y[0].colSpan="12";
			y[1].colSpan="14";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			$(".guangzhou1").show();
		    $(".guangzhou2").show();
    		$(".guangzhou3").hide(); 
    		$(".shenzhen1").show();
			$(".shenzhen2").show();
	        $(".shenzhen3").hide(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[4].colSpan="14";
			y[0].colSpan="12";
			y[1].colSpan="14";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			$(".guangzhou1").show();
		    $(".guangzhou2").hide();
    		$(".guangzhou3").show(); 
    		$(".shenzhen1").show();
			$(".shenzhen2").hide();
	        $(".shenzhen3").show(); 
			
		}
		if(showDu[0]=="2" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[4].colSpan="14";
			y[0].colSpan="12";
			y[1].colSpan="14";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			$(".guangzhou1").hide();
		    $(".guangzhou2").show();
    		$(".guangzhou3").show(); 
    		$(".shenzhen1").hide();
			$(".shenzhen2").show();
	        $(".shenzhen3").show(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="18";
			z[4].colSpan="21";
			y[0].colSpan="18";
			y[1].colSpan="21";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";
			$(".guangzhou1").show();
		    $(".guangzhou2").show();
    		$(".guangzhou3").show(); 
    		$(".shenzhen1").show();
			$(".shenzhen2").show();
	        $(".shenzhen3").show(); 
			
		}	
  
    }
 /*如果选择广州 和佛山 -----------------------------------------------  */
    if(cityArea[0]=="2" && cityArea[1]=="4"){
    	$(".shenzhen").hide();
		$(".shenzhen1").hide();
		$(".shenzhen2").hide();
		$(".shenzhen3").hide();
    	
    	$(".guangzhou").show();
		$(".guangzhou1").show();
		$(".guangzhou2").show();
		$(".guangzhou3").show();
		$(".foshan").show();
		$(".foshan1").show();
		$(".foshan2").show();
		$(".foshan3").show();
		$(".dongguan").hide();
		$(".dongguan1").hide();
		$(".dongguan2").hide();
		$(".dongguan3").hide();
		if(showDu[0]=="1"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[5].colSpan="6";
			y[0].colSpan="6";
			y[2].colSpan="6";
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			    $(".guangzhou1").show();
			    $(".guangzhou2").hide();
	    		$(".guangzhou3").hide(); 
	    		$(".foshan1").show();
				$(".foshan2").hide();
		        $(".foshan3").hide(); 
		}
		if(showDu[0]=="2"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[5].colSpan="6";
			y[0].colSpan="6";
			y[2].colSpan="6";
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			    $(".guangzhou1").hide();
			    $(".guangzhou2").show();
	    		$(".guangzhou3").hide(); 
	    		$(".foshan1").hide();
				$(".foshan2").show();
		        $(".foshan3").hide(); 
		}
		if(showDu[0]=="3"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[5].colSpan="6";
			y[0].colSpan="6";
			y[2].colSpan="6";
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			    $(".guangzhou1").hide();
			    $(".guangzhou2").hide();
	    		$(".guangzhou3").show(); 
	    		$(".foshan1").hide();
				$(".foshan2").hide();
		        $(".foshan3").show(); 
		}
		if(showDu[0]=="1" && showDu[1]=="2"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[5].colSpan="12";
			y[0].colSpan="12";
			y[2].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			$(".guangzhou1").show();
		    $(".guangzhou2").show();
    		$(".guangzhou3").hide(); 
    		$(".foshan1").show();
			$(".foshan2").show();
	        $(".foshan3").hide(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[5].colSpan="12";
			y[0].colSpan="12";
			y[2].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			$(".guangzhou1").show();
		    $(".guangzhou2").hide();
    		$(".guangzhou3").show(); 
    		$(".foshan1").show();
			$(".foshan2").hide();
	        $(".foshan3").show(); 
			
		}
		if(showDu[0]=="2" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[5].colSpan="12";
			y[0].colSpan="12";
			y[2].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			$(".guangzhou1").hide();
		    $(".guangzhou2").show();
    		$(".guangzhou3").show(); 
    		$(".foshan1").hide();
			$(".foshan2").show();
	        $(".foshan3").show(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="18";
			z[5].colSpan="18";
			y[0].colSpan="18";
			y[2].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			x[16].colSpan="3";
			x[17].colSpan="3";
			x[18].colSpan="3";
			$(".guangzhou1").show();
		    $(".guangzhou2").show();
    		$(".guangzhou3").show(); 
    		$(".foshan1").show();
			$(".foshan2").show();
	        $(".foshan3").show(); 
			
		}	
    	
    	
    	  
    }
 /*如果选择广州和 东莞-----------------------------------------------------  */
    if(cityArea[0]=="2" && cityArea[1]=="5"){
    	$(".shenzhen").hide();
		$(".shenzhen1").hide();
		$(".shenzhen2").hide();
		$(".shenzhen3").hide();
    	
    	$(".guangzhou").show();
		$(".guangzhou1").show();
		$(".guangzhou2").show();
		$(".guangzhou3").show();
		$(".foshan").hide();
		$(".foshan1").hide();
		$(".foshan2").hide();
		$(".foshan3").hide();
		$(".dongguan").show();
		$(".dongguan1").show();
		$(".dongguan2").show();
		$(".dongguan3").show();
		if(showDu[0]=="1"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[6].colSpan="6";
			y[0].colSpan="6";
			y[3].colSpan="6";
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[6].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
			    $(".guangzhou1").show();
			    $(".guangzhou2").hide();
	    		$(".guangzhou3").hide(); 
	    		$(".dongguan").show();
				$(".dongguan2").hide();
		        $(".dongguan3").hide(); 
		}
		if(showDu[0]=="2"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[6].colSpan="6";
			y[0].colSpan="6";
			y[3].colSpan="6";
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[6].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
			    $(".guangzhou1").hide();
			    $(".guangzhou2").show();
	    		$(".guangzhou3").hide(); 
	    		$(".dongguan1").hide();
				$(".dongguan2").show();
		        $(".dongguan3").hide(); 
		}
		if(showDu[0]=="3"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[6].colSpan="6";
			y[0].colSpan="6";
			y[3].colSpan="6";
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[6].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
			    $(".guangzhou1").hide();
			    $(".guangzhou2").hide();
	    		$(".guangzhou3").show(); 
	    		$(".dongguan1").hide();
				$(".dongguan2").hide();
		        $(".dongguan3").show(); 
		}
		if(showDu[0]=="1" && showDu[1]=="2"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[6].colSpan="12";
			y[0].colSpan="12";
			y[3].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
			$(".guangzhou1").show();
		    $(".guangzhou2").show();
    		$(".guangzhou3").hide(); 
    		$(".dongguan1").show();
			$(".dongguan2").show();
	        $(".dongguan3").hide(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[6].colSpan="12";
			y[0].colSpan="12";
			y[3].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
			$(".guangzhou1").show();
		    $(".guangzhou2").hide();
    		$(".guangzhou3").show(); 
    		$(".dongguan1").show();
			$(".dongguan2").hide();
	        $(".dongguan3").show(); 
			
		}
		if(showDu[0]=="2" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[6].colSpan="12";
			y[0].colSpan="12";
			y[3].colSpan="12";
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
			$(".guangzhou1").hide();
		    $(".guangzhou2").show();
    		$(".guangzhou3").show(); 
    		$(".dongguan1").hide();
			$(".dongguan2").show();
	        $(".dongguan3").show(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="18";
			z[6].colSpan="18";
			y[0].colSpan="18";
			y[3].colSpan="18";
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[19].colSpan="3";
			x[20].colSpan="3";
			x[21].colSpan="3";
			x[22].colSpan="3";
			x[23].colSpan="3";
			x[24].colSpan="3";
			$(".guangzhou1").show();
		    $(".guangzhou2").show();
    		$(".guangzhou3").show(); 
    		$(".dongguan1").show();
			$(".dongguan2").show();
	        $(".dongguan3").show(); 
			
		}	
  	  
    }
 /*如果选择深圳 和佛山 --------------------------------------------------------  */
    if(cityArea[0]=="3" && cityArea[1]=="4"){
    	$(".shenzhen").show();
		$(".shenzhen1").show();
		$(".shenzhen2").show();
		$(".shenzhen3").show();
    	
    	$(".guangzhou").hide();
		$(".guangzhou1").hide();
		$(".guangzhou2").hide();
		$(".guangzhou3").hide();
		$(".foshan").show();
		$(".foshan1").show();
		$(".foshan2").show();
		$(".foshan3").show();
		$(".dongguan").hide();
		$(".dongguan1").hide();
		$(".dongguan2").hide();
		$(".dongguan3").hide();
		if(showDu[0]=="1"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[5].colSpan="6";
			z[4].colSpan="7";
			y[2].colSpan="6";
			y[1].colSpan="7";			
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			    $(".foshan1").show();
			    $(".foshan2").hide();
	    		$(".foshan3").hide(); 
	    		$(".shenzhen1").show();
				$(".shenzhen2").hide();
		        $(".shenzhen3").hide(); 
		}
		if(showDu[0]=="2"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[5].colSpan="6";
			z[4].colSpan="7";
			y[2].colSpan="6";
			y[1].colSpan="7";			
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			    $(".foshan1").hide();
			    $(".foshan2").show();
	    		$(".foshan3").hide(); 
	    		$(".shenzhen1").hide();
				$(".shenzhen2").show();
		        $(".shenzhen3").hide(); 
		}
		if(showDu[0]=="3"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[5].colSpan="6";
			z[4].colSpan="7";
			y[2].colSpan="6";
			y[1].colSpan="7";			
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			    $(".foshan1").hide();
			    $(".foshan2").hide();
	    		$(".foshan3").show(); 
	    		$(".shenzhen1").hide();
				$(".shenzhen2").hide();
		        $(".shenzhen3").show(); 
		}
		if(showDu[0]=="1" && showDu[1]=="2"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[5].colSpan="12";
			z[4].colSpan="14";
			y[2].colSpan="12";
			y[1].colSpan="14";			
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			$(".foshan1").show();
		    $(".foshan2").show();
    		$(".foshan3").hide(); 
    		$(".shenzhen1").show();
			$(".shenzhen2").show();
	        $(".shenzhen3").hide(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[5].colSpan="12";
			z[4].colSpan="14";
			y[2].colSpan="12";
			y[1].colSpan="14";			
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			$(".foshan1").show();
		    $(".foshan2").hide();
    		$(".foshan3").show(); 
    		$(".shenzhen1").show();
			$(".shenzhen2").hide();
	        $(".shenzhen3").show(); 
			
		}
		if(showDu[0]=="2" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[5].colSpan="12";
			z[4].colSpan="14";
			y[2].colSpan="12";
			y[1].colSpan="14";			
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			$(".foshan1").hide();
		    $(".foshan2").show();
    		$(".foshan3").show(); 
    		$(".shenzhen1").hide();
			$(".shenzhen2").show();
	        $(".shenzhen3").show(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[5].colSpan="18";
			z[4].colSpan="21";
			y[2].colSpan="18";
			y[1].colSpan="21";			
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			x[16].colSpan="3";
			x[17].colSpan="3";
			x[18].colSpan="3";
			$(".foshan1").show();
		    $(".foshan2").show();
    		$(".foshan3").show(); 
    		$(".shenzhen1").show();
			$(".shenzhen2").show();
	        $(".shenzhen3").show(); 
			
		}	  
    	  
    }
 /*如果选择 深圳和 东莞  --------------------------------------------------------  */
    if(cityArea[0]=="3" && cityArea[1]=="5"){
    	$(".shenzhen").show();
		$(".shenzhen1").show();
		$(".shenzhen2").show();
		$(".shenzhen3").show();
    	
    	$(".guangzhou").hide();
		$(".guangzhou1").hide();
		$(".guangzhou2").hide();
		$(".guangzhou3").hide();
		$(".foshan").hide();
		$(".foshan1").hide();
		$(".foshan2").hide();
		$(".foshan3").hide();
		$(".dongguan").show();
		$(".dongguan1").show();
		$(".dongguan2").show();
		$(".dongguan3").show();
		if(showDu[0]=="1"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="6";
			z[4].colSpan="7";
			y[3].colSpan="6";
			y[1].colSpan="7";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";

			    $(".dongguan1").show();
			    $(".dongguan2").hide();
	    		$(".dongguan3").hide(); 
	    		$(".shenzhen1").show();
				$(".shenzhen2").hide();
		        $(".shenzhen3").hide(); 
		}
		if(showDu[0]=="2"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="6";
			z[4].colSpan="7";
			y[3].colSpan="6";
			y[1].colSpan="7";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
			    $(".dongguan1").hide();
			    $(".dongguan2").show();
	    		$(".dongguan3").hide(); 
	    		$(".shenzhen1").hide();
				$(".shenzhen2").show();
		        $(".shenzhen3").hide(); 
		}
		if(showDu[0]=="3"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="6";
			z[4].colSpan="7";
			y[3].colSpan="6";
			y[1].colSpan="7";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
			    $(".dongguan1").hide();
			    $(".dongguan2").hide();
	    		$(".dongguan3").show(); 
	    		$(".shenzhen1").hide();
				$(".shenzhen2").hide();
		        $(".shenzhen3").show(); 
		}
		if(showDu[0]=="1" && showDu[1]=="2"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="12";
			z[4].colSpan="14";
			y[3].colSpan="12";
			y[1].colSpan="14";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
			$(".dongguan1").show();
		    $(".dongguan2").show();
    		$(".dongguan3").hide(); 
    		$(".shenzhen1").show();
			$(".shenzhen2").show();
	        $(".shenzhen3").hide(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="12";
			z[4].colSpan="14";
			y[3].colSpan="12";
			y[1].colSpan="14";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
			$(".dongguan1").show();
		    $(".dongguan2").hide();
    		$(".dongguan3").show(); 
    		$(".shenzhen1").show();
			$(".shenzhen2").hide();
	        $(".shenzhen3").show(); 
			
		}
		if(showDu[0]=="2" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="12";
			z[4].colSpan="14";
			y[3].colSpan="12";
			y[1].colSpan="14";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
			$(".dongguan1").hide();
		    $(".dongguan2").show();
    		$(".dongguan3").show(); 
    		$(".shenzhen1").hide();
			$(".shenzhen2").show();
	        $(".shenzhen3").show(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="18";
			z[4].colSpan="21";
			y[3].colSpan="18";
			y[1].colSpan="21";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";
			x[19].colSpan="3";
			x[20].colSpan="3";
			x[21].colSpan="3";
			x[22].colSpan="3";
			x[23].colSpan="3";
			x[24].colSpan="3";
			$(".dongguan1").show();
		    $(".dongguan2").show();
    		$(".dongguan3").show(); 
    		$(".shenzhen1").show();
			$(".shenzhen2").show();
	        $(".shenzhen3").show(); 
			
		}	
  	  
    }
 /* 佛山和东莞------------------------------------------------------------  */
    if(cityArea[0]=="4" && cityArea[1]=="5"){
    	$(".shenzhen").hide();
		$(".shenzhen1").hide();
		$(".shenzhen2").hide();
		$(".shenzhen3").hide();
    	
    	$(".guangzhou").hide();
		$(".guangzhou1").hide();
		$(".guangzhou2").hide();
		$(".guangzhou3").hide();
		$(".foshan").show();
		$(".foshan1").show();
		$(".foshan2").show();
		$(".foshan3").show();
		$(".dongguan").show();
		$(".dongguan1").show();
		$(".dongguan2").show();
		$(".dongguan3").show();
		if(showDu[0]=="1"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="6";
			z[5].colSpan="6";
			y[3].colSpan="6";
			y[2].colSpan="6";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
			    $(".foshan1").show();
			    $(".foshan2").hide();
	    		$(".foshan3").hide(); 
	    		$(".dongguan1").show();
				$(".dongguan2").hide();
		        $(".dongguan3").hide(); 
		}
		if(showDu[0]=="2"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="6";
			z[5].colSpan="6";
			y[3].colSpan="6";
			y[2].colSpan="6";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
			    $(".dongguan1").hide();
			    $(".dongguan2").show();
	    		$(".dongguan3").hide(); 
	    		$(".foshan1").hide();
				$(".foshan2").show();
		        $(".foshan3").hide(); 
		}
		if(showDu[0]=="3"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="6";
			z[5].colSpan="6";
			y[3].colSpan="6";
			y[2].colSpan="6";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
			    $(".foshan1").hide();
			    $(".foshan2").hide();
	    		$(".foshan3").show(); 
	    		$(".dongguan1").hide();
				$(".dongguan2").hide();
		        $(".dongguan3").show(); 
		}
		if(showDu[0]=="1" && showDu[1]=="2"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="12";
			z[5].colSpan="12";
			y[3].colSpan="12";
			y[2].colSpan="12";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
			$(".dongguan1").show();
		    $(".dongguan2").show();
    		$(".dongguan3").hide(); 
    		$(".foshan1").show();
			$(".foshan2").show();
	        $(".foshan3").hide(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="12";
			z[5].colSpan="12";
			y[3].colSpan="12";
			y[2].colSpan="12";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
			$(".foshan1").show();
		    $(".foshan2").hide();
    		$(".foshan3").show(); 
    		$(".dongguan1").show();
			$(".dongguan2").hide();
	        $(".dongguan3").show(); 
			
		}
		if(showDu[0]=="2" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="12";
			z[5].colSpan="12";
			y[3].colSpan="12";
			y[2].colSpan="12";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
			$(".dongguan1").hide();
		    $(".dongguan2").show();
    		$(".dongguan3").show(); 
    		$(".foshan1").hide();
			$(".foshan2").show();
	        $(".foshan3").show(); 
			
		}
		if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[6].colSpan="18";
			z[5].colSpan="18";
			y[3].colSpan="18";
			y[2].colSpan="18";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			x[16].colSpan="3";
			x[17].colSpan="3";
			x[18].colSpan="3";
			x[19].colSpan="3";
			x[20].colSpan="3";
			x[21].colSpan="3";
			x[22].colSpan="3";
			x[23].colSpan="3";
			x[24].colSpan="3";
			$(".foshan1").show();
		    $(".foshan2").show();
    		$(".foshan3").show(); 
    		$(".dongguan1").show();
			$(".dongguan2").show();
	        $(".dongguan3").show(); 
			
		}	  
    	  
    }
 /* 广州   深圳  佛山----------------------------------------------------------  */
    if(cityArea[0]=="2" && cityArea[1]=="3" && cityArea[2]=="4"){
    	$(".shenzhen").show();
		$(".shenzhen1").show();
		$(".shenzhen2").show();
		$(".shenzhen3").show();
    	
    	$(".guangzhou").show();
		$(".guangzhou1").show();
		$(".guangzhou2").show();
		$(".guangzhou3").show();
		$(".foshan").show();
		$(".foshan1").show();
		$(".foshan2").show();
		$(".foshan3").show();
		$(".dongguan").hide();
		$(".dongguan1").hide();
		$(".dongguan2").hide();
		$(".dongguan3").hide();
		if(showDu[0]=="1"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[4].colSpan="7";
			z[5].colSpan="6";
			
			/* 运营中心行  */
			y[0].colSpan="6";
			y[1].colSpan="7";
			y[2].colSpan="6";
			
			/* 地市行 */
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
		
			$(".guangzhou1").show();
			$(".guangzhou2").hide();
			$(".guangzhou3").hide();
			    $(".foshan1").show();
			    $(".foshan2").hide();
	    		$(".foshan3").hide(); 
	    		$(".shenzhen1").show();
				$(".shenzhen2").hide();
		        $(".shenzhen3").hide(); 
		}
		if(showDu[0]=="2"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[4].colSpan="7";
			z[5].colSpan="6";
			
			/* 运营中心行  */
			y[0].colSpan="6";
			y[1].colSpan="7";
			y[2].colSpan="6";
			
			/* 地市行 */
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
		
			$(".guangzhou1").hide();
			$(".guangzhou2").show();
			$(".guangzhou3").hide();
			    $(".foshan1").hide();
			    $(".foshan2").show();
	    		$(".foshan3").hide(); 
	    		$(".shenzhen1").hide();
				$(".shenzhen2").show();
		        $(".shenzhen3").hide(); 
		}
		if(showDu[0]=="3"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[4].colSpan="7";
			z[5].colSpan="6";
			
			/* 运营中心行  */
			y[0].colSpan="6";
			y[1].colSpan="7";
			y[2].colSpan="6";
			
			/* 地市行 */
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
		
			$(".guangzhou1").hide();
			$(".guangzhou2").hide();
			$(".guangzhou3").show();
			    $(".foshan1").hide();
			    $(".foshan2").hide();
	    		$(".foshan3").show(); 
	    		$(".shenzhen1").hide();
				$(".shenzhen2").hide();
		        $(".shenzhen3").show(); 
		}
      if(showDu[0]=="1" && showDu[1]=="2"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[4].colSpan="14";
			z[5].colSpan="12";
			
			/* 运营中心行  */
			y[0].colSpan="12";
			y[1].colSpan="14";
			y[2].colSpan="12";
			
			/* 地市行 */
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
		
			$(".guangzhou1").show();
			$(".guangzhou2").show();
			$(".guangzhou3").hide();
			    $(".foshan1").show();
			    $(".foshan2").show();
	    		$(".foshan3").hide(); 
	    		$(".shenzhen1").show();
				$(".shenzhen2").show();
		        $(".shenzhen3").hide();
			
		}
		if(showDu[0]=="1" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[4].colSpan="14";
			z[5].colSpan="12";
			
			/* 运营中心行  */
			y[0].colSpan="12";
			y[1].colSpan="14";
			y[2].colSpan="12";
			
			/* 地市行 */
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
		
			$(".guangzhou1").show();
			$(".guangzhou2").hide();
			$(".guangzhou3").show();
			    $(".foshan1").show();
			    $(".foshan2").hide();
	    		$(".foshan3").show(); 
	    		$(".shenzhen1").show();
				$(".shenzhen2").hide();
		        $(".shenzhen3").show();
			
		}
		if(showDu[0]=="2" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[4].colSpan="14";
			z[5].colSpan="12";
			
			/* 运营中心行  */
			y[0].colSpan="12";
			y[1].colSpan="14";
			y[2].colSpan="12";
			
			/* 地市行 */
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			$(".guangzhou1").hide();
			$(".guangzhou2").show();
			$(".guangzhou3").show();
			    $(".foshan1").hide();
			    $(".foshan2").show();
	    		$(".foshan3").show(); 
	    		$(".shenzhen1").hide();
				$(".shenzhen2").show();
		        $(".shenzhen3").show();
			
		}
		if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="18";
			z[4].colSpan="21";
			z[5].colSpan="18";
			
			/* 运营中心行  */
			y[0].colSpan="18";
			y[1].colSpan="21";
			y[2].colSpan="18";
			
			/* 地市行 */
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			x[16].colSpan="3";
			x[17].colSpan="3";
			x[18].colSpan="3";
			$(".guangzhou1").show();
			$(".guangzhou2").show();
			$(".guangzhou3").show();
			    $(".foshan1").show();
			    $(".foshan2").show();
	    		$(".foshan3").show(); 
	    		$(".shenzhen1").show();
				$(".shenzhen2").show();
		        $(".shenzhen3").show();
			
		}	  
		
		
		
		
    }
 /* 广州  深圳     东莞----------------------------------------------------------------- */
    if(cityArea[0]=="2" && cityArea[1]=="3" && cityArea[2]=="5"){
      	$(".shenzhen").show();
		$(".shenzhen1").show();
		$(".shenzhen2").show();
		$(".shenzhen3").show();
    	
    	$(".guangzhou").show();
		$(".guangzhou1").show();
		$(".guangzhou2").show();
		$(".guangzhou3").show();
		$(".foshan").show();
		$(".foshan1").show();
		$(".foshan2").show();
		$(".foshan3").show();
		$(".dongguan").hide();
		$(".dongguan1").hide();
		$(".dongguan2").hide();
		$(".dongguan3").hide();
		if(showDu[0]=="1"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[4].colSpan="7";
			z[5].colSpan="6";
			
			/* 运营中心行  */
			y[0].colSpan="6";
			y[1].colSpan="7";
			y[2].colSpan="6";
			
			/* 地市行 */
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
		
			$(".guangzhou1").show();
			$(".guangzhou2").hide();
			$(".guangzhou3").hide();
			    $(".foshan1").show();
			    $(".foshan2").hide();
	    		$(".foshan3").hide(); 
	    		$(".shenzhen1").show();
				$(".shenzhen2").hide();
		        $(".shenzhen3").hide(); 
		}
		if(showDu[0]=="2"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[4].colSpan="7";
			z[5].colSpan="6";
			
			/* 运营中心行  */
			y[0].colSpan="6";
			y[1].colSpan="7";
			y[2].colSpan="6";
			
			/* 地市行 */
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
		
			$(".guangzhou1").hide();
			$(".guangzhou2").show();
			$(".guangzhou3").hide();
			    $(".foshan1").hide();
			    $(".foshan2").show();
	    		$(".foshan3").hide(); 
	    		$(".shenzhen1").hide();
				$(".shenzhen2").show();
		        $(".shenzhen3").hide(); 
		}
		if(showDu[0]=="3"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[4].colSpan="7";
			z[5].colSpan="6";
			
			/* 运营中心行  */
			y[0].colSpan="6";
			y[1].colSpan="7";
			y[2].colSpan="6";
			
			/* 地市行 */
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
		
			$(".guangzhou1").hide();
			$(".guangzhou2").hide();
			$(".guangzhou3").show();
			    $(".foshan1").hide();
			    $(".foshan2").hide();
	    		$(".foshan3").show(); 
	    		$(".shenzhen1").hide();
				$(".shenzhen2").hide();
		        $(".shenzhen3").show(); 
		}
      if(showDu[0]=="1" && showDu[1]=="2"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[4].colSpan="14";
			z[5].colSpan="12";
			
			/* 运营中心行  */
			y[0].colSpan="12";
			y[1].colSpan="14";
			y[2].colSpan="12";
			
			/* 地市行 */
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
		
			$(".guangzhou1").show();
			$(".guangzhou2").show();
			$(".guangzhou3").hide();
			    $(".foshan1").show();
			    $(".foshan2").show();
	    		$(".foshan3").hide(); 
	    		$(".shenzhen1").show();
				$(".shenzhen2").show();
		        $(".shenzhen3").hide();
			
		}
		if(showDu[0]=="1" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[4].colSpan="14";
			z[5].colSpan="12";
			
			/* 运营中心行  */
			y[0].colSpan="12";
			y[1].colSpan="14";
			y[2].colSpan="12";
			
			/* 地市行 */
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
		
			$(".guangzhou1").show();
			$(".guangzhou2").hide();
			$(".guangzhou3").show();
			    $(".foshan1").show();
			    $(".foshan2").hide();
	    		$(".foshan3").show(); 
	    		$(".shenzhen1").show();
				$(".shenzhen2").hide();
		        $(".shenzhen3").show();
			
		}
		if(showDu[0]=="2" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[4].colSpan="14";
			z[5].colSpan="12";
			
			/* 运营中心行  */
			y[0].colSpan="12";
			y[1].colSpan="14";
			y[2].colSpan="12";
			
			/* 地市行 */
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			$(".guangzhou1").hide();
			$(".guangzhou2").show();
			$(".guangzhou3").show();
			    $(".foshan1").hide();
			    $(".foshan2").show();
	    		$(".foshan3").show(); 
	    		$(".shenzhen1").hide();
				$(".shenzhen2").show();
		        $(".shenzhen3").show();
			
		}
		if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="18";
			z[4].colSpan="21";
			z[5].colSpan="18";
			
			/* 运营中心行  */
			y[0].colSpan="18";
			y[1].colSpan="21";
			y[2].colSpan="18";
			
			/* 地市行 */
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			x[16].colSpan="3";
			x[17].colSpan="3";
			x[18].colSpan="3";
			$(".guangzhou1").show();
			$(".guangzhou2").show();
			$(".guangzhou3").show();
			    $(".foshan1").show();
			    $(".foshan2").show();
	    		$(".foshan3").show(); 
	    		$(".shenzhen1").show();
				$(".shenzhen2").show();
		        $(".shenzhen3").show();
			
		}
    	  
    }
 /*广州   佛山   东莞 -----------------------------------------------------------  */
    if(cityArea[0]=="2" && cityArea[1]=="4" && cityArea[2]=="5"){
      	$(".shenzhen").hide();
		$(".shenzhen1").hide();
		$(".shenzhen2").hide();
		$(".shenzhen3").hide();
    	
    	$(".guangzhou").show();
		$(".guangzhou1").show();
		$(".guangzhou2").show();
		$(".guangzhou3").show();
		$(".foshan").show();
		$(".foshan1").show();
		$(".foshan2").show();
		$(".foshan3").show();
		$(".dongguan").show();
		$(".dongguan1").show();
		$(".dongguan2").show();
		$(".dongguan3").show();
		if(showDu[0]=="1"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[5].colSpan="6";
			z[6].colSpan="6";
			
			/* 运营中心行  */
			y[0].colSpan="6";
			y[2].colSpan="6";
			y[3].colSpan="6";
			
			/* 地市行 */
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
		
			$(".guangzhou1").show();
			$(".guangzhou2").hide();
			$(".guangzhou3").hide();
			    $(".foshan1").show();
			    $(".foshan2").hide();
	    		$(".foshan3").hide(); 
	    		$(".dongguan1").show();
				$(".dongguan2").hide();
		        $(".dongguan3").hide(); 
		}
		if(showDu[0]=="2"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[5].colSpan="6";
			z[6].colSpan="6";
			
			/* 运营中心行  */
			y[0].colSpan="6";
			y[2].colSpan="6";
			y[3].colSpan="6";
			
			/* 地市行 */
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
		
			$(".guangzhou1").hide();
			$(".guangzhou2").show();
			$(".guangzhou3").hide();
			    $(".foshan1").hide();
			    $(".foshan2").show();
	    		$(".foshan3").hide(); 
	    		$(".dongguan1").hide();
				$(".dongguan2").show();
		        $(".dongguan3").hide();
		}
		if(showDu[0]=="3"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[5].colSpan="6";
			z[6].colSpan="6";
			
			/* 运营中心行  */
			y[0].colSpan="6";
			y[2].colSpan="6";
			y[3].colSpan="6";
			
			/* 地市行 */
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
		
			$(".guangzhou1").hide();
			$(".guangzhou2").hide();
			$(".guangzhou3").show();
			    $(".foshan1").hide();
			    $(".foshan2").hide();
	    		$(".foshan3").show(); 
	    		$(".dongguan1").hide();
				$(".dongguan2").hide();
		        $(".dongguan3").show();
		}
      if(showDu[0]=="1" && showDu[1]=="2"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[5].colSpan="12";
			z[6].colSpan="12";
			
			/* 运营中心行  */
			y[0].colSpan="12";
			y[2].colSpan="12";
			y[3].colSpan="12";
			
			/* 地市行 */
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
		
			$(".guangzhou1").show();
			$(".guangzhou2").show();
			$(".guangzhou3").hide();
			    $(".foshan1").show();
			    $(".foshan2").show();
	    		$(".foshan3").hide(); 
	    		$(".dongguan1").show();
				$(".dongguan2").show();
		        $(".dongguan3").hide();
			
		}
		if(showDu[0]=="1" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[5].colSpan="12";
			z[6].colSpan="12";
			
			/* 运营中心行  */
			y[0].colSpan="12";
			y[2].colSpan="12";
			y[3].colSpan="12";
			
			/* 地市行 */
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
		
			$(".guangzhou1").show();
			$(".guangzhou2").hide();
			$(".guangzhou3").show();
			    $(".foshan1").show();
			    $(".foshan2").hide();
	    		$(".foshan3").show(); 
	    		$(".dongguan1").show();
				$(".dongguan2").hide();
		        $(".dongguan3").show();
			
		}
		if(showDu[0]=="2" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[5].colSpan="12";
			z[6].colSpan="12";
			
			/* 运营中心行  */
			y[0].colSpan="12";
			y[2].colSpan="12";
			y[3].colSpan="12";
			
			/* 地市行 */
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
		
			$(".guangzhou1").hide();
			$(".guangzhou2").show();
			$(".guangzhou3").show();
			    $(".foshan1").hide();
			    $(".foshan2").show();
	    		$(".foshan3").show(); 
	    		$(".dongguan1").hide();
				$(".dongguan2").show();
		        $(".dongguan3").show();
			
		}
		if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="18";
			z[5].colSpan="18";
			z[6].colSpan="18";
			
			/* 运营中心行  */
			y[0].colSpan="18";
			y[2].colSpan="18";
			y[3].colSpan="18";
			
			/* 地市行 */
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			x[16].colSpan="3";
			x[17].colSpan="3";
			x[18].colSpan="3";
			x[19].colSpan="3";
			x[20].colSpan="3";
			x[21].colSpan="3";
			x[22].colSpan="3";
			x[23].colSpan="3";
			x[24].colSpan="3";
		
			$(".guangzhou1").show();
			$(".guangzhou2").show();
			$(".guangzhou3").show();
			    $(".foshan1").show();
			    $(".foshan2").show();
	    		$(".foshan3").show(); 
	    		$(".dongguan1").show();
				$(".dongguan2").show();
		        $(".dongguan3").show();
			
		}
  	  
    }
 /*深圳   佛山  东莞--------------------------------------------------------    */
    if(cityArea[0]=="3" && cityArea[1]=="4" && cityArea[2]=="5"){
      	$(".shenzhen").show();
		$(".shenzhen1").show();
		$(".shenzhen2").show();
		$(".shenzhen3").show();
    	
    	$(".guangzhou").hide();
		$(".guangzhou1").hide();
		$(".guangzhou2").hide();
		$(".guangzhou3").hide();
		$(".foshan").show();
		$(".foshan1").show();
		$(".foshan2").show();
		$(".foshan3").show();
		$(".dongguan").show();
		$(".dongguan1").show();
		$(".dongguan2").show();
		$(".dongguan3").show();
		if(showDu[0]=="1"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			
			z[4].colSpan="7";
			z[5].colSpan="6";
			z[6].colSpan="6";
			/* 运营中心行  */
			
			y[1].colSpan="7";
			y[2].colSpan="6";
			y[3].colSpan="6";
			/* 地市行 */
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
		
			$(".dongguan1").show();
			$(".dongguan2").hide();
			$(".dongguan3").hide();
			    $(".foshan1").show();
			    $(".foshan2").hide();
	    		$(".foshan3").hide(); 
	    		$(".shenzhen1").show();
				$(".shenzhen2").hide();
		        $(".shenzhen3").hide(); 
		}
		if(showDu[0]=="2"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[4].colSpan="7";
			z[5].colSpan="6";
			z[6].colSpan="6";
			/* 运营中心行  */
			
			y[1].colSpan="7";
			y[2].colSpan="6";
			y[3].colSpan="6";
			/* 地市行 */
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
		
			$(".dongguan1").hide();
			$(".dongguan2").show();
			$(".dongguan3").hide();
			    $(".foshan1").hide();
			    $(".foshan2").show();
	    		$(".foshan3").hide(); 
	    		$(".shenzhen1").hide();
				$(".shenzhen2").show();
		        $(".shenzhen3").hide();
		}
		if(showDu[0]=="3"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[4].colSpan="7";
			z[5].colSpan="6";
			z[6].colSpan="6";
			/* 运营中心行  */
			
			y[1].colSpan="7";
			y[2].colSpan="6";
			y[3].colSpan="6";
			/* 地市行 */
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
		
			$(".dongguan1").hide();
			$(".dongguan2").hide();
			$(".dongguan3").show();
			    $(".foshan1").hide();
			    $(".foshan2").hide();
	    		$(".foshan3").show(); 
	    		$(".shenzhen1").hide();
				$(".shenzhen2").hide();
		        $(".shenzhen3").show();
		}
      if(showDu[0]=="1" && showDu[1]=="2"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[4].colSpan="14";
			z[5].colSpan="12";
			z[6].colSpan="12";
			/* 运营中心行  */
			
			y[1].colSpan="14";
			y[2].colSpan="12";
			y[3].colSpan="12";
			/* 地市行 */
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
		
			$(".dongguan1").show();
			$(".dongguan2").show();
			$(".dongguan3").hide();
			    $(".foshan1").show();
			    $(".foshan2").show();
	    		$(".foshan3").hide(); 
	    		$(".shenzhen1").show();
				$(".shenzhen2").show();
		        $(".shenzhen3").hide();
			
		}
		if(showDu[0]=="1" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[4].colSpan="14";
			z[5].colSpan="12";
			z[6].colSpan="12";
			/* 运营中心行  */
			
			y[1].colSpan="14";
			y[2].colSpan="12";
			y[3].colSpan="12";
			/* 地市行 */
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
		
			$(".dongguan1").show();
			$(".dongguan2").hide();
			$(".dongguan3").show();
			    $(".foshan1").show();
			    $(".foshan2").hide();
	    		$(".foshan3").show(); 
	    		$(".shenzhen1").show();
				$(".shenzhen2").hide();
		        $(".shenzhen3").show();
			
		}
		if(showDu[0]=="2" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[4].colSpan="14";
			z[5].colSpan="12";
			z[6].colSpan="12";
			/* 运营中心行  */
			
			y[1].colSpan="14";
			y[2].colSpan="12";
			y[3].colSpan="12";
			/* 地市行 */
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
		
			$(".dongguan1").hide();
			$(".dongguan2").show();
			$(".dongguan3").show();
			    $(".foshan1").hide();
			    $(".foshan2").show();
	    		$(".foshan3").show(); 
	    		$(".shenzhen1").hide();
				$(".shenzhen2").show();
		        $(".shenzhen3").show();
			
		}
		if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[4].colSpan="21";
			z[5].colSpan="18";
			z[6].colSpan="18";
			/* 运营中心行  */
			
			y[1].colSpan="21";
			y[2].colSpan="18";
			y[3].colSpan="18";
			/* 地市行 */
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			x[16].colSpan="3";
			x[17].colSpan="3";
			x[18].colSpan="3";
			x[19].colSpan="3";
			x[20].colSpan="3";
			x[21].colSpan="3";
			x[22].colSpan="3";
			x[23].colSpan="3";
			x[24].colSpan="3";
		
			$(".dongguan1").show();
			$(".dongguan2").show();
			$(".dongguan3").show();
			    $(".foshan1").show();
			    $(".foshan2").show();
	    		$(".foshan3").show(); 
	    		$(".shenzhen1").show();
				$(".shenzhen2").show();
		        $(".shenzhen3").show();
			
		}  
    	  
    }
  /* 全部选运营商、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、  */
    if(cityArea[0]=="2" && cityArea[1]=="3" && cityArea[2]=="4" && cityArea[3]=="5"  ){
      	$(".shenzhen").show();
		$(".shenzhen1").show();
		$(".shenzhen2").show();
		$(".shenzhen3").show();
    	
    	$(".guangzhou").show();
		$(".guangzhou1").show();
		$(".guangzhou2").show();
		$(".guangzhou3").show();
		$(".foshan").show();
		$(".foshan1").show();
		$(".foshan2").show();
		$(".foshan3").show();
		$(".dongguan").show();
		$(".dongguan1").show();
		$(".dongguan2").show();
		$(".dongguan3").show();
		if(showDu[0]=="1"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[4].colSpan="7";
			z[5].colSpan="6";
			z[6].colSpan="6";
			/* 运营中心行  */
			y[0].colSpan="6";
			y[1].colSpan="7";
			y[2].colSpan="6";
			y[3].colSpan="6";
			/* 地市行 */
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
		
			$(".guangzhou1").show();
			$(".guangzhou2").hide();
			$(".guangzhou3").hide();
			$(".shenzhen1").show();
			$(".shenzhen2").hide();
			$(".shenzhen3").hide();   
			$(".foshan1").show();
			$(".foshan2").hide();
	        $(".foshan3").hide(); 
	    	$(".dongguan1").show();
			$(".dongguan2").hide();
		    $(".dongguan3").hide(); 
		}
		if(showDu[0]=="2"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[4].colSpan="7";
			z[5].colSpan="6";
			z[6].colSpan="6";
			/* 运营中心行  */
			y[0].colSpan="6";
			y[1].colSpan="7";
			y[2].colSpan="6";
			y[3].colSpan="6";
			/* 地市行 */
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
		
			$(".guangzhou1").hide();
			$(".guangzhou2").show();
			$(".guangzhou3").hide();
			$(".shenzhen1").hide();
			$(".shenzhen2").show();
			$(".shenzhen3").hide();   
			$(".foshan1").hide();
			$(".foshan2").show();
	        $(".foshan3").hide(); 
	    	$(".dongguan1").hide();
			$(".dongguan2").show();
		    $(".dongguan3").hide();
		}
		if(showDu[0]=="3"){
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="6";
			z[4].colSpan="7";
			z[5].colSpan="6";
			z[6].colSpan="6";
			/* 运营中心行  */
			y[0].colSpan="6";
			y[1].colSpan="7";
			y[2].colSpan="6";
			y[3].colSpan="6";
			/* 地市行 */
			x[0].colSpan="1";
			x[1].colSpan="1";
			x[2].colSpan="1";
			x[3].colSpan="1";
			x[4].colSpan="1";
			x[5].colSpan="1";
			x[6].colSpan="1";
			x[7].colSpan="1";
			x[8].colSpan="1";
			x[9].colSpan="1";
			x[10].colSpan="1";
			x[11].colSpan="1";
			x[12].colSpan="1";
			x[13].colSpan="1";
			x[14].colSpan="1";
			x[15].colSpan="1";
			x[16].colSpan="1";
			x[17].colSpan="1";
			x[18].colSpan="1";
			x[19].colSpan="1";
			x[20].colSpan="1";
			x[21].colSpan="1";
			x[22].colSpan="1";
			x[23].colSpan="1";
			x[24].colSpan="1";
		
			$(".guangzhou1").hide();
			$(".guangzhou2").hide();
			$(".guangzhou3").show();
			$(".shenzhen1").hide();
			$(".shenzhen2").hide();
			$(".shenzhen3").show();   
			$(".foshan1").hide();
			$(".foshan2").hide();
	        $(".foshan3").show(); 
	    	$(".dongguan1").hide();
			$(".dongguan2").hide();
		    $(".dongguan3").show();
		}
      if(showDu[0]=="1" && showDu[1]=="2"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[4].colSpan="14";
			z[5].colSpan="12";
			z[6].colSpan="12";
			/* 运营中心行  */
			y[0].colSpan="12";
			y[1].colSpan="14";
			y[2].colSpan="12";
			y[3].colSpan="12";
			/* 地市行 */
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
		
			$(".guangzhou1").show();
			$(".guangzhou2").show();
			$(".guangzhou3").hide();
			$(".shenzhen1").show();
			$(".shenzhen2").show();
			$(".shenzhen3").hide();   
			$(".foshan1").show();
			$(".foshan2").show();
	        $(".foshan3").hide(); 
	    	$(".dongguan1").show();
			$(".dongguan2").show();
		    $(".dongguan3").hide();
			
		}
		if(showDu[0]=="1" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[4].colSpan="14";
			z[5].colSpan="12";
			z[6].colSpan="12";
			/* 运营中心行  */
			y[0].colSpan="12";
			y[1].colSpan="14";
			y[2].colSpan="12";
			y[3].colSpan="12";
			/* 地市行 */
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
		
			$(".guangzhou1").show();
			$(".guangzhou2").hide();
			$(".guangzhou3").show();
			$(".shenzhen1").show();
			$(".shenzhen2").hide();
			$(".shenzhen3").show();   
			$(".foshan1").show();
			$(".foshan2").hide();
	        $(".foshan3").show(); 
	    	$(".dongguan1").show();
			$(".dongguan2").hide();
		    $(".dongguan3").show();
			
		}
		if(showDu[0]=="2" && showDu[1]=="3"){
			
			var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="12";
			z[4].colSpan="14";
			z[5].colSpan="12";
			z[6].colSpan="12";
			/* 运营中心行  */
			y[0].colSpan="12";
			y[1].colSpan="14";
			y[2].colSpan="12";
			y[3].colSpan="12";
			/* 地市行 */
			x[0].colSpan="2";
			x[1].colSpan="2";
			x[2].colSpan="2";
			x[3].colSpan="2";
			x[4].colSpan="2";
			x[5].colSpan="2";
			x[6].colSpan="2";
			x[7].colSpan="2";
			x[8].colSpan="2";
			x[9].colSpan="2";
			x[10].colSpan="2";
			x[11].colSpan="2";
			x[12].colSpan="2";
			x[13].colSpan="2";
			x[14].colSpan="2";
			x[15].colSpan="2";
			x[16].colSpan="2";
			x[17].colSpan="2";
			x[18].colSpan="2";
			x[19].colSpan="2";
			x[20].colSpan="2";
			x[21].colSpan="2";
			x[22].colSpan="2";
			x[23].colSpan="2";
			x[24].colSpan="2";
		
			$(".guangzhou1").hide();
			$(".guangzhou2").show();
			$(".guangzhou3").show();
			$(".shenzhen1").hide();
			$(".shenzhen2").show();
			$(".shenzhen3").show();   
			$(".foshan1").hide();
			$(".foshan2").show();
	        $(".foshan3").show(); 
	    	$(".dongguan1").hide();
			$(".dongguan2").show();
		    $(".dongguan3").show();
			
		}
		if(showDu[0]=="1" && showDu[1]=="2" && showDu[2]=="3" ){
			
			 var x=document.getElementById('tptable').rows[2].cells;
			var y=document.getElementById('tptable').rows[1].cells;
			var z=document.getElementById('tptable').rows[0].cells;
			z[3].colSpan="18";
			z[4].colSpan="21";
			z[5].colSpan="18";
			z[6].colSpan="18";
			/* 运营中心行  */
			y[0].colSpan="18";
			y[1].colSpan="21";
			y[2].colSpan="18";
			y[3].colSpan="18";
			/* 地市行 */
			x[0].colSpan="3";
			x[1].colSpan="3";
			x[2].colSpan="3";
			x[3].colSpan="3";
			x[4].colSpan="3";
			x[5].colSpan="3";
			x[6].colSpan="3";
			x[7].colSpan="3";
			x[8].colSpan="3";
			x[9].colSpan="3";
			x[10].colSpan="3";
			x[11].colSpan="3";
			x[12].colSpan="3";
			x[13].colSpan="3";
			x[14].colSpan="3";
			x[15].colSpan="3";
			x[16].colSpan="3";
			x[17].colSpan="3";
			x[18].colSpan="3";
			x[19].colSpan="3";
			x[20].colSpan="3";
			x[21].colSpan="3";
			x[22].colSpan="3";
			x[23].colSpan="3";
			x[24].colSpan="3";		
			$(".guangzhou1").show();
			$(".guangzhou2").show();
			$(".guangzhou3").show();
			$(".shenzhen1").show();
			$(".shenzhen2").show();
			$(".shenzhen3").show();   
			$(".foshan1").show();
			$(".foshan2").show();
	        $(".foshan3").show(); 
	    	$(".dongguan1").show();
			$(".dongguan2").show();
		    $(".dongguan3").show();
		}
  	  
    }
 
    
	
	}
    
    
    
    
    
    
	
	
	
	
	


//页面加载执行的请求    *********************************************************
//var options=$('#quarter option:selected');
//function dianji(){	
	//var quarter= $('#quarter').val();
	//var quarter= '1';
	//var options= $('#quarter  option:selected').text(); 
	//$.StandardPost(basePath+'/zdResultCitykpi2019/allList.do',{'quarter':quarter});	
	// document.getElementById("quarter").innerHTML = "<option>"+ options+ "</option>";
//}
/* jQuery(function($) {  

	var quarter= $('#quarter').val();
	$.StandardPost(basePath+'/zdResultCitykpi2019/allList.do',{'quarter':quarter})
  }); */
$.extend({
	
    StandardPost:function(url,args){
    	var options= $('#quarter  option:selected').text(); 
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
      //  document.getElementById("quarter").innerHTML = "<option>"+ options+ "</option>";
        //document.body.removeChild(form[0]);
    }
}); 


$(function(){
    $('#showDu')
        .multipleSelect({
            selectAll:true
            ,placeholder:'请选择'
        })
        .change(function(){
            //$('[name=showDu]').val($(this).val()?$(this).val().join(','):'')
        })
})

 $(function(){
    $('#cityArea')
        .multipleSelect({
            selectAll:true
            ,placeholder:'请选择'
        })
        .change(function(){
            $('[name=cityArea]').val($(this).val()?$(this).val().join(','):'')
        })
}) 



/* $.ajax({
	url:"../zdResultCitykpi2019/allList.do",
	type:"GET",
	async:true,
	dataType:"html",
	data:{"quarter":quarter},
	success:function(result){
		alert(result);
		$("#boday").html(result);
	}
});
 var quarter= '1';
	　
		
			window.open(basePath+"/zdResultCitykpi2019/allList.do?quarter=" + quarter, "_self"); 	
		
		return false;
       
	    

	//var options= $('#quarter  option:selected').text(); 
	//$.StandardPost(basePath+'/zdResultCitykpi2019/allList.do',{'quarter':quarter});	
 
  $(document).ready(function () {
	　　//第一次进入页面刷新一次，仅一次
	　　//location.href.indexOf("#")获取当前页面地址并在其中查找"#"首次出现位置，找不到就是-1
	    if(location.href.indexOf("#")==-1){
	　　//在当前页面地址加入"#"，使下次不再进入此判断
	    location.href=location.href+"#";
	    location.reload();
	}); 
 *
 *
 *
 *
 *
 */




