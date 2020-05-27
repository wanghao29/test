package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.RepaymentAccuracyForecast;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RepaymentAccuracyForecastMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RepaymentAccuracyForecast record);

    int insertSelective(RepaymentAccuracyForecast record);

    RepaymentAccuracyForecast selectByPrimaryKey(Integer id);
    RepaymentAccuracyForecast selectByMonth(@Param("month") String month);

    int updateByPrimaryKeySelective(RepaymentAccuracyForecast record);

    int updateByPrimaryKey(RepaymentAccuracyForecast record);

    List<RepaymentAccuracyForecast> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<RepaymentAccuracyForecast> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<RepaymentAccuracyForecast> getLastData(@Param("endMonth")String endMonth);

    void updateByTargetVal(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("sgtzx") String sgtzx,@Param("mbcs") String mbcs);

    void updateByReceivePayment(RepaymentAccuracyForecast repaymentAccuracyForecast);

    Map getKeyData();

    Float getLastMonthWcqkzb(@Param("teampMonth")String teampMonth);

    Float getLastYearWcqkzb(@Param("teampMonth")String teampMonth);
    
    RepaymentAccuracyForecast selectRepaymentAccuracyForecast(@Param("month")String month);
}