package com.asiainfo.cmc.service.gfKpi.channelDevelopment.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.gfKpi.channelDevelopment.KaPhonesSalesTargetValue;
import com.asiainfo.cmc.mapper.gfKpi.channelDevelopment.KaPhonesSalesTargetValueMapper;
import com.asiainfo.cmc.service.gfKpi.channelDevelopment.IKaPhonesSalesTargetValueService;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class KaPhonesSalesTargetValueService implements IKaPhonesSalesTargetValueService {

	@Resource
	private KaPhonesSalesTargetValueMapper kaPhonesSalesTargetValueMapper;
	@Override
	public  PageInfo<KaPhonesSalesTargetValue> queryData(Map<String, Object> params) {
		List<KaPhonesSalesTargetValue> outList = new ArrayList<KaPhonesSalesTargetValue>();
		outList = kaPhonesSalesTargetValueMapper.queryData(params);
		 PageInfo<KaPhonesSalesTargetValue> pageInfo = new PageInfo<KaPhonesSalesTargetValue>(outList);
		return pageInfo;
	}

	@Override
	public void calculatedScore(String startMonth, String endMonth) {
		// TODO Auto-generated method stub
		kaPhonesSalesTargetValueMapper.calculatedScore(startMonth, endMonth);
	}

}
