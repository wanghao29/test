package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.NewRetailOperation;
import com.asiainfo.cmc.enties.NewRetailOperation;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface NewRetailOperationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(@Param("params") Map<String,String> params);
    
    public int updateByMonth(@Param("params")  Map<String,String> params) ;

    int insertSelective(NewRetailOperation record);

    NewRetailOperation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(NewRetailOperation record);

    int updateByPrimaryKey(NewRetailOperation record);

    List<NewRetailOperation> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<NewRetailOperation> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<NewRetailOperation> getLastData(@Param("endMonth")String endMonth);

    void updateByTargetVal(@Param("starMonth")String starMonth, @Param("endMonth")String endMonth,  @Param("xlsmdhj")String mbz);

    NewRetailOperation selectNewRetail(@Param("month")String month);
}