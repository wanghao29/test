package com.asiainfo.cmc.controller.brandRangeSet;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.brandmodel.ProductInformation;
import com.asiainfo.cmc.service.brandmodel.ProductInformationService;



@Controller
@RequestMapping(value = "/productInformationSet")
public class ProductInformationSetController {
	@Resource
	private ProductInformationService productInformationService;

	private static final Logger logger = LoggerFactory.getLogger(ProductInformationSetController.class);

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);	 
		return "brandRangeSet/productInformationSet";
	}

	/**
	 * 增加信息的操作
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/saved", method = RequestMethod.POST)
	public int saveProduct(HttpServletRequest request, HttpServletResponse response,Locale locale, Model model) throws IOException {
		
		
		ProductInformation pt =new ProductInformation();
		
		String BRANDNAME = request.getParameter("term_brnd_nam");
		
		String SPEC = request.getParameter("term_mdl_nam");
		
		String METERDES = request.getParameter("METERDES");
		
		String METER = request.getParameter("METER");
		
		String SNAME = request.getParameter("SNAME");
		
		String PM = request.getParameter("PM");
		
		String PRICELEVLE = request.getParameter("PRICELEVLE");
		
		String PURPRICE = request.getParameter("PURPRICE");
		
		String PROXYTYPE = request.getParameter("PROXYTYPE");
		
		String COPERMODEL = request.getParameter("COPERMODEL");
		
		String COMPETBRANDNAME1 = request.getParameter("COMPETBRANDNAME1");
		
		String COMPETSPEC1 = request.getParameter("COMPETSPEC1");
		
		String COMPETBRANDNAME2 = request.getParameter("COMPETBRANDNAME2");
		
		String COMPETSPEC2 = request.getParameter("COMPETSPEC2");
		
		String COMPETBRANDNAME3 = request.getParameter("COMPETBRANDNAME3");
		
		String COMPETSPEC3 = request.getParameter("COMPETSPEC3");
		//-------------------------------------------------------------------------
        String BIBRANDNAME1 = request.getParameter("BIBRANDNAME1");
		
		String BISPEC1 = request.getParameter("BISPEC1");
		
		String BIBRANDNAME2 = request.getParameter("BIBRANDNAME2");
		
		String BISPEC2 = request.getParameter("BISPEC2");
		
		String BIBRANDNAME3 = request.getParameter("BIBRANDNAME3");
		
		String BISPEC3 = request.getParameter("BISPEC3");
		
		int tip=0;
		pt.setBRANDNAME(BRANDNAME);
		
		pt.setSPEC(SPEC);
		
		pt.setMETERDES(METERDES);
		
		pt.setMETER(METER);
		
		pt.setSNAME(SNAME);
		
		pt.setPM(PM);
		
		pt.setPRICELEVLE(PRICELEVLE);
		
		pt.setPURPRICE(PURPRICE);
		
		pt.setPROXYTYPE(PROXYTYPE);
		
		pt.setCOPERMODEL(COPERMODEL);
		
		pt.setCOMPETBRANDNAME1(COMPETBRANDNAME1);
		
		pt.setCOMPETSPEC1(COMPETSPEC1);
		
		pt.setCOMPETBRANDNAME2(COMPETBRANDNAME2);
		
		pt.setCOMPETSPEC2(COMPETSPEC2);
		
		pt.setCOMPETBRANDNAME3(COMPETBRANDNAME3);
		
		pt.setCOMPETSPEC3(COMPETSPEC3);
		
		pt.setBIBRANDNAME1(BIBRANDNAME1);
		
		pt.setBIBRANDNAME2(BIBRANDNAME2);
		
		pt.setBIBRANDNAME3(BIBRANDNAME3);
		
		pt.setBISPEC1(BISPEC1);
		
		pt.setBISPEC2(BISPEC2);
		
		pt.setBISPEC3(BISPEC3);
		
		
		//保存数据前检验数据库是否有重复
		List<ProductInformation> list = productInformationService.selectProductInformations(BRANDNAME, SPEC);

		if(list.isEmpty()) {
			
		@SuppressWarnings("unused")
		int i = productInformationService.insertProductInformation(pt);
        
		tip=1;
		}else {
			int i = productInformationService.updateProductInformation(pt);
           System.err.println(i);
			tip=0;	
			
		}
	
		
		return tip;
		
	}
		
		
	/**
	 * 一次性查询产品信息及规划设置列表中的所有数据
	 */
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value="/selectAllListed", method = RequestMethod.POST)
	public List<ProductInformation> doSomeThings(HttpServletRequest request,HttpServletResponse response) throws IOException  {
		
		
	     
	     
	     return productInformationService.selectAllProductInformation(); 
	

	}	
		
		
		
		
		
		
	
	
	
	
	
	


}
