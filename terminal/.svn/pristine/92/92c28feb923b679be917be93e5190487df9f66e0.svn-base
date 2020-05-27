package com.asiainfo.cmc.qudao.controller.brandCoverage;

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

import tk.mybatis.mapper.util.StringUtil;

import com.alibaba.druid.util.StringUtils;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.qudao.enties.CellBrndFfff;
import com.asiainfo.cmc.qudao.enties.CellBrndTttt;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.service.ICellBrndFfffService;
import com.asiainfo.cmc.qudao.service.ICellBrndTtttService;
import com.asiainfo.cmc.qudao.utils.MyDateFormat;
import com.asiainfo.cmc.qudao.vo.BrndCoverVo;

@Controller
@RequestMapping(value = "/baseStationCoverage")
public class baseStationCoverageController {
private static final Logger logger = LoggerFactory.getLogger(baseStationCoverageController.class);
	
	@Resource
	private ICellBrndTtttService cellBrndTtttService;
	@Resource
	private ICellBrndFfffService cellBrndFfffService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);
		
	 
		return "brandCoverage/base_station_coverage";
	}
	
	@DS("dataSource")@RequestMapping(value = "/getShopCover", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> listCusChanPortray(@RequestBody BrndCoverVo vo) {		
		Map<String,Object> data = new HashMap<String,Object>();
		
		List<String> monthSblings = MyDateFormat.getMonthSblings(vo.getMonth().toString(),6);
		vo.setMonths(monthSblings);
		data.put("months", monthSblings);
		if(vo.getCityNam().equals("全省")) {
			
			vo.setCityNam("");
		}
		
		
		
		//页面初始化没有品牌时返回品牌列表
		if(StringUtil.isEmpty(vo.getTermBrndNam())){
			List<String> brands = cellBrndTtttService.listBrand(vo);
			//vo.setTermBrndNam((brands==null || brands.size()==0)?"":brands.get(0));
			data.put("brands", brands); 
		}	
			
		Map<String,String> cntsAndNums = null;
		if(!StringUtils.isEmpty(vo.getBrndFfffTyp())){
			vo.setBrndFfffTyp(vo.getBrndFfffTyp()+"基站"); 
			if(vo.getCityNam().equals("")) {
				List<CellBrndTttt> cellBrndTttt = cellBrndTtttService.getCellBrndTttt(vo);
				
				cntsAndNums = cellBrndTtttService.listCntANdNumByMons1(vo);
				
				cellBrndTttt=null;
				data.put("brndTttt", (cellBrndTttt==null ||cellBrndTttt.size()==0)?"":cellBrndTttt);	
				
				
			}else {
				//如果是查询所有的品牌
				if(vo.getTermBrndNam()==null || vo.getTermBrndNam().equals("")) {
					List<CellBrndTttt> cellBrndTttt = cellBrndTtttService.getCellBrndTttt1(vo);
					
					cntsAndNums = cellBrndTtttService.listCntANdNumByMons1(vo);
					
					data.put("brndTttt", (cellBrndTttt==null ||cellBrndTttt.size()==0)?"":cellBrndTttt.get(0));
					
				}else {
				
			List<CellBrndTttt> cellBrndTttt = cellBrndTtttService.getCellBrndTttt(vo);
			cntsAndNums = cellBrndTtttService.listCntANdNumByMons(vo);
			data.put("brndTttt", (cellBrndTttt==null ||cellBrndTttt.size()==0)?"":cellBrndTttt.get(0));
				}
			}
		}
		
		if(!StringUtils.isEmpty(vo.getTtttTyp())){
			if(vo.getCityNam().equals("")) {
			List<CellBrndFfff> cellBrndFfff = cellBrndFfffService.getCellBrndFfff(vo);
			
			cellBrndFfff=null;   
			cntsAndNums = cellBrndFfffService.listCntANdNumByMons1(vo);
			data.put("brndFfff", (cellBrndFfff==null ||cellBrndFfff.size()==0)?"":cellBrndFfff);
			}else {
				//如果是查询所有的品牌 
				if(vo.getTermBrndNam()==null || vo.getTermBrndNam().equals("")) {
				
				List<CellBrndFfff> cellBrndFfff = cellBrndFfffService.getCellBrndFfff1(vo);
				
				cntsAndNums = cellBrndFfffService.listCntANdNumByMons1(vo);
				data.put("brndFfff", (cellBrndFfff==null ||cellBrndFfff.size()==0)?"":cellBrndFfff.get(0));	
				}else {
					List<CellBrndFfff> cellBrndFfff = cellBrndFfffService.getCellBrndFfff(vo);
					cntsAndNums = cellBrndFfffService.listCntANdNumByMons(vo);
					data.put("brndFfff", (cellBrndFfff==null ||cellBrndFfff.size()==0)?"":cellBrndFfff.get(0));		
					
					
				}
				
			}
			}
		data.put("cnts", cntsAndNums.get("cnts"));
		data.put("nums", cntsAndNums.get("nums"));
				
		return data;
	}
	
	//关注查询
	@DS("dataSource")@RequestMapping(value = "/modalShow", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> modalShow(@RequestBody BrndCoverVo vo) {
		Map<String,Object> map = new HashMap<String,Object>();	
		List<CusChanPortray> portray = null;
		if(StringUtil.isNotEmpty(vo.getTtttTyp())){						
			portray = cellBrndFfffService.listPortrayFieldInCellBrandFfff();
		}else{
			portray = cellBrndTtttService.listPortrayFieldInCellBrandTttt();
		}
		map.put("fields", portray);
		return map;
	}
	
	//关注查询
	@DS("dataSource")@RequestMapping(value = "/queryConditions", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> listTheFieldsInHallQudao(BrndCoverVo vo) {
		Map<String,Object> map = new HashMap<String,Object>();
        if("全省".equals(vo.getCityNam())) {
			
			vo.setCityNam("");
		}
		if(StringUtil.isNotEmpty(vo.getTtttTyp())){		
			List<CellBrndFfff> cellBrndFfff = cellBrndFfffService.getCellBrndFfff(vo);
			map.put("list", cellBrndFfff);
		}else if(StringUtil.isNotEmpty(vo.getBrndFfffTyp())){
			List<CellBrndTttt> cellBrndTttt = cellBrndTtttService.getCellBrndTttt(vo);
			map.put("list", cellBrndTttt);
		}
		return map;
	}
	
	//关注查询
	@DS("dataSource")@RequestMapping(value = "/getBrands", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<String> getBrands(@RequestBody BrndCoverVo vo) {
		if(vo.getCityNam().equals("全省")) {
			vo.setCityNam("");
		}
		
		List<String> brands = cellBrndTtttService.listBrand(vo);
		return brands;
	}
}
