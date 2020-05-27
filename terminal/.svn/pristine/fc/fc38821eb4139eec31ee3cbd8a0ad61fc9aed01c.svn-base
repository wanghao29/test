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
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.brandmodel.BrandPrice;
import com.asiainfo.cmc.enties.brandmodel.BrandRange;
import com.asiainfo.cmc.service.brandmodel.BrandRangeService;

/**
 * 
 * @author Administrator 上传文件
 */

@Controller("uploadControl")
@RequestMapping(value = "/uploadFile")
public class UploadFileController {

	@Resource
	private BrandRangeService brandRangeService;
 
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/test1", method = RequestMethod.POST)
	public Map<String, Object> doSomeThing(MultipartFile file,Model models, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String,Object> map = new HashMap<String,Object>();
		System.err.println("=========================" + file.getOriginalFilename());
		//String sum = "ok";
		BrandRange br = new BrandRange();
		String months = request.getParameter("month");
		int month = Integer.parseInt(months);
	//	System.out.println("--------------------------------------------------" + month);
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
					//tt = ("ok");
					break;
				}
				@SuppressWarnings("unused")
				String row = r.toString();
				// 文本初步校验
				/*
				 * if(cellNum != 12){ errDataList.add(TxtRow.buildErrRow(rowNum, row,
				 * "数据行格式错误，正确格式为“|”分隔有且只有14列。")); continue; }
				 */
				// 获取每个单元格的数据
				/*
				 * r.getCell(0); r.getCell(1); r.getCell(2); r.getCell(3); r.getCell(4);
				 * r.getCell(5); r.getCell(6); r.getCell(7); r.getCell(8); r.getCell(9);
				 * r.getCell(10); r.getCell(11);
				 */
				try{
				String city = r.getCell(0).getStringCellValue(); // 地市
				double total = r.getCell(1).getNumericCellValue(); // 总量
				double oppo = r.getCell(2).getNumericCellValue(); // oppo
				double vivo = r.getCell(3).getNumericCellValue(); // vivio
				double huawei = r.getCell(4).getNumericCellValue(); // 华为
				double apple = r.getCell(5).getNumericCellValue(); // 苹果
				double rongyao = r.getCell(6).getNumericCellValue(); // 荣耀
				double mi = r.getCell(7).getNumericCellValue(); // 小米
				double meizu = r.getCell(8).getNumericCellValue(); // 魅族
				double cmcc = r.getCell(9).getNumericCellValue(); // 中国移动
				double sumsing = r.getCell(10).getNumericCellValue(); // 三星
				double other = r.getCell(11).getNumericCellValue(); // 其他
				br.setCity(city);
				br.setTotal(total);
				br.setOppo(oppo);
				br.setVivo(vivo);
				br.setHuawei(huawei);
				br.setApple(apple);
				br.setRongyao(rongyao);
				br.setMi(mi);
				br.setMeizu(meizu);
				br.setCmcc(cmcc);
				br.setSumsing(sumsing);
				br.setOther(other);
				br.setMonth(month);
				br.setType(1);
	            
				
				
					
					 
					 	
				
			
			}catch(Exception e){
			//异常处理
				map.put("i",0);
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); 
				
			}
				 brandRangeService.insertBrandRange(br);	
				//map.put("i",i);
            }

		return map;

	}

    
    
  
   	@ResponseBody
   	@DS("dataSource")@RequestMapping(value = "/test", method = RequestMethod.POST)
   	public Map<String, Object> doSomeThing1(MultipartFile file,Model models, HttpServletRequest request, HttpServletResponse response)
   			throws IOException {
   		Map<String,Object> map = new HashMap<String,Object>();
   		String months = request.getParameter("month");
		int month = Integer.parseInt(months);
		List<BrandRange> list = brandRangeService.selectBrandPriceNew(month);
		if(null == list || list.size() ==0 ){
           
			int i = brandRangeService.insertBrandPrice1(file, request, response);
	 	   	map.put("i",i);

			}else{

				map.put("i",2);

			}
   		
   		//int i = brandRangeService.insertBrandPrice1(file, request, response);
   		//map.put("i", i);

   		return map;

   	}
    
    
	// 查询出所有的品牌信息

	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value="/selectList", method = RequestMethod.POST)
	public List<BrandRange> doSomeThings(HttpServletRequest request,HttpServletResponse response) throws IOException  {
		
		String months=request.getParameter("month");
	     
		String month3=request.getParameter("month2");
		
		String abSet=request.getParameter("abSet");
	     	     
	     Integer month=Integer.parseInt(months);	     
	     
	     Integer month2=Integer.parseInt(month3);
	        
	     return brandRangeService.selectBrandRanges(month, month2,abSet); 
	

	}

}
