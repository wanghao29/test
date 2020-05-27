package com.asiainfo.cmc.mapper.brandmodel;

import java.util.List;

import com.asiainfo.cmc.enties.brandmodel.ImportantProduct;

public interface ImportantProductMapper {

	
	/**
	 * 查询所有数据
	 * @param zdcp
	 * @return
	 */
	List <ImportantProduct> selectAllList(String zdcp);
	
	
	
	
	
	
	
}
