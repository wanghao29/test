$(document).ready(function() {

    //时间控件设置初始时间
    $(".prevMonth").val(getPrevMonthValue());
    //城市下拉框初始化
    citySelectInit($('#citySelect'));
    //顶部菜单切换
    $("#menu li").attr("class","drop");
    $("#followCustomerSearch").attr("class","active");    
    
	   $("#citySelect").change(function(){
		   getMaxValue();
	   });
	
	$(".span2_no").each(function() {
		$(this).slider({});
	});
	$(".span2").each(function() {
		$(this).slider({});
	});
	
//	$("#brandname").select2({});
//	$("#spec").select2({});
//	$("#tag11").select2({});
//	$("#tag12").select2({});
	
	//随复选框状态动态赋予或取消后面表单控件的name属性
    $(".cb_slider").change(function(){  
    	var check = $(this).prop("checked");
    	var slider = $(this).parent().next().next();
    	if(check){   		
    		slider.attr("name",slider.attr("id"));    		
    	}else{
    		slider.removeAttr("name");    
    	}
    });
    $(".cb_select").change(function(){  
    	var check = $(this).prop("checked");
        var select = $(this).parent().next().children("div").children("select");
    	if(check){   		
    		select.attr("name",select.attr("id"));    		
    	}else{
    		select.removeAttr("name");    
    	}  
    });
    
    //复选框、全选框
	$(".cb_parent").click(function() {
		var ul = $(this).parent().parent().next();
		var cb_childs = ul.children("li").children("label").children("input");
		var isChecked = $(this).prop("checked");
		cb_childs.prop("checked",isChecked);
		cb_childs.change(); //
		showQueryCondition();
	});
	$(".cb_child").click(function() {
		var ul = $(this).parent().parent().parent();
		var cb_parent = ul.prev().children("span").children("input");
		var cb_childs = ul.children("li").children("label").children("input");
		var isAllChecked = true;		
		cb_childs.each(function() {
			var ischecked = $(this).prop("checked");
			if(ischecked==false){
				isAllChecked = false;
			}
		});	
		cb_parent.prop("checked",isAllChecked);
		showQueryCondition();
	});
	
});


function showSolider(data,value){
    for(var i in data){
        if( $("#"+i+"").length>0 && $("#"+i+"").hasClass("span2")){
        	//重建div
//        	var parent =  $("#"+i).parent();
//        	var prev =  $("#"+i).prev();
//        	var name = $("#"+i).attr("name");
//        	prev.remove();
//        	$("#"+i).remove();       	 
//        	parent.append('<input id="'+i+'" name="'+name+'"type="text" class="span2" /> ');
        	$("#"+i).slider("destroy");
        	
        	var max = parseInt(data[i]);
        	if(data[i]==null || data[i]==""){
        		max = 0;
        	}
        	
        	var step;
        	if(max>1){
        		 step = Math.ceil(max/100);
        	}else{
        		 step = max/20;
        	}

            var mySlider = $("#"+i+"").slider({
            	disabled:false,
            	animate:true,
            	mix:0,
            	max:max,
            	step:step,
            	range:true,
            	value:[0,max],
            	triggerSlideEvent:false,//setValue为slider设置一个新值。如果可选的triggerSlideEvent参数为true，'slide'事件将被触发
            }); 
            
            tooltip(i);
        }
    }
};

function tooltip(i){
    //清除提示，自定义提示
    var parent =  $("#"+i).parent();
    var slider = parent.children(".slider");
    var slider_childs = slider.children();
    slider_childs.eq(1).hide();   
    slider_childs.eq(2).hide();   
    slider_childs.eq(3).hide();   

	var oldTitle = null;
	slider.bind('mouseover mouseout mousemove click',function(event){  
		var slider_selection = $(this).children().eq(0).children(".slider-selection");
		var width = slider_selection.innerWidth();
	    var left = slider_selection.offset().left + width/2;//event.pageX ;
	    var top = slider_selection.offset().top - 40;//event.pageY +10;   

	    var type = event.originalEvent.type;
	    if(type == 'mouseover'){
	    	if($('.showTitleBox').length==0){
	            var showEle = $('<div class="showTitleBox">'+
    					'<input type="text" class="input_left" style="min-width:30px;background:#00093f;border-right:none;text-align:right;"/>&nbsp;:&nbsp;'+
    					'<input type="text" class="input_right" style="min-width:30px;background:#00093f;border-left:none;"/>'+
    				'</div>').css({
			        position:'absolute',
			        border:'1px solid #CCC',
			        borderRadius:'5px',
			        fontSize:22,
			        color:'#fff',
			        //fontFamily:'SimHei',
			        background:'#00093f',
			        opacity:1, //0完全透明
			    })
			    showEle.appendTo('body');	    		
	    	}

            
	        //初始化值
	    	var values = $("#"+i).slider( "getValue" );
	    	$(".input_left").val(values[0]);
            $(".input_right").val(values[1]);            
            
            //初始化宽度
            $(".input_left").width($(".input_left").val().length*15+'px');
            $(".input_right").width($(".input_right").val().length*15+'px');
	        $('.showTitleBox').css({
	            top:top,
	            left:left-$('.showTitleBox').innerWidth()/2,
	        });

	    }else if(type == 'mouseout'){
		    var mouseLeft = event.pageX ;
		    var mouseTop = event.pageY;
            var middleX = mouseLeft>=$(this).offset().left && mouseLeft <=$(this).offset().left+$(this).innerWidth();
            var middleY = mouseTop >= $(this).offset().top-40 && mouseTop <= $(this).offset().top+10;
            if(!middleX || !middleY){
            	$('.showTitleBox').remove();          
            }        	        
	    }else if(type=='mousemove' || type=='click'){
	        $('.showTitleBox').css({
	            top:top,
	            left:left-$('.showTitleBox').innerWidth()/2,
	        });
	    }
	    
        //动态监听输入框值变化的情况: jQuery只需要同时绑定 oninput 和 onpropertychange 两个事件就可以了
	    $(".input_left,.input_right").unbind('input propertychange').bind('input propertychange', function(){
	    	 $(this).width($(this).val().length*15+'px');
	         $('.showTitleBox').css({
	             top:top,
	             left:left-$('.showTitleBox').innerWidth()/2,
	         });
	    });
	    
	    //鼠标移入输入框、该输入框获取焦点
	    $(".input_left,.input_right").unbind('mouseover mousemove').bind('mouseover mousemove', function(){
	    	 $(this).focus();
	    });
	    
	    //鼠标移出输入框、该输入框失去焦点。并将值同步到滑块
	    $(".input_left,.input_right").unbind('mouseout').bind('mouseout', function(){
	    	 $(this).blur();
	         var val0 = Number($(".input_left").val());
		     var val1 = Number($(".input_right").val());
	    	 
	    	 //
	    	 if(val0>val1){
	    		 var temp = val0;
	    		 val0 = val1;
	    		 val1 = temp;
	    		 $(".input_left").val(val0);
	    		 $(".input_right").val(val1);
	    	 }	    	 
	    	 
		     $("#"+i).slider("setValue",[val0,val1]);
		     showQueryCondition();
	    });
	    
	    //滑动值用户改变监听	  
	    $("#"+i).off( "change slide");
	    $("#"+i).on( "change slide", function(event, ui){
	    	var values = $("#"+i).slider( "getValue" );
	    	 $(".input_left").val(values[0]);
             $(".input_right").val(values[1]);
	         $('.showTitleBox').css({
	             top:top,
	             left:left-$('.showTitleBox').innerWidth()/2,
	         });
	         showQueryCondition();
	    })
	    	    
	    $("#"+i).off( "slideStop");
	    $("#"+i).on( "slideStop", function(event, ui){
        	//处理 当都取最大值时，前面的值莫名超过最大值
        	setTimeout(function(){
        		var val = $("#"+i).val();
        		var val0 = Number(val.split(",")[0]);
        		var val1 = Number(val.split(",")[1]);
        		if(val0>val1){
        			 $("#"+i).slider("setValue",[val1,val1]);
        			 showQueryCondition();
        		}
        	},100);
	    })
	   
	});
}





function showQueryResult(data){
	$("#result_tbody").html(''); 
	for(var i=0; i<data.length; i++){
		$("#result_tbody").append('<tr id="tb_tr'+i+'" ></tr>'); 
		
		$("#tb_tr"+i).append(
				'<td>'+data[i].orgacode+'</td>' +
				'<td>'+data[i].tag3+'</td>' +
				'<td>'+data[i].tag2+'</td>' +
				'<td>'+data[i].tag6+'</td>' +
				'<td>'+data[i].tag7+'</td>' +
				'<td>'+data[i].tag1+'</td>' +
				'<td><a href="#">查看</a></td>' +
				'<td><a href="#">查看</a></td>' 
	    );        		
	}
}

function showQueryCondition(){
	$("#query_conditions").html("");
	for(var i=1;i<8;i++){
		var title;
		if(i==1){
			title = "营销活动筛选";
		}else if(i==2){
			title = "引入产品涉销情况";
		}else if(i==3){
			title = "提货偏好";
		}else if(i==4){
			title = "PSI流速";
		}else if(i==5){
			title = "客流量信息";
		}else if(i==6){
			title = "厅店扩展";
		}else if(i==7){
			title = "DM流向";
		}
				
		if($("#type"+i+" input:checkbox:checked").length>0){
			$("#query_conditions").append('<ul class="conditions_select" id="query_conditions_type'+i+'"><li >'+title+'</li></ul>');
			$("#query_conditions").append('<br style="clear:both"/>');
			$("#type"+i+" input:checkbox:checked").each(function() {
				var name = $(this).parent().text();
				var value;
				if($(this).hasClass("cb_slider")){
					value = $(this).parent().next().next().val();
				}
				if($(this).hasClass("cb_select")){
					value = $(this).parent().next().children("div").children("select").val();
				}	
				var arr = value.split(",");
				if(arr.length>1){
					$("#query_conditions_type"+i).append('<li>'+name+': <span>'+arr[0]+'</span>-<span>'+arr[1]+'</span></li>');
				}else{
					$("#query_conditions_type"+i).append('<li>'+name+': <span>'+arr[0]+'</span></li>');
				}
			});
		}				
	}
}

function showBrands2(brands){	
	var id = "brandname";
    
    $("#"+id).empty();     
    $("#"+id).select2({    	
    	data:brands,    	
    });
    $("#"+id).on("select2:select",function(e){ 
    	getSpecsByBrand2();
    	showQueryCondition();
	});
};	
	

function showBrands3(brands){	
	var id = "tag11";
    
    $("#"+id).empty();     
    $("#"+id).select2({    	
    	data:brands,    	
    });
    $("#"+id).on("select2:select",function(e){ 
    	getSpecsByBrand3();
    	showQueryCondition();
	});
};


function showSpecs2(specs){	
	var id = "spec";   
    $("#"+id).empty();     
    $("#"+id).select2({    	
    	data:specs,    	
    });
    $("#"+id).off("select2:select");
    $("#"+id).on("select2:select",function(e){ 
    	showQueryCondition();
	});
};

function showSpecs3(specs){	
	var id = "tag12";   
    $("#"+id).empty();     
    $("#"+id).select2({    	
    	data:specs,    	
    });
    $("#"+id).off("select2:select");
    $("#"+id).on("select2:select",function(e){ 
    	showQueryCondition();
	});
};



