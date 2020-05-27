package com.asiainfo.cmc.qudao.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.brandmodel.OverCustomer;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.enties.HallBrndTttt;
import com.asiainfo.cmc.qudao.mapper.CusChanPortrayMapper;
import com.asiainfo.cmc.qudao.mapper.HallBrndTtttMapper;
import com.asiainfo.cmc.qudao.service.IHallBrndTtttService;
import com.asiainfo.cmc.qudao.utils.PortrayIntegration;
import com.asiainfo.cmc.qudao.vo.BrndCoverVo;

@Service
@Transactional
public class HallBrndTtttService implements IHallBrndTtttService{

	@Resource
	private  HallBrndTtttMapper hallBrndTtttMapper;
    @Resource
    private CusChanPortrayMapper cusChanPortrayMapper;

	@Override
	public List<HallBrndTttt> getHallBrndTttt(BrndCoverVo vo) {
		return hallBrndTtttMapper.getHallBrndTttt(vo);
	}
	@Override
	public List<Map<String, Object>> getMapHallBrndTttt(BrndCoverVo vo) {
		return hallBrndTtttMapper.getMapHallBrndTttt(vo);
	}

	@Override
	public Map<String,String> listCntANdNumByMons(BrndCoverVo vo) {
		List<Map<String, Object>> resultMapList = hallBrndTtttMapper.listCntANdNumByMons(vo);		
		return PortrayIntegration.resultSetList2Map(resultMapList, vo.getMonths());
	}

	@Override
	public List<String> listBrand(BrndCoverVo vo) {
		return hallBrndTtttMapper.listBrand(vo);
	}

	@Override
	public List<CusChanPortray> listPortrayFieldInHallBrandTttt() {
		return cusChanPortrayMapper.listPortrayFieldInHallBrandTttt();
	}
	@Override
	public List<String> listCoverBrand(String startMonth,String endMonth,String brandname,String areaname) {
		// TODO Auto-generated method stub
		return hallBrndTtttMapper.listCoverBrand(startMonth, endMonth,brandname, areaname);
	} 
	@Override
	public List<HallBrndTttt> getHallBrndTttt1(BrndCoverVo vo) {
		// TODO Auto-generated method stub
		return hallBrndTtttMapper.getHallBrndTttt1(vo);
	}
	@Override
	public Map<String, String> listCntANdNumByMons1(BrndCoverVo vo) {
		List<Map<String, Object>> resultMapList = hallBrndTtttMapper.listCntANdNumByMons1(vo);		
		return PortrayIntegration.resultSetList2Map(resultMapList, vo.getMonths());
	}
	
	
}
