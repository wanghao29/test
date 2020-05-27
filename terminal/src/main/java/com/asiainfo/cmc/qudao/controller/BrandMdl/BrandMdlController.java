package com.asiainfo.cmc.qudao.controller.BrandMdl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.qudao.service.IBrandMdlService;
import com.asiainfo.cmc.qudao.vo.BrandMdlVo;

@Controller
@RequestMapping(value = "/brandMdl")
public class BrandMdlController {
	
	@Resource
	private IBrandMdlService brandMdlService;
	
	@DS("dataSource")@RequestMapping(value = "/listMdlByBrandBi", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<BrandMdlVo> listMdlByBrandBi(@RequestBody BrandMdlVo vo) {		
		return brandMdlService.listMdlByBrandBi(vo.getBrand());
	}
	
	@DS("dataSource")@RequestMapping(value = "/listMdlByBrandCtms", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<BrandMdlVo> listMdlByBrandCtms(@RequestBody BrandMdlVo vo) {		
		return brandMdlService.listMdlByBrandCtms(vo.getBrand());
	}

}
