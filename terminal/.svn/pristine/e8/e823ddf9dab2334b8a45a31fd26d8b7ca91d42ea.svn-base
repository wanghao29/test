package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.TerminalSaleShare;
import com.asiainfo.cmc.enties.TerminalSales;
import com.asiainfo.cmc.mapper.TerminalSaleShareMapper;
import com.asiainfo.cmc.mapper.TerminalSalesMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by DB.Cooper on 2018/8/10.
 */
@Service
@Transactional
public class TerminalSaleShareService implements TerminalSaleShareMapper{
    @Resource
    private TerminalSaleShareMapper terminalSaleShareMapper;


    @Override
    public int deleteByPrimaryKey(Integer id) {
        return terminalSaleShareMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(TerminalSaleShare record) {
        return terminalSaleShareMapper.insert(record);
    }

    @Override
    public int insertSelective(TerminalSaleShare record) {
        return terminalSaleShareMapper.insertSelective(record);
    }

    @Override
    public TerminalSaleShare selectByPrimaryKey(Integer id) {
        return terminalSaleShareMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(TerminalSaleShare record) {
        return terminalSaleShareMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(TerminalSaleShare record) {
        return terminalSaleShareMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<TerminalSaleShare> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return terminalSaleShareMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return terminalSaleShareMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<TerminalSaleShare> getEchartData(String startMonth, String endMonth) {
        return terminalSaleShareMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<TerminalSaleShare> getLastData(String endMonth) {
        return terminalSaleShareMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal(String starMonth, String endMonth, String mbz) {
        terminalSaleShareMapper.updateByTargetVal(starMonth,endMonth,mbz);
    }

    @Override
    public TerminalSaleShare selectTerminalSaleShare(String month) {
        return terminalSaleShareMapper.selectTerminalSaleShare(month);
    }
}
