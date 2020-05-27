package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.TerminalSales;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TerminalSalesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TerminalSales record);

    int insertSelective(TerminalSales record);

    TerminalSales selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TerminalSales record);

    int updateByPrimaryKey(TerminalSales record);

    List<TerminalSales> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<TerminalSales> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<TerminalSales> getLastData(@Param("endMonth")String endMonth);

    void updateByTargetVal(@Param("starMonth")String starMonth, @Param("endMonth")String endMonth,  @Param("mbz")String mbz);

    TerminalSales selectTerminalSales(@Param("month") String month);
    
    void update(Map<String, Object> params);

}