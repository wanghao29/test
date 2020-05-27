$(document).ready(function() {
    //顶部菜单切换
    $("#menu li").attr("class","drop");
    $("#index").attr("class","active"); 	
	// citySelectInit($('#citySelect'));
	
	//初始化  品牌选框和型号选框
	brandSelect();
	 $("#cm_brand").select2();
	 $("#lm_brand").select2();
	 $("#cm_ter_type").select2();
	 $("#lm_ter_type").select2();
	//级联的change事件
	 $("#cm_brand").on("change",specSelect);
	 $("#lm_brand").on("change",beforeSpecSelect);
	 
	//时间控件设置初始时间
		//时间控件设置初始时间
	    var date = new Date();
	    var year = date.getFullYear();
	    var month = date.getMonth() + 1;
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	    var startDay = String(year)+month;
//	var startDay = year  + month  ;
	$("#billcyc").val(startDay);
		// 绑定按钮事件
	$("#searchBtn").click(function() {
	  // alert(  getSelectIds().join());
	  var postData = $('#list').jqGrid("getGridParam", "postData");
	      $.each(postData, function (k, v) {
	          delete postData[k];
	      });   
	   var queryParams  = getSelectVals();
	   queryParams["city"]=$("#citySelect").val();
	   queryParams["billcyc"]=$("#billcyc").val();
	   queryParams["cm_brand"]=$("#cm_brand").val();
	   queryParams["cm_ter_type"]=$("#cm_ter_type").val();
	   queryParams["lm_brand"]=$("#lm_brand").val();
	   queryParams["lm_ter_type"]=$("#lm_ter_type").val();
	  // alert(JSON.stringify(queryParams));
	/*	var starttime = $("#starttime").val();
		var endtime = $("#endtime").val();
		if(isNull(starttime)){
			alert("请选择日期范围");
			return;
		}*/
	   jqgridReload(queryParams)
	});
	jqgridInit();
	 $("input[type='checkbox']").change(function(){
		  var isCheck= $(this).is(':checked'); 
		  var value =  $(this).val();
		  if(isCheck){
			  jQuery("#list").setGridParam().showCol(value).trigger("reloadGrid");
		  }else{
			  jQuery("#list").setGridParam().hideCol(value).trigger("reloadGrid");
		  }
	 });
////////////////////////////////////////////////
    var selectListData = {};
    var currentLatitudeId;
    $('#SelectedLists li:first-child').css({'background': 'none', 'padding-left': '26px', 'margin-left': '0'});

        
      //设置图表面板的高度
      var $content=$('#chart-content');
      function setContentHeight() {
          $content.height($(window).height()-104);
      };
      setContentHeight()
      $(window).resize(function(){
          setContentHeight();
          $content.jScrollPane(
                  {
                      'showArrows': true
                  });
      });
      $content.jScrollPane(
              {
                  'showArrows': true
              });
    //纬度选择
    window.parentId;
    var clicked = false;
    $('.latitude-check').delegate('.text-c','mouseenter',function(){
        var parentID=$(this).parents('li').attr('id').replace("select_","");
        if(wdLists[parentID].posfix=="true")
        	return;
        window.parentId!=parentID?$('<i class="error-organe"></i>').appendTo(this).on('click',function(event){
        	$('.type-content').hide();
            _unSelectItem(parentID);
           event.stopPropagation();
            
        }):"";
    }).delegate('.text-c','mouseleave',function(){
                $(".error-organe").remove();
            })
    $('#SelectedLists').delegate("li.readable","click", function (event) {
        var thisID=$(this).attr('id').replace("select_","");
        $(".error-organe").hide();
        $(document).one('click',function(){
            window.parentId="";
            $('.type-content').hide();
        });
        $('.type-content').remove();
        if(!clicked){
        	_showPop(thisID);
        	currentLatitudeId = thisID;
        	$(".type-content").offset({top:$(this).offset().top+35});
        }
        window.parentId=thisID;
        event.stopPropagation();
    });

    //下拉框快速搜索
   $('body').delegate('#searchResult', "focus", function () {
        $(this).data("value", $.trim($(this).val()));
    });
    $('body').delegate('#searchResult', 'keyup', function () {
    	var text = $.trim($(this).val());
    	var isLoad = (wdLists[currentLatitudeId].loadData=='true');//是否需要下拉列表
    	if(!isLoad){
    		 if(event.keyCode == 13){
    			 _selectOptions(currentLatitudeId,text,text);
    		 }
    		return false;
    	}
        
        if (text == $(this).data('value')) { return false; }
        $(this).data("value", text);
        var showText = [];
        
        if (text == "") {
            showText = selectListData;
        } else {
            $.each(selectListData, function (idx, val) {
                var key = val.key;
                var value = val.value;
                if ((key!=null&&key.toLowerCase().indexOf(text.toLowerCase())>-1)||(value!=null&&value.toLowerCase().indexOf(text.toLowerCase())>-1)) {
                    showText.push(val);
                }
            })
        }
        _initPopups(currentLatitudeId, showText, true);
    });
    
	//维度清空
	$("#dim-sel").hover(
		function(){
			if(getSelectIds().length>0&&$(this).hasClass("latitude-title-unhover")){
				$(this).removeClass("latitude-title-unhover");
				$(this).addClass("latitude-title-hover");
				$(this).html("清空维度：");
			}
		},
		function(){
			if($(this).hasClass("latitude-title-hover")){
				$(this).removeClass("latitude-title-hover");
				$(this).addClass("latitude-title-unhover");
				$(this).html("消费者基本特征:");
			}
		}
	).click(
		function(){
			if($(this).hasClass("latitude-title-hover")){
				var seldim = getSelectIds();
				for(var i=0;i<seldim.length;i++){
					_unSelectItem(seldim[i]);
				}
				$(this).removeClass("latitude-title-hover");
				$(this).addClass("latitude-title-unhover");
				$(this).html("消费者基本特征:");
			}
		}
	);
	
	
	/*
	 * 函数名称：IsNull 函数功能：判断给定字符串是否为空 函数参数：str,需要处理的字符串
	 */
	function isNull( str ) {
		if(str==null)
			return true;
		var i=0;
		var sch="";
		str=str.toString();
		for ( i = str.length-1; i >= 0; i--){
			sch=str.charAt(i);
			if ( sch!=" " && sch!="\t" && sch!="\r" && sch!="\n") return false;
		}
		return true;
	}
	
	//集合是否包含指定元素
	function colIndex(coll,el){
		if(coll){
			for(var i=0;i<coll.length;i++){
				if(coll[i]==el)
					return i;
			}
		}
		return -1;
	}

	
	//处理传入参数，根据参数初始化界面
	var seldim= null;
	var dimvals = null;
	var dimvalDescs = null;
	//纬度选择渲染配置
	var dimsToSel = [];
	var dimsSeled = [];
	var seldimCol = isNull(seldim)?[]:seldim.split("|");
	var selDimVals = isNull(dimvals)?null:dimvals.split("|");
	var selDimValDescs = isNull(dimvalDescs)?null:decodeURIComponent(dimvalDescs).split("|");
	
/*	var userCity = getCity();
	if(showCity!="0"&&!isNull(userCity)&&userCity!="GD"){
		if(!cityCodeOk(userCity)){
			alert("用户地市设置错误，请联系管理员设置用户资料");
			return false;
		}
		//地市用户按照地市钻取
		if(!colContains(seldimCol,-1)){
			seldimCol.unshift(-1);
		}
	}*/ 
//	var dims = [{"composeDims":[],"dimension":"","dimensionDesc":"号码品牌","idxdimId":0,"idxid":"","level":0,"memo":"","num":"brnd_cd","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010001","dimensionDesc":"性别","idxdimId":1,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"gdr_typ_cd","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010101","dimensionDesc":"籍贯","idxdimId":2,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"id_home_prov","referinfo":"","showdesc":0,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010201","dimensionDesc":"职业","idxdimId":3,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"usr_typ_cd","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"年龄分层","idxdimId":4,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"age_cnt_rnk","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"是否4G客户","idxdimId":5,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"lte_4g_net_ind","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"是否中高端客户","idxdimId":6,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"mh_usr_ind","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"是否VIP客户","idxdimId":7,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"vip_usr_ind","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"是否高校","idxdimId":8,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"high_sch_ind","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"ARPU分层","idxdimId":9,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"arpu_rnk_cd","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"MOU分层","idxdimId":10,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"debet_dur_rnk","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"DOU分层","idxdimId":11,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"gprs_flux_rnk","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"DOU_4G分层","idxdimId":13,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"tdlte_gprs_flux_rnk","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"人均余额分层","idxdimId":13,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"yue_rnk","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"是否双降","idxdimId":14,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"both_down_ind","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"低龄、低流量客户群","idxdimId":15,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"both_low_ind","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"双高客户群","idxdimId":16,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"both_high_ind","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"高饱和度客户群","idxdimId":17,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"exceed_pkg_ind","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"DM异网渗透客户群","idxdimId":18,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"ywst_usr_count","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"是否套餐升档","idxdimId":19,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"pkg_up_ind","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"是否流量套餐降档","idxdimId":20,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"pkg_down_ind","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"是否合约捆绑","idxdimId":21,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"contract_bind_ind","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"是否停机保号","idxdimId":22,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"stpkp_nbr_ind","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"活跃用户标志","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"actv_usr_ind","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"当前终端品牌","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"cm_brand","referinfo":"","showdesc":0,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"当前终端型号","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"cm_ter_type","referinfo":"","showdesc":0,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"终端价格","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"cm_price_rnk","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"手机分辨率","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"cm_screen_pixel_rnk","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"内存大小","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"cm_ram_rnk","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"屏幕大小","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"cm_screen_size_rnk","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"电池容量","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"cm_battery_rnk","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"摄像头像素","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"cm_camera_pixel_rnk","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"是否双卡双待","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"cm_if_dual_card","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"网络类型","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"cm_term_net_type","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"是否移动购机","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"yd_sell_ind","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"是否支持指纹解锁","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"cm_if_fingerprint","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"是否双摄像头","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"cm_if_front_camera","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"终端机龄","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"ji_age_rak","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"换机月份","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"fst_eff_mo","referinfo":"","showdesc":0,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"换机类型","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"chg_typ_cd1","referinfo":"","showdesc":1,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"换机前的终端品牌","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"lm_brand","referinfo":"","showdesc":0,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"换机前的终端型号","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"lm_ter_type","referinfo":"","showdesc":0,"starttime":"","stoptime":""},
//		{"composeDims":[],"dimension":"100010301","dimensionDesc":"换机前的终端价格","idxdimId":23,"idxid":"CM-06-0001-0003","level":1,"memo":"","num":"lm_price_rnk","referinfo":"","showdesc":1,"starttime":"","stoptime":""}
//		
//		];
	var dims;
	$.ajax({
	       //几个参数需要注意一下
	           type: 'post',//方法类型
	           dataType: "json",//预期服务器返回的数据类型
	           url: basePath+'/consumerBigData/idimensional.do' ,//url
	           data: null,
	           async: false,
	           contentType: false,  
	           processData: false, 
	           success: function (result) {
	        	   dims= result.list;
	           },
	           error : function() {
	        	   alert("false");
	           }
	       });
	
	$.each(dims,function(n,item){
		var isCityDim = (item.num==-1?true:false);
		var dimObj = {"id":item.num,"readonly":"false","desc":item.dimensionDesc,"loadData":(item.showdesc==1||isCityDim?'true':'false')};
		//当前维度在指定已选择维度列表中的位置
		var colIdx = colIndex(seldimCol,item.num);
		if(colIdx>-1){
			//对于url传递钻取值的情况，额外设置维度下拉框的值的描述
			if(selDimVals!=null&&selDimValDescs!=null){
				dimObj["vid"]=selDimVals[colIdx];
				dimObj["value"]=selDimValDescs[colIdx];
			}
			dimsSeled.push(dimObj);
		}else{
			dimsToSel.push(dimObj);
		}
	});

    initDim(dimsSeled,dimsToSel);
    
    //渲染页面后计算宽度
    allLiweight();
});
function jqgridInit(){
	  jQuery("#list").jqGrid(
	      {
	        url:basePath+"/consumerBigData/query.do",
	        mtype:'post',
	        datatype: "local",
	        loadonce:false,     //一次性加载
	        gridview: true,    //增加读取速度、不适应于树表格，多级表格，和afterInsertRow事件
	        postData:{"billcyc":$("#billcyc").val(),"city":$("#citySelect").val()},
	        //scroll:1, 滚动加载
	        //datatype : "local",
	        colNames : [ '月份','号码','地市','区域_市','区域_县','号码品牌','性别','籍贯',
	        	'职业','年龄分层','活跃用户标志','是否三换客户','是否4g客户','是否中高端客户','是否vip客户',
	        	'是否通信用户','是否主动通信用户','是否高校' ,'arpu分层', 'mou分层', 'dou分层','dou_4g分层',
	        	'sou分层','aou分层','人均余额分层' ,'是否双降', '低龄、低流量客户群', '双高客户群','高饱和度客户群',
	        	'重点价值客户群','dm异网渗透客户群','是否套餐升档' ,'是否流量套餐降档', '是否合约捆绑', '是否停机保号','当前终端imei',
	        	'当前终端品牌','当前终端型号','当前终端产品型号' ,'终端价格', '手机分辨率', '内存大小','终端重量',
	        	'屏幕大小','电池容量','摄像头像素' ,'是否双卡双待', '网络制式', '网络类型','是否山寨机',
	        	'是否智能机','是否移动购机','购机类型' ,'是否支持nfc功能', '是否支持wifi', '是否支持指纹解锁','是否双摄像头',
	        	'是否旗舰机','是否ifTd','是否ifTdd' ,'终端机龄', '换机月份', '换机周期','换机次数',
	        	'换机类型','换机类型2','换机前的imei' ,'换机前的终端品牌', '换机前的终端型号', '换机前的终端产品型号','换机前的终端价格',
	        	'换机前的手机分辨率','换机前的内存大小','换机前的终端重量大小' ,'换机前的屏幕大小', '换机前的电池容量', '换机前的摄像头像素','在网用户数',
	        	'主动通信用户数','总消费额','总流量费用' ,'总计费时长', '总流量', '总4g流量','点对点短信上行条数',
	        	'aou','可用帐户总余额' 
	        	],
	        colModel : [ 

				 {name : 'statMo',index : 'statMo' }, 
                 {name : 'usrNbr',index : 'usrNbr',hidden:true }, 
                 {name : 'cmccBranchCd',index : 'cmccBranchCd' }, 
				 {name : 'cmccCtyNam',index : 'cmccCtyNam' }, 
                 {name : 'cmccCntyNam',index : 'cmccCntyNam'}, 
                 {name : 'brndCd',index : 'brndCd' ,hidden:true}, 
                 {name : 'gdrTypCd',index : 'gdrTypCd' ,hidden:true}, 
                 {name : 'idHomeProv',index : 'idHomeProv' ,hidden:true}, 
                 {name : 'usrTypCd',index : 'usrTypCd' ,hidden:true}, 
                 {name : 'ageCntRnk',index : 'ageCntRnk' ,hidden:true}, 
                 {name : 'actvUsrInd',index : 'actvUsrInd' ,hidden:true}, 
                 {name : 'threeChgInd',index : 'threeChgInd' ,hidden:true}, 
                 {name : 'lte4gNetInd',index : 'lte4gNetInd' ,hidden:true}, 
                 {name : 'mhUsrInd',index : 'mhUsrInd' ,hidden:true}, 
                 {name : 'vipUsrInd',index : 'vipUsrInd' ,hidden:true}, 
                 {name : 'cmnctUsrInd',index : 'cmnctUsrInd' ,hidden:true}, 
                 {name : 'actvCmnctInd',index : 'actvCmnctInd' ,hidden:true}, 
                 {name : 'highSchInd',index : 'highSchInd' ,hidden:true}, 
                 {name : 'arpuRnkCd',index : 'arpuRnkCd' ,hidden:true}, 
                 {name : 'debetDurRnk',index : 'debetDurRnk' ,hidden:true}, 
                 {name : 'gprsFluxRnk',index : 'cmccCntyNam' ,hidden:true}, 
                 {name : 'tdlteGprsFluxRnk',index : 'tdlteGprsFluxRnk' ,hidden:true}, 
                 {name : 'p2psmsUpRnk',index : 'p2psmsUpRnk' ,hidden:true}, 
                 {name : 'aouRnk',index : 'aouRnk' ,hidden:true}, 
                 {name : 'yueRnk',index : 'yueRnk' ,hidden:true}, 
                 {name : 'bothDownInd',index : 'bothDownInd' ,hidden:true}, 
                 {name : 'bothLowInd',index : 'bothLowInd' ,hidden:true}, 
                 {name : 'bothHighInd',index : 'bothHighInd' ,hidden:true}, 
                 {name : 'exceedPkgInd',index : 'exceedPkgInd' ,hidden:true}, 
                 {name : 'keyPersonInd',index : 'keyPersonInd' ,hidden:true}, 
                 {name : 'ywstUsrCount',index : 'ywstUsrCount' ,hidden:true}, 
                 {name : 'pkgUpInd',index : 'pkgUpInd' ,hidden:true}, 
                 {name : 'pkgDownInd',index : 'pkgDownInd' ,hidden:true}, 
                 {name : 'contractBindInd',index : 'contractBindInd' ,hidden:true}, 
                 {name : 'stpkpNbrInd',index : 'stpkpNbrInd' ,hidden:true}, 
                 {name : 'cmImei',index : 'cmImei' ,hidden:true}, 
                 {name : 'cmBrand',index : 'cmBrand' ,hidden:true}, 
                 {name : 'cmTerType',index : 'cmTerType' ,hidden:true}, 
				 {name : 'cmProductModel',index : 'cmProductModel' ,hidden:true}, 
                 {name : 'cmPriceRnk',index : 'cmPriceRnk' ,hidden:true}, 
                 {name : 'cmScreenPixelRnk',index : 'cmScreenPixelRnk' ,hidden:true}, 
                 {name : 'cmRamRnk',index : 'cmRamRnk' ,hidden:true}, 
                 {name : 'cmWeightRnk',index : 'cmWeightRnk' ,hidden:true}, 
                 {name : 'cmScreenSizeRnk',index : 'cmScreenSizeRnk' ,hidden:true}, 
                 {name : 'cmBatteryRnk',index : 'cmBatteryRnk' ,hidden:true}, 
                 {name : 'cmCameraPixelRnk',index : 'cmCameraPixelRnk' ,hidden:true}, 
                 {name : 'cmIfDualCard',index : 'cmIfDualCard' ,hidden:true}, 
                 {name : 'cmNetwork',index : 'cmNetwork' ,hidden:true}, 
                 {name : 'cmTermNetType',index : 'cmTermNetType' ,hidden:true}, 
                 {name : 'emuTermInd',index : 'emuTermInd' ,hidden:true}, 
                 {name : 'cmIfIntell',index : 'cmIfIntell' ,hidden:true}, 
                 {name : 'ydSellInd',index : 'ydSellInd' ,hidden:true}, 
                 {name : 'sellTypCd',index : 'sellTypCd' ,hidden:true}, 
                 {name : 'cmIfNfc',index : 'cmIfNfc' ,hidden:true}, 
                 {name : 'cmIfWifi',index : 'cmIfWifi' ,hidden:true}, 
                 {name : 'cmIfFingerprint',index : 'cmIfFingerprint' ,hidden:true}, 
                 {name : 'cmIfFrontCamera',index : 'cmIfFrontCamera' ,hidden:true}, 
                 {name : 'qiqjInd',index : 'qiqjInd' ,hidden:true}, 
                 {name : 'cmIfTd',index : 'cmIfTd' ,hidden:true}, 
                 {name : 'cmIfFddLte',index : 'cmIfFddLte' ,hidden:true}, 
                 {name : 'jiAgeRak',index : 'jiAgeRak' ,hidden:true}, 
                 {name : 'fstEffMo',index : 'fstEffMo' ,hidden:true},
                 {name : 'huanjiZqRnk',index : 'huanjiZqRnk' ,hidden:true}, 
                 {name : 'imeiCnt',index : 'imeiCnt' ,hidden:true}, 
                 {name : 'chgTypCd1',index : 'chgTypCd1' ,hidden:true}, 
                 {name : 'chgTypCd2',index : 'chgTypCd2' ,hidden:true}, 
                 {name : 'lmImei',index : 'lmImei' ,hidden:true}, 
                 {name : 'lmBrand',index : 'lmBrand' ,hidden:true}, 
                 {name : 'lmTerType',index : 'lmTerType' ,hidden:true}, 
                 {name : 'lmProductModel',index : 'lmProductModel' ,hidden:true}, 
			     {name : 'lmPriceRnk',index : 'lmPriceRnk' ,hidden:true},
		         {name : 'lmScreenPixelRnk',index : 'lmScreenPixelRnk' ,hidden:true},			  
                 {name : 'lmRamRnk',index : 'lmRamRnk' ,hidden:true}, 
                 {name : 'lmWeightRnk',index : 'lmWeightRnk' ,hidden:true}, 
                 {name : 'lmScreenSizeRnk',index : 'lmScreenSizeRnk' ,hidden:true}, 
                 {name : 'lmBatteryRnk',index : 'lmBatteryRnk' ,hidden:true}, 
                 {name : 'lmCameraPixelRnk',index : 'lmCameraPixelRnk' ,hidden:true}, 
                 {name : 'innetUsrCnt',index : 'innetUsrCnt' ,hidden:true}, 
                 {name : 'cmnctUsrCnt',index : 'cmnctUsrCnt' ,hidden:true}, 
                 {name : 'totFee',index : 'totFee' ,hidden:true}, 
                 {name : 'gprsFee',index : 'gprsFee' ,hidden:true}, 
                 {name : 'debetDur',index : 'debetDur' ,hidden:true}, 
                 {name : 'gprsFlux',index : 'gprsFlux' ,hidden:true}, 
                 {name : 'tdlteGprsFlux',index : 'tdlteGprsFlux' ,hidden:true}, 
                 {name : 'p2psmsUpCnt',index : 'p2psmsUpCnt' ,hidden:true}, 
                 {name : 'aou',index : 'aou' ,hidden:true}, 
                 {name : 'avlTotAcctAmt',index : 'avlTotAcctAmt' ,hidden:true}/*, 
	                     {name : 'cmccBranchCd',index : 'cmccBranchCd',sorttype : "string",searchoptions:{sopt:['eq','lt','le','gt','ge','ne']}}, 
	                     {name : 'cm_brand',index : 'cm_brand',sorttype : "string",searchoptions:{sopt:['cn']}}, 
	                     {name : 'cm_price_rnk',index : 'cm_price_rnk',sorttype : "string",searchoptions:{sopt:['cn']}}, 
	                     {name : 'yd_sell_ind',index : 'yd_sell_i
	                                                                                                                 nd',sorttype : "string",searchoptions:{sopt:['cn']}}, 
	                     {name : 'cm_if_fingerprint',index : 'cm_if_fingerprint',sorttype : "string",searchoptions:{sopt:['cn']}}, 
	                     {name : 'ji_age_rak',index : 'ji_age_rak',sorttype : "string",hidden:true,searchoptions:{sopt:['cn']}}, 
	                     {name:'lm_price_rnk',index:'lm_price_rnk',sortable: false, search:false },
	                     {name:'gdr_typ_cd',index:'gdr_typ_cd',sortable: false,search:false},
	                     {name:'age_cnt_rnk',index:'age_cnt_rnk',sortable: false, search:false },
	                     {name:'actv_usr_ind',index:'actv_usr_ind',sortable: false, search:false },
	                     {name:'vip_usr_ind',index:'vip_usr_ind',sortable: false, search:false },
	                     {name:'arpu_rnk_cd',index:'arpu_rnk_cd',sortable: false, search:false },
	                     {name:'exceed_pkg_ind',index:'exceed_pkg_ind',sortable: false, search:false },
	                   {name:'gprs_flux_rnk',index:'gprs_flux_rnk',sortable: false, search:	                     {name:'tdlte_gprs_flux_rnk1',index:'tdlte_gprs_flux_rnk1',sortable: false, search:false } */
	                   ],
	                   
	                   gridComplete:function(){//表格加载执行 
	                	   $("#list").setGridWidth($(window).width()*0.965);
	                  	 
	                  	   $(window).resize(function(){  
	                  		 $("#list").setGridWidth($(window).width()*0.965);
	                       });
	                	   var total = $("#list").jqGrid('getGridParam', 'records'); 
		                  	 $("#total_user").text("用户数"+total);
	                  	   showOrhideColumn();
	                 	},             
	        rowNum:10,        
	        rowList : [10,20,50,100], 
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
	/*         jsonReader: {        //描述json 数据格式的数组,需修改
	        	root: 'list',
		    	page: "current",        // json中代表当前页码的数据
		    	total: "pages",         // json中代表页码总数的数据
		    	records: "total",       // json中代表数据行总数的数据
		    	repeatitems: false,     // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
		    	cell: "cell",
		    	id: "fRoleId",
		    	userdata: "userdata",
		    },     */           
	        caption : "",
	      });
	  
	  //jQuery("#list").jqGrid('filterToolbar',{searchOperators : true});
	  //jQuery("#list").jqGrid('navGrid','#pager',{add:false,edit:false,del:false});

};
function jqgridReload(postData){
	//$("#list").jqGrid('clearGridData'); 
	
	 $("#list").setGridParam({postData :postData,datatype:'json', page:1}).trigger('reloadGrid');
/*	$("#list").jqGrid('setGridParam',{  
		  postData : postData,
		  datatype:'json',
	      page:1
	}).trigger("reloadGrid");*/
};
function checBoxkOnChange(this_){
	 var isCheck=this_.is(':checked');  //获得全选复选框是否选中
	 var name = this_.attr("name");
	    $("input[name='"+name+"']").each(function() {  
	        this.checked = isCheck;       //循环赋值给每个复选框是否选中
	    });
	    showOrhideColumn();
}
function showOrhideColumn(){
	  $("input[type='checkbox']").each(function() {  
		  var isCheck= $(this).is(':checked'); 
		  var value =  $(this).val();
		  if(isCheck){
			  jQuery("#list").setGridParam().showCol(value).trigger("reloadGrid");
		  }else{
			  jQuery("#list").setGridParam().hideCol(value).trigger("reloadGrid");
		  }
	  });
	
	
}


//当前终端品牌  
function brandSelect(){
	$.ajax({
	       //几个参数需要注意一下
	           type: 'post',//方法类型
	           dataType: "json",//预期服务器返回的数据类型
	           url: basePath+'/consumerBigData/brandSelect.do' ,//url
	           data: null,
	           async: false,
	           contentType: false,  
	           processData: false, 
	           success: function (result) {
	        	   $("#cm_brand").append("<option></option>");
	        	   $("#lm_brand").append("<option></option>");
	        	  var  brandList= result.list;
	        	  for (var i = 0; i < brandList.length; i++) {
					$("#cm_brand").append("<option value="+brandList[i]+">"+brandList[i]+"</option>");//当前终端品牌
					$("#lm_brand").append("<option value="+brandList[i]+">"+brandList[i]+"</option>");//换机前终端的品牌
				}
	           },
	           error : function() {
	        	   alert("false");
	           }
	       });
	
}
//当前终端机型
function specSelect(){
	var cm_brand=$("#cm_brand").val();
	 $.ajax({
	       //几个参数需要注意一下
		 	   type: 'post',//方法类型
	           url: basePath+'/consumerBigData/specSelect.do' ,//url
	           dataType: "json",//预期服务器返回的数据类型
	           data:JSON.stringify({'cm_brand':cm_brand}),
	           async: false,
	           contentType: 'application/json; charset=utf-8', 
	           processData: false, 
	           success: function(result){
	        	   $("#cm_ter_type").empty();
	        	   $("#cm_ter_type").append("<option></option>");
	        	  var  specList= result.list;
	        	  if(specList==null){
	        		  return false;
	        	  }
	        	  for (var i = 0; i < specList.length; i++) {
					$("#cm_ter_type").append("<option value="+specList[i]+">"+specList[i]+"</option>");
				}
	           },
	           error : function() {
	        	   alert("false");
	           }
	       });
}
//换机前终端机型
function beforeSpecSelect(){
	var cm_brand=$("#lm_brand").val();
	 $.ajax({
	       //几个参数需要注意一下
		 	   type: 'post',//方法类型
	           url: basePath+'/consumerBigData/specSelect.do' ,//url
	           dataType: "json",//预期服务器返回的数据类型
	           data:JSON.stringify({'cm_brand':cm_brand}),
	           async: false,
	           contentType: 'application/json; charset=utf-8', 
	           processData: false, 
	           success: function(result){
	        	   $("#lm_ter_type").empty();
	        	   $("#lm_ter_type").append("<option></option>");
	        	  var  specList= result.list;
	        	  if(specList==null){
	        		  return false;
	        	  }
	        	  for (var i = 0; i < specList.length; i++) {
					$("#lm_ter_type").append("<option value="+specList[i]+">"+specList[i]+"</option>");
				}
	           },
	           error : function() {
	        	   alert("false");
	           }
	       });
}