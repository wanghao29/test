package com.asiainfo.cmc.qudao.mapper;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.qudao.enties.SevenPort;
import com.asiainfo.cmc.qudao.enties.ZdHallTshop;
import com.asiainfo.cmc.qudao.vo.StoreBattleVo;

public interface CustomerChannelMapper {
	/**
	 * 获取所有的厂商(orgacode、厂商名)
	 */
	public List<StoreBattleVo> listAllCustomer(StoreBattleVo vo);
	
	public List<StoreBattleVo> listAllCustomerNull(StoreBattleVo vo);
	
	/**
	 * 七口客商查询
	 */
	public List<SevenPort> sevenListAllCustomer(SevenPort vo);
	
	/**
	 *厅店属性查询
	 */
	
	public List<SevenPort> hallListPort(SevenPort vo);
	
	/**
	 * 厅店
	 * @param vo
	 * @return
	 */
	public List<StoreBattleVo> listAllHallNew(StoreBattleVo vo);
	/**
	 * 根据厂商获取其下门店(orgacode、厂商名)
	 */
	public List<StoreBattleVo> listHallByCustomer(StoreBattleVo vo);
	/**
	 * 根据厂商名称、厂商编码，模糊查询
	 */
	public List<StoreBattleVo> vagueQuery(StoreBattleVo vo);
	public List<StoreBattleVo> vagueQuery1(StoreBattleVo vo);
	/**
	 * 根据列名、orgacode、月份 获取列值，作为画像信息
	 */
    public Map<String,Object> getCustomerFieldByMon(StoreBattleVo vo);
    public Map<String,Object> getCustomerFieldByMon2(StoreBattleVo vo);
    public Map<String,Object> getHallFieldByMon(StoreBattleVo vo);
    
    public Map<String,Object> getHallFieldByMonQuanshen(StoreBattleVo vo);
    
    public List<Map<String,Object>> getCustomerFieldByMons(StoreBattleVo vo);
    public List<Map<String,Object>> getCustomerFieldByMonsAll(StoreBattleVo vo);
    public List<Map<String,Object>> getHallFieldByMons(StoreBattleVo vo);
    public List<Map<String,Object>> getHallFieldByMons1(StoreBattleVo vo);
    public List<Map<String,Object>> getHallFieldByMons11(StoreBattleVo vo);
    
    //以下是门店作战地图
	/**
	 *  
	 * 当门店id不为空：获取该门店5公里范围内不属于改厂商的其他门店
	 */
	public List<StoreBattleVo> listOtherHalls(StoreBattleVo vo);
	
	public Map<String,Object> getHallHallStoreBattleByMon(StoreBattleVo vo);
	public List<Map<String,Object>> getHallHallStoreBattleByMons(StoreBattleVo vo);
	
	public Map<String,Object> getCustHallStoreBattleFieldByMon(StoreBattleVo vo);
	public List<Map<String,Object>> getCustHallStoreBattleFieldByMons(StoreBattleVo vo);
	/**
	 * 获取所有的厅店
	 */
	public List<String> listAllHall(ZdHallTshop vo);
}
