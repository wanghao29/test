package com.asiainfo.cmc.qudao.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.enties.ZdResultCustomerDynamic;
import com.asiainfo.cmc.qudao.enties.ZdResultCustomerNormalM;
import com.asiainfo.cmc.qudao.mapper.CusChanPortrayMapper;
import com.asiainfo.cmc.qudao.mapper.CustomerIdentifyInfoMapper;
import com.asiainfo.cmc.qudao.service.ICustomerIdentifyInfoService;
import com.asiainfo.cmc.qudao.utils.MyDateFormat;
import com.asiainfo.cmc.qudao.utils.PortrayIntegration;
import com.asiainfo.cmc.qudao.vo.IdentifyInfoVo;
@Service
@Transactional
public class CustomerIdentifyInfoService implements ICustomerIdentifyInfoService{
	
    @Resource
    private CusChanPortrayMapper cusChanPortrayMapper;
    @Resource
    private CustomerIdentifyInfoMapper customerIdentifyInfoMapper;
    
	@Override
	public List<CusChanPortray> listCustomerIdentifyInfoByIds(IdentifyInfoVo vo) {
		List<CusChanPortray> portrays = cusChanPortrayMapper.listCustomerIdentifyInfoByIds(vo);
		List<Map<String, Object>> hallIdentifyInfoByMonths = customerIdentifyInfoMapper.listCustomerIdentifyInfoByIds(vo);
		List<String> months = MyDateFormat.getMonthBetween(vo.getStartMonth(),vo.getEndMonth());
		PortrayIntegration.showType2(hallIdentifyInfoByMonths,portrays,months,"SMONTH");
		return portrays;
	}

	@Override
	public List<ZdResultCustomerNormalM> listCustNormal(IdentifyInfoVo vo) {
		return customerIdentifyInfoMapper.listCustNormal(vo);
	}

	@Override
	public List<ZdResultCustomerDynamic> listCustDynamic(IdentifyInfoVo vo) {
		return customerIdentifyInfoMapper.listCustDynamic(vo);
	}

	@Override
	public List<CusChanPortray> listCustomerIdentifyInfoChange(IdentifyInfoVo vo) {
		// TODO Auto-generated method stub
		List<CusChanPortray> portrays = cusChanPortrayMapper.listCustomerIdentifyInfoByIds(vo);
		List<Map<String, Object>> hallIdentifyInfoByMonths = customerIdentifyInfoMapper.listCustomerIdentifyInfoChange(vo);
		List<String> months = MyDateFormat.getMonthBetween(vo.getStartMonth(),vo.getEndMonth());
		PortrayIntegration.showType2(hallIdentifyInfoByMonths,portrays,months,"SMONTH");
		
		
		
		return portrays;
	}
    
}
