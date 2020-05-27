package com.asiainfo.cmc.controller.model.panoramaKpi;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.asiainfo.cmc.config.DS;

@Controller
@RequestMapping(value = "/panoramaKpi")
public class PanoramaKpiController {
	private static final Logger logger = LoggerFactory.getLogger(PanoramaKpiController.class);

	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);
		return "model/panoramaKpi/panorama_kpi";
	}
}
