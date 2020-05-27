package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.ReduceItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ReduceItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ReduceItem record);

    int insertSelective(ReduceItem record);

    ReduceItem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ReduceItem record);

    int updateByPrimaryKey(ReduceItem record);

    List<ReduceItem> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<ReduceItem> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<ReduceItem> getLastData(@Param("endMonth")String endMonth);

    void updateByTargetVal(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("sgtzx") String sgtzx,@Param("mbcs") String mbcs);

    void updateByReceivePayment(ReduceItem ReduceItem);

    Map getKeyData();

    Float getLastMonthWcqkzb(@Param("teampMonth")String teampMonth);

    Float getLastYearWcqkzb(@Param("teampMonth")String teampMonth);
    
    void addReduceItem(ReduceItem reduceItem);
    
    Integer getCountByMonth(@Param("month") String month);
    
   Integer updateByMonth(ReduceItem record);
}