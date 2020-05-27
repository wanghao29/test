package com.asiainfo.cmc.controller.provinceKpi.totalprofit;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.BusinessIncome;
import com.asiainfo.cmc.enties.FeeProgressBalance;
import com.asiainfo.cmc.enties.TerminalSales;
import com.asiainfo.cmc.service.impl.FeeProgressBalanceService;
import com.asiainfo.cmc.service.impl.FeeProgressBalanceService;
import com.asiainfo.cmc.utils.PageInfo;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping(value = "/totalProfit/feeProgressBalance")
public class feeProgressBalanceController {
	private static final Logger logger = LoggerFactory.getLogger(feeProgressBalanceController.class);
	@Resource
	private FeeProgressBalanceService FeeProgressBalanceService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);
		return "totalprofit/fee_progress_balance";
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<FeeProgressBalance> list = FeeProgressBalanceService.selectByParameter(startMonth,endMonth,page,pageSize);
		updateData(  list,  startMonth,  endMonth);
		list = FeeProgressBalanceService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = FeeProgressBalanceService.getTotalByParameter(startMonth,endMonth,page,pageSize);
		int totalPage = (totalCount+ pageSize-1) / pageSize;
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(page);
		pageInfo.setPageSize(pageSize);
		pageInfo.setTotalPages(totalPage);
		pageInfo.setTotalCount(totalCount);
		pageInfo.setList(list);
		return pageInfo;
	}

	@DS("dataSource")@RequestMapping(value = "/updateByTargetVal")
	@ResponseBody
	public Map<String, Object> update(@RequestBody Map<String,Object> params) {
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			 
			String endMonth = (String) params.get("endMonth");
			String sgtzx = String.valueOf( params.get("sgtzx"));
			String bhdjhrglcbys = String.valueOf(params.get("bhdjhrglcbys"));
			FeeProgressBalanceService.updateByTargetVal(endMonth,sgtzx,bhdjhrglcbys);
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}

	@DS("dataSource")@RequestMapping(value = "/getKeyData")
	@ResponseBody
	public Map<String,Object> getKeyData() {
		Map<String,Object> ketDatas = FeeProgressBalanceService.getKeyData();
		return ketDatas;
	}

	@DS("dataSource")@RequestMapping(value = "/getLastData")
	@ResponseBody
	public FeeProgressBalance getLastData(@RequestBody Map<String,Object> params) {
		String endMonth = (String) params.get("endMonth");
		FeeProgressBalance FeeProgressBalance = FeeProgressBalanceService.getLastData(endMonth).get(0);
		return FeeProgressBalance;
	}

	@DS("dataSource")@RequestMapping(value = "/getFormat")
	@ResponseBody
	public Map<String,Object> getFormat(Integer id,String flag) {
		Map<String,Object> ketDatas = new HashMap<String,Object>();
		FeeProgressBalance FeeProgressBalance = FeeProgressBalanceService.selectByPrimaryKey(id);
		Float sjjd = 0f;
		/*if(flag.equals("yjd")){
			sjjd = FeeProgressBalance.getYjdlj();
		}
		else if(flag.equals("ejd")){
			sjjd = FeeProgressBalance.getEjdlj();
		}
		else if(flag.equals("sjd")){
			sjjd = FeeProgressBalance.getSjdlj();
		}*/
		DecimalFormat df = new DecimalFormat("#.00");
		sjjd = Float.valueOf(df.format(sjjd)) * 100;
//		Float f;
//		if(sjjd >= 0){
//			f = 100f;
//		}else {
//			f = (1 + sjjd) * 100;
//		}

		StringBuffer stringBuffer = new StringBuffer();
		if(FeeProgressBalance != null){
			stringBuffer.append("<small>当前进度:" + sjjd + "%</small>");
			stringBuffer.append("<div class=\"progress progress-mini\">");
			stringBuffer.append("  <div style=\"width: " + sjjd + "%;\" class=\"progress-bar\"></div>");
			stringBuffer.append("</div>");
			stringBuffer.append("");
			stringBuffer.append("");
			stringBuffer.append("");
			stringBuffer.append("");
		}
		ketDatas.put("formatStr",stringBuffer.toString());
		return ketDatas;
	}

//	@DS("dataSource")@RequestMapping(value = "/getWcqkzbs")
//	@ResponseBody
//	public Map<String,Object> getWcqkzbs(@RequestBody Map<String,Object> params) {
//		Integer id = (Integer) params.get("id");
//		FeeProgressBalance FeeProgressBalance = FeeProgressBalanceService.selectByPrimaryKey(id);
//		String currentMonth = FeeProgressBalance.getMonth();
//		String teampMonth = currentMonth + "01";
//		Float currentMonthWcqkzb = FeeProgressBalance.getWqqkzb();
//		Float lastMonthWcqkzb = FeeProgressBalanceService.getLastMonthWcqkzb(teampMonth);
//		if(lastMonthWcqkzb == null){
//			lastMonthWcqkzb = 0f;
//		}
//		Float lastYearWcqkzb = FeeProgressBalanceService.getLastYearWcqkzb(teampMonth);
//		if(lastYearWcqkzb == null){
//			lastYearWcqkzb = 0f;
//		}
//		Map<String,Object> result = new HashMap<String,Object>();
//		result.put("currentMonthWcqkzb",currentMonthWcqkzb * 100);
//		result.put("lastMonthWcqkzb",lastMonthWcqkzb * 100);
//		result.put("lastYearWcqkzb",lastYearWcqkzb * 100);
//		return result;
//	}
	
	
	@DS("dataSource")@RequestMapping(value = "/getEchartData")
	@ResponseBody
	public Map<String,Object> getEchartData(@RequestBody Map<String,Object> params) {
		Map<String,Object> data = new HashMap<String,Object>();
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		FeeProgressBalance lastFeeProgressBalance = ((List<FeeProgressBalance>) FeeProgressBalanceService.getLastData(endMonth)).get(0);
		List<FeeProgressBalance> feeProgressBalances = FeeProgressBalanceService.getEchartData(startMonth,endMonth);
		List<String> months = new ArrayList<String>();
		List<String> qnwcsrs = new ArrayList<String>();
		List<String> qnwcds = new ArrayList<String>();
		if(feeProgressBalances != null && feeProgressBalances.size() > 0){
			for(FeeProgressBalance feeProgressBalance : feeProgressBalances){
				months.add(feeProgressBalance.getMonth());
				qnwcsrs.add(feeProgressBalance.getBykhfy());
				qnwcds.add(String.valueOf(Double.valueOf(feeProgressBalance.getByjd()==null?"0":feeProgressBalance.getByjd())*100));//转化为百分率
			}
		}
		data.put("months", months);
		data.put("qnwcsrs", qnwcsrs);
		data.put("qnwcds", qnwcds);
		data.put("lastData",lastFeeProgressBalance);
		return data;
	}
	
	private void updateData(List<FeeProgressBalance> list,String startMonth,String endMonth) {
		  for(FeeProgressBalance feeProgressBalance:list) {
		 
				String sgtzx =String.valueOf(feeProgressBalance.getSgtzx());// String.valueOf( params.get("sgtzx"));
				String bhdjhrglcbys = String.valueOf(feeProgressBalance.getBhdjhrglcbys());//String.valueOf(params.get("bhdjhrglcbys"));
				endMonth = feeProgressBalance.getMonth();
				FeeProgressBalanceService.updateByTargetVal(endMonth,sgtzx,bhdjhrglcbys);
		  }
		
	}
}
