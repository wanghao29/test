package com.asiainfo.cmc.controller.consumerBigData;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asiainfo.cmc.common.ConvertFormat;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.consumerBigData.ConsumerBigData;
import com.asiainfo.cmc.enties.consumerBigData.CrossAnalysis;
import com.asiainfo.cmc.enties.consumerBigData.XfzzlBigData;
import com.asiainfo.cmc.service.consumerBigData.IconsumerBigDataService;
import com.asiainfo.cmc.utils.RequestUtils;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



@Controller
@RequestMapping(value = "/consumerBigData")
public class consumerBigDataController {
	@Resource
	private IconsumerBigDataService consumerBigDataService;
	
	/**初始化关注客户搜索**/
	@DS("dataSource")@RequestMapping(value = "/index",  method = {RequestMethod.GET,RequestMethod.POST})
	public String  index(){
		return "consumerBigData/index";
	}	
	
	@DS("dataSource")@RequestMapping(value = "/query",  method = {RequestMethod.GET,RequestMethod.POST})
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
	/*	if(params.containsKey("pkgDtlFeeAmtMin")&&  !"".equals(String.valueOf(params.get("pkgDtlFeeAmtMin"))) ) {
			params.put("pkgDtlFeeAmtMin",Float.valueOf(String.valueOf(params.get("pkgDtlFeeAmtMin"))));
		}*/
	/*	startRow = 0;
		endRow = rows - 1;

		if (page != 1) {
			startRow = (page - 1) * rows;
			endRow = startRow + endRow;
		}

		if (rows == 0) {
			rows = 1;
			startRow = 0;
			endRow = 1;
		}*/

/*		final String sortId = ConvertFormat.toString(req.getParameter("sidx"));
		orderType = ConvertFormat.toString(req.getParameter("sord"));

		if (!orderType.equalsIgnoreCase("asc"))
			isAscOrder = false;*/

		try {
			
			List<ConsumerBigData> outList = new ArrayList<ConsumerBigData>();
			 PageInfo<ConsumerBigData> pageInfo =consumerBigDataService.queryList(params,consumerBigDataService.getIdimensionalList());
			outList=pageInfo.getList();

			JSONArray allRowArray = new JSONArray();

			ConsumerBigData consumerBigData = null;

			// endRow
/*			if (endRow >= totalRow).9
				endRow = totalRow - 1;*/

			if (outList != null&& outList.size() !=0) {
				for (int i = 0; i < outList.size(); i++) {

					consumerBigData = outList.get(i);

					JSONObject rowObject = new JSONObject();
					JSONArray rowCellArray = new JSONArray();

					try {
						rowObject.put("id", i);
						
						 
						rowCellArray.add(consumerBigData.getStatMo());//""
						rowCellArray.add(consumerBigData.getCmccBranchCd()==null?"":consumerBigData.getCmccBranchCd());
						rowCellArray.add(consumerBigData.getCmBrand()==null?"":consumerBigData.getCmBrand());
						rowCellArray.add(consumerBigData.getCmPriceRnk()==null?"":consumerBigData.getCmPriceRnk());
						rowCellArray.add(consumerBigData.getYdSellInd()==null?"":consumerBigData.getYdSellInd());//
						rowCellArray.add(consumerBigData.getCmIfFingerprint()==null?"":consumerBigData.getCmIfFingerprint());
						rowCellArray.add(consumerBigData.getJiAgeRak()==null?"":consumerBigData.getJiAgeRak());
						rowCellArray.add(consumerBigData.getLmPriceRnk()==null?"":consumerBigData.getLmPriceRnk());
						rowCellArray.add(consumerBigData.getGdrTypCd()==null?"":consumerBigData.getGdrTypCd());
						rowCellArray.add(consumerBigData.getAgeCntRnk()==null?"":consumerBigData.getAgeCntRnk());
						rowCellArray.add(consumerBigData.getActvCmnctInd()==null?"":consumerBigData.getActvCmnctInd());
						rowCellArray.add(consumerBigData.getVipUsrInd()==null?"":consumerBigData.getVipUsrInd());
						rowCellArray.add(consumerBigData.getArpuRnkCd()==null?"":consumerBigData.getArpuRnkCd());
						rowCellArray.add(consumerBigData.getExceedPkgInd()==null?"":consumerBigData.getExceedPkgInd());
						rowCellArray.add(consumerBigData.getDebetDurRnk()==null?"":consumerBigData.getDebetDurRnk());
						rowCellArray.add(consumerBigData.getGprsFluxRnk()==null?"":consumerBigData.getGprsFluxRnk());
						rowCellArray.add(consumerBigData.getTdlteGprsFluxRnk()==null?"":consumerBigData.getTdlteGprsFluxRnk());
						rowCellArray.add(""); // For button column
						rowObject.put("cell", rowCellArray);

						allRowArray.add(rowObject);
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
			}

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
	
	
	@DS("dataSource")@RequestMapping(value = "/sumInnetUsrCnt",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public JSONObject sumInnetUsrCnt(HttpServletRequest req, HttpServletResponse res){
		
		JSONObject returnJSONObject = new JSONObject();
		Map<String,Object> params = new HashMap<String,Object>();
		params = RequestUtils.getParamsMapObj(req);
		returnJSONObject.put("return", consumerBigDataService.sumInnetUsrCnt(params,consumerBigDataService.getIdimensionalList()));
		return returnJSONObject;
	}
	/**将多维度信息表数据以json格式返回给前台**/
	@DS("dataSource")@RequestMapping(value = "/idimensional",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public JSONObject getIdimensional(){

		return consumerBigDataService.getIdimensional();
	}
	
	
	/**将多维度信息详情表数据以json格式返回给前台**/
	@DS("dataSource")@RequestMapping(value = "/details",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> getIdimensionalNumDetails(){
		
		return consumerBigDataService.getIdimensionalNumDetails();
	}
	
	/**初始化交叉分析表**/
	@DS("dataSource")@RequestMapping(value = "/crossAnalysis",  method = {RequestMethod.GET,RequestMethod.POST})
	public String  crossAnalysis(){
		return "consumerBigData/cross_analysis";
	}
	
	
	/**交叉分析表数据信息**/
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/cross_analysis_list",  method = {RequestMethod.GET,RequestMethod.POST})
	public JSONObject  crossAnalysisList(HttpServletRequest req, HttpServletResponse res) {
		
		String city =req.getParameter("city");
		res.setContentType("text/html;charset=UTF-8");
		
		JSONObject resultJson = new JSONObject();
		
	//	int page = ConvertFormat.parseInt(req.getParameter("page"));
	//	int rows = ConvertFormat.parseInt(req.getParameter("rows"));
		
		Map<String,String> params = RequestUtils.getParamsMap(req);
		
	//	PageInfo<CrossAnalysis> crossAnalysisList = consumerBigDataService.crossAnalysisList(params);
	//	resultJson.put("rows", crossAnalysisList);
		
		
		
		
		res.setContentType("text/html;charset=UTF-8");
		int page, rows, startRow, endRow;
		String orderType;
		boolean isAscOrder = true;
		JSONObject returnJSONObject = new JSONObject();
		HttpSession session = req.getSession();
		page = ConvertFormat.parseInt(req.getParameter("page"));
		rows = ConvertFormat.parseInt(req.getParameter("rows"));
	//	Map<String,String> params = new HashMap<String,String>();
		params = RequestUtils.getParamsMap(req);
		try {
			
			List<CrossAnalysis> outList = new ArrayList<CrossAnalysis>();
			// PageInfo<ConsumerBigData> pageInfo =consumerBigDataService.queryList(params);
			PageInfo<CrossAnalysis> crossAnalysisList = consumerBigDataService.crossAnalysisList(params);
			outList=crossAnalysisList.getList();

 

		
			JSONArray allRowArray = new JSONArray();

			CrossAnalysis crossAnalysis = null;

			// endRow
/*			if (endRow >= totalRow).9
				endRow = totalRow - 1;*/

			if (outList != null&& outList.size() !=0) {
				for (int i = 0; i < outList.size(); i++) {

					crossAnalysis = outList.get(i);

					JSONObject rowObject = new JSONObject();
					JSONArray rowCellArray = new JSONArray();

					try {
						rowObject.put("id", i);
						rowCellArray.add(crossAnalysis.getStat_mo());
						rowCellArray.add(crossAnalysis.getCmccBranchCd());
						rowCellArray.add(crossAnalysis.getCustGpNam());
						rowCellArray.add(crossAnalysis.getCustGpCnt());
						rowCellArray.add(crossAnalysis.getYwstUsrCnt());
						rowCellArray.add(crossAnalysis.getYdfkUsrCnt());
						rowCellArray.add(crossAnalysis.getYdfkHighFluxUsrCnt());
						rowCellArray.add(crossAnalysis.getYdfkLowgprsHighwifiUsrCnt());
 
						rowCellArray.add(""); // For button column
						rowObject.put("cell", rowCellArray);

						allRowArray.add(rowObject);
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
			}

			returnJSONObject.put("page", page);
			returnJSONObject.put("total",crossAnalysisList.getPages());//Math.ceil((double) totalRow / rows);
			returnJSONObject.put("records", crossAnalysisList.getTotal());
			returnJSONObject.put("rows", outList);
			/*PrintWriter writer = res.getWriter();
			writer.println(returnJSONObject);
			writer.flush();*/
			
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return returnJSONObject;

	}
		
		
		
		
		
		
		
		
		
/*		return resultJson;
	}*/
	
	/** 当前终端品牌  **/
	@DS("dataSource2")@RequestMapping(value = "/brandSelect",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public PageInfo<Map<String,String>>  brandSelectInfo(HttpServletRequest req, HttpServletResponse res){
		//List<String> brandSelectInfo = consumerBigDataService.brandSelectInfo();
		Map<String, Object> params = RequestUtils.getParamsMapObj(req);
		PageInfo<Map<String,String>> pageInfo = consumerBigDataService.brandSelectInfo(params);
		//List<String> pkgDtlFeeAmtSelectInfo = consumerBigDataService.pkgDtlFeeAmtSelectInfo();
		//JSONObject resultJson = new JSONObject();
		//esultJson.put("list", brandSelectInfo);
		//resultJson.put("pkgDtlFeeAmt", pkgDtlFeeAmtSelectInfo);
		return pageInfo;
	}
	
	
	/** 当前终端型号  **/
	@DS("dataSource2")@RequestMapping(value = "/specSelect",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public PageInfo<Map<String,String>> specSelectInfo(HttpServletRequest req, HttpServletResponse res) {
		/*String cm_brand = (String) map.get("cm_brand");
		if(cm_brand==null || cm_brand==""){
			return null;
		}*/
		//List<String> specSelectInfo = consumerBigDataService.specSelectInfo(cm_brand);
		Map<String, Object> params = RequestUtils.getParamsMapObj(req);
		PageInfo<Map<String,String>> pageInfo = consumerBigDataService.specSelectInfo(params);
		//Map<String, Object> resultJson = new HashMap<String,Object>();
		//resultJson.put("list", specSelectInfo);
		return pageInfo;
	}
	
	@DS("dataSource")@RequestMapping(value = "/pkgDtlFeeAmt",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public JSONObject pkgDtlFeeAmt(HttpServletRequest req, HttpServletResponse res){
		//List<String> brandSelectInfo = consumerBigDataService.brandSelectInfo();
		Map<String, Object> params = RequestUtils.getParamsMapObj(req);
	 
		List<String> pkgDtlFeeAmtSelectInfo = consumerBigDataService.pkgDtlFeeAmtSelectInfo();
		JSONObject resultJson = new JSONObject();
		//esultJson.put("list", brandSelectInfo);
		resultJson.put("pkgDtlFeeAmt", pkgDtlFeeAmtSelectInfo);
		return resultJson;
	}
	
}
