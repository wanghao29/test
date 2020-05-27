package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.TerminalSales;
import com.asiainfo.cmc.mapper.TerminalSalesMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by DB.Cooper on 2018/8/1.
 */
@Service
@Transactional
public class TerminalSalesService implements TerminalSalesMapper{
    @Resource
    private TerminalSalesMapper terminalSalesMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(TerminalSales record) {
        return 0;
    }

    @Override
    public int insertSelective(TerminalSales record) {
        return 0;
    }

    @Override
    public TerminalSales selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(TerminalSales record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(TerminalSales record) {
        return 0;
    }

    @Override
    public List<TerminalSales> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return terminalSalesMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
         return terminalSalesMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<TerminalSales> getEchartData(String startMonth, String endMonth) {
        return terminalSalesMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<TerminalSales> getLastData(String endMonth) {
        return terminalSalesMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal(String starMonth, String endMonth, String mbz) {
        terminalSalesMapper.updateByTargetVal(starMonth,endMonth,mbz);
    }
    @Override
    public void update(Map<String, Object> params) {
    	terminalSalesMapper.update(params);
    }

    @Override
    public TerminalSales selectTerminalSales(String month) {
        return terminalSalesMapper.selectTerminalSales(month);
    }

}
