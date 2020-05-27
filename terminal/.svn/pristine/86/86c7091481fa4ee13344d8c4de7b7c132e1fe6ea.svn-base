package com.asiainfo.cmc.controller.consumerBigData;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.controller.HomeController;
import com.asiainfo.cmc.enties.consumerBigData.XfzzlBigData;
import com.asiainfo.cmc.enties.gfKpi.channelDevelopment.QualityCustomerTargetValue;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.utils.MyDateFormat;
import com.asiainfo.cmc.service.consumerBigData.XfzzlBigDataService;
import com.github.pagehelper.PageInfo;



@Controller
@RequestMapping(value = "/xfzzlBigData")
public class XfzzlBigDataController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private XfzzlBigDataService xfzzlBigDataService;

	@DS("dataSource2")@RequestMapping(value = "/index",  method = {RequestMethod.GET,RequestMethod.POST})
	public String  index(HttpServletRequest request ,ModelAndView modelAndView,Model model,XfzzlBigData vo){
		logger.info("消费者总览");		
		String special = request.getParameter("special");
		model.addAttribute("special", special );
		String prevMonth = MyDateFormat.getPrevMonth();
		//vo.setStatMo(Integer.parseInt(prevMonth));
		vo.setStatMo(Integer.parseInt("201910"));
		//获取当前品牌集合
		//List<XfzzlBigData> curBrands = xfzzlBigDataService.listCurBrands(vo);
		//modelAndView.addObject("vo",vo);
		//modelAndView.addObject("curBrands",curBrands);
		//modelAndView.setViewName("consumerBigData/xfzzlIndex");	
		model.addAttribute("vo", vo);
		//model.addAttribute("curBrands", curBrands);
		//model.addAttribute("vo", vo);
		return "consumerBigData/xfzzlIndex";
	}	
	
	//区县cmccCtyNam 重新加载
	@DS("dataSource2")@RequestMapping(value = "/cmccCntyNamReload",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<XfzzlBigData> cmccCtyNamReload(XfzzlBigData xfzzlBigData){
		return xfzzlBigDataService.listCntys(xfzzlBigData);	
	}
	
	//当前终端品牌cmBrand 重新加载
	@DS("dataSource2")@RequestMapping(value = "/cmBrandReload",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public PageInfo<XfzzlBigData> cmBrandReload(XfzzlBigData xfzzlBigData){
	
		PageInfo<XfzzlBigData> pageInfo = xfzzlBigDataService.listCurBrands(xfzzlBigData);
		
		return pageInfo;	
	}
	
	//当前终端型号cmTerType 重新加载
	@DS("dataSource2")@RequestMapping(value = "/cmTerTypeReload",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public PageInfo<XfzzlBigData> cmTerTypeReload(XfzzlBigData xfzzlBigData){
		PageInfo<XfzzlBigData> pageInfo = xfzzlBigDataService.listCurSpecs(xfzzlBigData);
		return pageInfo;//xfzzlBigDataService.listCurSpecs(xfzzlBigData);	
	}
	
	//加载画像--数值
	@DS("dataSource2")@RequestMapping(value = "/getTxyhAndZxtxyh",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> getTxyhAndZxtxyh(@RequestBody XfzzlBigData xfzzlBigData){
		return xfzzlBigDataService.getTxyhAndZxtxyh(xfzzlBigData);	
	}
	
	//加载画像
	@DS("dataSource2")@RequestMapping(value = "/listPortray",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<CusChanPortray> listPortray(@RequestBody XfzzlBigData xfzzlBigData){
		return xfzzlBigDataService.listPortray(xfzzlBigData);	
	}
	
	//加载终端特征画像--数值
	@DS("dataSource2")@RequestMapping(value = "/getZwzdAndXrwzd",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> getZwzdAndXrwzd(@RequestBody XfzzlBigData xfzzlBigData){
		return xfzzlBigDataService.getZwzdAndXrwzd(xfzzlBigData);	
	}

	//加载消费者机龄分析--数值
	@DS("dataSource2")@RequestMapping(value = "/getJlfxList",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> getJlfxList(@RequestBody XfzzlBigData xfzzlBigData){
		return xfzzlBigDataService.getJlfxList(xfzzlBigData);	
	}
	
	//加载终端特征画像
	@DS("dataSource2")@RequestMapping(value = "/listPortrayZdtz",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<CusChanPortray> listPortrayZdtz(@RequestBody XfzzlBigData xfzzlBigData){
		return xfzzlBigDataService.listPortrayZdtz(xfzzlBigData);	
	}
	
	//加载消费者机龄分析
	@DS("dataSource2")@RequestMapping(value = "/listPortrayJlfx",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<CusChanPortray> listPortrayJlfx(@RequestBody XfzzlBigData xfzzlBigData){
		return xfzzlBigDataService.listPortrayJlfx(xfzzlBigData);	
	}
	
}
