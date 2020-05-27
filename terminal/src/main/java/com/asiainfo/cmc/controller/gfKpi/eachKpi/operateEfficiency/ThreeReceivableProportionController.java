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
import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.InventoryTurnover;
import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.ReceivableTurnoverRate;
import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.ThreeReceivableProportion;
import com.asiainfo.cmc.service.gfKpi.operateEfficiency.impl.ThreeReceivableProportionService;
import com.asiainfo.cmc.utils.RequestUtils;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;

/*三个月以上应收账款占比*/
@Controller
@RequestMapping("/threeReceivableProportion")
public class ThreeReceivableProportionController {
	@Resource
	private ThreeReceivableProportionService threeReceivableProportionService;
	
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
   	public String newIndex(HttpServletRequest request, Locale locale, Model model, String special, String billcyc) {
   		 
   		request.getSession().setAttribute("special",special);
   		model.addAttribute("special", special );
   		model.addAttribute("billcyc", billcyc );
   		return "gfKpi/operateEfficiency/threeReceivableProportion";
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
			threeReceivableProportionService.calculatedScore(String.valueOf(params.get("startMonth")), String.valueOf(params.get("endMonth")));
			List<ThreeReceivableProportion> outList = new ArrayList<ThreeReceivableProportion>();
			PageInfo<ThreeReceivableProportion> pageInfo =threeReceivableProportionService.queryData(params);
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
	public Map<String,Object> overview(@RequestBody Map<String,Object> params) {
		Map<String,Object> result=new HashMap<String,Object>();
		ThreeReceivableProportion arr=threeReceivableProportionService.overview(params);
		//yszkzb90 yszkzb180
		if(arr==null){
			result.put("yszkzb180", "0");
			result.put("yszkzb90", "0");
		}else{
			result.put("yszkzb180", arr.getYszkzb180());
			result.put("yszkzb90", arr.getYszkzb90());
		}
		
		return result;
	}
   	
   	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public com.asiainfo.cmc.utils.PageInfo<ThreeReceivableProportion> getList(@RequestBody Map<String,Object> params) {
		List<ThreeReceivableProportion> list = threeReceivableProportionService.getList(params);
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		Integer totalCount = threeReceivableProportionService.getTotal(params);
		int totalPage = (totalCount+ pageSize-1) / pageSize;		
		com.asiainfo.cmc.utils.PageInfo<ThreeReceivableProportion> pageInfo = new com.asiainfo.cmc.utils.PageInfo<ThreeReceivableProportion>();
		pageInfo.setPage(page);
		pageInfo.setPageSize(pageSize);
		pageInfo.setTotalPages(totalPage);
		pageInfo.setTotalCount(totalCount);
		pageInfo.setList(list);
		return pageInfo;
	}
   	
}
