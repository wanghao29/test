package com.asiainfo.cmc.service.model.eightCharacters;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.asiainfo.cmc.enties.brandmodel.ReturnRate;
import com.asiainfo.cmc.enties.brandmodel.ZdResult8AreaD;
import com.asiainfo.cmc.enties.brandmodel.ZdResult8BrandD;
import com.asiainfo.cmc.enties.brandmodel.ZdResult8MonscmM;
import com.asiainfo.cmc.enties.importExcel.ImportCost;
import com.asiainfo.cmc.enties.importExcel.ImportGrossProfit;
import com.asiainfo.cmc.enties.importExcel.ImportInfoProfitCost;
import com.asiainfo.cmc.enties.importExcel.ImportPeopleNum;
import com.asiainfo.cmc.enties.importExcel.ImportTeamIncom;
import com.asiainfo.cmc.enties.importExcel.ImportWugexiaomie;
import com.asiainfo.cmc.enties.importExcel.ImportWuweiyiti;
import com.asiainfo.cmc.enties.model.eightCharacters.Zd8typeInfoConfirm;
import com.asiainfo.cmc.enties.model.eightCharacters.Zd8typeInfoConfirmLog;
import com.asiainfo.cmc.enties.model.eightCharacters.ZdEightDimDict;
import com.asiainfo.cmc.vo.model.EcharDataVo;

/*

*
* 8鐎涙娣惔锟�
*
*/


public interface IAmonutService {
	
	public List<ZdEightDimDict>  getDimMods(Map<String,String> param);
	public List<Map<String,String>>  getKpis(Map<String,String> param);
	public EcharDataVo  getEcharDataVo(Map<String,String> param);
	public EcharDataVo  getEcharDataVo_share(Map<String,String> param);
	
	public EcharDataVo  getPieCharData(String sql,Map<String,String> param);
	
	public void importPeopleNum(List<ImportPeopleNum> list);
	
	public void importTeam(List<ImportTeamIncom> list);
	
	public void importCost(List<ImportCost> list);
	public void importGross(List<ImportGrossProfit> list);
	public void importGross_brand(List<ImportGrossProfit> list);
	//
	public List<ZdResult8BrandD>  initJqGrid(Map<String,String> param);
	public List<Map>  initJqGridExport(Map<String,String> param);
	public List<ReturnRate>  initJqGridRR(Map<String,String> param);
	public List<ZdResult8MonscmM>  initJqGrid_invent(Map<String,String> param);
	public List<ZdResult8AreaD>  initJqGrid_retail(Map<String,String> param);
	
	public EcharDataVo getListByindex(Map<String,String> param);
	public List<Zd8typeInfoConfirm> getConfirmInfo(List<Map<String, String>> kpis,Map<String,String>  param);
	
	public List<ImportPeopleNum>  getPersonList(Map<String,String> param);
	public List<ImportTeamIncom>  getTeamList(Map<String,String> param);
	public List<ImportCost>  getCostList(Map<String,String> param);
	public List<ImportGrossProfit>  getGrossList(Map<String,String> param);
	
	public int  getTotalByPerson(Map<String,String> param);
	public int  getTotalByTeam(Map<String,String> param);
	public int  getTotalByCost(Map<String,String> param);
	public int  getTotalByGross(Map<String,String> param);

	public void updateByPerson(Map<String,String>  params);
	public void updateByTeam(Map<String,String>  params);
	public void updateByCost(Map<String,String>  params);
	public void updateByGross(Map<String,String>  params);

	public Map<String, Object>  addCost(Map<String,String>  params);
	public Map<String, Object>  addPerson(Map<String,String>  params);
	public Map<String, Object>  addTeam(Map<String,String>  params);
	public Map<String, Object>  addGross(Map<String,String>  params);
	
	public EcharDataVo  getInventory_number(Map<String,String> param);
	
	public EcharDataVo  getInventory_money(Map<String,String> param);
	
	public Map<String, Object>  getInventory_all(Map<String,String> param);
	
	public Map<String, Object> gross_profit_zl( Map<String,String>  params);
	
	public  void repeat(String monthField,Set<String> monSet,String tableName);
	
	public Zd8typeInfoConfirm zlConfirmInfTS(String id);
	
	public Zd8typeInfoConfirmLog getConfirmLog(Map<String,String>  params);
	
	public void insertInfo(Map<String,String>  params);
	
	public String  getMbz(Map<String,String> param);
	
	public Map<String,String> getProfitRemarks(Map<String,String>  param);
	public String getRemarks(Map<String,String>  param);
	
	public void saveProfitR(Map<String,String>  param);
	public void saveRemarks(Map<String,String>  param);
	
	public Map<String,String> dimOneToKpiVal(Map<String,String>  param);
	
	public void insertWuweiyiti(List<ImportWuweiyiti> importWuweiyitiList,String month);
	public void insertWugexiaomie(List<ImportWugexiaomie> importWugexiaomieList,String month);
	public void insertInfoProfitCost(List<ImportInfoProfitCost> importInfoProfitCostList,String month);
 
}
