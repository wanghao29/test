package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.StockTurnoverRatio;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StockTurnoverRatioMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(StockTurnoverRatio record);

    int insertSelective(StockTurnoverRatio record);

    StockTurnoverRatio selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StockTurnoverRatio record);

    int updateByPrimaryKey(StockTurnoverRatio record);

    List<StockTurnoverRatio> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<StockTurnoverRatio> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<StockTurnoverRatio> getLastData(@Param("endMonth") String endMonth);

    void updateByTargetVal(  @Param("endMonth") String endMonth, @Param("sgtzx") String sgtzx,@Param("mbz") String mbz);

    Map getKeyData();

    String getLastMonthWcqkzb(@Param("teampMonth")String teampMonth);

    String getLastYearWcqkzb(@Param("teampMonth")String teampMonth);
    
    StockTurnoverRatio selectstockTurnover(@Param("month")String month);
}