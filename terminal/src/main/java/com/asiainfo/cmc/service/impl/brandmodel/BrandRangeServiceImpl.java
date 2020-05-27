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

import com.asiainfo.cmc.enties.brandmodel.BrandRange;

import com.asiainfo.cmc.mapper.brandmodel.BrandRangeMapper;
import com.asiainfo.cmc.service.brandmodel.BrandRangeService;
@Service
@Transactional
public class BrandRangeServiceImpl implements BrandRangeService {
     @Resource
	 private BrandRangeMapper brandRangeMapper;

	

	@Override
	public List<BrandRange> selectBrandRanges(int month, int month2,String abSet) {
		List<BrandRange> selectBrandRanges2 = brandRangeMapper.selectBrandRanges2(month, month2);		
		return selectBrandRanges2;
	}

	@Override
	@Transactional(rollbackFor = { Exception.class })
	public int insertBrandPrice1(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// TODO Auto-generated method stub
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
   		int err = 1;
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
   				err = brandRangeMapper.insertBrandRange(br);	
   			
   			}catch(Exception e){
   			//异常处理
   				err=0;
   				//TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); 
   				
   			}
   				
   				
               }
		
		
		
		return err;
	}

	@Override
	@Transactional
	public int insertBrandRange(BrandRange br) {
		// TODO Auto-generated method stub
	 return	brandRangeMapper.insertBrandRange(br);
		
	}

	@Override
	public List<BrandRange> selectBrandPriceNew(int month) {
		// TODO Auto-generated method stub
		return brandRangeMapper.selectBrandPriceNew(month);
	}

	
	

}


