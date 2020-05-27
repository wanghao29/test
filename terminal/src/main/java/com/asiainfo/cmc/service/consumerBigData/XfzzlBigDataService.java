package com.asiainfo.cmc.service.consumerBigData;

import java.util.HashMap;
import java.util.List;

import com.asiainfo.cmc.enties.consumerBigData.XfzzlBigData;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.github.pagehelper.PageInfo;

public interface XfzzlBigDataService {
	
	public List<XfzzlBigData> listCntys(XfzzlBigData xfzzlBigData);
	
	public  PageInfo<XfzzlBigData> listCurBrands(XfzzlBigData xfzzlBigData);
	
	public PageInfo<XfzzlBigData> listCurSpecs(XfzzlBigData xfzzlBigData);
	
	public HashMap<String, Object> getTxyhAndZxtxyh(XfzzlBigData xfzzlBigData);
	
	public List<CusChanPortray> listPortray(XfzzlBigData xfzzlBigData);

	public List<CusChanPortray> listPortrayZdtz(XfzzlBigData xfzzlBigData);
	
	public List<CusChanPortray> listPortrayJlfx(XfzzlBigData xfzzlBigData);

	public HashMap<String, Object> getZwzdAndXrwzd(XfzzlBigData xfzzlBigData);
	
	public HashMap<String, Object> getJlfxList(XfzzlBigData xfzzlBigData);

	

}
