package com.asiainfo.cmc.service.impl.brandmodel;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.brandmodel.RecordEntry;
import com.asiainfo.cmc.mapper.brandmodel.RecordMapper;
import com.asiainfo.cmc.service.brandmodel.RecordService;
@Service
@Transactional
public class RecordServiceImpl implements RecordService {
@Resource
private RecordMapper recordMapper;

	@Override
	public List<RecordEntry> selectAllUser(RecordEntry records) {
		// TODO Auto-generated method stub
		return recordMapper.selectAllUser(records);
	}

	@Override
	public int insertOneUserInformation(RecordEntry records) {
		// TODO Auto-generated method stub
		
		
		
		return recordMapper.insertOneUserInformation(records);
	}

	@Override
	public int updateUserInformation(RecordEntry records) {
		// TODO Auto-generated method stub
		return recordMapper.updateUserInformation(records);
	}

}
