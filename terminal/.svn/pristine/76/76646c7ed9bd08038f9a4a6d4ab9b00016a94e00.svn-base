package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.ProductSalesRate;

import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface ProductSalesRateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProductSalesRate record);

    int insertSelective(ProductSalesRate record);

    ProductSalesRate selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProductSalesRate record);

    int updateByPrimaryKey(ProductSalesRate record);

    List<ProductSalesRate> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<ProductSalesRate> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<ProductSalesRate> getLastData(@Param("endMonth")String endMonth);

    void updateByTargetVal(@Param("starMonth")String starMonth, @Param("endMonth")String endMonth,  @Param("mbz")String mbz);

    ProductSalesRate selectProductSalesRate(@Param("month")String month);
    
    List<String> getZdcpsByMonth(@Param("month")String month);
    
    void updateProductSalesRateByMonth(ProductSalesRate record);
    
    Integer getCountByMonth(@Param("month")String month);
    
    String queryKhxlByBand( Map<String,Object> params);
    
}