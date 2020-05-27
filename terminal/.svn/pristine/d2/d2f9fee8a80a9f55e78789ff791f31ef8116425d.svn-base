package com.asiainfo.cmc.controller.provinceKpi.assetsTurnoverRatio;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.AccountReceivableTurnoverRatio;
import com.asiainfo.cmc.service.impl.AccountReceivableRatioService;
import com.asiainfo.cmc.utils.PageInfo;

@Controller
@RequestMapping(value = "/assetsTurnoverRate/accountReceivableTurnoverRatio")
public class accountReceivableTurnoverRatioController {
	private static final Logger logger = LoggerFactory.getLogger(accountReceivableTurnoverRatioController.class);
	@Resource
	private AccountReceivableRatioService AccountReceivableTurnoverRatioService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);
		return "assetsTurnoverRatio/account_receivable_turnover_ratio";
	}

	@DS("dataSource")@RequestMapping(value = "/dialog/getDialog")
	public ModelAndView getDialog(String limit) {
		ModelAndView modelAndView = new ModelAndView("/dialog/repayment_accuracy_forecast_dialog");
		return modelAndView;
	}

	@DS("dataSource")@RequestMapping(value = "/addAndEdit")
	@ResponseBody
	public Map<String, Object> addAndEdit(AccountReceivableTurnoverRatio AccountReceivableTurnoverRatio){
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			Integer id = AccountReceivableTurnoverRatio.getId();
			if(id == null){
				AccountReceivableTurnoverRatioService.insert(AccountReceivableTurnoverRatio);
			}else {
				AccountReceivableTurnoverRatioService.updateByPrimaryKey(AccountReceivableTurnoverRatio);
			}
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}

	@DS("dataSource")@RequestMapping(value = "/updateByReceivePayment")
	@ResponseBody
	public Map<String, Object> updateByReceivePayment(@RequestBody AccountReceivableTurnoverRatio AccountReceivableTurnoverRatio){
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			String sgtzxm = String.valueOf(AccountReceivableTurnoverRatio.getSgtzxm());
			String yszkjz = String.valueOf(AccountReceivableTurnoverRatio.getYszkjz());
			String mbz = String.valueOf(AccountReceivableTurnoverRatio.getMbz());
			String month = String.valueOf(AccountReceivableTurnoverRatio.getMonth());
			AccountReceivableTurnoverRatioService.updateByPrimaryKeySelective(sgtzxm,yszkjz,mbz,month);
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<AccountReceivableTurnoverRatio> list = AccountReceivableTurnoverRatioService.selectByParameter(startMonth,endMonth,page,pageSize);
		updateData(  list,  startMonth,  endMonth);
		list = AccountReceivableTurnoverRatioService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = AccountReceivableTurnoverRatioService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
			String startMonth = (String) params.get("startMonth");
			String endMonth = (String) params.get("endMonth");
			String sgtzx = (String) params.get("sgtzx");
			String mbcs = (String) params.get("mbcs");
			AccountReceivableTurnoverRatioService.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
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
		Map<String,Object> ketDatas = AccountReceivableTurnoverRatioService.getKeyData();
		return ketDatas;
	}

	@DS("dataSource")@RequestMapping(value = "/getLastData")
	@ResponseBody
	public AccountReceivableTurnoverRatio getLastData(@RequestBody Map<String,Object> params) {
		String endMonth=(String) params.get("endMonth");
		AccountReceivableTurnoverRatio AccountReceivableTurnoverRatio = AccountReceivableTurnoverRatioService.getLastData(endMonth).get(0);
		return AccountReceivableTurnoverRatio;
	}

//	@DS("dataSource")@RequestMapping(value = "/getFormat")
//	@ResponseBody
//	public Map<String,Object> getFormat(Integer id) {
//		Map<String,Object> ketDatas = new HashMap<String,Object>();
//		AccountReceivableTurnoverRatio AccountReceivableTurnoverRatio = AccountReceivableTurnoverRatioService.selectByPrimaryKey(id);
//		Float sjjd = AccountReceivableTurnoverRatio.getSjjd();
//		Float f;
//		if(sjjd >= 0){
//			f = 100f;
//		}else {
//			f = (1 + sjjd) * 100;
//		}
//
//		StringBuffer stringBuffer = new StringBuffer();
//		if(AccountReceivableTurnoverRatio != null){
//			stringBuffer.append("<small>当前进度:" + f + "%</small>");
//			stringBuffer.append("<div class=\"progress progress-mini\">");
//			stringBuffer.append("  <div style=\"width: " + f + "%;\" class=\"progress-bar\"></div>");
//			stringBuffer.append("</div>");
//			stringBuffer.append("");
//			stringBuffer.append("");
//			stringBuffer.append("");
//			stringBuffer.append("");
//		}
//		ketDatas.put("formatStr",stringBuffer.toString());
//		return ketDatas;
//	}

	@DS("dataSource")@RequestMapping(value = "/getWcqkzbs")
	@ResponseBody
	public Map<String,Object> getWcqkzbs(@RequestBody Map<String,Object> params) {
		Integer id = (Integer) params.get("id");
		AccountReceivableTurnoverRatio AccountReceivableTurnoverRatio = AccountReceivableTurnoverRatioService.selectByPrimaryKey(id);
		String currentMonth = AccountReceivableTurnoverRatio.getMonth();
		String teampMonth = currentMonth + "01";
		String currentMonthWcqkzb = AccountReceivableTurnoverRatio.getNdyskzzl();
		if(currentMonthWcqkzb == null){
			currentMonthWcqkzb ="0";
		}
		String lastMonthWcqkzb = AccountReceivableTurnoverRatioService.getLastMonthWcqkzb(teampMonth);
		if(lastMonthWcqkzb == null){
			lastMonthWcqkzb = "0";
		}
		String lastYearWcqkzb = AccountReceivableTurnoverRatioService.getLastYearWcqkzb(teampMonth);
		if(lastYearWcqkzb == null){
			lastYearWcqkzb = "0";
		}
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("yf", currentMonth);
		result.put("currentMonthWcqkzb",String.valueOf(Double.valueOf(currentMonthWcqkzb) * 100));
		result.put("lastMonthWcqkzb",String.valueOf(Double.valueOf(lastMonthWcqkzb) * 100));
		result.put("lastYearWcqkzb",String.valueOf(Double.valueOf(lastYearWcqkzb) * 100));
		return result;
	}
	private void updateData(List<AccountReceivableTurnoverRatio> list,String startMonth,String endMonth) {
		  for(AccountReceivableTurnoverRatio accountReceivableTurnoverRatio:list) {
			  String sgtzxm = String.valueOf(accountReceivableTurnoverRatio.getSgtzxm()==null?'0':accountReceivableTurnoverRatio.getSgtzxm());
				String yszkjz = String.valueOf(accountReceivableTurnoverRatio.getYszkjz()==null?'0':accountReceivableTurnoverRatio.getYszkjz());
				String mbz = String.valueOf(accountReceivableTurnoverRatio.getMbz()==null?'0':accountReceivableTurnoverRatio.getMbz());
				String month = String.valueOf(accountReceivableTurnoverRatio.getMonth());
				AccountReceivableTurnoverRatioService.updateByPrimaryKeySelective(sgtzxm,yszkjz,mbz,month);
		  }
		
	}
	
	@DS("dataSource")@RequestMapping(value = "/overview")
	@ResponseBody
	public String overview(@RequestBody Map<String,Object> params) {
		String endMonth=(String) params.get("stopMonth");
		AccountReceivableTurnoverRatio accountReceivableTurnoverRatio = AccountReceivableTurnoverRatioService.getLastData(endMonth).get(0);
		return accountReceivableTurnoverRatio.getNdyskzzl();
	}
	
}
