package com.asiainfo.cmc.service.impl.brandmodel;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.brandmodel.BrandEnty;
import com.asiainfo.cmc.mapper.brandmodel.BrandEntyMapper;
import com.asiainfo.cmc.service.brandmodel.BrandEntyService;
@Service
@Transactional
public class BrandEntyServiceImpl implements BrandEntyService {

	 @Resource
	 private BrandEntyMapper brandEntyMapper;
	
	 @Override
	public List<String> selectBrand() {
		// TODO Auto-generated method stub
		return brandEntyMapper.selectBrand();
	}

	@Override
	public List<String> selectModel(BrandEnty bety) {
		// TODO Auto-generated method stub
		return brandEntyMapper.selectModel(bety);
	}

	@Override
	public List<String> selectOtherBrand() {
		// TODO Auto-generated method stub
		return brandEntyMapper.selectOtherBrand();
	}

	@Override
	public List<String> selectOtherModel(BrandEnty bety) {
		// TODO Auto-generated method stub
		return brandEntyMapper.selectOtherModel(bety);
	}

	@Override
	public List<String> selectPrice(String price, String price1) {
		// TODO Auto-generated method stub
		return brandEntyMapper.selectPrice(price, price1);
	}

	@Override
	public List<String> selectBrandAndModelPrice(BrandEnty bety) {
		// TODO Auto-generated method stub
		return brandEntyMapper.selectBrandAndModelPrice(bety);
	}

	@Override
	public List<String> selectListModel(String price, String price1, String term_brnd_nam) {
		// TODO Auto-generated method stub
		return brandEntyMapper.selectListModel(price, price1, term_brnd_nam);
	}

	@Override
	public List<String> selectPriceBI(String price, String price1) {
		// TODO Auto-generated method stub
		return brandEntyMapper.selectPriceBI(price, price1);
	}

	@Override
	public List<String> selectBrandAndModelPriceBI(BrandEnty bety) {
		// TODO Auto-generated method stub
		return brandEntyMapper.selectBrandAndModelPriceBI(bety);
	}

	@Override
	public List<String> selectListModelBI(String price, String price1, String term_brnd_nam) {
		// TODO Auto-generated method stub
		return brandEntyMapper.selectListModelBI(price, price1, term_brnd_nam);
	}

}
