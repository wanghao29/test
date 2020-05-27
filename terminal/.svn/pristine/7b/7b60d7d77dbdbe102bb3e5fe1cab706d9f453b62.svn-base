package com.asiainfo.cmc.mapper.brandmodel;

import java.util.List;

import com.asiainfo.cmc.enties.brandmodel.RecordEntry;
/**
 * 设置操盘记录的接口
 * @author Administrator
 *表名 recor_set_user
 */
public interface RecordMapper {

	
	//根据对象查询用户所存的操盘信息	
	List <RecordEntry> selectAllUser(RecordEntry records);

	//用户存储一个操盘记录
	int insertOneUserInformation (RecordEntry records);		
	
	//用户根据品牌型号和id查询是否有保存过的记录，有记录则更新信息

	int updateUserInformation (RecordEntry records);
	
	
}
