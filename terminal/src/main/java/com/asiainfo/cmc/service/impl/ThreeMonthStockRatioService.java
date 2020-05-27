package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.ThreeMonthStockRatio;
import com.asiainfo.cmc.mapper.ThreeMonthStockRatioMapper;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by DB.Cooper on 2018/7/26.
 */
@Service
@Transactional
public class ThreeMonthStockRatioService implements ThreeMonthStockRatioMapper{
    @Resource
    private ThreeMonthStockRatioMapper threeMonthStockRatioMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(ThreeMonthStockRatio record) {
        return 0;
    }

    @Override
    public int insertSelective(ThreeMonthStockRatio record) {
        return 0;
    }

    @Override
    public ThreeMonthStockRatio selectByPrimaryKey(Integer id) {
        return threeMonthStockRatioMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(ThreeMonthStockRatio record) {
        return threeMonthStockRatioMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(ThreeMonthStockRatio record) {
        return threeMonthStockRatioMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<ThreeMonthStockRatio> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return threeMonthStockRatioMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return threeMonthStockRatioMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<ThreeMonthStockRatio> getEchartData(String startMonth, String endMonth) {
        return threeMonthStockRatioMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<ThreeMonthStockRatio> getLastData(String endMonth) {
        return threeMonthStockRatioMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal(String startMonth,String endMonth,String mkhjx, int id) {
        threeMonthStockRatioMapper.updateByTargetVal(startMonth,endMonth,mkhjx,id);
    }

    @Override
    public Map getKeyData() {
        return threeMonthStockRatioMapper.getKeyData();
    }

    @Override
    public Integer getLastMonthWcqkzb(String teampMonth) {
        return threeMonthStockRatioMapper.getLastMonthWcqkzb(teampMonth);
    }

    @Override
    public Integer getLastMonthWcqkzb2(String teampMonth) {
        return threeMonthStockRatioMapper.getLastMonthWcqkzb2(teampMonth);
    }

    @Override
    public Integer getLastMonthWcqkzb3(String teampMonth) {
        return threeMonthStockRatioMapper.getLastMonthWcqkzb3(teampMonth);
    }

    @Override
    public Integer getLastYearWcqkzb(String teampMonth) {
        return threeMonthStockRatioMapper.getLastYearWcqkzb(teampMonth);
    }

    @Override
    public Integer getLastYearWcqkzb2(String teampMonth) {
        return threeMonthStockRatioMapper.getLastYearWcqkzb2(teampMonth);
    }

    @Override
    public Integer getLastYearWcqkzb3(String teampMonth) {
        return threeMonthStockRatioMapper.getLastYearWcqkzb3(teampMonth);
    }

    public ThreeMonthStockRatio selectThreeMonthStockRatio(String month){
    	return threeMonthStockRatioMapper.selectThreeMonthStockRatio(month);
    }

	@Override
	public List<Map<String, String>> queryBrandMdlDesc() {
		// TODO Auto-generated method stub
		return threeMonthStockRatioMapper.queryBrandMdlDesc();
	}

	@Override
	public void callTHREE_MONTH_STOCK_RATIO(String endMonth, String mkhjx_in) {
		threeMonthStockRatioMapper.callTHREE_MONTH_STOCK_RATIO(endMonth, mkhjx_in);
		
	}
	
	@Override
	public  ThreeMonthStockRatio  overview(Map<String,Object> params){
		return threeMonthStockRatioMapper.overview(params);
		
	}

	@Override
	public List<Map<String, String>> queryModelDesc(String[] brand_id) {
		// TODO Auto-generated method stub
		return threeMonthStockRatioMapper.queryModelDesc(brand_id);
	}

	@Override
	public List<Map<String, String>> queryConfigureDesc( Map<String,Object> params) {
		// TODO Auto-generated method stub
		return threeMonthStockRatioMapper.queryConfigureDesc(params);
	}

	@Override
	public List<Map<String, String>> queryMaterialIdAndDesc(Map<String, Object> params) {
		 
		return threeMonthStockRatioMapper.queryMaterialIdAndDesc(params);
	}

	@Override
	public void updateMaterialIdAndDesc(Map<String, Object> params) {
		List<Map<String, String>>  materialList =  threeMonthStockRatioMapper.queryMaterialIdAndDesc(params);
		List<String> materialId = new ArrayList<>();
		List<String> materialDesc = new ArrayList<>();
		Map<String, Object> updateParams = new HashMap<String, Object>();
		for(Map<String, String> map : materialList  ) {
			materialId.add(map.get("id"));
			materialDesc.add(map.get("material_desc"));
		}
		updateParams.put("materialId", StringUtils.join(materialId.toArray(), ","));
		updateParams.put("materialDesc", StringUtils.join(materialDesc.toArray(), " || "));
		updateParams.put("month", String.valueOf(params.get("month")));
		threeMonthStockRatioMapper.updateMaterialIdAndDesc(updateParams);
	}
}
