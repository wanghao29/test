package com.asiainfo.cmc.controller.brandRangeSet;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.asiainfo.cmc.config.DS;

@Controller
@RequestMapping(value = "/priceRangeSet")
public class PriceRangeSetController {


	private static final Logger logger = LoggerFactory.getLogger(PriceRangeSetController.class);

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);	 
		return "brandRangeSet/priceRangeSet";
	}
	
	
	
	
	
	
	
}






