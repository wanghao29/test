package com.asiainfo.cmc.qudao.mapper;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.qudao.enties.ZdResultHallDynamicD;
import com.asiainfo.cmc.qudao.enties.ZdResultHallNormalM;
import com.asiainfo.cmc.qudao.vo.IdentifyInfoVo;
import com.asiainfo.cmc.qudao.vo.StoreBattleVo;

public interface HallIdentifyInfoMapper {
	
	public List<Map<String,Object>> listHallIdentifyInfoByMonths(IdentifyInfoVo vo);

	 /**
     * 获取厅店常态化
     */
	public List<ZdResultHallNormalM> listHallNormal(IdentifyInfoVo vo);

	 /**
     * 获取厅店动态化
     */
	public List<ZdResultHallDynamicD> listHallDynamic(IdentifyInfoVo vo);
	
	Map<String,Object> getHallNormalFieldByMon(StoreBattleVo vo);
	Map<String,Object> getHallNormalFieldByMons(StoreBattleVo vo);

	public List<Map<String, Object>> listHallIdentifyInfoByChange(IdentifyInfoVo vo);

}
