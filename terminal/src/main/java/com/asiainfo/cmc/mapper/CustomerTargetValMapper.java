package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.CustomerTargetVal;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CustomerTargetValMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CustomerTargetVal record);

    int insertSelective(CustomerTargetVal record);

    CustomerTargetVal selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CustomerTargetVal record);

    int updateByPrimaryKey(CustomerTargetVal record);

    List<CustomerTargetVal> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<CustomerTargetVal> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<CustomerTargetVal> getLastData(@Param("endMonth")String endMonth);

    void updateByTargetVal(@Param("starMonth")String starMonth, @Param("endMonth")String endMonth,  @Param("mbz")String mbz);

    Map getKeyData();

    String getLastMonthWcqkzb(@Param("teampMonth")String teampMonth);

    String getLastYearWcqkzb(@Param("teampMonth")String teampMonth);

    CustomerTargetVal selectCustomerTargetValue(@Param("month")String month);
}