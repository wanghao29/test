package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.AccountsReceivableRatio;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AccountsReceivableRatioMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AccountsReceivableRatio record);

    int insertSelective(AccountsReceivableRatio record);

    AccountsReceivableRatio selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AccountsReceivableRatio record);

    int updateByPrimaryKey(AccountsReceivableRatio record);

    List<AccountsReceivableRatio> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<AccountsReceivableRatio> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<AccountsReceivableRatio> getLastData(@Param("endMonth")String endMonth);

    void updateByTargetVal(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("sgtzx") String sgtzx,@Param("mbcs") String mbcs);

    Map getKeyData();

    String getLastMonthWcqkzb(@Param("teampMonth")String teampMonth);

    String getLastMonthWcqkzb2(@Param("teampMonth")String teampMonth);


    String getLastYearWcqkzb(@Param("teampMonth")String teampMonth);

    String getLastYearWcqkzb2(@Param("teampMonth")String teampMonth);
    
    AccountsReceivableRatio selectAccountsReceivableRatio(@Param("month")String month);
    
    AccountsReceivableRatio overview(Map<String,Object> params);

}