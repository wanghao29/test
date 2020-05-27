package com.asiainfo.cmc.qudao.controller.hallIdentifyInfo;

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

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.qudao.controller.followCustomerSearch.followCustomerSearchController;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.enties.ZdResultHallDynamicD;
import com.asiainfo.cmc.qudao.enties.ZdResultHallNormalM;
import com.asiainfo.cmc.qudao.service.IHallIdentifyInfoService;
import com.asiainfo.cmc.qudao.vo.IdentifyInfoVo;

@Controller
@RequestMapping(value = "/hallIdentifyInfo")
public class HallIdentifyInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(followCustomerSearchController.class);
	
    @Resource
    private IHallIdentifyInfoService hallIdentifyInfoService;

	@DS("dataSource")@RequestMapping(value = "/hallIdentifyCount", method = RequestMethod.GET)
	public String hallIdentifyCount(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);	 
		return "hallIdentifyInfo/hallIdentifyCount";
	}
	
	@DS("dataSource")@RequestMapping(value = "/pageInit", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> pageInit(@RequestBody IdentifyInfoVo vo) {
		Map<String,Object> map = new HashMap<String,Object>();
		if(vo.getAreaname().equals("全省")) {
			
			vo.setAreaname("");
			
		}
		
		List<CusChanPortray> portrays = hallIdentifyInfoService.listHallIdentifyInfoByIds(vo);

		map.put("portrays", portrays);
		return map;
	}
	
	//常态
	@DS("dataSource")@RequestMapping(value = "/hallIdentifyNormal", method = RequestMethod.GET)
	public String hallIdentifyNormal(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);	 
		return "hallIdentifyInfo/hallIdentifyNormal";
	}
	
	//常态查询列表
	@DS("dataSource")@RequestMapping(value = "/listHallNormal", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> listHallNormal(IdentifyInfoVo vo) {	
		Map<String,Object> map  = new HashMap<String,Object>();
		if(StringUtil.isEmpty(vo.getAreaname())){
			return map;
		}
      if(vo.getAreaname().equals("全省")) {
			
			vo.setAreaname("");
			
		}
		
      if(vo.getName().equals("全部门店")) {
			 vo.setName("");
			 
		 }	
		List<ZdResultHallNormalM> hallNormal = hallIdentifyInfoService.listHallNormal(vo);
        map.put("list", hallNormal);
		return map;
	}
	

	
	//动态
	@DS("dataSource")@RequestMapping(value = "/hallIdentifyDynamic", method = RequestMethod.GET)
	public String dynamicModalShow(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);	 
		return "hallIdentifyInfo/hallIdentifyDynamic";
	}
	
	//动态查询列表
	@DS("dataSource")@RequestMapping(value = "/listHallDynamic", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> listHallDynamic(IdentifyInfoVo vo) {	
		Map<String,Object> map  = new HashMap<String,Object>();
		if(StringUtil.isEmpty(vo.getAreaname())){
			return map;
		}
      if(vo.getAreaname().equals("全省")) {
			
			vo.setAreaname("");
			
		}
      if(vo.getName().equals("全部门店")) {
			 vo.setName("");
			 
		 }	
		List<ZdResultHallDynamicD> hallDynamic = hallIdentifyInfoService.listHallDynamic(vo);
        map.put("list", hallDynamic);
		return map;
	}
}
