package com.asiainfo.cmc.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.ProvinceAdjustField;
import com.asiainfo.cmc.enties.ZdKpiCfgAdjust;
import com.asiainfo.cmc.enties.ZdKpiCfgAdjustLog;
import com.asiainfo.cmc.mapper.ZdKpiCfgAdjustMapper;
import com.asiainfo.cmc.service.ZdKpiCfgAdjustService;
/**
 * kpi 调整
 * @author yuxuandong
 *
 */
@Service
@Transactional
public class ZdKpiCfgAdjustServiceImpl implements ZdKpiCfgAdjustService {
	
	@Resource
	private ZdKpiCfgAdjustMapper zdKpiCfgAdjustMapper;

	@Override
	public List<ZdKpiCfgAdjust> getDataByKpiName(Map<String, Object> param) {
		List<ZdKpiCfgAdjust> list = zdKpiCfgAdjustMapper.getDataByKpiName(param);
		return list;
	}

	@Override
	public Map<String,String> getDataByParam(Map<String, Object> param) {
		Map<String,String> provinceAdjustField=zdKpiCfgAdjustMapper.getDataByParam(param);
		return provinceAdjustField;
	}

	@Override
	public void updateAdjust(Map<String,Object> param) {
		zdKpiCfgAdjustMapper.updateAdjust(param);
	}
	@Override
	public void updateAdjustMbz(Map<String,Object> param) {
		zdKpiCfgAdjustMapper.updateAdjustMbz(param);
	}

	@Override
	public void insertLog(Map<String, Object> param) {
		zdKpiCfgAdjustMapper.insertLog(param);
	}

	@Override
	public List<ZdKpiCfgAdjustLog> getAdjustLogTable(Map<String, Object> param) {
		return zdKpiCfgAdjustMapper.getAdjustLogTable(param);
	}

	@Override
	public Integer getTotalByParam(Map<String, Object> param) {
		return zdKpiCfgAdjustMapper.getTotalByParam(param);
	}

	@Override
	public List<String> getFieldNames(Map<String, Object> params) {
		return zdKpiCfgAdjustMapper.getFieldNames(params);
	}

}
