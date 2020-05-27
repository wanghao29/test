package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.CustomerSaleTargetVal;
import com.asiainfo.cmc.mapper.CustomerSaleTargetValMapper;
import com.asiainfo.cmc.utils.DateUtils;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

/**
 * Created by DB.Cooper on 2018/7/26.
 */
@Service
@Transactional
public class CustomerSaleTargetValService implements CustomerSaleTargetValMapper {
    @Resource
    private CustomerSaleTargetValMapper customerSaleTargetValMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return customerSaleTargetValMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(CustomerSaleTargetVal record) {
        return customerSaleTargetValMapper.insert(record);
    }

    @Override
    public int insertSelective(CustomerSaleTargetVal record) {
        return customerSaleTargetValMapper.insertSelective(record);
    }

    @Override
    public CustomerSaleTargetVal selectByPrimaryKey(Integer id) {
        return customerSaleTargetValMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(CustomerSaleTargetVal record) {
        return customerSaleTargetValMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(CustomerSaleTargetVal record) {
        return customerSaleTargetValMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<CustomerSaleTargetVal> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return customerSaleTargetValMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return customerSaleTargetValMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<CustomerSaleTargetVal> getEchartData(String startMonth, String endMonth) {
        return customerSaleTargetValMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<CustomerSaleTargetVal> getLastData(String endMonth) {
        return customerSaleTargetValMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal(String starMonth, String endMonth, String mbz) {
        customerSaleTargetValMapper.updateByTargetVal(starMonth,endMonth,mbz);
    }

    @Override
    public Map getKeyData() {
        return customerSaleTargetValMapper.getKeyData();
    }

    @Override
    public String getLastMonthWcqkzb(String teampMonth) {
        return customerSaleTargetValMapper.getLastMonthWcqkzb(teampMonth);
    }

    @Override
    public String getLastYearWcqkzb(String teampMonth) {
        return customerSaleTargetValMapper.getLastYearWcqkzb(teampMonth);
    }

    @Override
    public CustomerSaleTargetVal selectCustomerSaleVal(String month) {
        return customerSaleTargetValMapper.selectCustomerSaleVal(month);
    }

	@Override
	public List<Map<String, String>> queryKaCustomerCode() {
		// TODO Auto-generated method stub
		return customerSaleTargetValMapper.queryKaCustomerCode();
	}

	@Override
	public String queryCustomerSales(Map<String, Object> param) {
	 
		try {
			param.put("lastDay", DateUtils.format(DateUtils.getSpecifiedDayBefore(DateUtils.GetCurDate(),1),"yyyyMMdd","yyyy-MM-dd"));
			
		} catch (ParseException e) {
			 
			e.printStackTrace();
		}
		return customerSaleTargetValMapper.queryCustomerSales(param);
	}

	@Override
	public CustomerSaleTargetVal queryCustomerSaleByMonth(String month) {
		// TODO Auto-generated method stub
		return customerSaleTargetValMapper.queryCustomerSaleByMonth(month);
	}
}
