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
      url: '../model5Gdate/upload.do',
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




//提交更改  
function updateNew() {  
    //获取模态框数据  
	//var id = document.getElementById("model_DURATION0").value
	var id =$("#model_DURATION0").val();
	var scmPort =$("#model_DURATION1").val();
	var phoneKind=$("#model_DURATION2").val();
	var brand=$("#model_DURATION3").val();
	var spec =$("#model_DURATION4").val();
	var catched=$("#model_DURATION5").val();
	var model=$("#model_DURATION6").val();
	var rebateCatched=$("#model_DURATION7").val();
	var rebateTime=	$("#model_DURATION8").val(); 
	var rebatePolicy=$("#model_DURATION9").val();
	var rebateRemark=$("#model_DURATION10").val();
	var rebateKind=	$("#model_DURATION11").val();
	if(scmPort==""){
		alert("SCM卡类型不能为空！");
		return false;
	}
    if(phoneKind==""){
		alert("产品类型不能为空！");
		return false;
	}
    if(brand==""){
		alert("品牌不能为空！");
		return false;
	}
    if(spec==""){
		alert("机型不能为空！");
		return false;
	}
	
	
	
	
   
   $.ajax({  
        type: "post",  
        url: "../model5Gdate/updateModel.do",  
       /*  data: "brand=" + brand + "&spec=" + spec,   */
       data:{"id":id,"scmPort":scmPort,"phoneKind":phoneKind,"brand":brand,"spec":spec,
    	   "catched":catched,"model":model,"rebateCatched":rebateCatched,"rebateTime":rebateTime,
    	   "rebatePolicy":rebatePolicy,"rebateRemark":rebateRemark,"rebateKind":rebateKind},
        dataType: 'json',  
        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
        success: function(result) {  
        	 if(result==1){
          	   
           	  alert("添加成功！"); 
           	  $('#myModal1').modal('hide');
           	  window.location.reload();
              
              } if(result==2){
           	   
            	  alert("修改成功！"); 
            	  $('#myModal1').modal('hide');
            	  window.location.reload();
               
               }else if(result!=1 && result!=2){
            	   alert("操作数据失败！"); 
             	  $('#myModal1').modal('hide');  
             	 window.location.reload();
               }
        
        }  
    }); 
	
};


//删除操作 
function deleteD(obj) {  
    //获取模态框数据  
	//var id = document.getElementById("model_DURATION0").value
	var id =obj;
	
   
   $.ajax({  
        type: "post",  
        url: "../model5Gdate/deleteModel.do",  
       /*  data: "brand=" + brand + "&spec=" + spec,   */
       data:{"id":id},
        dataType: 'json',  
        contentType: "application/x-www-form-urlencoded; charset=utf-8",  
        success: function(result) {  
        	 if(result==1){
          	   
           	  alert("删除成功！"); 
           	  //$('#myModal1').modal('hide');
           	  window.location.reload();
              
              } if(result==2){
           	   
            	  alert("删除失败！"); 
            	  //$('#myModal1').modal('hide');
            	  window.location.reload();
               
               }
        
        }  
    }); 
	
};

// 查询功能的实现

function selelctAll(){
	
	var phoneKind=$("#kind1").val();
	var brand=$("#brand1").val();
	var spec =$("#spec1").val();
	var pageNumber=1;
	var pp="1";
	$.StandardGet(basePath+'/model5Gdate/modelList.do',{'phoneKind':phoneKind,'brand':brand,'spec':spec,'pageNumber':pageNumber,'pp':pp});
	
	
	
} 	 

//get提交的方式
$.extend({
    StandardGet:function(url,args){
        var form = $("<form method='get'></form>"),
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

// 分页首页
function one(obj){
	
	var str = obj;
	var m = str.split(",");
	var pageNumber=1;
	var phoneKind=m[0];
	var brand=m[1];
	var spec =m[2];
	var pp="2";
	
	$.StandardGet(basePath+'/model5Gdate/modelList.do',{'phoneKind':phoneKind,'brand':brand,'spec':spec,'pageNumber':pageNumber,'pp':pp});
	
	
	
} 	 



//分页上一页
function fistOn(obj){
	
	var str = obj;
	var m = str.split(",");
	var pageNumber=m[0];
	var phoneKind=m[1];
	var brand=m[2];
	var spec =m[3];
	var pp="2";
	
	$.StandardGet(basePath+'/model5Gdate/modelList.do',{'phoneKind':phoneKind,'brand':brand,'spec':spec,'pageNumber':pageNumber,'pp':pp});
	
	
	
}
//分页下一页
function next(obj){
	var str = obj;
	var m = str.split(",");
	var pageNumber=m[0];
	var phoneKind=m[1];
	var brand=m[2];
	var spec =m[3];
	var pp="2";
	
	
	
	$.StandardGet(basePath+'/model5Gdate/modelList.do',{'phoneKind':phoneKind,'brand':brand,'spec':spec,'pageNumber':pageNumber,'pp':pp});
	
	
	
}
//分页尾页
function last(obj){
	
	var str = obj;
	var m = str.split(",");
	var pageNumber=m[0];
	var phoneKind=m[1];
	var brand=m[2];
	var spec =m[3];
	var pp="2";
	
	$.StandardGet(basePath+'/model5Gdate/modelList.do',{'phoneKind':phoneKind,'brand':brand,'spec':spec,'pageNumber':pageNumber,'pp':pp});
	
	
	
}












