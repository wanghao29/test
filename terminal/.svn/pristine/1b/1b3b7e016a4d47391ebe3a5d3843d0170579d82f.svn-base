package com.asiainfo.cmc.service.gfKpi.channelDevelopment.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.gfKpi.channelDevelopment.QualityCustomerTargetValue;
import com.asiainfo.cmc.mapper.gfKpi.channelDevelopment.QualityCustomerTargetValueMapper;
import com.asiainfo.cmc.service.gfKpi.channelDevelopment.IQualityCustomerTargetValueService;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class QualityCustomerTargetValueService implements IQualityCustomerTargetValueService {
	@Resource
	private QualityCustomerTargetValueMapper qualityCustomerTargetValueMapper;
	@Override
	public  PageInfo<QualityCustomerTargetValue> queryData(Map<String, Object> params) {
		List<QualityCustomerTargetValue> outList = new ArrayList<QualityCustomerTargetValue>();
		outList = qualityCustomerTargetValueMapper.queryData(params);
		 PageInfo<QualityCustomerTargetValue> pageInfo = new PageInfo<QualityCustomerTargetValue>(outList);
		return pageInfo;
	}

	@Override
	public void calculatedScore(String startMonth, String endMonth) {
		// TODO Auto-generated method stub
		qualityCustomerTargetValueMapper.calculatedScore(startMonth, endMonth);
	}

}
