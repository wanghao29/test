package com.asiainfo.cmc.service;

import java.util.List;

import com.asiainfo.cmc.enties.InternetIndex;
import com.asiainfo.cmc.enties.ModelInternet;
import com.asiainfo.cmc.enties.StockTurnOver;

/**
* @author WANGHAO
* @version 创建时间：2020年4月15日 上午11:48:59
* @ClassName 类名称
* @Description 类描述
*/

public interface ModelInternetService {
    //查询出互联网销量完成情况的销量汇总
	String selectDate(String start,String end);	
	//查询出互联网考核指标
	String selectDateI(InternetIndex inter);
	//查询出互联网KPI完成进度大类取数	
	List<ModelInternet> listBig(String start,String end);
	//查询出按品牌区分的大类值
	List<ModelInternet> listBrand(ModelInternet m);
	//查询出按机型区分的大类值
    List<ModelInternet> listSpec(ModelInternet m);
    //查询出按配置区分的大类值
    List<ModelInternet> listMemory(ModelInternet m);
    //查询出按颜色区分的大类值
    List<ModelInternet> listColor(ModelInternet m);
    //查询出按渠道区分的大类值
    List<ModelInternet> listClientName (ModelInternet m);	
	//查出库存周转量的数据
    List<StockTurnOver> listAllStock(String time);//时间格式为20200101
	
    //--------------------------收入------------------------------------
    
	// 查询出互联网销量完成情况的销量汇总
	String selectDateIncome(String start, String end);

	// 查询出互联网考核指标
	String selectDateIIncome(InternetIndex inter);

	// 查询出互联网KPI完成进度大类取数
	List<ModelInternet> listBigIncome(String start, String end);

	// 查询出按品牌区分的大类值
	List<ModelInternet> listBrandIncome(ModelInternet m);

	// 查询出按机型区分的大类值
	List<ModelInternet> listSpecIncome(ModelInternet m);

	// 查询出按配置区分的大类值
	List<ModelInternet> listMemoryIncome(ModelInternet m);

	// 查询出按颜色区分的大类值
	List<ModelInternet> listColorIncome(ModelInternet m);

	// 查询出按渠道区分的大类值
	List<ModelInternet> listClientNameIncome(ModelInternet m);

	// 查出库存周转量的数据
	List<StockTurnOver> listAllStockIncome(String time);// 时间格式为20200101
	
	
	 //--------------------------利润------------------------------------
    
		// 查询出互联网销量完成情况的销量汇总
		String selectDateRote(String start, String end);

		// 查询出互联网考核指标
		String selectDateIRote(InternetIndex inter);

		// 查询出互联网KPI完成进度大类取数
		List<ModelInternet> listBigRote(String start, String end);

		// 查询出按品牌区分的大类值
		List<ModelInternet> listBrandRote(ModelInternet m);

		// 查询出按机型区分的大类值
		List<ModelInternet> listSpecRote(ModelInternet m);

		// 查询出按配置区分的大类值
		List<ModelInternet> listMemoryRote(ModelInternet m);

		// 查询出按颜色区分的大类值
		List<ModelInternet> listColorRote(ModelInternet m);

		// 查询出按渠道区分的大类值
		List<ModelInternet> listClientNameRote(ModelInternet m);

		// 查出库存周转量的数据
		List<StockTurnOver> listAllStockRote(String time);// 时间格式为20200101
	
	
	
}
