package com.asiainfo.cmc.service.impl.brandmodel;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.brandmodel.LifeDate;
import com.asiainfo.cmc.enties.brandmodel.LifeDateS;
import com.asiainfo.cmc.mapper.brandmodel.LifeDateMapper;
import com.asiainfo.cmc.service.brandmodel.LifeDateService;

@Service
@Transactional
public class LifeDateServiceImpl implements LifeDateService {

	
	@Resource
	 private LifeDateMapper lifeDateMapper;
	
	@Override
	public int insertLifeDate(LifeDate LD) {
		// TODO Auto-generated method stub
		return lifeDateMapper.insertLifeDate(LD);
	}

	@Override
	public List<LifeDate> selectLifeDate(LifeDate LD) {
		// TODO Auto-generated method stub
		return lifeDateMapper.selectLifeDate(LD);

}

	@Override
	public int updateLifeDate(LifeDate LD) {
		// TODO Auto-generated method stub
		return lifeDateMapper.updateLifeDate(LD);
	}

	@Override
	public List<LifeDateS> selectBrandAndSpec(String brand, String spec) {
		// TODO Auto-generated method stub
		List<LifeDateS> list = lifeDateMapper.selectBrandAndSpec(brand, spec);
		return list;
	}

	@Override
	public LifeDate selectAddAndUpdate(String brand, String spec, String CYCLE) {
		// TODO Auto-generated method stub
		return lifeDateMapper.selectAddAndUpdate(brand, spec, CYCLE);
	}

	@Override
	public LifeDate selectTotal(String brand, String spec) {
		// TODO Auto-generated method stub
		return lifeDateMapper.selectTotal(brand, spec);
	}

	@Override
	public List<LifeDate> selectAllLife(String brand, String spec) {
		// TODO Auto-generated method stub
		return lifeDateMapper.selectAllLife(brand, spec);
	}

	@Override
	public List<LifeDate> selectBrandAndSpecS(String brand, String spec) {
		// TODO Auto-generated method stub
		return lifeDateMapper.selectBrandAndSpecS(brand, spec);
	}
}