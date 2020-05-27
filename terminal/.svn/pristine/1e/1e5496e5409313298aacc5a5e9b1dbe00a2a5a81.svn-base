package com.asiainfo.cmc.service.impl.weekReport;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.weekReport.ContractPhone;
import com.asiainfo.cmc.mapper.weekReport.ContractPhoneMapper;
import com.asiainfo.cmc.service.weekReport.ContractPhoneService;
@Controller
@Transactional
public class ContractPhoneServiceImpl implements ContractPhoneService {
  @Resource
  private ContractPhoneMapper contractPhoneMapper;
	@Override
	public List<ContractPhone> selectMonthDistribution(String dodate, String dodate1) {
		// TODO Auto-generated method stub
		return contractPhoneMapper.selectMonthDistribution(dodate, dodate1);
	}

	@Override
	public List<ContractPhone> selectMonthRetail(String dodate, String dodate1) {
		// TODO Auto-generated method stub
		return contractPhoneMapper.selectMonthRetail(dodate, dodate1);
	}

	@Override
	public List<ContractPhone> selectMonthRetail1(String dodate, String dodate1) {
		// TODO Auto-generated method stub
		return contractPhoneMapper.selectMonthRetail1(dodate, dodate1);
	}

}
