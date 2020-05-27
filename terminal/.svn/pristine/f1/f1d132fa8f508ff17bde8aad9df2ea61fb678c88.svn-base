package com.asiainfo.cmc.service.impl.brandmodel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.ibatis.session.SqlSession;

import com.asiainfo.cmc.enties.AccountReceivableTurnoverRatio;
import com.asiainfo.cmc.enties.brandmodel.ZdResult8BrandD;
import com.asiainfo.cmc.mapper.brandmodel.ZdResult8BrandDMapper;
import com.asiainfo.cmc.service.brandmodel.ZdResult8BrandDService;
import com.asiainfo.cmc.service.impl.AccountReceivableRatioService;
import com.asiainfo.cmc.service.impl.AccountsReceivableRatioService;
import com.asiainfo.cmc.service.impl.model.eightCharacters.AmountService;
import com.asiainfo.cmc.utils.sqlUtils.SqlMapper;


@Service
@Transactional
public class ZdResult8BrandDServiceImpl implements ZdResult8BrandDService {

	@Resource
	ZdResult8BrandDMapper zdResult8BrandDMapper;
	
	@Resource//自动注入
	private  SqlSession sqlSession;
	
	@Override
	public List<ZdResult8BrandD> getValueByMonthAndType(String month) {
		// TODO Auto-generated method stub
		List<ZdResult8BrandD> zds = zdResult8BrandDMapper.getValueByMonthAndType(month);
		return zds;
		 
	}

	public String getSqlByDim(String dim){
		String sql=zdResult8BrandDMapper.getSqlByDim(dim);
		return sql;
	}

	/**省kpi的首页八字的总览数据**/
	@Override
	public Float getValue(String Sql, String month) {
		Map<String, String> param = new HashMap<String,String>();
			param.put("startMonth",month);
			 param.put("stopMonth", month);
		 SqlMapper sqlMapper = new SqlMapper(sqlSession);
		 Map<String, String> changeDF = AmountService.changeDateFormate(param);
		 List<Map> list = sqlMapper.selectList(Sql, changeDF, Map.class);
		 Float value;
		 if(list.size()>0 && !list.get(0).isEmpty()){
			 String temp_value =list.get(0).get("value")==null?"0": list.get(0).get("value").toString();
			 value= Float.parseFloat(temp_value);
		 }else{
			 value=0f;
		 }
		
		return value;
	}
	
	public Float aRTRatio(String month){
		Float value = zdResult8BrandDMapper.aRTRatio(month);
		 if(value==null){
			value=0f;
		}
		return value;
	}
	public Float aRRatio(String month){
		Map<String, Object> params =new HashMap<String, Object>();
		params.put("startMonth",month);
		params.put("stopMonth", month);
		
		Float value=zdResult8BrandDMapper.aRRatio(month);
		return value;
	}
}
