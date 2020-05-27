package com.asiainfo.cmc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.asiainfo.cmc.enties.BrandProductSalesIncome;
@Repository
public interface BrandProductSalesIncomeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BrandProductSalesIncome record);

    int insertSelective(BrandProductSalesIncome record);

    BrandProductSalesIncome selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Map<String, Object> params);

    int updateByPrimaryKey(BrandProductSalesIncome record);

    List<BrandProductSalesIncome> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page") Integer page, @Param("pageSize") Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page") Integer page, @Param("pageSize") Integer pageSize);

    List<BrandProductSalesIncome> getEchartData(@Param("starMonth") String startMonth, @Param("endMonth") String endMonth);

    List<BrandProductSalesIncome> getLastData(@Param("endMonth") String endMonth);

    void updateByTargetVal(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("zyppsjsrmbz") String zyppsjsrmbz, @Param("zyppdxtzdsrmbz") String zyppdxtzdsrmbz);

    void update(Map<String, Object> params);

    BrandProductSalesIncome selectBrandSalesIncome(@Param("month") String month);
}
