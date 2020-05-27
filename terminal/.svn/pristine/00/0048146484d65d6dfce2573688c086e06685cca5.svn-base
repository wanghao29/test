package com.asiainfo.cmc.qudao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.qudao.vo.BrandMdlVo;

/**
 *  品牌型号
 */
public interface BrandMdlMapper {
	
	/**
	 * 获取BI品牌
	 */
	public List<BrandMdlVo> listBrandBi();
	
	/**
	 * 获取CTMS品牌
	 */
	public List<BrandMdlVo> listBrandCtms();
	
	/**
	 * 根据BI品牌获取机型
	 */
	public List<BrandMdlVo> listMdlByBrandBi(@Param(value="brand") String brand);

	/**
	 * 根据CTMS品牌获取机型
	 */
	public List<BrandMdlVo> listMdlByBrandCtms(@Param(value="brand") String brand);

}
