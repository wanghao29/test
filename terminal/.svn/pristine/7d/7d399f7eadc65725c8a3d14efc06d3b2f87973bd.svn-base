package com.asiainfo.cmc.controller.brandRangeSet;


import java.util.List;
import java.util.Locale;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.brandmodel.BrandEnty;
import com.asiainfo.cmc.service.brandmodel.BrandEntyService;

@Controller
@RequestMapping(value = "/brandEnty")
public class BrandEntyController {

	@Resource
	private BrandEntyService brandEntyService;
	
	
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/brands", method = RequestMethod.POST)
	public List<String> index(Locale locale, Model model,HttpServletRequest request,HttpServletResponse response) {
		
		
		List<String> list = brandEntyService.selectBrand();
		
		if(list==null || list.size()==0) {
			
			return null;
			
		}
	
		return list;	
	
}
	
	
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/doubles", method = RequestMethod.POST)
	public List<String> indexs(Locale locale, Model model,HttpServletRequest request,HttpServletResponse response) {
		BrandEnty bety=new BrandEnty();
		String value1 = request.getParameter("roleid");
		bety.setTerm_brnd_nam(value1);
		List<String> list = brandEntyService.selectModel(bety);	
		return list;		
}

/**
 * 查询另一张表的品牌和型号	
 */
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/otherBrands", method = RequestMethod.POST)
	public List<String> other(Locale locale, Model model,HttpServletRequest request,HttpServletResponse response) {
		
		List<String> list = brandEntyService.selectOtherBrand();
		
		if(list==null || list.size()==0) {
			
			return null;
			
		}
	
		return list;	
	
}
/**
 * 查找型号	
 */

	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/otherDoubles", method = RequestMethod.POST)
	public List<String> others(Locale locale, Model model,HttpServletRequest request,HttpServletResponse response) {
		BrandEnty bety=new BrandEnty();
		String value1 = request.getParameter("roleid");
		bety.setTerm_brnd_nam(value1);
		List<String> list = brandEntyService.selectOtherModel(bety);
		return list;		
}	
	

	/**
	 * 查询改动后的品牌
	 * @param locale
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/newBrand", method = RequestMethod.POST)
	public List<String> brandDate(Locale locale, Model model,HttpServletRequest request,HttpServletResponse response) {
		
		
		BrandEnty bety=new BrandEnty();
		String brand = request.getParameter("BRANDNAME");
		String spec = request.getParameter("SPEC");
		
		bety.setTerm_brnd_nam(brand);
		bety.setTerm_mdl_nam(spec);
		//根据品牌和型号查询出该品牌的价格
		List<String> price = brandEntyService.selectBrandAndModelPrice(bety);
		if(price != null && price.size() >= 1){	
			String j = price.get(0);
			Float i=Float.parseFloat(j);
			Float add=i+1000;
			Float subtract=i-1000;
			String pp=add+"";
			String dd=subtract+"";
			List<String> list = brandEntyService.selectPrice(dd, pp);
			price=list;
			
		}	
		
		
		
		return price;	
	
	
	}
/**
 * 获取改动后的型号
 * @param locale
 * @param model
 * @param request
 * @param response
 * @return
 */

	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/newModel", method = RequestMethod.POST)
	public List<String> modelDate(Locale locale, Model model,HttpServletRequest request,HttpServletResponse response) {
		
		
		BrandEnty bety=new BrandEnty();
		String term_brnd_nam = request.getParameter("roleid");
		String brand = request.getParameter("BRANDNAME");
		String spec = request.getParameter("SPEC");
		bety.setTerm_brnd_nam(brand);
		bety.setTerm_mdl_nam(spec);
		//根据品牌和型号查询出该品牌的价格
		List<String> price = brandEntyService.selectBrandAndModelPrice(bety);
		if(price != null && price.size() >= 1){	
			String j = price.get(0);
			Float i=Float.parseFloat(j);
			Float add=i+200;
			Float subtract=i-200;
			String pp=add+"";
			String dd=subtract+"";
			List<String> list = brandEntyService.selectListModel(dd, pp,term_brnd_nam);
			price=list;
			
		}	
		
		
		
		return price;	
	
	
	}
	
//****************************************************************BI	
	
	
	/**
	 * 查询改动后的品牌
	 * @param locale
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/newBrandBI", method = RequestMethod.POST)
	public List<String> brandDateBI(Locale locale, Model model,HttpServletRequest request,HttpServletResponse response) {
		
		
		BrandEnty bety=new BrandEnty();
		String brand = request.getParameter("BRANDNAME");
		String spec = request.getParameter("SPEC");
		
		bety.setTerm_brnd_nam(brand);
		bety.setTerm_mdl_nam(spec);
		//根据品牌和型号查询出该品牌的价格
		List<String> price = brandEntyService.selectBrandAndModelPriceBI(bety);
		if(price != null && price.size() >= 1){	
			String j = price.get(0);
			Float i=Float.parseFloat(j);
			Float add=i+200;
			Float subtract=i-200;
			String pp=add+"";
			String dd=subtract+"";
			List<String> list = brandEntyService.selectPriceBI(dd, pp);
			price=list;
			
		}	
		
		
		
		return price;	
	
	
	}
/**
 * 获取改动后的型号
 * @param locale
 * @param model
 * @param request
 * @param response
 * @return
 */

	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/newModelBI", method = RequestMethod.POST)
	public List<String> modelDateBI(Locale locale, Model model,HttpServletRequest request,HttpServletResponse response) {

		BrandEnty bety=new BrandEnty();
		String term_brnd_nam = request.getParameter("roleid");
		String brand = request.getParameter("BRANDNAME");
		String spec = request.getParameter("SPEC");
		bety.setTerm_brnd_nam(brand);
		bety.setTerm_mdl_nam(spec);
		//根据品牌和型号查询出该品牌的价格
		List<String> price = brandEntyService.selectBrandAndModelPriceBI(bety);
		if(price != null && price.size() >= 1){	
			String j = price.get(0);
			Float i=Float.parseFloat(j);
			Float add=i+200;
			Float subtract=i-200;
			String pp=add+"";
			String dd=subtract+"";
			List<String> list = brandEntyService.selectListModelBI(dd, pp,term_brnd_nam);
			price=list;
			
		}	
		
		
		
		return price;	
	
	
	}
	
	
	
	
	
	
	
	
}