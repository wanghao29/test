package com.asiainfo.cmc.mapper.consumerBigData;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.consumerBigData.ConsumerBigData;
import com.asiainfo.cmc.enties.consumerBigData.CrossAnalysis;
import com.asiainfo.cmc.enties.consumerBigData.ZdMultIdimensional;
import com.asiainfo.cmc.enties.consumerBigData.ZdMultIdimensionalNumDetails;

public interface ConsumerBigDataMapper {
	  List<ConsumerBigData> queryList( Map<String,Object> param);
	  
	  List<ZdMultIdimensional> getIdimensional();
	  
	  List<ZdMultIdimensionalNumDetails> getIdimensionalNumDetails();
	  
	  List<String> getNums();
	  
	  List<CrossAnalysis> crossAnalysisList( Map<String,String> param);
	  
	  List<Map<String,String>> brandSelectInfo(Map<String,Object> param);
	  
	  List<String> pkgDtlFeeAmtSelectInfo();
	  
	  
	  List<Map<String,String>> specSelectInfo(Map<String, Object> params);
	  
	  Map<String, String>  sumInnetUsrCnt( Map<String,Object> param);
}
