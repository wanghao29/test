package com.asiainfo.cmc.qudao.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.enties.HallBrndFfff;
import com.asiainfo.cmc.qudao.mapper.CusChanPortrayMapper;
import com.asiainfo.cmc.qudao.mapper.HallBrndFfffMapper;
import com.asiainfo.cmc.qudao.service.IHallBrndFfffService;
import com.asiainfo.cmc.qudao.utils.PortrayIntegration;
import com.asiainfo.cmc.qudao.vo.BrndCoverVo;

@Service
@Transactional
public class HallBrndFfffService implements IHallBrndFfffService{
	
	@Resource
	private HallBrndFfffMapper hallBrndFfffMapper;
    @Resource
    private CusChanPortrayMapper cusChanPortrayMapper;

	@Override
	public List<HallBrndFfff> getHallBrndFfff(BrndCoverVo vo) {
		return hallBrndFfffMapper.getHallBrndFfff(vo);
	}
	@Override
	public List<Map<String, Object>> getMapHallBrndFfff(BrndCoverVo vo) {
		return hallBrndFfffMapper.getMapHallBrndFfff(vo);
	}

	@Override
	public Map<String,String> listCntANdNumByMons(BrndCoverVo vo) {
		List<Map<String, Object>> resultMapList = hallBrndFfffMapper.listCntANdNumByMons(vo);
		return PortrayIntegration.resultSetList2Map(resultMapList, vo.getMonths());
	}

	@Override
	public List<CusChanPortray> listPortrayFieldInHallBrandFfff() {
		return cusChanPortrayMapper.listPortrayFieldInHallBrandFfff();
	}
	@Override
	public List<HallBrndFfff> getHallBrndFfff1(BrndCoverVo vo) {
		// TODO Auto-generated method stub
		return hallBrndFfffMapper.getHallBrndFfff1(vo);
	}
	@Override
	public Map<String, String> listCntANdNumByMons1(BrndCoverVo vo) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> resultMapList = hallBrndFfffMapper.listCntANdNumByMons1(vo);
		return PortrayIntegration.resultSetList2Map(resultMapList, vo.getMonths());
	}

	
}
