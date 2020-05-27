package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.CustomerSaleTargetVal;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CustomerSaleTargetValMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CustomerSaleTargetVal record);

    int insertSelective(CustomerSaleTargetVal record);

    CustomerSaleTargetVal selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CustomerSaleTargetVal record);

    int updateByPrimaryKey(CustomerSaleTargetVal record);

    List<CustomerSaleTargetVal> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<CustomerSaleTargetVal> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<CustomerSaleTargetVal> getLastData(@Param("endMonth")String endMonth);

    void updateByTargetVal(@Param("starMonth")String starMonth, @Param("endMonth")String endMonth,  @Param("mbz")String mbz);

    Map getKeyData();

    String getLastMonthWcqkzb(@Param("teampMonth")String teampMonth);

    String getLastYearWcqkzb(@Param("teampMonth")String teampMonth);

    CustomerSaleTargetVal selectCustomerSaleVal(@Param("month") String month);
    
    List<Map<String,String>>  queryKaCustomerCode();
    String queryCustomerSales(Map<String,Object> param);
    CustomerSaleTargetVal queryCustomerSaleByMonth(@Param("month") String month);



}