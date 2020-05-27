package com.asiainfo.cmc.qudao.controller.customerIdentifyInfo;

import java.text.DecimalFormat;
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
import org.springframework.web.servlet.ModelAndView;

import tk.mybatis.mapper.util.StringUtil;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.qudao.controller.followCustomerSearch.followCustomerSearchController;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.enties.ZdResultCustomerDynamic;
import com.asiainfo.cmc.qudao.enties.ZdResultCustomerNormalM;
import com.asiainfo.cmc.qudao.service.ICustomerIdentifyInfoService;
import com.asiainfo.cmc.qudao.utils.MyDateFormat;
import com.asiainfo.cmc.qudao.vo.IdentifyInfoVo;

@Controller
@RequestMapping(value = "/customerIdentifyInfo")
public class CustomerIdentifyInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(followCustomerSearchController.class);

    @Resource
    private ICustomerIdentifyInfoService customerIdentifyInfoService;
	
	@DS("dataSource")@RequestMapping(value = "/customerIdentifyCount", method = RequestMethod.GET)
	public String hallIdentifyCount(Locale locale, Model model) {
		logger.info("跳转到客商统计页面");	 
		return "customerIdentifyInfo/customerIdentifyCount";
	}
	
	@DS("dataSource")@RequestMapping(value = "/pageInit", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> pageInit(@RequestBody IdentifyInfoVo vo) {
		Map<String,Object> map = new HashMap<String,Object>();
       if(vo.getAreaname().equals("全省")) {
		  vo.setAreaname("");	
		  List<CusChanPortray> portrays = customerIdentifyInfoService.listCustomerIdentifyInfoChange(vo);	
		  map.put("portrays", portrays);
		  return map;
       }else {
		
		List<CusChanPortray> portrays = customerIdentifyInfoService.listCustomerIdentifyInfoByIds(vo);
		map.put("portrays", portrays);
		return map;
       }
	}
	
	
	
	
	
	//常态	
	@DS("dataSource")@RequestMapping(value = "/customerIdentifyNormal", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView modalShow1(IdentifyInfoVo vo) {
		logger.info("客商常态特征");	 
		ModelAndView mv = new ModelAndView ();
		List<Map<String,String>> citys = MyDateFormat.getCitys();
		mv.addObject("citys", citys);
//		if(StringUtil.isEmpty(vo.getStartMonth())){
//			//vo.setStartMonth(MyDateFormat.getStartMonth(5));
//			vo.setStartMonth(MyDateFormat.getPrevMonth());
//		}
//		if(StringUtil.isEmpty(vo.getEndMonth())){
//			vo.setEndMonth(MyDateFormat.getPrevMonth());
//		}
		if(StringUtil.isEmpty(vo.getStartMonth())){
			vo.setStartMonth("201910");
		}
		if(StringUtil.isEmpty(vo.getEndMonth())){
			vo.setEndMonth("201910");
		}
		
		if(StringUtil.isEmpty(vo.getAreaname())){
			vo.setAreaname("广州");
		}
		mv.addObject("vo",vo);
		mv.setViewName("customerIdentifyInfo/customerIdentifyNormal");	 
		return mv;
	}
	
	//常态查询列表
	@DS("dataSource")@RequestMapping(value = "/listCustNormal", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> listCustNormal(IdentifyInfoVo vo) {			
		Map<String,Object> map  = new HashMap<String,Object>();
		if(StringUtil.isEmpty(vo.getAreaname())){
			return map;
		}
		 if(vo.getAreaname().equals("全省")) {
			  vo.setAreaname("");	
				
			}
		 if(vo.getName().equals("全部客商")) {
			 vo.setName("");
			 
		 }
		 
		
		List<ZdResultCustomerNormalM> listCustNormal = customerIdentifyInfoService.listCustNormal(vo);
		 DecimalFormat pp = new DecimalFormat("0.00");
		for (ZdResultCustomerNormalM zdResultCustomerNormalM : listCustNormal) {
//			String aa=zdResultCustomerNormalM.getMou();
//			String bb=zdResultCustomerNormalM.getDou();
//			String cc=zdResultCustomerNormalM.getArpu();
			if(zdResultCustomerNormalM.getMou()!=null&&!zdResultCustomerNormalM.getMou().equals("")) {
				 float aa1 = Float.parseFloat(zdResultCustomerNormalM.getMou());
				 String zdamountted1 = pp.format((float)aa1);
				 zdResultCustomerNormalM.setMou(zdamountted1);
			}
			if(zdResultCustomerNormalM.getDou()!=null&&!zdResultCustomerNormalM.getDou().equals("")) {
				 float aa2 = Float.parseFloat(zdResultCustomerNormalM.getDou());
				 String zdamountted2 = pp.format((float)aa2);
				 zdResultCustomerNormalM.setDou(zdamountted2);
			}
			if(zdResultCustomerNormalM.getArpu()!=null&&!zdResultCustomerNormalM.getArpu().equals("")) {
				 float aa3= Float.parseFloat(zdResultCustomerNormalM.getArpu());
				 String zdamountted3 = pp.format((float)aa3);
				 zdResultCustomerNormalM.setArpu(zdamountted3);
			}
//			 float bb=Float.parseFloat(zdResultCustomerNormalM.getDou());
//			 float cc=Float.parseFloat(zdResultCustomerNormalM.getArpu());
//			 
//			 String ydamountted = pp.format((float)bb);
//			 String xdamountted = pp.format((float)cc);
//			
//			
//			zdResultCustomerNormalM.setDou(ydamountted);
//			zdResultCustomerNormalM.setArpu(xdamountted);
		}
        map.put("list", listCustNormal);
		return map;
	}
	
	//动态
	@DS("dataSource")@RequestMapping(value = "/customerIdentifyDynamic", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView dynamicModalShow(IdentifyInfoVo vo) {
		logger.info("客商动态特征");	 
		ModelAndView mv = new ModelAndView ();
		List<Map<String,String>>    citys = MyDateFormat.getCitys();
		mv.addObject("citys", citys);		
		if(StringUtil.isEmpty(vo.getStartDay())){
			//vo.setStartDay(MyDateFormat.getMonthStartDay(MyDateFormat.getPrevMonthDynamic()));
			vo.setStartDay("20191001");
		}
		if(StringUtil.isEmpty(vo.getEndDay())){
			//vo.setEndDay(MyDateFormat.getMonthEndDay(MyDateFormat.getPrevMonth()));
			vo.setEndDay("20191031");
		}
		
		if(StringUtil.isEmpty(vo.getAreaname())){
			vo.setAreaname("广州");
		}
		mv.addObject("vo",vo); 
		mv.setViewName("customerIdentifyInfo/customerIdentifyDynamic");	 
		return mv;
	}
	
	//动态查询列表
	@DS("dataSource")@RequestMapping(value = "/listCustDynamic", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> listCustDynamic(IdentifyInfoVo vo) {	
		Map<String,Object> map  = new HashMap<String,Object>();
		if(StringUtil.isEmpty(vo.getAreaname())){
			return map;
		}
		 if(vo.getAreaname().equals("全省")) {
			  vo.setAreaname("");	
				
			}
		 if(vo.getName().equals("全部客商")) {
			 vo.setName("");
			 
		 }	
		List<ZdResultCustomerDynamic> hallDynamic = customerIdentifyInfoService.listCustDynamic(vo);
        map.put("list", hallDynamic);
		return map;
	}
}
