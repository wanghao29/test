package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.AverageProfit;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AverageProfitMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AverageProfit record);

    int insertSelective(AverageProfit record);

    AverageProfit selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AverageProfit record);

    int updateByPrimaryKey(AverageProfit record);

    List<AverageProfit> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<AverageProfit> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<AverageProfit> getLastData(@Param("endMonth")String endMonth);

    void updateByTargetVal(@Param("starMonth")String starMonth, @Param("endMonth")String endMonth, @Param("htzygsl")String htzygsl, @Param("lwpqygsl")String lwpqygsl, @Param("df")String df);

    AverageProfit selectAverageProfit(@Param("month") String month);
}