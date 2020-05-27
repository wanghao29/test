package com.asiainfo.cmc.service.gfKpi.operateEfficiency.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.gfKpi.operateCoordination.NetPhonesSalesProportion;
import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.BackForecastAccuracy;
import com.asiainfo.cmc.mapper.gfKpi.operateEfficiency.BackForecastAccuracyMapper;
import com.asiainfo.cmc.service.gfKpi.operateEfficiency.IBackForecastAccuracyService;
import com.asiainfo.cmc.utils.DateUtils;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class BackForecastAccuracyService implements IBackForecastAccuracyService {
	@Resource
	private BackForecastAccuracyMapper backForecastAccuracyMapper;
	@Override
	public PageInfo<BackForecastAccuracy> queryData(Map<String, Object> params) {
		List<BackForecastAccuracy> outList = new ArrayList<BackForecastAccuracy>();
		outList = backForecastAccuracyMapper.queryData(params);
		for(BackForecastAccuracy backForecastAccuracy :outList ) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("sjhk", backForecastAccuracy.getSjhk());
			paramMap.put("jhhk", backForecastAccuracy.getJhhk());
			paramMap.put("billcyc", backForecastAccuracy.getBillcyc());
			paramMap = calculated( paramMap);
			updateByMonth(paramMap);
		}
		outList = backForecastAccuracyMapper.queryData(params);
		 PageInfo<BackForecastAccuracy> pageInfo = new PageInfo<BackForecastAccuracy>(outList);
		return pageInfo;
	}

	@Override
	public void calculatedScore(String startMonth, String endMonth) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(Map<String, Object> params) {
		String billcyc = String.valueOf(params.get("billcyc"));
		BackForecastAccuracy backForecastAccuracy =backForecastAccuracyMapper.queryDataByMonth(billcyc);
		String lastBillcyc = DateUtils.getBeforeMonth(billcyc);
		BackForecastAccuracy LastbackForecastAccuracy =backForecastAccuracyMapper.queryDataByMonth(lastBillcyc);
		params = calculated( params);
		if(LastbackForecastAccuracy != null ) {
			BigDecimal Last_sjhk = LastbackForecastAccuracy.getSjhk();
			BigDecimal jhhk = new BigDecimal(String.valueOf(params.get("jhhk")));
			if(jhhk.compareTo(Last_sjhk.multiply(new BigDecimal("0.8"))) == -1) {
				 params.put("hkyczqddf",new BigDecimal("0"));
			}
		}
		
		if(backForecastAccuracy == null) {
			backForecastAccuracyMapper.insert(params);
		}else {
			backForecastAccuracyMapper.updateByMonth(params);
		}
		
	}

	@Override
	public BackForecastAccuracy queryDataByMonth(String billcyc) {
		 
		return backForecastAccuracyMapper.queryDataByMonth(billcyc);
	}

	@Override
	public void updateByMonth(Map<String, Object> params) {
		backForecastAccuracyMapper.updateByMonth(params);
		
	}
	private Map<String, Object> calculated(Map<String, Object> params){
		  BigDecimal sjhk = new BigDecimal(String.valueOf(params.get("sjhk")));
		  BigDecimal jhhk = new BigDecimal(String.valueOf(params.get("jhhk")));
 
		  BigDecimal hkyczqd = new BigDecimal("0");
		  BigDecimal hkyczqddf = new BigDecimal("0");
		  hkyczqd = sjhk.divide(jhhk,2,BigDecimal.ROUND_HALF_DOWN).setScale(2,   BigDecimal.ROUND_HALF_DOWN);
		 /* if(hkyczqd.compareTo(new BigDecimal("0.7")) > -1 && hkyczqd.compareTo(new BigDecimal("1.5")) < 1 ) {
			  hkyczqddf = new BigDecimal("3");
		  }else if(hkyczqd.compareTo(new BigDecimal("0.7")) == -1  || hkyczqd.compareTo(new BigDecimal("2")) == 1 ){
			  hkyczqddf = new BigDecimal("0");
		  }else if(hkyczqd.compareTo(new BigDecimal("1.5")) > -1 && hkyczqd.compareTo(new BigDecimal("2")) < 1 ) {
			   hkyczqddf = (hkyczqd.multiply( new BigDecimal("6"))).subtract(new BigDecimal("9"));
		  }*/
		  if(hkyczqd.compareTo(new BigDecimal("0.7")) > -1  ) {
			  hkyczqddf = new BigDecimal("3");
		  }else {
			  hkyczqddf = new BigDecimal("0");
		  }
		 params.put("hkyczqd", hkyczqd);
		 params.put("hkyczqddf", hkyczqddf);
		 return params;
	}

	@Override
	public BackForecastAccuracy overview(Map<String, Object> params) {
		return backForecastAccuracyMapper.overview(params);
	}

	@Override
	public List<BackForecastAccuracy> getList(Map<String, Object> params) {
		return backForecastAccuracyMapper.getList(params);
	}

	@Override
	public int getTotal(Map<String, Object> params) {
		return backForecastAccuracyMapper.getTotal(params);
	}
}
