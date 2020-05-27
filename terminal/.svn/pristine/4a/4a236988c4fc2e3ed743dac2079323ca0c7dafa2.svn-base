package com.asiainfo.cmc.mapper.weekReport;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.weekReport.ContractPhone;
import com.asiainfo.cmc.enties.weekReport.Salf4G;

public interface ContractPhoneMapper {

	
	/**
	 * 	根据时间查询出分销表中合约机的量
	 * @param dodate
	 * @param dodate1
	 * @return
	 */
		
	List <ContractPhone> selectMonthDistribution(@Param(value = "DODATE") String dodate,@Param(value = "DODATE1") String dodate1);	
	/**
	 * 查询出零售表SALETPYE为合约机，ISZD为1的sum（AMOUT），
	 * 零售表SALETPYE为合约机，ISZD为1的sum（AMOUT）
	 * @param dodate
	 * @param dodate1
	 * @return
	 */
	List<ContractPhone> selectMonthRetail(@Param(value = "DODATE") String dodate,@Param(value = "DODATE1") String dodate1);	

	/**
	 * 查询出零售表SALETPYE为合约机，ISZD为1的sum（AMOUT），
	 * 零售表SALETPYE为合约机，ISZD为1的sum（AMOUT）
	 * @param dodate
	 * @param dodate1
	 * @return
	 */
	List<ContractPhone> selectMonthRetail1(@Param(value = "DODATE") String dodate,@Param(value = "DODATE1") String dodate1);
	
	
	
	
	
	
	
}
