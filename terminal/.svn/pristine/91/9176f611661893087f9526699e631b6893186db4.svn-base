package com.asiainfo.cmc.controller.weekReporter;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.asiainfo.cmc.config.DS;
@Controller
@RequestMapping(value = "/appleAmount")
public class AppleAmount {
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
			 
		return "weekReporter/appleAmount";
	}
}
