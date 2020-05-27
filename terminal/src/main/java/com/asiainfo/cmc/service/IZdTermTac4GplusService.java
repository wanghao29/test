package com.asiainfo.cmc.service;

import java.util.List;

public interface IZdTermTac4GplusService {
	
	/**
	 * 获取所有品牌
	 */
	public List<String> listBrand();
	
	/**
	 * 获取该品牌下所有机型
	 */
	public List<String> listSpecByBrand(String brand);

}
