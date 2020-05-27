package com.asiainfo.cmc.controller.provinceKpi.pointOption;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.AverageProfit;
import com.asiainfo.cmc.enties.NewRetailOperation;
import com.asiainfo.cmc.service.impl.NewRetailOperationService;
import com.asiainfo.cmc.utils.PageInfo;
import com.asiainfo.cmc.utils.RequestUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

@Controller
@RequestMapping(value = "/pointOption/newRetailOperation")
public class newRetailOperationController {
	private static final Logger logger = LoggerFactory.getLogger(newRetailOperationController.class);
	@Resource
	private NewRetailOperationService NewRetailOperationService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpServletRequest request,String special,String billcyc) {
		logger.info("customerChannel  {}.", locale);
		request.getSession().setAttribute("special",special);
		model.addAttribute("special", special );
		request.getSession().setAttribute("billcyc",billcyc);
		model.addAttribute("billcyc", billcyc );
		return "pointOption/new_retail_operation";
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<NewRetailOperation> list = NewRetailOperationService.selectByParameter(startMonth,endMonth,page,pageSize);
		updateData(list );
		list = NewRetailOperationService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = NewRetailOperationService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
	public Map<String, Object> update(@RequestBody NewRetailOperation newRetailOperation) {
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			NewRetailOperationService.updateByPrimaryKeySelective(newRetailOperation);
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}

	@DS("dataSource")@RequestMapping(value = "/updateByPrimaryKey")
	@ResponseBody
	public Map<String, Object> updateByPrimaryKey(@RequestBody NewRetailOperation NewRetailOperation) {
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			NewRetailOperationService.updateByPrimaryKey(NewRetailOperation);
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}
	@DS("dataSource")@RequestMapping(value = "/addnewRetailOperation")
	@ResponseBody
	public Map<String, Object> addnewRetailOperation( HttpServletRequest request,
			HttpServletResponse response) {
		Map<String,Object> result = new HashMap<String,Object>();
		Map<String,String> params = RequestUtils.getParamsMap(request);
		params.put("month", params.get("billcyc").replace("-", ""));
		try {
			NewRetailOperation newRetailOperation = NewRetailOperationService.selectNewRetail(params.get("month"));
			if(newRetailOperation == null ) {
				NewRetailOperationService.insert(params);
			}else {
				NewRetailOperationService.updateByMonth(params);
			}
			
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}
	@DS("dataSource")@RequestMapping(value = "/getEchartData")
	@ResponseBody
	public Map<String,Object> getEchartData(@RequestBody Map<String,Object> params) {
		Map<String,Object> data = new HashMap<String,Object>();
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		NewRetailOperation lastNewRetailOperation = ((List<NewRetailOperation>) NewRetailOperationService.getLastData(endMonth)).get(0);
		List<NewRetailOperation> NewRetailOperations = NewRetailOperationService.getEchartData(startMonth,endMonth);
		List<String> months = new ArrayList<String>();
		List<String> xlzbs = new ArrayList<String>();
		if(NewRetailOperations != null && NewRetailOperations.size() > 0){
			for(NewRetailOperation NewRetailOperation : NewRetailOperations){
				months.add(NewRetailOperation.getMonth());
				xlzbs.add(NewRetailOperation.getXlsmdhj());
			}
		}
		data.put("months", months);
		data.put("qnwcsrs", xlzbs);
		data.put("lastData",lastNewRetailOperation);
		return data;
	}
	
	private void updateData(List<NewRetailOperation> list ) {
		  for(NewRetailOperation newRetailOperation:list) {
			    NewRetailOperationService.updateByPrimaryKeySelective(newRetailOperation);
				//NewRetailOperationService.updateByPrimaryKey(newRetailOperation);
		  }
		
	}
	
}
