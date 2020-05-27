package com.asiainfo.cmc.service.impl.weekReport;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.weekReport.Salf4G;
import com.asiainfo.cmc.mapper.weekReport.Salf4GMapper;
import com.asiainfo.cmc.service.weekReport.Salf4GService;
@Service
@Transactional
public class Salf4GServiceImpl implements Salf4GService {
	 @Resource
	private Salf4GMapper salf4GMapper;
	
	@Override
	public List<Salf4G> selectMonthDistribution(String dodate, String dodate1) {
		// TODO Auto-generated method stub
		return salf4GMapper.selectMonthDistribution(dodate, dodate1);
	}

	@Override
	public List<Salf4G> selectMonthRetail(String dodate, String dodate1) {
		// TODO Auto-generated method stub
		return salf4GMapper.selectMonthRetail(dodate, dodate1);
	}

	@Override
	public List<Salf4G> selectMonthRetail1(String dodate, String dodate1) {
		// TODO Auto-generated method stub
		return salf4GMapper.selectMonthRetail1(dodate, dodate1);
	}

}
