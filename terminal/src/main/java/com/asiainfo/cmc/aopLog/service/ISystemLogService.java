package com.asiainfo.cmc.aopLog.service;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.aopLog.Log;
import com.github.pagehelper.PageInfo;

public interface ISystemLogService {
	public Integer insertSystemLog(Log log);
	public PageInfo<Log> queryData(Map<String, Object> params);
	public List<Log> exportExcel(Map<String, Object> params);
	public void  updateLoginOutTime(Log log);
}
