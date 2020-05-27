package com.asiainfo.cmc.service.brandmodel;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.asiainfo.cmc.enties.brandmodel.BrandPrice;
/**
 * 
 * @author Administrator
 *
 */

public interface BrandPriceService {
	@Transactional
    public int insertBrandPrice1 (MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IOException;

	@Transactional
	public int insertBrandPrice (BrandPrice bp);

	
	List<BrandPrice> selectBrandPrice(int month,int month2,String cityNam);

	List<BrandPrice> selectBrandPriceNew(int month);
	





}
