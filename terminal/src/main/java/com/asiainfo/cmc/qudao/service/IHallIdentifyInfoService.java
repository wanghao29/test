package com.asiainfo.cmc.qudao.service;

import java.util.List;

import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.enties.ZdResultHallDynamicD;
import com.asiainfo.cmc.qudao.enties.ZdResultHallNormalM;
import com.asiainfo.cmc.qudao.vo.IdentifyInfoVo;

public interface IHallIdentifyInfoService {
	
	 /**
     * 获取厅店特征信息画像列表信息,根据ids
     */
    public List<CusChanPortray> listHallIdentifyInfoByIds(IdentifyInfoVo vo);
    
	 /**
     * 获取厅店常态化
     */
    public List<ZdResultHallNormalM> listHallNormal(IdentifyInfoVo vo);

	 /**
     * 获取厅店动态化
     */
	public List<ZdResultHallDynamicD> listHallDynamic(IdentifyInfoVo vo);
	
	
	
	
}
