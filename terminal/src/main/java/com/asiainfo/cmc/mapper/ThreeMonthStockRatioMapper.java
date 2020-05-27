package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.ThreeMonthStockRatio;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;
import java.util.Map;

public interface ThreeMonthStockRatioMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ThreeMonthStockRatio record);

    int insertSelective(ThreeMonthStockRatio record);

    ThreeMonthStockRatio selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ThreeMonthStockRatio record);

    int updateByPrimaryKey(ThreeMonthStockRatio record);

    List<ThreeMonthStockRatio> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<ThreeMonthStockRatio> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<ThreeMonthStockRatio> getLastData(@Param("endMonth") String endMonth);

    void updateByTargetVal(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("mkhjx") String sgtzx,@Param("id") int id);

    Map getKeyData();

    Integer getLastMonthWcqkzb(@Param("teampMonth")String teampMonth);

    Integer getLastMonthWcqkzb2(@Param("teampMonth")String teampMonth);

    Integer getLastMonthWcqkzb3(@Param("teampMonth")String teampMonth);

    Integer getLastYearWcqkzb(@Param("teampMonth")String teampMonth);

    Integer getLastYearWcqkzb2(@Param("teampMonth")String teampMonth);

    Integer getLastYearWcqkzb3(@Param("teampMonth")String teampMonth);
    
    ThreeMonthStockRatio selectThreeMonthStockRatio(@Param("month")String month);
    
 
    List<Map<String,String>> queryBrandMdlDesc();
    List<Map<String,String>> queryModelDesc(String[] brand_id);
    List<Map<String,String>> queryConfigureDesc(   Map<String,Object> params);
    List<Map<String,String>> queryMaterialIdAndDesc( Map<String,Object> params);
    void  updateMaterialIdAndDesc(  @Param("params")  Map<String,Object> params);
    
    
    void callTHREE_MONTH_STOCK_RATIO( @Param("endMonth") String endMonth, @Param("mkhjx_in") String mkhjx_in);
    
    public  ThreeMonthStockRatio  overview( Map<String,Object> params);
    
}