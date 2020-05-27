package com.asiainfo.cmc.controller.gfKpi.eachKpi.operateEfficiency;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asiainfo.cmc.common.ConvertFormat;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.AccountReceivableTurnoverRatio;
import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.InventoryTurnover;
import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.ReceivableTurnoverRate;
import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.ThreeReceivableProportion;
import com.asiainfo.cmc.service.gfKpi.operateEfficiency.IReceivableTurnoverRateService;
import com.asiainfo.cmc.utils.RequestUtils;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;

/*应收周转率*/
@Controller
@RequestMapping("/receivableTurnoverRate")
public class ReceivableTurnoverRateController {
	@Resource
	private IReceivableTurnoverRateService receivableTurnoverRateService;
	
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
   	public String newIndex(HttpServletRequest request, Locale locale, Model model, String special, String billcyc) {
   		 
   		request.getSession().setAttribute("special",special);
   		model.addAttribute("special", special );
   		model.addAttribute("billcyc", billcyc );
   		return "gfKpi/operateEfficiency/receivableTurnoverRate";
   	}
   	
   	@DS("dataSource")@RequestMapping(value = "/queryData",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public JSONObject query(HttpServletRequest req, HttpServletResponse res) {
		res.setContentType("text/html;charset=UTF-8");
		int page, rows, startRow, endRow;
		String orderType;
		boolean isAscOrder = true;
		JSONObject returnJSONObject = new JSONObject();
		HttpSession session = req.getSession();
		page = ConvertFormat.parseInt(req.getParameter("page"));
		rows = ConvertFormat.parseInt(req.getParameter("rows"));
		Map<String,Object> params = new HashMap<String,Object>();
		params = RequestUtils.getParamsMapObj(req);
		try {
			receivableTurnoverRateService.calculatedScore(String.valueOf(params.get("startMonth")), String.valueOf(params.get("endMonth")));
			List<ReceivableTurnoverRate> outList = new ArrayList<ReceivableTurnoverRate>();
			PageInfo<ReceivableTurnoverRate> pageInfo =receivableTurnoverRateService.queryData(params);
			outList=pageInfo.getList();
			returnJSONObject.put("page", page);
			returnJSONObject.put("total",pageInfo.getPages());//Math.ceil((double) totalRow / rows);
			returnJSONObject.put("records", pageInfo.getTotal());
			returnJSONObject.put("rows", outList);
			/*PrintWriter writer = res.getWriter();
			writer.println(returnJSONObject);
			writer.flush();*/
			
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return returnJSONObject;

	}
   	
   	@DS("dataSource")@RequestMapping(value = "/overview")
	@ResponseBody
	public String overview(@RequestBody Map<String,Object> params) {
   		
   		
   		String billcyc= (String) params.get("stopMonth");
   		String month  = billcyc.substring(4, billcyc.length());
   		if(Integer.valueOf(month) <= 6) {
   			params.put("stopMonth", "上半年");
   		}else {
   			params.put("stopMonth", "下半年");
   		}
   		ReceivableTurnoverRate receivableTurnoverRate = receivableTurnoverRateService.overview(params);
   		if(receivableTurnoverRate==null){
   			return "0";
   		}else{
   			return receivableTurnoverRate.getByyskzzl().toString();
   		}
		
	}
   	
	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public com.asiainfo.cmc.utils.PageInfo<ReceivableTurnoverRate> getList(@RequestBody Map<String,Object> params) {
		List<ReceivableTurnoverRate> list = receivableTurnoverRateService.getList(params);
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		Integer totalCount = receivableTurnoverRateService.getTotal(params);
		int totalPage = (totalCount+ pageSize-1) / pageSize;		
		com.asiainfo.cmc.utils.PageInfo<ReceivableTurnoverRate> pageInfo = new com.asiainfo.cmc.utils.PageInfo<ReceivableTurnoverRate>();
		pageInfo.setPage(page);
		pageInfo.setPageSize(pageSize);
		pageInfo.setTotalPages(totalPage);
		pageInfo.setTotalCount(totalCount);
		pageInfo.setList(list);
		return pageInfo;
	}
   	
}
