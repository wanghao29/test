package com.asiainfo.cmc.service.impl.brandmodel;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.brandmodel.AbsoluteRange;
import com.asiainfo.cmc.enties.brandmodel.CityDate;
import com.asiainfo.cmc.enties.brandmodel.CityDateS;
import com.asiainfo.cmc.enties.brandmodel.OverCustomer;
import com.asiainfo.cmc.mapper.brandmodel.CityDateMapper;
import com.asiainfo.cmc.service.brandmodel.CityDateService;
@Service
@Transactional
public class CityDateServiceImpl implements CityDateService {

	@Resource
	 private CityDateMapper cityDateMapper;
	
	
	@Override
	public int insertCityDate(CityDate CT) {
		// TODO Auto-generated method stub
		return cityDateMapper.insertCityDate(CT);
	}

	@Override
	public List<CityDateS> selectCityDate(CityDateS CT) {
		// TODO Auto-generated method stub
		return cityDateMapper.selectCityDate(CT);
	}

	@Override
	public int updateCityDate(CityDate CT) {
		// TODO Auto-generated method stub
		
		
		
		return cityDateMapper.updateCityDate(CT);
	}

	@Override
	public CityDate selectCiteDate(String brand, String spec,String city) {
		// TODO Auto-generated method stub
		
		return (CityDate) cityDateMapper.selectCiteDate(brand, spec,city);
	}

	@Override
	public int insertCityDateNew(CityDate cityDate) {
		// TODO Auto-generated method stub
		return cityDateMapper.insertCityDateNew(cityDate);
	}

	@Override
	public int updateCityDateIncome(CityDate CT) {
		// TODO Auto-generated method stub
		return cityDateMapper.updateCityDateIncome(CT);
	}

	@Override
	public int updateCityDateOver(CityDate CT) {
		// TODO Auto-generated method stub
		return cityDateMapper.updateCityDateOver(CT);
	}

	@Override
	public int updateCityDateAmountXL(CityDate CT) {
		// TODO Auto-generated method stub
		return cityDateMapper.updateCityDateAmountXL(CT);
	}

	@Override
	public List<AbsoluteRange> selectCityDateAmountAndIncome(AbsoluteRange CT) {
		// TODO Auto-generated method stub
		return cityDateMapper.selectCityDateAmountAndIncome(CT);
	}

	@Override
	public List<OverCustomer> selectCityDateAmountAndIncomeKH(OverCustomer ct) {
		// TODO Auto-generated method stub
		return cityDateMapper .selectCityDateAmountAndIncomeKH(ct);
	}

	

}
