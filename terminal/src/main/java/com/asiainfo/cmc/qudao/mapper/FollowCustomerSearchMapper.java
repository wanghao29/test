package com.asiainfo.cmc.qudao.mapper;

import java.util.List;

import com.asiainfo.cmc.qudao.enties.FollowCustomerSearch;
import com.asiainfo.cmc.qudao.vo.FollowCustomerSearchVo;

public interface FollowCustomerSearchMapper {
	
	public FollowCustomerSearch getMaxValue(FollowCustomerSearchVo followCustomerSearchVo);
	
	public List<String> listOrga_ZD_RESULT_CUSTOMER_DYNAMIC_D(FollowCustomerSearchVo followCustomerSearchVo);
	public List<String> listOrga_ZD_RESULT_CUSTOMER_NORMAL_M(FollowCustomerSearchVo followCustomerSearchVo);
	
	public List<String> listOrga_ZD_CTMS_SO_D(FollowCustomerSearchVo followCustomerSearchVo);
	public List<String> listOrga_ZD_CTMS_SI_D(FollowCustomerSearchVo followCustomerSearchVo);
	
	public List<String> listOrga_zd_result_cust_portrait_new_m_pj(FollowCustomerSearchVo followCustomerSearchVo);
	public List<String> listOrga_zd_result_cust_portrait_new_m(FollowCustomerSearchVo followCustomerSearchVo);
	public List<FollowCustomerSearch> listCust_zd_result_cust_portrait_new_m(FollowCustomerSearchVo followCustomerSearchVo);

}
