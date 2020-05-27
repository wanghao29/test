package com.asiainfo.cmc.service.consumerBigData;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.consumerBigData.ConsumerBigData;
import com.asiainfo.cmc.enties.consumerBigData.CrossAnalysis;
import com.asiainfo.cmc.enties.consumerBigData.XfzzlBigData;
import com.asiainfo.cmc.enties.consumerBigData.ZdMultIdimensional;
import com.asiainfo.cmc.enties.consumerBigData.ZdMultIdimensionalNumDetails;
import com.asiainfo.cmc.mapper.consumerBigData.ConsumerBigDataMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;
@Service
@Transactional
public class ConsumerBigDataService implements IconsumerBigDataService {
    @Resource
    private ConsumerBigDataMapper consumerBigDataMapper;
	@Override
	@DS("dataSource2")
	public PageInfo<ConsumerBigData> queryList(Map<String, Object> params,List<ZdMultIdimensional> list) {
		List<ConsumerBigData> outList = new ArrayList<ConsumerBigData>();
		params.put("tableName", "ZD_RESULT_CONSUMER_"+params.get("city")+"_"+params.get("billcyc"));
		PageHelper.startPage(Integer.valueOf(params.get("page").toString()), Integer.valueOf(params.get("rows").toString()));
		//List<ZdMultIdimensional> list = consumerBigDataMapper.getIdimensional();
		for(ZdMultIdimensional zdMultIdimensional:list) {
			   if(params.containsKey(zdMultIdimensional.getNum())) {
				    String temp  = params.get(zdMultIdimensional.getNum()).toString();
				    if(!"".equals(temp) && temp !=null) {
				    	 String[] tempArray = temp.split(","); 
				    	 params.put(zdMultIdimensional.getNum(), tempArray);
				    }
			   }
		}
		params.put("billcyc",Integer.valueOf(String.valueOf(params.get("billcyc"))));
		if(params.containsKey("pkgDtlFeeAmtMin")&&  !"".equals(String.valueOf(params.get("pkgDtlFeeAmtMin"))) ) {
			params.put("pkgDtlFeeAmtMin",Float.valueOf(String.valueOf(params.get("pkgDtlFeeAmtMin"))));
		}
		if(params.containsKey("pkgDtlFeeAmtMax")&&  !"".equals(String.valueOf(params.get("pkgDtlFeeAmtMin"))) ) {
			params.put("pkgDtlFeeAmtMax",Float.valueOf(String.valueOf(params.get("pkgDtlFeeAmtMax"))));
		}
		outList = consumerBigDataMapper.queryList(params);
		 PageInfo<ConsumerBigData> pageInfo = new PageInfo<>(outList);

		return pageInfo;
	}
	
	
	@Override
	@DS("dataSource2")
	public Map<String,String> sumInnetUsrCnt(Map<String, Object> params,List<ZdMultIdimensional> list) {
		Map<String, String> resultMap = new HashMap<String, String>();
		params.put("tableName", "ZD_RESULT_CONSUMER_"+params.get("city")+"_"+params.get("billcyc"));
		//List<ZdMultIdimensional> list = consumerBigDataMapper.getIdimensional();
		for(ZdMultIdimensional zdMultIdimensional:list) {
			   if(params.containsKey(zdMultIdimensional.getNum())) {
				    String temp  = params.get(zdMultIdimensional.getNum()).toString();
				    if(!"".equals(temp) && temp !=null) {
				    	 String[] tempArray = temp.split(","); 
				    	 params.put(zdMultIdimensional.getNum(), tempArray);
				    }
			   }
		}
		params.put("billcyc",Integer.valueOf(String.valueOf(params.get("billcyc"))));
		if(params.containsKey("pkgDtlFeeAmtMin")&&  !"".equals(String.valueOf(params.get("pkgDtlFeeAmtMin"))) ) {
			params.put("pkgDtlFeeAmtMin",Float.valueOf(String.valueOf(params.get("pkgDtlFeeAmtMin"))));
		}
		if(params.containsKey("pkgDtlFeeAmtMax")&&  !"".equals(String.valueOf(params.get("pkgDtlFeeAmtMin"))) ) {
			params.put("pkgDtlFeeAmtMax",Float.valueOf(String.valueOf(params.get("pkgDtlFeeAmtMax"))));
		}
		resultMap = consumerBigDataMapper.sumInnetUsrCnt(params);
		 
 
		return resultMap;
	}
	
	
	
	
	

	@Override
	public Map<String, Object> getIdimensionalNumDetails() {

		List<ZdMultIdimensionalNumDetails> details = consumerBigDataMapper.getIdimensionalNumDetails();
		
		List<String> nums = consumerBigDataMapper.getNums();
		
		//创建一个Map保存最终的数据
		Map<String, Object> resultMap = new HashMap<String, Object>();
		//遍历nums 获得每一个num值
		for (String num : nums) {
			//创建一个list用来保存每一个num对应的所有对象
			List<ZdMultIdimensionalNumDetails> numList = new ArrayList<ZdMultIdimensionalNumDetails>();
			//找到details中num值得对象
			for (ZdMultIdimensionalNumDetails detail : details) {
				if(num.equals(detail.getNum())){
					numList.add(detail);
				}
			}
			resultMap.put(num, numList);
		}
		return resultMap;
	}


	@Override
	public JSONObject getIdimensional() {
		List<ZdMultIdimensional> list = consumerBigDataMapper.getIdimensional();
		JSONObject returnJSONObject = new JSONObject();
		returnJSONObject.put("list", list);
		return returnJSONObject;
	}
	
	@Override
	public List<ZdMultIdimensional>  getIdimensionalList() {
		List<ZdMultIdimensional> list = consumerBigDataMapper.getIdimensional();
	 
		return list;
	}

	public PageInfo<CrossAnalysis> crossAnalysisList(Map<String, String> params) {
		List<CrossAnalysis> outList = new ArrayList<CrossAnalysis>();
		params.put("tableName", "zd_result_consumer_overlap_"+params.get("billcyc"));
		PageHelper.startPage(Integer.valueOf(params.get("page")), Integer.valueOf(params.get("rows")));
		outList = consumerBigDataMapper.crossAnalysisList(params);
		 PageInfo<CrossAnalysis> pageInfo = new PageInfo<>(outList);
		return pageInfo;
	}
	
	
	public PageInfo<Map<String,String>> brandSelectInfo(Map<String, Object> params){
		Integer statMo = Integer.valueOf(String.valueOf(params.get("statMo")));
		params.put("statMo", statMo);
		List<Map<String,String>> outList = new ArrayList<Map<String,String>>();
		PageHelper.startPage(Integer.valueOf(1), Integer.valueOf(10));
		outList = consumerBigDataMapper.brandSelectInfo(params);
		 PageInfo<Map<String,String>> pageInfo = new PageInfo<>(outList);
		return pageInfo;//consumerBigDataMapper.brandSelectInfo();
	}

	public  PageInfo<Map<String,String>> specSelectInfo(Map<String, Object> params){
		Integer statMo = Integer.valueOf(String.valueOf(params.get("statMo")));
		params.put("statMo", statMo);
		params.put("cm_brand", String.valueOf(params.get("cm_brand")));
		params.put("cm_ter_type", String.valueOf(params.get("cm_ter_type")));
		List<Map<String,String>> outList = new ArrayList<Map<String,String>>();
		PageHelper.startPage(Integer.valueOf(1), Integer.valueOf(10));
		outList = consumerBigDataMapper.specSelectInfo(params);
		 PageInfo<Map<String,String>> pageInfo = new PageInfo<>(outList);
		return pageInfo;//consumerBigDataMapper.specSelectInfo(cm_brand);
	}


	@Override
	public List<String> pkgDtlFeeAmtSelectInfo() {
	 
		return consumerBigDataMapper.pkgDtlFeeAmtSelectInfo();
	}
}
