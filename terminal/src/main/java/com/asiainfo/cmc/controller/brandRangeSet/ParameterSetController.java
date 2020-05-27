package com.asiainfo.cmc.controller.brandRangeSet;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.brandmodel.AbsoluteRange;
import com.asiainfo.cmc.enties.brandmodel.CityDate;
import com.asiainfo.cmc.enties.brandmodel.CityDateS;
import com.asiainfo.cmc.enties.brandmodel.FiveLine;
import com.asiainfo.cmc.enties.brandmodel.FiveLineS;
import com.asiainfo.cmc.enties.brandmodel.LifeDate;
import com.asiainfo.cmc.enties.brandmodel.LifeDateS;
import com.asiainfo.cmc.enties.brandmodel.OverCustomer;
import com.asiainfo.cmc.enties.brandmodel.ProductInformationSetMajor;
import com.asiainfo.cmc.service.brandmodel.CityDateService;
import com.asiainfo.cmc.service.brandmodel.FiveLineService;
import com.asiainfo.cmc.service.brandmodel.LifeDateService;
import com.asiainfo.cmc.service.brandmodel.ProductInformationSetMajorService;

@Controller
@RequestMapping(value = "/parameterSet")
public class ParameterSetController {
	// 导入产品信息设置
	@Resource
	private ProductInformationSetMajorService productInformationSetMajorService;
	@Resource
	private LifeDateService lifeDateService;
	@Resource
	private CityDateService cityDateService;
	@Resource
	private FiveLineService fiveLineService;
	/**
	 * 产品信息规划设置参数设置
	 * 
	 */

	private static final Logger logger = LoggerFactory.getLogger(ParameterSetController.class);

	@DS("dataSource")@RequestMapping(value = "/setOne", method = RequestMethod.POST)
	public String index(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("customerChannel  {}.", locale);

		String brand = request.getParameter("brand");
		String spec = request.getParameter("sp");
		model.addAttribute("brand", brand);
		model.addAttribute("spec", spec);

		// 根据品牌和型号查询生命周期表中的数据
		List<LifeDateS> lifeDated = lifeDateService.selectBrandAndSpec(brand, spec);
		for (LifeDateS lifeDate1 : lifeDated) {
			if ("1".equals(lifeDate1.getCYCLE())) {
				//float f = lifeDate1.getINCOME();
				//String string = Float.toString(f);
				//lifeDate1.setINCOME();
				model.addAttribute("lifeDate1", lifeDate1);
			}

			if ("2".equals(lifeDate1.getCYCLE())) {
				model.addAttribute("lifeDate2", lifeDate1);
			}

			if ("3".equals(lifeDate1.getCYCLE())) {
				model.addAttribute("lifeDate3", lifeDate1);
			}

			if ("4".equals(lifeDate1.getCYCLE())) {
				model.addAttribute("lifeDate4", lifeDate1);
			}

		}

		// 根据品牌和型号查询出地市维度规划表中的数据
		CityDateS ct = new CityDateS();
		ct.setBRANDNAME(brand);
		ct.setSPEC(spec);
		List<CityDateS> citeDate = cityDateService.selectCityDate(ct);

		for (CityDateS citySet : citeDate) {

			if ("广州".equals(citySet.getAREANAME())) {

				model.addAttribute("gzDate", citySet);

				// model.addAttribute("gzdd", saleamounts);
			}

			if ("肇庆".equals(citySet.getAREANAME())) {

				model.addAttribute("zqDate", citySet);

			}

			if ("清远".equals(citySet.getAREANAME())) {

				model.addAttribute("qyDate", citySet);

			}
			if ("韶关".equals(citySet.getAREANAME())) {

				model.addAttribute("sgDate", citySet);

			}
			if ("云浮".equals(citySet.getAREANAME())) {

				model.addAttribute("yfDate", citySet);

			}
			if ("深圳".equals(citySet.getAREANAME())) {

				model.addAttribute("szDate", citySet);

			}
			if ("汕头".equals(citySet.getAREANAME())) {

				model.addAttribute("stDate", citySet);

			}
			if ("揭阳".equals(citySet.getAREANAME())) {

				model.addAttribute("jyDate", citySet);

			}
			if ("梅州".equals(citySet.getAREANAME())) {

				model.addAttribute("mzDate", citySet);

			}
			if ("潮州".equals(citySet.getAREANAME())) {

				model.addAttribute("czDate", citySet);

			}
			if ("汕尾".equals(citySet.getAREANAME())) {

				model.addAttribute("swDate", citySet);

			}

			if ("东莞".equals(citySet.getAREANAME())) {

				model.addAttribute("dgDate", citySet);

			}
			if ("中山".equals(citySet.getAREANAME())) {

				model.addAttribute("zsDate", citySet);

			}
			if ("惠州".equals(citySet.getAREANAME())) {

				model.addAttribute("hzDate", citySet);

			}
			if ("珠海".equals(citySet.getAREANAME())) {

				model.addAttribute("zhDate", citySet);

			}
			if ("河源".equals(citySet.getAREANAME())) {

				model.addAttribute("hyDate", citySet);

			}
			if ("佛山".equals(citySet.getAREANAME())) {

				model.addAttribute("fsDate", citySet);

			}
			if ("江门".equals(citySet.getAREANAME())) {

				model.addAttribute("jmDate", citySet);

			}
			if ("湛江".equals(citySet.getAREANAME())) {

				model.addAttribute("zjDate", citySet);

			}
			if ("茂名".equals(citySet.getAREANAME())) {

				model.addAttribute("mmDate", citySet);

			}
			if ("阳江".equals(citySet.getAREANAME())) {

				model.addAttribute("yjDate", citySet);

			}
			if ("省级大客户".equals(citySet.getAREANAME())) {

				model.addAttribute("sjdDate", citySet);

			}
			
			
		}

		// 五线七口数据数据
		List<FiveLineS> fiveAndLine = fiveLineService.selectFiveLine(brand, spec);

		for (FiveLineS fiveLine : fiveAndLine) {
			// 自有渠道取值

			if ("自有渠道".equals(fiveLine.getLINENAME())) {
				if ("自有渠道整体".equals(fiveLine.getPORTNAME())) {
					model.addAttribute("fiveLine1_1", fiveLine);
				}
			}
			if ("自有渠道".equals(fiveLine.getLINENAME())) {
				if ("自营代销".equals(fiveLine.getPORTNAME())) {
					model.addAttribute("fiveLine1_2", fiveLine);
				}
			}
			if ("自有渠道".equals(fiveLine.getLINENAME())) {
				if ("入柜商".equals(fiveLine.getPORTNAME())) {
					model.addAttribute("fiveLine1_3", fiveLine);
				}
			}

			if ("自有渠道".equals(fiveLine.getLINENAME())) {
				if ("直销代售".equals(fiveLine.getPORTNAME())) {
					model.addAttribute("fiveLine1_4", fiveLine);
				}
			}

			// 社会渠道取值
			if ("社会渠道".equals(fiveLine.getLINENAME())) {
				if ("社会渠道整体".equals(fiveLine.getPORTNAME())) {
					model.addAttribute("fiveLine2_1", fiveLine);
				}
			}
			if ("社会渠道".equals(fiveLine.getLINENAME())) {
				if ("WKA".equals(fiveLine.getPORTNAME())) {
					model.addAttribute("fiveLine2_2", fiveLine);
				}
			}
			if ("社会渠道".equals(fiveLine.getLINENAME())) {
				if ("KA".equals(fiveLine.getPORTNAME())) {
					model.addAttribute("fiveLine2_3", fiveLine);
				}
			}
			if ("社会渠道".equals(fiveLine.getLINENAME())) {
				if ("中小客户".equals(fiveLine.getPORTNAME())) {
					model.addAttribute("fiveLine2_4", fiveLine);
				}
			}
			// 电商渠道取值
			if ("电商渠道".equals(fiveLine.getLINENAME())) {
				if ("外呼".equals(fiveLine.getPORTNAME())) {
					model.addAttribute("fiveLine3_1", fiveLine);
				}
			}
			// 家庭政企取值
			if ("家庭政企".equals(fiveLine.getLINENAME())) {
				if ("家庭政企".equals(fiveLine.getPORTNAME())) {
					model.addAttribute("fiveLine4_1", fiveLine);
				}
			}
			// 零售售后取值
			if ("零售售后".equals(fiveLine.getLINENAME())) {
				if ("零售售后整体".equals(fiveLine.getPORTNAME())) {
					model.addAttribute("fiveLine5_1", fiveLine);
				}
			}

			if ("零售售后".equals(fiveLine.getLINENAME())) {
				if ("零售".equals(fiveLine.getPORTNAME())) {
					model.addAttribute("fiveLine5_2", fiveLine);
				}
			}
			if ("零售售后".equals(fiveLine.getLINENAME())) {
				if ("售后".equals(fiveLine.getPORTNAME())) {
					model.addAttribute("fiveLine5_3", fiveLine);
				}
			}
			// 铁通取值

			if ("铁通".equals(fiveLine.getLINENAME())) {
				if ("铁通".equals(fiveLine.getPORTNAME())) {
					model.addAttribute("fiveLine6_1", fiveLine);
				}
			}

		}
		return "brandRangeSet/parameterSeted";
	}

	// 生命周期数据回显到页面
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/addAndUpdateLifeDate", method = RequestMethod.POST)
	public Map<String, Object> addAndUpdateLifeDate(Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("customerChannel  {}.", locale);

		String brand = request.getParameter("brand");
		String spec = request.getParameter("spec");
		String CYCLE = request.getParameter("CYCLE");
		@SuppressWarnings("unused")
		String city = request.getParameter("AREANAME");
		Map<String, Object> map = new HashMap<String, Object>();
		// 生命周期数据
		LifeDate addAndUpdate = lifeDateService.selectAddAndUpdate(brand, spec, CYCLE);

		// model.addAttribute("brand", brand);
		// model.addAttribute("spec", spec);
		// model.addAttribute("CYCLE", CYCLE);
		// model.addAttribute("lifeDate", addAndUpdate);
		// return "brandRangeSet/parameterSetedUpdateAndAdd";
		// map.put("brand", brand);
		// map.put("spec", spec);
		// map.put("CYCLE", CYCLE);
		map.put("lifeDate", addAndUpdate);
		// map.put("cityDate", cityDate);
		return map;

	}

	// 城市维度规划数据回显到页面
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/cityShow", method = RequestMethod.POST)
	public Map<String, Object> cityShowAndSet(Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("customerChannel  {}.", locale);

		String brand = request.getParameter("brand");
		String spec = request.getParameter("spec");
		String city = request.getParameter("AREANAME");
		Map<String, Object> map = new HashMap<String, Object>();

		// 城市维度数据
		CityDate cityDateLife = cityDateService.selectCiteDate(brand, spec, city);

		map.put("cityDateBreak", cityDateLife);
		return map;

	}

	// 五线七口表数据回显到页面

	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/fineAndSavenShow", method = RequestMethod.POST)
	public Map<String, Object> fineShowAndSet(FiveLine fineLine, Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("customerChannel  {}.", locale);
		System.err.println(fineLine.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		String brand = request.getParameter("brand");
		String spec = request.getParameter("spec");
		String lineName = request.getParameter("lineName");
		String portName = request.getParameter("portName");

		// 根据五线七口查询数据
		FiveLine fiveAndLine = fiveLineService.selectFine(brand, spec, lineName, portName);

		map.put("fiveAndLine", fiveAndLine);

		return map;

	}

	// 对生命周期表进行更新和增加的操作
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/addAndUpdateLifeDate1", method = RequestMethod.POST)
	public int addAndUpdateLifeDate1(LifeDate lifeDate, Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("customerChannel  {}.", locale);
		System.err.println(lifeDate);
		String CYCLE = lifeDate.getCYCLE();
		int sum = 0;
		ProductInformationSetMajor pm = new ProductInformationSetMajor();
		try {
			LifeDate addAndUpdate = lifeDateService.selectAddAndUpdate(lifeDate.getBRANDNAME(), lifeDate.getSPEC(),
					CYCLE);
			if (addAndUpdate == null) {
				// 添加
				@SuppressWarnings("unused")
				int insertLifeDate = lifeDateService.insertLifeDate(lifeDate);
				// 对所属品牌型号的销量等数据进行汇总
				// LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(),
				// lifeDate.getSPEC());
				// System.out.println(total.toString());

				LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
			//	System.out.println(total.toString());
				float saleamount = total.getSALEAMOUNT();
				float income = total.getINCOME();
				float maori = total.getMAORI();
				float share = total.getSHARE();
				float overamount = total.getOVERAMOUNT();
				float turnovertime = total.getTURNOVERTIME();
				pm.setBRANDNAME(lifeDate.getBRANDNAME());
				pm.setSPEC(lifeDate.getSPEC());
				pm.setTOTALSALEAMOUNT(saleamount);
				pm.setTOTALINCOME(income);
				pm.setTOTALMAORI(maori);
				pm.setTOTALSHARE(share);
				pm.setTOTALOVERAMOUNT(overamount);
				pm.setTOTALTURNOVERTIME(turnovertime);
				// 根据品牌和型号进行更新到总设置表的操作
				int updateToatal = productInformationSetMajorService.updateToatal(pm);

				System.err.println(updateToatal);
				sum = 1;

			}
			if (addAndUpdate != null) {
				// 修改

				@SuppressWarnings("unused")
				int updateLifeDate = lifeDateService.updateLifeDate(lifeDate);

				LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
				float saleamount = total.getSALEAMOUNT();
				float income = total.getINCOME();
				float maori = total.getMAORI();
				float share = total.getSHARE();
				float overamount = total.getOVERAMOUNT();
				float turnovertime = total.getTURNOVERTIME();
				pm.setBRANDNAME(lifeDate.getBRANDNAME());
				pm.setSPEC(lifeDate.getSPEC());
				pm.setTOTALSALEAMOUNT(saleamount);
				pm.setTOTALINCOME(income);
				pm.setTOTALMAORI(maori);
				pm.setTOTALSHARE(share);
				pm.setTOTALOVERAMOUNT(overamount);
				pm.setTOTALTURNOVERTIME(turnovertime);
				// 根据品牌和型号进行更新到总设置表的操作
				int updateToatal = productInformationSetMajorService.updateToatal(pm);

				System.err.println(updateToatal);

				sum = 2;
			}

		} catch (Exception e) // Exception 为最大的异常
		{

		}

		return sum;

	}

	// 五线七口更新和增加的操作
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/addUpdateFineDate", method = RequestMethod.POST)
	public int addAndUpdateCity(FiveLine fineLine, Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("customerChannel  {}.", locale);
		System.err.println(fineLine);
		String brand = fineLine.getBRANDNAME();
		String spec = fineLine.getSPEC();
		String lineName = fineLine.getLINENAME();
		String portName = fineLine.getPORTNAME();
		int sum = 0;

		FiveLine fiveAndLine = fiveLineService.selectFine(brand, spec, lineName, portName);

		if (fiveAndLine == null) {

			@SuppressWarnings("unused")
			int i = fiveLineService.insertFiveLine(fineLine);
			sum = 1;

		}
		if (fiveAndLine != null) {
			@SuppressWarnings("unused")
			int date = fiveLineService.updateFiveLine(fineLine);
			sum = 2;
		}

		return sum;
	}

	// 城市维度规划更新和增加的操作
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/addAndUpdateCityDate", method = RequestMethod.POST)
	public int addAndUpdateFine(CityDate cityDate, Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("customerChannel  {}.", locale);
		System.err.println(cityDate);
		String city = cityDate.getAREANAME();
		String spec = cityDate.getSPEC();
		String brand = cityDate.getBRANDNAME();
		int sum = 0;
		CityDate oneCityDate = cityDateService.selectCiteDate(brand, spec, city);

		if (oneCityDate == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDate(cityDate);
			sum = 1;

		}
		if (oneCityDate != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDate(cityDate);
			sum = 2;

		}

		return sum;
	}

	// 生命周期数据回显到页面
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/addAndUpdateLifeDateNew", method = RequestMethod.POST)
	public Map<String, Object> addAndUpdateLifeDateNew(Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("customerChannel  {}.", locale);

		String brand = request.getParameter("brand");
		String spec = request.getParameter("spec");
		String obj = request.getParameter("obj");
		// String CYCLE = request.getParameter("CYCLE");
		@SuppressWarnings("unused")
		String city = request.getParameter("AREANAME");
		Map<String, Object> map = new HashMap<String, Object>();
		// 生命周期数据
		List<LifeDateS> selectBrandAndSpec = lifeDateService.selectBrandAndSpec(brand, spec);
		map.put("lifeDate", selectBrandAndSpec);
		map.put("obj", obj);
		return map;

	}

	// 对生命周期表整列进行更新和增加的操作
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/addAndUpdateNew", method = RequestMethod.POST)
	public int addAndUpdateLifeDateNew(LifeDate lifeDate, Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("customerChannel  {}.", locale);
		LifeDate lifeDate1 = new LifeDate();
		LifeDate lifeDate2 = new LifeDate();
		LifeDate lifeDate3 = new LifeDate();
		LifeDate lifeDate4 = new LifeDate();
		// System.err.println(lifeDate);
		// String CYCLE=lifeDate.getCYCLE();
		String CYCLE1 = request.getParameter("CYCLE1");
		String CYCLE2 = request.getParameter("CYCLE2");
		String CYCLE3 = request.getParameter("CYCLE3");
		String CYCLE4 = request.getParameter("CYCLE4");
		String DURATION1 = request.getParameter("DURATION1");
		String DURATION2 = request.getParameter("DURATION2");
		String DURATION3 = request.getParameter("DURATION3");
		String DURATION4 = request.getParameter("DURATION4");
		String obj = request.getParameter("obj");
		if (obj.equals("1")) {
			if (DURATION1 != "") {
				int a = Integer.parseInt(DURATION1);
				lifeDate1.setDURATION(a);
			}
			if (DURATION2 != "") {
				int b = Integer.parseInt(DURATION2);
				lifeDate2.setDURATION(b);
			}
			if (DURATION3 != "") {
				int c = Integer.parseInt(DURATION3);
				lifeDate3.setDURATION(c);
			}
			if (DURATION4 != "") {
				int d = Integer.parseInt(DURATION4);
				lifeDate4.setDURATION(d);
			}
		}
		if (obj.equals("2")) {
			if (DURATION1 != "") {
				Float a = Float.parseFloat(DURATION1);
				lifeDate1.setSALEAMOUNT(a);
			}
			if (DURATION2 != "") {
				Float b = Float.parseFloat(DURATION2);
				lifeDate2.setSALEAMOUNT(b);
			}
			if (DURATION3 != "") {
				Float c = Float.parseFloat(DURATION3);
				lifeDate3.setSALEAMOUNT(c);
			}
			if (DURATION4 != "") {
				Float d = Float.parseFloat(DURATION4);
				lifeDate4.setSALEAMOUNT(d);
			}
		}
		if (obj.equals("3")) {
			if (DURATION1 != "") {
				Float a = Float.parseFloat(DURATION1);
				lifeDate1.setINCOME(a);
			}
			if (DURATION2 != "") {
				Float b = Float.parseFloat(DURATION2);
				lifeDate2.setINCOME(b);
			}
			if (DURATION3 != "") {
				Float c = Float.parseFloat(DURATION3);
				lifeDate3.setINCOME(c);
			}
			if (DURATION4 != "") {
				Float d = Float.parseFloat(DURATION4);
				lifeDate4.setINCOME(d);
			}
		}
		if (obj.equals("4")) {
			if (DURATION1 != "") {
				Float a = Float.parseFloat(DURATION1);
				lifeDate1.setMAORI(a);
			}
			if (DURATION2 != "") {
				Float b = Float.parseFloat(DURATION2);
				lifeDate2.setMAORI(b);
			}
			if (DURATION3 != "") {
				Float c = Float.parseFloat(DURATION3);
				lifeDate3.setMAORI(c);
			}
			if (DURATION4 != "") {
				Float d = Float.parseFloat(DURATION4);
				lifeDate4.setMAORI(d);
			}
		}
		if (obj.equals("5")) {
			if (DURATION1 != "") {
				Float a = Float.parseFloat(DURATION1);
				lifeDate1.setOVERAMOUNT(a);
			}
			if (DURATION2 != "") {
				Float b = Float.parseFloat(DURATION2);
				lifeDate2.setOVERAMOUNT(b);
			}
			if (DURATION3 != "") {
				Float c = Float.parseFloat(DURATION3);
				lifeDate3.setOVERAMOUNT(c);
			}
			if (DURATION4 != "") {
				Float d = Float.parseFloat(DURATION4);
				lifeDate4.setOVERAMOUNT(d);
			}
		}
		if (obj.equals("6")) {
			if (DURATION1 != "") {
				Float a = Float.parseFloat(DURATION1);
				lifeDate1.setSHARE(a);
			}
			if (DURATION2 != "") {
				Float b = Float.parseFloat(DURATION2);
				lifeDate2.setSHARE(b);
			}
			if (DURATION3 != "") {
				Float c = Float.parseFloat(DURATION3);
				lifeDate3.setSHARE(c);
			}
			if (DURATION4 != "") {
				Float d = Float.parseFloat(DURATION4);
				lifeDate4.setSHARE(d);
			}
		}
		if (obj.equals("7")) {
			if (DURATION1 != "") {
				Float a = Float.parseFloat(DURATION1);
				lifeDate1.setTURNOVERTIME(a);
			}
			if (DURATION2 != "") {
				Float b = Float.parseFloat(DURATION2);
				lifeDate2.setTURNOVERTIME(b);
			}
			if (DURATION3 != "") {
				Float c = Float.parseFloat(DURATION3);
				lifeDate3.setTURNOVERTIME(c);
			}
			if (DURATION4 != "") {
				Float d = Float.parseFloat(DURATION4);
				lifeDate4.setTURNOVERTIME(d);
			}
		}
		lifeDate1.setCYCLE(CYCLE1);
		lifeDate1.setBRANDNAME(lifeDate.getBRANDNAME());
		lifeDate1.setSPEC(lifeDate.getSPEC());
		lifeDate2.setCYCLE(CYCLE2);
		lifeDate2.setBRANDNAME(lifeDate.getBRANDNAME());
		lifeDate2.setSPEC(lifeDate.getSPEC());
		lifeDate3.setCYCLE(CYCLE3);
		lifeDate3.setBRANDNAME(lifeDate.getBRANDNAME());
		lifeDate3.setSPEC(lifeDate.getSPEC());
		lifeDate4.setCYCLE(CYCLE4);
		lifeDate4.setBRANDNAME(lifeDate.getBRANDNAME());
		lifeDate4.setSPEC(lifeDate.getSPEC());
		int sum = 0;
		ProductInformationSetMajor pm = new ProductInformationSetMajor();
		try {
			LifeDate addAndUpdate1 = lifeDateService.selectAddAndUpdate(lifeDate.getBRANDNAME(), lifeDate.getSPEC(),
					lifeDate1.getCYCLE());
			LifeDate addAndUpdate2 = lifeDateService.selectAddAndUpdate(lifeDate.getBRANDNAME(), lifeDate.getSPEC(),
					lifeDate2.getCYCLE());
			LifeDate addAndUpdate3 = lifeDateService.selectAddAndUpdate(lifeDate.getBRANDNAME(), lifeDate.getSPEC(),
					lifeDate3.getCYCLE());
			LifeDate addAndUpdate4 = lifeDateService.selectAddAndUpdate(lifeDate.getBRANDNAME(), lifeDate.getSPEC(),
					lifeDate4.getCYCLE());

			if (obj.equals("1")) {
				if (addAndUpdate1 == null) {
					// 添加
					@SuppressWarnings("unused")
					int insertLifeDate1 = lifeDateService.insertLifeDate(lifeDate1);
					if (insertLifeDate1 == 1) {
						sum = 1;

					}

				}
				if (addAndUpdate2 == null) {
					int insertLifeDate2 = lifeDateService.insertLifeDate(lifeDate2);
					if (insertLifeDate2 == 1) {
						sum = 1;

					}

				}
				if (addAndUpdate3 == null) {
					int insertLifeDate3 = lifeDateService.insertLifeDate(lifeDate3);
					if (insertLifeDate3 == 1) {
						sum = 1;

					}

				}
				if (addAndUpdate4 == null) {
					int insertLifeDate4 = lifeDateService.insertLifeDate(lifeDate4);
					if (insertLifeDate4 == 1) {
						sum = 1;

					}

				}
			}
			// 如果obj=2 说明是增加或者保存销量的操作
			if (obj.equals("2")) {
				if (addAndUpdate1 == null) {
					int insertLifeDate1 = lifeDateService.insertLifeDate(lifeDate1);
					if (insertLifeDate1 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float saleamount = total.getSALEAMOUNT();
					pm.setTOTALSALEAMOUNT(saleamount);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate2 == null) {
					int insertLifeDate2 = lifeDateService.insertLifeDate(lifeDate2);
					if (insertLifeDate2 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float saleamount = total.getSALEAMOUNT();
					pm.setTOTALSALEAMOUNT(saleamount);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate3 == null) {
					int insertLifeDate3 = lifeDateService.insertLifeDate(lifeDate3);
					if (insertLifeDate3 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float saleamount = total.getSALEAMOUNT();
					pm.setTOTALSALEAMOUNT(saleamount);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate4 == null) {
					int insertLifeDate4 = lifeDateService.insertLifeDate(lifeDate4);
					if (insertLifeDate4 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float saleamount = total.getSALEAMOUNT();
					pm.setTOTALSALEAMOUNT(saleamount);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}

			}
			// 若果obj=3 说明增加或者保存的是收入的操作
			if (obj.equals("3")) {
				if (addAndUpdate1 == null) {
					int insertLifeDate1 = lifeDateService.insertLifeDate(lifeDate1);
					if (insertLifeDate1 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float income = total.getINCOME();
					pm.setTOTALINCOME(income);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate2 == null) {
					int insertLifeDate2 = lifeDateService.insertLifeDate(lifeDate2);
					if (insertLifeDate2 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float income = total.getINCOME();
					pm.setTOTALINCOME(income);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate3 == null) {
					int insertLifeDate3 = lifeDateService.insertLifeDate(lifeDate3);
					if (insertLifeDate3 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float income = total.getINCOME();
					pm.setTOTALINCOME(income);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate4 == null) {
					int insertLifeDate4 = lifeDateService.insertLifeDate(lifeDate4);
					if (insertLifeDate4 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float income = total.getINCOME();
					pm.setTOTALINCOME(income);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}

			}

			// 若果obj=3 说明增加或者保存的是毛利的操作
			if (obj.equals("4")) {
				if (addAndUpdate1 == null) {
					int insertLifeDate1 = lifeDateService.insertLifeDate(lifeDate1);
					if (insertLifeDate1 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float maori = total.getMAORI();
					pm.setTOTALMAORI(maori);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate2 == null) {
					int insertLifeDate2 = lifeDateService.insertLifeDate(lifeDate2);
					if (insertLifeDate2 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float maori = total.getMAORI();
					pm.setTOTALMAORI(maori);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate3 == null) {
					int insertLifeDate3 = lifeDateService.insertLifeDate(lifeDate3);
					if (insertLifeDate3 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float maori = total.getMAORI();
					pm.setTOTALMAORI(maori);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate4 == null) {
					int insertLifeDate4 = lifeDateService.insertLifeDate(lifeDate4);
					if (insertLifeDate4 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float maori = total.getMAORI();
					pm.setTOTALMAORI(maori);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}

			}
			// 若果obj=3 说明增加或者保存的是覆盖的操作

			if (obj.equals("5")) {
				if (addAndUpdate1 == null) {
					int insertLifeDate1 = lifeDateService.insertLifeDate(lifeDate1);
					if (insertLifeDate1 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float overamount = total.getOVERAMOUNT();
					pm.setTOTALOVERAMOUNT(overamount);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate2 == null) {
					int insertLifeDate2 = lifeDateService.insertLifeDate(lifeDate2);
					if (insertLifeDate2 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float overamount = total.getOVERAMOUNT();
					pm.setTOTALOVERAMOUNT(overamount);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate3 == null) {
					int insertLifeDate3 = lifeDateService.insertLifeDate(lifeDate3);
					if (insertLifeDate3 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float overamount = total.getOVERAMOUNT();
					pm.setTOTALOVERAMOUNT(overamount);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate4 == null) {
					int insertLifeDate4 = lifeDateService.insertLifeDate(lifeDate4);
					if (insertLifeDate4 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float overamount = total.getOVERAMOUNT();
					pm.setTOTALOVERAMOUNT(overamount);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}

			}
			if (obj.equals("6")) {
				if (addAndUpdate1 == null) {
					int insertLifeDate1 = lifeDateService.insertLifeDate(lifeDate1);
					if (insertLifeDate1 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float share = total.getSHARE();
					pm.setTOTALSHARE(share);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate2 == null) {
					int insertLifeDate2 = lifeDateService.insertLifeDate(lifeDate2);
					if (insertLifeDate2 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float share = total.getSHARE();
					pm.setTOTALSHARE(share);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate3 == null) {
					int insertLifeDate3 = lifeDateService.insertLifeDate(lifeDate3);
					if (insertLifeDate3 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float share = total.getSHARE();
					pm.setTOTALSHARE(share);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate4 == null) {
					int insertLifeDate4 = lifeDateService.insertLifeDate(lifeDate4);
					if (insertLifeDate4 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float share = total.getSHARE();
					pm.setTOTALSHARE(share);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}

			}
			if (obj.equals("7")) {
				if (addAndUpdate1 == null) {
					int insertLifeDate1 = lifeDateService.insertLifeDate(lifeDate1);
					if (insertLifeDate1 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float turnovertime = total.getTURNOVERTIME();
					pm.setTOTALTURNOVERTIME(turnovertime);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate2 == null) {
					int insertLifeDate2 = lifeDateService.insertLifeDate(lifeDate2);
					if (insertLifeDate2 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float turnovertime = total.getTURNOVERTIME();
					pm.setTOTALTURNOVERTIME(turnovertime);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate3 == null) {
					int insertLifeDate3 = lifeDateService.insertLifeDate(lifeDate3);
					if (insertLifeDate3 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float turnovertime = total.getTURNOVERTIME();
					pm.setTOTALTURNOVERTIME(turnovertime);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate4 == null) {
					int insertLifeDate4 = lifeDateService.insertLifeDate(lifeDate4);
					if (insertLifeDate4 == 1) {
						sum = 1;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float turnovertime = total.getTURNOVERTIME();
					pm.setTOTALTURNOVERTIME(turnovertime);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}

			}
			// 更新生命周期的周数
			if (obj.equals("1")) {
				if (addAndUpdate1 != null) {
					// 修改

					@SuppressWarnings("unused")
					int updateLifeDate1 = lifeDateService.updateLifeDate(lifeDate1);
					if (updateLifeDate1 == 1) {
						sum = 2;

					}

				}
				if (addAndUpdate2 != null) {
					// 修改

					@SuppressWarnings("unused")
					int updateLifeDate2 = lifeDateService.updateLifeDate(lifeDate2);
					if (updateLifeDate2 == 1) {
						sum = 2;

					}

				}
				if (addAndUpdate3 != null) {
					// 修改

					@SuppressWarnings("unused")
					int updateLifeDate3 = lifeDateService.updateLifeDate(lifeDate3);

					if (updateLifeDate3 == 1) {
						sum = 2;

					}
				}
				if (addAndUpdate4 != null) {
					// 修改

					@SuppressWarnings("unused")
					int updateLifeDate4 = lifeDateService.updateLifeDate(lifeDate4);

					if (updateLifeDate4 == 1) {
						sum = 2;

					}
				}

			}
			// 更新销量
			if (obj.equals("2")) {
				if (addAndUpdate1 != null) {
					int updateLifeDate1 = lifeDateService.updateLifeDate(lifeDate1);
					if (updateLifeDate1 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float saleamount = total.getSALEAMOUNT();
					double d = saleamount;
					pm.setTOTALSALEAMOUNT(d);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate2 != null) {
					int updateLifeDate2 = lifeDateService.updateLifeDate(lifeDate2);
					if (updateLifeDate2 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float saleamount = total.getSALEAMOUNT();
					pm.setTOTALSALEAMOUNT(saleamount);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate3 != null) {
					int updateLifeDate3 = lifeDateService.updateLifeDate(lifeDate3);
					if (updateLifeDate3 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float saleamount = total.getSALEAMOUNT();
					pm.setTOTALSALEAMOUNT(saleamount);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate4 != null) {
					int updateLifeDate4 = lifeDateService.updateLifeDate(lifeDate4);
					if (updateLifeDate4 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float saleamount = total.getSALEAMOUNT();
					pm.setTOTALSALEAMOUNT(saleamount);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}

			}
			// 若果obj=3 说明增加或者保存的是收入的操作
			if (obj.equals("3")) {
				if (addAndUpdate1 != null) {
					int updateLifeDate1 = lifeDateService.updateLifeDate(lifeDate1);
					if (updateLifeDate1 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float income = total.getINCOME();
					pm.setTOTALINCOME(income);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate2 != null) {
					int updateLifeDate2 = lifeDateService.updateLifeDate(lifeDate2);
					if (updateLifeDate2 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float income = total.getINCOME();
					pm.setTOTALINCOME(income);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate3 != null) {
					int updateLifeDate3 = lifeDateService.updateLifeDate(lifeDate3);
					if (updateLifeDate3 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float income = total.getINCOME();
					pm.setTOTALINCOME(income);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate4 != null) {
					int updateLifeDate4 = lifeDateService.updateLifeDate(lifeDate4);
					if (updateLifeDate4 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float income = total.getINCOME();
					pm.setTOTALINCOME(income);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}

			}

			// 若果obj=3 说明增加或者保存的是毛利的操作
			if (obj.equals("4")) {
				if (addAndUpdate1 != null) {
					int updateLifeDate1 = lifeDateService.updateLifeDate(lifeDate1);
					if (updateLifeDate1 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float maori = total.getMAORI();
					pm.setTOTALMAORI(maori);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate2 != null) {
					int updateLifeDate2 = lifeDateService.updateLifeDate(lifeDate2);
					if (updateLifeDate2 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float maori = total.getMAORI();
					pm.setTOTALMAORI(maori);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate3 != null) {
					int updateLifeDate3 = lifeDateService.updateLifeDate(lifeDate3);
					if (updateLifeDate3 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float maori = total.getMAORI();
					pm.setTOTALMAORI(maori);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate4 != null) {
					int updateLifeDate4 = lifeDateService.updateLifeDate(lifeDate4);
					if (updateLifeDate4 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float maori = total.getMAORI();
					pm.setTOTALMAORI(maori);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}

			}
			// 若果obj=3 说明增加或者保存的是覆盖的操作

			if (obj.equals("5")) {
				if (addAndUpdate1 != null) {
					int updateLifeDate1 = lifeDateService.updateLifeDate(lifeDate1);
					if (updateLifeDate1 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float overamount = total.getOVERAMOUNT();
					pm.setTOTALOVERAMOUNT(overamount);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate2 != null) {
					int updateLifeDate2 = lifeDateService.updateLifeDate(lifeDate2);
					if (updateLifeDate2 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float overamount = total.getOVERAMOUNT();
					pm.setTOTALOVERAMOUNT(overamount);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate3 != null) {
					int updateLifeDate3 = lifeDateService.updateLifeDate(lifeDate3);
					if (updateLifeDate3 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float overamount = total.getOVERAMOUNT();
					pm.setTOTALOVERAMOUNT(overamount);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate4 != null) {
					int updateLifeDate4 = lifeDateService.updateLifeDate(lifeDate4);
					if (updateLifeDate4 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float overamount = total.getOVERAMOUNT();
					pm.setTOTALOVERAMOUNT(overamount);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}

			}
			if (obj.equals("6")) {
				if (addAndUpdate1 != null) {
					int updateLifeDate1 = lifeDateService.updateLifeDate(lifeDate1);
					if (updateLifeDate1 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float share = total.getSHARE();
					pm.setTOTALSHARE(share);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate2 != null) {
					int updateLifeDate2 = lifeDateService.updateLifeDate(lifeDate2);
					if (updateLifeDate2 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float share = total.getSHARE();
					pm.setTOTALSHARE(share);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate3 != null) {
					int updateLifeDate3 = lifeDateService.updateLifeDate(lifeDate3);
					if (updateLifeDate3 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float share = total.getSHARE();
					pm.setTOTALSHARE(share);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate4 != null) {
					int updateLifeDate4 = lifeDateService.updateLifeDate(lifeDate4);
					if (updateLifeDate4 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float share = total.getSHARE();
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					pm.setTOTALSHARE(share);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}

			}
			if (obj.equals("7")) {
				if (addAndUpdate1 != null) {
					int updateLifeDate1 = lifeDateService.updateLifeDate(lifeDate1);
					if (updateLifeDate1 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float turnovertime = total.getTURNOVERTIME();
					pm.setTOTALTURNOVERTIME(turnovertime);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate2 != null) {
					int updateLifeDate2 = lifeDateService.updateLifeDate(lifeDate2);
					if (updateLifeDate2 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float turnovertime = total.getTURNOVERTIME();
					pm.setTOTALTURNOVERTIME(turnovertime);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate3 != null) {
					int updateLifeDate3 = lifeDateService.updateLifeDate(lifeDate3);
					if (updateLifeDate3 == 1) {
						sum = 2;

					}
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float turnovertime = total.getTURNOVERTIME();
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					pm.setTOTALTURNOVERTIME(turnovertime);
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}
				if (addAndUpdate4 != null) {
					int updateLifeDate4 = lifeDateService.updateLifeDate(lifeDate4);
					if (updateLifeDate4 == 1) {
						sum = 2;

					}
					// 将修改后的数据同步到产品信息总表中
					LifeDate total = lifeDateService.selectTotal(lifeDate.getBRANDNAME(), lifeDate.getSPEC());
					float turnovertime = total.getTURNOVERTIME();
					pm.setTOTALTURNOVERTIME(turnovertime);
					pm.setBRANDNAME(lifeDate.getBRANDNAME());
					pm.setSPEC(lifeDate.getSPEC());
					// 根据品牌和型号进行更新到总设置表的操作
					int updateToatal = productInformationSetMajorService.updateToatal(pm);

				}

			}

		} catch (Exception e) // Exception 为最大的异常
		{

		}

		return sum;

	}

	// 城市维度规划更新和增加的操作
	@SuppressWarnings("null")
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/addAndUpdateCityDateNew", method = RequestMethod.POST)
	public int addAndUpdateFineNew(CityDate cityDate, Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("customerChannel  {}.", locale);

		String brand = request.getParameter("BRANDNAME");
		String spec = request.getParameter("SPEC");
		String AREANAME_GZ = request.getParameter("AREANAME_GZ");
		String SALEAMOUNTS_GZ = request.getParameter("SALEAMOUNTS_GZ");
		String AREANAME_ZQ = request.getParameter("AREANAME_ZQ");
		String SALEAMOUNTS_ZQ = request.getParameter("SALEAMOUNTS_ZQ");
//		String INCOMES_GZ = request.getParameter("INCOMES_GZ");
//		String OVERAMOUNTS_GZ = request.getParameter("OVERAMOUNTS_GZ");
		//String INCOMES_ZQ = request.getParameter("INCOMES_ZQ");
		//String OVERAMOUNTS_ZQ = request.getParameter("OVERAMOUNTS_ZQ");

		String AREANAME_QY = request.getParameter("AREANAME_QY");
		String SALEAMOUNTS_QY = request.getParameter("SALEAMOUNTS_QY");
		//String INCOMES_QY = request.getParameter("INCOMES_QY");
		//String OVERAMOUNTS_QY = request.getParameter("OVERAMOUNTS_QY");

		String AREANAME_SG = request.getParameter("AREANAME_SG");
		String SALEAMOUNTS_SG = request.getParameter("SALEAMOUNTS_SG");
		//String INCOMES_SG = request.getParameter("INCOMES_SG");
		//String OVERAMOUNTS_SG = request.getParameter("OVERAMOUNTS_SG");

		String AREANAME_YF = request.getParameter("AREANAME_YF");
		String SALEAMOUNTS_YF = request.getParameter("SALEAMOUNTS_YF");
		//String INCOMES_YF = request.getParameter("INCOMES_YF");
		//String OVERAMOUNTS_YF = request.getParameter("OVERAMOUNTS_YF");

		String AREANAME_SZ = request.getParameter("AREANAME_SZ");
		String SALEAMOUNTS_SZ = request.getParameter("SALEAMOUNTS_SZ");
		//String INCOMES_SZ = request.getParameter("INCOMES_SZ");
		// OVERAMOUNTS_SZ = request.getParameter("OVERAMOUNTS_SZ");

		String AREANAME_ST = request.getParameter("AREANAME_ST");
		String SALEAMOUNTS_ST = request.getParameter("SALEAMOUNTS_ST");
		//String INCOMES_ST = request.getParameter("INCOMES_ST");
		//String OVERAMOUNTS_ST = request.getParameter("OVERAMOUNTS_ST");

		String AREANAME_JY = request.getParameter("AREANAME_JY");
		String SALEAMOUNTS_JY = request.getParameter("SALEAMOUNTS_JY");
		//String INCOMES_JY = request.getParameter("INCOMES_JY");
		// OVERAMOUNTS_JY = request.getParameter("OVERAMOUNTS_JY");

		String AREANAME_MZ = request.getParameter("AREANAME_MZ");
		String SALEAMOUNTS_MZ = request.getParameter("SALEAMOUNTS_MZ");
		//String INCOMES_MZ = request.getParameter("INCOMES_MZ");
		//String OVERAMOUNTS_MZ = request.getParameter("OVERAMOUNTS_MZ");

		String AREANAME_CZ = request.getParameter("AREANAME_CZ");
		String SALEAMOUNTS_CZ = request.getParameter("SALEAMOUNTS_CZ");
		//String INCOMES_CZ = request.getParameter("INCOMES_CZ");
		//String OVERAMOUNTS_CZ = request.getParameter("OVERAMOUNTS_CZ");

		String AREANAME_SW = request.getParameter("AREANAME_SW");
		String SALEAMOUNTS_SW = request.getParameter("SALEAMOUNTS_SW");
		//String INCOMES_SW = request.getParameter("INCOMES_SW");
		//String OVERAMOUNTS_SW = request.getParameter("OVERAMOUNTS_SW");

		String AREANAME_DG = request.getParameter("AREANAME_DG");
		String SALEAMOUNTS_DG = request.getParameter("SALEAMOUNTS_DG");
		//String INCOMES_DG = request.getParameter("INCOMES_DG");
		//String OVERAMOUNTS_DG = request.getParameter("OVERAMOUNTS_DG");

		String AREANAME_ZS = request.getParameter("AREANAME_ZS");
		String SALEAMOUNTS_ZS = request.getParameter("SALEAMOUNTS_ZS");
		//String INCOMES_ZS = request.getParameter("INCOMES_ZS");
		//String OVERAMOUNTS_ZS = request.getParameter("OVERAMOUNTS_ZS");

		String AREANAME_HZ = request.getParameter("AREANAME_HZ");
		String SALEAMOUNTS_HZ = request.getParameter("SALEAMOUNTS_HZ");
		//String INCOMES_HZ = request.getParameter("INCOMES_HZ");
		//String OVERAMOUNTS_HZ = request.getParameter("OVERAMOUNTS_HZ");

		String AREANAME_ZH = request.getParameter("AREANAME_ZH");
		String SALEAMOUNTS_ZH = request.getParameter("SALEAMOUNTS_ZH");
		//String INCOMES_ZH = request.getParameter("INCOMES_ZH");
		//String OVERAMOUNTS_ZH = request.getParameter("OVERAMOUNTS_ZH");

		String AREANAME_HY = request.getParameter("AREANAME_HY");
		String SALEAMOUNTS_HY = request.getParameter("SALEAMOUNTS_HY");
		//String INCOMES_HY = request.getParameter("INCOMES_HY");
		//String OVERAMOUNTS_HY = request.getParameter("OVERAMOUNTS_HY");

		String AREANAME_FS = request.getParameter("AREANAME_FS");
		String SALEAMOUNTS_FS = request.getParameter("SALEAMOUNTS_FS");
		//String INCOMES_FS = request.getParameter("INCOMES_FS");
		//String OVERAMOUNTS_FS = request.getParameter("OVERAMOUNTS_FS");

		String AREANAME_JM = request.getParameter("AREANAME_JM");
		String SALEAMOUNTS_JM = request.getParameter("SALEAMOUNTS_JM");
		//String INCOMES_JM = request.getParameter("INCOMES_JM");
		//String OVERAMOUNTS_JM = request.getParameter("OVERAMOUNTS_JM");

		String AREANAME_ZJ = request.getParameter("AREANAME_ZJ");
		String SALEAMOUNTS_ZJ = request.getParameter("SALEAMOUNTS_ZJ");
		//String INCOMES_ZJ = request.getParameter("INCOMES_ZJ");
		//String OVERAMOUNTS_ZJ = request.getParameter("OVERAMOUNTS_ZJ");

		String AREANAME_MM = request.getParameter("AREANAME_MM");
		String SALEAMOUNTS_MM = request.getParameter("SALEAMOUNTS_MM");
		//String INCOMES_MM = request.getParameter("INCOMES_MM");
		//String OVERAMOUNTS_MM = request.getParameter("OVERAMOUNTS_MM");

		String AREANAME_YJ = request.getParameter("AREANAME_YJ");
		String SALEAMOUNTS_YJ = request.getParameter("SALEAMOUNTS_YJ");
		//String INCOMES_YJ = request.getParameter("INCOMES_YJ");
		//String OVERAMOUNTS_YJ = request.getParameter("OVERAMOUNTS_YJ");

		if (!"".equals(SALEAMOUNTS_GZ)) {
			// int start = Integer.parseInt(SALEAMOUNTS_GZ);
			// int i = Integer.valueOf(SALEAMOUNTS_GZ).intValue();
			float aa = Float.parseFloat(SALEAMOUNTS_GZ);

			cityDate.setSALEAMOUNTS(aa);
			cityDate.setAREANAME(AREANAME_GZ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);

		}
//		if (!"".equals(INCOMES_GZ)) {
//			float GZ = Float.parseFloat(INCOMES_GZ);
//			//int GZ = Integer.parseInt(INCOMES_GZ);
//			cityDate.setAREANAME(AREANAME_GZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_GZ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_GZ);
//			cityDate.setAREANAME(AREANAME_GZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}

		int sum = 0;
		CityDate oneCityDate = cityDateService.selectCiteDate(brand, spec, AREANAME_GZ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDate == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDate != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 肇庆
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_ZQ)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_ZQ);
			// int GZ = Integer.parseInt(SALEAMOUNTS_ZQ);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_ZQ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_ZQ)) {
//			float GZ = Float.parseFloat(INCOMES_ZQ);
//			cityDate.setAREANAME(AREANAME_ZQ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_ZQ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_ZQ);
//			cityDate.setAREANAME(AREANAME_ZQ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateZQ = cityDateService.selectCiteDate(brand, spec, AREANAME_ZQ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateZQ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateZQ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 清远
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_QY)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_QY);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_QY);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_QY)) {
//			float GZ = Float.parseFloat(INCOMES_QY);
//			cityDate.setAREANAME(AREANAME_QY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_QY)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_QY);
//			cityDate.setAREANAME(AREANAME_QY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateQY = cityDateService.selectCiteDate(brand, spec, AREANAME_QY);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateQY == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateQY != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 韶关
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_SG)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_SG);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_SG);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_SG)) {
//			float GZ = Float.parseFloat(INCOMES_SG);
//			cityDate.setAREANAME(AREANAME_SG);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_SG)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_SG);
//			cityDate.setAREANAME(AREANAME_SG);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateSG = cityDateService.selectCiteDate(brand, spec, AREANAME_SG);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateSG == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateSG != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 云浮
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_YF)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_YF);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_YF);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_YF)) {
//			float GZ = Float.parseFloat(INCOMES_YF);
//			cityDate.setAREANAME(AREANAME_YF);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_YF)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_YF);
//			cityDate.setAREANAME(AREANAME_YF);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateYF = cityDateService.selectCiteDate(brand, spec, AREANAME_YF);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateYF == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateYF != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 深圳
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_SZ)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_SZ);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_SZ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_SZ)) {
//			float GZ = Float.parseFloat(INCOMES_SZ);
//			cityDate.setAREANAME(AREANAME_SZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_SZ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_SZ);
//			cityDate.setAREANAME(AREANAME_SZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateSZ = cityDateService.selectCiteDate(brand, spec, AREANAME_SZ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateSZ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateSZ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 汕头
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_ST)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_ST);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_ST);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_ST)) {
//			float GZ = Float.parseFloat(INCOMES_ST);
//			cityDate.setAREANAME(AREANAME_ST);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_ST)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_ST);
//			cityDate.setAREANAME(AREANAME_ST);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateST = cityDateService.selectCiteDate(brand, spec, AREANAME_ST);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateST == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateST != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 揭阳
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_JY)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_JY);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_JY);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_JY)) {
//			float GZ = Float.parseFloat(INCOMES_JY);
//			cityDate.setAREANAME(AREANAME_JY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_JY)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_JY);
//			cityDate.setAREANAME(AREANAME_JY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateJY = cityDateService.selectCiteDate(brand, spec, AREANAME_JY);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateJY == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateJY != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 梅州
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_MZ)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_MZ);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_MZ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_MZ)) {
//			float GZ = Float.parseFloat(INCOMES_MZ);
//			cityDate.setAREANAME(AREANAME_MZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_MZ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_MZ);
//			cityDate.setAREANAME(AREANAME_MZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateMZ = cityDateService.selectCiteDate(brand, spec, AREANAME_MZ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateMZ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateMZ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 潮州
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_CZ)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_CZ);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_CZ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_CZ)) {
//			float GZ = Float.parseFloat(INCOMES_CZ);
//			cityDate.setAREANAME(AREANAME_CZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_CZ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_CZ);
//			cityDate.setAREANAME(AREANAME_CZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateCZ = cityDateService.selectCiteDate(brand, spec, AREANAME_CZ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateCZ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateCZ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 汕尾
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_SW)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_SW);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_SW);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_SW)) {
//			float GZ = Float.parseFloat(INCOMES_SW);
//			cityDate.setAREANAME(AREANAME_SW);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_SW)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_SW);
//			cityDate.setAREANAME(AREANAME_SW);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateSW = cityDateService.selectCiteDate(brand, spec, AREANAME_SW);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateSW == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateSW != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 东莞
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_DG)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_DG);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_DG);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_YF)) {
//			float GZ = Float.parseFloat(INCOMES_YF);
//			cityDate.setAREANAME(AREANAME_DG);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_DG)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_DG);
//			cityDate.setAREANAME(AREANAME_DG);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateDG = cityDateService.selectCiteDate(brand, spec, AREANAME_DG);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateDG == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateDG != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 中山
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_ZS)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_ZS);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_ZS);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_ZS)) {
//			float GZ = Float.parseFloat(INCOMES_ZS);
//			cityDate.setAREANAME(AREANAME_ZS);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_YF)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_ZS);
//			cityDate.setAREANAME(AREANAME_ZS);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateZS = cityDateService.selectCiteDate(brand, spec, AREANAME_ZS);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateZS == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateZS != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 惠州
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_HZ)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_HZ);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_HZ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_HZ)) {
//			float GZ = Float.parseFloat(INCOMES_HZ);
//			cityDate.setAREANAME(AREANAME_HZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_HZ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_HZ);
//			cityDate.setAREANAME(AREANAME_HZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateHZ = cityDateService.selectCiteDate(brand, spec, AREANAME_HZ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateHZ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateHZ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 珠海
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_ZH)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_ZH);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_ZH);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_ZH)) {
//			float GZ = Float.parseFloat(INCOMES_ZH);
//			cityDate.setAREANAME(AREANAME_ZH);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_ZH)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_ZH);
//			cityDate.setAREANAME(AREANAME_ZH);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateZH = cityDateService.selectCiteDate(brand, spec, AREANAME_ZH);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateZH == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateZH != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 河源
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_HY)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_HY);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_HY);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_HY)) {
//			float GZ = Float.parseFloat(INCOMES_HY);
//			cityDate.setAREANAME(AREANAME_HY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_HY)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_HY);
//			cityDate.setAREANAME(AREANAME_HY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateHY = cityDateService.selectCiteDate(brand, spec, AREANAME_HY);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateHY == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateHY != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 佛山
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_FS)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_FS);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_FS);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_FS)) {
//			float GZ = Float.parseFloat(INCOMES_FS);
//			cityDate.setAREANAME(AREANAME_FS);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_FS)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_FS);
//			cityDate.setAREANAME(AREANAME_FS);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateFS = cityDateService.selectCiteDate(brand, spec, AREANAME_FS);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateFS == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateFS != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 江门
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_JM)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_JM);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_JM);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_JM)) {
//			float GZ = Float.parseFloat(INCOMES_JM);
//			cityDate.setAREANAME(AREANAME_JM);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_JM)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_JM);
//			cityDate.setAREANAME(AREANAME_JM);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateJM = cityDateService.selectCiteDate(brand, spec, AREANAME_JM);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateJM == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateJM != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 湛江
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_ZJ)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_ZJ);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_ZJ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_ZJ)) {
//			float GZ = Float.parseFloat(INCOMES_ZJ);
//			cityDate.setAREANAME(AREANAME_ZJ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_ZJ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_ZJ);
//			cityDate.setAREANAME(AREANAME_ZJ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateZJ = cityDateService.selectCiteDate(brand, spec, AREANAME_ZJ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateZJ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateZJ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 茂名
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_MM)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_MM);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_MM);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_MM)) {
//			float GZ = Float.parseFloat(INCOMES_MM);
//			cityDate.setAREANAME(AREANAME_MM);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_MM)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_MM);
//			cityDate.setAREANAME(AREANAME_MM);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateMM = cityDateService.selectCiteDate(brand, spec, AREANAME_MM);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateMM == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateMM != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 阳江
		cityDate = new CityDate();
		if (!"".equals(SALEAMOUNTS_YJ)) {
			float GZ = Float.parseFloat(SALEAMOUNTS_YJ);
			cityDate.setSALEAMOUNTS(GZ);
			cityDate.setAREANAME(AREANAME_YJ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
		}
//		if (!"".equals(INCOMES_YJ)) {
//			float GZ = Float.parseFloat(INCOMES_YJ);
//			cityDate.setAREANAME(AREANAME_YJ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
//		if (!"".equals(OVERAMOUNTS_YJ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_YJ);
//			cityDate.setAREANAME(AREANAME_YJ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateYJ = cityDateService.selectCiteDate(brand, spec, AREANAME_YJ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateYJ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateYJ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateAmountXL(cityDate);
			sum = 2;

		}
		}
		return sum;
	}

	//城市维度更新收入的操作
	
	@SuppressWarnings("null")
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/addAndUpdateCityDateIncome", method = RequestMethod.POST)
	public int addAndUpdateIncome(CityDate cityDate, Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("customerChannel  {}.", locale);

		String brand = request.getParameter("BRANDNAME");
		String spec = request.getParameter("SPEC");
		String AREANAME_GZ = request.getParameter("AREANAME_GZ");
		//String SALEAMOUNTS_GZ = request.getParameter("SALEAMOUNTS_GZ");
		String AREANAME_ZQ = request.getParameter("AREANAME_ZQ");
		//String SALEAMOUNTS_ZQ = request.getParameter("SALEAMOUNTS_ZQ");
		String INCOMES_GZ = request.getParameter("INCOMES_GZ");
//		String OVERAMOUNTS_GZ = request.getParameter("OVERAMOUNTS_GZ");
		String INCOMES_ZQ = request.getParameter("INCOMES_ZQ");
		//String OVERAMOUNTS_ZQ = request.getParameter("OVERAMOUNTS_ZQ");

		String AREANAME_QY = request.getParameter("AREANAME_QY");
		//String SALEAMOUNTS_QY = request.getParameter("SALEAMOUNTS_QY");
		String INCOMES_QY = request.getParameter("INCOMES_QY");
		//String OVERAMOUNTS_QY = request.getParameter("OVERAMOUNTS_QY");

		String AREANAME_SG = request.getParameter("AREANAME_SG");
		//String SALEAMOUNTS_SG = request.getParameter("SALEAMOUNTS_SG");
		String INCOMES_SG = request.getParameter("INCOMES_SG");
		//String OVERAMOUNTS_SG = request.getParameter("OVERAMOUNTS_SG");

		String AREANAME_YF = request.getParameter("AREANAME_YF");
		//String SALEAMOUNTS_YF = request.getParameter("SALEAMOUNTS_YF");
		String INCOMES_YF = request.getParameter("INCOMES_YF");
		//String OVERAMOUNTS_YF = request.getParameter("OVERAMOUNTS_YF");

		String AREANAME_SZ = request.getParameter("AREANAME_SZ");
		//String SALEAMOUNTS_SZ = request.getParameter("SALEAMOUNTS_SZ");
		String INCOMES_SZ = request.getParameter("INCOMES_SZ");
		// OVERAMOUNTS_SZ = request.getParameter("OVERAMOUNTS_SZ");

		String AREANAME_ST = request.getParameter("AREANAME_ST");
		//String SALEAMOUNTS_ST = request.getParameter("SALEAMOUNTS_ST");
		String INCOMES_ST = request.getParameter("INCOMES_ST");
		//String OVERAMOUNTS_ST = request.getParameter("OVERAMOUNTS_ST");

		String AREANAME_JY = request.getParameter("AREANAME_JY");
		//String SALEAMOUNTS_JY = request.getParameter("SALEAMOUNTS_JY");
		String INCOMES_JY = request.getParameter("INCOMES_JY");
		// OVERAMOUNTS_JY = request.getParameter("OVERAMOUNTS_JY");

		String AREANAME_MZ = request.getParameter("AREANAME_MZ");
		//String SALEAMOUNTS_MZ = request.getParameter("SALEAMOUNTS_MZ");
		String INCOMES_MZ = request.getParameter("INCOMES_MZ");
		//String OVERAMOUNTS_MZ = request.getParameter("OVERAMOUNTS_MZ");

		String AREANAME_CZ = request.getParameter("AREANAME_CZ");
		//String SALEAMOUNTS_CZ = request.getParameter("SALEAMOUNTS_CZ");
		String INCOMES_CZ = request.getParameter("INCOMES_CZ");
		//String OVERAMOUNTS_CZ = request.getParameter("OVERAMOUNTS_CZ");

		String AREANAME_SW = request.getParameter("AREANAME_SW");
		//String SALEAMOUNTS_SW = request.getParameter("SALEAMOUNTS_SW");
		String INCOMES_SW = request.getParameter("INCOMES_SW");
		//String OVERAMOUNTS_SW = request.getParameter("OVERAMOUNTS_SW");

		String AREANAME_DG = request.getParameter("AREANAME_DG");
		//String SALEAMOUNTS_DG = request.getParameter("SALEAMOUNTS_DG");
		String INCOMES_DG = request.getParameter("INCOMES_DG");
		//String OVERAMOUNTS_DG = request.getParameter("OVERAMOUNTS_DG");

		String AREANAME_ZS = request.getParameter("AREANAME_ZS");
		//String SALEAMOUNTS_ZS = request.getParameter("SALEAMOUNTS_ZS");
		String INCOMES_ZS = request.getParameter("INCOMES_ZS");
		//String OVERAMOUNTS_ZS = request.getParameter("OVERAMOUNTS_ZS");

		String AREANAME_HZ = request.getParameter("AREANAME_HZ");
		//String SALEAMOUNTS_HZ = request.getParameter("SALEAMOUNTS_HZ");
		String INCOMES_HZ = request.getParameter("INCOMES_HZ");
		//String OVERAMOUNTS_HZ = request.getParameter("OVERAMOUNTS_HZ");

		String AREANAME_ZH = request.getParameter("AREANAME_ZH");
		//String SALEAMOUNTS_ZH = request.getParameter("SALEAMOUNTS_ZH");
		String INCOMES_ZH = request.getParameter("INCOMES_ZH");
		//String OVERAMOUNTS_ZH = request.getParameter("OVERAMOUNTS_ZH");

		String AREANAME_HY = request.getParameter("AREANAME_HY");
		//String SALEAMOUNTS_HY = request.getParameter("SALEAMOUNTS_HY");
		String INCOMES_HY = request.getParameter("INCOMES_HY");
		//String OVERAMOUNTS_HY = request.getParameter("OVERAMOUNTS_HY");

		String AREANAME_FS = request.getParameter("AREANAME_FS");
		//String SALEAMOUNTS_FS = request.getParameter("SALEAMOUNTS_FS");
		String INCOMES_FS = request.getParameter("INCOMES_FS");
		//String OVERAMOUNTS_FS = request.getParameter("OVERAMOUNTS_FS");

		String AREANAME_JM = request.getParameter("AREANAME_JM");
		//String SALEAMOUNTS_JM = request.getParameter("SALEAMOUNTS_JM");
		String INCOMES_JM = request.getParameter("INCOMES_JM");
		//String OVERAMOUNTS_JM = request.getParameter("OVERAMOUNTS_JM");

		String AREANAME_ZJ = request.getParameter("AREANAME_ZJ");
		//String SALEAMOUNTS_ZJ = request.getParameter("SALEAMOUNTS_ZJ");
		String INCOMES_ZJ = request.getParameter("INCOMES_ZJ");
		//String OVERAMOUNTS_ZJ = request.getParameter("OVERAMOUNTS_ZJ");

		String AREANAME_MM = request.getParameter("AREANAME_MM");
		//String SALEAMOUNTS_MM = request.getParameter("SALEAMOUNTS_MM");
		String INCOMES_MM = request.getParameter("INCOMES_MM");
		//String OVERAMOUNTS_MM = request.getParameter("OVERAMOUNTS_MM");

		String AREANAME_YJ = request.getParameter("AREANAME_YJ");
		//String SALEAMOUNTS_YJ = request.getParameter("SALEAMOUNTS_YJ");
		String INCOMES_YJ = request.getParameter("INCOMES_YJ");
		//String OVERAMOUNTS_YJ = request.getParameter("OVERAMOUNTS_YJ");

//		if (!"".equals(SALEAMOUNTS_GZ)) {
//			// int start = Integer.parseInt(SALEAMOUNTS_GZ);
//			// int i = Integer.valueOf(SALEAMOUNTS_GZ).intValue();
//			float aa = Float.parseFloat(SALEAMOUNTS_GZ);
//
//			cityDate.setSALEAMOUNTS(aa);
//			cityDate.setAREANAME(AREANAME_GZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//
//		}
		if (!"".equals(INCOMES_GZ)) {
			float GZ = Float.parseFloat(INCOMES_GZ);
			//int GZ = Integer.parseInt(INCOMES_GZ);
			cityDate.setAREANAME(AREANAME_GZ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_GZ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_GZ);
//			cityDate.setAREANAME(AREANAME_GZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}

		int sum = 0;
		CityDate oneCityDate = cityDateService.selectCiteDate(brand, spec, AREANAME_GZ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDate == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDate != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 肇庆
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_ZQ)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_ZQ);
//			// int GZ = Integer.parseInt(SALEAMOUNTS_ZQ);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_ZQ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_ZQ)) {
			float GZ = Float.parseFloat(INCOMES_ZQ);
			cityDate.setAREANAME(AREANAME_ZQ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_ZQ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_ZQ);
//			cityDate.setAREANAME(AREANAME_ZQ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateZQ = cityDateService.selectCiteDate(brand, spec, AREANAME_ZQ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateZQ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateZQ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 清远
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_QY)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_QY);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_QY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_QY)) {
			float GZ = Float.parseFloat(INCOMES_QY);
			cityDate.setAREANAME(AREANAME_QY);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_QY)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_QY);
//			cityDate.setAREANAME(AREANAME_QY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateQY = cityDateService.selectCiteDate(brand, spec, AREANAME_QY);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateQY == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateQY != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 韶关
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_SG)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_SG);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_SG);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_SG)) {
			float GZ = Float.parseFloat(INCOMES_SG);
			cityDate.setAREANAME(AREANAME_SG);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_SG)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_SG);
//			cityDate.setAREANAME(AREANAME_SG);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateSG = cityDateService.selectCiteDate(brand, spec, AREANAME_SG);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateSG == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateSG != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 云浮
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_YF)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_YF);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_YF);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_YF)) {
			float GZ = Float.parseFloat(INCOMES_YF);
			cityDate.setAREANAME(AREANAME_YF);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_YF)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_YF);
//			cityDate.setAREANAME(AREANAME_YF);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateYF = cityDateService.selectCiteDate(brand, spec, AREANAME_YF);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateYF == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateYF != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 深圳
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_SZ)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_SZ);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_SZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_SZ)) {
			float GZ = Float.parseFloat(INCOMES_SZ);
			cityDate.setAREANAME(AREANAME_SZ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_SZ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_SZ);
//			cityDate.setAREANAME(AREANAME_SZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateSZ = cityDateService.selectCiteDate(brand, spec, AREANAME_SZ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateSZ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateSZ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 汕头
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_ST)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_ST);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_ST);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_ST)) {
			float GZ = Float.parseFloat(INCOMES_ST);
			cityDate.setAREANAME(AREANAME_ST);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_ST)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_ST);
//			cityDate.setAREANAME(AREANAME_ST);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateST = cityDateService.selectCiteDate(brand, spec, AREANAME_ST);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateST == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateST != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 揭阳
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_JY)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_JY);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_JY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_JY)) {
			float GZ = Float.parseFloat(INCOMES_JY);
			cityDate.setAREANAME(AREANAME_JY);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_JY)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_JY);
//			cityDate.setAREANAME(AREANAME_JY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateJY = cityDateService.selectCiteDate(brand, spec, AREANAME_JY);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateJY == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateJY != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 梅州
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_MZ)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_MZ);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_MZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_MZ)) {
			float GZ = Float.parseFloat(INCOMES_MZ);
			cityDate.setAREANAME(AREANAME_MZ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_MZ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_MZ);
//			cityDate.setAREANAME(AREANAME_MZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateMZ = cityDateService.selectCiteDate(brand, spec, AREANAME_MZ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateMZ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateMZ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 潮州
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_CZ)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_CZ);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_CZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_CZ)) {
			float GZ = Float.parseFloat(INCOMES_CZ);
			cityDate.setAREANAME(AREANAME_CZ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_CZ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_CZ);
//			cityDate.setAREANAME(AREANAME_CZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateCZ = cityDateService.selectCiteDate(brand, spec, AREANAME_CZ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateCZ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateCZ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 汕尾
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_SW)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_SW);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_SW);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_SW)) {
			float GZ = Float.parseFloat(INCOMES_SW);
			cityDate.setAREANAME(AREANAME_SW);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_SW)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_SW);
//			cityDate.setAREANAME(AREANAME_SW);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateSW = cityDateService.selectCiteDate(brand, spec, AREANAME_SW);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateSW == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateSW != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 东莞
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_DG)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_DG);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_DG);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_YF)) {
			float GZ = Float.parseFloat(INCOMES_YF);
			cityDate.setAREANAME(AREANAME_DG);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_DG)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_DG);
//			cityDate.setAREANAME(AREANAME_DG);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateDG = cityDateService.selectCiteDate(brand, spec, AREANAME_DG);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateDG == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateDG != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 中山
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_ZS)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_ZS);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_ZS);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_ZS)) {
			float GZ = Float.parseFloat(INCOMES_ZS);
			cityDate.setAREANAME(AREANAME_ZS);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_YF)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_ZS);
//			cityDate.setAREANAME(AREANAME_ZS);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateZS = cityDateService.selectCiteDate(brand, spec, AREANAME_ZS);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateZS == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateZS != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 惠州
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_HZ)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_HZ);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_HZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_HZ)) {
			float GZ = Float.parseFloat(INCOMES_HZ);
			cityDate.setAREANAME(AREANAME_HZ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_HZ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_HZ);
//			cityDate.setAREANAME(AREANAME_HZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateHZ = cityDateService.selectCiteDate(brand, spec, AREANAME_HZ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateHZ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateHZ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 珠海
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_ZH)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_ZH);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_ZH);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_ZH)) {
			float GZ = Float.parseFloat(INCOMES_ZH);
			cityDate.setAREANAME(AREANAME_ZH);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_ZH)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_ZH);
//			cityDate.setAREANAME(AREANAME_ZH);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateZH = cityDateService.selectCiteDate(brand, spec, AREANAME_ZH);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateZH == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateZH != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 河源
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_HY)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_HY);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_HY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_HY)) {
			float GZ = Float.parseFloat(INCOMES_HY);
			cityDate.setAREANAME(AREANAME_HY);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_HY)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_HY);
//			cityDate.setAREANAME(AREANAME_HY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateHY = cityDateService.selectCiteDate(brand, spec, AREANAME_HY);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateHY == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateHY != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 佛山
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_FS)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_FS);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_FS);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_FS)) {
			float GZ = Float.parseFloat(INCOMES_FS);
			cityDate.setAREANAME(AREANAME_FS);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_FS)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_FS);
//			cityDate.setAREANAME(AREANAME_FS);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateFS = cityDateService.selectCiteDate(brand, spec, AREANAME_FS);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateFS == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateFS != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 江门
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_JM)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_JM);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_JM);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_JM)) {
			float GZ = Float.parseFloat(INCOMES_JM);
			cityDate.setAREANAME(AREANAME_JM);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_JM)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_JM);
//			cityDate.setAREANAME(AREANAME_JM);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateJM = cityDateService.selectCiteDate(brand, spec, AREANAME_JM);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateJM == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateJM != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 湛江
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_ZJ)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_ZJ);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_ZJ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_ZJ)) {
			float GZ = Float.parseFloat(INCOMES_ZJ);
			cityDate.setAREANAME(AREANAME_ZJ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_ZJ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_ZJ);
//			cityDate.setAREANAME(AREANAME_ZJ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateZJ = cityDateService.selectCiteDate(brand, spec, AREANAME_ZJ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateZJ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateZJ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 茂名
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_MM)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_MM);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_MM);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_MM)) {
			float GZ = Float.parseFloat(INCOMES_MM);
			cityDate.setAREANAME(AREANAME_MM);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_MM)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_MM);
//			cityDate.setAREANAME(AREANAME_MM);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateMM = cityDateService.selectCiteDate(brand, spec, AREANAME_MM);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateMM == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateMM != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 阳江
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_YJ)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_YJ);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_YJ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
		if (!"".equals(INCOMES_YJ)) {
			float GZ = Float.parseFloat(INCOMES_YJ);
			cityDate.setAREANAME(AREANAME_YJ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setINCOMES(GZ);
		}
//		if (!"".equals(OVERAMOUNTS_YJ)) {
//			int GZ = Integer.parseInt(OVERAMOUNTS_YJ);
//			cityDate.setAREANAME(AREANAME_YJ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setOVERAMOUNTS(GZ);
//		}
		sum = 0;
		CityDate oneCityDateYJ = cityDateService.selectCiteDate(brand, spec, AREANAME_YJ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateYJ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateYJ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateIncome(cityDate);
			sum = 2;

		}
		}
		return sum;
	}
	
	//城市维度更新客户覆盖数的操作
	
	@SuppressWarnings("null")
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/addAndUpdateCityDateOver", method = RequestMethod.POST)
	public int addAndUpdateOver(CityDate cityDate, Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("customerChannel  {}.", locale);

		String brand = request.getParameter("BRANDNAME");
		String spec = request.getParameter("SPEC");
		String AREANAME_GZ = request.getParameter("AREANAME_GZ");
		//String SALEAMOUNTS_GZ = request.getParameter("SALEAMOUNTS_GZ");
		String AREANAME_ZQ = request.getParameter("AREANAME_ZQ");
		//String SALEAMOUNTS_ZQ = request.getParameter("SALEAMOUNTS_ZQ");
		//String INCOMES_GZ = request.getParameter("INCOMES_GZ");
		String OVERAMOUNTS_GZ = request.getParameter("OVERAMOUNTS_GZ");
		//String INCOMES_ZQ = request.getParameter("INCOMES_ZQ");
		String OVERAMOUNTS_ZQ = request.getParameter("OVERAMOUNTS_ZQ");

		String AREANAME_QY = request.getParameter("AREANAME_QY");
		//String SALEAMOUNTS_QY = request.getParameter("SALEAMOUNTS_QY");
		//String INCOMES_QY = request.getParameter("INCOMES_QY");
		String OVERAMOUNTS_QY = request.getParameter("OVERAMOUNTS_QY");

		String AREANAME_SG = request.getParameter("AREANAME_SG");
		//String SALEAMOUNTS_SG = request.getParameter("SALEAMOUNTS_SG");
		//String INCOMES_SG = request.getParameter("INCOMES_SG");
		String OVERAMOUNTS_SG = request.getParameter("OVERAMOUNTS_SG");

		String AREANAME_YF = request.getParameter("AREANAME_YF");
		//String SALEAMOUNTS_YF = request.getParameter("SALEAMOUNTS_YF");
		//String INCOMES_YF = request.getParameter("INCOMES_YF");
		String OVERAMOUNTS_YF = request.getParameter("OVERAMOUNTS_YF");

		String AREANAME_SZ = request.getParameter("AREANAME_SZ");
		//String SALEAMOUNTS_SZ = request.getParameter("SALEAMOUNTS_SZ");
		//String INCOMES_SZ = request.getParameter("INCOMES_SZ");
		String OVERAMOUNTS_SZ = request.getParameter("OVERAMOUNTS_SZ");

		String AREANAME_ST = request.getParameter("AREANAME_ST");
		//String SALEAMOUNTS_ST = request.getParameter("SALEAMOUNTS_ST");
		//String INCOMES_ST = request.getParameter("INCOMES_ST");
		String OVERAMOUNTS_ST = request.getParameter("OVERAMOUNTS_ST");

		String AREANAME_JY = request.getParameter("AREANAME_JY");
		//String SALEAMOUNTS_JY = request.getParameter("SALEAMOUNTS_JY");
		//String INCOMES_JY = request.getParameter("INCOMES_JY");
		String OVERAMOUNTS_JY = request.getParameter("OVERAMOUNTS_JY");

		String AREANAME_MZ = request.getParameter("AREANAME_MZ");
		//String SALEAMOUNTS_MZ = request.getParameter("SALEAMOUNTS_MZ");
		//String INCOMES_MZ = request.getParameter("INCOMES_MZ");
		String OVERAMOUNTS_MZ = request.getParameter("OVERAMOUNTS_MZ");

		String AREANAME_CZ = request.getParameter("AREANAME_CZ");
		//String SALEAMOUNTS_CZ = request.getParameter("SALEAMOUNTS_CZ");
		//String INCOMES_CZ = request.getParameter("INCOMES_CZ");
		String OVERAMOUNTS_CZ = request.getParameter("OVERAMOUNTS_CZ");

		String AREANAME_SW = request.getParameter("AREANAME_SW");
		//String SALEAMOUNTS_SW = request.getParameter("SALEAMOUNTS_SW");
		//String INCOMES_SW = request.getParameter("INCOMES_SW");
		String OVERAMOUNTS_SW = request.getParameter("OVERAMOUNTS_SW");

		String AREANAME_DG = request.getParameter("AREANAME_DG");
		//String SALEAMOUNTS_DG = request.getParameter("SALEAMOUNTS_DG");
		//String INCOMES_DG = request.getParameter("INCOMES_DG");
		String OVERAMOUNTS_DG = request.getParameter("OVERAMOUNTS_DG");

		String AREANAME_ZS = request.getParameter("AREANAME_ZS");
		//String SALEAMOUNTS_ZS = request.getParameter("SALEAMOUNTS_ZS");
		//String INCOMES_ZS = request.getParameter("INCOMES_ZS");
		String OVERAMOUNTS_ZS = request.getParameter("OVERAMOUNTS_ZS");

		String AREANAME_HZ = request.getParameter("AREANAME_HZ");
		//String SALEAMOUNTS_HZ = request.getParameter("SALEAMOUNTS_HZ");
		//String INCOMES_HZ = request.getParameter("INCOMES_HZ");
		String OVERAMOUNTS_HZ = request.getParameter("OVERAMOUNTS_HZ");

		String AREANAME_ZH = request.getParameter("AREANAME_ZH");
		//String SALEAMOUNTS_ZH = request.getParameter("SALEAMOUNTS_ZH");
		//String INCOMES_ZH = request.getParameter("INCOMES_ZH");
		String OVERAMOUNTS_ZH = request.getParameter("OVERAMOUNTS_ZH");

		String AREANAME_HY = request.getParameter("AREANAME_HY");
		//String SALEAMOUNTS_HY = request.getParameter("SALEAMOUNTS_HY");
		//String INCOMES_HY = request.getParameter("INCOMES_HY");
		String OVERAMOUNTS_HY = request.getParameter("OVERAMOUNTS_HY");

		String AREANAME_FS = request.getParameter("AREANAME_FS");
		//String SALEAMOUNTS_FS = request.getParameter("SALEAMOUNTS_FS");
		//String INCOMES_FS = request.getParameter("INCOMES_FS");
		String OVERAMOUNTS_FS = request.getParameter("OVERAMOUNTS_FS");

		String AREANAME_JM = request.getParameter("AREANAME_JM");
		//String SALEAMOUNTS_JM = request.getParameter("SALEAMOUNTS_JM");
		//String INCOMES_JM = request.getParameter("INCOMES_JM");
		String OVERAMOUNTS_JM = request.getParameter("OVERAMOUNTS_JM");

		String AREANAME_ZJ = request.getParameter("AREANAME_ZJ");
		//String SALEAMOUNTS_ZJ = request.getParameter("SALEAMOUNTS_ZJ");
		//String INCOMES_ZJ = request.getParameter("INCOMES_ZJ");
		String OVERAMOUNTS_ZJ = request.getParameter("OVERAMOUNTS_ZJ");

		String AREANAME_MM = request.getParameter("AREANAME_MM");
		//String SALEAMOUNTS_MM = request.getParameter("SALEAMOUNTS_MM");
		//String INCOMES_MM = request.getParameter("INCOMES_MM");
		String OVERAMOUNTS_MM = request.getParameter("OVERAMOUNTS_MM");

		String AREANAME_YJ = request.getParameter("AREANAME_YJ");
		//String SALEAMOUNTS_YJ = request.getParameter("SALEAMOUNTS_YJ");
		//String INCOMES_YJ = request.getParameter("INCOMES_YJ");
		String OVERAMOUNTS_YJ = request.getParameter("OVERAMOUNTS_YJ");

//		if (!"".equals(SALEAMOUNTS_GZ)) {
//			// int start = Integer.parseInt(SALEAMOUNTS_GZ);
//			// int i = Integer.valueOf(SALEAMOUNTS_GZ).intValue();
//			float aa = Float.parseFloat(SALEAMOUNTS_GZ);
//
//			cityDate.setSALEAMOUNTS(aa);
//			cityDate.setAREANAME(AREANAME_GZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//
//		}
//		if (!"".equals(INCOMES_GZ)) {
//			float GZ = Float.parseFloat(INCOMES_GZ);
//			//int GZ = Integer.parseInt(INCOMES_GZ);
//			cityDate.setAREANAME(AREANAME_GZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_GZ)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_GZ);
			cityDate.setAREANAME(AREANAME_GZ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}

		int sum = 0;
		CityDate oneCityDate = cityDateService.selectCiteDate(brand, spec, AREANAME_GZ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDate == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDate != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 肇庆
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_ZQ)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_ZQ);
//			// int GZ = Integer.parseInt(SALEAMOUNTS_ZQ);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_ZQ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_ZQ)) {
//			float GZ = Float.parseFloat(INCOMES_ZQ);
//			cityDate.setAREANAME(AREANAME_ZQ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_ZQ)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_ZQ);
			cityDate.setAREANAME(AREANAME_ZQ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateZQ = cityDateService.selectCiteDate(brand, spec, AREANAME_ZQ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateZQ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateZQ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 清远
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_QY)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_QY);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_QY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_QY)) {
//			float GZ = Float.parseFloat(INCOMES_QY);
//			cityDate.setAREANAME(AREANAME_QY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_QY)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_QY);
			cityDate.setAREANAME(AREANAME_QY);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateQY = cityDateService.selectCiteDate(brand, spec, AREANAME_QY);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateQY == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateQY != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 韶关
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_SG)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_SG);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_SG);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_SG)) {
//			float GZ = Float.parseFloat(INCOMES_SG);
//			cityDate.setAREANAME(AREANAME_SG);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_SG)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_SG);
			cityDate.setAREANAME(AREANAME_SG);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateSG = cityDateService.selectCiteDate(brand, spec, AREANAME_SG);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateSG == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateSG != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 云浮
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_YF)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_YF);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_YF);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_YF)) {
//			float GZ = Float.parseFloat(INCOMES_YF);
//			cityDate.setAREANAME(AREANAME_YF);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_YF)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_YF);
			cityDate.setAREANAME(AREANAME_YF);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateYF = cityDateService.selectCiteDate(brand, spec, AREANAME_YF);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateYF == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateYF != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 深圳
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_SZ)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_SZ);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_SZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_SZ)) {
//			float GZ = Float.parseFloat(INCOMES_SZ);
//			cityDate.setAREANAME(AREANAME_SZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_SZ)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_SZ);
			cityDate.setAREANAME(AREANAME_SZ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateSZ = cityDateService.selectCiteDate(brand, spec, AREANAME_SZ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateSZ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateSZ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 汕头
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_ST)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_ST);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_ST);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_ST)) {
//			float GZ = Float.parseFloat(INCOMES_ST);
//			cityDate.setAREANAME(AREANAME_ST);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_ST)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_ST);
			cityDate.setAREANAME(AREANAME_ST);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateST = cityDateService.selectCiteDate(brand, spec, AREANAME_ST);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateST == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateST != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 揭阳
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_JY)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_JY);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_JY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_JY)) {
//			float GZ = Float.parseFloat(INCOMES_JY);
//			cityDate.setAREANAME(AREANAME_JY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_JY)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_JY);
			cityDate.setAREANAME(AREANAME_JY);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateJY = cityDateService.selectCiteDate(brand, spec, AREANAME_JY);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateJY == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateJY != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 梅州
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_MZ)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_MZ);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_MZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_MZ)) {
//			float GZ = Float.parseFloat(INCOMES_MZ);
//			cityDate.setAREANAME(AREANAME_MZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_MZ)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_MZ);
			cityDate.setAREANAME(AREANAME_MZ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateMZ = cityDateService.selectCiteDate(brand, spec, AREANAME_MZ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateMZ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateMZ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 潮州
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_CZ)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_CZ);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_CZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_CZ)) {
//			float GZ = Float.parseFloat(INCOMES_CZ);
//			cityDate.setAREANAME(AREANAME_CZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_CZ)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_CZ);
			cityDate.setAREANAME(AREANAME_CZ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateCZ = cityDateService.selectCiteDate(brand, spec, AREANAME_CZ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateCZ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateCZ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 汕尾
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_SW)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_SW);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_SW);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_SW)) {
//			float GZ = Float.parseFloat(INCOMES_SW);
//			cityDate.setAREANAME(AREANAME_SW);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_SW)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_SW);
			cityDate.setAREANAME(AREANAME_SW);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateSW = cityDateService.selectCiteDate(brand, spec, AREANAME_SW);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateSW == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateSW != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 东莞
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_DG)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_DG);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_DG);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_YF)) {
//			float GZ = Float.parseFloat(INCOMES_YF);
//			cityDate.setAREANAME(AREANAME_DG);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_DG)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_DG);
			cityDate.setAREANAME(AREANAME_DG);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateDG = cityDateService.selectCiteDate(brand, spec, AREANAME_DG);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateDG == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateDG != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 中山
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_ZS)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_ZS);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_ZS);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_ZS)) {
//			float GZ = Float.parseFloat(INCOMES_ZS);
//			cityDate.setAREANAME(AREANAME_ZS);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_YF)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_ZS);
			cityDate.setAREANAME(AREANAME_ZS);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateZS = cityDateService.selectCiteDate(brand, spec, AREANAME_ZS);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateZS == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateZS != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 惠州
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_HZ)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_HZ);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_HZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_HZ)) {
//			float GZ = Float.parseFloat(INCOMES_HZ);
//			cityDate.setAREANAME(AREANAME_HZ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_HZ)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_HZ);
			cityDate.setAREANAME(AREANAME_HZ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateHZ = cityDateService.selectCiteDate(brand, spec, AREANAME_HZ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateHZ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateHZ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 珠海
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_ZH)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_ZH);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_ZH);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_ZH)) {
//			float GZ = Float.parseFloat(INCOMES_ZH);
//			cityDate.setAREANAME(AREANAME_ZH);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_ZH)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_ZH);
			cityDate.setAREANAME(AREANAME_ZH);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateZH = cityDateService.selectCiteDate(brand, spec, AREANAME_ZH);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateZH == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateZH != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 河源
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_HY)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_HY);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_HY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_HY)) {
//			float GZ = Float.parseFloat(INCOMES_HY);
//			cityDate.setAREANAME(AREANAME_HY);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_HY)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_HY);
			cityDate.setAREANAME(AREANAME_HY);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateHY = cityDateService.selectCiteDate(brand, spec, AREANAME_HY);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateHY == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateHY != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 佛山
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_FS)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_FS);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_FS);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_FS)) {
//			float GZ = Float.parseFloat(INCOMES_FS);
//			cityDate.setAREANAME(AREANAME_FS);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_FS)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_FS);
			cityDate.setAREANAME(AREANAME_FS);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateFS = cityDateService.selectCiteDate(brand, spec, AREANAME_FS);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateFS == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateFS != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 江门
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_JM)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_JM);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_JM);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_JM)) {
//			float GZ = Float.parseFloat(INCOMES_JM);
//			cityDate.setAREANAME(AREANAME_JM);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_JM)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_JM);
			cityDate.setAREANAME(AREANAME_JM);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateJM = cityDateService.selectCiteDate(brand, spec, AREANAME_JM);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateJM == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateJM != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 湛江
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_ZJ)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_ZJ);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_ZJ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_ZJ)) {
//			float GZ = Float.parseFloat(INCOMES_ZJ);
//			cityDate.setAREANAME(AREANAME_ZJ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_ZJ)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_ZJ);
			cityDate.setAREANAME(AREANAME_ZJ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateZJ = cityDateService.selectCiteDate(brand, spec, AREANAME_ZJ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateZJ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateZJ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 茂名
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_MM)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_MM);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_MM);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_MM)) {
//			float GZ = Float.parseFloat(INCOMES_MM);
//			cityDate.setAREANAME(AREANAME_MM);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_MM)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_MM);
			cityDate.setAREANAME(AREANAME_MM);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateMM = cityDateService.selectCiteDate(brand, spec, AREANAME_MM);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateMM == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateMM != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		// 初始化对象 阳江
		cityDate = new CityDate();
//		if (!"".equals(SALEAMOUNTS_YJ)) {
//			float GZ = Float.parseFloat(SALEAMOUNTS_YJ);
//			cityDate.setSALEAMOUNTS(GZ);
//			cityDate.setAREANAME(AREANAME_YJ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//		}
//		if (!"".equals(INCOMES_YJ)) {
//			float GZ = Float.parseFloat(INCOMES_YJ);
//			cityDate.setAREANAME(AREANAME_YJ);
//			cityDate.setBRANDNAME(brand);
//			cityDate.setSPEC(spec);
//			cityDate.setINCOMES(GZ);
//		}
		if (!"".equals(OVERAMOUNTS_YJ)) {
			Float GZ = Float.parseFloat(OVERAMOUNTS_YJ);
			cityDate.setAREANAME(AREANAME_YJ);
			cityDate.setBRANDNAME(brand);
			cityDate.setSPEC(spec);
			cityDate.setOVERAMOUNTS(GZ);
		}
		sum = 0;
		CityDate oneCityDateYJ = cityDateService.selectCiteDate(brand, spec, AREANAME_YJ);
		if(cityDate.getBRANDNAME()!=null) {
		if (oneCityDateYJ == null) {
			@SuppressWarnings("unused")
			int i = cityDateService.insertCityDateNew(cityDate);
			if (i == 1) {
				sum = 1;
			}

		}
		if (oneCityDateYJ != null) {
			@SuppressWarnings("unused")
			int date = cityDateService.updateCityDateOver(cityDate);
			sum = 2;

		}
		}
		return sum;
	}	
	
	
	
	
	
	// 五线七口更新和增加的操作可以修改表格中全部的数据
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/addUpdateFineDateNew", method = RequestMethod.POST)
	public int addAndUpdateCityFine(FiveLine fineLine, Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("customerChannel  {}.", locale);

		String brand = request.getParameter("BRANDNAME");
		String spec = request.getParameter("SPEC");
		String LINENAME_1 = request.getParameter("LINENAME_1");
		String PORTNAME1_1 = request.getParameter("PORTNAME1_1");
		
		String fiveSALEAMOUNT1 = request.getParameter("fiveSALEAMOUNT1");
		if(!"".equals(fiveSALEAMOUNT1)) {
			float GZ = Float.parseFloat(fiveSALEAMOUNT1);
			fineLine.setSALEAMOUNT(GZ);
			fineLine.setBRANDNAME(brand);
			fineLine.setSPEC(spec);
			fineLine.setLINENAME(LINENAME_1);
			fineLine.setPORTNAME(PORTNAME1_1);
			
		}
		
		String fiveINCOME1 = request.getParameter("fiveINCOME1");
		
		if(!"".equals(fiveINCOME1)) {
			float GZ = Float.parseFloat(fiveINCOME1);
			fineLine.setINCOME(GZ);
			fineLine.setBRANDNAME(brand);
			fineLine.setSPEC(spec);
			fineLine.setLINENAME(LINENAME_1);
			fineLine.setPORTNAME(PORTNAME1_1);
			
		}
		
		String fiveMAORI1 = request.getParameter("fiveMAORI1");
		if(!"".equals(fiveMAORI1)) {
			float GZ = Float.parseFloat(fiveMAORI1);
			fineLine.setMAORI(GZ);
			fineLine.setBRANDNAME(brand);
			fineLine.setSPEC(spec);
			fineLine.setLINENAME(LINENAME_1);
			fineLine.setPORTNAME(PORTNAME1_1);
			
		}

		int sum = 0;

		FiveLine fiveAndLine = fiveLineService.selectFine(brand, spec, LINENAME_1, PORTNAME1_1);
       if(fineLine.getBRANDNAME()!=null) {
		if (fiveAndLine == null) {

			@SuppressWarnings("unused")
			int i = fiveLineService.insertFiveLine(fineLine);
			sum = 1;

		}
		if (fiveAndLine != null) {
			@SuppressWarnings("unused")
			int date = fiveLineService.updateFiveLine(fineLine);
			sum = 2;
		}
}
		//初始化五线七口的对象
		fineLine=new FiveLine();
		String PORTNAME1_2 = request.getParameter("PORTNAME1_2");
		String fiveSALEAMOUNT2 = request.getParameter("fiveSALEAMOUNT2");
		if(!"".equals(fiveSALEAMOUNT2)) {
			float GZ = Float.parseFloat(fiveSALEAMOUNT2);
			fineLine.setSALEAMOUNT(GZ);
			fineLine.setBRANDNAME(brand);
			fineLine.setSPEC(spec);
			fineLine.setLINENAME(LINENAME_1);
			fineLine.setPORTNAME(PORTNAME1_2);
			
		}
		
		String fiveINCOME2 = request.getParameter("fiveINCOME2");
		
		if(!"".equals(fiveINCOME2)) {
			float GZ = Float.parseFloat(fiveINCOME2);
			fineLine.setINCOME(GZ);
			fineLine.setBRANDNAME(brand);
			fineLine.setSPEC(spec);
			fineLine.setLINENAME(LINENAME_1);
			fineLine.setPORTNAME(PORTNAME1_2);
			
		}
		
		String fiveMAORI2 = request.getParameter("fiveMAORI2");
		if(!"".equals(fiveMAORI2)) {
			float GZ = Float.parseFloat(fiveMAORI2);
			fineLine.setMAORI(GZ);
			fineLine.setBRANDNAME(brand);
			fineLine.setSPEC(spec);
			fineLine.setLINENAME(LINENAME_1);
			fineLine.setPORTNAME(PORTNAME1_2);
			
		}

	 sum = 0;

		FiveLine fiveAndLine2 = fiveLineService.selectFine(brand, spec, LINENAME_1, PORTNAME1_2);
        if(fineLine.getBRANDNAME()!=null) {
		if (fiveAndLine2 == null) {

			@SuppressWarnings("unused")
			int i = fiveLineService.insertFiveLine(fineLine);
			sum = 1;

		}
		if (fiveAndLine2 != null) {
			@SuppressWarnings("unused")
			int date = fiveLineService.updateFiveLine(fineLine);
			sum = 2;
		}
}
		//初始化五线七口的对象
				fineLine=new FiveLine();
				String PORTNAME1_3 = request.getParameter("PORTNAME1_3");
				String fiveSALEAMOUNT3 = request.getParameter("fiveSALEAMOUNT3");
				if(!"".equals(fiveSALEAMOUNT3)) {
					float GZ = Float.parseFloat(fiveSALEAMOUNT3);
					fineLine.setSALEAMOUNT(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_1);
					fineLine.setPORTNAME(PORTNAME1_3);
					
				}
				
				String fiveINCOME3 = request.getParameter("fiveINCOME3");
				
				if(!"".equals(fiveINCOME3)) {
					float GZ = Float.parseFloat(fiveINCOME3);
					fineLine.setINCOME(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_1);
					fineLine.setPORTNAME(PORTNAME1_3);
					
				}
				
				String fiveMAORI3 = request.getParameter("fiveMAORI3");
				if(!"".equals(fiveMAORI3)) {
					float GZ = Float.parseFloat(fiveMAORI3);
					fineLine.setMAORI(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_1);
					fineLine.setPORTNAME(PORTNAME1_3);
					
				}

			   sum = 0;

				FiveLine fiveAndLine3 = fiveLineService.selectFine(brand, spec, LINENAME_1, PORTNAME1_3);
				if(fineLine.getBRANDNAME()!=null) {
				if (fiveAndLine3 == null) {

					@SuppressWarnings("unused")
					int i = fiveLineService.insertFiveLine(fineLine);
					sum = 1;

				}
				if (fiveAndLine3 != null) {
					@SuppressWarnings("unused")
					int date = fiveLineService.updateFiveLine(fineLine);
					sum = 2;
				}
				}
				//初始化五线七口的对象
				fineLine=new FiveLine();
				String PORTNAME1_4 = request.getParameter("PORTNAME1_4");
				String fiveSALEAMOUNT4 = request.getParameter("fiveSALEAMOUNT4");
				if(!"".equals(fiveSALEAMOUNT4)) {
					float GZ = Float.parseFloat(fiveSALEAMOUNT4);
					fineLine.setSALEAMOUNT(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_1);
					fineLine.setPORTNAME(PORTNAME1_4);
					
				}
				
				String fiveINCOME4 = request.getParameter("fiveINCOME4");
				
				if(!"".equals(fiveINCOME4)) {
					float GZ = Float.parseFloat(fiveINCOME4);
					fineLine.setINCOME(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_1);
					fineLine.setPORTNAME(PORTNAME1_4);
					
				}
				
				String fiveMAORI4 = request.getParameter("fiveMAORI4");
				if(!"".equals(fiveMAORI4)) {
					float GZ = Float.parseFloat(fiveMAORI4);
					fineLine.setMAORI(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_1);
					fineLine.setPORTNAME(PORTNAME1_4);
					
				}

			   sum = 0;

				FiveLine fiveAndLine4 = fiveLineService.selectFine(brand, spec, LINENAME_1, PORTNAME1_4);
				if(fineLine.getBRANDNAME()!=null) {
				if (fiveAndLine4 == null) {

					@SuppressWarnings("unused")
					int i = fiveLineService.insertFiveLine(fineLine);
					sum = 1;

				}
				if (fiveAndLine4 != null) {
					@SuppressWarnings("unused")
					int date = fiveLineService.updateFiveLine(fineLine);
					sum = 2;
				}
				}
				//初始化五线七口的对象
				fineLine=new FiveLine();
				String LINENAME_2 = request.getParameter("LINENAME_2");
				String PORTNAME2_1 = request.getParameter("PORTNAME2_1");
				String fiveSALEAMOUNT5 = request.getParameter("fiveSALEAMOUNT5");
				if(!"".equals(fiveSALEAMOUNT5)) {
					float GZ = Float.parseFloat(fiveSALEAMOUNT5);
					fineLine.setSALEAMOUNT(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_2);
					fineLine.setPORTNAME(PORTNAME2_1);
					
				}
				
				String fiveINCOME5 = request.getParameter("fiveINCOME5");
				
				if(!"".equals(fiveINCOME5)) {
					float GZ = Float.parseFloat(fiveINCOME5);
					fineLine.setINCOME(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_2);
					fineLine.setPORTNAME(PORTNAME2_1);
					
				}
				
				String fiveMAORI5 = request.getParameter("fiveMAORI5");
				if(!"".equals(fiveMAORI5)) {
					float GZ = Float.parseFloat(fiveMAORI5);
					fineLine.setMAORI(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_2);
					fineLine.setPORTNAME(PORTNAME2_1);
					
				}

			   sum = 0;

				FiveLine fiveAndLine5 = fiveLineService.selectFine(brand, spec, LINENAME_2, PORTNAME2_1);
				if(fineLine.getBRANDNAME()!=null) {
				if (fiveAndLine5 == null) {

					@SuppressWarnings("unused")
					int i = fiveLineService.insertFiveLine(fineLine);
					sum = 1;

				}
				if (fiveAndLine5 != null) {
					@SuppressWarnings("unused")
					int date = fiveLineService.updateFiveLine(fineLine);
					sum = 2;
				}
				}
				//初始化五线七口的对象
				fineLine=new FiveLine();
				//String LINENAME_2 = request.getParameter("LINENAME_2");
				String PORTNAME2_2 = request.getParameter("PORTNAME2_2");
				String fiveSALEAMOUNT6 = request.getParameter("fiveSALEAMOUNT6");
				if(!"".equals(fiveSALEAMOUNT6)) {
					float GZ = Float.parseFloat(fiveSALEAMOUNT6);
					fineLine.setSALEAMOUNT(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_2);
					fineLine.setPORTNAME(PORTNAME2_2);
					
				}
				
				String fiveINCOME6 = request.getParameter("fiveINCOME6");
				
				if(!"".equals(fiveINCOME6)) {
					float GZ = Float.parseFloat(fiveINCOME6);
					fineLine.setINCOME(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_2);
					fineLine.setPORTNAME(PORTNAME2_2);
					
				}
				
				String fiveMAORI6 = request.getParameter("fiveMAORI6");
				if(!"".equals(fiveMAORI6)) {
					float GZ = Float.parseFloat(fiveMAORI6);
					fineLine.setMAORI(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_2);
					fineLine.setPORTNAME(PORTNAME2_2);
					
				}

			   sum = 0;

				FiveLine fiveAndLine6 = fiveLineService.selectFine(brand, spec, LINENAME_2, PORTNAME2_2);
				if(fineLine.getBRANDNAME()!=null) {
				if (fiveAndLine6 == null) {

					@SuppressWarnings("unused")
					int i = fiveLineService.insertFiveLine(fineLine);
					sum = 1;

				}
				if (fiveAndLine6 != null) {
					@SuppressWarnings("unused")
					int date = fiveLineService.updateFiveLine(fineLine);
					sum = 2;
				}	
				}
				//初始化五线七口的对象
				fineLine=new FiveLine();
				//String LINENAME_2 = request.getParameter("LINENAME_2");
				String PORTNAME2_3 = request.getParameter("PORTNAME2_3");
				String fiveSALEAMOUNT7 = request.getParameter("fiveSALEAMOUNT7");
				if(!"".equals(fiveSALEAMOUNT7)) {
					float GZ = Float.parseFloat(fiveSALEAMOUNT7);
					fineLine.setSALEAMOUNT(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_2);
					fineLine.setPORTNAME(PORTNAME2_3);
					
				}
				
				String fiveINCOME7 = request.getParameter("fiveINCOME7");
				
				if(!"".equals(fiveINCOME7)) {
					float GZ = Float.parseFloat(fiveINCOME7);
					fineLine.setINCOME(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_2);
					fineLine.setPORTNAME(PORTNAME2_3);
					
				}
				
				String fiveMAORI7 = request.getParameter("fiveMAORI7");
				if(!"".equals(fiveMAORI7)) {
					float GZ = Float.parseFloat(fiveMAORI7);
					fineLine.setMAORI(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_2);
					fineLine.setPORTNAME(PORTNAME2_3);
					
				}

			   sum = 0;

				FiveLine fiveAndLine7 = fiveLineService.selectFine(brand, spec, LINENAME_2, PORTNAME2_3);
				if(fineLine.getBRANDNAME()!=null) {
				if (fiveAndLine7 == null) {

					@SuppressWarnings("unused")
					int i = fiveLineService.insertFiveLine(fineLine);
					sum = 1;

				}
				if (fiveAndLine7 != null) {
					@SuppressWarnings("unused")
					int date = fiveLineService.updateFiveLine(fineLine);
					sum = 2;
				}
				}
				//初始化五线七口的对象
				fineLine=new FiveLine();
				//String LINENAME_2 = request.getParameter("LINENAME_2");
				String PORTNAME2_4 = request.getParameter("PORTNAME2_4");
				String fiveSALEAMOUNT8 = request.getParameter("fiveSALEAMOUNT8");
				if(!"".equals(fiveSALEAMOUNT8)) {
					float GZ = Float.parseFloat(fiveSALEAMOUNT8);
					fineLine.setSALEAMOUNT(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_2);
					fineLine.setPORTNAME(PORTNAME2_4);
					
				}
				
				String fiveINCOME8 = request.getParameter("fiveINCOME8");
				
				if(!"".equals(fiveINCOME8)) {
					float GZ = Float.parseFloat(fiveINCOME8);
					fineLine.setINCOME(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_2);
					fineLine.setPORTNAME(PORTNAME2_4);
					
				}
				
				String fiveMAORI8 = request.getParameter("fiveMAORI8");
				if(!"".equals(fiveMAORI8)) {
					float GZ = Float.parseFloat(fiveMAORI8);
					fineLine.setMAORI(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_2);
					fineLine.setPORTNAME(PORTNAME2_4);
					
				}

			   sum = 0;

				FiveLine fiveAndLine8 = fiveLineService.selectFine(brand, spec, LINENAME_2, PORTNAME2_4);
				if(fineLine.getBRANDNAME()!=null) {
				if (fiveAndLine8 == null) {

					@SuppressWarnings("unused")
					int i = fiveLineService.insertFiveLine(fineLine);
					sum = 1;

				}
				if (fiveAndLine8 != null) {
					@SuppressWarnings("unused")
					int date = fiveLineService.updateFiveLine(fineLine);
					sum = 2;
				}	
				}
				//初始化五线七口的对象
				fineLine=new FiveLine();
				String LINENAME_3 = request.getParameter("LINENAME_3");
				String PORTNAME3_1 = request.getParameter("PORTNAME3_1");
				String fiveSALEAMOUNT9 = request.getParameter("fiveSALEAMOUNT9");
				if(!"".equals(fiveSALEAMOUNT9)) {
					float GZ = Float.parseFloat(fiveSALEAMOUNT9);
					fineLine.setSALEAMOUNT(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_3);
					fineLine.setPORTNAME(PORTNAME3_1);
					
				}
				
				String fiveINCOME9 = request.getParameter("fiveINCOME9");
				
				if(!"".equals(fiveINCOME9)) {
					float GZ = Float.parseFloat(fiveINCOME9);
					fineLine.setINCOME(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_3);
					fineLine.setPORTNAME(PORTNAME3_1);
					
				}
				
				String fiveMAORI9 = request.getParameter("fiveMAORI9");
				if(!"".equals(fiveMAORI9)) {
					float GZ = Float.parseFloat(fiveMAORI9);
					fineLine.setMAORI(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_3);
					fineLine.setPORTNAME(PORTNAME3_1);
					
				}

			   sum = 0;

				FiveLine fiveAndLine9 = fiveLineService.selectFine(brand, spec, LINENAME_3, PORTNAME3_1);
				if(fineLine.getBRANDNAME()!=null) {
				if (fiveAndLine9 == null) {

					@SuppressWarnings("unused")
					int i = fiveLineService.insertFiveLine(fineLine);
					sum = 1;

				}
				if (fiveAndLine9 != null) {
					@SuppressWarnings("unused")
					int date = fiveLineService.updateFiveLine(fineLine);
					sum = 2;
				}		
				}
				//初始化五线七口的对象
				fineLine=new FiveLine();
				String LINENAME_4 = request.getParameter("LINENAME_4");
				String PORTNAME4_1 = request.getParameter("PORTNAME4_1");
				String fiveSALEAMOUNT10 = request.getParameter("fiveSALEAMOUNT10");
				if(!"".equals(fiveSALEAMOUNT10)) {
					float GZ = Float.parseFloat(fiveSALEAMOUNT10);
					fineLine.setSALEAMOUNT(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_4);
					fineLine.setPORTNAME(PORTNAME4_1);
					
				}
				
				String fiveINCOME10 = request.getParameter("fiveINCOME10");
				
				if(!"".equals(fiveINCOME10)) {
					float GZ = Float.parseFloat(fiveINCOME10);
					fineLine.setINCOME(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_4);
					fineLine.setPORTNAME(PORTNAME4_1);
					
				}
				
				String fiveMAORI10 = request.getParameter("fiveMAORI10");
				if(!"".equals(fiveMAORI10)) {
					float GZ = Float.parseFloat(fiveMAORI10);
					fineLine.setMAORI(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_4);
					fineLine.setPORTNAME(PORTNAME4_1);
					
				}

			   sum = 0;

				FiveLine fiveAndLine10 = fiveLineService.selectFine(brand, spec, LINENAME_4, PORTNAME4_1);
				if(fineLine.getBRANDNAME()!=null) {
				if (fiveAndLine10 == null) {

					@SuppressWarnings("unused")
					int i = fiveLineService.insertFiveLine(fineLine);
					sum = 1;

				}
				if (fiveAndLine10 != null) {
					@SuppressWarnings("unused")
					int date = fiveLineService.updateFiveLine(fineLine);
					sum = 2;
				}				
				}
				//初始化五线七口的对象
				fineLine=new FiveLine();
				String LINENAME_5 = request.getParameter("LINENAME_5");
				String PORTNAME5_1 = request.getParameter("PORTNAME5_1");
				String fiveSALEAMOUNT11 = request.getParameter("fiveSALEAMOUNT11");
				if(!"".equals(fiveSALEAMOUNT11)) {
					float GZ = Float.parseFloat(fiveSALEAMOUNT11);
					fineLine.setSALEAMOUNT(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_5);
					fineLine.setPORTNAME(PORTNAME5_1);
					
				}
				
				String fiveINCOME11 = request.getParameter("fiveINCOME11");
				
				if(!"".equals(fiveINCOME11)) {
					float GZ = Float.parseFloat(fiveINCOME11);
					fineLine.setINCOME(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_5);
					fineLine.setPORTNAME(PORTNAME5_1);
					
				}
				
				String fiveMAORI11 = request.getParameter("fiveMAORI11");
				if(!"".equals(fiveMAORI11)) {
					float GZ = Float.parseFloat(fiveMAORI11);
					fineLine.setMAORI(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_5);
					fineLine.setPORTNAME(PORTNAME5_1);
					
				}

			   sum = 0;

				FiveLine fiveAndLine11 = fiveLineService.selectFine(brand, spec, LINENAME_5, PORTNAME5_1);
				if(fineLine.getBRANDNAME()!=null) {
				if (fiveAndLine11 == null) {

					@SuppressWarnings("unused")
					int i = fiveLineService.insertFiveLine(fineLine);
					sum = 1;

				}
				if (fiveAndLine11 != null) {
					@SuppressWarnings("unused")
					int date = fiveLineService.updateFiveLine(fineLine);
					sum = 2;
				}
				}
				//初始化五线七口的对象
				fineLine=new FiveLine();
				//String LINENAME_5 = request.getParameter("LINENAME_5");
				String PORTNAME5_2 = request.getParameter("PORTNAME5_2");
				String fiveSALEAMOUNT12 = request.getParameter("fiveSALEAMOUNT12");
				if(!"".equals(fiveSALEAMOUNT12)) {
					float GZ = Float.parseFloat(fiveSALEAMOUNT12);
					fineLine.setSALEAMOUNT(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_5);
					fineLine.setPORTNAME(PORTNAME5_2);
					
				}
				
				String fiveINCOME12 = request.getParameter("fiveINCOME12");
				
				if(!"".equals(fiveINCOME12)) {
					float GZ = Float.parseFloat(fiveINCOME12);
					fineLine.setINCOME(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_5);
					fineLine.setPORTNAME(PORTNAME5_2);
					
				}
				
				String fiveMAORI12 = request.getParameter("fiveMAORI12");
				if(!"".equals(fiveMAORI12)) {
					float GZ = Float.parseFloat(fiveMAORI12);
					fineLine.setMAORI(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_5);
					fineLine.setPORTNAME(PORTNAME5_2);
					
				}

			   sum = 0;

				FiveLine fiveAndLine12 = fiveLineService.selectFine(brand, spec, LINENAME_5, PORTNAME5_2);
				if(fineLine.getBRANDNAME()!=null) {
				if (fiveAndLine12 == null) {

					@SuppressWarnings("unused")
					int i = fiveLineService.insertFiveLine(fineLine);
					sum = 1;

				}
				if (fiveAndLine12 != null) {
					@SuppressWarnings("unused")
					int date = fiveLineService.updateFiveLine(fineLine);
					sum = 2;
				}
				}
				//初始化五线七口的对象
				fineLine=new FiveLine();
				//String LINENAME_5 = request.getParameter("LINENAME_5");
				String PORTNAME5_3 = request.getParameter("PORTNAME5_3");
				String fiveSALEAMOUNT13 = request.getParameter("fiveSALEAMOUNT13");
				if(!"".equals(fiveSALEAMOUNT13)) {
					float GZ = Float.parseFloat(fiveSALEAMOUNT13);
					fineLine.setSALEAMOUNT(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_5);
					fineLine.setPORTNAME(PORTNAME5_3);
					
				}
				
				String fiveINCOME13 = request.getParameter("fiveINCOME13");
				
				if(!"".equals(fiveINCOME13)) {
					float GZ = Float.parseFloat(fiveINCOME13);
					fineLine.setINCOME(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_5);
					fineLine.setPORTNAME(PORTNAME5_3);
					
				}
				
				String fiveMAORI13 = request.getParameter("fiveMAORI13");
				if(!"".equals(fiveMAORI13)) {
					float GZ = Float.parseFloat(fiveMAORI13);
					fineLine.setMAORI(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_5);
					fineLine.setPORTNAME(PORTNAME5_3);
					
				}

			   sum = 0;

				FiveLine fiveAndLine13 = fiveLineService.selectFine(brand, spec, LINENAME_5, PORTNAME5_3);
				if(fineLine.getBRANDNAME()!=null) {
				if (fiveAndLine13 == null) {

					@SuppressWarnings("unused")
					int i = fiveLineService.insertFiveLine(fineLine);
					sum = 1;

				}
				if (fiveAndLine13 != null) {
					@SuppressWarnings("unused")
					int date = fiveLineService.updateFiveLine(fineLine);
					sum = 2;
				}
				}
				//初始化五线七口的对象
				fineLine=new FiveLine();
				String LINENAME_6 = request.getParameter("LINENAME_6");
				String PORTNAME6_1 = request.getParameter("PORTNAME6_1");
				String fiveSALEAMOUNT14 = request.getParameter("fiveSALEAMOUNT14");
				if(!"".equals(fiveSALEAMOUNT14)) {
					float GZ = Float.parseFloat(fiveSALEAMOUNT14);
					fineLine.setSALEAMOUNT(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_6);
					fineLine.setPORTNAME(PORTNAME6_1);
					
				}
				
				String fiveINCOME14 = request.getParameter("fiveINCOME14");
				
				if(!"".equals(fiveINCOME14)) {
					float GZ = Float.parseFloat(fiveINCOME14);
					fineLine.setINCOME(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_6);
					fineLine.setPORTNAME(PORTNAME6_1);
					
				}
				
				String fiveMAORI14 = request.getParameter("fiveMAORI14");
				if(!"".equals(fiveMAORI14)) {
					float GZ = Float.parseFloat(fiveMAORI14);
					fineLine.setMAORI(GZ);
					fineLine.setBRANDNAME(brand);
					fineLine.setSPEC(spec);
					fineLine.setLINENAME(LINENAME_6);
					fineLine.setPORTNAME(PORTNAME6_1);
					
				}

			   sum = 0;

				FiveLine fiveAndLine14 = fiveLineService.selectFine(brand, spec, LINENAME_6, PORTNAME6_1);
				if(fineLine.getBRANDNAME()!=null) {
				if (fiveAndLine14 == null) {

					@SuppressWarnings("unused")
					int i = fiveLineService.insertFiveLine(fineLine);
					sum = 1;

				}
				if (fiveAndLine14 != null) {
					@SuppressWarnings("unused")
					int date = fiveLineService.updateFiveLine(fineLine);
					sum = 2;
				}
				}

//	System.out.println(sum);
				return sum;
	}	
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/setNewBrand", method = RequestMethod.POST)
	public Map<String, AbsoluteRange> brandSet(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("customerChannel  {}.", locale);
		// 根据品牌和型号查询出地市维度规划表中的数据
		Map<String, AbsoluteRange> map =new HashMap<String, AbsoluteRange>();		
		String brand = request.getParameter("select1");
		String spec = request.getParameter("select2");
		
		        AbsoluteRange ct = new AbsoluteRange();
				ct.setBRANDNAME(brand);
				ct.setSPEC(spec);
				
		        
		        List<AbsoluteRange> citeDate = cityDateService.selectCityDateAmountAndIncome(ct);

				for (AbsoluteRange citySet : citeDate) {

					if ("广州".equals(citySet.getAREANAME())) {
						
						
						map.put("gzDate", citySet);

						// model.addAttribute("gzdd", saleamounts);
					}

					if ("肇庆".equals(citySet.getAREANAME())) {

						map.put("zqDate", citySet);

					}

					if ("清远".equals(citySet.getAREANAME())) {

						map.put("qyDate", citySet);

					}
					if ("韶关".equals(citySet.getAREANAME())) {

						map.put("sgDate", citySet);

					}
					if ("云浮".equals(citySet.getAREANAME())) {

						map.put("yfDate", citySet);

					}
					if ("深圳".equals(citySet.getAREANAME())) {

						map.put("szDate", citySet);

					}
					if ("汕头".equals(citySet.getAREANAME())) {

						map.put("stDate", citySet);

					}
					if ("揭阳".equals(citySet.getAREANAME())) {

						map.put("jyDate", citySet);

					}
					if ("梅州".equals(citySet.getAREANAME())) {

						map.put("mzDate", citySet);

					}
					if ("潮州".equals(citySet.getAREANAME())) {

						map.put("czDate", citySet);

					}
					if ("汕尾".equals(citySet.getAREANAME())) {

						map.put("swDate", citySet);

					}

					if ("东莞".equals(citySet.getAREANAME())) {

						map.put("dgDate", citySet);

					}
					if ("中山".equals(citySet.getAREANAME())) {

						map.put("zsDate", citySet);

					}
					if ("惠州".equals(citySet.getAREANAME())) {

						map.put("hzDate", citySet);

					}
					if ("珠海".equals(citySet.getAREANAME())) {

						map.put("zhDate", citySet);

					}
					if ("河源".equals(citySet.getAREANAME())) {

						map.put("hyDate", citySet);

					}
					if ("佛山".equals(citySet.getAREANAME())) {

						map.put("fsDate", citySet);

					}
					if ("江门".equals(citySet.getAREANAME())) {

						map.put("jmDate", citySet);

					}
					if ("湛江".equals(citySet.getAREANAME())) {

						map.put("zjDate", citySet);

					}
					if ("茂名".equals(citySet.getAREANAME())) {

						map.put("mmDate", citySet);

					}
					if ("阳江".equals(citySet.getAREANAME())) {

						map.put("yjDate", citySet);

					}

				}
	
	
		
		
		
		
		
		
	
	return map;
	
	}
	
	
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/setNewAmountKH", method = RequestMethod.POST)
	public Map<String, OverCustomer> keHuAmount(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("customerChannel  {}.", locale);
		// 根据品牌和型号查询出地市维度规划表中的数据
		Map<String, OverCustomer> map =new HashMap<String, OverCustomer>();		
		String brand = request.getParameter("select1");
		String spec = request.getParameter("select2");
		
		OverCustomer ct = new OverCustomer();
				ct.setBRANDNAME(brand);
				ct.setSPEC(spec);
				
		        
		        List<OverCustomer> citeDate = cityDateService.selectCityDateAmountAndIncomeKH(ct);

				for (OverCustomer citySet : citeDate) {

					if ("广州".equals(citySet.getAREANAME())) {
						
						
						map.put("gzDate", citySet);

						// model.addAttribute("gzdd", saleamounts);
					}

					if ("肇庆".equals(citySet.getAREANAME())) {

						map.put("zqDate", citySet);

					}

					if ("清远".equals(citySet.getAREANAME())) {

						map.put("qyDate", citySet);

					}
					if ("韶关".equals(citySet.getAREANAME())) {

						map.put("sgDate", citySet);

					}
					if ("云浮".equals(citySet.getAREANAME())) {

						map.put("yfDate", citySet);

					}
					if ("深圳".equals(citySet.getAREANAME())) {

						map.put("szDate", citySet);

					}
					if ("汕头".equals(citySet.getAREANAME())) {

						map.put("stDate", citySet);

					}
					if ("揭阳".equals(citySet.getAREANAME())) {

						map.put("jyDate", citySet);

					}
					if ("梅州".equals(citySet.getAREANAME())) {

						map.put("mzDate", citySet);

					}
					if ("潮州".equals(citySet.getAREANAME())) {

						map.put("czDate", citySet);

					}
					if ("汕尾".equals(citySet.getAREANAME())) {

						map.put("swDate", citySet);

					}

					if ("东莞".equals(citySet.getAREANAME())) {

						map.put("dgDate", citySet);

					}
					if ("中山".equals(citySet.getAREANAME())) {

						map.put("zsDate", citySet);

					}
					if ("惠州".equals(citySet.getAREANAME())) {

						map.put("hzDate", citySet);

					}
					if ("珠海".equals(citySet.getAREANAME())) {

						map.put("zhDate", citySet);

					}
					if ("河源".equals(citySet.getAREANAME())) {

						map.put("hyDate", citySet);

					}
					if ("佛山".equals(citySet.getAREANAME())) {

						map.put("fsDate", citySet);

					}
					if ("江门".equals(citySet.getAREANAME())) {

						map.put("jmDate", citySet);

					}
					if ("湛江".equals(citySet.getAREANAME())) {

						map.put("zjDate", citySet);

					}
					if ("茂名".equals(citySet.getAREANAME())) {

						map.put("mmDate", citySet);

					}
					if ("阳江".equals(citySet.getAREANAME())) {

						map.put("yjDate", citySet);

					}

				}
	
	
		
		
		
		
		
		
	
	return map;
	
	}

	
	@ResponseBody
	@RequestMapping(value = "/allDate", method = RequestMethod.POST)
	public Map<String, Object> doSomeThing(MultipartFile file,Model models, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String,Object> map = new HashMap<String,Object>();
		System.err.println("=========================" + file.getOriginalFilename());
		//String sum = "ok";
		//BrandRange br = new BrandRange();
		String brand = request.getParameter("tbrandname");
		String spec = request.getParameter("tspec");
		List<LifeDateS> list = lifeDateService.selectBrandAndSpec(brand, spec);
		LifeDate lifeDate =new LifeDate();
		CityDate cityDate = new CityDate();
		FiveLine fiveLine=new FiveLine();
		InputStream is = null;
		try {
			//is = new FileInputStream(file.getOriginalFilename());
		     is=file.getInputStream();
		
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		}
		String files = file.getOriginalFilename();

		// 工作薄
		Workbook workbook = null;
		if (files.toLowerCase().endsWith("xlsx")) {
			workbook = new XSSFWorkbook(is);
		} else if (files.toLowerCase().endsWith("xls")) {
			workbook = new HSSFWorkbook(new POIFSFileSystem(is));
		}
		// 获取Excel文档中的第一个表单
		try{
			Sheet sheet = workbook.getSheetAt(0);
			Sheet sheet1 = workbook.getSheetAt(1);
			Sheet sheet2 = workbook.getSheetAt(2);
			// 获取行数
			@SuppressWarnings("unused")
			int rows = sheet.getLastRowNum();// 最后一行的序号 总的行数为 （rows+1）
			// PrintWriter writer = response.getWriter();
			// 对Sheet中的每一行进行迭代
			@SuppressWarnings("unused")
			String tt = "0";
			for (Row r : sheet) {
				rows++;
				// 跳过标题行
				if (r.getRowNum() < 1) {
					continue;
				} // 跳过标题行
					// 获取每行的列数
				int cellNum = r.getLastCellNum();// ---获取的是最后一列的序号
				if (cellNum < 1) {
					//tt = ("ok");
					break;
				}
				@SuppressWarnings("unused")
				String row = r.toString();
				// 文本初步校验
				

				String CYCLE = r.getCell(0).getStringCellValue(); //所属周期
				int DURATION = (int) r.getCell(1).getNumericCellValue(); //持续周长
				float SALEAMOUNT = (float) r.getCell(2).getNumericCellValue(); // 销量
				float INCOME = (float) r.getCell(3).getNumericCellValue(); // 收入
				float MAORI = (float) r.getCell(4).getNumericCellValue(); // 毛利
				float OVERAMOUNT = (float) r.getCell(5).getNumericCellValue(); // 覆盖客户
				float SHARE = (float) r.getCell(6).getNumericCellValue(); // 份额
				float TURNOVERTIME = (float) r.getCell(7).getNumericCellValue(); //库存周转
				if(CYCLE.equals("导入期")) {
					lifeDate.setCYCLE("1");					
				}
				if(CYCLE.equals("成长期")) {
					lifeDate.setCYCLE("2");					
				}
				if(CYCLE.equals("成熟期")) {
					lifeDate.setCYCLE("3");					
				}
				if(CYCLE.equals("衰退期")) {
					lifeDate.setCYCLE("4");					
				}
				if(CYCLE.equals("汇总")) {
					lifeDate.setCYCLE("5");					
				}
				
				lifeDate.setBRANDNAME(brand);
				lifeDate.setSPEC(spec);
				lifeDate.setDURATION(DURATION);
				lifeDate.setSALEAMOUNT(SALEAMOUNT);
				lifeDate.setINCOME(INCOME);
				lifeDate.setMAORI(MAORI);
				lifeDate.setOVERAMOUNT(OVERAMOUNT);
				lifeDate.setSHARE(SHARE);
				lifeDate.setTURNOVERTIME(TURNOVERTIME);
			//对数据库中是否存在原有数据进行判断
				if(null == list || list.size() ==0) {
				//执行增加的操作
					int t = lifeDateService.insertLifeDate(lifeDate);
					map.put("t", t);
				}if(list!=null && !list.isEmpty()) {
					
					int i = lifeDateService.updateLifeDate(lifeDate);
					map.put("i", i);
					
				}
				
			}
		//下一个sheet循环    cityDateService
			for (Row r : sheet1) {
				rows++;
				// 跳过标题行
				if (r.getRowNum() < 1) {
					continue;
				} // 跳过标题行
					// 获取每行的列数
				int cellNum = r.getLastCellNum();// ---获取的是最后一列的序号
				if (cellNum < 1) {
					//tt = ("ok");
					break;
				}
				@SuppressWarnings("unused")
				String row = r.toString();
				// 文本初步校验
				

				String AREANAME = r.getCell(0).getStringCellValue(); //城市
				float SALEAMOUNTS = (float) r.getCell(1).getNumericCellValue(); //销量
				float INCOMES = (float) r.getCell(2).getNumericCellValue(); // 收入
				float OVERAMOUNTS = (float) r.getCell(3).getNumericCellValue(); // 覆盖客户
				
				CityDate oneCityDate = cityDateService.selectCiteDate(brand, spec, AREANAME);
				
				cityDate.setBRANDNAME(brand);
				cityDate.setSPEC(spec);
				cityDate.setAREANAME(AREANAME);
				cityDate.setSALEAMOUNTS(SALEAMOUNTS);
				cityDate.setINCOMES(INCOMES);
				cityDate.setOVERAMOUNTS(OVERAMOUNTS);
			//对数据库中是否存在原有数据进行判断
				if(null == oneCityDate) {
				//执行增加的操作
					int t = cityDateService.insertCityDate(cityDate);
					map.put("t", t);
				}if(null != oneCityDate ) {
					
					int i = cityDateService.updateCityDate(cityDate);
					map.put("i", i);
					
				}
				
			}
//五线七口导入     FiveLine fiveAndLine = fiveLineService.selectFine(brand, spec, LINENAME_1, PORTNAME1_1);
			for (Row r : sheet2) {
				rows++;
				// 跳过标题行
				if (r.getRowNum() < 1) {
					continue;
				} // 跳过标题行
					// 获取每行的列数
				int cellNum = r.getLastCellNum();// ---获取的是最后一列的序号
				if (cellNum < 1) {
					//tt = ("ok");
					break;
				}
				@SuppressWarnings("unused")
				String row = r.toString();
				// 文本初步校验
				

				String lINENAME = r.getCell(0).getStringCellValue(); //五线名称
				String PORTNAME = r.getCell(1).getStringCellValue(); //七口名称				
				float SALEAMOUNT = (float) r.getCell(2).getNumericCellValue(); // 销量
				float INCOME = (float) r.getCell(3).getNumericCellValue(); // 收入
				float MAORI = (float) r.getCell(4).getNumericCellValue(); // 毛利
				FiveLine five = fiveLineService.selectFine(brand, spec, lINENAME, PORTNAME);
				fiveLine.setBRANDNAME(brand);
				fiveLine.setSPEC(spec);
				fiveLine.setLINENAME(lINENAME);
				fiveLine.setPORTNAME(PORTNAME);
				fiveLine.setSALEAMOUNT(SALEAMOUNT);
				fiveLine.setINCOME(INCOME);
				fiveLine.setMAORI(MAORI);
			//对数据库中是否存在原有数据进行判断
				if(null == five) {
				//执行增加的操作
					int t = fiveLineService.insertFiveLine(fiveLine);
					map.put("t", t);
				}if(null != five ) {
					
					int i = fiveLineService.updateFiveLine(fiveLine);
					map.put("i", i);
					
				}
				
			}	
			
			
			
			
			
			}catch(Exception e){
			//异常处理
				
			}
		

		return map;

	}		
	
	
	
}
