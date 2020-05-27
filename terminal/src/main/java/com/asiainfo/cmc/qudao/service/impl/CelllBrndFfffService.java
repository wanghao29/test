package com.asiainfo.cmc.qudao.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.qudao.enties.CellBrndFfff;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.mapper.CellBrndFfffMapper;
import com.asiainfo.cmc.qudao.mapper.CusChanPortrayMapper;
import com.asiainfo.cmc.qudao.service.ICellBrndFfffService;
import com.asiainfo.cmc.qudao.utils.PortrayIntegration;
import com.asiainfo.cmc.qudao.vo.BrndCoverVo;

@Service
@Transactional
public class CelllBrndFfffService implements ICellBrndFfffService{
	
	@Resource
	private CellBrndFfffMapper cellBrndFfffMapper;
    @Resource
    private CusChanPortrayMapper cusChanPortrayMapper;

	@Override
	public List<CellBrndFfff> getCellBrndFfff(BrndCoverVo vo) {
		return cellBrndFfffMapper.getCellBrndFfff(vo);
	}
	@Override
	public List<Map<String, Object>> getMapCellBrndFfff(BrndCoverVo vo) {
		return cellBrndFfffMapper.getMapCellBrndFfff(vo);
	}

	@Override
	public Map<String,String> listCntANdNumByMons(BrndCoverVo vo) {
		List<Map<String, Object>> resultMapList = cellBrndFfffMapper.listCntANdNumByMons(vo);
		return PortrayIntegration.resultSetList2Map(resultMapList, vo.getMonths());
	}

	@Override
	public List<CusChanPortray> listPortrayFieldInCellBrandFfff() {
		return cusChanPortrayMapper.listPortrayFieldInCellBrandFfff();
	}
	@Override
	public List<CellBrndFfff> getCellBrndFfff1(BrndCoverVo vo) {
		// TODO Auto-generated method stub
		return cellBrndFfffMapper.getCellBrndFfff1(vo);
	}
	@Override
	public Map<String, String> listCntANdNumByMons1(BrndCoverVo vo) {
		List<Map<String, Object>> resultMapList = cellBrndFfffMapper.listCntANdNumByMons1(vo);
		return PortrayIntegration.resultSetList2Map(resultMapList, vo.getMonths());
	}

}
