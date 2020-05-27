package com.asiainfo.cmc.service.impl.weekReport;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.weekReport.Distribution;
import com.asiainfo.cmc.enties.weekReport.Retail;
import com.asiainfo.cmc.mapper.weekReport.DistributionMapper;
import com.asiainfo.cmc.service.weekReport.DistributionService;
@Service
@Transactional
public class DistributionServiceImpl implements DistributionService {
	 @Resource
	private DistributionMapper distributionMapper;
	
	@Override
	public List<Distribution> selectMonthDistribution(String dodate, String dodate1) {
		// TODO Auto-generated method stub
		
		
		return distributionMapper.selectMonthDistribution(dodate, dodate1);
	}

	@Override
	public List<Distribution> selectMonthRetail(String dodate, String dodate1) {
		// TODO Auto-generated method stub
		return distributionMapper.selectMonthRetail(dodate, dodate1);
	}

	@Override
	public List<Distribution> selectMonthRetail1(String dodate, String dodate1) {
		// TODO Auto-generated method stub
		return distributionMapper.selectMonthRetail1(dodate, dodate1);
	}

}
