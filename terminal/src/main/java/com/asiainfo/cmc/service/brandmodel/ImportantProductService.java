package com.asiainfo.cmc.service.brandmodel;

import java.util.List;

import com.asiainfo.cmc.enties.brandmodel.ImportantProduct;

/**
 * 根据产品查询完成率和月份
 * @author Administrator
 *
 */
public interface ImportantProductService {

	
	/**
	 * 查询所有数据
	 * @param zdcp
	 * @return
	 */
	List <ImportantProduct> selectAllList(String zdcp);
	
	
	
	
	
	
	
	
	
}
