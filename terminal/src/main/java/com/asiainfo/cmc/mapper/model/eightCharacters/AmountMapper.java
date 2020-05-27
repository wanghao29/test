package com.asiainfo.cmc.mapper.model.eightCharacters;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.SumProvstockGd;
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



public interface AmountMapper {

	
	public List<ZdEightDimDict>  getDimMods(Map<String,String> param);
	public List<Map<String,String>>  getKpis(Map<String,String> param);
	
	@DS("dataSource2")
	public ZdEightDimDict getDimDictByDim(Map<String,String> param);
	
	public void importPeopleNum(List<ImportPeopleNum> list);
	
	public void importTeam(List<ImportTeamIncom> list);
	
	public void importCost(List<ImportCost> list);
	
	public void importGross(List<ImportGrossProfit> list);
	public void importGross_brand(List<ImportGrossProfit> list);
	
	public List<ImportPeopleNum> getPersonList(Map<String,String> param);
	public List<ImportTeamIncom> getTeamList(Map<String,String> param);
	public List<ImportCost> getCostList(Map<String,String> param);
	public List<ImportGrossProfit> getGrossList(Map<String,String> param);

	public int  getTotalByPerson(Map<String,String> param);
	public int  getTotalByTeam(Map<String,String> param);
	public int  getTotalByCost(Map<String,String> param);
	public int  getTotalByGross(Map<String,String> param);

	public void updateByPerson(Map<String,String>  params);
	public void updateByTeam(Map<String,String>  params);
	public void updateByCost(Map<String,String>  params);
	public void updateByGross(Map<String,String>  params);
	
	public  Integer selectCost(Map<String,String>  params);
	public  Integer selectPerson(Map<String,String>  params);
	public  Integer selectTeam(Map<String,String>  params);
	public  Integer selectGross(Map<String,String>  params);
	
	public  void addCost(Map<String,String>  params);
	public  void addPerson(Map<String,String>  params);
	public  void addTeam(Map<String,String>  params);
	public  void addGross(Map<String,String>  params);
	
	public SumProvstockGd  getInventory_number(Map<String,String> param);
	
	public SumProvstockGd  getInventory_money(Map<String,String> param);

	public SumProvstockGd  getInventory_all(Map<String,String> param);
	
	 
	//姣涘埄棰� -鍦板競
	public String gross_profit_city(Map<String,String> params);
	//姣涘埄棰�-鍝佺墝
	public String gross_profit_brand(Map<String,String> params);
	
	public void delete_gross(@Param("monthField") String monthField,@Param("monSet") Set<String> monSet,@Param("tableName")String tableName);
	
	public Zd8typeInfoConfirm getConfirmInfo(@Param("dim")String dim);
	
	public Zd8typeInfoConfirm zlConfirmInfTS(@Param("id")String id);
	
	public Zd8typeInfoConfirmLog getConfirmLog(Map<String, String> params);
	
	public void delete_confirm_log(Map<String,String> param);
	
	public void insertInfo(Map<String,String> param);
	
	public String getMbz(Map<String,String> param);
	
	public String getProfitRemarks(Map<String,String> param);
	public String getRemarks(Map<String,String> param);
	
	public void saveProfitR(Map<String,String> param);
	public void saveRemarks(Map<String,String> param);
	public void deleteProfitR(Map<String,String> param);
	
	public void insertWuweiyiti(ImportWuweiyiti importWuweiyiti);
	public void insertWugexiaomie(ImportWugexiaomie importWugexiaomie);
	public void insertInfoProfitCost(ImportInfoProfitCost infoProfitCost);
	public void deleteWuweiyiti(@Param("month")String month);
	public void deleteWugexiaomie(@Param("month")String month);
	public void deleteInfoProfitCost(@Param("month")String month);
}
