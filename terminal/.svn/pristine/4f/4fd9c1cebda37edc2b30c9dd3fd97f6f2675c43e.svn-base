<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>品牌容量设置</title>

</head>

<body style='overflow:auto ! important;'>
<style type="text/css">
/* .select2-container--default .select2-results > .select2-results__options {
  max-height: 200px;
  border:200px;
  overflow-y: auto;
  width: 98px; 
  } */
.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
	height: 37px;
	margin-top: 5px;
}
.ui-jqgrid tr.ui-row-ltr td, .ui-jqgrid tr.jqgrow td, .ui-jqgrid tr.jqgroup td {

color: white;


}


.modal-body {
	position: absolute;
	left: 100px;
	top: 10px;
}
/* 设置表格样式 */
.ui-jqgrid .ui-jqgrid-htable th {
	text-align: center;
	color: white;
	/* background-color:#54abd6; */
	font-size: 16px;
}

.ui-jqgrid-htable th.ui-th-column-header {
	background-color: #54abd6;
}
.select2-container--open .select2-dropdown--below {

width: 200px;
}
.content div {
	color: white;
}

.ui-jqgrid tr.jqgrow td, .ui-jqgrid {
	border: none;
}

.ui-jqgrid .ui-jqgrid-hbox {
	border: none;
}


.select2-results__options {
    max-height: 194px;
    border: 200px;
    overflow-y: auto;
    width: 200px;
}

</style>
<link rel="stylesheet" href="<%=basePath%>resources/css/selectMin.css">
<link rel="stylesheet"
	href="<%=basePath%>resources/css/plugin/bootstrap_3.3.7/bootstrap.css">
	
	<link rel="stylesheet"
	href="<%=basePath%>resources/css/MyStyle.css">
<script
	src="<%=basePath%>resources/js/brandRangeSet/bootstrap-select.js?"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/js/customerChannel/customerChannel.js?"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/js/brandRangeSet/brandView.js?"></script>


<script src="<%=basePath%>resources/js/brandRangeSet/full-min.js?"></script>


<div class="row">
<div class="col-xs-3" style="margin-left: 210px;">
<span style="font-size: 18px; color: white; font-weight: normal;"> 品牌：</span>
<select name="tbrandname" id="select88"
class="select_searchableMy" runat="server"
style="border-color: #1addfa; width: 200px; height: 30px; color: white; 
background-color: #00063c;border-radius: 16px;">
<option id="oneDate">${brand}</option>
		<!-- <option>苹果</option>
		<option>华为</option>
		<option>三星</option>
		<option>中国移动</option>
		<option>小米</option>
		<option>魅族</option>
		<option>OPPO</option> -->

	</select>
	</div>
	<div class="col-xs-3" style="margin-left: -50px;">
	<label style="font-size: 18px; color: white; font-weight: normal;">机型：
</label> <select name="tspec" id="select99" class="select_searchableMy"
	runat="server"
	style="border-color: #1addfa; width:200px; color: white; background-color: #00063c; height: 30px;border-radius: 16px;">
<option id="twoDate">${spec}</option>
	</select>
	</div>
	<div class="col-xs-2">
<button class="select" onclick="btncc()" style="width: 55%; height: 30px; background-color: #00688B; border-radius: 16px; margin-left: -30px;margin-top:8px;">
进入 
</button>
    </div>
	</div>	
	<div class="row" style="margin-left:12%;margin-top:5%; z-index: 1000;">
    <div style="margin-bottom: 20px;margin-top: -60px;margin-left:12px">
	<div class="col-xs-12" style="width: 83%;">
		<table id="list" class="table table-bordered" ></table>
		<div id=pager></div>
</div>
</div>
</div>
<!-- <input  id="bt" type="button" value="进入操盘" onclick="buttonClicked();"/> -->

	<!--  图表------------------ -->
	<div class="row">
	<div class="col-xs-12">
	<div class="clearfix"
		style="margin-left: 10px; margin-right: 10px; margin-bottom: 20px; margin: 50px;">
		<ul class="index-wrap module-one" style="list-style: none;">
			<li class="active"
				onclick="javascript:document.getElementById('channel_plough').click();"><em
				class="icon-i-one"></em> <a id="channel_plough"
				href="${basePath}brandRangeSet/index.do" style="color: #fff;">
					<h4>品牌容量设置</h4>
					<p>基于赛诺,广东移动换机预测数据</p>
					<p>以地市'品牌维度计算参考容量</p>
			</a></li>
			<li><a id="data_monitor"
				href="${basePath}priceRangeSet/index.do" style="color: #fff;"> <em
					class="icon-i-two"></em>
					<h4>价格段容量设置</h4>
					<p>
						基于赛诺,广东移动换机预测数据 <br> 以地市 '品牌维度计算参考容量</br>
					</p>
			</a></li>
			<li><a id="data_monitor"
				href="${basePath}productInformationSet/index.do"
				style="color: #fff;"> <em class="icon-i-three"></em>
					<h4>产品信息及规划设置</h4>
					<p>
						产品、竞品信息设置 <br>全生命周期、地市、五线七口规划</br>
					</p>
			</a></li>
		</ul>

	</div>

</div>
</div>




	<script type="text/javascript">
/* 点击按钮进入操盘视图 */		
 
 //post提交
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

 
 
 <%-- var btn = document.getElementById("bt");
	
 btn.onclick =function(){
	 window.location.href="<%=basePath%>traderView/trade.do";
 }; --%>
		
   function initOrderStatus(brand,spec){
		
		var brand=brand;
		
		var spec=spec;
		
		$.StandardPost(basePath+'/traderView/trade.do',{'BRANDNAME':brand,'SPEC':spec});
		
		
		
	} 	 
 
 
 function tiaohuan(value, grid, rows, state) { 
          var brand=rows.brandname;
         
          var spec=rows.spec;
	<%--  return "<a href=<%=basePath%>traderView\/trade.do?'"brand="'brand&'"spec="'spec style=\"color:#1addfa \" >进入操盘</a>"; --%>
 
	 return "<a href='#' onclick=\"initOrderStatus('"+brand+"','"+spec+"')\" style=\"color:#1addfa \" >进入操盘</a>";  
 };	


	
	
	
	
	
	
	
	$(function() {// dom元素加载完毕
			$('#list tbody tr:even').css("backgroundColor", "#rgba(241, 25, 247, 0.66);");
			//获取id为tb的元素,然后寻找他下面的tbody标签，再寻找tbody下索引值是偶数的tr元素,
			//改变它的背景色.
		})

		/* 鼠标移入移出事件  */

		function autoSlider(config) {
			var timer = null, slider = config.obj, ul = slider.find('ul'), liw = ul
					.find('li:first').width(), linum = ul.find('li').length, active = 0;
			var moveul = function() {
				slider.find('.spanbox span').eq(active).addClass('active')
						.siblings().removeClass('active');
				ul.css('left', -active * liw + 'px');
			}
			//初始化设置ul容器的宽度,初始位置
			ul.css({
				width : liw * linum + 'px',
				left : 0
			});

			slider.find('.spanbox').on('click', 'span', function() {
				active = $(this).index();
				moveul()
			})
			slider.find('.prev2').click(function() {
				active--
				if (active < 0)
					active = linum - 1
				moveul()
			})
			slider.find('.next2').click(function() {
				active++
				if (active > linum - 1)
					active = 0
				moveul()
			})
			slider.find('.next2,.prev2,.spanbox').hover(function() {
				clearInterval(timer)
			}, function() {
				slider.find('.next2').trigger('click');
			})
			//定时触发
			timer = setInterval(function() {
				slider.find('.next2').trigger('click')
			}, config.time)
		}

		$(function() {
			$('.module-one').on('mouseover', 'li', function() {
				$(this).addClass('active').siblings().removeClass('active')
			})

			autoSlider({
				obj : $('.slider'),
				time : 3000
			});

		})
	
//品牌和型号的查询
$(document).ready(
				function() {
					$('.select_searchableMy').select2();
					// $('.select_searchable').searchableSelect();
					$.ajax({
						async : false, //千万要记住加这个属性配置
						type : "post",
						datatype : 'json',
						url :basePath+ "/getInformation/brandsTop10.do",
						success : function(data) {
							for (var i = 0; i < data.length; i++) {
						
						
						$("#select88").append(
								"<option value='"+data[i]+"'>"
										+ data[i] + "</option>");
								/* showCusOrgacode(data); */					
												
												

							}
						}
					});
				});
        $("#select88").change(
				function(e) {
					$(this).parent().next().trigger('click');
					var roleid = this.value;
					$.ajax({
						url : basePath+"/getInformation/doublesTop10.do",
						type : "post",
						async : false,
						cache : false,
						dataType : "json",
						data : {
							roleid : roleid
						//传入角色id，到后台获取json  
						},
						success : function(result) {
							$("#select99").empty();
							for (var i = 0; i < result.length; i++) { //循环生成option，并且连接成String对象  
								$("#select99").append(
										"<option value='"+result[i]+"'>"
												+ result[i] + "</option>");
							}
							
						}
					});

				});
	
		
	/*添加按钮功能的实现   */	
	function btncc(){
	var brandname=$("#select88").val();
	var spec=$("#select99").val();
	if(brandname==""){
		alert("请选择品牌！");
		return false;
	}
   if(spec==""){
	   alert("请选择型号！");
		return false;	
		
	}
	
	$.ajax({
		url : basePath+"/getInformation/insertOne.do",
		type : "post",
		async : false,
		cache : false,
		dataType : "json",
		data : {
			"brandname" : brandname,"spec":spec
		//传入角色id，到后台获取json  
		},
		success : function(result) {
			if(result==1){
				
			alert("添加成功！");
			window.location.reload();
				
			}else if(result==0){
				alert("添加失败！");
				window.location.reload();
				
			}else if(result==2){
				alert("已添加过该品牌，请勿重复添加！");	
				
			}
			
			
		}
	});
		
		
		
		
		
		
	}	
		
		
		
		
		
		
		
		
		</script>



</body>
</html>