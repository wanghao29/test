

var total_Score=0;	
var head_html=	"<table  class='table table-striped' style='line-height: 35px;  font-size: 18px;'id = 'gf_kpi' width='100%' border='1' align='center' cellspacing='0' height='100%'>" +
" <thead><tr align='center' id='menu' style='background-color: #037abd;' >" +
"    <td width='10%'>主指标</td>" +
"    <td width='15%'><span id='menu_year'>2019</span>年考核项目</td>" +
"  <td width='10%'>考核周期</td>" +
 "   <td width='10%'>满分</td>" +

   " <td width='10%'>目标值</td>" +
    " <td width='10%'>单位</td>" +
    "<td width='10%'>得分</td>" +
    "<td width='10%'>当月完成值</td>" +
    "<td width='10%'>年度完成值</td>" +
   " <td width='10%'>时间进度</td>" +
  "</tr></thead>" ;
var operate_income_html = "<tr align='center'  style='border-top: 1px solid #037abd;' id='businessIncome'><td style='font-size: 23px;' rowspan='4'>运营收入（42分）&nbsp;</td><td><a url='#'>运营收入</a></td><td>18分</td><td>年度</td><td>-</td><td >元</td>" +
		"<td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>-</td><td style='color: #fb0200;'>-</td>" +
		"<td style='color: #fb0200;'>-</td></tr><tr align='center' id='businessIncome'><td><a url='#'>自有品牌手机收入</a></td><td>10分</td><td>年度</td>" +
		"<td>-</td><td >元</td> <td>0</td> <td>-</td> <td>-</td> <td>-</td></tr>" +
		"<tr align='center' id='businessIncome'><td><a url='#'>自有品牌多形态终端收入 </a></td><td>10分</td><td>年度</td><td>-</td> <td >元</td> <td>0</td> <td>-</td> " +
		"<td>-</td> <td>-</td></tr><tr align='center' id='businessIncome'><td><a url='#'>自有品牌其他多形态终端收入</a></td><td>4分</td><td>年度</td>" +
		"<td>-</td><td >元</td><td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>-</td><td style='color: #fb0200;'>-</td>" +
		"<td style='color: #fb0200;'>-</td></tr>" ;
		
var channel_development_html ="<tr align='center' style='border-top: 1px solid #037abd;' id='businessIncome'><td style='font-size: 23px;' rowspan='2'>渠道拓展（8分）</td><td><a url='#'>优质客户目标值</a></td>" +
		"<td>4分</td><td>年度</td><td>-</td><td >家</td><td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>-</td>" +
		"<td style='color: #fb0200;'>-</td><td style='color: #fb0200;'>-</td>" +
		"</tr><tr align='center' id='businessIncome'><td><a url='#'>KA客户手机销量目标值</a></td><td>4分</td><td>年度</td><td>-</td><td >台</td> <td>0</td> " +
		"<td>-</td> <td>-</td> <td>-</td></tr>" ;
var operate_coordination_html = "<tr align='center' style='border-top: 1px solid #037abd;' id='businessIncome'><td style='font-size: 23px;' rowspan='2'>运营协同（10分)</td>" +
		"<td><a url='#'>网内战略型手机销量占比</a></td><td>5分</td><td>年度</td><td>-</td> <td >%</td><td>0</td> <td>-</td> <td>-</td> " +
		"<td>-</td></tr><tr align='center' id='businessIncome'><td><a url='#'>内部支撑满意度</a></td><td>5分</td><td>年度</td><td>-</td> <td >-</td>" +
		"<td>0</td> <td>-</td> <td>-</td> <td>-</td></tr>" +
		"<tr align='center' id='businessIncome'><td><a url='#'>顺差让利模式落地能力-开展顺差让利活动的营业厅店数量</a></td><td>5分</td><td>年度</td><td>-</td> <td >-</td>" +
		"<td>0</td> <td>-</td> <td>-</td> <td>-</td></tr>"+
		"<tr align='center' id='businessIncome'><td><a url='#'>顺差让利模式落地能力-手机顺差让利销售量</a></td><td>5分</td><td>年度</td><td>-</td> <td >-</td>" +
		"<td>0</td> <td>-</td> <td>-</td> <td>-</td></tr>";
		
var operate_efficiency_html ="<tr align='center' style='border-top: 1px solid #037abd;' id='businessIncome'><td style='font-size: 23px;' rowspan='5'>运营效率（17分）</td>" +
		"<td><a url='#'>存货周转率</a></td><td>4分</td><td>年度</td><td>-</td><td>%</td><td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>0</td>" +
		"<td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>0</td></tr>" +
		"<tr align='center' id='businessIncome'><td><a url='#'>三个月以上存货原值占比&nbsp;</a></td><td>3分</td><td>年度</td><td>-</td><td >%</td>" +
		"<td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>0</td>" +
		"<td style='color: #fb0200;'>0</td></tr><tr align='center' id='businessIncome'><td><a url='#'>回款预测准确度</a></td><td>3分</td><td>年度</td><td>-</td><td >次</td>" +
		"<td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>0</td>" +
		"<td style='color: #fb0200;'>0</td></tr><tr align='center' id='businessIncome'><td><a url='#'>应收周转率</a></td><td>4分</td><td>年度</td><td>-</td><td >%</td>" +
		"<td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>0</td>" +
		"<td style='color: #fb0200;'>0</td></tr><tr align='center' id='businessIncome'><td><a url='#'>三个月以上应收账款占比</a></td><td>3分</td><td>年度</td>" +
		"<td>-</td><td >%</td><td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>0</td>" +
		"<td style='color: #fb0200;'>0</td></tr>" ;
		
var operate_benefit_html = "<tr align='center' style='border-top: 1px solid #037abd;' id='businessIncome'><td style='font-size: 23px;' rowspan='2'>运营效益（23分）</td>" +
		"<td><a url='#'>利润总额</a></td><td>20分</td><td>年度</td><td>-</td><td >-</td><td style='color: #fb0200;'>0</td>" +
		"<td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>0</td></tr>" +
		"<tr align='center' id='businessIncome'><td><a url='#'>单位人工费用创利比</a></td><td>3分</td><td>年度</td><td>-</td><td >-</td><td style='color: #fb0200;'>0</td>" +
		"<td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>0</td><td style='color: #fb0200;'>0</td></tr>" ;
		
var bonus_html=" <tr align='center'   style='display: none;border-top: 1px solid #037abd;' id='businessIncome'><td style='font-size: 23px;color: #f7d62b;' rowspan='3'>加分项（10分）</td><td><a style='color: #f7d62b;'  url='#'>运营收入</a></td><td>5分</td><td>年度</td><td>-</td><td >元</td>" +
		"<td >0</td><td >0</td><td >0</td>" +
		"<td >0</td></tr><tr style='display: none;' align='center' id='businessIncome'><td><a style='color: #f7d62b;' url='#'>网内战略型手机销量占比</a></td><td>3分</td><td>年度</td><td>-</td><td >-</td>" +
		"<td >0</td><td >0</td><td >0</td>" +
		"<td >0</td></tr><tr style='display: none;' align='center' id='businessIncome'><td><a style='color: #f7d62b;'url='#'>新零售门店运营</a></td><td>2分</td><td>年度</td><td>-</td><td >-</td>" +
		"<td >0</td><td >0</td><td >0</td>" +
		"<td >0</td></tr>" ;
		
var deduction_html = "<tr align='center' style='display: none;border-top: 1px solid #037abd;' id='businessIncome'><td style='font-size: 23px;color: #f7d62b;' rowspan='11'>扣分项（19分）</td><td><a style='color: #f7d62b;' url='#'>财务管理</a></td>" +
		"<td>2分</td><td>年度</td><td>-</td><td >-</td><td >0</td><td >0</td>" +
		"<td >0</td><td >0</td></tr>" +
		"<tr align='center'style='display: none;' id='businessIncome'><td><a style='color: #f7d62b;'url='#'>审计监督</a></td><td>2分</td><td>年度</td><td>-</td><td >-</td><td >0</td>" +
		"<td >0</td><td >0</td>" +
		"<td >0</td></tr><tr style='display: none;' align='center' id='businessIncome'><td><a style='color: #f7d62b;'  url='#'>售后管理</a></td>" +
		"<td>2分</td><td>年度</td><td>-</td><td >-</td><td >0</td><td >0</td>" +
		"<td >0</td><td >0</td></tr>" +
		"<tr style='display: none;' align='center' id='businessIncome'><td><a style='color: #f7d62b;' url='#'>零售业务管理</a></td><td>1分</td><td>年度</td><td>-</td><td >-</td><td >0</td>" +
		"<td >0</td><td >0</td><td >0</td></tr>" +
		"<tr style='display: none;' align='center' id='businessIncome'><td><a style='color: #f7d62b;' url='#'>系统运营质量</a></td><td>2分</td><td>年度</td><td>-</td><td >-</td><td >0</td>" +
		"<td >0</td><td >0</td><td >0</td></tr>" +
		"<tr style='display: none;' align='center' id='businessIncome'><td><a style='color: #f7d62b;' url='#'>采购管理</a></td><td>2分</td><td>年度</td><td>-</td><td >-</td><td >0</td>" +
		"<td >0</td><td >0</td><td >0</td></tr>" +
		"<tr style='display: none;' align='center' id='businessIncome'><td><a style='color: #f7d62b;' url='#'>物流管理</a></td><td>2分</td><td>年度</td><td>-</td><td >-</td><td >0</td>" +
		"<td >0</td><td >0</td><td >0</td></tr>" +
		"<tr style='display: none;' align='center' id='businessIncome'><td><a style='color: #f7d62b;' url='#'>风险管理</a></td><td>2分</td><td>年度</td><td>-</td><td >-</td><td >0</td>" +
		"<td >0</td><td >0</td><td >0</td></tr>" +
		"<tr style='display: none;' align='center' id='businessIncome'><td><a style='color: #f7d62b;' url='#'>嵌入式廉洁风险防控机制建设</a></td><td>2分</td><td>年度</td><td>-</td><td >-</td><td >0</td>" +
		"<td >0</td><td >0</td><td >0</td></tr>" +
		"<tr style='display: none;' align='center' id='businessIncome'><td><a style='color: #f7d62b;' url='#'>费用进度均衡性</a></td><td>2分</td><td>年度</td><td>-</td><td >-</td><td >0</td>" +
		"<td >0</td><td >0</td><td >0</td></tr>" +
		"<tr style='display: none;' align='center' id='businessIncome'><td><a style='color: #f7d62b;' url='#'>其他重大事项</a></td><td>0分</td><td>年度</td><td>-</td> <td >-</td><td>0</td> <td>0</td> <td>0</td> <td>0</td></tr>";



$(function () {
	//$("input[name='billcyc']").val("201901");//临时
	setAutoMonth();
	getVal();
	//初始化数据确认
	initConfirmInfo();
	$("#showBonusAndDeduction").click(function() {
		var ident = $(this).attr("ident");
		if(ident == "1" ){
			 $(this).text("收起其它");
			 $(this).attr("ident","0");
		}else{
			 $(this).text("显示其它");
			 $(this).attr("ident","1");
		}
		
		
		  $.each($("#overviewTable tr"),function(index){ 
			    if(index>17){ 
			    	  if($(this).css("display")=="none"){
			    		  $(this).show(); 
			    	  }else{
			    		  $(this).hide(); 
			    	  }
			    } 
		  });
	});
	$("#modal_submitBtn").click(function() {
		 $.ajax({
             type: 'post',
             url: basePath+'/gfOverview/updateRemarks.do',
          /*   contentType: 'application/json; charset=utf-8',*/
             data:{"billcyc":$("#billcyc").val(),"remarks": $("#modal_remarks").val(),"kpiKey": $("#modal_kpiKey").val()},
             async: false,
             dataType: 'json',
             success: function(result,textStatus){
             
             	if(result.success=="1") {
                     alert( " 保存成功");
                     $('#addRemarksModal').modal('hide');
                     getVal();
                 }else{
                     alert(  " 保存失败");
                     getVal();
                 }
             }
          });
	});
	
	
	
    //$('.edit').handleTable({"cancel" : "<span class='glyphicon glyphicon-remove'></span>"});
 /*   $('#overviewTable').handleTable({
        "handleFirst" : false,
        "cancel" : " <span class='glyphicon glyphicon-remove'></span> ",
        "edit" : " <span class='glyphicon glyphicon-edit'></span> ",
        "add" : " <span class='glyphicon glyphicon-plus'></span> ",
        "save" : " <span class='glyphicon glyphicon-saved'></span> ",
        "confirm" : " <span class='glyphicon glyphicon-ok'></span> ",
        "operatePos" : -1,
        "editableCols" : [2,3,4,6,7,8,910],
        "order": ["add","edit"],
        "saveCallback" : function(data, isSuccess) { //这里可以写ajax内容，用于保存编辑后的内容
            //data: 返回的数据
            //isSucess: 方法，用于保存数据成功后，将可编辑状态变为不可编辑状态
            var flag = true; //ajax请求成功（保存数据成功），才回调isSuccess函数（修改保存状态为编辑状态）
            data.push();
            $.ajax({
                type: 'post',
                url: basePath+'/gfOverview/updateRemarks.do',
                contentType: 'application/json; charset=utf-8',
                data:{"billcyc":$("#billcyc").val(),"remarks":data[0].remarks,"kpiKey":data[0].kpiKey},
                async: false,
                dataType: 'json',
                success: function(result,textStatus){
                	if(flag) {
                        isSuccess();
                        alert(data + " 保存成功");
                    } else {
                        alert(data + " 保存失败");
                    }
                }
             });
            return true;
        },
        "addCallback" : function(data,isSuccess) {
            var flag = true;
            if(flag) {
                isSuccess();
                alert(data + " 增加成功");
            } else {
                alert(data + " 增加失败");
            }
        },
        "delCallback" : function(isSuccess) {
            var flag = true;
            if(flag) {
                isSuccess();
                alert("删除成功");
            } else {
                alert("删除失败");
            }
        }
    });
	
	*/
	
/*    $("#gf_kpi a ").each(function(){
 	   $(this).click(function(){
	           var a = document.getElementById("aHref");
	           var url = $(this).attr("url");
	          
	           this.href = url+'&billcyc='+$("#billcyc").val();
	          // 取消<a>标签原先的onclick事件,使<a>标签点击后通过href跳转(因为无法用js跳转)
	           this.setAttribute("onclick",'');
	           //激发标签点击事件OVER
	          this.click("return false");
	       });
 });
	*/
	
	
});

function initConfirmInfo(){
	var kpiKey = $("#hid_kpikey").val();
	kpiConfirmInfo("kpiConfirmInfo",kpiKey);
}
function setAutoMonth(){
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    //var endMonth = String(year) + month;
    var endMonth='201910';
    $("input[name='billcyc']").val(endMonth);
    $("input[name='startMonth']").val(endMonth);
    $("input[name='endMonth']").val(endMonth);
}


function getVal(){
	//$('#table_oo').empty();
    $("input[name='startMonth']").val($('#billcyc').val());
    $("input[name='endMonth']").val($('#billcyc').val());
    initConfirmInfo();
    $.ajax({
        type: 'post',
        url: basePath+'/gfOverview/queryData.do',
/*        contentType: 'application/json; charset=utf-8',*/
        data: {'billcyc':$('#billcyc').val()},
        async: false,
        dataType: 'json',
        success: function(result,textStatus){
        	 var tabLen = $('#overviewTable');
        	 total_Score=0;
        	for(var i=0;i<result.allList.length;i++){
        		 /* tabLen.rows[i+1].cells[6].text();
        		  tabLen.rows[i+1].cells[7].text();
        		  tabLen.rows[i+1].cells[8].text();
        		  tabLen.rows[i+1].cells[9].text();*/
        		var item = result.allList[i];
        		var kpiMbz = item.kpiMbz ==null?"-":item.kpiMbz;
        		var kpiTotalScore = item.kpiTotalScore ==null?"0":item.kpiTotalScore;
        		var kpiScore = item.kpiScore ==null?"0":item.kpiScore;
        		var kpiMonthComplete = item.kpiMonthComplete ==null?"0":item.kpiMonthComplete;
        		var kpiYearComplete = item.kpiYearComplete ==null?"0":item.kpiYearComplete;
        		var kpiTimeProgress = item.kpiTimeProgress ==null?"0":item.kpiTimeProgress;
        		total_Score +=Number(kpiScore);
        		 	//$("#"+item.kpiKey+" button ").attr("title",item.remarks);
        		    $("#"+item.kpiKey).find("td").eq(1).attr("title",item.remarks);
        		 	$("#"+item.kpiKey).find("td").eq(2).text(item.examinationCycle);
	           		$("#"+item.kpiKey).find("td").eq(3).text(kpiTotalScore);
	           		$("#"+item.kpiKey).find("td").eq(4).text(kpiMbz);
	           		$("#"+item.kpiKey).find("td").eq(5).text(item.unit);
			        $("#"+item.kpiKey).find("td").eq(6).text(kpiScore);
	           		$("#"+item.kpiKey).find("td").eq(7).text(kpiMonthComplete);
	           		$("#"+item.kpiKey).find("td").eq(8).text(kpiYearComplete);
	           		$("#"+item.kpiKey).find("td").eq(9).text(kpiTimeProgress+'%');
	           		$("#"+item.kpiKey).find("td").eq(11).text(item.kpiKey);
    		   if(Number(kpiScore) < Number(kpiTotalScore)){
	           	    $("#"+item.kpiKey).find("td").eq(6).css("color"," #fb0200");
	           		$("#"+item.kpiKey).find("td").eq(7).css("color"," #fb0200");
	           		$("#"+item.kpiKey).find("td").eq(8).css("color"," #fb0200");
	           		$("#"+item.kpiKey).find("td").eq(9).css("color"," #fb0200");
	           		$("#"+item.kpiKey).find("td").eq(6).css("font-weight","900");
	           		$("#"+item.kpiKey).find("td").eq(7).css("font-weight","900");
	           		$("#"+item.kpiKey).find("td").eq(8).css("font-weight","900");
	           		$("#"+item.kpiKey).find("td").eq(9).css("font-weight","900");
	           		$("#"+item.kpiKey).find("td").eq(6).css("font-size","20px");
	           		$("#"+item.kpiKey).find("td").eq(7).css("font-size","20px");
	           		$("#"+item.kpiKey).find("td").eq(8).css("font-size","20px");
	           		$("#"+item.kpiKey).find("td").eq(9).css("font-size","20px");
	           		
    		   }else{
	           		$("#"+item.kpiKey).find("td").eq(6).css("color"," #06f931fa");
	           		$("#"+item.kpiKey).find("td").eq(7).css("color"," #06f931fa");
	           		$("#"+item.kpiKey).find("td").eq(8).css("color"," #06f931fa");
	           		$("#"+item.kpiKey).find("td").eq(9).css("color"," #06f931fa");
	        		$("#"+item.kpiKey).find("td").eq(6).css("font-weight","900");
	           		$("#"+item.kpiKey).find("td").eq(7).css("font-weight","900");
	           		$("#"+item.kpiKey).find("td").eq(8).css("font-weight","900");
	           		$("#"+item.kpiKey).find("td").eq(9).css("font-weight","900");
	           		$("#"+item.kpiKey).find("td").eq(6).css("font-size","20px");
	           		$("#"+item.kpiKey).find("td").eq(7).css("font-size","20px");
	           		$("#"+item.kpiKey).find("td").eq(8).css("font-size","20px");
	           		$("#"+item.kpiKey).find("td").eq(9).css("font-size","20px");
    		   }
    		   $("#"+item.kpiKey).find("td").eq(10).children().on('click', function() {
    			   var p = $(this).parents('tr'); 
    			   var tr = p.children().eq(1).children().html();
    			   $("#modal_billcyc").val( $("input[name='billcyc']").val());
    			   $("#modal_item").val(p.children().eq(1).children().html());
    			   $("#modal_remarks").val(p.children().eq(1).attr("title"));
    			   $("#modal_kpiKey").val(p.children().eq(11).text());
    			/*   $("#addRemarksModal").show();*/
    			   $('#addRemarksModal').modal('show');
    			  /* $('#addRemarksModal').on('show.bs.modal', function () {
					  // 执行一些动作...
					});*/
    		   });
        	}
        	for(var i=0;i<result.otherList.length;i++){
        		var item = result.otherList[i];
        		var kpiMbz = item.kpiMbz ==null?"-":item.kpiMbz;
        		var kpiTotalScore = item.kpiTotalScore ==null?"0":item.kpiTotalScore;
        		var kpiScore = item.kpiScore ==null?"0":item.kpiScore;
        		var kpiMonthComplete = item.kpiMonthComplete ==null?"0":item.kpiMonthComplete;
        		var kpiYearComplete = item.kpiYearComplete ==null?"0":item.kpiYearComplete;
        		var kpiTimeProgress = item.kpiTimeProgress ==null?"0":item.kpiTimeProgress;
        		total_Score +=Number(kpiScore);
        			//$("#"+item.kpiKey +" button " ).attr("title",item.remarks);
        		 $("#"+item.kpiKey).find("td").eq(1).attr("title",item.remarks);
        			$("#"+item.kpiKey).find("td").eq(2).text(item.examinationCycle);
	           		$("#"+item.kpiKey).find("td").eq(3).text(kpiTotalScore);
	           		$("#"+item.kpiKey).find("td").eq(4).text(kpiMbz);
	           		$("#"+item.kpiKey).find("td").eq(5).text(item.unit);
	           		$("#"+item.kpiKey).find("td").eq(6).text(kpiScore);
	           		$("#"+item.kpiKey).find("td").eq(7).text(kpiMonthComplete);
	           		$("#"+item.kpiKey).find("td").eq(8).text(kpiYearComplete);
	           		$("#"+item.kpiKey).find("td").eq(9).text(kpiTimeProgress+'%');
	           		$("#"+item.kpiKey).find("td").eq(11).text(item.kpiKey);
    		   if(Number(kpiScore) < Number(kpiTotalScore)){
	           	    $("#"+item.kpiKey).find("td").eq(6).css("color"," #fb0200");
	           		$("#"+item.kpiKey).find("td").eq(7).css("color"," #fb0200");
	           		$("#"+item.kpiKey).find("td").eq(8).css("color"," #fb0200");
	           		$("#"+item.kpiKey).find("td").eq(9).css("color"," #fb0200");
	           		$("#"+item.kpiKey).find("td").eq(6).css("font-weight","900");
	           		$("#"+item.kpiKey).find("td").eq(7).css("font-weight","900");
	           		$("#"+item.kpiKey).find("td").eq(8).css("font-weight","900");
	           		$("#"+item.kpiKey).find("td").eq(9).css("font-weight","900");
	        		$("#"+item.kpiKey).find("td").eq(6).css("font-size","20px");
	           		$("#"+item.kpiKey).find("td").eq(7).css("font-size","20px");
	           		$("#"+item.kpiKey).find("td").eq(8).css("font-size","20px");
	           		$("#"+item.kpiKey).find("td").eq(9).css("font-size","20px");
    		   }else{
	           		$("#"+item.kpiKey).find("td").eq(6).css("color"," #06f931fa");
	           		$("#"+item.kpiKey).find("td").eq(7).css("color"," #06f931fa");
	           		$("#"+item.kpiKey).find("td").eq(8).css("color"," #06f931fa");
	           		$("#"+item.kpiKey).find("td").eq(9).css("color"," #06f931fa");
	          		$("#"+item.kpiKey).find("td").eq(6).css("font-weight","900");
	           		$("#"+item.kpiKey).find("td").eq(7).css("font-weight","900");
	           		$("#"+item.kpiKey).find("td").eq(8).css("font-weight","900");
	           		$("#"+item.kpiKey).find("td").eq(9).css("font-weight","900");
	        		$("#"+item.kpiKey).find("td").eq(6).css("font-size","20px");
	           		$("#"+item.kpiKey).find("td").eq(7).css("font-size","20px");
	           		$("#"+item.kpiKey).find("td").eq(8).css("font-size","20px");
	           		$("#"+item.kpiKey).find("td").eq(9).css("font-size","20px");
    		   }
    		   $("#"+item.kpiKey).find("td").eq(10).children().on('click', function() {
    			   var p = $(this).parents('tr'); 
    			   var tr = p.children().eq(1).children().html();
    			   $("#modal_billcyc").val( $("input[name='billcyc']").val());
    			   $("#modal_item").val(p.children().eq(1).children().html());
    			   $("#modal_remarks").val(p.children().eq(1).attr("title"));
    			   $("#modal_kpiKey").val(p.children().eq(11).text());
    			/*   $("#addRemarksModal").show();*/
    			   $('#addRemarksModal').modal('show');
    		   });
        	}
        	$('#zdf').text(total_Score.toFixed(2));
     
/*        	total_Score=0;
        	var  table_html = "";
        	table_html +=head_html;
        	var   operate_income_temp = splitHtml(result.operate_income);
        	var   channel_development_temp = splitHtml(result.channel_development);
        	var   operate_coordination_temp = splitHtml(result.operate_coordination);
        	var   operate_efficiency_temp = splitHtml(result.operate_efficiency);
        	var   operate_benefit_temp = splitHtml(result.operate_benefit);
        	var   bonus_temp = splitorDinaryHtml(result.bonus);
        	var   deduction_temp = splitorDinaryHtml(result.deduction);
        	if(operate_income_temp !="" ){ table_html +=operate_income_temp; }else{ table_html +=operate_income_html; }
        	if(channel_development_temp !="" ){ table_html +=channel_development_temp; }else{table_html +=channel_development_html; }
        	if(operate_coordination_temp !="" ){ table_html +=operate_coordination_temp; }else{table_html +=operate_coordination_html;  }
        	if(operate_efficiency_temp !="" ){ table_html +=operate_efficiency_temp; }else{table_html +=operate_efficiency_html;}
        	if(operate_benefit_temp !="" ){ table_html +=operate_benefit_temp+"<tr><td colspan='10'><button id='showBonusAndDeduction' type='button' class='btn btn-primary' ident='1' style='width:100px'>更多>></button></td></tr>"; }else{table_html +=operate_benefit_html; }
        	if(bonus_temp !="" ){ table_html +=bonus_temp; }else{table_html +=bonus_html;}
        	if(deduction_temp !="" ){ table_html +=deduction_temp; }else{table_html +=deduction_html; }
        	$('#zdf').text(total_Score.toFixed(2));
        	table_html +=splitHtml(result.channel_development);
        	table_html +=splitHtml(result.operate_coordination);
        	table_html +=splitHtml(result.operate_efficiency);
        	table_html +=splitHtml(result.operate_benefit);
        	table_html +=splitHtml(result.bonus);
        	table_html +=splitHtml(result.deduction);
        	
        	
        	$('#table_oo').append( table_html+"</table>" );
        	
        	
        	$("#showBonusAndDeduction").click(function() {
        		var ident = $(this).attr("ident");
        		if(ident == "1" ){
        			 $(this).text("收起其它");
        			 $(this).attr("ident","0");
        		}else{
        			 $(this).text("显示其它");
        			 $(this).attr("ident","1");
        		}
        		
        		
        		  $.each($("#gf_kpi tr"),function(index){ 
        			    if(index>16){ 
        			    	  if($(this).css("display")=="none"){
        			    		  $(this).show(); 
        			    	  }else{
        			    		  $(this).hide(); 
        			    	  }
        			    } 
        		  });
        	});
            $("#gf_kpi a ").each(function(){
          	   $(this).click(function(){
         	           var a = document.getElementById("aHref");
         	           var url = $(this).attr("url");
         	          
         	           this.href = url+'&billcyc='+$("#billcyc").val();
         	          // 取消<a>标签原先的onclick事件,使<a>标签点击后通过href跳转(因为无法用js跳转)
         	           this.setAttribute("onclick",'');
         	           //激发标签点击事件OVER
         	          this.click("return false");
         	       });
          });*/
        }
    });
  }

function splitHtml(list){
	var interim_table_html="";
	for(var i=0;i<list.length;i++){
		
		var item = list[i];
		var  operate_income_html="";
		var kpiMbz = item.kpiMbz ==null?"-":item.kpiMbz;
		var kpiTotalScore = item.kpiTotalScore ==null?"0":item.kpiTotalScore;
		var kpiScore = item.kpiScore ==null?"0":item.kpiScore;
		var kpiMonthComplete = item.kpiMonthComplete ==null?"0":item.kpiMonthComplete;
		var kpiYearComplete = item.kpiYearComplete ==null?"0":item.kpiYearComplete;
		var kpiTimeProgress = item.kpiTimeProgress ==null?"0":item.kpiTimeProgress;
		total_Score +=Number(kpiScore);
		if(i==0){
			
			operate_income_html = "<tr align='center' style='border-top: 1px solid #037abd;' id='businessIncome' >" +
					    "<td  style='font-weight:bold;color: #33ffff;'  rowspan='"+list.length+"'>"+ item.parentKpiName  +"</td>" +
					    "<td  ><a  href='' url='"+basePath + item.url+"?special=GFKPI'>"+item.kpiName+"</a></td>" +
					    "<td>"+item.examinationCycle+"</td>" +
					    "<td>"+ kpiTotalScore+"分</td>" +
					  
					    "<td>"+kpiMbz+"</td>" +
					    "<td>"+item.unit+"</td>";
			 
					     if(Number(kpiScore) < Number(kpiTotalScore)){
					    	 operate_income_html += "<td    style='color: #fb0200;' >"+kpiScore+"</td>" +
						  	   						"<td    style='color: #fb0200;' >"+kpiMonthComplete+"</td>" +
						  	   						"<td    style='color: #fb0200;' >"+kpiYearComplete+"</td>" +
						  	   						"<td    style='color: #fb0200;' >"+Number(kpiTimeProgress).toFixed(2) +"% </td>";
						  	 
					     }else{
					    	 operate_income_html += " <td style='color: #06f931fa;'>"+kpiScore+"</td>" +
												    " <td style='color: #06f931fa;'>"+kpiMonthComplete+"</td>" +
												    " <td style='color: #06f931fa;'>"+kpiYearComplete+"</td>" +
												    " <td style='color: #06f931fa;'>"+Number(kpiTimeProgress).toFixed(2)+"%</td></tr>";
					     }
				  
		}else{
			operate_income_html = "<tr align='center'  style='border-top: 1px solid #037abd;' id='businessIncome' >" +
		    "<td  ><a href='' url='"+basePath+item.url+"?special=GFKPI'>"+ item.kpiName+"</a></td>" +
		    "<td>"+item.examinationCycle+"</td>" +
		    "<td>"+kpiTotalScore+"分</td>" +
		
		    "<td>"+ kpiMbz+"</td>"+
		    "<td>"+item.unit+"</td>";
		     if(Number(kpiScore) < Number(kpiTotalScore)){
		    	 operate_income_html += "<td    style='color: #fb0200;' >"+kpiScore+"</td>" +
			  	   						"<td    style='color: #fb0200;' >"+kpiMonthComplete+"</td>" +
			  	   						"<td    style='color: #fb0200;' >"+kpiYearComplete +"</td>" +
			  	   						"<td    style='color: #fb0200;' >"+Number(kpiTimeProgress).toFixed(2) +"%</td>";
			  	 
		     }else{
		    	 operate_income_html += " <td  style='color: #06f931fa;' >"+kpiScore+"</td>" +
									    " <td  style='color: #06f931fa;'>"+kpiMonthComplete+"</td>" +
									    " <td  style='color: #06f931fa;'>"+kpiYearComplete+"</td>" +
									    " <td  style='color: #06f931fa;'>"+Number(kpiTimeProgress).toFixed(2)+"%</td></tr>";
		     }
			
		}
		interim_table_html +=operate_income_html;
	}
	return interim_table_html;
}

function splitorDinaryHtml(list){
	var interim_table_html="";
	for(var i=0;i<list.length;i++){
		
		var item = list[i];
		var  operate_income_html="";
		var kpiMbz = item.kpiMbz ==null?"-":item.kpiMbz;
		var kpiTotalScore = item.kpiTotalScore ==null?"0":item.kpiTotalScore;
		var kpiScore = item.kpiScore ==null?"0":item.kpiScore;
		var kpiMonthComplete = item.kpiMonthComplete ==null?"0":item.kpiMonthComplete;
		var kpiYearComplete = item.kpiYearComplete ==null?"0":item.kpiYearComplete;
		var kpiTimeProgress = item.kpiTimeProgress ==null?"0":item.kpiTimeProgress;
		total_Score +=Number(kpiScore);
		if(i==0){
			
			operate_income_html = "<tr align='center' style='display: none;' id='businessIncome' >" +
					    "<td rowspan='"+list.length+"'  style='color: #f7d62b;' >"+ item.parentKpiName  +"</td>" +
					    "<td  ><a style='color: #f7d62b;' href='' url='"+basePath + item.url+"?special=GFKPI'>"+item.kpiName+"</a></td>" +
					    "<td>"+item.examinationCycle+"</td>" +
					    "<td>"+ kpiTotalScore+"分</td>" +
					 
					    "<td>"+kpiMbz+"</td>"+
					    "<td>"+item.unit+" </td>";
				/*	     if(Number(kpiScore) < Number(kpiTotalScore)){
					    	 operate_income_html += "<td    style='color: #fb0200;' >"+kpiScore+"</td>" +
						  	   						"<td    style='color: #fb0200;' >"+kpiMonthComplete+"</td>" +
						  	   						"<td    style='color: #fb0200;' >"+kpiYearComplete+"</td>" +
						  	   						"<td    style='color: #fb0200;' >"+Number(kpiTimeProgress).toFixed(2) +"</td>";
						  	 
					     }else{*/
					    	 operate_income_html += " <td>"+kpiScore+"</td>" +
												    " <td>"+kpiMonthComplete+"</td>" +
												    " <td>"+kpiYearComplete+"</td>" +
												    " <td>"+Number(kpiTimeProgress).toFixed(2)+"%</td></tr>";
					 /*    }*/
				 
		}else{
			operate_income_html = "<tr align='center' style='display: none;' id='businessIncome' >" +
		    "<td  ><a style='color: #f7d62b;' href='' url='"+basePath +item.url+"?special=GFKPI'>"+ item.kpiName+"</a></td>" +
		    "<td>"+item.examinationCycle+"</td>" +
		    "<td>"+kpiTotalScore+"分</td>" +
		
		    "<td>"+ kpiMbz+"</td>"+
		    "<td>"+item.unit+"</td>";
		/*     if(Number(kpiScore) < Number(kpiTotalScore)){
		    	 operate_income_html += "<td    style='color: #fb0200;' >"+kpiScore+"</td>" +
			  	   						"<td    style='color: #fb0200;' >"+kpiMonthComplete+"</td>" +
			  	   						"<td    style='color: #fb0200;' >"+kpiYearComplete +"</td>" +
			  	   						"<td    style='color: #fb0200;' >"+Number(kpiTimeProgress).toFixed(2) +"</td>";
			  	 
		     }else{*/
		    	 operate_income_html += " <td>"+kpiScore+"</td>" +
									    " <td>"+kpiMonthComplete+"</td>" +
									    " <td>"+kpiYearComplete+"</td>" +
									    " <td>"+Number(kpiTimeProgress).toFixed(2)+"%</td></tr>";
		   /*  }*/
			
		}
		interim_table_html +=operate_income_html;
	}
	return interim_table_html;
}
