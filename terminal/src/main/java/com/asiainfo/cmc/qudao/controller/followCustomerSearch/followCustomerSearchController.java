package com.asiainfo.cmc.qudao.controller.followCustomerSearch;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
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
import com.asiainfo.cmc.qudao.enties.FollowCustomerSearch;
import com.asiainfo.cmc.qudao.service.IBrandMdlService;
import com.asiainfo.cmc.qudao.service.IFollowCustomerSearchService;
import com.asiainfo.cmc.qudao.utils.MyDateFormat;
import com.asiainfo.cmc.qudao.vo.BrandMdlVo;
import com.asiainfo.cmc.qudao.vo.FollowCustomerSearchVo;

@Controller
@RequestMapping(value = "/followCustomerSearch")
public class followCustomerSearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(followCustomerSearchController.class);

    @Resource
    private IFollowCustomerSearchService followCustomerSearchService;
    
	@Resource
	private IBrandMdlService brandMdlService;
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);	 
		return "followCustomerSearch/followCustomerSearch";
	}
	
	@DS("dataSource")@RequestMapping(value = "/pageInit", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> pageInit(@RequestBody FollowCustomerSearchVo followCustomerSearchVo) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		List<BrandMdlVo> brands = brandMdlService.listBrandCtms();
		map.put("brands", brands);
		List<BrandMdlVo> specs = brandMdlService.listMdlByBrandCtms(brands.get(0).getBrand());
		map.put("specs", specs);
		
		FollowCustomerSearch maxValue = followCustomerSearchService.getMaxValue(followCustomerSearchVo);
		map.put("maxValue", maxValue);
		return map;
	}
	
	@DS("dataSource")@RequestMapping(value = "/getMaxValue", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> getMaxValue(@RequestBody FollowCustomerSearchVo followCustomerSearchVo) {
		Map<String,Object> map = new HashMap<String,Object>();		
		if(followCustomerSearchVo.getTag1().equals("全省")) {
			followCustomerSearchVo.setTag1("");	
			
		}
		FollowCustomerSearch maxValue = followCustomerSearchService.getMaxValue(followCustomerSearchVo);
		map.put("maxValue", maxValue);
		return map;
	}
	
	@DS("dataSource")@RequestMapping(value = "/getSpecsByBrand", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<BrandMdlVo> getSpecsByBrand(@RequestBody Map<String,String> map) {
		String brand = map.get("brand");
		List<BrandMdlVo> specs = brandMdlService.listMdlByBrandCtms(brand);
		return specs;
	}
	
	
	@DS("dataSource")@RequestMapping(value = "/query",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<FollowCustomerSearch> query(FollowCustomerSearch followCustomerSearch) {
		logger.info("customerChannel  {}.");	
		if(followCustomerSearch.getTag1().equals("全省")) {
			
			followCustomerSearch.setTag1("");
			
			
		}
		FollowCustomerSearchVo followCustomerSearchVo = paseFollowCustomerSearchVo(followCustomerSearch);		
		List<FollowCustomerSearch> list = followCustomerSearchService.listFollowCustomer(followCustomerSearchVo);	
		return list;
	}
	
	

	public FollowCustomerSearchVo paseFollowCustomerSearchVo(FollowCustomerSearch followCustomerSearch){		
		Class<FollowCustomerSearchVo> voClazz=FollowCustomerSearchVo.class;	
		Class<FollowCustomerSearch> entClazz=FollowCustomerSearch.class;
		FollowCustomerSearchVo vo = null;
		try {
			vo = voClazz.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Field[] declaredFields = entClazz.getDeclaredFields();
		for(Field field : declaredFields){
			String fieldStr = field.getName();			
			if("serialVersionUID".equalsIgnoreCase(fieldStr)){
				continue;
			}			
		
			try {		
				Method entGet = entClazz.getMethod("get"+fieldStr.substring(0, 1).toUpperCase()+fieldStr.substring(1),null);
			    String val = (String) entGet.invoke(followCustomerSearch, null);
			    if(StringUtil.isEmpty(val)){
			    	continue;
			    }
			    String[] arr = val.split(",");
			    
			    if(arr.length==2){
					Method voSetStart = voClazz.getMethod("set"+fieldStr.substring(0, 1).toUpperCase()+fieldStr.substring(1)+"Start",String.class);
					Method voSetEnd = voClazz.getMethod("set"+fieldStr.substring(0, 1).toUpperCase()+fieldStr.substring(1)+"End",String.class);
				    voSetStart.invoke(vo, arr[0]);
				    voSetEnd.invoke(vo, arr[1]);
			    }else if(arr.length==1){
			    	Method voSet = voClazz.getMethod("set"+fieldStr.substring(0, 1).toUpperCase()+fieldStr.substring(1),String.class);
			    	voSet.invoke(vo, arr[0]);
			    }
			    			    
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		return vo;		
	}
}
 