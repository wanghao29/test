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
import com.asiainfo.cmc.enties.AccountsReceivableRatio;
import com.asiainfo.cmc.enties.StockTurnoverRatio;
import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.InventoryTurnover;
import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.ThreeStockValueProportion;
import com.asiainfo.cmc.service.gfKpi.operateEfficiency.IInventoryTurnoverService;
import com.asiainfo.cmc.utils.RequestUtils;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;

/*存货周转率*/
@Controller
@RequestMapping("/inventoryTurnover")
public class InventoryTurnoverController {
	@Resource
	private IInventoryTurnoverService inventoryTurnoverService;
	
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
   	public String newIndex(HttpServletRequest request, Locale locale, Model model, String special, String billcyc) {
   		 
   		request.getSession().setAttribute("special",special);
   		model.addAttribute("special", special );
   		model.addAttribute("billcyc", billcyc );
   		return "gfKpi/operateEfficiency/inventoryTurnover";
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
			inventoryTurnoverService.calculatedScore(String.valueOf(params.get("startMonth")), String.valueOf(params.get("endMonth")));
			List<InventoryTurnover> outList = new ArrayList<InventoryTurnover>();
			PageInfo<InventoryTurnover> pageInfo =inventoryTurnoverService.queryData(params);
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
		InventoryTurnover InventoryTurnover = inventoryTurnoverService.overview(params);
		 String ljchzzl;
		if(InventoryTurnover==null){
			ljchzzl="0";
		}else{
			ljchzzl= InventoryTurnover.getChzzl().toString();
		}
		 
		return ljchzzl;
	}
   	
   	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public com.asiainfo.cmc.utils.PageInfo<InventoryTurnover> getList(@RequestBody Map<String,Object> params) {
		List<InventoryTurnover> list = inventoryTurnoverService.getList(params);
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		Integer totalCount = inventoryTurnoverService.getTotal(params);
		int totalPage = (totalCount+ pageSize-1) / pageSize;			com.asiainfo.cmc.utils.PageInfo<InventoryTurnover> pageInfo = new com.asiainfo.cmc.utils.PageInfo<InventoryTurnover>();
		pageInfo.setPage(page);
		pageInfo.setPageSize(pageSize);
		pageInfo.setTotalPages(totalPage);
		pageInfo.setTotalCount(totalCount);
		pageInfo.setList(list);
		return pageInfo;
	}
   	
}
