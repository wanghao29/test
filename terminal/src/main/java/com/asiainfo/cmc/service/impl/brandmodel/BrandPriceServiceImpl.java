package com.asiainfo.cmc.service.impl.brandmodel;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import com.asiainfo.cmc.enties.brandmodel.BrandPrice;

import com.asiainfo.cmc.mapper.brandmodel.BrandPriceMapper;
import com.asiainfo.cmc.service.brandmodel.BrandPriceService;
@Service
@Transactional
public class BrandPriceServiceImpl implements BrandPriceService {

	 @Resource
	 private BrandPriceMapper brandPriceMapper;
	
	
	@Override
	@Transactional(rollbackFor = { Exception.class })
	public int insertBrandPrice1(MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IOException {
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
		int err = 1;
	      
	       
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
	   		 try {
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
	   	   
	   	     
	   	      err = brandPriceMapper.insertBrandPrice(bp); 
	   
	   		}catch(Exception e) {
	   		    err=0;
	           
	   			//TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); 
	            
	       } 
	   		 
	   		
	   		 
	   		}
		   return err;
	}
	
	@Override
	@Transactional
	public int insertBrandPrice(BrandPrice bp) {
		
		brandPriceMapper.insertBrandPrice(bp);
		
		throw new RuntimeException();
		// TODO Auto-generated method stub
		//return insertBrandPrice;
	}

	@Override
	public List<BrandPrice> selectBrandPrice(int month, int month2,String cityNam) {
		
		List<BrandPrice> selectBrandPrice = brandPriceMapper.selectBrandPrice(month, month2);
		
		
		
		
		
		
		
		
		
		return selectBrandPrice;
	}

	@Override
	public List<BrandPrice> selectBrandPriceNew(int month) {
		// TODO Auto-generated method stub
		return brandPriceMapper.selectBrandPriceNew(month);
	}

}
