/**
 * Created with JetBrains WebStorm.
 * User: moco
 * Date: 14-1-5
 * Time: 下午11:27
 */

var wdLists = {};

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



/**
 * initDim 用于初始化界面
 * @param unsltLists 初始化unselect的列表
 */

function initDim(sltLists,unsltLists){
    $.each(sltLists,function(idx,val){
        wdLists[val.id]={
            "readonly":val.readonly,
            "desc":val.desc,
            "value":val.value,
            "vid":val.vid,
            "loadData":val.loadData,
        	"afterSelect":val.afterSelect,
        	"afterUnSelect":val.afterUnSelect,
        	"posfix":val.posfix
        };
        addSelect(val.id,val.readonly);

        setItemval(val.id,val.desc,val.vid,val.value);
    })
    $.each(unsltLists,function(idx,val){
        wdLists[val.id]={
            "readonly":val.readonly,
            "desc":val.desc,
            "value":val.value,
            "vid":val.vid,
            "loadData":val.loadData,
            "afterSelect":val.afterSelect,
            "afterUnSelect":val.afterUnSelect,
            "posfix":val.posfix
        };
        addUnselect(val.id,val.desc);

    })
}

/**
 * addSelect  添加到左边
 * @param id 维度id
 * @param readonly true为不可下拉 false为可下拉，同时为添加了个onmouseenter事件用于选择值
 */

function  addSelect(id,readonly){
	allLiweight();
    var $item = $("#select_"+id);
    if(!$item.length){
       $item=$("<li id='select_"+id+"' style='margin-bottom: 10px;'><span class='text-c'><span class='text-s'></span></span></li>").appendTo("#SelectedLists");
    }
    if (readonly == "false") {
        $item[0].className = "readable";
        $item.find('.text-c').append("<i class='arrow-right'></i>");
    } else {
        $item[0].className = "readonly";
    }

}

/**
 * 删除左边
 * @param id 要删除的ID
 */
function delectSelect(id){
    var $item = $("#select_"+id);
    if(!$item.length){
        return;
    }
    $item.remove();
    $('#SelectedLists li:first-child').css({'background': 'none', 'padding-left': '0'});
}

/**
 * 添加至右边
 * @param id
 */

function addUnselect(id,desc){
    var $item =$("#unselect_"+id);
    if(!$item.length){
        $item=$("<li/>",{
            "id":"unselect_"+id,
            "style":"margin-bottom: 10px;",
            html:"<span><span class='text-s'>"+desc+"</span></span>"
        }).appendTo("#UnselectedLists").bind('click',function(){ _SelectItem(id);
        $('#SelectedLists li:first-child').css({'background': 'none', 'padding-left': '15px'});
        });
    }
}

/**
 * 删除右边
 * @param id
 */
function delectUnselect(id){
    var $item = $("#unselect_"+id);
    if(!$item.length){
        return;
    }
    $item.remove();

}

/**
 * 设置选择了的值，同时会添加一个以wd+"id"为name,以val为value的隐藏域
 * @param id 要设值的维度ID
 * @param desc 按钮描述
 * @param val 按钮类型 根据是否有值有不同的表现
 */

function setItemval(id,desc,vid,val){
    var $item = $("#select_"+id);
    var last_value = "";
    var current  ="";
    if(!$item.length){
        return;
    }
    if($item.find('.text-s input').val() !=undefined){
    	last_value = $item.find('.text-s input').val();
    }
    var last_value_Arr = last_value.split(',');
    if(last_value == "" ){
    	current = val;
    }else{
    	if(last_value.indexOf(val) == -1 ){
    		if("所有值"==val){
    			current="";
    		}else{
    			
    			current = last_value+","+val
    		}
    		
    	}else{
    		if("所有值"==val){
    			current="";
    		}else{
    		
	    		last_value_Arr.splice($.inArray(val,last_value_Arr),1);
	    		current=last_value_Arr.join(',');
    		}
    	}
    	
    }
/*    $item.find('.text-s').html("").append(!isNull(vid)?desc+":"+val:desc).append($("<input/>",{
    	"id":"wd"+id,
        "type":"hidden",
        "name":"wd"+id,
        "adesc":(!isNull(vid)?val:""),
        "value":(!isNull(val)?val:"")
    }));
    */
    $item.find('.text-s').html("").append(!isNull(vid)?desc+":"+current:desc).append($("<input/>",{
    	"id":"wd"+id,
        "type":"hidden",
        "name":"wd"+id,
        "adesc":(!isNull(vid)?current:""),
        "value":(!isNull(val)?current:"")
/*        "adesc":(!isNull(vid)?val:""),
        "value":(!isNull(val)?val:"")*/
    }));
}

/**
 * 获取所有选中的维度id
 * @returns {Array}
 */
function getSelectIds(){
    var ids = [];
    $("input:hidden",$(".latitude-check-list-c")).each(function(){
        ids.push(this.name.replace("wd",""));
    });
    return ids;
}

/**
 * 获取所有选中的类型，跟上面的id 11对应
 * @returns {Array}
 */

function getSelectVals(){
    //var vals = [];
    var vals = {};
    $("input:hidden",$(".latitude-check-list-c")).each(function(){
       // vals.push(this.value);
    	vals[this.name.replace("wd","")] = this.value;
    	
    });
    return vals;
}


/*下面的事件方法可自定义实际使用组合，从左边到右边总调用方法*/
function _unSelectItem(id){
	if(wdLists[id].posfix=="true"){
		return;
	}
	
    delectSelect(id);
    allLiweight();
    addUnselect(id,wdLists[id].desc);
    var afterUnSelect = wdLists[id].afterUnSelect;
    if(afterUnSelect){
    	afterUnSelect(id,wdLists[id].desc);
    }
    allLiweight();
}

function _SelectItem(id){
    /*从右边到左边总调用方法
     * 调用为
     * */
    delectUnselect(id);
    allLiweight();
    addSelect(id,wdLists[id].readonly);
    setItemval(id,wdLists[id].desc,wdLists[id].vid,wdLists[id].value);
    var afterSelect = wdLists[id].afterSelect;
    if(afterSelect){
    	afterSelect(id,wdLists[id].desc);
    }
    allLiweight();
}


var popDataCache = {};
function _showPop(id) {
	clicked = true;
    currentLatitudeId = id;
    var isLoad = (wdLists[id].loadData=='true');//是否需要下拉列表
    if(!isLoad){
    	_makePop(id,null);
    	clicked = false;
    	return;
    }
    var cacheData = popDataCache[id];
    if(cacheData){
    	_makePop(id,cacheData);
    	clicked = false;
    	return;
    }
    
//    var rows ={"brnd_cd":[{"value":"全球通","key":"全球通"},{"value":"神州行","key":"神州行"},{"value":"动感地带","key":"动感地带"},{"value":"神州大众卡","key":"神州大众卡"},{"value":"未知","key":"未知"}],
//    		   "gdr_typ_cd":[{"value":"女","key":"女"},{"value":"男","key":"男"},{"value":"未知","key":"未知"}],
//    		   "id_home_prov":[{"value":"CBE","key":"CBE"},{"value":"DCCM","key":"DCCM"},{"value":"DSPLIT","key":"DSPLIT"},{"value":"网维","key":"WW"}],
//    		   "usr_typ_cd":[{"value":"白领","key":"白领"},{"value":"个体客户","key":"个体客户"},{"value":"商务人士","key":"商务人士"},{"value":"外来工","key":"外来工"},{"value":"校园学生","key":"校园学生"},{"value":"未知","key":"WW"}],
//    		   "age_cnt_rnk":[{"value":"少年（18岁以下）","key":"少年（18岁以下"},{"value":"青年（18-24岁）","key":"DCCM"},{"value":"青年（24-30岁）","key":"DSPLIT"},{"value":"中年（30-40岁）","key":"WW"},{"value":"中年（40-55岁）","key":"WW"},{"value":"老年（55岁以上）","key":"WW"},{"value":"未知","key":"WW"}],
//    		   "lte_4g_net_ind":[{"value":"是","key":"是"},{"value":"否","key":"否"}],
//    		   "mh_usr_ind":[{"value":"是","key":"是"},{"value":"否","key":"否"}],
//    		   "vip_usr_ind":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//    		   "high_sch_ind":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//    		   "arpu_rnk_cd":[{"value":"0元以下","key":"CBE"},{"value":"[0-10)","key":"DCCM"},{"value":"[10-20)","key":"DSPLIT"},{"value":"[20-30)","key":"WW"},{"value":"[30-40)","key":"WW"},
//    		{"value":"[40-50)","key":"WW"},{"value":"[50-60)","key":"WW"},{"value":"[60-70)","key":"WW"},{"value":"[70-80)","key":"WW"},
//    		{"value":"[80-90)","key":"WW"},{"value":"[90-100)","key":"WW"},{"value":"[100-110)","key":"[100-110)"},{"value":"[110-120)","key":"[110-120)"},
//    		{"value":"[120-130)","key":"[120-130)"},{"value":"[130-140)","key":"[130-140)"},{"value":"[140-150)","key":"[140-150)"},{"value":"[150-160)","key":"[150-160)"},
//    		{"value":"[160-170)","key":"[160-170)"},{"value":"[170-180)","key":"[170-180)"},{"value":"[180-190)","key":"[180-190)"},{"value":"[190-200)","key":"[190-200)"},
//    		{"value":"[200-250)","key":"[200-250)"},{"value":"[250-300)","key":"[250-300)"},{"value":"[300-350)","key":"[300-350)"},{"value":"[350-400)","key":"[350-400)"},
//    		{"value":"[400-450)","key":"[400-450)"},{"value":"[450-500)","key":"[450-500)"},{"value":"[500-1000)","key":"[500-1000)"},{"value":"1000元及以上","key":"1000元及以上"}
//    		],
//    		   "debet_dur_rnk":[{"value":"B=0","key":"CBE"},{"value":"0<B<10","key":"DCCM"},{"value":"10≤B<20","key":"DSPLIT"},{"value":"20≤B<30","key":"WW"}
//    		   ,{"value":"30≤B<50","key":"30≤B<50"},{"value":"50≤B<80","key":"50≤B<80"},{"value":"80≤B<100","key":"80≤B<100"},{"value":"100≤B<150","key":"100≤B<150"},{"value":"150≤B<200","key":"150≤B<200"}
//    		   ,{"value":"200≤B<250","key":"200≤B<250"},{"value":"250≤B<300","key":"250≤B<300"},{"value":"300≤B<400","key":"300≤B<400"},{"value":"400≤B<500","key":"400≤B<500"},{"value":"500≤B<600","key":"500≤B<600"}
//    		   ,{"value":"600≤B<800","key":"800≤B<1000"},{"value":"1000≤B<1500","key":"1000≤B<1500"},{"value":"1500≤B<2000","key":"1500≤B<2000"},{"value":"2000≤B<3000","key":"2000≤B<3000"},{"value":"3000≤B<4000","key":" 3000≤B<4000"}
//    		   ,{"value":"4000≤B<5000","key":"4000≤B<5000"},{"value":"5000分钟以上","key":"5000分钟以上"}
//    		   ],
//    		   "gprs_flux_rnk":[{"value":"小于30M","key":"CBE"},{"value":"[30-70)M","key":"DCCM"},{"value":"[70-100)M","key":"DSPLIT"},{"value":"[100-150)M","key":"WW"}],
//    		   "tdlte_gprs_flux_rnk":[{"value":"小于30M","key":"CBE"},{"value":"[30-70)M","key":"DCCM"},{"value":"[70-100)M","key":"DSPLIT"},{"value":"[100-150)M","key":"WW"}],
//    		   "yue_rnk":[{"value":"小于0元","key":"CBE"},{"value":"[0-10)元","key":"DCCM"},{"value":"[10-20)元","key":"DSPLIT"},{"value":"[20-30)元","key":"WW"}],
//    		   "both_down_ind":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//    		   "both_low_ind":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//    		   "both_high_ind":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//    		   "exceed_pkg_ind":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//    		   "ywst_usr_count":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//    		   "pkg_up_ind":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//    		   "pkg_down_ind":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//    		   "contract_bind_ind":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//    		   "stpkp_nbr_ind":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//    		   "actv_usr_ind":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//			   "cm_brand":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//			   "cm_ter_type":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//			   "cm_price_rnk":[{"value":"[0-500)元","key":"[0-500)元"},{"value":"[500-1000)元","key":"[500-1000)元"},{"value":"[1000-1500)元","key":"[1000-1500)元"},{"value":"[1500-2000)元","key":"[1500-2000)元"},{"value":"[2000-3000)元","key":"[2000-3000)元"},{"value":"[3000-4000)元","key":"[3000-4000)元"},{"value":"[4000-5000)元","key":"[4000-5000)元"},{"value":"大于5000元","key":"大于5000元"},{"value":"未知","key":"未知"}],
//			   "cm_screen_pixel_rnk":[{"value":"小于30万","key":"小于30万"},{"value":"[30-50)万","key":"[30-50)万"},{"value":"[50-80)万","key":"[50-80)万"},{"value":"[80-100)万","key":"[80-100)万"},{"value":"大于100万","key":"大于100万"},{"value":"未知","key":"未知"}],
//			   "cm_ram_rnk":[{"value":"小于1G","key":"小于1G"},{"value":"[1-2)G","key":"[1-2)G"},{"value":"[2-3)G","key":"[2-3)G"},{"value":"大于3G","key":"大于3G"},{"value":"未知","key":"未知"}],
//			   "cm_screen_size_rnk":[{"value":"小于4.0","key":"小于4.0"},{"value":"[4.0-4.5)","key":"[4.0-4.5)"},{"value":"[4.5-5.0)","key":"[4.5-5.0)"},{"value":"[5.0-5.5)","key":"[5.0-5.5)"},{"value":"大于5.5","key":"大于5.5"},{"value":"未知","key":"未知"}],
//			   "cm_battery_rnk":[{"value":"小于1000","key":"小于1000"},{"value":"[1000-2000)","key":"[1000-2000)"},{"value":"[2000-3000)","key":"[2000-3000)"},{"value":"大于3000","key":"大于3000"},{"value":"未知","key":"未知"}],
//			   "cm_camera_pixel_rnk":[{"value":"小于300万","key":"小于300万"},{"value":"[300-500)万","key":"[300-500)万"},{"value":"[500-800)万","key":"[500-800)万"},{"value":"[800-1000)万","key":"[800-1000)万"},{"value":"大于1000万","key":"大于1000万"},{"value":"未知","key":"未知"}],
//			   "cm_if_dual_card":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//			   "cm_term_net_type":[{"value":"2G","key":"2G"},{"value":"3G","key":"3G"},{"value":"4G","key":"4G"},{"value":"未知","key":"未知"}],
//			   "yd_sell_ind":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//			   "cm_if_fingerprint":[{"value":"是","key":"是"},{"value":"否","key":"否"}],
//			   "cm_if_front_camera":[{"value":"是","key":"是"},{"value":"否","key":"否"}],
//			   "ji_age_rak":[{"value":"小于3个月","key":"小于3个月"},{"value":"[3-6)月","key":"[3-6)月"},{"value":"[6-12)月","key":"[6-12)月"},{"value":"[12-24)月","key":"[12-24)月"},{"value":"[24-36)月","key":"[24-36)月"},{"value":"[36-60)月","key":"[36-60)月"},{"value":"[60-120)月","key":"[60-120)月"},{"value":"大于120月","key":"大于120月"},{"value":"未知","key":"未知"}],
//			   "fst_eff_mo":[{"value":"是","key":"是"},{"value":"否","key":"否"}],
//			   "chg_typ_cd1":[{"value":"新增换新机","key":"新增换新机"},{"value":"新增换旧机","key":"新增换旧机"},{"value":"存量换新机","key":"存量换新机"},{"value":"存量换旧机","key":"存量换旧机"}],
//			   "lm_brand":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//			   "lm_ter_type":[{"value":"是","key":"CBE"},{"value":"否","key":"DCCM"}],
//			   "lm_price_rnk":[{"value":"[0-500)元","key":"[0-500)元"},{"value":"[500-100)元","key":"[500-100)元"},{"value":"[1000-1500)元","key":"[1000-1500)元"},{"value":"[1500-2000)元","key":"[1500-2000)元"},{"value":"[2000-3000)元","key":"[2000-3000)元"},{"value":"[3000-4000)元","key":"[3000-4000)元"},{"value":"[4000-5000)元","key":"[4000-5000)元"},{"value":"大于5000元","key":"大于5000元"},{"value":"未知","key":"未知"}] 
//		 
//    		}
    
    var rows;
    $.ajax({
	       //几个参数需要注意一下
	           type: 'post',//方法类型
	           dataType: "json",//预期服务器返回的数据类型
	           url: basePath+'/consumerBigData/details.do' ,//url
	           data: null,
	           async: false,
	           contentType: false,  
	           processData: false, 
	           success: function (resultMap) {
	        	   rows= resultMap;
	           },
	           error : function() {
	        	   alert("false");
	           }
	       });
    
    var row = rows[id];//  [{"value":"CBE","key":"CBE"},{"value":"DCCM","key":"DCCM"},{"value":"DSPLIT","key":"DSPLIT"},{"value":"网维","key":"WW"}];
    
    
    row.unshift({key:'',value:'所有值'});
	  popDataCache[id]=row;
	  _makePop(id,row);
/*    var idxid = getQueryString("idxid");
    var urlStr = 'getDimValues.do?idxid='+idxid+'&num='+id;
    $.ajax({
        "url": urlStr,
         "type":"get",
         "dataType":"json",
         "success":function(result){
          if(result.retFlag==1){
        	  var rows = result.rows;
        	  rows.unshift({key:'',value:'全部'});
        	  popDataCache[id]=rows;
        	  _makePop(id,rows);
		  }else{
			  alert(result.msg);
		  } 
          clicked = false;
         },
    "error":function(){
        clicked=false;
    }
     })*/
}

function _makePop(id,data){
	//生成弹出层面板
    var $item = $("#select_"+id);
    var adesc = $("#wd"+id).length>0?$("#wd"+id).attr("adesc"):"";
    var $contentScrollLeft=$(".latitude-check-list-c-scroll-p").position().left;
    var $contentLiLeft=$item.position().left;
    var $typeContentLeft=$contentScrollLeft+$contentLiLeft+50;
    var mbtn = (data==null?"<div class='type-content-btncont'><button type='button' class='type-content-cancel'>清空</button>&nbsp<button type='button' class='type-content-submit'>确认</button></div>":"");
    var placeholder = (data==null?'请输入后回车':'快速查找');
    $("<div class='type-content' style='left: "+$typeContentLeft+"px;'><div class='type-content-bg'><div class='type-content-arrow-top'></div><div class='type-content-i clearfix' id='typeLists'><input id='searchResult' type='text' size='60' class='form-text acInput' maxlength='128' style='width: 135px;color:#00020f;'autocomplete='off' value='"+adesc+"' placeholder='"+placeholder+"'/>"
    +"<div class='type-content-list-p'><div class='type-content-list '>"+mbtn+"<ul class='type-content-listUl' style='height:250px;width: 150px;overflow-y:scroll;' ></ul></div></div></div></div></div>").appendTo('body').bind('click',function(){return false;});
	if(data==null){
		$(".type-content-cancel").click(function(){
			_selectOptions(id,null,null);
		});
		$(".type-content-submit").click(function(){
			var searchText = $('#searchResult').val();
			_selectOptions(id,searchText,searchText);
		});
	}
    selectListData = data;
	_initPopups(id, selectListData);
	$("#searchResult").change(function(){
		var searchText = $('#searchResult').val();
		_selectOptions(id,searchText,searchText);
	});
    
}
/**
 *
 * @param id
 * @param types
 * @private
 */
function _initPopups(id,types,onAnimate){
	if(types==null)
		return;
    $(".type-content-listUl").empty();
    var $typeContentListUl = $('.type-content-listUl');
    var listHtml = '';
    var listItemTmpl = '<li data-id="' + id + '" data-vid="{{vid}}" data-text="{{text}}"><a>{{text}}</a></li>';

    var hasScroll = types.length > 10 ? true : false;
    //计算高度
   // var allLiHeight = 25 * (hasScroll ? 10 : types.length);
    var allLiHeight = 25 * (hasScroll ? 10 : types.length);
    //生成
    $.each(types, function (idx, val) {
        listHtml += listItemTmpl.replace('{{vid}}', val.key).replace(/{{text}}/g, (isNull(val.value)?val.key:val.value));
    })
    //更新下拉选项
    $typeContentListUl.html(listHtml);
    //注册点击事件
    $typeContentListUl.find('li').click(function () {
        _selectOptions($(this).attr("data-id"), $(this).attr("data-vid"), $(this).attr("data-text"));
    })

    //显示
    if (onAnimate !== undefined && onAnimate) {
        $typeContentListUl.hide()
        $('.type-content-list').animate({ 'height': allLiHeight + 'px' }, function () {
            $typeContentListUl.fadeIn();
            $('.type-content-list').jScrollPane({ showArrows: false });
        });
    } else {
        $('.type-content-list').height(allLiHeight).jScrollPane({ showArrows: false});
    }

}

function _selectOptions(id,vid,val){
    $(".type-content-listUl").empty();
    setItemval(id,wdLists[id].desc,vid,val);
    wdLists[id].vid = vid;
    wdLists[id].value = val;
    $('.type-content').remove();
    window.parentId="";
    allLiweight();

}
//计算li宽度和从新调用滚动条
function allLiweight(){
    //纬度选择获取所有li元素的宽度赋值
    var ul_width = 0;
    $('.latitude-check-list-c').each(function(){
        var li_width = 0;
            $('li').each(function(){
                $(this)[0]=this;
                li_width += this.offsetWidth;
            });
            ul_width = document.body.clientWidth-150;
        $('.latitude-check-list-c').css({'width': ul_width + 'px'/*,'overflow':'hidden' */});
    });
/*    $('.latitude-check-list-c-scroll').css({'width': ul_width + 'px'}).jScrollPane( {
        showArrows: false
    })*/
}


