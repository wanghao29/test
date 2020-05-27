package com.asiainfo.cmc.service.impl.brandmodel;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.brandmodel.ProductInformation;
import com.asiainfo.cmc.mapper.brandmodel.ProductInformationMapper;
import com.asiainfo.cmc.service.brandmodel.ProductInformationService;

/*
 * 
 */
@Service
@Transactional
public class ProductInformationServiceImpl implements ProductInformationService {

	 @Resource
	 private ProductInformationMapper productInformationMapper;

	@Override
	public int insertProductInformation(ProductInformation pt) {
		// TODO Auto-generated method stub
		return productInformationMapper.insertProductInformation(pt);
	}

	@Override
	public int updateProductInformation(ProductInformation pt) {
		// TODO Auto-generated method stub
		return productInformationMapper.updateProductInformation(pt);
	}

	@Override
	public List<ProductInformation> selectAllProductInformation() {
		// TODO Auto-generated method stub
		return productInformationMapper.selectAllProductInformation();
	}

	@Override
	public List<ProductInformation> selectProductInformations(String BRANDNAME, String SPEC) {
		// TODO Auto-generated method stub
		return productInformationMapper.selectProductInformations(BRANDNAME, SPEC);
	}
	
	









}
