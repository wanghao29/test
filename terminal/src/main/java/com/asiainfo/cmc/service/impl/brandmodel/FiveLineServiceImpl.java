package com.asiainfo.cmc.service.impl.brandmodel;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.brandmodel.FiveLine;
import com.asiainfo.cmc.enties.brandmodel.FiveLineS;
import com.asiainfo.cmc.mapper.brandmodel.FiveLineMapper;
import com.asiainfo.cmc.service.brandmodel.FiveLineService;
@Service
@Transactional
public class FiveLineServiceImpl implements FiveLineService {

	@Resource
	 private FiveLineMapper FiveLineMapper;
	
	@Override
	public int insertFiveLine(FiveLine FL) {
		// TODO Auto-generated method stub
		return FiveLineMapper.insertFiveLine(FL);
	}

	

	@Override
	public int updateFiveLine(FiveLine FL) {
		// TODO Auto-generated method stub
		return FiveLineMapper.updateFiveLine(FL);
	}

	@Override
	public List<FiveLine> selectFiveandLine(String brand, String spec) {
		// TODO Auto-generated method stub
		return FiveLineMapper.selectFiveandLine(brand, spec);
	}



	@Override
	public List <FiveLineS> selectFiveLine(String brand, String spec) {
		// TODO Auto-generated method stub
		return FiveLineMapper.selectFiveLine(brand, spec);
	}



	@Override
	public FiveLine selectFine(String brand, String spec, String lineName, String portName) {
		// TODO Auto-generated method stub
		return FiveLineMapper.selectFine(brand, spec, lineName, portName);
	}

}
