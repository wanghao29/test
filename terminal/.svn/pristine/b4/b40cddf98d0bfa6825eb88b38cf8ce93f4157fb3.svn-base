package com.asiainfo.cmc.qudao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.qudao.mapper.BrandMdlMapper;
import com.asiainfo.cmc.qudao.service.IBrandMdlService;
import com.asiainfo.cmc.qudao.vo.BrandMdlVo;

@Service
@Transactional
public class BrandMdlService implements IBrandMdlService{
	
	@Resource
	private BrandMdlMapper brandMdlMapper;

	@Override
	public List<BrandMdlVo> listBrandBi() {
		return brandMdlMapper.listBrandBi();
	}

	@Override
	public List<BrandMdlVo> listBrandCtms() {
		return brandMdlMapper.listBrandCtms();
	}

	@Override
	public List<BrandMdlVo> listMdlByBrandBi(String brand) {
		return brandMdlMapper.listMdlByBrandBi(brand);
	}

	@Override
	public List<BrandMdlVo> listMdlByBrandCtms(String brand) {
		return brandMdlMapper.listMdlByBrandCtms(brand);
	}

}
