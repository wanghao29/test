package com.asiainfo.cmc.service.weekReport;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.enties.brandmodel.OverCustomer;
import com.asiainfo.cmc.enties.brandmodel.OverCustomers;
import com.asiainfo.cmc.enties.weekReport.DMAmount;


public interface DMAmountService {

	
	/**
	 * 	根据时间查询出分销表中合约机的量
	 * @param dodate
	 * @param dodate1
	 * @return
	 */
		
	List <DMAmount> selectMonthDistribution(String dodate,String dodate1);	
	/**
	 * 查询出零售表SALETPYE为合约机，ISZD为1的sum（AMOUT），
	 * 零售表SALETPYE为合约机，ISZD为1的sum（AMOUT）
	 * @param dodate
	 * @param dodate1
	 * @return
	 */
	List<DMAmount> selectMonthRetail(String dodate,String dodate1);	

	/**
	 * 查询出零售表SALETPYE为合约机，ISZD为1的sum（AMOUT），
	 * 零售表SALETPYE为合约机，ISZD为1的sum（AMOUT）
	 * @param dodate
	 * @param dodate1
	 * @return
	 */
	List<DMAmount> selectMonthRetail1(String dodate,String dodate1);
	
	
	
	
	 public List<OverCustomers> listCoverBrand(String startMonth,String endMonth,String brandname,String areaname);
	
	 public List<OverCustomers> listCoverBrand1(String startMonth,String endMonth,String brandname,String areaname);
}
