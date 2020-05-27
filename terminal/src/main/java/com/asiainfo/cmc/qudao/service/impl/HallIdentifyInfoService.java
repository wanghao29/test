package com.asiainfo.cmc.qudao.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.enties.ZdResultHallDynamicD;
import com.asiainfo.cmc.qudao.enties.ZdResultHallNormalM;
import com.asiainfo.cmc.qudao.mapper.CusChanPortrayMapper;
import com.asiainfo.cmc.qudao.mapper.HallIdentifyInfoMapper;
import com.asiainfo.cmc.qudao.service.IHallIdentifyInfoService;
import com.asiainfo.cmc.qudao.utils.MyDateFormat;
import com.asiainfo.cmc.qudao.utils.PortrayIntegration;
import com.asiainfo.cmc.qudao.vo.IdentifyInfoVo;

@Service
@Transactional
public class HallIdentifyInfoService implements IHallIdentifyInfoService{
	
    @Resource
    private CusChanPortrayMapper cusChanPortrayMapper;
    @Resource
    private HallIdentifyInfoMapper hallIdentifyInfoMapper;

	@Override
	public List<CusChanPortray> listHallIdentifyInfoByIds(IdentifyInfoVo vo) {
		List<CusChanPortray> portrays = cusChanPortrayMapper.listHallIdentifyInfoByIds(vo);
		List<String> months = MyDateFormat.getMonthBetween(vo.getStartMonth(), vo.getEndMonth());
		vo.setMonths(months);
		if(vo.getAreaname().equals("")) {
			List<Map<String, Object>> hallIdentifyInfoByMonths = hallIdentifyInfoMapper.listHallIdentifyInfoByChange(vo);
			PortrayIntegration.showType2(hallIdentifyInfoByMonths,portrays,months,"SMONTH");	
		}else {
		List<Map<String, Object>> hallIdentifyInfoByMonths = hallIdentifyInfoMapper.listHallIdentifyInfoByMonths(vo);
		PortrayIntegration.showType2(hallIdentifyInfoByMonths,portrays,months,"SMONTH");
		}
		return portrays;
	}

	@Override
	public List<ZdResultHallNormalM> listHallNormal(IdentifyInfoVo vo) {
		return hallIdentifyInfoMapper.listHallNormal(vo);
	}

	@Override
	public List<ZdResultHallDynamicD> listHallDynamic(IdentifyInfoVo vo) {
		return hallIdentifyInfoMapper.listHallDynamic(vo);
	}

}
