package com.asiainfo.cmc.qudao.controller.storeBattleMap;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import tk.mybatis.mapper.util.StringUtil;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.enties.ZdResultHallQudaoM;
import com.asiainfo.cmc.qudao.service.IZdResultHallQudaoMService;
import com.asiainfo.cmc.qudao.vo.QudaoVo;


@Controller
@RequestMapping(value = "/hallIdentityMap")
public class hallIdentityMapController {
private static final Logger logger = LoggerFactory.getLogger(hallIdentityMapController.class);

    @Resource
    private IZdResultHallQudaoMService zdResultHallQudaoMService;
    
	@Value("${bdMapUrl}")  
	private String bdMapUrl;
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);
		model.addAttribute("bdMapUrl", bdMapUrl);	 
		return "storeBattleMap/hall_identity_map";
	}
	
	//页面初始化时自动发送的请求 或者点击品牌
	@DS("dataSource")@RequestMapping(value = "/initOrClickbrand", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> initOrClickbrand(@RequestBody QudaoVo vo) {
		ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpSession session = attrs.getRequest().getSession();
		if(vo.getIds()==null || vo.getIds().size()==0){
			List<Integer> hallQudaoM = (List<Integer>)session.getAttribute("hallQudaoM");
			vo.setIds(hallQudaoM);
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		if(StringUtil.isEmpty(vo.getTermBrnd())){
			List<String> brands = zdResultHallQudaoMService.listBrand(vo);
			vo.setTermBrnd((brands==null || brands.size()==0)?"":brands.get(0));
			map.put("brands", brands);
		}
		
		//型号列表，前提是存在品牌
		if(StringUtil.isNotEmpty(vo.getTermBrnd())){
			List<QudaoVo> specs = zdResultHallQudaoMService.listSpecByBrand(vo);	
			map.put("specs", specs);	
			vo.setTermMdl((specs==null || specs.size()==0)?"":specs.get(0).getTermMdl());
		}

		
		List<QudaoVo> listHallQudao = zdResultHallQudaoMService.listHallQudao(vo);
		List<CusChanPortray> listHallQudaoByIds = zdResultHallQudaoMService.listHallQudaoByIds(vo);	
		map.put("list", listHallQudao);
		map.put("portrays", listHallQudaoByIds);		
		return map;
	}
	
	//点击型号，或者点击门店名
	@DS("dataSource")@RequestMapping(value = "/clickMdlOrName", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> clickMdlOrName(@RequestBody QudaoVo vo) {
		Map<String,Object> map = new HashMap<String,Object>();		
		List<QudaoVo> listHallQudao = zdResultHallQudaoMService.listHallQudao(vo);
		List<CusChanPortray> listHallQudaoByIds = zdResultHallQudaoMService.listHallQudaoByIds(vo);	
		map.put("list", listHallQudao);
		map.put("portrays", listHallQudaoByIds);		
		return map;
	}

	//关注特性定制
	@DS("dataSource")@RequestMapping(value = "/modalInit", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> modalInit(@RequestBody QudaoVo vo) {
		ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpSession session = attrs.getRequest().getSession();
			
		Map<String,Object> map = new HashMap<String,Object>();		
		List<CusChanPortray> portrays = zdResultHallQudaoMService.listPortrayFieldInHallQudao();	
		map.put("portrays", portrays);		
		
		List<Integer> hallQudaoM = (List<Integer>)session.getAttribute("hallQudaoM");
		if(hallQudaoM!=null){
			map.put("hallQudaoM", hallQudaoM);	
		}
		return map;
	}
	@DS("dataSource")@RequestMapping(value = "/modalSubmit", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> modalSubmit(@RequestBody QudaoVo vo) {
		ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpSession session = attrs.getRequest().getSession();
		if(vo.getIds()!=null && vo.getIds().size()>0){
			session.setAttribute("hallQudaoM", vo.getIds());
		}
			
		Map<String,Object> map = new HashMap<String,Object>();	
		List<CusChanPortray> listHallQudaoByIds = zdResultHallQudaoMService.listHallQudaoByIds(vo);		
		map.put("portrays", listHallQudaoByIds);		
		return map;
	}
	
	
	
	
	
	//弹框	
	@DS("dataSource")@RequestMapping(value = "/modalShow", method = RequestMethod.GET)
	public String modalShow1(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);	 
		return "storeBattleMap/hall_identify_map_modal";
	}
	
	//弹框页面条件选择联动
	@DS("dataSource")@RequestMapping(value = "/selectOnclick_modal", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> selectOnclick_modal(@RequestBody QudaoVo vo) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(StringUtil.isEmpty(vo.getTermBrnd())){
			List<String> brands = zdResultHallQudaoMService.listBrand(vo);
			vo.setTermBrnd((brands==null || brands.size()==0)?"":brands.get(0));
			map.put("brands", brands);
		}
		
		//型号列表
		if(StringUtil.isEmpty(vo.getTermMdl())){
			List<QudaoVo> specs = zdResultHallQudaoMService.listSpecByBrand(vo);	
			map.put("specs", specs);
			vo.setTermMdl((specs==null || specs.size()==0)?"":specs.get(0).getTermMdl());
		}
		
		List<QudaoVo> listHallQudao = zdResultHallQudaoMService.listHallQudao(vo);
		map.put("list", listHallQudao);		
		return map;
	}	
	
	//查询列表
	@DS("dataSource")@RequestMapping(value = "/listAllHallQudao", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> listAllHallQudao(QudaoVo vo) {	
		Map<String,Object> map  = new HashMap<String,Object>();
		List<ZdResultHallQudaoM> list = zdResultHallQudaoMService.listAllTtemHallQudaoByPortIds(vo);		
		map.put("list", list);

		return map;
	}

}
