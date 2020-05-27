package com.asiainfo.cmc.service.brandmodel;



import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.asiainfo.cmc.enties.brandmodel.BrandRange;

/**
 * 
 * @author Administrator
 *品牌容量设置接口
 */

public interface BrandRangeService {

int insertBrandPrice1 (MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IOException;
/*增加操作*/

public int insertBrandRange (BrandRange br);

//根据月份查询出记录
List<BrandRange> selectBrandRanges(int month,int month2,String abSet);

List<BrandRange> selectBrandPriceNew(int month);



}

