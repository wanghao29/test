function goSubmit (){
	
	
}

function addAndUpdate(CYCLE){
	
var brand =$("#brand").val();	
var spec =$("#spec").val();	




	
	
}


//触发模态框的同时调用此方法  
function editInfo(obj) {  
	 var brand =$("#brand").val();	
	   var spec =$("#spec").val();	
	   var CYCLE=obj;

	   $.ajax({  
	        type: "post",  
	        url: "../parameterSet/addAndUpdateLifeDate.do",  
	        data: "brand=" + brand + "&spec=" + spec+"&CYCLE="+CYCLE,  
	        dataType: 'json',  
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
	        success: function(result) {  
	        if(result.lifeDate==null){
	        	if(CYCLE=="1"){
	        		$("#modal_CYCLE").val("导入期");	
	        		
	        	}
	        	if(CYCLE=="2"){
	        		$("#modal_CYCLE").val("成长期");	
	        		
	        	}
	        	if(CYCLE=="3"){
	        		$("#modal_CYCLE").val("成熟期");	
	        		
	        	}
	        	if(CYCLE=="4"){
	        		$("#modal_CYCLE").val("衰退期");	
	        		
	        	}
	        	
	        	
	        	
	        }	
	        	if(result.lifeDate!=null){
	        	
	        	if(result.lifeDate.cycle=="1"){
	        		result.lifeDate.cycle="导入期";
	        		$("#modal_CYCLE").val(result.lifeDate.cycle);
	        		$("#model_DURATION").val(result.lifeDate.duration);
	        		$("#model_SALEAMOUNT").val(result.lifeDate.saleamount);
	        		$("#model_INCOME").val(result.lifeDate.income);
	        		$("#model_MAORI").val(result.lifeDate.maori);
	        		$("#model_OVERAMOUNT").val(result.lifeDate.overamount);
	        		$("#model_SHARE").val(result.lifeDate.share);
	        		$("#model_TURNOVERTIME").val(result.lifeDate.turnovertime);
	        	
	        	}
	        	if(result.lifeDate.cycle=="2"){
	        		result.lifeDate.cycle="成长期";
	        		$("#modal_CYCLE").val(result.lifeDate.cycle);
	        		$("#model_DURATION").val(result.lifeDate.duration);
	        		$("#model_SALEAMOUNT").val(result.lifeDate.saleamount);
	        		$("#model_INCOME").val(result.lifeDate.income);
	        		$("#model_MAORI").val(result.lifeDate.maori);
	        		$("#model_OVERAMOUNT").val(result.lifeDate.overamount);
	        		$("#model_SHARE").val(result.lifeDate.share);
	        		$("#model_TURNOVERTIME").val(result.lifeDate.turnovertime);
	           
	        		
	        	}
	        	if(result.lifeDate.cycle=="3"){
	        		result.lifeDate.cycle="成熟期";
	        		$("#modal_CYCLE").val(result.lifeDate.cycle);
	        		$("#model_DURATION").val(result.lifeDate.duration);
	        		$("#model_SALEAMOUNT").val(result.lifeDate.saleamount);
	        		$("#model_INCOME").val(result.lifeDate.income);
	        		$("#model_MAORI").val(result.lifeDate.maori);
	        		$("#model_OVERAMOUNT").val(result.lifeDate.overamount);
	        		$("#model_SHARE").val(result.lifeDate.share);
	        		$("#model_TURNOVERTIME").val(result.lifeDate.turnovertime);
	           
	        	}
	        	if(result.lifeDate.cycle=="4"){
	        		result.lifeDate.cycle="衰退期";
	        		$("#modal_CYCLE").val(result.lifeDate.cycle);
	        		$("#model_DURATION").val(result.lifeDate.duration);
	        		$("#model_SALEAMOUNT").val(result.lifeDate.saleamount);
	        		$("#model_INCOME").val(result.lifeDate.income);
	        		$("#model_MAORI").val(result.lifeDate.maori);
	        		$("#model_OVERAMOUNT").val(result.lifeDate.overamount);
	        		$("#model_SHARE").val(result.lifeDate.share);
	        		$("#model_TURNOVERTIME").val(result.lifeDate.turnovertime);
	           
	        	}
	        	}
	        	
	        	}  
	    }); 
    $('#modal').modal('show');  
}

//城市维度规划触发模态框的同时调用此方法  
function city(obj) {  
	 var brand =$("#brand").val();	
	   var spec =$("#spec").val();	
	  var city=obj;
	 
	   $.ajax({  
	        type: "post",  
	        url: "../parameterSet/cityShow.do",  
	        data: "brand=" + brand + "&spec=" + spec+"&AREANAME="+city,  
	        dataType: 'json',  
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
	        success: function(result) {  
	       
	        if(result.cityDateBreak!=null){
            $("#CITY_AREANAME").val(result.cityDateBreak.areaname);
      		$("#CITY_SALEAMOUNTS").val(result.cityDateBreak.saleamounts);
      		$("#CITY_INCOMES").val(result.cityDateBreak.incomes);
      		$("#CITY_OVERAMOUNTS").val(result.cityDateBreak.overamounts); 
	         }else{
	        	 
	        	 document.getElementById("CITY_AREANAME").value=obj;
	             document.getElementById("CITY_SALEAMOUNTS").value="";
	       		 document.getElementById("CITY_INCOMES").value="";
	       		 document.getElementById("CITY_OVERAMOUNTS").value="";
	        	 
	         }
       
	        	} 
	    }); 
    $('#modal1').modal('show');  
}

//提交更改  
function update() {  
    //获取模态框数据  
var BRANDNAME =$("#brand").val();	
var SPEC =$("#spec").val();	
var CYCLE=$("#modal_CYCLE").val();
var DURATION=$("#model_DURATION").val();
var SALEAMOUNT=	$("#model_SALEAMOUNT").val();
var INCOME=	$("#model_INCOME").val();
var MAORI=$("#model_MAORI").val();
var OVERAMOUNT=$("#model_OVERAMOUNT").val();
var SHARE=$("#model_SHARE").val();
var TURNOVERTIME=$("#model_TURNOVERTIME").val();

if(DURATION==""){
	alert("请输入持续周长！"); 
	return false;		
}	
if(SALEAMOUNT==""){
	alert("请输入销量！"); 
	return false;		
}
if(INCOME==""){
	alert("请输入收入！"); 
	return false;		
}
if(MAORI==""){
	alert("请输入毛利！"); 
	return false;		
}

if(OVERAMOUNT==""){
	alert("请输入覆盖客户数！"); 
	return false;		
}
if(SHARE==""){
	alert("请输入份额！"); 
	return false;		
}
if(TURNOVERTIME==""){
	alert("请输入库存周转！"); 
	return false;		
}


if(CYCLE=="导入期") {
	CYCLE="1";

};
if(CYCLE=="成长期") {
	
	CYCLE="2";
	
};
if(CYCLE=="成熟期") {
	
	CYCLE="3";
	
};
if(CYCLE=="衰退期") {
	
	CYCLE="4";
	
};

/* var date={BRANDNAME,SPEC,CYCLE,DURATION,SALEAMOUNT,INCOME,MAORI,OVERAMOUNT,SHARE,TURNOVERTIME}; */
   
   $.ajax({  
        type: "post",  
        url: "../parameterSet/addAndUpdateLifeDate1.do",  
       /*  data: "brand=" + brand + "&spec=" + spec,   */
       data:{"BRANDNAME":BRANDNAME,"SPEC":SPEC,"CYCLE":CYCLE,"DURATION":DURATION,
    	   "SALEAMOUNT":SALEAMOUNT,"INCOME":INCOME,"MAORI":MAORI,"OVERAMOUNT":OVERAMOUNT,
    	   "SHARE":SHARE,"TURNOVERTIME":TURNOVERTIME},
        dataType: 'json',  
        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
        success: function(result) {  
        	 if(result==1){
          	   
           	  alert("保存成功！"); 
           	  $('#modal').modal('hide');
           	  window.location.reload();
              
              } if(result==2){
           	   
            	  alert("修改成功！"); 
            	  $('#modal').modal('hide');
            	  window.location.reload();
               
               }
        
        }  
    }); 
	
};



//城市维度提交更改  
function updateCity() {  
    //获取模态框数据  
   var BRANDNAME =$("#brand").val();	
   var SPEC =$("#spec").val();	
   var AREANAME= $("#CITY_AREANAME").val();
   var SALEAMOUNTS=$("#CITY_SALEAMOUNTS").val();
   var INCOMES=	$("#CITY_INCOMES").val();
   var OVERAMOUNTS =$("#CITY_OVERAMOUNTS").val(); 
  /*  var date={BRANDNAME,SPEC,AREANAME,SALEAMOUNTS,INCOMES,OVERAMOUNTS};  */
   if(SALEAMOUNTS==""){
		alert("请输入销量！"); 
		return false;		
	}
   if(INCOMES==""){
		alert("请输入收入！"); 
		return false;		
	}
  
   if(OVERAMOUNTS==""){
		alert("请输入覆盖客户数！"); 
		return false;		
	}
  
  
  $.ajax({  
        type: "post",  
        url: "../parameterSet/addAndUpdateCityDate.do",  
        data:{"BRANDNAME":BRANDNAME,"SPEC":SPEC,"AREANAME":AREANAME,
        	"SALEAMOUNTS":SALEAMOUNTS,"INCOMES":INCOMES,"OVERAMOUNTS":OVERAMOUNTS},  
        dataType: 'json',  
        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
        success: function(result) {  
           if(result==1){
        	   
        	  alert("保存成功！"); 
        	  $('#modal1').modal('hide');
        	  window.location.reload();
           
           } if(result==2){
        	   
         	  alert("修改成功！"); 
         	  $('#modal1').modal('hide');
         	  window.location.reload();
            
            }
           
        	//location.reload();  
        	//window.location.reload();
            //$('#modal1').modal('hide');
        }  
    }); 
	
}

/*五线七口触发模态框调用此方法   */
function fineAndSaven(obj,obj1) {  
	 var brand =$("#brand").val();	
	   var spec =$("#spec").val();	
	  var fine=obj;
	  var saven=obj1;
	   $.ajax({  
	        type: "post",  
	        url: "../parameterSet/fineAndSavenShow.do",  
	        data: "brand=" + brand + "&spec=" + spec+"&lineName="+fine+"&portName="+obj1,  
	        dataType: 'json',  
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
	        success: function(result) {  	       
	        	 if(result.fiveAndLine!=null){	
                 $("#fine_LINENAME").val(result.fiveAndLine.linename);
      		     $("#fine_PORTNAME").val(result.fiveAndLine.portname);
      		     $("#fine_SALEAMOUNT").val(result.fiveAndLine.saleamount);
      		     $("#fine_INCOME").val(result.fiveAndLine.income); 
      		     $("#fine_MAORI").val(result.fiveAndLine.maori);   
	        	 }else{		        	 
		        	 document.getElementById("fine_LINENAME").value=obj;
		             document.getElementById("fine_PORTNAME").value=obj1;
		       		 document.getElementById("fine_SALEAMOUNT").value="";
		       		 document.getElementById("fine_INCOME").value="";
		       		 document.getElementById("fine_MAORI").value="";		        	 
		         }
      
	        	} 
	    }); 
    $('#modal2').modal('show');  
}
/*五线七口添加和修改的操作  */

 /* $("#form2").on("submit", function(ev) {
	 var BRANDNAME =$("#brand").val();	
	   var SPEC =$("#spec").val();	
	   var LINENAME= $("#fine_LINENAME").val();
	   var PORTNAME= $("#fine_PORTNAME").val();
	   var SALEAMOUNT=$("#fine_SALEAMOUNT").val();
	   var INCOME= $("#fine_INCOME").val(); 
	   var MAORI=$("#fine_MAORI").val();       
	   $.ajax({  
	        type: "post",  
	        url: "../parameterSet/addUpdateFineDate.do",  
	        data:{"BRANDNAME":BRANDNAME,"SPEC":SPEC,"LINENAME":LINENAME,
	        	"PORTNAME":PORTNAME,"SALEAMOUNT":SALEAMOUNT,"INCOME":INCOME,"MAORI":MAORI},  
	        dataType: 'json',  
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
	        success: function(result) {  
	        	 if(result==1){
	          	   
	           	  alert("保存成功！"); 
	           	  $('#modal2').modal('hide');
	           	  window.location.reload();
	              
	              } if(result==2){
	           	   
	            	  alert("修改成功！"); 
	            	  $('#modal2').modal('hide');
	            	  window.location.reload();
	               
	               }
	        }  
	    }); 
	 

            //阻止submit表单提交
            ev.preventDefault();
            //或者return false
            //return false;
        }); */






 function updateFine() {  
    //获取模态框数据  
   var BRANDNAME =$("#brand").val();	
   var SPEC =$("#spec").val();	
   var LINENAME= $("#fine_LINENAME").val();
   var PORTNAME= $("#fine_PORTNAME").val();
   var SALEAMOUNT=$("#fine_SALEAMOUNT").val();
   var INCOME= $("#fine_INCOME").val(); 
   var MAORI=$("#fine_MAORI").val();   
  
    if(SALEAMOUNT==""){
		alert("请输入销量！"); 
		return false;		
	}
   if(INCOME==""){
		alert("请输入收入！"); 
		return false;		
	}
  
   if(MAORI==""){
		alert("请输入毛利！"); 
		return false;		
	}  
  $.ajax({  
        type: "post",  
        url: "../parameterSet/addUpdateFineDate.do",  
        data:{"BRANDNAME":BRANDNAME,"SPEC":SPEC,"LINENAME":LINENAME,
        	"PORTNAME":PORTNAME,"SALEAMOUNT":SALEAMOUNT,"INCOME":INCOME,"MAORI":MAORI},  
        dataType: 'json',  
        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
        success: function(result) {  
        	 if(result==1){
          	   
           	  alert("保存成功！"); 
           	  $('#modal2').modal('hide');
           	  window.location.reload();
              
              } if(result==2){
           	   
            	  alert("修改成功！"); 
            	  $('#modal2').modal('hide');
            	  window.location.reload();
               
               }
        }  
    }); 
 
  
}  


/* 页面加载完成就执行的js事件，来进行计算汇总的数据值   */

window.onload =function()
{
   //对汇总的周数进行赋值
	var weekOne = parseInt(document.getElementById('DURATION1').value);
	if(isNaN(weekOne)){
		weekOne=0;
		 }
   var weekTwo = parseInt(document.getElementById('DURATION2').value);
   if(isNaN(weekTwo)){
	   weekTwo=0;
		 }
   var weekThree = parseInt(document.getElementById('DURATION3').value);
   if(isNaN(weekThree)){
	   weekThree=0;
		 }
   var weekFour = parseInt(document.getElementById('DURATION4').value);
   if(isNaN(weekFour)){
	   weekFour=0;
		 }
   var weekTotal='';
    weekTotal=weekOne+weekTwo+weekThree+weekFour;
    document.getElementById('weekSum').innerHTML=weekTotal;
  //对汇总的销量进行赋值
    var saleOne = parseInt(document.getElementById('SALEAMOUNT1').value);
    if(isNaN(saleOne)){
    	saleOne=0;
		 }
  var saleTwo = parseInt(document.getElementById('SALEAMOUNT2').value);
  if(isNaN(saleTwo)){
	  saleTwo=0;
		 }
  var saleThree = parseInt(document.getElementById('SALEAMOUNT3').value);
  if(isNaN(saleThree)){
	  saleThree=0;
		 }
  var saleFour = parseInt(document.getElementById('SALEAMOUNT4').value);
  if(isNaN(saleFour)){
	  saleFour=0;
		 }
  var saleTotal='';
    saleTotal=saleOne+saleTwo+saleThree+saleFour;
    document.getElementById('saleAmount').innerHTML=saleTotal;
    document.getElementById('actualSaleAmount').innerHTML=saleTotal;
  //对汇总的收入进行赋值
    var incomeOne = parseInt(document.getElementById('INCOME1').value);
    if(isNaN(incomeOne)){
    	incomeOne=0;
		 }
  var incomeTwo = parseInt(document.getElementById('INCOME2').value);
  if(isNaN(incomeTwo)){
	  incomeTwo=0;
		 }
  var incomeThree = parseInt(document.getElementById('INCOME3').value);
  if(isNaN(incomeThree)){
	  incomeThree=0;
		 }
  var incomeFour = parseInt(document.getElementById('INCOME4').value);
  if(isNaN(incomeFour)){
	  incomeFour=0;
		 }
  var incomeTotal='';
    incomeTotal=incomeOne+incomeTwo+incomeThree+incomeFour;
    document.getElementById('incomeAmount').innerHTML=incomeTotal;
    document.getElementById('actualIncomeAmount').innerHTML=incomeTotal;
  //对汇总的利润总量进行赋值
    var profitOne = parseInt(document.getElementById('MAORI1').value);
    if(isNaN(profitOne)){
    	profitOne=0;
		 }
  var profitTwo = parseInt(document.getElementById('MAORI2').value);
  if(isNaN(profitTwo)){
	  profitTwo=0;
		 }
  var profitThree = parseInt(document.getElementById('MAORI3').value);
  if(isNaN(profitThree)){
	  profitThree=0;
		 }
  var profitFour = parseInt(document.getElementById('MAORI4').value);
  if(isNaN(profitFour)){
	  profitFour=0;
		 }
  var profitTotal='';
    profitTotal=profitOne+profitTwo+profitThree+profitFour;
    document.getElementById('profitAmount').innerHTML=profitTotal;
  //对汇总的覆盖进行赋值
    var stockOne = parseInt(document.getElementById('OVERAMOUNT1').value);
    if(isNaN(stockOne)){
    	stockOne=0;
		 }
  var stockTwo = parseInt(document.getElementById('OVERAMOUNT2').value);
  if(isNaN(stockTwo)){
	  stockTwo=0;
		 }
  var stockThree = parseInt(document.getElementById('OVERAMOUNT3').value);
  if(isNaN(stockThree)){
	  stockThree=0;
		 }
  var stockFour = parseInt(document.getElementById('OVERAMOUNT4').value);
  if(isNaN(stockFour)){
	  stockFour=0;
		 }
  var stockTotal='';
    stockTotal=stockOne+stockTwo+stockThree+stockFour;
    document.getElementById('stockAmount').innerHTML=stockTotal;
    document.getElementById('actualOverAmount').innerHTML=stockTotal;
  //对汇总的份额进行赋值
    var shareOne = parseInt(document.getElementById('SHARE1').value);
    if(isNaN(shareOne)){
    	shareOne=0;
		 }
  var shareTwo = parseInt(document.getElementById('SHARE2').value);
  if(isNaN(shareTwo)){
	  shareTwo=0;
		 }
  var shareThree = parseInt(document.getElementById('SHARE3').value);
  if(isNaN(shareThree)){
	  shareThree=0;
		 }
  var shareFour = parseInt(document.getElementById('SHARE4').value);
  if(isNaN(shareFour)){
	  shareFour=0;
		 }
  var shareTotal='';
    shareTotal=shareOne+shareTwo+shareThree+shareFour;
    document.getElementById('shareAmount').innerHTML=shareTotal;
  //对汇总的覆盖量尽心赋值
    var overOne = parseInt(document.getElementById('TURNOVERTIME1').value);
    if(isNaN(overOne)){
    	overOne=0;
		 }
  var overTwo = parseInt(document.getElementById('TURNOVERTIME2').value);
  if(isNaN(overTwo)){
	  overTwo=0;
		 }
  var overThree = parseInt(document.getElementById('TURNOVERTIME3').value);
  if(isNaN(overThree)){
	  overThree=0;
		 }
  var overFour = parseInt(document.getElementById('TURNOVERTIME4').value);
  if(isNaN(overFour)){
	  overFour=0;
		 }
  var overTotal='';
    overTotal=overOne+overTwo+overThree+overFour;
    document.getElementById('overAmount').innerHTML=overTotal;
   // document.getElementById('actualOverAmount').innerHTML=overTotal;
  /************************对城市维度规划设置的值进行汇总 ***********************/
        
  //获取销量的汇总统计
	var areaSale1 = parseInt(document.getElementById('areaSALEAMOUNT1').value); 
   if(isNaN(areaSale1)){
	  areaSale1=0;
	 }
    
	 var areaSale2 = parseInt(document.getElementById('areaSALEAMOUNT2').value);
	 if(isNaN(areaSale2)){
		 areaSale2=0;
		 }
	 var areaSale3 = parseInt(document.getElementById('areaSALEAMOUNT3').value);
	 if(isNaN(areaSale3)){
		 areaSale3=0;
		 }
	 var areaSale4 = parseInt(document.getElementById('areaSALEAMOUNT4').value);
	 if(isNaN(areaSale4)){
		 areaSale4=0;
		 }
	 var areaSale5 = parseInt(document.getElementById('areaSALEAMOUNT5').value);
	 if(isNaN(areaSale5)){
		 areaSale5=0;
		 }
	 var areaSale6 = parseInt(document.getElementById('areaSALEAMOUNT6').value);
	 if(isNaN(areaSale6)){
		 areaSale6=0;
		 }
	 var areaSale7 = parseInt(document.getElementById('areaSALEAMOUNT7').value);
	 if(isNaN(areaSale7)){
		 areaSale7=0;
		 }
	 var areaSale8 = parseInt(document.getElementById('areaSALEAMOUNT8').value);
	 if(isNaN(areaSale8)){
		 areaSale8=0;
		 }
	 var areaSale9 = parseInt(document.getElementById('areaSALEAMOUNT9').value);
	 if(isNaN(areaSale9)){
		 areaSale9=0;
		 }
	 var areaSale10 = parseInt(document.getElementById('areaSALEAMOUNT10').value);
	 if(isNaN(areaSale10)){
		 areaSale10=0;
		 }
	 var areaSale11 = parseInt(document.getElementById('areaSALEAMOUNT11').value);
	 if(isNaN(areaSale11)){
		 areaSale11=0;
		 }
	 var areaSale12 = parseInt(document.getElementById('areaSALEAMOUNT12').value);
	 if(isNaN(areaSale12)){
		 areaSale12=0;
		 }
	 var areaSale13 = parseInt(document.getElementById('areaSALEAMOUNT13').value);
	 if(isNaN(areaSale13)){
		 areaSale13=0;
		 }
	 var areaSale14 = parseInt(document.getElementById('areaSALEAMOUNT14').value);
	 if(isNaN(areaSale14)){
		 areaSale14=0;
		 }
	 var areaSale15 = parseInt(document.getElementById('areaSALEAMOUNT15').value);
	 if(isNaN(areaSale15)){
		 areaSale15=0;
		 }
	 var areaSale16 = parseInt(document.getElementById('areaSALEAMOUNT16').value);
	 if(isNaN(areaSale16)){
		 areaSale16=0;
		 }
	 var areaSale17 = parseInt(document.getElementById('areaSALEAMOUNT17').value);
	 if(isNaN(areaSale17)){
		 areaSale17=0;
		 }
	 var areaSale18 = parseInt(document.getElementById('areaSALEAMOUNT18').value);
	 if(isNaN(areaSale18)){
		 areaSale18=0;
		 }
	 var areaSale19 = parseInt(document.getElementById('areaSALEAMOUNT19').value);
	 if(isNaN(areaSale19)){
		 areaSale19=0;
		 }
	 var areaSale20 = parseInt(document.getElementById('areaSALEAMOUNT20').value);
	 if(isNaN(areaSale20)){
		 areaSale20=0;
		 }
	 var areaSale21 = parseInt(document.getElementById('areaSALEAMOUNT21').value);
	 if(isNaN(areaSale21)){
		 areaSale21=0;
		 }
	 var areaSaleSum="";
     areaSaleSum=areaSale1+areaSale2+areaSale3+areaSale4+areaSale5+areaSale6+areaSale7
     +areaSale8+areaSale9+areaSale10+areaSale11+areaSale12+areaSale13+areaSale14+areaSale15
     +areaSale16+areaSale17+areaSale18+areaSale19+areaSale20+areaSale21;
     document.getElementById('saleAreaAmount').innerHTML=areaSaleSum;
     document.getElementById('nowSaleAmount').innerHTML=areaSaleSum;
 // 地市维度规划收入值设置计算总量
 

 
     var areaINCOME1 = parseInt(document.getElementById('areaINCOME1').value); 
     if(isNaN(areaINCOME1)){
    	 areaINCOME1=0;
  	 }
      
  	 var areaINCOME2 = parseInt(document.getElementById('areaINCOME2').value);
  	 if(isNaN(areaINCOME2)){
  		areaINCOME2=0;
  		 }
  	 var areaINCOME3 = parseInt(document.getElementById('areaINCOME3').value);
  	 if(isNaN(areaINCOME3)){
  		areaINCOME3=0;
  		 }
  	 var areaINCOME4 = parseInt(document.getElementById('areaINCOME4').value);
  	 if(isNaN(areaINCOME4)){
  		areaINCOME4=0;
  		 }
  	 var areaINCOME5 = parseInt(document.getElementById('areaINCOME5').value);
  	 if(isNaN(areaINCOME5)){
  		areaINCOME5=0;
  		 }
  	 var areaINCOME6 = parseInt(document.getElementById('areaINCOME6').value);
  	 if(isNaN(areaINCOME6)){
  		areaINCOME6=0;
  		 }
  	 var areaINCOME7 = parseInt(document.getElementById('areaINCOME7').value);
  	 if(isNaN(areaINCOME7)){
  		areaINCOME7=0;
  		 }
  	 var areaINCOME8 = parseInt(document.getElementById('areaINCOME8').value);
  	 if(isNaN(areaINCOME8)){
  		areaINCOME8=0;
  		 }
  	 var areaINCOME9 = parseInt(document.getElementById('areaINCOME9').value);
  	 if(isNaN(areaINCOME9)){
  		areaINCOME9=0;
  		 }
  	 var areaINCOME10 = parseInt(document.getElementById('areaINCOME10').value);
  	 if(isNaN(areaINCOME10)){
  		areaINCOME10=0;
  		 }
  	 var areaINCOME11 = parseInt(document.getElementById('areaINCOME11').value);
  	 if(isNaN(areaINCOME11)){
  		areaINCOME11=0;
  		 }
  	 var areaINCOME12 = parseInt(document.getElementById('areaINCOME12').value);
  	 if(isNaN(areaINCOME12)){
  		areaINCOME12=0;
  		 }
  	 var areaINCOME13 = parseInt(document.getElementById('areaINCOME13').value);
  	 if(isNaN(areaINCOME13)){
  		areaINCOME13=0;
  		 }
  	 var areaINCOME14 = parseInt(document.getElementById('areaINCOME14').value);
  	 if(isNaN(areaINCOME14)){
  		areaINCOME14=0;
  		 }
  	 var areaINCOME15 = parseInt(document.getElementById('areaINCOME15').value);
  	 if(isNaN(areaINCOME15)){
  		areaINCOME15=0;
  		 }
  	 var areaINCOME16 = parseInt(document.getElementById('areaINCOME16').value);
  	 if(isNaN(areaINCOME16)){
  		areaINCOME16=0;
  		 }
  	 var areaINCOME17 = parseInt(document.getElementById('areaINCOME17').value);
  	 if(isNaN(areaINCOME17)){
  		areaINCOME17=0;
  		 }
  	 var areaINCOME18 = parseInt(document.getElementById('areaINCOME18').value);
  	 if(isNaN(areaINCOME18)){
  		areaINCOME18=0;
  		 }
  	 var areaINCOME19 = parseInt(document.getElementById('areaINCOME19').value);
  	 if(isNaN(areaINCOME19)){
  		areaINCOME19=0;
  		 }
  	 var areaINCOME20 = parseInt(document.getElementById('areaINCOME20').value);
  	 if(isNaN(areaINCOME20)){
  		areaINCOME20=0;
  		 }
  	 var areaINCOME21 = parseInt(document.getElementById('areaINCOME21').value);
  	 if(isNaN(areaINCOME21)){
  		areaINCOME21=0;
  		 }
  	 var areaIncomeSum="";
  	areaIncomeSum=areaINCOME1+areaINCOME2+areaINCOME3+areaINCOME4+areaINCOME5+areaINCOME6+areaINCOME7
       +areaINCOME8+areaINCOME9+areaINCOME10+areaINCOME11+areaINCOME12+areaINCOME13+areaINCOME14+areaINCOME15
       +areaINCOME16+areaINCOME17+areaINCOME18+areaINCOME19+areaINCOME20+areaINCOME21;
       document.getElementById('areaIncomeAmount').innerHTML=areaIncomeSum;
       document.getElementById('nowIncomeAomount').innerHTML=areaIncomeSum;
 //覆盖客户数设置汇总值计算



var areaOVERAMOUNT1 = parseInt(document.getElementById('areaOVERAMOUNT1').value); 
if(isNaN(areaOVERAMOUNT1)){
	areaOVERAMOUNT1=0;
}

var areaOVERAMOUNT2 = parseInt(document.getElementById('areaOVERAMOUNT2').value);
if(isNaN(areaOVERAMOUNT2)){
	areaOVERAMOUNT2=0;
}
var areaOVERAMOUNT3 = parseInt(document.getElementById('areaOVERAMOUNT3').value);
if(isNaN(areaOVERAMOUNT3)){
	areaOVERAMOUNT3=0;
}
var areaOVERAMOUNT4 = parseInt(document.getElementById('areaOVERAMOUNT4').value);
if(isNaN(areaOVERAMOUNT4)){
	areaOVERAMOUNT4=0;
}
var areaOVERAMOUNT5 = parseInt(document.getElementById('areaOVERAMOUNT5').value);
if(isNaN(areaOVERAMOUNT5)){
	areaOVERAMOUNT5=0;
}
var areaOVERAMOUNT6 = parseInt(document.getElementById('areaOVERAMOUNT6').value);
if(isNaN(areaOVERAMOUNT6)){
	areaOVERAMOUNT6=0;
}
var areaOVERAMOUNT7 = parseInt(document.getElementById('areaOVERAMOUNT7').value);
if(isNaN(areaOVERAMOUNT7)){
	areaOVERAMOUNT7=0;
}
var areaOVERAMOUNT8 = parseInt(document.getElementById('areaOVERAMOUNT8').value);
if(isNaN(areaOVERAMOUNT8)){
	areaOVERAMOUNT8=0;
}
var areaOVERAMOUNT9 = parseInt(document.getElementById('areaOVERAMOUNT9').value);
if(isNaN(areaOVERAMOUNT9)){
	areaOVERAMOUNT9=0;
}
var areaOVERAMOUNT10 = parseInt(document.getElementById('areaOVERAMOUNT10').value);
if(isNaN(areaOVERAMOUNT10)){
	areaOVERAMOUNT10=0;
}
var areaOVERAMOUNT11 = parseInt(document.getElementById('areaOVERAMOUNT11').value);
if(isNaN(areaOVERAMOUNT11)){
	areaOVERAMOUNT11=0;
}
var areaOVERAMOUNT12 = parseInt(document.getElementById('areaOVERAMOUNT12').value);
if(isNaN(areaOVERAMOUNT12)){
	areaOVERAMOUNT12=0;
}
var areaOVERAMOUNT13 = parseInt(document.getElementById('areaOVERAMOUNT13').value);
if(isNaN(areaOVERAMOUNT13)){
	areaOVERAMOUNT13=0;
}
var areaOVERAMOUNT14 = parseInt(document.getElementById('areaOVERAMOUNT14').value);
if(isNaN(areaOVERAMOUNT14)){
	areaOVERAMOUNT14=0;
}
var areaOVERAMOUNT15 = parseInt(document.getElementById('areaOVERAMOUNT15').value);
if(isNaN(areaOVERAMOUNT15)){
	areaOVERAMOUNT15=0;
}
var areaOVERAMOUNT16 = parseInt(document.getElementById('areaOVERAMOUNT16').value);
if(isNaN(areaOVERAMOUNT16)){
	areaOVERAMOUNT16=0;
}
var areaOVERAMOUNT17 = parseInt(document.getElementById('areaOVERAMOUNT17').value);
if(isNaN(areaOVERAMOUNT17)){
	areaOVERAMOUNT17=0;
}
var areaOVERAMOUNT18 = parseInt(document.getElementById('areaOVERAMOUNT18').value);
if(isNaN(areaOVERAMOUNT18)){
	areaOVERAMOUNT18=0;
}
var areaOVERAMOUNT19 = parseInt(document.getElementById('areaOVERAMOUNT19').value);
if(isNaN(areaOVERAMOUNT19)){
	areaOVERAMOUNT19=0;
}
var areaOVERAMOUNT20 = parseInt(document.getElementById('areaOVERAMOUNT20').value);
if(isNaN(areaOVERAMOUNT20)){
	areaOVERAMOUNT20=0;
}
var areaOVERAMOUNT21 = parseInt(document.getElementById('areaOVERAMOUNT21').value);
if(isNaN(areaOVERAMOUNT21)){
	areaOVERAMOUNT21=0;
}
var areaOverAmountSum="";
areaOverAmountSum=areaOVERAMOUNT1+areaOVERAMOUNT2+areaOVERAMOUNT3+areaOVERAMOUNT4+areaOVERAMOUNT5+areaOVERAMOUNT6+areaOVERAMOUNT7
+areaOVERAMOUNT8+areaOVERAMOUNT9+areaOVERAMOUNT10+areaOVERAMOUNT11+areaOVERAMOUNT12+areaOVERAMOUNT13+areaOVERAMOUNT14+areaOVERAMOUNT15
+areaOVERAMOUNT16+areaOVERAMOUNT17+areaOVERAMOUNT18+areaOVERAMOUNT19+areaOVERAMOUNT20+areaOVERAMOUNT21;
document.getElementById('areaOverAmount').innerHTML=areaOverAmountSum;
document.getElementById('nowStockAmount').innerHTML=areaOverAmountSum;
//五线七口维度汇总计算

                        
var fiveSALEAMOUNT1 = parseInt(document.getElementById('fiveSALEAMOUNT1').value); 
if(isNaN(fiveSALEAMOUNT1)){
	fiveSALEAMOUNT1=0;
}

var fiveSALEAMOUNT2 = parseInt(document.getElementById('fiveSALEAMOUNT2').value);
if(isNaN(fiveSALEAMOUNT2)){
	fiveSALEAMOUNT2=0;
}
var fiveSALEAMOUNT3 = parseInt(document.getElementById('fiveSALEAMOUNT3').value);
if(isNaN(fiveSALEAMOUNT3)){
	fiveSALEAMOUNT3=0;
}
var fiveSALEAMOUNT4 = parseInt(document.getElementById('fiveSALEAMOUNT4').value);
if(isNaN(fiveSALEAMOUNT4)){
	fiveSALEAMOUNT4=0;
}
var fiveSALEAMOUNT5 = parseInt(document.getElementById('fiveSALEAMOUNT5').value);
if(isNaN(fiveSALEAMOUNT5)){
	fiveSALEAMOUNT5=0;
}
var fiveSALEAMOUNT6 = parseInt(document.getElementById('fiveSALEAMOUNT6').value);
if(isNaN(fiveSALEAMOUNT6)){
	fiveSALEAMOUNT6=0;
}
var fiveSALEAMOUNT7 = parseInt(document.getElementById('fiveSALEAMOUNT7').value);
if(isNaN(fiveSALEAMOUNT7)){
	fiveSALEAMOUNT7=0;
}
var fiveSALEAMOUNT8 = parseInt(document.getElementById('fiveSALEAMOUNT8').value);
if(isNaN(fiveSALEAMOUNT8)){
	fiveSALEAMOUNT8=0;
}
var fiveSALEAMOUNT9 = parseInt(document.getElementById('fiveSALEAMOUNT9').value);
if(isNaN(fiveSALEAMOUNT9)){
	fiveSALEAMOUNT9=0;
}
var fiveSALEAMOUNT10 = parseInt(document.getElementById('fiveSALEAMOUNT10').value);
if(isNaN(fiveSALEAMOUNT10)){
	fiveSALEAMOUNT10=0;
}
var fiveSALEAMOUNT11 = parseInt(document.getElementById('fiveSALEAMOUNT11').value);
if(isNaN(fiveSALEAMOUNT11)){
	fiveSALEAMOUNT11=0;
}
var fiveSALEAMOUNT12 = parseInt(document.getElementById('fiveSALEAMOUNT12').value);
if(isNaN(fiveSALEAMOUNT12)){
	fiveSALEAMOUNT12=0;
}
var fiveSALEAMOUNT13 = parseInt(document.getElementById('fiveSALEAMOUNT13').value);
if(isNaN(fiveSALEAMOUNT13)){
	fiveSALEAMOUNT13=0;
}
var fiveSALEAMOUNT14 = parseInt(document.getElementById('fiveSALEAMOUNT14').value);
if(isNaN(fiveSALEAMOUNT14)){
	fiveSALEAMOUNT14=0;
}                       
                        
var fiveSaleAmountSum="";
fiveSaleAmountSum=fiveSALEAMOUNT1+fiveSALEAMOUNT2+fiveSALEAMOUNT3+fiveSALEAMOUNT4+fiveSALEAMOUNT5+fiveSALEAMOUNT6+fiveSALEAMOUNT7
+fiveSALEAMOUNT8+fiveSALEAMOUNT9+fiveSALEAMOUNT10+fiveSALEAMOUNT11+fiveSALEAMOUNT12+fiveSALEAMOUNT13+fiveSALEAMOUNT14;
//alert(fiveSaleAmountSum);
document.getElementById('fiveSaleAmount').innerHTML=fiveSaleAmountSum; 
 
 //五线七口收入汇总计算
var fiveINCOME1 = parseInt(document.getElementById('fiveINCOME1').value); 
if(isNaN(fiveINCOME1)){
	fiveINCOME1=0;
}

var fiveINCOME2 = parseInt(document.getElementById('fiveINCOME2').value);
if(isNaN(fiveINCOME2)){
	fiveINCOME2=0;
}
var fiveINCOME3 = parseInt(document.getElementById('fiveINCOME3').value);
if(isNaN(fiveINCOME3)){
	fiveINCOME3=0;
}
var fiveINCOME4 = parseInt(document.getElementById('fiveINCOME4').value);
if(isNaN(fiveINCOME4)){
	fiveINCOME4=0;
}
var fiveINCOME5 = parseInt(document.getElementById('fiveINCOME5').value);
if(isNaN(fiveINCOME5)){
	fiveINCOME5=0;
}
var fiveINCOME6 = parseInt(document.getElementById('fiveINCOME6').value);
if(isNaN(fiveINCOME6)){
	fiveINCOME6=0;
}
var fiveINCOME7 = parseInt(document.getElementById('fiveINCOME7').value);
if(isNaN(fiveINCOME7)){
	fiveINCOME7=0;
}
var fiveINCOME8 = parseInt(document.getElementById('fiveINCOME8').value);
if(isNaN(fiveINCOME8)){
	fiveINCOME8=0;
}
var fiveINCOME9 = parseInt(document.getElementById('fiveINCOME9').value);
if(isNaN(fiveINCOME9)){
	fiveINCOME9=0;
}
var fiveINCOME10 = parseInt(document.getElementById('fiveINCOME10').value);
if(isNaN(fiveINCOME10)){
	fiveINCOME10=0;
}
var fiveINCOME11 = parseInt(document.getElementById('fiveINCOME11').value);
if(isNaN(fiveINCOME11)){
	fiveINCOME11=0;
}
var fiveINCOME12 = parseInt(document.getElementById('fiveINCOME12').value);
if(isNaN(fiveINCOME12)){
	fiveINCOME12=0;
}
var fiveINCOME13 = parseInt(document.getElementById('fiveINCOME13').value);
if(isNaN(fiveINCOME13)){
	fiveINCOME13=0;
}
var fiveINCOME14 = parseInt(document.getElementById('fiveINCOME14').value);
if(isNaN(fiveINCOME14)){
	fiveINCOME14=0;
}                       
                        
var fiveIncomeAmountSum="";
fiveIncomeAmountSum=fiveINCOME1+fiveINCOME2+fiveINCOME3+fiveINCOME4+fiveINCOME5+fiveINCOME6+fiveINCOME7
+fiveINCOME8+fiveINCOME9+fiveINCOME10+fiveINCOME11+fiveINCOME12+fiveINCOME13+fiveINCOME14;

document.getElementById('fiveIncomeAmount').innerHTML=fiveIncomeAmountSum; 
 
 //五线七口毛利计算汇总

var fiveMAORI1 = parseInt(document.getElementById('fiveMAORI1').value); 
if(isNaN(fiveMAORI1)){
	fiveMAORI1=0;
}

var fiveMAORI2 = parseInt(document.getElementById('fiveMAORI2').value);
if(isNaN(fiveMAORI2)){
	fiveMAORI2=0;
}
var fiveMAORI3 = parseInt(document.getElementById('fiveMAORI3').value);
if(isNaN(fiveMAORI3)){
	fiveMAORI3=0;
}
var fiveMAORI4 = parseInt(document.getElementById('fiveMAORI4').value);
if(isNaN(fiveMAORI4)){
	fiveMAORI4=0;
}
var fiveMAORI5 = parseInt(document.getElementById('fiveMAORI5').value);
if(isNaN(fiveMAORI5)){
	fiveMAORI5=0;
}
var fiveMAORI6 = parseInt(document.getElementById('fiveMAORI6').value);
if(isNaN(fiveMAORI6)){
	fiveMAORI6=0;
}
var fiveMAORI7 = parseInt(document.getElementById('fiveMAORI7').value);
if(isNaN(fiveMAORI7)){
	fiveMAORI7=0;
}
var fiveMAORI8 = parseInt(document.getElementById('fiveMAORI8').value);
if(isNaN(fiveMAORI8)){
	fiveMAORI8=0;
}
var fiveMAORI9 = parseInt(document.getElementById('fiveMAORI9').value);
if(isNaN(fiveMAORI9)){
	fiveMAORI9=0;
}
var fiveMAORI10 = parseInt(document.getElementById('fiveMAORI10').value);
if(isNaN(fiveMAORI10)){
	fiveMAORI10=0;
}
var fiveMAORI11 = parseInt(document.getElementById('fiveMAORI11').value);
if(isNaN(fiveMAORI11)){
	fiveMAORI11=0;
}
var fiveMAORI12 = parseInt(document.getElementById('fiveMAORI12').value);
if(isNaN(fiveMAORI12)){
	fiveMAORI12=0;
}
var fiveMAORI13 = parseInt(document.getElementById('fiveMAORI13').value);
if(isNaN(fiveMAORI13)){
	fiveMAORI13=0;
}
var fiveMAORI14 = parseInt(document.getElementById('fiveMAORI14').value);
if(isNaN(fiveMAORI14)){
	fiveMAORI14=0;
}                       
                        
var fiveMAORIAmountSum="";
fiveMAORIAmountSum=fiveMAORI1+fiveMAORI2+fiveMAORI3+fiveMAORI4+fiveMAORI5+fiveMAORI6+fiveMAORI7
+fiveMAORI8+fiveMAORI9+fiveMAORI10+fiveMAORI11+fiveMAORI12+fiveMAORI13+fiveMAORI14;

document.getElementById('fiveMaoriAmount').innerHTML=fiveMAORIAmountSum; 

//效验页面的总量值是否相等

    if(saleTotal!=areaSaleSum){
	
	//alert("地市维度销量设置与生命周期销量值不一致，请重新设置！");
    	$("#alertMessage").attr("class", "alert alert-danger");
    	
     }
    if(saleTotal!=fiveSaleAmountSum){
    	
   // alert("五线七口维度销量设置与生命周期销量值不一致，请重新设置！");	
    	$("#alertMessage").attr("class", "alert alert-danger");
    }
    if(incomeTotal!=areaIncomeSum){
    	
    //alert("地市维度收入设置与生命周期收入值不一致，请重新设置！");
    	$("#alertMessage").attr("class", "alert alert-danger");
    	
       }
    if(incomeTotal!=fiveIncomeAmountSum){
    	
        //alert("五线七口维度收入设置与生命周期收入值不一致，请重新设置！");
    	$("#alertMessage").attr("class", "alert alert-danger");	
        	
        }
   if(profitTotal!=fiveMAORIAmountSum){
    	
        //alert("五线七口维度收入设置与生命周期收入值不一致，请重新设置！");
    	$("#alertMessage").attr("class", "alert alert-danger");	
        	
        }
   if(stockTotal!=areaOverAmountSum){
   	
       //alert("五线七口维度收入设置与生命周期收入值不一致，请重新设置！");
   	$("#alertMessage").attr("class", "alert alert-danger");	
       	
       }

    
}

//触发修改生命周期周数列的模态框事件


function editInfoNew(obj) {  
	 var brand =$("#brand").val();	
	   var spec =$("#spec").val();	
	   //var CYCLE=obj;

	   $.ajax({  
	        type: "post",  
	        url: "../parameterSet/addAndUpdateLifeDateNew.do",  
	        data: "brand=" + brand + "&spec=" + spec+"&obj="+obj,  
	        dataType: 'json',  
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
	        success: function(result) {  
	    if(result.obj!=null){
		   
	    	$("#tt").val(result.obj);
		   
	   }
	        	
	        	
	        	
	        	if(result.lifeDate!=null){
	        	if(obj=="1"){
	        	if(result.lifeDate[0].cycle=="1"){
	        	
	        		$("#model_DURATION1").val(result.lifeDate[0].duration);
	        		
	        	
	        	}
	        	if(result.lifeDate[1].cycle=="2"){
	        		
	        		$("#model_DURATION2").val(result.lifeDate[1].duration);
	        		
	           
	        		
	        	}
	        	if(result.lifeDate[2].cycle=="3"){
	        		
	        		$("#model_DURATION3").val(result.lifeDate[2].duration);
	        		
	           
	        	}
	        	if(result.lifeDate[3].cycle=="4"){
	        		
	        		$("#model_DURATION4").val(result.lifeDate[3].duration);
	        		
	           
	        	}
	        	
	        	}
	        	if(obj=="2"){
	        		
	        		var sale="销量（台）";
	        		//$("#change").value(sale);
	        		document.getElementById("change").innerHTML = sale;
	        	   if(result.lifeDate[0].cycle=="1"){
	    	        	
		        		$("#model_DURATION1").val(result.lifeDate[0].saleamount);
		        		
		        	
		        	}
		        	if(result.lifeDate[1].cycle=="2"){
		        		
		        		$("#model_DURATION2").val(result.lifeDate[1].saleamount);
		        		
		           
		        		
		        	}
		        	if(result.lifeDate[2].cycle=="3"){
		        		
		        		$("#model_DURATION3").val(result.lifeDate[2].saleamount);
		        		
		           
		        	}
		        	if(result.lifeDate[3].cycle=="4"){
		        		
		        		$("#model_DURATION4").val(result.lifeDate[3].saleamount);
		        		
		           
		        	}	
	        		
	        		
	        	}
               if(obj=="3"){
	        		
            	   var sale="收入（元）";
	        		//$("#change").value(sale);
	        		document.getElementById("change").innerHTML = sale;
	        	   if(result.lifeDate[0].cycle=="1"){
	    	        	
		        		$("#model_DURATION1").val(result.lifeDate[0].income);
		        		
		        	
		        	}
		        	if(result.lifeDate[1].cycle=="2"){
		        		
		        		$("#model_DURATION2").val(result.lifeDate[1].income);
		        		
		           
		        		
		        	}
		        	if(result.lifeDate[2].cycle=="3"){
		        		
		        		$("#model_DURATION3").val(result.lifeDate[2].income);
		        		
		           
		        	}
		        	if(result.lifeDate[3].cycle=="4"){
		        		
		        		$("#model_DURATION4").val(result.lifeDate[3].income);
		        		
		           
		        	}		
	        		
	        		
	        	}
             if(obj=="4"){
	        		
            	 var sale="毛利（元）";
	        		//$("#change").value(sale);
	        		document.getElementById("change").innerHTML = sale;
	        	   if(result.lifeDate[0].cycle=="1"){
	    	        	
		        		$("#model_DURATION1").val(result.lifeDate[0].maori);
		        		
		        	
		        	}
		        	if(result.lifeDate[1].cycle=="2"){
		        		
		        		$("#model_DURATION2").val(result.lifeDate[1].maori);
		        		
		           
		        		
		        	}
		        	if(result.lifeDate[2].cycle=="3"){
		        		
		        		$("#model_DURATION3").val(result.lifeDate[2].maori);
		        		
		           
		        	}
		        	if(result.lifeDate[3].cycle=="4"){
		        		
		        		$("#model_DURATION4").val(result.lifeDate[3].maori);
		        		
		           
		        	}		
	        		
	        		
	        	}
             if(obj=="5"){
	        		
            	 var sale="覆盖客户（个）";
	        		//$("#change").value(sale);
	        		document.getElementById("change").innerHTML = sale;
	        	   if(result.lifeDate[0].cycle=="1"){
	    	        	
		        		$("#model_DURATION1").val(result.lifeDate[0].overamount);
		        		
		        	
		        	}
		        	if(result.lifeDate[1].cycle=="2"){
		        		
		        		$("#model_DURATION2").val(result.lifeDate[1].overamount);
		        		
		           
		        		
		        	}
		        	if(result.lifeDate[2].cycle=="3"){
		        		
		        		$("#model_DURATION3").val(result.lifeDate[2].overamount);
		        		
		           
		        	}
		        	if(result.lifeDate[3].cycle=="4"){
		        		
		        		$("#model_DURATION4").val(result.lifeDate[3].overamount);
		        		
		           
		        	}		
	        		
	        		
	        	}
             if(obj=="6"){
	        		
	        		
            	 var sale="份额";
	        		//$("#change").value(sale);
	        		document.getElementById("change").innerHTML = sale;
	        	   if(result.lifeDate[0].cycle=="1"){
	    	        	
		        		$("#model_DURATION1").val(result.lifeDate[0].share);
		        		
		        	
		        	}
		        	if(result.lifeDate[1].cycle=="2"){
		        		
		        		$("#model_DURATION2").val(result.lifeDate[1].share);
		        		
		           
		        		
		        	}
		        	if(result.lifeDate[2].cycle=="3"){
		        		
		        		$("#model_DURATION3").val(result.lifeDate[2].share);
		        		
		           
		        	}
		        	if(result.lifeDate[3].cycle=="4"){
		        		
		        		$("#model_DURATION4").val(result.lifeDate[3].share);
		        		
		           
		        	}		
	        		
	        	}
             if(obj=="7"){
	        		
            	 var sale="库存周转（周）";
	        		//$("#change").value(sale);
	        		document.getElementById("change").innerHTML = sale;
	        	   if(result.lifeDate[0].cycle=="1"){
	    	        	
		        		$("#model_DURATION1").val(result.lifeDate[0].turnovertime);
		        		
		        	
		        	}
		        	if(result.lifeDate[1].cycle=="2"){
		        		
		        		$("#model_DURATION2").val(result.lifeDate[1].turnovertime);
		        		
		           
		        		
		        	}
		        	if(result.lifeDate[2].cycle=="3"){
		        		
		        		$("#model_DURATION3").val(result.lifeDate[2].turnovertime);
		        		
		           
		        	}
		        	if(result.lifeDate[3].cycle=="4"){
		        		
		        		$("#model_DURATION4").val(result.lifeDate[3].turnovertime);
		        		
		           
		        	}		
	        		
	        		
	        	}
	        	
	        	}
	        	
	        	}  
	    }); 
    $('#modalWeek').modal('show');  
}
//提交更改  
function updateNew() {  
    //获取模态框数据  
var BRANDNAME =$("#brand").val();	
var SPEC =$("#spec").val();	
var CYCLE1=document.getElementById("cycle1").innerHTML;
//var CYCLE2=$("#cycle2").val();document.getElementById("aaa").innerHTML
var CYCLE2=document.getElementById("cycle2").innerHTML;
var CYCLE3=document.getElementById("cycle3").innerHTML;
var CYCLE4=document.getElementById("cycle4").innerHTML;
var DURATION1=$("#model_DURATION1").val();
var DURATION2=$("#model_DURATION2").val();
var DURATION3=$("#model_DURATION3").val();
var DURATION4=$("#model_DURATION4").val();
var obj=$("#tt").val();
//alert(obj);

if(CYCLE1=="导入期"&&CYCLE1!="") {
	CYCLE1="1";

};
if(CYCLE2=="成长期"&&CYCLE2!="") {
	
	CYCLE2="2";
	
};
if(CYCLE3=="成熟期"&&CYCLE3!="") {
	
	CYCLE3="3";
	
};
if(CYCLE4=="衰退期"&&CYCLE4!="") {
	
	CYCLE4="4";
	
};
if(DURATION1!="") {
	
	CYCLE4="4";
	
};



/* var date={BRANDNAME,SPEC,CYCLE,DURATION,SALEAMOUNT,INCOME,MAORI,OVERAMOUNT,SHARE,TURNOVERTIME}; */
   
   $.ajax({  
        type: "post",  
        url: "../parameterSet/addAndUpdateNew.do",  
       /*  data: "brand=" + brand + "&spec=" + spec,   */
       data:{"BRANDNAME":BRANDNAME,"SPEC":SPEC,"CYCLE1":CYCLE1,
    	   "CYCLE2":CYCLE2,"CYCLE3":CYCLE3,"CYCLE4":CYCLE4,"DURATION1":DURATION1,
    	   "DURATION2":DURATION2,"DURATION3":DURATION3,"DURATION4":DURATION4,"obj":obj},
        dataType: 'json',  
        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
        success: function(result) {  
        	 if(result==1){
          	   
           	  alert("保存成功！"); 
           	  $('#modal').modal('hide');
           	  window.location.reload();
              
              } if(result==2){
           	   
            	  alert("修改成功！"); 
            	  $('#modal').modal('hide');
            	  window.location.reload();
               
               }else{
            	   
            	   alert("保存失败！");   
            	   $('#modal').modal('hide');
             	  window.location.reload();
               }
        
        }  
    }); 
	
};
//-------触发修改和添加城市维度规划设置的操作---------------------------------------------------------------------------------------------

//城市维度规划触发模态框的同时调用此方法  
function cityAmount(obj) {  
	 var brand =$("#brand").val();	
	 var spec =$("#spec").val();	
	 var city=obj;
	 if(city=="1"){
     $('#modalCity').modal('show');  
	 }
	 if(city=="2"){
	 $('#modalIncome').modal('show');  
	 }
     if(city=="3"){
    $('#modalOVERAMOUNTS').modal('show');  
	 }
     }


//城市维度提交更改  
function updateCityNew(obj) {  
    //获取模态框数据  

	var tend=obj;
	var BRANDNAME =$("#brand").val();	
	var SPEC =$("#spec").val();		
	var AREANAME_GZ =$("#AREANAME_GZ").val();		
	var SALEAMOUNTS_GZ =$("#SALEAMOUNTS_GZ").val();
	var INCOMES_GZ =$("#INCOMES_GZ").val();		
	var OVERAMOUNTS_GZ =$("#OVERAMOUNTS_GZ").val();
	if(SALEAMOUNTS_GZ==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_GZ==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_GZ==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	var AREANAME_ZQ=	$("#AREANAME_ZQ").val();
	var SALEAMOUNTS_ZQ=	$("#SALEAMOUNTS_ZQ").val();
	var INCOMES_ZQ =$("#INCOMES_ZQ").val();		
	var OVERAMOUNTS_ZQ =$("#OVERAMOUNTS_ZQ").val();
	if(SALEAMOUNTS_ZQ==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_ZQ==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_ZQ==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	var AREANAME_QY=	$("#AREANAME_QY").val();
	var SALEAMOUNTS_QY=	$("#SALEAMOUNTS_QY").val();
	var INCOMES_QY =$("#INCOMES_QY").val();		
	var OVERAMOUNTS_QY =$("#OVERAMOUNTS_QY").val();
	if(SALEAMOUNTS_QY==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_QY==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_QY==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	
	var AREANAME_SG=	$("#AREANAME_SG").val();
	var SALEAMOUNTS_SG=	$("#SALEAMOUNTS_SG").val();
	var INCOMES_SG =$("#INCOMES_SG").val();		
	var OVERAMOUNTS_SG =$("#OVERAMOUNTS_SG").val();
	if(SALEAMOUNTS_SG==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_SG==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_SG==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	
	var AREANAME_YF=	$("#AREANAME_YF").val();
	var SALEAMOUNTS_YF=	$("#SALEAMOUNTS_YF").val();
	var INCOMES_YF =$("#INCOMES_YF").val();		
	var OVERAMOUNTS_YF =$("#OVERAMOUNTS_YF").val();
	if(SALEAMOUNTS_YF==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_YF==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_YF==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	var AREANAME_SZ=	$("#AREANAME_SZ").val();
	var SALEAMOUNTS_SZ=	$("#SALEAMOUNTS_SZ").val();
	var INCOMES_SZ =$("#INCOMES_SZ").val();		
	var OVERAMOUNTS_SZ =$("#OVERAMOUNTS_SZ").val();
	if(SALEAMOUNTS_SZ==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_SZ==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_SZ==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	
	var AREANAME_ST=	$("#AREANAME_ST").val();
	var SALEAMOUNTS_ST=	$("#SALEAMOUNTS_ST").val();
	var INCOMES_ST =$("#INCOMES_ST").val();		
	var OVERAMOUNTS_ST =$("#OVERAMOUNTS_ST").val();
	if(SALEAMOUNTS_ST==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_ST==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_ST==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	
	var AREANAME_JY=	$("#AREANAME_JY").val();
	var SALEAMOUNTS_JY=	$("#SALEAMOUNTS_JY").val();
	var INCOMES_JY =$("#INCOMES_JY").val();		
	var OVERAMOUNTS_JY =$("#OVERAMOUNTS_JY").val();
	if(SALEAMOUNTS_JY==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_JY==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_JY==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	var AREANAME_MZ=	$("#AREANAME_MZ").val();
	var SALEAMOUNTS_MZ=	$("#SALEAMOUNTS_MZ").val();
	var INCOMES_MZ =$("#INCOMES_MZ").val();		
	var OVERAMOUNTS_MZ =$("#OVERAMOUNTS_MZ").val();
	if(SALEAMOUNTS_MZ==""){
		alert("销量不能为空！"); 
		return false;		
	}
	if(INCOMES_MZ==""){
		alert("收入不能为空！"); 
		return false;		
	}
	if(OVERAMOUNTS_MZ==""){
		alert("覆盖客户数不能为空！"); 
		return false;		
	}
	
	
	
	var AREANAME_CZ=	$("#AREANAME_CZ").val();
	var SALEAMOUNTS_CZ=	$("#SALEAMOUNTS_CZ").val();
	var INCOMES_CZ =$("#INCOMES_CZ").val();		
	var OVERAMOUNTS_CZ =$("#OVERAMOUNTS_CZ").val();
	if(SALEAMOUNTS_CZ==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_CZ==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_CZ==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	
	var AREANAME_SW=	$("#AREANAME_SW").val();
	var SALEAMOUNTS_SW=	$("#SALEAMOUNTS_SW").val();
	var INCOMES_SW =$("#INCOMES_SW").val();		
	var OVERAMOUNTS_SW =$("#OVERAMOUNTS_SW").val();
	if(SALEAMOUNTS_SW==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_SW==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_SW==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	var AREANAME_DG=	$("#AREANAME_DG").val();
	var SALEAMOUNTS_DG=	$("#SALEAMOUNTS_DG").val();
	var INCOMES_DG =$("#INCOMES_DG").val();		
	var OVERAMOUNTS_DG =$("#OVERAMOUNTS_DG").val();
	if(SALEAMOUNTS_DG==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_DG==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_DG==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	var AREANAME_ZS=	$("#AREANAME_ZS").val();
	var SALEAMOUNTS_ZS=	$("#SALEAMOUNTS_ZS").val();
	var INCOMES_ZS =$("#INCOMES_ZS").val();		
	var OVERAMOUNTS_ZS =$("#OVERAMOUNTS_ZS").val();
	if(SALEAMOUNTS_ZS==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_ZS==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_ZS==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	var AREANAME_HZ=	$("#AREANAME_HZ").val();
	var SALEAMOUNTS_HZ=	$("#SALEAMOUNTS_HZ").val();
	var INCOMES_HZ =$("#INCOMES_HZ").val();		
	var OVERAMOUNTS_HZ =$("#OVERAMOUNTS_HZ").val();
	if(SALEAMOUNTS_HZ==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_HZ==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_HZ==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	var AREANAME_ZH=	$("#AREANAME_ZH").val();
	var SALEAMOUNTS_ZH=	$("#SALEAMOUNTS_ZH").val();
	var INCOMES_ZH =$("#INCOMES_ZH").val();		
	var OVERAMOUNTS_ZH =$("#OVERAMOUNTS_ZH").val();
	if(SALEAMOUNTS_ZH==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_ZH==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_ZH==""){
		alert("覆盖客户数不能为空！"); 
		return false;		
	}
	
	
	var AREANAME_HY=	$("#AREANAME_HY").val();
	var SALEAMOUNTS_HY=	$("#SALEAMOUNTS_HY").val();
	var INCOMES_HY =$("#INCOMES_HY").val();		
	var OVERAMOUNTS_HY =$("#OVERAMOUNTS_HY").val();
	if(SALEAMOUNTS_HY==""){
		alert("销量不能为空！"); 
		return false;		
	}
	if(INCOMES_HY==""){
		alert("收入不能为空！"); 
		return false;		
	}
	if(OVERAMOUNTS_HY==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	
	var AREANAME_FS=	$("#AREANAME_FS").val();
	var SALEAMOUNTS_FS=	$("#SALEAMOUNTS_FS").val();
	var INCOMES_FS =$("#INCOMES_FS").val();		
	var OVERAMOUNTS_FS =$("#OVERAMOUNTS_FS").val();
	if(SALEAMOUNTS_FS==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_FS==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_FS==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	
	var AREANAME_JM=	$("#AREANAME_JM").val();
	var SALEAMOUNTS_JM=	$("#SALEAMOUNTS_JM").val();
	var INCOMES_JM =$("#INCOMES_JM").val();		
	var OVERAMOUNTS_JM =$("#OVERAMOUNTS_JM").val();
	if(SALEAMOUNTS_JM==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_JM==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_JM==""){
		alert("覆盖客户数不能为空！"); 
		return false;		
	}
	
	
	
	var AREANAME_ZJ=	$("#AREANAME_ZJ").val();
	var SALEAMOUNTS_ZJ=	$("#SALEAMOUNTS_ZJ").val();
	var INCOMES_ZJ =$("#INCOMES_ZJ").val();		
	var OVERAMOUNTS_ZJ =$("#OVERAMOUNTS_ZJ").val();
	if(SALEAMOUNTS_ZJ==""){
		alert("销量不能为空！"); 
		return false;		
	}
	if(INCOMES_ZJ==""){
		alert("收入不能为空！"); 
		return false;		
	}
	if(OVERAMOUNTS_ZJ==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	
	var AREANAME_MM=	$("#AREANAME_MM").val();
	var SALEAMOUNTS_MM=	$("#SALEAMOUNTS_MM").val();
	var INCOMES_MM =$("#INCOMES_MM").val();		
	var OVERAMOUNTS_MM =$("#OVERAMOUNTS_MM").val();
	if(SALEAMOUNTS_MM==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(INCOMES_MM==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(OVERAMOUNTS_MM==""){
		alert("覆盖客户数不能为空或输入0！"); 
		return false;		
	}
	
	
	
	var AREANAME_YJ=	$("#AREANAME_YJ").val();
	var SALEAMOUNTS_YJ=	$("#SALEAMOUNTS_YJ").val();
	var INCOMES_YJ =$("#INCOMES_YJ").val();		
	var OVERAMOUNTS_YJ =$("#OVERAMOUNTS_YJ").val();
	if(SALEAMOUNTS_YJ==""){
		alert("销量不能为空！"); 
		return false;		
	}
	if(INCOMES_YJ==""){
		alert("收入不能为空！"); 
		return false;		
	}
	if(OVERAMOUNTS_YJ==""){
		alert("覆盖客户数不能为空！"); 
		return false;		
	}
	
	
	
	var date={BRANDNAME,SPEC,AREANAME_GZ,SALEAMOUNTS_GZ,INCOMES_GZ,OVERAMOUNTS_GZ,
AREANAME_ZQ,SALEAMOUNTS_ZQ,INCOMES_ZQ,OVERAMOUNTS_ZQ,
AREANAME_QY,SALEAMOUNTS_QY,INCOMES_QY,OVERAMOUNTS_QY,
AREANAME_SG,SALEAMOUNTS_SG,INCOMES_SG,OVERAMOUNTS_SG,
AREANAME_YF, SALEAMOUNTS_YF,INCOMES_YF,OVERAMOUNTS_YF,
AREANAME_SZ,SALEAMOUNTS_SZ,INCOMES_SZ,OVERAMOUNTS_SZ,
AREANAME_ST,SALEAMOUNTS_ST,INCOMES_ST,OVERAMOUNTS_ST,
AREANAME_JY, SALEAMOUNTS_JY,INCOMES_JY,OVERAMOUNTS_JY,
AREANAME_MZ,SALEAMOUNTS_MZ,INCOMES_MZ,OVERAMOUNTS_MZ,
AREANAME_CZ,SALEAMOUNTS_CZ,INCOMES_CZ,OVERAMOUNTS_CZ,
AREANAME_SW,SALEAMOUNTS_SW,INCOMES_SW,OVERAMOUNTS_SW,
AREANAME_DG,SALEAMOUNTS_DG,INCOMES_DG,OVERAMOUNTS_DG,
AREANAME_ZS,SALEAMOUNTS_ZS,INCOMES_ZS,OVERAMOUNTS_ZS,
AREANAME_HZ,SALEAMOUNTS_HZ,INCOMES_HZ,OVERAMOUNTS_HZ,
AREANAME_ZH,SALEAMOUNTS_ZH,INCOMES_ZH,OVERAMOUNTS_ZH,
AREANAME_HY,SALEAMOUNTS_HY,INCOMES_HY,OVERAMOUNTS_HY,
AREANAME_FS,SALEAMOUNTS_FS,INCOMES_FS,OVERAMOUNTS_FS,
AREANAME_JM,SALEAMOUNTS_JM,INCOMES_JM,OVERAMOUNTS_JM,
AREANAME_ZJ,SALEAMOUNTS_ZJ,INCOMES_ZJ,OVERAMOUNTS_ZJ,
AREANAME_MM,SALEAMOUNTS_MM,INCOMES_MM,OVERAMOUNTS_MM,
AREANAME_YJ,SALEAMOUNTS_YJ,INCOMES_YJ,OVERAMOUNTS_YJ,tend};  

 if(obj=="1"){
  
  $.ajax({  
        type: "post",  
        url: "../parameterSet/addAndUpdateCityDateNew.do",  
        data:date,  
        dataType: 'json',  
        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
        success: function(result) {  
           if(result==1){
        	   
        	  alert("保存成功！"); 
        	  $('#modal1').modal('hide');
        	  window.location.reload();
           
           } if(result==2){
        	   
         	  alert("修改成功！"); 
         	  $('#modal1').modal('hide');
         	  window.location.reload();
            
            }
           
        	//location.reload();  
        	//window.location.reload();
            //$('#modal1').modal('hide');
        }  
    }); 
	
}

}

//五线七口整个表格数据修改调用模态框的js

function fineAmount() {  
	 var brand =$("#brand").val();	
	 var spec =$("#spec").val();	
	 

   $('#fineDateNew').modal('show');  
	
    }


//五线七口整个表格数据修改调用模态框的js保存和修改操作

function updateFineNew() {  
    //获取模态框数据  
   var BRANDNAME =$("#brand").val();	
   var SPEC =$("#spec").val();	
  //获取五线的数据
   var  LINENAME_1=document.getElementById("LINENAME_1").innerHTML;
   //var LINENAME_1= $("#LINENAME_1").val();
 //获取七口的数据  PORTNAME2_1
   var PORTNAME1_1=$("#PORTNAME1_1").val();
   //获取量收利的值
   var fiveSALEAMOUNT1=$("#fiveSALEAMOUNT1_1").val();
   //var  fiveSALEAMOUNT1=document.getElementById("fiveSALEAMOUNT1").value;
   var  fiveINCOME1=document.getElementById("fiveINCOME1_1").value;
   //var fiveINCOME1=$("#fiveINCOME1").val();
   //var fiveMAORI1=$("#fiveMAORI1").val();
   var  fiveMAORI1=document.getElementById("fiveMAORI1_1").value;
   if(fiveSALEAMOUNT1==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(fiveINCOME1==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(fiveMAORI1==""){
		alert("毛利不能为空或输入0！"); 
		return false;		
	}
   
   
   
   
   var PORTNAME1_2=$("#PORTNAME1_2").val();
   //获取量收利的值
   var fiveSALEAMOUNT2=$("#fiveSALEAMOUNT2_1").val();
   var fiveINCOME2=$("#fiveINCOME2_1").val();
   var fiveMAORI2=$("#fiveMAORI2_1").val();
   if(fiveSALEAMOUNT2==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(fiveINCOME2==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(fiveMAORI2==""){
		alert("毛利不能为空或输入0！"); 
		return false;		
	}
   
   
   
   var PORTNAME1_3=$("#PORTNAME1_3").val();
   var fiveSALEAMOUNT3=$("#fiveSALEAMOUNT3_1").val();
   var fiveINCOME3=$("#fiveINCOME3_1").val();
   var fiveMAORI3=$("#fiveMAORI3_1").val();
   if(fiveSALEAMOUNT3==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(fiveINCOME3==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(fiveMAORI3==""){
		alert("毛利不能为空或输入0！"); 
		return false;		
	}
   
   
   
   var PORTNAME1_4=$("#PORTNAME1_4").val();
   var fiveSALEAMOUNT4=$("#fiveSALEAMOUNT4_1").val();
   var fiveINCOME4=$("#fiveINCOME4_1").val();
   var fiveMAORI4=$("#fiveMAORI4_1").val();
   if(fiveSALEAMOUNT4==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(fiveINCOME4==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(fiveMAORI4==""){
		alert("毛利不能为空或输入0！"); 
		return false;		
	}
   
   
 //获取五线的数据
   var  LINENAME_2=document.getElementById("LINENAME_2").innerHTML;
   var  LINENAME_6=document.getElementById("LINENAME_6").innerHTML;
 //获取七口的数据  PORTNAME2_1
   var PORTNAME2_1=$("#PORTNAME2_1").val();
   var fiveSALEAMOUNT5=$("#fiveSALEAMOUNT5_1").val();
   var fiveINCOME5=$("#fiveINCOME5_1").val();
   var fiveMAORI5=$("#fiveMAORI5_1").val();
   if(fiveSALEAMOUNT5==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(fiveINCOME5==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(fiveMAORI5==""){
		alert("毛利不能为空或输入0！"); 
		return false;		
	}
   
   var PORTNAME2_2=$("#PORTNAME2_2").val();
   var fiveSALEAMOUNT6=$("#fiveSALEAMOUNT6_1").val();
   var fiveINCOME6=$("#fiveINCOME6_1").val();
   var fiveMAORI6=$("#fiveMAORI6_1").val();
   if(fiveSALEAMOUNT6==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(fiveINCOME6==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(fiveMAORI6==""){
		alert("毛利不能为空或输入0！"); 
		return false;		
	}
   
   
   var PORTNAME2_3=$("#PORTNAME2_3").val();
   var fiveSALEAMOUNT7=$("#fiveSALEAMOUNT7_1").val();
   var fiveINCOME7=$("#fiveINCOME7_1").val();
   var fiveMAORI7=$("#fiveMAORI7_1").val();
   if(fiveSALEAMOUNT7==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(fiveINCOME7==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(fiveMAORI7==""){
		alert("毛利不能为空或输入0！"); 
		return false;		
	}
   
   var PORTNAME2_4=$("#PORTNAME2_4").val();
   var fiveSALEAMOUNT8=$("#fiveSALEAMOUNT8_1").val();
   var fiveINCOME8=$("#fiveINCOME8_1").val();
   var fiveMAORI8=$("#fiveMAORI8_1").val();
   
   if(fiveSALEAMOUNT8==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(fiveINCOME8==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(fiveMAORI8==""){
		alert("毛利不能为空或输入0！"); 
		return false;		
	}
 //获取五线的数据
   var  LINENAME_3=document.getElementById("LINENAME_3").innerHTML;
   //获取七口的数据  PORTNAME2_1
   var PORTNAME3_1=$("#PORTNAME3_1").val();
   var fiveSALEAMOUNT9=$("#fiveSALEAMOUNT9_1").val();
   var fiveINCOME9=$("#fiveINCOME9_1").val();
   var fiveMAORI9=$("#fiveMAORI9_1").val();
   if(fiveSALEAMOUNT9==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(fiveINCOME9==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(fiveMAORI9==""){
		alert("毛利不能为空或输入0！"); 
		return false;		
	}
   
   
   var  LINENAME_4=document.getElementById("LINENAME_4").innerHTML;
   //获取七口的数据  PORTNAME2_1
   var PORTNAME4_1=$("#PORTNAME4_1").val();
   var fiveSALEAMOUNT10=$("#fiveSALEAMOUNT10_1").val();
   var fiveINCOME10=$("#fiveINCOME10_1").val();
   var fiveMAORI10=$("#fiveMAORI10_1").val();
   if(fiveSALEAMOUNT10==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(fiveINCOME10==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(fiveMAORI10==""){
		alert("毛利不能为空或输入0！"); 
		return false;		
	}
   
   
   var  LINENAME_5=document.getElementById("LINENAME_5").innerHTML;
   //获取七口的数据  PORTNAME2_1
   var PORTNAME5_1=$("#PORTNAME5_1").val();
   var fiveSALEAMOUNT11=$("#fiveSALEAMOUNT11_1").val();
   var fiveINCOME11=$("#fiveINCOME11_1").val();
   var fiveMAORI11=$("#fiveMAORI11_1").val();
   
   if(fiveSALEAMOUNT11==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(fiveINCOME11==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(fiveMAORI11==""){
		alert("毛利不能为空或输入0！"); 
		return false;		
	}
   var PORTNAME5_2=$("#PORTNAME5_2").val();
   var fiveSALEAMOUNT12=$("#fiveSALEAMOUNT12_1").val();
   var fiveINCOME12=$("#fiveINCOME12_1").val();
   var fiveMAORI12=$("#fiveMAORI12_1").val();
   if(fiveSALEAMOUNT12==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(fiveINCOME12==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(fiveMAORI12==""){
		alert("毛利不能为空或输入0！"); 
		return false;		
	}
   
   var PORTNAME5_3=$("#PORTNAME5_3").val();
   var fiveSALEAMOUNT13=$("#fiveSALEAMOUNT13_1").val();
   var fiveINCOME13=$("#fiveINCOME13_1").val();
   var fiveMAORI13=$("#fiveMAORI13_1").val();
   if(fiveSALEAMOUNT13==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(fiveINCOME13==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(fiveMAORI13==""){
		alert("毛利不能为空或输入0！"); 
		return false;		
	}
   
   var PORTNAME6_1=$("#PORTNAME6_1").val();
   var fiveSALEAMOUNT14=$("#fiveSALEAMOUNT14_1").val();
   var fiveINCOME14=$("#fiveINCOME14_1").val();
   var fiveMAORI14=$("#fiveMAORI14_1").val();
   if(fiveSALEAMOUNT14==""){
		alert("销量不能为空或输入0！"); 
		return false;		
	}
	if(fiveINCOME14==""){
		alert("收入不能为空或输入0！"); 
		return false;		
	}
	if(fiveMAORI14==""){
		alert("毛利不能为空或输入0！"); 
		return false;		
	}
   
   //获取七口的数据  PORTNAME2_1
var date={BRANDNAME,SPEC,LINENAME_1,LINENAME_2,LINENAME_3,LINENAME_4,LINENAME_5,LINENAME_6,
		PORTNAME1_1,PORTNAME1_2,PORTNAME1_3,PORTNAME1_4,PORTNAME2_1,PORTNAME2_2,
		PORTNAME2_3,PORTNAME2_4,PORTNAME3_1,PORTNAME4_1,PORTNAME5_1,PORTNAME5_2,
		PORTNAME5_3,PORTNAME6_1,fiveSALEAMOUNT1,fiveSALEAMOUNT2,fiveSALEAMOUNT3,
		fiveSALEAMOUNT4,fiveSALEAMOUNT5,fiveSALEAMOUNT6,fiveSALEAMOUNT7,fiveSALEAMOUNT8,
		fiveSALEAMOUNT9,fiveSALEAMOUNT10,fiveSALEAMOUNT11,fiveSALEAMOUNT12,fiveSALEAMOUNT13,
		fiveSALEAMOUNT14,fiveINCOME1,fiveINCOME2,fiveINCOME3,fiveINCOME4,fiveINCOME5,fiveINCOME6,
		fiveINCOME7,fiveINCOME8,fiveINCOME9,fiveINCOME10,fiveINCOME11,fiveINCOME12,fiveINCOME13,
		fiveINCOME14,fiveMAORI1,fiveMAORI2,fiveMAORI3,fiveMAORI4,fiveMAORI5,fiveMAORI6,fiveMAORI7,
		fiveMAORI8,fiveMAORI9,fiveMAORI10,fiveMAORI11,fiveMAORI12,fiveMAORI13,fiveMAORI14		
};
  

  $.ajax({  
        type: "post",  
        url: "../parameterSet/addUpdateFineDateNew.do",  
        data:date,  
        dataType: 'json',  
        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
        success: function(result) {  
        	 if(result==1||result==0){
          	   
           	  alert("保存成功！"); 
           	  $('#fineDateNew').modal('hide');
           	  window.location.reload();
              
              } if(result==2){
           	   
            	  alert("修改成功！"); 
            	  $('#fineDateNew').modal('hide');
            	  window.location.reload();
               
               }
              
              
        }  
    }); 
 
  
}










