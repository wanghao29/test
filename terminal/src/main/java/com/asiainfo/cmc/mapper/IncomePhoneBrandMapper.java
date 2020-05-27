package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.IncomePhoneBrand;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface IncomePhoneBrandMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(IncomePhoneBrand record);

    int insertSelective(IncomePhoneBrand record);

    IncomePhoneBrand selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(IncomePhoneBrand record);

    int updateByPrimaryKey(IncomePhoneBrand record);

    List<IncomePhoneBrand> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<IncomePhoneBrand> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<IncomePhoneBrand> getLastData(@Param("endMonth")String endMonth);

    void updateByTargetVal(@Param("starMonth")String starMonth, @Param("endMonth")String endMonth,  @Param("mbz")String mbz);

    void update(IncomePhoneBrand incomePhoneBrand);

    IncomePhoneBrand selectBrandIncome(@Param("month")String month);

}