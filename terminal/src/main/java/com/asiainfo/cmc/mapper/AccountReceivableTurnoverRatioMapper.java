package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.AccountReceivableTurnoverRatio;
import com.asiainfo.cmc.enties.AccountReceivableTurnoverRatio;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;
import java.util.Map;

public interface AccountReceivableTurnoverRatioMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AccountReceivableTurnoverRatio record);

    int insertSelective(AccountReceivableTurnoverRatio record);

    AccountReceivableTurnoverRatio selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(@Param("sgtzxm") String sgtzxm,@Param("yszkjz") String yszkjz,@Param("mbz") String mbz,@Param("month") String month);

    int updateByPrimaryKey(AccountReceivableTurnoverRatio record);

    List<AccountReceivableTurnoverRatio> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<AccountReceivableTurnoverRatio> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<AccountReceivableTurnoverRatio> getLastData(@Param("endMonth") String endMonth);

    void updateByTargetVal(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("sgtzx") String sgtzx,@Param("mbcs") String mbcs);

    void updateByReceivePayment(AccountReceivableTurnoverRatio AccountReceivableTurnoverRatio);

    Map getKeyData();

    String getLastMonthWcqkzb(@Param("teampMonth")String teampMonth);

    String getLastYearWcqkzb(@Param("teampMonth")String teampMonth);
    
    AccountReceivableTurnoverRatio selectAccountReceivableTurnoverRatio(@Param("month")String month);
    
}