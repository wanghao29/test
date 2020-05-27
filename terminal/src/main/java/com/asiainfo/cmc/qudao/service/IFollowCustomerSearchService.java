package com.asiainfo.cmc.qudao.service;

import java.util.List;

import com.asiainfo.cmc.qudao.enties.FollowCustomerSearch;
import com.asiainfo.cmc.qudao.vo.FollowCustomerSearchVo;

public interface IFollowCustomerSearchService {

	public FollowCustomerSearch getMaxValue(FollowCustomerSearchVo followCustomerSearchVo);
	
	public List<FollowCustomerSearch> listFollowCustomer(FollowCustomerSearchVo followCustomerSearchVo);
}
