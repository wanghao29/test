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
import com.asiainfo.cmc.enties.StockTurnoverRatio;
import com.asiainfo.cmc.enties.ThreeMonthStockRatio;
import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.ReceivableTurnoverRate;
import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.ThreeStockValueProportion;
import com.asiainfo.cmc.service.gfKpi.operateEfficiency.IThreeStockValueProportionService;
import com.asiainfo.cmc.utils.RequestUtils;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;

/*三个月以上存货原值占比*/
@Controller
@RequestMapping("/threeStockValueProportion")
public class ThreeStockValueProportionController {

	@Resource
	private IThreeStockValueProportionService threeStockValueProportionService;
	
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
   	public String newIndex(HttpServletRequest request, Locale locale, Model model, String special, String billcyc) {
   		 
   		request.getSession().setAttribute("special",special);
   		model.addAttribute("special", special );
   		model.addAttribute("billcyc", billcyc );
   		return "gfKpi/operateEfficiency/threeStockValueProportion";
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
			//inventoryTurnoverService.calculatedScore(String.valueOf(params.get("startMonth")), String.valueOf(params.get("endMonth")));
			List<ThreeStockValueProportion> outList = new ArrayList<ThreeStockValueProportion>();
			PageInfo<ThreeStockValueProportion> pageInfo =threeStockValueProportionService.queryData(params);
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
	
  //三个月以上存货占比算出一个累计值，
  		@DS("dataSource")@RequestMapping(value = "/overview",method=RequestMethod.POST)
  		@ResponseBody
  		public  Map<String,Object>  overview(@RequestBody Map<String,Object> params) {
  			Map<String,Object> result=new HashMap<String,Object>();
  			ThreeStockValueProportion threeMSR = threeStockValueProportionService.overview(params);
  			// khknld90zb  khknld180zb  khknld360zb  
  			if(threeMSR==null){
  				result.put("khknld90zb", "0");
  	  			result.put("khknld180zb", "0");
  	  			result.put("khknld360zb", "0");
  			}else{
  				result.put("khknld90zb", threeMSR.getJe180zb());
  	  			result.put("khknld180zb", threeMSR.getJe300zb());
  	  			result.put("khknld360zb", threeMSR.getJe360zb());
  			}
  			
  			return result;
  		}
  		
  		@DS("dataSource")@RequestMapping(value = "/list")
  		@ResponseBody
  		public com.asiainfo.cmc.utils.PageInfo<ThreeStockValueProportion> getList(@RequestBody Map<String,Object> params) {
  			List<ThreeStockValueProportion> list = threeStockValueProportionService.getList(params);
  			Integer page = (Integer) params.get("page");
  			Integer pageSize = (Integer) params.get("pageSize");
  			Integer totalCount = threeStockValueProportionService.getTotal(params);
  			int totalPage = (totalCount+ pageSize-1) / pageSize;
  			com.asiainfo.cmc.utils.PageInfo<ThreeStockValueProportion> pageInfo = new com.asiainfo.cmc.utils.PageInfo<ThreeStockValueProportion>();
  			pageInfo.setPage(page);
  			pageInfo.setPageSize(pageSize);
  			pageInfo.setTotalPages(totalPage);
  			pageInfo.setTotalCount(totalCount);
  			pageInfo.setList(list);
  			return pageInfo;
  		}
  		
}
