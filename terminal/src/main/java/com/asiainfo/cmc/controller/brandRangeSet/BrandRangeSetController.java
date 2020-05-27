package com.asiainfo.cmc.controller.brandRangeSet;

import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.asiainfo.cmc.config.DS;

/**
 * .
 * @author
 *品牌容量设置
 */
@Controller
@RequestMapping(value = "/brandRangeSet")
public class BrandRangeSetController {
	private static final Logger logger = LoggerFactory.getLogger(BrandRangeSetController.class);

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);	 
		return "brandRangeSet/brandRangeSet";
	}
	
/*	@DS("dataSource")@RequestMapping(value = "/pageInit", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> pageInit() {
		Map<String,Object> map = new HashMap<String,Object>();

		return map;
	}*/
}

