package com.asiainfo.cmc.controller.entry;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asiainfo.cmc.aopLog.SystemControllerLog;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.AccountReceivableTurnoverRatio;
import com.asiainfo.cmc.enties.AccountsReceivableRatio;
import com.asiainfo.cmc.enties.AverageProfit;
import com.asiainfo.cmc.enties.BrandProductSalesIncome;
import com.asiainfo.cmc.enties.BusinessIncome;
import com.asiainfo.cmc.enties.CustomerSaleTargetVal;
import com.asiainfo.cmc.enties.CustomerTargetVal;
import com.asiainfo.cmc.enties.FeeProgressBalance;
import com.asiainfo.cmc.enties.GrossProfitRatio;
import com.asiainfo.cmc.enties.IncomeMultiForm;
import com.asiainfo.cmc.enties.IncomePhoneBrand;
import com.asiainfo.cmc.enties.NewRetailOperation;
import com.asiainfo.cmc.enties.ProductSalesRate;
import com.asiainfo.cmc.enties.RepaymentAccuracyForecast;
import com.asiainfo.cmc.enties.SalesShare4G;
import com.asiainfo.cmc.enties.StockTurnoverRatio;
import com.asiainfo.cmc.enties.TerminalSaleShare;
import com.asiainfo.cmc.enties.TerminalSales;
import com.asiainfo.cmc.enties.ThreeMonthStockRatio;
import com.asiainfo.cmc.enties.gfKpi.overview.Overview;
import com.asiainfo.cmc.service.BusinessIncomeService;
import com.asiainfo.cmc.service.IncomeMultiFormService;
import com.asiainfo.cmc.service.IncomePhoneBrandService;
import com.asiainfo.cmc.service.PrivateBrandSalesIncomeService;
import com.asiainfo.cmc.service.brandmodel.ZdResult8BrandDService;
import com.asiainfo.cmc.service.gfKpi.overview.IOverviewService;
import com.asiainfo.cmc.service.impl.AccountReceivableRatioService;
import com.asiainfo.cmc.service.impl.AccountsReceivableRatioService;
import com.asiainfo.cmc.service.impl.AverageProfitService;
import com.asiainfo.cmc.service.impl.CustomerSaleTargetValService;
import com.asiainfo.cmc.service.impl.CustomerTargetValService;
import com.asiainfo.cmc.service.impl.FeeProgressBalanceService;
import com.asiainfo.cmc.service.impl.GrossProfitRatioService;
import com.asiainfo.cmc.service.impl.NewRetailOperationService;
import com.asiainfo.cmc.service.impl.ProductSalesRateService;
import com.asiainfo.cmc.service.impl.RepaymentAccuracyForecastService;
import com.asiainfo.cmc.service.impl.SalesShare4GService;
import com.asiainfo.cmc.service.impl.StockTurnoverService;
import com.asiainfo.cmc.service.impl.TerminalSaleShareService;
import com.asiainfo.cmc.service.impl.TerminalSalesService;
import com.asiainfo.cmc.service.impl.ThreeMonthStockRatioService;

@Controller
@RequestMapping(value = "/entry")
public class entryController {
	private static final Logger logger = LoggerFactory.getLogger(entryController.class);
	@Resource
	private BusinessIncomeService businessIncomeService;
	@Resource
	private IncomePhoneBrandService incomePhoneBrandService;
	@Resource
	private IncomeMultiFormService incomeMultiFormService;
	@Resource
	private PrivateBrandSalesIncomeService privateBrandSalesIncomeService;
	@Resource
	private NewRetailOperationService newRetailOperationService;
	@Resource
	private AverageProfitService averageProfitService;
	@Resource
	private TerminalSalesService terminalSalesService;
	@Resource
	private CustomerTargetValService customerTargetValService;
	@Resource
	private CustomerSaleTargetValService customerSaleTargetValService;
	@Resource
	private TerminalSaleShareService terminalSaleShareService;
	@Resource
	private SalesShare4GService salesShare4GService;
	@Resource
	private GrossProfitRatioService grossProfitRatioService;
	@Resource
	private ProductSalesRateService productSalesRateService;
	@Resource
	private StockTurnoverService stockTurnoverService;
	@Resource
	private ZdResult8BrandDService zdResult8BrandDService;
	@Resource
	private ThreeMonthStockRatioService threeMonthStockRatioService;
	@Resource
	private RepaymentAccuracyForecastService repaymentAccuracyForecastService;
	@Resource
	private AccountReceivableRatioService accountReceivableTurnoverRatioService;
	@Resource
	private AccountsReceivableRatioService accountsReceivableRatioService;

	@Resource
	private FeeProgressBalanceService feeProgressBalanceService;
	
	@Resource
	private IOverviewService overviewService;
    
	@RequiresPermissions("monitorHome:list")
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(HttpServletRequest request, Locale locale, Model model, String special) {
		logger.info("customerChannel  {}.", locale);
		request.getSession().setAttribute("special",special);
		model.addAttribute("special", special );
		return "layout/entry";
	}

   // @RequiresPermissions("monitorHome:list")
	@SystemControllerLog(description = "访问19年经分监控总览界面",module="经分监控",business="经分监控",type="INDEX")  
   	@DS("dataSource")@RequestMapping(value = "/newIndex", method = RequestMethod.GET)
   	public String newIndex(HttpServletRequest request, Locale locale, Model model, String special) {
   		logger.info("customerChannel  {}.", locale);
   		request.getSession().setAttribute("special",special);
   		model.addAttribute("special", special );
   		String billcyc ="201901"; request.getParameter("billcyc");
   		Map<String,List<Overview>> result =  overviewService.queryData(billcyc);
		model.addAttribute("result", result);
   		return "layout/newEntry";
   	}
    
	@DS("dataSource")@RequestMapping(value = "/getScore",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getScore(@RequestBody Map<String,Object> map) {
		try {

			String month = (String) map.get("month");
			String lastMonth = getLastMonth(month);
			String year=month.substring(0, 4);
			//运营收入
			BusinessIncome businessIncome = businessIncomeService.selectBusinessIncome(month);
			BusinessIncome businessIncome2 = businessIncomeService.selectBusinessIncome(lastMonth);
			//自有品牌手机收入 
			IncomePhoneBrand incomePhoneBrand = incomePhoneBrandService.selectBrandIncome(month);
			IncomePhoneBrand incomePhoneBrand2 = incomePhoneBrandService.selectBrandIncome(lastMonth);
			//自有品牌多形态终端收入
			IncomeMultiForm incomeMultiForm = incomeMultiFormService.selectMultiForm(month);
			IncomeMultiForm incomeMultiForm2 = incomeMultiFormService.selectMultiForm(lastMonth);
			//终端销量
			TerminalSales terminalSales = terminalSalesService.selectTerminalSales(month);
			TerminalSales terminalSales2 = terminalSalesService.selectTerminalSales(lastMonth);
			//重点产品
			ProductSalesRate  productSalesRate= productSalesRateService.selectProductSalesRate(month);
			ProductSalesRate  productSalesRate2= productSalesRateService.selectProductSalesRate(lastMonth);
			// 活跃客户目标值  		customerTargetValList			CUSTOMER_TARGET_VALUE
			CustomerTargetVal customerTargetValue = customerTargetValService.selectCustomerTargetValue(month);
			CustomerTargetVal customerTargetValue2 = customerTargetValService.selectCustomerTargetValue(lastMonth);
			// KA客户销量目标值		customerSaleTargetValList		CUSTOMER_SALE_TARGET_VALUE
			CustomerSaleTargetVal customerSaleTargetVal = customerSaleTargetValService.selectCustomerSaleVal(month);
			CustomerSaleTargetVal customerSaleTargetVal2 = customerSaleTargetValService.selectCustomerSaleVal(lastMonth);
			//  4G+销量份额		salesShare4GServiceList
			SalesShare4G salesShare4G = salesShare4GService.selectSalesShare(month);
			SalesShare4G salesShare4G2 = salesShare4GService.selectSalesShare(lastMonth);
			//  省移动终端销量份额		terminalSaleShareList
			TerminalSaleShare terminalSaleShare = terminalSaleShareService.selectTerminalSaleShare(month);
			TerminalSaleShare terminalSaleShare2 = terminalSaleShareService.selectTerminalSaleShare(lastMonth);
			// 省公司协同满意度
			
			//存货周转率 stockTurnoverRatio
			StockTurnoverRatio stockTurnoverRatio = stockTurnoverService.selectstockTurnover(month);
			StockTurnoverRatio stockTurnoverRatio2 = stockTurnoverService.selectstockTurnover(lastMonth);
			//三个月以上存货原值占比 threeMonthStockRatio
			ThreeMonthStockRatio threeMonthStockRatio = threeMonthStockRatioService.selectThreeMonthStockRatio(month);
			ThreeMonthStockRatio threeMonthStockRatio2 = threeMonthStockRatioService.selectThreeMonthStockRatio(lastMonth);
			//回款预测准确度  repaymentAccuracyForecast
			RepaymentAccuracyForecast repaymentAccuracyForecast = repaymentAccuracyForecastService.selectRepaymentAccuracyForecast(month);
			RepaymentAccuracyForecast repaymentAccuracyForecast2 = repaymentAccuracyForecastService.selectRepaymentAccuracyForecast(lastMonth);
			//应收周转率 accountReceivableTurnoverRatio 应收账款周转率			ACCOUNT_RECEIVABLE_TURNOVER_RATIO
			AccountReceivableTurnoverRatio accountReceivableTurnoverRatio = accountReceivableTurnoverRatioService.selectAccountReceivableTurnoverRatio(month);
			AccountReceivableTurnoverRatio accountReceivableTurnoverRatio2 = accountReceivableTurnoverRatioService.selectAccountReceivableTurnoverRatio(lastMonth);
			//三个月以上应收账款占比                     					ACCOUNTS_RECEIVABLE_RATIO
			AccountsReceivableRatio accountsReceivableRatio = accountsReceivableRatioService.selectAccountsReceivableRatio(month);
			AccountsReceivableRatio accountsReceivableRatio2 = accountsReceivableRatioService.selectAccountsReceivableRatio(lastMonth);
			//总支出占综合毛利比  	grossProfitRatio		 GROSS_PROFIT_RATIO
			GrossProfitRatio grossProfitRatio = grossProfitRatioService.selectGrossRatio(month);
			GrossProfitRatio grossProfitRatio2 = grossProfitRatioService.selectGrossRatio(lastMonth);
			//费用进度均衡性
			FeeProgressBalance feeProgressBalance = feeProgressBalanceService.selectFeeProgressBalance(month);
			FeeProgressBalance feeProgressBalance2 = feeProgressBalanceService.selectFeeProgressBalance(lastMonth);
			
			
			//加分项
			BrandProductSalesIncome privateBrandSalesIncome = privateBrandSalesIncomeService.selectBrandSalesIncome(month);
			BrandProductSalesIncome privateBrandSalesIncome2 = privateBrandSalesIncomeService.selectBrandSalesIncome(lastMonth);

			NewRetailOperation newRetailOperation = newRetailOperationService.selectNewRetail(month);
			NewRetailOperation newRetailOperation2 = newRetailOperationService.selectNewRetail(lastMonth);

			AverageProfit averageProfit = averageProfitService.selectAverageProfit(month);
			AverageProfit averageProfit2 = averageProfitService.selectAverageProfit(lastMonth);
			
			String businessIncomeFZ ="0";
			String incomePhoneBrandFZ ="0";
			String incomeMultiFormFZ ="0";
			String customerTargetValueDF ="0";
			String customerSaleTargetValDF ="0";
			String terminalSaleShareDF ="0";
			String salesShare4GDF ="0";
			String salesShare4GGYDF ="0";
			String terminalSalesFZ ="0";
			String grossProfitRatioFZ ="0";
			String feeProgressBalanceFZ ="0";
			String privateBrandSalesIncomeFZ ="0";
			String newRetailOperationDF ="0";
			String averageProfitDF ="0";
			
			String businessIncomeFZ2 ="0";
			String incomePhoneBrandFZ2 ="0";
			String incomeMultiFormFZ2 ="0";
			String customerTargetValueDF2 ="0";
			String customerSaleTargetValDF2 ="0";
			String terminalSaleShareDF2 ="0";
			String salesShare4GDF2 ="0";
			String salesShare4GFZ2 ="0";
			String salesShare4GGYDF2 ="0";
			String terminalSalesFZ2 ="0";
			String grossProfitRatioFZ2 ="0";
			String feeProgressBalanceFZ2 ="0";
			String privateBrandSalesIncomeFZ2 ="0";
			String newRetailOperationDF2 ="0";
			String averageProfitDF2 ="0";
	//分值或得分  非空判断
			//运营收入
			if(businessIncome!=null){businessIncomeFZ=businessIncome.getFz();}
			if(businessIncome2!=null){businessIncomeFZ2=businessIncome2.getFz();}
			
			if(incomePhoneBrand!=null){incomePhoneBrandFZ=incomePhoneBrand.getFz();}
			if(incomePhoneBrand2!=null){incomePhoneBrandFZ2=incomePhoneBrand2.getFz();}
			
			if(incomeMultiForm!=null){incomeMultiFormFZ=incomeMultiForm.getFz();}
			if(incomeMultiForm2!=null){incomeMultiFormFZ2=incomeMultiForm2.getFz();}
			
			if(customerTargetValue!=null){customerTargetValueDF=customerTargetValue.getDf();}
			if(customerTargetValue2!=null){customerTargetValueDF2=customerTargetValue2.getDf();}
			
			if(customerSaleTargetVal!=null){customerSaleTargetValDF=customerSaleTargetVal.getDf();}
			if(customerSaleTargetVal2!=null){customerSaleTargetValDF2=customerSaleTargetVal2.getDf();}
			
			if(terminalSaleShare!=null){terminalSaleShareDF=terminalSaleShare.getDf();}
			if(terminalSaleShare2!=null){terminalSaleShareDF2=terminalSaleShare2.getDf();}
			
			if(salesShare4G!=null){salesShare4GDF=salesShare4G.getDf();}
			if(salesShare4G2!=null){salesShare4GDF2=salesShare4G2.getDf();}
			
			if(salesShare4G!=null){salesShare4GGYDF=salesShare4G.getGydf();}
			if(salesShare4G2!=null){salesShare4GGYDF2=salesShare4G2.getGydf();}
			
			if(terminalSales!=null){terminalSalesFZ=terminalSales.getFz();}
			if(terminalSales2!=null){terminalSalesFZ2=terminalSales2.getFz();}

			if(grossProfitRatio!=null){grossProfitRatioFZ=grossProfitRatio.getZhmlbkhfs();}
			if(grossProfitRatio2!=null){grossProfitRatioFZ2=grossProfitRatio2.getZhmlbkhfs();}
			
			if(feeProgressBalance!=null){feeProgressBalanceFZ=feeProgressBalance.getDf();}
			if(feeProgressBalance2!=null){feeProgressBalanceFZ2=feeProgressBalance2.getDf();}
			
			
			if(privateBrandSalesIncome!=null){privateBrandSalesIncomeFZ=privateBrandSalesIncome.getDf();}
			if(privateBrandSalesIncome2!=null){privateBrandSalesIncomeFZ2=privateBrandSalesIncome2.getDf();}
			
			if(newRetailOperation!=null){
				newRetailOperationDF=newRetailOperation.getXlsmdyydf();
				}
			if(newRetailOperation2!=null){newRetailOperationDF2=newRetailOperation2.getXlsmdyydf();}
			
			if(averageProfit!=null){averageProfitDF=averageProfit.getDf();}
			if(averageProfit2!=null){averageProfitDF2=averageProfit2.getDf();}
			//页面数据
			Map<String, Object> result = new HashMap<String,Object>();
			//运营收入
			String businessIncomeFz = String.valueOf(Double.valueOf(businessIncomeFZ) + Double.valueOf(incomePhoneBrandFZ) + Double.valueOf(incomeMultiFormFZ));
			//社会渠道拓展
			String shqdtzFz = String.valueOf(Double.valueOf(customerTargetValueDF)+ Double.valueOf(customerSaleTargetValDF));
			//省公司协同
			String sgsxtFz = String.valueOf(Double.valueOf(terminalSaleShareDF) + Double.valueOf(salesShare4GDF) + Double.valueOf(salesShare4GGYDF));
			//基础分
			String jcxDf =String.valueOf(Double.valueOf(businessIncomeFz)+ 
					Double.valueOf(terminalSalesFZ) + 
					Double.valueOf(productSalesRate.getFz()==null?"0":productSalesRate.getFz()) + 
					
					Double.valueOf(shqdtzFz) +
					Double.valueOf( sgsxtFz) + 
					
					Double.valueOf(stockTurnoverRatio.getDf())+ 
					Double.valueOf(threeMonthStockRatio.getDf())+ 
					Double.valueOf(repaymentAccuracyForecast.getHkyczqddf())+ 
					Double.valueOf(accountReceivableTurnoverRatio.getDf())+
					Double.valueOf(accountsReceivableRatio.getYszkdf180())+ 
					
					Double.valueOf(grossProfitRatioFZ)+ 
					Double.valueOf(feeProgressBalanceFZ) 
					
					);
			
			//流动资产周转率
			String ldzczzl =String.valueOf(Double.valueOf(stockTurnoverRatio.getDf())+ 
					Double.valueOf(threeMonthStockRatio.getDf())+ 
					Double.valueOf(repaymentAccuracyForecast.getHkyczqddf())+ 
					Double.valueOf(accountReceivableTurnoverRatio.getDf())+
					Double.valueOf(accountsReceivableRatio.getYszkdf180()));
			
			//加分项
			String jfxDf = String.valueOf(Double.valueOf(privateBrandSalesIncomeFZ) + 
													Double.valueOf(newRetailOperationDF) + 
													Double.valueOf(averageProfitDF));
			//终端分
			String zdf = String.valueOf(Double.valueOf(jcxDf) + Double.valueOf(jfxDf));
			//上月同比  终端分
			String zdf2 = String.valueOf(Double.valueOf(incomeMultiFormFZ2) + Double.valueOf(incomePhoneBrandFZ2)
					+ Double.valueOf(businessIncomeFZ2) + Double.valueOf(customerTargetValueDF2)
					+ Double.valueOf(customerSaleTargetValDF2) + Double.valueOf(terminalSaleShareDF2)
					+ Double.valueOf(salesShare4GDF2) + Double.valueOf(salesShare4GGYDF2)
					+ Double.valueOf(terminalSalesFZ2)+ Double.valueOf(grossProfitRatioFZ2)+ Double.valueOf(feeProgressBalanceFZ2)
					+ Double.valueOf(privateBrandSalesIncomeFZ2)+ Double.valueOf(newRetailOperationDF2)
					+ Double.valueOf(averageProfitDF2));
			String diff = String.valueOf(Double.valueOf(zdf) - Double.valueOf(zdf2));
			
			result.put("businessIncome",businessIncome);
			result.put("incomePhoneBrand",incomePhoneBrand);
			result.put("incomeMultiForm",incomeMultiForm);
			result.put("terminalSales",terminalSales);
			result.put("productSalesRate",productSalesRate);
			result.put("customerTargetValue",customerTargetValue);
			result.put("customerSaleTargetVal",customerSaleTargetVal);
			result.put("salesShare4G",salesShare4G);
			result.put("terminalSaleShare",terminalSaleShare);
			result.put("stockTurnoverRatio",stockTurnoverRatio);
			result.put("threeMonthStockRatio",threeMonthStockRatio);
			result.put("repaymentAccuracyForecast",repaymentAccuracyForecast);
			result.put("accountReceivableTurnoverRatio",accountReceivableTurnoverRatio);
			result.put("accountsReceivableRatio",accountsReceivableRatio);
			result.put("grossProfitRatio",grossProfitRatio);
			result.put("businessIncomeFz",businessIncomeFz);
			result.put("grossProfitRatioFZ",grossProfitRatioFZ);
			result.put("feeProgressBalanceFZ",feeProgressBalanceFZ);
			result.put("terminalSalesFZ",terminalSalesFZ);
			result.put("shqdtzFz",shqdtzFz);
			result.put("sgsxtFz",sgsxtFz);
//			result.put("jcxDf",jcxDf);
//			result.put("jfxDf",jfxDf);
			result.put("diff",diff);
			result.put("ldzczzl",ldzczzl);
			if(month.equals("201812")) {
				result.put("zdf","87.78");
			}else {
				result.put("zdf",zdf);
			}
			//result.put("zdf",zdf);
			result.put("year",year);
			return result;
		}catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public String getLastMonth(String month){
		String y = month.substring(0,4);
		String m = month.substring(4);
		Integer yInt = Integer.parseInt(y);
		Integer mInt = Integer.parseInt(m);
		Integer mInt2 = mInt - 1;
		if(mInt2 == 0){
			mInt2 = 12;
			yInt = yInt -1;
		}
		String m2 = String.valueOf(mInt2);
		if(m2.length() < 2){
			m2 = "0" + m2;
		}
		String month2 = String.valueOf(yInt) + m2;
		return month2;
	}

	/**
	 * 全方位大数据监控页面的数据获取
	 * 8字品牌表前六个月的数据展示对比图
	 */
	@SuppressWarnings("unused")
	@DS("dataSource")@RequestMapping(value = "/getValue",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Map<String,Object>> getValueByMonthAndType(@RequestBody Map<String,Object> map){
		
	try{
		Map<String, Map<String,Object>> resultAllMap = new HashMap<>();//存放8字的所有数据
		String month =(String) map.get("month");//选择的月份 yyyyMM,
		
		
		//获取要查询的目标月份与前六个月的月份日期
		String month1;
		String month2;
		String month3;
		String month4;
		String month5;
		String month6;
		String month7=month;
		
		month6=getLastMonth(month7);
		month5=getLastMonth(month6);
		month4=getLastMonth(month5);
		month3=getLastMonth(month4);
		month2=getLastMonth(month3);
		month1=getLastMonth(month2);
		
		//存月份
		Map<String, Object> monthMap = new HashMap<>();
		monthMap.put("month1",month1);
		monthMap.put("month2",month2);
		monthMap.put("month3",month3);
		monthMap.put("month4",month4);
		monthMap.put("month5",month5);
		monthMap.put("month6",month6);
		monthMap.put("month7",month7);
		
		resultAllMap.put("monthMap", monthMap);
		
		//月份
		String [] months={month1,month2,month3,month4,month5,month6,month7};
		String [] values={"value1","value2","value3","value4","value5","value6","value7","value8"};
		//八字
		String [] type8s={"量","收","利","份","进","销","存","回"};
		//对应上面的8字  的查询结果 的变量名
		String [] result={"amountMap","incomeMap","profitMap","shareMap","purchasesMap","activationMap","stockMap","repayMap"};
		//当前月份months[i]对应的8字数据存map
		Map<String, Object> amountMap = new HashMap<>();	//我司销量
		Map<String, Object> incomeMap = new HashMap<>();	//终端销售收入
		Map<String, Object> profitMap = new HashMap<>();	//毛利额
		Map<String, Object> shareMap = new HashMap<>();		//平台份额
		Map<String, Object> purchasesMap = new HashMap<>();	//地市进货量
		Map<String, Object> activationMap = new HashMap<>();//我司激活量
		Map<String, Object> stockMap = new HashMap<>();		//库龄库存量
		Map<String, Object> repayMap = new HashMap<>();		//应收周转率   三个月以上应收账款占比
		
		//省kpi首页八字图表的数据
			//	八字对应的指标的DIM
		String[] dim={"sales_company","income","entry_gross_profit","platform_share","number_purchases_city","activation","inventory_amount"};//不包含  回 的数据  这个单独取数
			//八字总览的sql
		String amountSql=zdResult8BrandDService.getSqlByDim(dim[0]);
		String incomeSql=zdResult8BrandDService.getSqlByDim(dim[1]);
		String profitSql=zdResult8BrandDService.getSqlByDim(dim[2]);
		String shareSql=zdResult8BrandDService.getSqlByDim(dim[3]);
		String purchasesSql=zdResult8BrandDService.getSqlByDim(dim[4]);
		String activSql=zdResult8BrandDService.getSqlByDim(dim[5]);
		String stockSql=zdResult8BrandDService.getSqlByDim(dim[6]);
		for (int i = 0; i < months.length; i++) {
			//获取该月的总览值
			amountMap.put(values[i], zdResult8BrandDService.getValue(amountSql,months[i]));
			incomeMap.put(values[i], zdResult8BrandDService.getValue(incomeSql,months[i]));
			profitMap.put(values[i], zdResult8BrandDService.getValue(profitSql,months[i]));
			shareMap.put(values[i], zdResult8BrandDService.getValue(shareSql,months[i]));
			purchasesMap.put(values[i], zdResult8BrandDService.getValue(purchasesSql,months[i]));
			activationMap.put(values[i], zdResult8BrandDService.getValue(activSql,months[i]));
			stockMap.put(values[i], zdResult8BrandDService.getValue(stockSql,months[i]));
		}
		
		//应收周转率 accountReceivableTurnoverRatio
		Float aRTRatio = zdResult8BrandDService.aRTRatio(month);
		//三月以上周转率占比 accountReceivableRatio
		Float aRRatio = zdResult8BrandDService.aRRatio(month);
		
		repayMap.put("value1", aRTRatio);
		repayMap.put("value2", aRRatio);
		// ---------------------------------------------------------
			//存每一个8字下的数据"amountMap","incomeMap","profitMap","shareMap","purchasesMap","activationMap","stockMap","repayMap"
			resultAllMap.put(result[0],amountMap);
			resultAllMap.put(result[1],incomeMap);
			resultAllMap.put(result[2],profitMap);
			resultAllMap.put(result[3],shareMap);
			resultAllMap.put(result[4],purchasesMap);
			resultAllMap.put(result[5],activationMap);
			resultAllMap.put(result[6],stockMap);
			resultAllMap.put(result[7],repayMap);
	
		
		return resultAllMap;
	}catch(Exception e){
		e.printStackTrace();
	}
	return null;	
	} 
	
}
