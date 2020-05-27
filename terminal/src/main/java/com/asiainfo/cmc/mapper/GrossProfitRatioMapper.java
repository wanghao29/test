package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.GrossProfitRatio;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface GrossProfitRatioMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GrossProfitRatio record);

    int insertSelective(GrossProfitRatio record);

    GrossProfitRatio selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GrossProfitRatio record);

    int updateByPrimaryKey(GrossProfitRatio record);

    List<GrossProfitRatio> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<GrossProfitRatio> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<GrossProfitRatio> getLastData(@Param("endMonth")String endMonth);

    void updateByTargetVal(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("sgtzx") String sgtzx,@Param("mbcs") String mbcs);

    void updateBySgtzxm(GrossProfitRatio GrossProfitRatio);

    Map getKeyData();

    String getLastMonthWcqkzb(@Param("teampMonth")String teampMonth);

    String getLastMonthWcqkzb2(@Param("teampMonth")String teampMonth);

    String getLastYearWcqkzb(@Param("teampMonth")String teampMonth);

    String getLastYearWcqkzb2(@Param("teampMonth")String teampMonth);

    GrossProfitRatio selectGrossRatio(@Param("month")String month);
}