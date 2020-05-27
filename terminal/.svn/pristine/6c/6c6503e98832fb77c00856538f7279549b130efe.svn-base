$(function () {
	$("input[name='month']").val('201812');//临时
  // setAutoMonth();

   // initEchart();

  //  initDatePicker();
//初始页面数据
    getVal();
    $("#gf_kpi a ").each(function(){
    	   $(this).click(function(){
	   /*        var a = document.getElementById("aHref");*/
	           var url = $(this).attr("url");
	          
	           this.href = url+'&billcyc='+$("#month").val();
	          // 取消<a>标签原先的onclick事件,使<a>标签点击后通过href跳转(因为无法用js跳转)
	           this.setAttribute("onclick",'');
	           //激发标签点击事件OVER
	          this.click("return false");
	       });
    });
 
    
    

    //初始化日期选择控件
    function initDatePicker(){
        $.fn.datepicker.dates['cn'] = {   //切换为中文显示
            days: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
            daysShort: ["日", "一", "二", "三", "四", "五", "六", "七"],
            daysMin: ["日", "一", "二", "三", "四", "五", "六", "七"],
            months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
            monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
            today: "今天",
            clear: "清除"
        };

        $('#month').datepicker({
            autoclose: true, //自动关闭
            beforeShowDay: $.noop,    //在显示日期之前调用的函数
            calendarWeeks: false,     //是否显示今年是第几周
            calendarDays:false,
            clearBtn: 1,          //显示清除按钮
            daysOfWeekDisabled: [],   //星期几不可选
            endDate: Infinity,        //日历结束日期
            forceParse: true,         //是否强制转换不符合格式的字符串
            format: 'yyyymm',     //日期格式
            keyboardNavigation: true, //是否显示箭头导航
            language: 'cn',           //语言
            minViewMode: 1,
            orientation: "auto",      //方向
            rtl: false,
            startDate: -Infinity,     //日历开始日期
            startView: 0,             //开始显示
            todayBtn: false,          //今天按钮
            todayHighlight: 0,    //今天高亮
            weekStart: 0              //星期几是开始
        }).on('changeDate',function () {
            getVal();
        });
    }
    // var isChanged = true;
    //
    // $('#month').change( function() {
    //     if(isChanged){
    //         console.log('111');
    //     }
    //     isChanged = true;
    // })

    function setAutoMonth(){
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth() ;
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        var endMonth = String(year) + month;
        $("input[name='month']").val(endMonth);
    }


    
    
//    function getType8Val(){
//       
//    }
})

    function getVal(){
        $.ajax({
            type: 'post',
            url: basePath+'/entry/getScore.do',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify({'month':$('#month').val()}),
            async: false,
            dataType: 'json',
            success: function(result,textStatus){
                console.log(result);

                //雷达图
                initEchart(result.businessIncomeFz,result.terminalSalesFZ,result.shqdtzFz,result.sgsxtFz,Number(result.feeProgressBalanceFZ)+Number(result.grossProfitRatioFZ),result.ldzczzl);

                //菜单
                if(result.year!=null){
                	$('#menu td:eq(1)').text(result.year+"年考核项目");
                }
                //列表数据
                //运营收入
                if(result.businessIncome!=null){
                $('#businessIncome td:eq(2)').text(result.businessIncome.fz);
                $('#businessIncome td:eq(4)').text((result.businessIncome.mbz/100000000).toFixed(2));
                $('#businessIncome td:eq(5)').text("亿元");
                $('#businessIncome td:eq(6)').text((result.businessIncome.bywcqk/100000000).toFixed(6));
                $('#businessIncome td:eq(7)').text((result.businessIncome.qnwcsr/100000000).toFixed(6));
                $('#businessIncome td:eq(8)').text(result.businessIncome.sjwcd);
                }else{
                	$('#businessIncome td:eq(2)').text('-');
                    $('#businessIncome td:eq(4)').text('-');
                    $('#businessIncome td:eq(6)').text('-');
                    $('#businessIncome td:eq(7)').text('-');
                    $('#businessIncome td:eq(8)').text('-');
                }
                //自有品牌手机收入
                if(result.incomePhoneBrand!=null){
                $('#incomePhoneBrand td:eq(1)').text(result.incomePhoneBrand.fz);
                $('#incomePhoneBrand td:eq(3)').text((result.incomePhoneBrand.mbz/10000).toFixed(2));
                $('#incomePhoneBrand td:eq(4)').text("万元");
                $('#incomePhoneBrand td:eq(5)').text((result.incomePhoneBrand.bywcqk/10000).toFixed(4));
                $('#incomePhoneBrand td:eq(6)').text((result.incomePhoneBrand.qnwcsr/10000).toFixed(4));
                $('#incomePhoneBrand td:eq(7)').text(result.incomePhoneBrand.sjwcd);
                }else{
                	$('#incomePhoneBrand td:eq(1)').text('0');
                    $('#incomePhoneBrand td:eq(3)').text('-');
                    $('#incomePhoneBrand td:eq(5)').text('-');
                    $('#incomePhoneBrand td:eq(6)').text('-');
                    $('#incomePhoneBrand td:eq(7)').text('-');
                }
                //自有品牌多形态终端收入
                if(result.incomeMultiForm!=null){
                $('#incomeMultiForm td:eq(1)').text(result.incomeMultiForm.fz);
                $('#incomeMultiForm td:eq(3)').text((result.incomeMultiForm.mbz/10000).toFixed(2));
                $('#incomeMultiForm td:eq(4)').text("万元");
                $('#incomeMultiForm td:eq(5)').text((result.incomeMultiForm.bysrwcl/10000).toFixed(4));
                $('#incomeMultiForm td:eq(6)').text((result.incomeMultiForm.qnwcsr/10000).toFixed(4));
                $('#incomeMultiForm td:eq(7)').text(result.incomeMultiForm.sjwcd);
                }else{
                	 $('#incomeMultiForm td:eq(1)').text('0');
                     $('#incomeMultiForm td:eq(3)').text('-');
                     $('#incomeMultiForm td:eq(5)').text('-');
                     $('#incomeMultiForm td:eq(6)').text('-');
                     $('#incomeMultiForm td:eq(7)').text('-');
                }
                //终端销量
                //终端销量
                if(result.terminalSales!=null){
                $('#terminalSales td:eq(2)').text(result.terminalSales.fz);
                $('#terminalSales td:eq(4)').text((result.terminalSales.mbz/10000).toFixed(2));
                $('#terminalSales td:eq(5)').text("万台");
                $('#terminalSales td:eq(6)').text((result.terminalSales.bykhxl/10000).toFixed(4));
                $('#terminalSales td:eq(7)').text((result.terminalSales.qnljxl/10000).toFixed(4));
                $('#terminalSales td:eq(8)').text(result.terminalSales.sjwcd);
                }else{
                	$('#terminalSales td:eq(2)').text('0');
                    $('#terminalSales td:eq(4)').text('-');
                    $('#terminalSales td:eq(6)').text('-');
                    $('#terminalSales td:eq(7)').text('-');
                    $('#terminalSales td:eq(8)').text('-');
                }
                //重点产品销售达成率
                if(result.productSalesRate!=null){
                $('#productSalesRate td:eq(1)').text(result.productSalesRate.fz);
                $('#productSalesRate td:eq(3)').text(result.productSalesRate.mbz);
//                $('#productSalesRate td:eq(3)').text("万元");
//                $('#productSalesRate td:eq(4)').text(result.incomeMultiForm.bywcqk);
//                $('#productSalesRate td:eq(5)').text(result.incomeMultiForm.qnwcsr);
//                $('#productSalesRate td:eq(6)').text(result.incomeMultiForm.sjwcd);
                }else{
                	$('#productSalesRate td:eq(1)').text('0');
                    $('#productSalesRate td:eq(3)').text('-');
                }
              //社会渠道拓展
                //活跃客户目标值
                if(result.customerTargetValue!=null){
                $('#customerTargetValue td:eq(2)').text(result.customerTargetValue.df);
                $('#customerTargetValue td:eq(4)').text(result.customerTargetValue.mbz);
                $('#customerTargetValue td:eq(5)').text("个");
                $('#customerTargetValue td:eq(6)').text(result.customerTargetValue.hyyhsl);
//                $('#customerTargetValue td:eq(6)').text(result.customerTargetValue.qnwcsr);
                $('#customerTargetValue td:eq(8)').text(result.customerTargetValue.sjjd);
                }else{
                	$('#customerTargetValue td:eq(2)').text('0');
                    $('#customerTargetValue td:eq(4)').text('-');
                    $('#customerTargetValue td:eq(6)').text('-');
//                    $('#customerTargetValue td:eq(6)').text('-');
                    $('#customerTargetValue td:eq(8)').text('-');
                }
                //KA客户销量目标值
                if(result.customerSaleTargetVal!=null){
                $('#customerSaleTargetVal td:eq(1)').text(result.customerSaleTargetVal.df);
                $('#customerSaleTargetVal td:eq(3)').text((result.customerSaleTargetVal.kakhxlmbz/10000).toFixed(2));
                $('#customerSaleTargetVal td:eq(4)').text("万台");
                $('#customerSaleTargetVal td:eq(5)').text((result.customerSaleTargetVal.kakhxs/10000).toFixed(4));
                $('#customerSaleTargetVal td:eq(6)').text((result.customerSaleTargetVal.kakhxslj/10000).toFixed(4));
                $('#customerSaleTargetVal td:eq(7)').text(result.customerSaleTargetVal.sjjd);
                }else{
                	 $('#customerSaleTargetVal td:eq(1)').text('0');
                     $('#customerSaleTargetVal td:eq(3)').text('-');
                     $('#customerSaleTargetVal td:eq(5)').text('-');
                     $('#customerSaleTargetVal td:eq(6)').text('-');
                     $('#customerSaleTargetVal td:eq(7)').text('-');
                }
                //省移动公司协同
                //4G+销量份额
                if(result.salesShare4G!=null){
                $('#salesShare4G td:eq(2)').text(Number(result.salesShare4G.gydf).toFixed(2));
//                $('#salesShare4G td:eq(3)').text(result.salesShare4G.mbz);
//                $('#salesShare4G td:eq(4)').text("比值");
//                $('#salesShare4G td:eq(5)').text(result.salesShare4G.dyzb);
//                $('#salesShare4G td:eq(6)').text(result.salesShare4G.qnwcsr);
//                $('#salesShare4G td:eq(7)').text(result.salesShare4G.sjwcd);
                }else{
                	 $('#salesShare4G td:eq(2)').text('0');
//                   $('#salesShare4G td:eq(3)').text('-');
//                   $('#salesShare4G td:eq(5)').text('-');
//                   $('#salesShare4G td:eq(6)').text('-');
//                   $('#salesShare4G td:eq(7)').text('-');
                }
                //省移动终端销量份额
                if(result.terminalSaleShare!=null){
                $('#terminalSaleShare td:eq(1)').text(result.terminalSaleShare.df);
//                $('#terminalSaleShare td:eq(2)').text(result.terminalSaleShare.mbz);
                $('#terminalSaleShare td:eq(4)').text("万元");
                $('#terminalSaleShare td:eq(5)').text((result.terminalSaleShare.jhl/10000).toFixed(4));
//                $('#terminalSaleShare td:eq(5)').text(result.terminalSaleShare.qnwcsr);
//                $('#terminalSaleShare td:eq(6)').text(result.terminalSaleShare.sjwcd);
                }else{
                	   $('#terminalSaleShare td:eq(1)').text('0');
                       $('#terminalSaleShare td:eq(3)').text('前五名满分');
                       $('#terminalSaleShare td:eq(5)').text('-');
//                       $('#terminalSaleShare td:eq(5)').text('-');
//                       $('#terminalSaleShare td:eq(6)').text('-');
                }
                //省公司协同满意度
                if(result.salesShare4G!=null){
                $('#satisfaction td:eq(1)').text(result.salesShare4G.df);
//                $('#satisfaction td:eq(2)').text(result.satisfaction.mbz);
//                $('#satisfaction td:eq(3)').text("万元");
//                $('#satisfaction td:eq(4)').text(result.satisfaction.bywcqk);
//                $('#satisfaction td:eq(5)').text(result.satisfaction.qnwcsr);
//                $('#satisfaction td:eq(6)').text(result.satisfaction.sjwcd);
                }else{
                	$('#satisfaction td:eq(1)').text('0');
                    $('#satisfaction td:eq(3)').text('-');
                    $('#satisfaction td:eq(5)').text('-');
                    $('#satisfaction td:eq(6)').text('-');
                    $('#satisfaction td:eq(7)').text('-');
                }
                //流动资产周转率
                //存货周转率 
                if(result.stockTurnoverRatio!=null){
                $('#stockTurnoverRatio td:eq(2)').text(result.stockTurnoverRatio.df);
                $('#stockTurnoverRatio td:eq(4)').text(result.stockTurnoverRatio.mbz);
                $('#stockTurnoverRatio td:eq(5)').text("次");
                $('#stockTurnoverRatio td:eq(6)').text(result.stockTurnoverRatio.chzzl);
                $('#stockTurnoverRatio td:eq(7)').text(result.stockTurnoverRatio.ljchzzl);
//                $('#stockTurnoverRatio td:eq(7)').text(result.stockTurnoverRatio.sjwcd);
                }else{
                	$('#stockTurnoverRatio td:eq(2)').text('0');
                    $('#stockTurnoverRatio td:eq(4)').text('-');
                    $('#stockTurnoverRatio td:eq(5)').text('-');
                    $('#stockTurnoverRatio td:eq(6)').text('-');
                }
                //三个月以上存货原值占比
                if(result.threeMonthStockRatio!=null){
                $('#threeMonthStockRatio td:eq(1)').text(result.threeMonthStockRatio.df);
//                $('#threeMonthStockRatio td:eq(2)').text("90-180天小于2%&nbsp;180-360天&lt;0.5%&nbsp;360天以上小于0.");
                $('#threeMonthStockRatio td:eq(4)').text("比值");
                $('#threeMonthStockRatio td:eq(5)').text("90-180天="+result.threeMonthStockRatio.tsl90+"  180-360天="+result.threeMonthStockRatio.tsl180+"   360天以上="+result.threeMonthStockRatio.tsl360);
//                $('#threeMonthStockRatio td:eq(5)').text(result.threeMonthStockRatio.qnwcsr);
//                $('#threeMonthStockRatio td:eq(6)').text(result.threeMonthStockRatio.sjwcd);
                }else{
                	 $('#threeMonthStockRatio td:eq(1)').text('0');
//                   $('#threeMonthStockRatio td:eq(2)').text("90-180天小于2%&nbsp;180-360天&lt;0.5%&nbsp;360天以上小于0.");
                   $('#threeMonthStockRatio td:eq(5)').text('-');
                }
                //回款预测准确度
                if(result.repaymentAccuracyForecast!=null){
                $('#repaymentAccuracyForecast td:eq(1)').text(result.repaymentAccuracyForecast.hkyczqddf);
//                $('#repaymentAccuracyForecast td:eq(2)').text(result.repaymentAccuracyForecast.mbz);
                $('#repaymentAccuracyForecast td:eq(4)').text("比值");
                $('#repaymentAccuracyForecast td:eq(5)').text(result.repaymentAccuracyForecast.hkyczqd);
//                $('#repaymentAccuracyForecast td:eq(5)').text(result.repaymentAccuracyForecast.qnwcsr);
//                $('#repaymentAccuracyForecast td:eq(6)').text(result.repaymentAccuracyForecast.sjwcd);
                }else{
                	 $('#repaymentAccuracyForecast td:eq(1)').text('0');
//                   $('#repaymentAccuracyForecast td:eq(2)').text(result.repaymentAccuracyForecast.mbz);
                   $('#repaymentAccuracyForecast td:eq(5)').text('-');
                }
                //应收周转率
                if(result.accountReceivableTurnoverRatio!=null){
                $('#accountReceivableTurnoverRatio td:eq(1)').text(result.accountReceivableTurnoverRatio.df);
                $('#accountReceivableTurnoverRatio td:eq(3)').text(result.accountReceivableTurnoverRatio.mbz);
                $('#accountReceivableTurnoverRatio td:eq(4)').text("次");
                $('#accountReceivableTurnoverRatio td:eq(5)').text(result.accountReceivableTurnoverRatio.byyskzzl);
                $('#accountReceivableTurnoverRatio td:eq(6)').text(result.accountReceivableTurnoverRatio.ndyskzzl);
                $('#accountReceivableTurnoverRatio td:eq(7)').text('-');
                }else{
                         $('#accountReceivableTurnoverRatio td:eq(1)').text('0');
                         $('#accountReceivableTurnoverRatio td:eq(3)').text('-');
                         $('#accountReceivableTurnoverRatio td:eq(5)').text('-');
                         $('#accountReceivableTurnoverRatio td:eq(6)').text('-');
                         $('#accountReceivableTurnoverRatio td:eq(7)').text('-');	
                }
                //三个月以上应收账款占比
                if(result.accountsReceivableRatio!=null){
                //$('#accountsReceivableRatio td:eq(1)').text(result.accountsReceivableRatio.yszkdf90+result.accountsReceivableRatio.yszkdf180);
                	$('#accountsReceivableRatio td:eq(1)').text(Number(result.accountsReceivableRatio.yszkdf90)+Number(result.accountsReceivableRatio.yszkdf180));
//                $('#accountsReceivableRatio td:eq(2)').text("90-180天=<5%；180天以上=<2%；");
                $('#accountsReceivableRatio td:eq(4)').text("比值");
                $('#accountsReceivableRatio td:eq(5)').text("90-180天="+result.accountsReceivableRatio.yszkzb90+"   180天以上="+result.accountsReceivableRatio.yszkzb180);
//                $('#accountsReceivableRatio td:eq(5)').text(result.accountsReceivableRatio.qnwcsr);
//                $('#accountsReceivableRatio td:eq(6)').text(result.accountsReceivableRatio.sjwcd);
                }else{
                	$('#accountsReceivableRatio td:eq(1)').text('0');
//                    $('#accountsReceivableRatio td:eq(2)').text('90-180天=<5%；180天以上=<2%；');
                    $('#accountsReceivableRatio td:eq(5)').text('-');
//                    $('#accountsReceivableRatio td:eq(5)').text(result.accountsReceivableRatio.qnwcsr);
                }
              //利润总额
                //总支出占综合毛利比
                if(result.grossProfitRatio!=null){
                $('#grossProfitRatio td:eq(2)').text(result.grossProfitRatio.zhmlbkhfs);
//                $('#grossProfitRatio td:eq(3)').text(result.grossProfitRatio.mbz);
                $('#grossProfitRatio td:eq(5)').text("比值");
                $('#grossProfitRatio td:eq(6)').text(result.grossProfitRatio.zzczzhmlb);
//                $('#grossProfitRatio td:eq(6)').text(result.grossProfitRatio.ljchzzl);
//                $('#grossProfitRatio td:eq(7)').text(result.grossProfitRatio.sjwcd);
                }else{
                	$('#grossProfitRatio td:eq(2)').text('0');
//                  $('#grossProfitRatio td:eq(3)').text(result.grossProfitRatio.mbz);
                  $('#grossProfitRatio td:eq(6)').text('-');
                }
                //费用进度均衡性
                if(result.equilibrium!=null){
//                $('#equilibrium td:eq(1)').text();
                $('#equilibrium td:eq(3)').text(result.feeProgressBalanceFZ);
                $('#equilibrium td:eq(4)').text("比值");
//                $('#equilibrium td:eq(4)').text();
//                $('#equilibrium td:eq(5)').text();
//                $('#equilibrium td:eq(6)').text();
                }else{
                	  $('#equilibrium td:eq(1)').text(result.feeProgressBalanceFZ);
                }
                var diff=result.diff;
                if(diff < 0){
                    $('.down').css({display: 'inline'});
                    $('.up').css({display: 'none'});
                    diff = -diff;
                }else{
                    $('.down').css({display: 'none'});
                    $('.up').css({display: 'inline'});
                }
                
                $('#zdf').text(Number(result.zdf).toFixed(2));
                $('#increaseScore').text(diff);
            }
        });
    }



function initEchart(businessIncomeFz,terminalSalesFz,shqdtzFz,sgsxtFz,grossProfitRatioFz,ldzczzl){
    var stockUserPaint = initEcharts(echarts,'chart');//存量用户数
    var option = {
        color:'#00cbff',
        tooltip : {
            show:true,
            trigger: 'item'
        },
        legend: {
            x : 'center',
            textStyle:{
                color:'#fff',
                fontSize:18
            }
        },
        calculable : true,
        polar : [
            {
            	radius:'40%',//雷达图半径
                axisLine:{show:false},
                splitArea:{show:false},
                indicator : [
                    {text : '流动资产周转率',max:15},
                    {text : '终端销量',max:10},
                    {text : '省移动协同',max:15},
                    {text : '社会渠道拓展',max:8},
                    // {text : '资产周转率',max:100},
                    {text : '利润总额',max:17},
                    {text : '运营收入',max:35}
                ],
                name: {
                    show: true,
                    formatter:'【{value}】',
                    color:'#fff254',
                    fontSize:15
                }
                // radius : 100
            }
        ],
        series : [
            {
                name: '',
                type: 'radar',
                itemStyle: {
                    normal: {
                        itemStyle : {
                            normal : {
                                color:'#ffffff',
                                lineStyle:{
                                    color:'#00d7ff'
                                }
                            }
                        },
                        areaStyle: {
                            type: 'default',
                            color:'rgba(0, 255, 255, 0.2)'
                        }
                    }
                },
                data : [
                    // {
                    //     value : [97, 42, 88, 94, 90, 86],
                    //     name : '舍普琴科'
                    // },
                    {
                        // value : [97, 42, 88, 94, 90, 86],
                        value : [Number(ldzczzl).toFixed(2),terminalSalesFz,Number(sgsxtFz).toFixed(2),Number(shqdtzFz).toFixed(2),grossProfitRatioFz,businessIncomeFz],
                        label: {
                            normal: {
                                textStyle: {
                                    color:'#ffffff',
                                    fontSize:18
                                },
                                show: true,
                                formatter:function(params) {
                                    return params.value;
                                }
                            }
                        }
                        // name : '罗纳尔多'
                    }
                ]
            }
        ]
    };

    //年份
    var year=$('#month').val().substring(0,4);
    $('#menu_year').val(year);
    
    stockUserPaint.setOption(option);
    
    var monthOne ;
    var monthTwo ;
    var monthThree ;
    var monthFour ;
    var monthFive ;
    var monthSix ;
    var monthSeven ;
    
    //8字
    var amountMap ;
    var incomeMap ;
    var profitMap ;
    var shareMap ;
    var purchasesMap ;
    var activationMap ;
    var stockMap ;
    var repayMap ;
//    
    //请求获取8字的图形的数据
    $.ajax({
        type: 'post',
        url: basePath+'/entry/getValue.do',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({'month':$('#month').val()}),
        async: false,
        dataType: 'json',
        success: function(resultAllMap,textStatus){
            console.log(resultAllMap);
            //七个月份
             monthOne = resultAllMap.monthMap.month1;
             monthTwo = resultAllMap.monthMap.month2;
             monthThree = resultAllMap.monthMap.month3;
             monthFour = resultAllMap.monthMap.month4;
             monthFive = resultAllMap.monthMap.month5;
             monthSix = resultAllMap.monthMap.month6;
             monthSeven = resultAllMap.monthMap.month7;
           //8字  	"amountMap","incomeMap","profitMap","shareMap","purchasesMap","activationMap","stockMap","repayMap"
            amountMap = resultAllMap.amountMap;
            incomeMap = resultAllMap.incomeMap;
            profitMap = resultAllMap.profitMap;
            shareMap = resultAllMap.shareMap;
            purchasesMap = resultAllMap.purchasesMap;
            activationMap = resultAllMap.activationMap;
            stockMap = resultAllMap.stockMap;
            repayMap = resultAllMap.repayMap;

        }
    });
    
    var stockUserPaint1 = initEcharts(echarts,'chart1');//存量用户数
    var option1 = {
        tooltip : {
            trigger: 'axis'
        },
        grid:{
        	x:30
        },
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                axisLabel:{
//	                interval:0,//取消间隔隐藏
//	                rotate:20,//倾斜度 -90 至 90 默认为0
	                textStyle:{
	                	fontSize:15,
	                }
	            },
                data : [monthOne,monthTwo,monthThree,monthFour,monthFive,monthSix,monthSeven],
                axisLine: {
                    lineStyle: {
                        type: 'solid',
                        color: '#fff',//左边线的颜色
                        width:'1'//坐标线的宽度
                    }
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                splitLine:{show: false},//去除网格线
                axisLabel:{
	                rotate:-65,//倾斜度 -90 至 90 默认为0
	                textStyle:{
	                	fontSize:15
	                },
	                formatter: function(value,index){//纵坐标单位转换
	                    if((value/100000000)>=1){
	                    return (value/100000000).toFixed(0)+" 亿";
	                    }else if((value/10000)>=1){
	                    return (value/10000).toFixed(0)+" 万";
	                    }else{
	                    return value;
	                    }
	                   }
	            },
                axisLine: {
                    lineStyle: {
                        type: 'solid',
                        color: '#fff',//左边线的颜色
                        width:'1'//坐标线的宽度
                    }
                }
            }
        ],
        series : [
            {
                name:'我司销量',
                type:'line',
                smooth:true,
                stack: '总量',
                data:[amountMap.value1, amountMap.value2, amountMap.value3, amountMap.value4, amountMap.value5, amountMap.value6, amountMap.value7],
                itemStyle : {
                    normal : {
                        color:'#ffffff',
                        lineStyle:{
                            color:'#00d7ff'
                        },
                        areaStyle: {
                            type: 'default',
                            color:new echarts.graphic.LinearGradient(
                                0, 0, 0, 1,
                                [
                                    {offset: 0, color: '#00e6ff'},
                                    {offset: 0.5, color: '#0a91ff'},
                                    {offset: 1, color: '#004b7e'}
                                ]
                            )
                        }
                    }
                }
            }
        ]
    };
    stockUserPaint1.setOption(option1);

    var stockUserPaint2 = initEcharts(echarts,'chart2');//存量用户数
    var option2 = {
        tooltip : {
            trigger: 'axis'
        },
        grid:{
        	x:30
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                axisLabel:{
//	                interval:0,//取消间隔隐藏
//	                rotate:20,//倾斜度 -90 至 90 默认为0
	                textStyle:{
	                	fontSize:15,
	                }
	            },
                data : [monthOne,monthTwo,monthThree,monthFour,monthFive,monthSix,monthSeven],
                axisLine: {
                    lineStyle: {
                        type: 'solid',
                        color: '#fff',//左边线的颜色
                        width:'1'//坐标线的宽度
                    }
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                splitLine:{show: false},//去除网格线
                axisLabel:{
	                rotate:-65,//倾斜度 -90 至 90 默认为0
	                textStyle:{
	                	fontSize:15
	                },
	                formatter: function(value,index){//纵坐标单位转换
	                    if((value/100000000)>=1){
	                    return (value/100000000).toFixed(0)+" 亿";
	                    }else if((value/10000)>=1){
	                    return (value/10000).toFixed(0)+" 万";
	                    }else{
	                    return value;
	                    }
	                   }
	            },
                axisLine: {
                    lineStyle: {
                        type: 'solid',
                        color: '#fff',//左边线的颜色
                        width:'1'//坐标线的宽度
                    }
                }
            }
        ],
        series : [
            {
                name:'我司收入',
                type:'line',
                stack: '总量',
                smooth:true,
                data:[incomeMap.value1, incomeMap.value2, incomeMap.value3, incomeMap.value4, incomeMap.value5, incomeMap.value6, incomeMap.value7],
                itemStyle : {
                    normal : {
                        color:'#ffffff',
                        lineStyle:{
                            color:'#00d7ff'
                        },
                        areaStyle: {
                            type: 'default',
                            color:new echarts.graphic.LinearGradient(
                                0, 0, 0, 1,
                                [
                                    {offset: 0, color: '#00e6ff'},
                                    {offset: 0.5, color: '#0a91ff'},
                                    {offset: 1, color: '#004b7e'}
                                ]
                            )
                        }
                    }
                }
            }
        ]
    };
    stockUserPaint2.setOption(option2);

    var stockUserPaint3 = initEcharts(echarts,'chart3');//存量用户数
    var option3 = {
    	title : {
            text: '(单位:万元)',
        },
        tooltip : {
            trigger: 'axis'
        },
        grid:{
        	x:30
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                axisLabel:{
//	                interval:0,//取消间隔隐藏
//	                rotate:20,//倾斜度 -90 至 90 默认为0
	                textStyle:{
	                	fontSize:15,
	                }
	            },
                data : [monthOne,monthTwo,monthThree,monthFour,monthFive,monthSix,monthSeven],
                axisLine: {
                    lineStyle: {
                        type: 'solid',
                        color: '#fff',//左边线的颜色
                        width:'1'//坐标线的宽度
                    }
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                splitLine:{show: false},//去除网格线
                axisLabel:{
	                rotate:-65,//倾斜度 -90 至 90 默认为0
	                textStyle:{
	                	fontSize:15
	                },
	                formatter: function(value,index){//纵坐标单位转换
	                    if((value/100000000)>=1){
	                    return (value/100000000).toFixed(0)+" 亿";
	                    }else if((value/10000)>=1){
	                    return (value/10000).toFixed(0)+" 万";
	                    }else{
	                    return value;
	                    }
	                   }
	            },
                axisLine: {
                    lineStyle: {
                        type: 'solid',
                        color: '#fff',//左边线的颜色
                        width:'1'//坐标线的宽度
                    }
                }
            }
        ],
        series : [
            {
                name:'毛利额',
                type:'line',
                smooth:true,
                stack: '总量',
                data:[profitMap.value1, profitMap.value2, profitMap.value3, profitMap.value4, profitMap.value5, profitMap.value6, profitMap.value7],
                itemStyle : {
                    normal : {
                        color:'#ffffff',
                        lineStyle:{
                            color:'#00d7ff'
                        },
                        areaStyle: {
                            type: 'default',
                            color:new echarts.graphic.LinearGradient(
                                0, 0, 0, 1,
                                [
                                    {offset: 0, color: '#00e6ff'},
                                    {offset: 0.5, color: '#0a91ff'},
                                    {offset: 1, color: '#004b7e'}
                                ]
                            )
                        }
                    }
                }
            }
        ]
    };
    stockUserPaint3.setOption(option3);

    var stockUserPaint4 = initEcharts(echarts,'chart4');//存量用户数
    var option4 = {
    	title : {
    	    text: '(单位:%)',
    	},
        tooltip : {
            trigger: 'axis'
        },
        grid:{
        	x:30
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                axisLabel:{
//	                interval:0,//取消间隔隐藏
//	                rotate:20,//倾斜度 -90 至 90 默认为0
	                textStyle:{
	                	fontSize:15,
	                }
	            },
                data : [monthOne,monthTwo,monthThree,monthFour,monthFive,monthSix,monthSeven],
                axisLine: {
                    lineStyle: {
                        type: 'solid',
                        color: '#fff',//左边线的颜色
                        width:'1'//坐标线的宽度
                    }
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                splitLine:{show: false},//去除网格线
                axisLabel:{
	                rotate:-65,//倾斜度 -90 至 90 默认为0
	                textStyle:{
	                	fontSize:15
	                },
	                formatter: function(value,index){//纵坐标单位转换
	                    if((value/100000000)>=1){
	                    return (value/100000000).toFixed(0)+" 亿";
	                    }else if((value/10000)>=1){
	                    return (value/10000).toFixed(0)+" 万";
	                    }else{
	                    return value+'%';
	                    }
	                   }
	            },
                axisLine: {
                    lineStyle: {
                        type: 'solid',
                        color: '#fff',//左边线的颜色
                        width:'1'//坐标线的宽度
                    }
                }
            }
        ],
        series : [
            {
                name:'平台份额',
                type:'line',
                smooth:true,
                stack: '总量',
                data:[shareMap.value1, shareMap.value2, shareMap.value3, shareMap.value4, shareMap.value5, shareMap.value6, shareMap.value7],
                itemStyle : {
                    normal : {
                        color:'#ffffff',
                        lineStyle:{
                            color:'#00d7ff'
                        },
                        areaStyle: {
                            type: 'default',
                            color:new echarts.graphic.LinearGradient(
                                0, 0, 0, 1,
                                [
                                    {offset: 0, color: '#00e6ff'},
                                    {offset: 0.5, color: '#0a91ff'},
                                    {offset: 1, color: '#004b7e'}
                                ]
                            )
                        }
                    }
                }
            }
        ]
    };
    stockUserPaint4.setOption(option4);

    var stockUserPaint5 = initEcharts(echarts,'chart5');//存量用户数
    var option5 = {
        tooltip : {
            trigger: 'axis'
        },
        grid:{
        	x:30
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                axisLabel:{
//	                interval:0,//取消间隔隐藏
//	                rotate:20,//倾斜度 -90 至 90 默认为0
	                textStyle:{
	                	fontSize:15,
	                }
	            },
                data : [monthOne,monthTwo,monthThree,monthFour,monthFive,monthSix,monthSeven],
                axisLine: {
                    lineStyle: {
                        type: 'solid',
                        color: '#fff',//左边线的颜色
                        width:'1'//坐标线的宽度
                    }
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                splitLine:{show: false},//去除网格线
                axisLabel:{
	                rotate:-65,//倾斜度 -90 至 90 默认为0
	                textStyle:{
	                	fontSize:15
	                },
	                formatter: function(value,index){//纵坐标单位转换
	                    if((value/100000000)>=1){
	                    return (value/100000000).toFixed(0)+" 亿";
	                    }else if((value/10000)>=1){
	                    return (value/10000).toFixed(0)+" 万";
	                    }else{
	                    return value;
	                    }
	                   }
	            },
                axisLine: {
                    lineStyle: {
                        type: 'solid',
                        color: '#fff',//左边线的颜色
                        width:'1'//坐标线的宽度
                    }
                }
            }
        ],
        series : [
            {
                name:'进货量',
                type:'line',
                smooth:true,
                stack: '总量',
                data:[purchasesMap.value1, purchasesMap.value2, purchasesMap.value3, purchasesMap.value4, purchasesMap.value5, purchasesMap.value6, purchasesMap.value7],
                itemStyle : {
                    normal : {
                        color:'#ffffff',
                        lineStyle:{
                            color:'#00d7ff'
                        },
                        areaStyle: {
                            type: 'default',
                            color:new echarts.graphic.LinearGradient(
                                0, 0, 0, 1,
                                [
                                    {offset: 0, color: '#00e6ff'},
                                    {offset: 0.5, color: '#0a91ff'},
                                    {offset: 1, color: '#004b7e'}
                                ]
                            )
                        }
                    }
                }
            }
        ]
    };
    stockUserPaint5.setOption(option5);

    var stockUserPaint6 = initEcharts(echarts,'chart6');//存量用户数
    var option6 = {
        tooltip : {
            trigger: 'axis'
        },
        grid:{
        	x:30
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                axisLabel:{
//	                interval:0,//取消间隔隐藏
//	                rotate:20,//倾斜度 -90 至 90 默认为0
	                textStyle:{
	                	fontSize:15,
	                }
	            },
                data : [monthOne,monthTwo,monthThree,monthFour,monthFive,monthSix,monthSeven],
                axisLine: {
                    lineStyle: {
                        type: 'solid',
                        color: '#fff',//左边线的颜色
                        width:'1'//坐标线的宽度
                    }
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                splitLine:{show: false},//去除网格线
                axisLabel:{
	                rotate:-65,//倾斜度 -90 至 90 默认为0
	                textStyle:{
	                	fontSize:15
	                },
	                formatter: function(value,index){//纵坐标单位转换
	                    if((value/100000000)>=1){
	                    return (value/100000000).toFixed(0)+" 亿";
	                    }else if((value/10000)>=1){
	                    return (value/10000).toFixed(0)+" 万";
	                    }else{
	                    return value;
	                    }
	                   }
	            },
                axisLine: {
                    lineStyle: {
                        type: 'solid',
                        color: '#fff',//左边线的颜色
                        width:'1'//坐标线的宽度
                    }
                }
            }
        ],
        series : [
            {
                name:'激活量',
                type:'line',
                smooth:true,
                stack: '总量',
                data:[activationMap.value1, activationMap.value2, activationMap.value3, activationMap.value4, activationMap.value5, activationMap.value6, activationMap.value7],
                itemStyle : {
                    normal : {
                        color:'#ffffff',
                        lineStyle:{
                            color:'#00d7ff'
                        },
                        areaStyle: {
                            type: 'default',
                            color:new echarts.graphic.LinearGradient(
                                0, 0, 0, 1,
                                [
                                    {offset: 0, color: '#00e6ff'},
                                    {offset: 0.5, color: '#0a91ff'},
                                    {offset: 1, color: '#004b7e'}
                                ]
                            )
                        }
                    }
                }
            }
        ]
    };
    stockUserPaint6.setOption(option6);

    var stockUserPaint7 = initEcharts(echarts,'chart7');//存量用户数
    var option7 = {
        tooltip : {
            trigger: 'axis'
        },
        grid:{
        	x:30
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                axisLabel:{
//	                interval:0,//取消间隔隐藏
//	                rotate:20,//倾斜度 -90 至 90 默认为0
	                textStyle:{
	                	fontSize:15,
	                }
	            },
                data : [monthOne,monthTwo,monthThree,monthFour,monthFive,monthSix,monthSeven],
                axisLine: {
                    lineStyle: {
                        type: 'solid',
                        color: '#fff',//左边线的颜色
                        width:'1'//坐标线的宽度
                    }
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                splitLine:{show: false},//去除网格线
                axisLabel:{
	                rotate:-65,//倾斜度 -90 至 90 默认为0
	                textStyle:{
	                	fontSize:15
	                },
	                formatter: function(value,index){//纵坐标单位转换
	                    if((value/100000000)>=1){
	                    return (value/100000000).toFixed(0)+" 亿";
	                    }else if((value/10000)>=1){
	                    return (value/10000).toFixed(0)+" 万";
	                    }else{
	                    return value;
	                    }
	                   }
	            },
                axisLine: {
                    lineStyle: {
                        type: 'solid',
                        color: '#fff',//左边线的颜色
                        width:'1'//坐标线的宽度
                    }
                }
            }
        ],
        series : [
            {
                name:'库存量',
                type:'line',
                smooth:true,
                stack: '总量',
                data:[stockMap.value1, stockMap.value2, stockMap.value3, stockMap.value4, stockMap.value5, stockMap.value6, stockMap.value7],
                itemStyle : {
                    normal : {
                        color:'#ffffff',
                        lineStyle:{
                            color:'#00d7ff'
                        },
                        areaStyle: {
                            type: 'default',
                            color:new echarts.graphic.LinearGradient(
                                0, 0, 0, 1,
                                [
                                    {offset: 0, color: '#00e6ff'},
                                    {offset: 0.5, color: '#0a91ff'},
                                    {offset: 1, color: '#073fff'}
                                ]
                            )
                        }
                    }
                }
            }
        ]
    };
    stockUserPaint7.setOption(option7);

    $("#aRTRatio").text(repayMap.value1);
    $("#aRRatio").text(repayMap.value2);
}
