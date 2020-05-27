package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.TerminalSaleShare;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface TerminalSaleShareMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TerminalSaleShare record);

    int insertSelective(TerminalSaleShare record);

    TerminalSaleShare selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TerminalSaleShare record);

    int updateByPrimaryKey(TerminalSaleShare record);

    List<TerminalSaleShare> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<TerminalSaleShare> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<TerminalSaleShare> getLastData(@Param("endMonth")String endMonth);

    void updateByTargetVal(@Param("starMonth")String starMonth, @Param("endMonth")String endMonth,  @Param("tzxl")String mbz);

    TerminalSaleShare selectTerminalSaleShare(@Param("month")String month);
}