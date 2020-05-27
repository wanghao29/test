package com.asiainfo.cmc.qudao.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.qudao.enties.CellBrndTttt;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.mapper.CellBrndTtttMapper;
import com.asiainfo.cmc.qudao.mapper.CusChanPortrayMapper;
import com.asiainfo.cmc.qudao.service.ICellBrndTtttService;
import com.asiainfo.cmc.qudao.utils.PortrayIntegration;
import com.asiainfo.cmc.qudao.vo.BrndCoverVo;

@Service
@Transactional
public class CellBrndTtttService implements ICellBrndTtttService{

	@Resource
	private  CellBrndTtttMapper cellBrndTtttMapper;
    @Resource
    private CusChanPortrayMapper cusChanPortrayMapper;

	@Override
	public List<CellBrndTttt> getCellBrndTttt(BrndCoverVo vo) {
		return cellBrndTtttMapper.getCellBrndTttt(vo);
	}
	@Override
	public List<CellBrndTttt> getCellBrndTttt1(BrndCoverVo vo) {
		// TODO Auto-generated method stub
		return cellBrndTtttMapper.getCellBrndTttt1(vo);
	}
	@Override
	public List<Map<String, Object>> getMapCellBrndTttt(BrndCoverVo vo) {
		return cellBrndTtttMapper.getMapCellBrndTttt(vo);
	}

	@Override
	public Map<String,String> listCntANdNumByMons(BrndCoverVo vo) {
		List<Map<String, Object>> resultMapList = cellBrndTtttMapper.listCntANdNumByMons(vo);
		return PortrayIntegration.resultSetList2Map(resultMapList, vo.getMonths());
	}

	@Override
	public List<String> listBrand(BrndCoverVo vo) {
		return cellBrndTtttMapper.listBrand(vo);
	}

	@Override
	public List<CusChanPortray> listPortrayFieldInCellBrandTttt() {
		return cusChanPortrayMapper.listPortrayFieldInCellBrandTttt();
	}
	@Override
	public Map<String, String> listCntANdNumByMons1(BrndCoverVo vo) {
		List<Map<String, Object>> resultMapList = cellBrndTtttMapper.listCntANdNumByMons1(vo);
		return PortrayIntegration.resultSetList2Map(resultMapList, vo.getMonths());
	}
	
	
}
