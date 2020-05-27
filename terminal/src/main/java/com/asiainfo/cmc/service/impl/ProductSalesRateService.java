package com.asiainfo.cmc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.ProductSalesRate;
import com.asiainfo.cmc.mapper.ProductSalesRateMapper;
import com.asiainfo.cmc.mapper.ThreeMonthStockRatioMapper;

/**
 * Created by DB.Cooper on 2018/8/1.
 */
@Service
@Transactional
public class ProductSalesRateService implements ProductSalesRateMapper{
    @Resource
    private ProductSalesRateMapper productSalesRateMapper;
    @Resource
    private ThreeMonthStockRatioMapper threeMonthStockRatioMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(ProductSalesRate record) {
    	 
    
        return productSalesRateMapper.insert(record);
    }

    @Override
    public int insertSelective(ProductSalesRate record) {
        return 0;
    }

    @Override
    public ProductSalesRate selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(ProductSalesRate record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(ProductSalesRate record) {
        return 0;
    }

    @Override
    public List<ProductSalesRate> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return productSalesRateMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
         return productSalesRateMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<ProductSalesRate> getEchartData(String startMonth, String endMonth) {
        return productSalesRateMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<ProductSalesRate> getLastData(String endMonth) {
        return productSalesRateMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal(String starMonth, String endMonth, String mbz) {
        productSalesRateMapper.updateByTargetVal(starMonth,endMonth,mbz);
    }
    
    public ProductSalesRate selectProductSalesRate(String month){
    	return productSalesRateMapper.selectProductSalesRate(month);
    };
    @Override
    public List<String> getZdcpsByMonth(String month) {
        return productSalesRateMapper.getZdcpsByMonth(month);
    }
    @Override
    public void updateProductSalesRateByMonth(ProductSalesRate record){
    	productSalesRateMapper.updateProductSalesRateByMonth(record);
    }

	@Override
	public Integer getCountByMonth(String month) {
		
		return productSalesRateMapper.getCountByMonth(month);
	}

	@Override
	public String queryKhxlByBand( Map<String,Object> params) {
		// TODO Auto-generated method stub
		List<Map<String, String>>  materialList =  threeMonthStockRatioMapper.queryMaterialIdAndDesc(params);
		List<String> materialId = new ArrayList<>();
		List<String> materialDesc = new ArrayList<>();
		for(Map<String, String> map : materialList  ) {
			materialId.add(map.get("id"));
			materialDesc.add(map.get("material_desc"));
		}
		params.put("materialId", materialId);
		return productSalesRateMapper.queryKhxlByBand( params);
	}
}
