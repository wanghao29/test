package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.FeeProgressBalance;
import com.asiainfo.cmc.enties.FeeProgressBalance;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface FeeProgressBalanceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(FeeProgressBalance record);

    int insertSelective(FeeProgressBalance record);

    FeeProgressBalance selectByPrimaryKey(Integer id);

 

    int updateByPrimaryKey(FeeProgressBalance record);

    List<FeeProgressBalance> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<FeeProgressBalance> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<FeeProgressBalance> getLastData(@Param("endMonth")String endMonth);

    void updateByTargetVal( @Param("endMonth")String endMonth,  @Param("sgtzx")String sgtzx ,  @Param("bhdjhrglcbys")String bhdjhrglcbys);
    void updateFyjdAndDf( @Param("endMonth")String endMonth);
    
    Map getKeyData();

    String getLastMonthWcqkzb(@Param("teampMonth")String teampMonth);

    String getLastYearWcqkzb(@Param("teampMonth")String teampMonth);

    List<FeeProgressBalance> selectFeeProgressBalanceue(@Param("month")String month);
    
     FeeProgressBalance selectFeeProgressBalance(@Param("month")String month);
}