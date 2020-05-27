package com.asiainfo.cmc.service.impl.weekReport;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.brandmodel.OverCustomer;
import com.asiainfo.cmc.enties.brandmodel.OverCustomers;
import com.asiainfo.cmc.enties.weekReport.DMAmount;
import com.asiainfo.cmc.mapper.weekReport.DMAmountMapper;

import com.asiainfo.cmc.service.weekReport.DMAmountService;
@Service
@Transactional
public class DMAmountServiceImpl implements DMAmountService {
	@Resource
	private DMAmountMapper dMAmountMapper;
	
	
	
	
	@Override
	public List<DMAmount> selectMonthDistribution(String dodate, String dodate1) {
		// TODO Auto-generated method stub
		return dMAmountMapper.selectMonthDistribution(dodate, dodate1);
	}

	@Override
	public List<DMAmount> selectMonthRetail(String dodate, String dodate1) {
		// TODO Auto-generated method stub
		return dMAmountMapper.selectMonthRetail(dodate, dodate1);
	}

	@Override
	public List<DMAmount> selectMonthRetail1(String dodate, String dodate1) {
		// TODO Auto-generated method stub
		return dMAmountMapper.selectMonthRetail1(dodate, dodate1);
	}

	@Override
	public List<OverCustomers> listCoverBrand(String startMonth, String endMonth, String brandname, String areaname) {
		// TODO Auto-generated method stub
		return dMAmountMapper.listCoverBrand(startMonth, endMonth, brandname, areaname);
	}

	@Override
	public List<OverCustomers> listCoverBrand1(String startMonth, String endMonth, String brandname, String areaname) {
		// TODO Auto-generated method stub
		return dMAmountMapper.listCoverBrand1(startMonth, endMonth, brandname, areaname);
	}

}
