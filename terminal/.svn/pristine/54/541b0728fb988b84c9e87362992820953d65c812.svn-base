package com.asiainfo.cmc.mapper.weekReport;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.brandmodel.OverCustomer;
import com.asiainfo.cmc.enties.brandmodel.OverCustomers;
import com.asiainfo.cmc.enties.weekReport.DMAmount;
import com.asiainfo.cmc.enties.weekReport.Salf4G;

public interface DMAmountMapper {

	
	
	/**
	 * 	根据时间查询出分销表中合约机的量
	 * @param dodate
	 * @param dodate1
	 * @return
	 */
		
	List <DMAmount> selectMonthDistribution(@Param(value = "DODATE") String dodate,@Param(value = "DODATE1") String dodate1);	
	/**
	 * 查询出零售表SALETPYE为合约机，ISZD为1的sum（AMOUT），
	 * 零售表SALETPYE为合约机，ISZD为1的sum（AMOUT）
	 * @param dodate
	 * @param dodate1
	 * @return
	 */
	List<DMAmount> selectMonthRetail(@Param(value = "DODATE") String dodate,@Param(value = "DODATE1") String dodate1);	

	/**
	 * 查询出零售表SALETPYE为合约机，ISZD为1的sum（AMOUT），
	 * 零售表SALETPYE为合约机，ISZD为1的sum（AMOUT）
	 * @param dodate
	 * @param dodate1
	 * @return
	 */
	List<DMAmount> selectMonthRetail1(@Param(value = "DODATE") String dodate,@Param(value = "DODATE1") String dodate1);
	
	
	
	
	public List<OverCustomers> listCoverBrand(@Param(value = "DODATE2") String startMonth,@Param(value = "DODATE1") String endMonth,@Param(value = "BRANDNAME") String brandname,@Param(value = "AREANAME") String areaname);
	
	public List<OverCustomers> listCoverBrand1(@Param(value = "DODATE2") String startMonth,@Param(value = "DODATE1") String endMonth,@Param(value = "BRANDNAME") String brandname,@Param(value = "AREANAME") String areaname);
	
	
}
