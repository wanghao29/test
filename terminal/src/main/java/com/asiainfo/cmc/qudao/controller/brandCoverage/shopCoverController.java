package com.asiainfo.cmc.qudao.controller.brandCoverage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.mybatis.mapper.util.StringUtil;

import com.alibaba.druid.util.StringUtils;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.brandmodel.OverCustomer;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.enties.HallBrndFfff;
import com.asiainfo.cmc.qudao.enties.HallBrndTttt;
import com.asiainfo.cmc.qudao.service.IBrandMdlService;
import com.asiainfo.cmc.qudao.service.IHallBrndFfffService;
import com.asiainfo.cmc.qudao.service.IHallBrndTtttService;
import com.asiainfo.cmc.qudao.utils.MyDateFormat;
import com.asiainfo.cmc.qudao.vo.BrandMdlVo;
import com.asiainfo.cmc.qudao.vo.BrndCoverVo;

@Controller
@RequestMapping(value = "/shopCover")
public class shopCoverController {
private static final Logger logger = LoggerFactory.getLogger(shopCoverController.class);

    @Resource
    private IHallBrndTtttService hallBrndTtttService;
    @Resource
    private IHallBrndFfffService hallBrndFfffService;
	@Resource
	private IBrandMdlService brandMdlService;
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home() {
		logger.info("customerChannel  {}.");			 
		return "brandCoverage/shop_cover";
	}
	
	@DS("dataSource")@RequestMapping(value = "/getShopCover", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> listCusChanPortray(@RequestBody BrndCoverVo vo) {		
		Map<String,Object> data = new HashMap<String,Object>();
		if(vo.getCityNam().equals("全省")) {
			
			vo.setCityNam("");
			
		      }

		//页面初始化没有品牌时返回品牌列表
		if(StringUtil.isEmpty(vo.getTermBrndNam())){
			//List<BrandMdlVo> brands = brandMdlService.listBrandBi();
			//vo.setTermBrndNam((brands==null || brands.size()==0)?"":brands.get(0).getBrand());
			
			List<String> brands = hallBrndTtttService.listBrand(vo);
			//vo.setTermBrndNam((brands==null || brands.size()==0)?"":brands.get(0));
			data.put("brands", brands);
		}	
		
		List<String> monthSblings = MyDateFormat.getMonthSblings(vo.getMonth().toString(),6);
		vo.setMonths(monthSblings);
		data.put("months", monthSblings);
		
		Map<String,String> cntsAndNums = null;
		//页面点击li时，只会传进来一个种类，只展示这种类型就好了
		if(!StringUtils.isEmpty(vo.getBrndFfffTyp())){
			vo.setBrndFfffTyp(vo.getBrndFfffTyp()+"厅店");
			if(vo.getCityNam().equals("")) {
				List<HallBrndTttt> hallBrndTttts = hallBrndTtttService.getHallBrndTttt(vo);
				hallBrndTttts=null;
				cntsAndNums = hallBrndTtttService.listCntANdNumByMons(vo);
				data.put("brndTttt", (hallBrndTttts==null ||hallBrndTttts.size()==0)?"":hallBrndTttts);	
				
				
			}else {
				if(vo.getTermBrndNam()==null || vo.getTermBrndNam().equals("")) {
			List<HallBrndTttt> hallBrndTttts = hallBrndTtttService.getHallBrndTttt1(vo);
			
			cntsAndNums = hallBrndTtttService.listCntANdNumByMons1(vo);
			
			data.put("brndTttt", (hallBrndTttts==null ||hallBrndTttts.size()==0)?"":hallBrndTttts.get(0));
				}
				else 
				{
			List<HallBrndTttt> hallBrndTttts = hallBrndTtttService.getHallBrndTttt(vo);
					
			cntsAndNums = hallBrndTtttService.listCntANdNumByMons(vo);
					
			data.put("brndTttt", (hallBrndTttts==null ||hallBrndTttts.size()==0)?"":hallBrndTttts.get(0));	
					
				}
			}
			}
		
		if(!StringUtils.isEmpty(vo.getTtttTyp())){
			if(vo.getCityNam().equals("")) {
			List<HallBrndFfff> hallBrndFfffs = hallBrndFfffService.getHallBrndFfff(vo);
			hallBrndFfffs=null;
			cntsAndNums = hallBrndFfffService.listCntANdNumByMons1(vo);
			data.put("brndFfff", (hallBrndFfffs==null || hallBrndFfffs.size()==0)?"":hallBrndFfffs);
			
			}else {
				if(vo.getTermBrndNam()==null || vo.getTermBrndNam().equals("")) {
				List<HallBrndFfff> hallBrndFfffs = hallBrndFfffService.getHallBrndFfff1(vo);
				cntsAndNums = hallBrndFfffService.listCntANdNumByMons1(vo);
				data.put("brndFfff", (hallBrndFfffs==null || hallBrndFfffs.size()==0)?"":hallBrndFfffs.get(0));
				}
				else {
					
					List<HallBrndFfff> hallBrndFfffs = hallBrndFfffService.getHallBrndFfff(vo);
					cntsAndNums = hallBrndFfffService.listCntANdNumByMons(vo);
					data.put("brndFfff", (hallBrndFfffs==null || hallBrndFfffs.size()==0)?"":hallBrndFfffs.get(0));	
					
					
				}
				
			}
			}
		data.put("cnts", cntsAndNums.get("cnts"));
		data.put("nums", cntsAndNums.get("nums"));
				
		return data;
	}
	//品牌覆盖情况功能的实现
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/getCoverBrandSum", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,Object> coverBrand(@RequestBody OverCustomer vo,HttpServletRequest request) {		
		Map<String,Object> data = new HashMap<String,Object>();
		//String name = request.getParameter("areaname");
		//String brand = request.getParameter("brandname");
//		vo.setAREANAME(name);
//		vo.setBRANDNAME(brand); 
         if(!vo.getDODATE().equals("") && vo.getDODATE()!=null) {
		
		
		List<String> monthSblings = MyDateFormat.getMonthSblings(vo.getDODATE().toString(),6);
		String startMonth = monthSblings.get(0);
		String endMonth = monthSblings.get(5);
		String areaname = vo.getAREANAME();
		String brandname = vo.getBRANDNAME();
		vo.setMonths(monthSblings);
		data.put("months", monthSblings);
		
		List<String> listCoverBrand = hallBrndTtttService.listCoverBrand(startMonth, endMonth, brandname, areaname);
		//Map<String,String> cntsAndNums = null;
		//页面点击li时，只会传进来一个种类，只展示这种类型就好了
		// List<OverCustomer> listCoverBrand = hallBrndTtttService.listCoverBrand(vo);
		//System.out.println(listCoverBrand.toString());
		  
		//data.put("cnts", cntsAndNums.get("cnts"));
		//data.put("nums", cntsAndNums.get("nums"));
         }	
		return data;
	}
	
	
	
	
	
	
	
	
	
	
	//关注查询
	@DS("dataSource")@RequestMapping(value = "/modalShow", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> modalShow(@RequestBody BrndCoverVo vo) {
		Map<String,Object> map = new HashMap<String,Object>();	
		List<CusChanPortray> portray = null;
		if(StringUtil.isNotEmpty(vo.getTtttTyp())){						
			portray = hallBrndFfffService.listPortrayFieldInHallBrandFfff();
		}else{
			portray = hallBrndTtttService.listPortrayFieldInHallBrandTttt();
		}
		map.put("fields", portray);
		return map;
	}
	
	//关注查询
	@DS("dataSource")@RequestMapping(value = "/queryConditions", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> listTheFieldsInHallQudao(BrndCoverVo vo) {
		if("全省".equals(vo.getCityNam())) {
			vo.setCityNam("");
		}
		Map<String,Object> map = new HashMap<String,Object>();
		if(StringUtil.isNotEmpty(vo.getTtttTyp())){		
			List<HallBrndFfff> hallBrndFfffs = hallBrndFfffService.getHallBrndFfff(vo);
			map.put("list", hallBrndFfffs);
		}else if(StringUtil.isNotEmpty(vo.getBrndFfffTyp())){
			List<HallBrndTttt> hallBrndTttts = hallBrndTtttService.getHallBrndTttt(vo);
			map.put("list", hallBrndTttts);
		}
		return map;
	}
	
	//关注查询
	@DS("dataSource")@RequestMapping(value = "/getBrands", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<String> getBrands(@RequestBody BrndCoverVo vo) {
		if(vo.getCityNam().equals("全省")) {
			vo.setCityNam("");
		}
		
		List<String> brands = hallBrndTtttService.listBrand(vo);
		return brands;
	}
	
}
