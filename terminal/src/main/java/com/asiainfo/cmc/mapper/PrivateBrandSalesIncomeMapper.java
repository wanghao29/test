package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.PrivateBrandSalesIncome;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface PrivateBrandSalesIncomeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PrivateBrandSalesIncome record);

    int insertSelective(PrivateBrandSalesIncome record);

    PrivateBrandSalesIncome selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PrivateBrandSalesIncome record);

    int updateByPrimaryKey(PrivateBrandSalesIncome record);

    List<PrivateBrandSalesIncome> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page") Integer page, @Param("pageSize") Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page") Integer page, @Param("pageSize") Integer pageSize);

    List<PrivateBrandSalesIncome> getEchartData(@Param("starMonth") String startMonth, @Param("endMonth") String endMonth);

    List<PrivateBrandSalesIncome> getLastData( @Param("endMonth") String endMonth);

    void updateByTargetVal(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("mbz") String mbz);

    void update(Map<String, Object> params);

    PrivateBrandSalesIncome selectBrandSalesIncome(@Param("month") String month);


}