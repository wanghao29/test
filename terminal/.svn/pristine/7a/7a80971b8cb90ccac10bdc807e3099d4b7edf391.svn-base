package com.asiainfo.cmc.controller.gfKpi.eachKpi.operateIncome;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asiainfo.cmc.common.ConvertFormat;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.gfKpi.operateIncome.OwnBrandMultiIncome;
import com.asiainfo.cmc.service.gfKpi.operateIncome.IOwnBrandMultiIncomeService;
import com.asiainfo.cmc.utils.RequestUtils;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;
@Controller
@RequestMapping("/ownBrandMultiIncome")
public class OwnBrandMultiIncomeController {
	@Resource
	private IOwnBrandMultiIncomeService ownBrandMultiIncomeService;
	
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
   	public String newIndex(HttpServletRequest request, Locale locale, Model model, String special, String billcyc) {
   		 
   		request.getSession().setAttribute("special",special);
   		model.addAttribute("special", special );
   		model.addAttribute("billcyc", billcyc );
   		return "gfKpi/operateIncome/ownBrandMultiIncome";
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
			ownBrandMultiIncomeService.calculatedScore(String.valueOf(params.get("startMonth")), String.valueOf(params.get("endMonth")));
			List<OwnBrandMultiIncome> outList = new ArrayList<OwnBrandMultiIncome>();
			PageInfo<OwnBrandMultiIncome> pageInfo =ownBrandMultiIncomeService.queryData(params);
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
}
