package com.asiainfo.cmc.controller.provinceKpi.pointOption;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.BrandProductSalesIncome;
import com.asiainfo.cmc.enties.ReduceItem;
import com.asiainfo.cmc.enties.TerminalSaleShare;
import com.asiainfo.cmc.service.impl.ReduceItemService;
import com.asiainfo.cmc.utils.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.lang.UsesSunHttpServer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping(value = "/pointOption/reduceItem")
public class reduceItemController {
	private static final Logger logger = LoggerFactory.getLogger(reduceItemController.class);
	@Resource
	private ReduceItemService ReduceItemService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpServletRequest request,String special,String billcyc) {
		logger.info("customerChannel  {}.", locale);
		request.getSession().setAttribute("special",special);
		model.addAttribute("special", special );
		request.getSession().setAttribute("billcyc",billcyc);
		model.addAttribute("billcyc", billcyc );
		return "pointOption/reduce_item";
	}

	@DS("dataSource")@RequestMapping(value = "/dialog/getDialog")
	public ModelAndView getDialog(String limit) {
		ModelAndView modelAndView = new ModelAndView("/dialog/reduceItem_dialog");
		return modelAndView;
	}

	@DS("dataSource")@RequestMapping(value = "/addAndEdit")
	@ResponseBody
	public Map<String, Object> addAndEdit(ReduceItem ReduceItem){
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			Integer id = ReduceItem.getId();
			if(id == null){
				ReduceItemService.insert(ReduceItem);
			}else {
				ReduceItemService.updateByPrimaryKey(ReduceItem);
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
	public Map<String, Object> updateByReceivePayment(ReduceItem ReduceItem){
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			ReduceItemService.updateByReceivePayment(ReduceItem);
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
		List<ReduceItem> list = ReduceItemService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = ReduceItemService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
			ReduceItemService.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
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
		Map<String,Object> ketDatas = ReduceItemService.getKeyData();
		return ketDatas;
	}

	@DS("dataSource")@RequestMapping(value = "/getLastData")
	@ResponseBody
	public ReduceItem getLastData(@RequestBody Map<String,Object> params) {
		String endMonth=(String) params.get("endMonth");
		ReduceItem ReduceItem = ReduceItemService.getLastData(endMonth).get(0);
		return ReduceItem;
	}

//	@DS("dataSource")@RequestMapping(value = "/getFormat")
//	@ResponseBody
//	public Map<String,Object> getFormat(Integer id) {
//		Map<String,Object> ketDatas = new HashMap<String,Object>();
//		ReduceItem ReduceItem = ReduceItemService.selectByPrimaryKey(id);
//		Float sjjd = ReduceItem.getSjjd();
//		Float f;
//		if(sjjd >= 0){
//			f = 100f;
//		}else {
//			f = (1 + sjjd) * 100;
//		}
//
//		StringBuffer stringBuffer = new StringBuffer();
//		if(ReduceItem != null){
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
		ReduceItem ReduceItem = ReduceItemService.selectByPrimaryKey(id);
		String currentMonth = ReduceItem.getMonth();
		String teampMonth = currentMonth + "01";
		Float currentMonthWcqkzb = ReduceItem.getKfxfs2();
		Float lastMonthWcqkzb = ReduceItemService.getLastMonthWcqkzb(teampMonth);
		if(lastMonthWcqkzb == null){
			lastMonthWcqkzb = 0f;
		}
		Float lastYearWcqkzb = ReduceItemService.getLastYearWcqkzb(teampMonth);
		if(lastYearWcqkzb == null){
			lastYearWcqkzb = 0f;
		}
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("currentMonthWcqkzb",currentMonthWcqkzb * 100);
		result.put("lastMonthWcqkzb",lastMonthWcqkzb * 100);
		result.put("lastYearWcqkzb",lastYearWcqkzb * 100);
		return result;
	}
	
	//�����۷����
	@DS("dataSource")@RequestMapping(value = "/add")
	@ResponseBody
	public void addReduceItem(@RequestBody ReduceItem reduceItem) {
		String month = reduceItem.getMonth();
		Integer count =ReduceItemService.getCountByMonth(month);
		if(count>0){
			//�޸�
			ReduceItemService.updateByMonth(reduceItem);
			
		}else{
			//����
			ReduceItemService.addReduceItem(reduceItem);
		}
		
	}
	
	@DS("dataSource")@RequestMapping(value = "/getEchartData")
	@ResponseBody
	public Map<String,Object> getEchartData(@RequestBody Map<String,Object> params) {
		Map<String,Object> data = new HashMap<String,Object>();
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		ReduceItem lastTerminalSaleShare = ((List<ReduceItem>) ReduceItemService.getLastData(endMonth)).get(0);
		List<ReduceItem> TerminalSaleShares = ReduceItemService.getEchartData(startMonth,endMonth);
		List<String> months = new ArrayList<String>();
		List<Float> kfxhj = new ArrayList<Float>();
		if(TerminalSaleShares != null && TerminalSaleShares.size() > 0){
			for(ReduceItem reduceItem : TerminalSaleShares){
				months.add(reduceItem.getMonth());
				if(reduceItem.getKfxfs1()==null){
					reduceItem.setKfxfs1(0f);
				}
				if(reduceItem.getKfxfs2()==null){
					reduceItem.setKfxfs2(0f);
				}
				if(reduceItem.getKfxfs3()==null){
					reduceItem.setKfxfs3(0f);
				}
				if(reduceItem.getKfxfs4()==null){
					reduceItem.setKfxfs4(0f);
				}
				if(reduceItem.getKfxfs5()==null){
					reduceItem.setKfxfs5(0f);
				}
				if(reduceItem.getKfxfs6()==null){
					reduceItem.setKfxfs6(0f);
				}
				if(reduceItem.getKfxfs7()==null){
					reduceItem.setKfxfs7(0f);
				}
				if(reduceItem.getKfxfs8()==null){
					reduceItem.setKfxfs8(0f);
				}
				
				kfxhj.add(reduceItem.getKfxfs1()+reduceItem.getKfxfs2()+reduceItem.getKfxfs3()+reduceItem.getKfxfs4()+
						reduceItem.getKfxfs5()+reduceItem.getKfxfs6()+reduceItem.getKfxfs7()+reduceItem.getKfxfs8());
			}
		}
		if(lastTerminalSaleShare.getKfxfs1()==null){
			lastTerminalSaleShare.setKfxfs1(0f);
		}
		if(lastTerminalSaleShare.getKfxfs2()==null){
			lastTerminalSaleShare.setKfxfs2(0f);
		}
		if(lastTerminalSaleShare.getKfxfs3()==null){
			lastTerminalSaleShare.setKfxfs3(0f);
		}
		if(lastTerminalSaleShare.getKfxfs4()==null){
			lastTerminalSaleShare.setKfxfs4(0f);
		}
		if(lastTerminalSaleShare.getKfxfs5()==null){
			lastTerminalSaleShare.setKfxfs5(0f);
		}
		if(lastTerminalSaleShare.getKfxfs6()==null){
			lastTerminalSaleShare.setKfxfs6(0f);
		}
		if(lastTerminalSaleShare.getKfxfs7()==null){
			lastTerminalSaleShare.setKfxfs7(0f);
		}
		if(lastTerminalSaleShare.getKfxfs8()==null){
			lastTerminalSaleShare.setKfxfs8(0f);
		}
		Float lastKfxhj=lastTerminalSaleShare.getKfxfs1()+lastTerminalSaleShare.getKfxfs2()+lastTerminalSaleShare.getKfxfs3()+
				lastTerminalSaleShare.getKfxfs4()+lastTerminalSaleShare.getKfxfs5()+lastTerminalSaleShare.getKfxfs6()+
				lastTerminalSaleShare.getKfxfs7()+lastTerminalSaleShare.getKfxfs8();
		data.put("months", months);
		data.put("kfxhj", kfxhj);
		data.put("lastKfxhj",lastKfxhj);
		return data;
	}	
	private void updateData(List<ReduceItem> list,String startMonth,String endMonth) {
		  for(ReduceItem reduceItem:list) {
			     Map<String,Object> params = new HashMap<String,Object>();
			        //String sgtzx =reduceItem.get// (String) params.get("sgtzx");
					//String mbcs = (String) params.get("mbcs");
					//ReduceItemService.updateByReceivePayment(reduceItem);
					//ReduceItemService.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
		  }
		
	}
}
