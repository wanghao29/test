package com.asiainfo.cmc.controller.brandRangeSet;


import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.brandmodel.BrandPrice;
import com.asiainfo.cmc.service.brandmodel.BrandPriceService;


@Controller()
@RequestMapping(value = "/uploadFilePrice")
public class UploadFilePriceController {
	@Resource
	private BrandPriceService brandPriceService;
	@ResponseBody
	@DS("dataSource")@RequestMapping(value="/test", method = RequestMethod.POST)
	public Map<String, Object> doSomeThing1(MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IOException {
		Map<String,Object> map = new HashMap<String,Object>();
		String months = request.getParameter("month");
		int month = Integer.parseInt(months);
		List<BrandPrice> list = brandPriceService.selectBrandPriceNew(month);
		if(null == list || list.size() ==0 ){
           
			int i = brandPriceService.insertBrandPrice1(file, request, response);
	 	   	map.put("i",i);

			}else{

				map.put("i",2);

			}
		
		
 	   	return map;
	}
	@ResponseBody
	@DS("dataSource")@RequestMapping(value="/test1", method = RequestMethod.POST)
	public Map<String, Object> doSomeThing(MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IOException {

		System.err.println("========================="+file.getOriginalFilename());
		Map<String,Object> map = new HashMap<String,Object>();
		BrandPrice bp=new BrandPrice();
		String months = request.getParameter("month");
		int month = Integer.parseInt(months);
	//	System.out.println("--------------------------------------------------"+month);
		InputStream is = null;
		try {
			//is = new FileInputStream(file.getOriginalFilename());
			is=file.getInputStream();
		
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String	files=file.getOriginalFilename();
		
		//工作薄
		Workbook workbook = null;
		if(files.toLowerCase().endsWith("xlsx")){
			workbook=new XSSFWorkbook(is);
		}else if(files.toLowerCase().endsWith("xls")){
			workbook = new HSSFWorkbook(new POIFSFileSystem(is));
		}
		
	       try {
	       
	    	 //获取Excel文档中的第一个表单
	   		Sheet sheet = workbook.getSheetAt(0);
	   		//获取行数
	   		@SuppressWarnings("unused")
			int rows= sheet.getLastRowNum();//最后一行的序号  总的行数为  （rows+1）
	   		//PrintWriter writer = response.getWriter();
	   		//对Sheet中的每一行进行迭代
	           @SuppressWarnings("unused")
			String tt="0";
	   		for (Row r : sheet) {
	   			rows ++;
	   			// 跳过标题行
	   			if(r.getRowNum()<1){
	   			continue;
	   			}// 跳过标题行
	   			//获取每行的列数
	   			int cellNum = r.getLastCellNum();//---获取的是最后一列的序号
	   			if(cellNum<1) {
	   				
	   				break;
	   			}
	   			@SuppressWarnings("unused")
				String row=r.toString();

	   			String city = r.getCell(0).getStringCellValue();		//地市
	   			double total = r.getCell(1).getNumericCellValue();	    //总量
	   			double value1 = r.getCell(2).getNumericCellValue();		//价格1
	   			double value2 = r.getCell(3).getNumericCellValue();		//价格2
	   			double value3 = r.getCell(4).getNumericCellValue();		//价格3
	   			double value4 =r.getCell(5).getNumericCellValue();	    //价格4
	   			double value5 = r.getCell(6).getNumericCellValue();		//价格5
	   			double value6 = r.getCell(7).getNumericCellValue();	    //价格6
	   			double value7 = r.getCell(8).getNumericCellValue();		//价格7
	   			double value8 = r.getCell(9).getNumericCellValue();		//价格8
	   			
	   			bp.setCity(city);
	   			bp.setTotal(total);
	   			bp.setValue1(value1);
	   			bp.setValue2(value2);
	   			bp.setValue3(value3);
	   			bp.setValue4(value4);
	   			bp.setValue5(value5);
	   			bp.setValue6(value6);
	   			bp.setValue7(value7);
	   			bp.setValue8(value8);
	   	        bp.setType(1);
	   	        bp.setMonth(month); 
	    	   
	    	   int i = brandPriceService.insertBrandPrice(bp);  
	    	   map.put("i",i);
	   		} 
	   		}catch(Exception e) {
   
	       
	       }   
      
	       return map;
	}
     
	
	       
	 

	//根据月份查询品牌数据

	@ResponseBody
	@DS("dataSource")@RequestMapping(value="/selectPrice", method = RequestMethod.POST)
	public List<BrandPrice> doSomeThings(HttpServletRequest request,HttpServletResponse response) throws IOException  {
		
		String months=request.getParameter("month");
	     
		String month3=request.getParameter("month2");
		String cityNam=request.getParameter("cityNam");    
	     Integer month=Integer.parseInt(months);
	     	     
	     Integer month2=Integer.parseInt(month3);
	     
	    return brandPriceService.selectBrandPrice(month, month2,cityNam);

	}

}
