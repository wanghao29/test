package com.asiainfo.cmc.service.consumerBigData;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.enties.consumerBigData.ConsumerBigData;
import com.asiainfo.cmc.enties.consumerBigData.CrossAnalysis;
import com.asiainfo.cmc.enties.consumerBigData.ZdMultIdimensional;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;

public interface IconsumerBigDataService {

	
   public  PageInfo<ConsumerBigData> queryList(Map<String,Object> params,List<ZdMultIdimensional> list);
   
   public JSONObject getIdimensional();
   
   public Map<String, Object> getIdimensionalNumDetails();
   
   public PageInfo<CrossAnalysis> crossAnalysisList(Map<String,String> params);
   
   //public List<String> brandSelectInfo();
   public PageInfo<Map<String,String>> brandSelectInfo(Map<String, Object> params);
   public List<String> pkgDtlFeeAmtSelectInfo();
   
   public PageInfo<Map<String,String>>  specSelectInfo(Map<String, Object> params);
   public List<ZdMultIdimensional>  getIdimensionalList();
   
   
   public Map<String,String> sumInnetUsrCnt(Map<String, Object> params,List<ZdMultIdimensional> list);
}
