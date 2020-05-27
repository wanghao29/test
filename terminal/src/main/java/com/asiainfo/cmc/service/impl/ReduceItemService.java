package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.ReduceItem;
import com.asiainfo.cmc.mapper.ReduceItemMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by DB.Cooper on 2018/7/26.
 */
@Service
@Transactional
public class ReduceItemService implements ReduceItemMapper{
    @Resource
    private ReduceItemMapper ReduceItemMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return ReduceItemMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(ReduceItem record) {
        return ReduceItemMapper.insert(record);
    }

    @Override
    public int insertSelective(ReduceItem record) {
        return ReduceItemMapper.insertSelective(record);
    }

    @Override
    public ReduceItem selectByPrimaryKey(Integer id) {
        return ReduceItemMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(ReduceItem record) {
        return ReduceItemMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(ReduceItem record) {
        return ReduceItemMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<ReduceItem> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return ReduceItemMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return ReduceItemMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<ReduceItem> getEchartData(String startMonth, String endMonth) {
        return ReduceItemMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<ReduceItem> getLastData(String endMonth) {
        return ReduceItemMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal(String startMonth,String endMonth,String sgtzx, String mbcs) {
        ReduceItemMapper.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
    }

    @Override
    public void updateByReceivePayment(ReduceItem ReduceItem) {
        ReduceItemMapper.updateByReceivePayment(ReduceItem);
    }

    @Override
    public Map getKeyData() {
        return ReduceItemMapper.getKeyData();
    }

    @Override
    public Float getLastMonthWcqkzb(String teampMonth) {
        return ReduceItemMapper.getLastMonthWcqkzb(teampMonth);
    }

    @Override
    public Float getLastYearWcqkzb(String teampMonth) {
        return ReduceItemMapper.getLastYearWcqkzb(teampMonth);
    }
    
    @Override
    public void addReduceItem(ReduceItem reduceItem) {
         ReduceItemMapper.addReduceItem(reduceItem);
    }
    
    public Integer getCountByMonth(String month){
    	return ReduceItemMapper.getCountByMonth(month);
    }
    
    public Integer updateByMonth(ReduceItem reduceItem){
    	return ReduceItemMapper.updateByMonth(reduceItem);
    }
}
