package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.SalesShare4G;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SalesShare4GMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(@Param("params") Map<String,String> params);

    int insertSelective(SalesShare4G record);

    SalesShare4G selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(@Param("params") Map<String,String> params);

    int updateByPrimaryKey(@Param("params") Map<String,String> params);

    List<SalesShare4G> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<SalesShare4G> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<SalesShare4G> getLastData(@Param("endMonth") String endMonth);

    void updateByTargetVal(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("sgtzx") String sgtzx,@Param("mbcs") String mbcs);

    void updateByReceivePayment(SalesShare4G SalesShare4G);

    Map getKeyData();

    Float getLastMonthWcqkzb(@Param("teampMonth")String teampMonth);

    Float getLastYearWcqkzb(@Param("teampMonth")String teampMonth);

    SalesShare4G selectSalesShare(@Param("month")String month);
}