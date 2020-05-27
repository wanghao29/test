package com.asiainfo.cmc.aopLog.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.aopLog.Log;
import com.asiainfo.cmc.aopLog.mapper.SystemLogMapper;
import com.asiainfo.cmc.aopLog.service.ISystemLogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class SystemLogService implements ISystemLogService {
	@Resource
	private SystemLogMapper systemLogMapper;
	
	
	public  Integer insertSystemLog(Log log){
		return systemLogMapper.insertSystemLog(log);
	}

	@Override
	public PageInfo<Log> queryData(Map<String, Object> params) {
		List<Log> outList = new ArrayList<Log>();
		PageHelper.startPage(Integer.valueOf(params.get("page").toString()), Integer.valueOf(params.get("rows").toString()));
		outList = systemLogMapper.queryData(params);
		PageInfo<Log> pageInfo = new PageInfo<Log>(outList);
		return pageInfo;
	}

	@Override
	public void updateLoginOutTime(Log log) {
		systemLogMapper.updateLoginOutTime(log);
		
	}

	@Override
	public List<Log> exportExcel(Map<String, Object> params) {
		List<Log> outList = new ArrayList<Log>();
		outList = systemLogMapper.queryData(params);
		return outList;
	}
}
