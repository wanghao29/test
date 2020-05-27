package com.asiainfo.cmc.qudao.controller.storeBattleMap;

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
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.service.IZdResultCellQudaoMService;
import com.asiainfo.cmc.qudao.vo.QudaoVo;


@Controller
@RequestMapping(value = "/cellIdentityMap")
public class cellIdentityMapController {
private static final Logger logger = LoggerFactory.getLogger(cellIdentityMapController.class);

    @Resource
    private IZdResultCellQudaoMService zdResultCellQudaoMService;
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);
		
	 
		return "storeBattleMap/cell_identity_map";
	}
	
	@DS("dataSource")@RequestMapping(value = "/initOrClickbrand", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> initOrClickbrand(@RequestBody QudaoVo vo) {
		Map<String,Object> map = new HashMap<String,Object>();
		if(StringUtil.isEmpty(vo.getTermBrnd())){
			List<String> brands = zdResultCellQudaoMService.listBrand(vo);
			vo.setTermBrnd((brands==null || brands.size()==0)?"":brands.get(0));
			map.put("brands", brands);
		}
		
		//型号列表，前提是存在品牌
		if(StringUtil.isNotEmpty(vo.getTermBrnd())){
			List<QudaoVo> specs = zdResultCellQudaoMService.listSpecByBrand(vo);			
			map.put("specs", specs);
		}

		
		List<QudaoVo> listHallQudao = zdResultCellQudaoMService.listCellQudao(vo);
		List<CusChanPortray> listHallQudaoByIds = zdResultCellQudaoMService.listHallQudaoByIds(vo);
		map.put("list", listHallQudao);
		map.put("portrays", listHallQudaoByIds);
		return map;
	}
	
	@DS("dataSource")@RequestMapping(value = "/clickMdlOrName", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> clickMdlOrName(@RequestBody QudaoVo vo) {
		Map<String,Object> map = new HashMap<String,Object>();		
		List<QudaoVo> listHallQudao = zdResultCellQudaoMService.listCellQudao(vo);
		List<CusChanPortray> listHallQudaoByIds = zdResultCellQudaoMService.listHallQudaoByIds(vo);
		map.put("list", listHallQudao);
		map.put("portrays", listHallQudaoByIds);
		return map;
	}
}
