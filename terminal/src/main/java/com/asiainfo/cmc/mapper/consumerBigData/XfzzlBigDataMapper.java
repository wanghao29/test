package com.asiainfo.cmc.mapper.consumerBigData;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.enties.consumerBigData.XfzzlBigData;

public interface XfzzlBigDataMapper {
	
	public int tableExist(XfzzlBigData xfzzlBigData);
	
	public List<XfzzlBigData> listCntys(XfzzlBigData xfzzlBigData);
	
	public List<XfzzlBigData> listCurBrands(XfzzlBigData xfzzlBigData);
	
	public List<XfzzlBigData> listCurSpecs(XfzzlBigData xfzzlBigData);

	public Map<String, Object> getXfzzlBigData(XfzzlBigData vo);
	public Map<String, Object> getJlfxBigData(XfzzlBigData vo);
	
	
	public List<Map<String, Object>> getXfzzlBigDataCityScatter(XfzzlBigData vo);
	public List<Map<String, Object>> getXfzzlBigDataBrndCdScatter(XfzzlBigData vo);
	public HashMap<String, Object> getTxyhAndZxtxyh(XfzzlBigData vo);
	
	public HashMap<String, Object> getZwzdAndXrwzd(XfzzlBigData vo);
	public HashMap<String, Object> getAvg_JL_HJZQ(XfzzlBigData vo);
	
	public HashMap<String, Object> getZwwlwzdAndXrwwlwzd(XfzzlBigData vo);
	public HashMap<String, Object> getJlfxList(XfzzlBigData vo);

	
	
	public List<Map<String, Object>> getZdtzzlBigDataByCity(XfzzlBigData vo);
	public List<Map<String, Object>> getZdtzzlBigDataBrandTop10(XfzzlBigData vo);
	public List<Map<String, Object>> getZdtzzlBigDataSpecTop20(XfzzlBigData vo);
	public List<Map<String, Object>> getZdtzzlBigDataBrandTop10_xz(XfzzlBigData vo);
	public List<Map<String, Object>> getZdtzzlBigDataSpecTop20_xz(XfzzlBigData vo);

}
