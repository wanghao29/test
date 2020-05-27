package com.asiainfo.cmc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.InternetIndex;
import com.asiainfo.cmc.enties.ModelInternet;
import com.asiainfo.cmc.enties.StockTurnOver;
import com.asiainfo.cmc.mapper.ModelInternetMapper;
import com.asiainfo.cmc.service.ModelInternetService;

/**
* @author WANGHAO
* @version 创建时间：2020年4月15日 下午3:03:25
* @ClassName 类名称
* @Description 类描述
*/
@Service
@Transactional
public class ModelInternetServiceImpl implements ModelInternetService {
	@Resource
    private ModelInternetMapper modelInternetMapper;
	
	
	@Override
	public String selectDate(String start, String end) {
		// TODO Auto-generated method stub
		return modelInternetMapper.selectDate(start, end);
	}

	@Override
	public String selectDateI(InternetIndex inter) {
		// TODO Auto-generated method stub
		return modelInternetMapper.selectDateI(inter);
	}

	@Override
	public List<ModelInternet> listBig(String start, String end) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listBig(start, end);
	}

	@Override
	public List<ModelInternet> listBrand(ModelInternet m) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listBrand(m);
	}

	@Override
	public List<ModelInternet> listSpec(ModelInternet m) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listSpec(m);
	}

	@Override
	public List<ModelInternet> listMemory(ModelInternet m) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listMemory(m);
	}

	@Override
	public List<ModelInternet> listColor(ModelInternet m) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listColor(m);
	}

	@Override
	public List<ModelInternet> listClientName(ModelInternet m) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listClientName(m);
	}

	@Override
	public List<StockTurnOver> listAllStock(String time) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listAllStock(time);
	}

	@Override
	public String selectDateIncome(String start, String end) {
		// TODO Auto-generated method stub
		return modelInternetMapper.selectDateIncome(start, end);
	}

	@Override
	public String selectDateIIncome(InternetIndex inter) {
		// TODO Auto-generated method stub
		return modelInternetMapper.selectDateIIncome(inter);
	}

	@Override
	public List<ModelInternet> listBigIncome(String start, String end) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listBigIncome(start, end);
	}

	@Override
	public List<ModelInternet> listBrandIncome(ModelInternet m) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listBrandIncome(m);
	}

	@Override
	public List<ModelInternet> listSpecIncome(ModelInternet m) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listSpecIncome(m);
	}

	@Override
	public List<ModelInternet> listMemoryIncome(ModelInternet m) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listMemoryIncome(m);
	}

	@Override
	public List<ModelInternet> listColorIncome(ModelInternet m) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listColorIncome(m);
	}

	@Override
	public List<ModelInternet> listClientNameIncome(ModelInternet m) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listClientNameIncome(m);
	}

	@Override
	public List<StockTurnOver> listAllStockIncome(String time) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listAllStockIncome(time);
	}

	@Override
	public String selectDateRote(String start, String end) {
		// TODO Auto-generated method stub
		return modelInternetMapper.selectDateRote(start, end);
	}

	@Override
	public String selectDateIRote(InternetIndex inter) {
		// TODO Auto-generated method stub
		return modelInternetMapper.selectDateIRote(inter);
	}

	@Override
	public List<ModelInternet> listBigRote(String start, String end) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listBigRote(start, end);
	}

	@Override
	public List<ModelInternet> listBrandRote(ModelInternet m) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listBrandRote(m);
	}

	@Override
	public List<ModelInternet> listSpecRote(ModelInternet m) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listSpecRote(m);
	}

	@Override
	public List<ModelInternet> listMemoryRote(ModelInternet m) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listMemoryRote(m);
	}

	@Override
	public List<ModelInternet> listColorRote(ModelInternet m) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listColorRote(m);
	}

	@Override
	public List<ModelInternet> listClientNameRote(ModelInternet m) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listClientNameRote(m);
	}

	@Override
	public List<StockTurnOver> listAllStockRote(String time) {
		// TODO Auto-generated method stub
		return modelInternetMapper.listAllStockRote(time);
	}

}
