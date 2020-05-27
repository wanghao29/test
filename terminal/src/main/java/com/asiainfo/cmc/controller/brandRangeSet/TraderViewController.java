package com.asiainfo.cmc.controller.brandRangeSet;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.asiainfo.cmc.config.DS;
/**
 * 
 * 操盘全生命周期视图
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/traderView")
public class TraderViewController {

	private static final Logger logger = LoggerFactory.getLogger(TraderViewController.class);
	
	@DS("dataSource")@RequestMapping(value = "/trade", method = RequestMethod.POST)
	public String trader(Locale locale, Model model,HttpServletRequest request) {
		logger.info("customerChannel  {}.", locale);	 
		String brand = request.getParameter("BRANDNAME");
		String spec = request.getParameter("SPEC");
//		model.addAttribute(brand);
//		model.addAttribute(spec);
		model.addAttribute("brand", brand);
		model.addAttribute("spec", spec);
		
		return "brandRangeSet/traderViewSet";
	}
	
	
	
}
