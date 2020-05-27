package com.asiainfo.cmc.qudao.mapper;

import java.util.List;
import java.util.Map;


import com.asiainfo.cmc.qudao.enties.ZdResultCustomerDynamic;
import com.asiainfo.cmc.qudao.enties.ZdResultCustomerNormalM;
import com.asiainfo.cmc.qudao.vo.IdentifyInfoVo;
import com.asiainfo.cmc.qudao.vo.StoreBattleVo;

public interface CustomerIdentifyInfoMapper {

	List<Map<String, Object>> listCustomerIdentifyInfoByIds(IdentifyInfoVo vo);

	List<ZdResultCustomerNormalM> listCustNormal(IdentifyInfoVo vo);

	List<ZdResultCustomerDynamic> listCustDynamic(IdentifyInfoVo vo);
	
	Map<String,Object> getCustNormalFieldByMon(StoreBattleVo vo);
	Map<String,Object> getCustNormalFieldByMon2(StoreBattleVo vo);
	Map<String,Object> getHallNormalFieldByMon(StoreBattleVo vo);
	
	public List<Map<String,Object>> getCustNormalFieldByMons(StoreBattleVo vo);
	
	public List<Map<String, Object>> listCustomerIdentifyInfoChange(IdentifyInfoVo vo);
	

}
