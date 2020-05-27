package com.asiainfo.cmc.controller.cityKpi;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.CityKpi2019;
import com.asiainfo.cmc.enties.Model5G;
import com.asiainfo.cmc.enties.brandmodel.CityDate;
import com.asiainfo.cmc.enties.brandmodel.LifeDate;
import com.asiainfo.cmc.enties.brandmodel.ProductInformationSetMajor;
import com.asiainfo.cmc.service.CityKpi2019Service;

/**
 * @author WANGHAO
 * @version 创建时间：2020年3月17日 上午10:17:27
 * @ClassName 类名称
 * @Description 类描述 期初数据导入功能
 */

@Controller
@RequestMapping("/model5Gdate")
public class Model5GDateController {

	@Resource
	private CityKpi2019Service cityKpi2019Service;

	@DS("dataSource")
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		// logger.info("customerChannel {}.", locale);
		model.addAttribute("special", "model5g");
		return "cityKpi/model5g";
	}

	
	
	
	@ResponseBody
	@DS("dataSource")
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String doSomeThing(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String spare = request.getParameter("tName");
		// System.out.println(spare);
		System.err.println("=========================" + file.getOriginalFilename());

		List<Model5G> zdKpiGoalVals = new ArrayList<Model5G>();
		// 首先判断导入的数据是否已经存在

		// System.out.println("--------------------------------------------------"+month);
		InputStream is = null;
		try {
			// is = new FileInputStream(file.getOriginalFilename());
			is = file.getInputStream();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
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

		try {

			// 获取Excel文档中的第一个表单
			Sheet sheet = workbook.getSheetAt(0);
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

					break;
				}
				@SuppressWarnings("unused")
				String row = r.toString();
				r.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
				r.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
				r.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
				r.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
				r.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
				r.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
				r.getCell(6).setCellType(Cell.CELL_TYPE_STRING);
				r.getCell(7).setCellType(Cell.CELL_TYPE_STRING);
				r.getCell(8).setCellType(Cell.CELL_TYPE_STRING);
				r.getCell(9).setCellType(Cell.CELL_TYPE_STRING);
				r.getCell(10).setCellType(Cell.CELL_TYPE_STRING);

				Model5G zdKpiGoalVal = new Model5G();
				zdKpiGoalVal.setSpace1(spare);
				zdKpiGoalVal.setScmPort(r.getCell(0).getStringCellValue());// 运营中心
				zdKpiGoalVal.setPhoneKind(r.getCell(1).getStringCellValue());// 地市
				zdKpiGoalVal.setBrand(r.getCell(2).getStringCellValue());// 直接毛利率季度指标
				zdKpiGoalVal.setSpec(r.getCell(3).getStringCellValue());// 直接毛利率完成
				zdKpiGoalVal.setCatched(r.getCell(4).getStringCellValue());// 直接毛利率完成比率
				zdKpiGoalVal.setModel((r.getCell(5).getStringCellValue()));// 直接毛利率得分
				zdKpiGoalVal.setRebateCatched((r.getCell(6).getStringCellValue()));// 直接净利率季度指标
				zdKpiGoalVal.setRebateTime((r.getCell(7).getStringCellValue()));// 直接净利率完成
				zdKpiGoalVal.setRebatePolicy((r.getCell(8).getStringCellValue()));// 直接净利率完成比率
				zdKpiGoalVal.setRebateRemark((r.getCell(9).getStringCellValue()));// 直接净利率得分
				zdKpiGoalVal.setRebateKind((r.getCell(10).getStringCellValue()));// 运营收入全年指标

				zdKpiGoalVals.add(zdKpiGoalVal);
			}
			//List<Model5G> list = cityKpi2019Service.selectModel5g(spare);

			
				cityKpi2019Service.insertModel5g(zdKpiGoalVals);

			

				// cityKpi2019Service.updateSelective(zdKpiGoalVals);
				//return "update";
			

		} catch (Exception e) {
			return "no";

		}

		return "ok";
	}


	
   // 页面一加载就执行的方法
	
	@RequestMapping(value = "/modelList", method = RequestMethod.GET)
    public String list(Model model, HttpSession session,HttpServletRequest request, Map<String, Object> map,
    @RequestParam(value="pageNumber") String pageNumber){
		String phoneKind = request.getParameter("phoneKind");
		String brand = request.getParameter("brand");
		String spec = request.getParameter("spec");
		String pp = request.getParameter("pp");
		if("2".equals(pp)){
			if(!"".equals(phoneKind) && phoneKind!=null ){
			
				session.setAttribute("phoneKind", phoneKind);
				
			}
	        if(!"".equals(brand) && brand!=null){
	        	
	        	session.setAttribute("brand", brand);
				
			}
	        if(!"".equals(spec) && spec!=null){
	        	
	        	session.setAttribute("spec", spec);
				
			}
			
			
			
		}
		if("1".equals(pp)){
			if(!"".equals(phoneKind) && phoneKind!=null ){
				session.removeAttribute("phoneKind");
				session.setAttribute("phoneKind", phoneKind);
				
			}if("".equals(phoneKind)){
				
				session.removeAttribute("phoneKind");
				
			}
			
	        if(!"".equals(brand) && brand!=null){
	        	 session.removeAttribute("brand");
	        	 session.setAttribute("brand", brand);
				
			}if("".equals(brand)){
				session.removeAttribute("brand");
				
			}
	        if(!"".equals(spec) && spec!=null){
	        	session.removeAttribute("spec");  
	        	session.setAttribute("spec", spec);
				
			}if("".equals(spec)){
				session.removeAttribute("spec");  
			}
	        
			
			
			
		}

		model.addAttribute("special", "modelInternet");
		Map<String, Object> map1=new HashMap();
		map1.put("phoneKind", phoneKind);
		map1.put("brand", brand);
		map1.put("spec", spec);
        String spPage=pageNumber;
        //设置每页条数
        int pageSize=14;
        //页数
        int pageNo=0;
        if(spPage==null){
            pageNo=1;
        }else {
            pageNo = Integer.valueOf(spPage);
            if (pageNo < 1) {
                pageNo = 1;
            }
        }
        //设置最大页数
        int totalCount=0;
        int count=cityKpi2019Service.getSize(map1);
        if(count>0){
            totalCount=count;
        }
        int maxPage=totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1;
        if(pageNo>maxPage){
            pageNo=maxPage;
        }
        int tempPageNo=(pageNo-1)*pageSize;
        //计算总数量
        //分页查询
        map=new HashMap();
        map.put("phoneKind", phoneKind);
		map.put("brand", brand);
		map.put("spec", spec);
        map.put("pageNo",tempPageNo);
        map.put("pageSize",pageSize);
        try {
        	List<Map> all = cityKpi2019Service.pageList(map);
        	 model.addAttribute("pageNo",pageNo);
             model.addAttribute("totalCount",totalCount);
             model.addAttribute("maxPage",maxPage);
             //Object mss = session.getAttribute("mss");
             Object msg = session.getAttribute("msg");
             Object det = session.getAttribute("det");
             session.removeAttribute("mss");
             session.removeAttribute("msg");
             session.removeAttribute("det");      
             model.addAttribute("fns",all);
        
        } catch (Exception e) {
			// TODO: handle exception
		String message="无数据。";	
        	
		session.setAttribute("mss", message);
        	return "cityKpi/model5g";
			
		}
        
       
        return "cityKpi/model5g";
    }
	
//修改操作数据展示到模态框
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/updateD", method = RequestMethod.POST)
	public Map<String, Object> cityShowAndSet(Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		

		
		String id= request.getParameter("id");
		int i = Integer.parseInt(id);
		
		
		Map<String, Object> map = new HashMap<String, Object>();

		// 城市维度数据
		Model5G model5G =cityKpi2019Service.selectOne(i);

		map.put("md", model5G);
		return map;

	}
	
	//对期初数据进行更新和增加操作
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/updateModel", method = RequestMethod.POST)
	public int addAndUpdateLifeDate1(Model5G model5g, Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		
		System.out.println(model5g);
		Integer id = model5g.getId();
		int sum = 0;
		Model5G pm = new Model5G();
		try {
			Model5G model5G =cityKpi2019Service.selectOne(id);
			if (model5G == null) {
				// 添加
				@SuppressWarnings("unused")
				int insertLifeDate = cityKpi2019Service.insertOne(model5g);
				

				System.err.println(insertLifeDate);
				sum = 1;

			}
			if (model5G != null) {
				// 修改

				@SuppressWarnings("unused")
				int updateLifeDate = cityKpi2019Service.updateOne(model5g);

				
				System.err.println(updateLifeDate);

				sum = 2;
			}

		} catch (Exception e) // Exception 为最大的异常
		{
			sum = 0;
		}

		return sum;

	}
	
	
	
	
	//对期初数据进行删除操作
	
		@ResponseBody
		@DS("dataSource")@RequestMapping(value = "/deleteModel", method = RequestMethod.POST)
		public int addAndU(Model5G model5g, Locale locale, Model model, HttpServletRequest request,
				HttpServletResponse response) {
			
			System.out.println(model5g);
			Integer id = model5g.getId();
			int sum = 0;
			
			try {
				int model5G =cityKpi2019Service.deleteOne(id);
				if(model5G==1){
					
					 sum = 1;
				}
					


			} catch (Exception e) // Exception 为最大的异常
			{
				 sum = 2;	
			}

			return sum;

		}
	
	
	
	
	
	
	
	
	
}
