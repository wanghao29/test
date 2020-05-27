package com.asiainfo.cmc.qudao.service;

import java.util.List;

import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.enties.ZdResultCustomerDynamic;
import com.asiainfo.cmc.qudao.enties.ZdResultCustomerNormalM;
import com.asiainfo.cmc.qudao.vo.IdentifyInfoVo;

public interface ICustomerIdentifyInfoService {

	public List<CusChanPortray> listCustomerIdentifyInfoByIds(IdentifyInfoVo vo);

	public List<ZdResultCustomerNormalM> listCustNormal(IdentifyInfoVo vo);

	public List<ZdResultCustomerDynamic> listCustDynamic(IdentifyInfoVo vo);
	
	
	public List<CusChanPortray> listCustomerIdentifyInfoChange(IdentifyInfoVo vo);
	
	
	
}
