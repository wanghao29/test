package com.asiainfo.cmc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.qudao.mapper.ZdTermTac4GplusMapper;
import com.asiainfo.cmc.service.IZdTermTac4GplusService;


@Service
@Transactional
public class ZdTermTac4GplusService implements IZdTermTac4GplusService{

	@Resource
	private ZdTermTac4GplusMapper zdTermTac4GplusMapper;

	@Override
	public List<String> listBrand() {
		return zdTermTac4GplusMapper.listBrand();
	}

	@Override
	public List<String> listSpecByBrand(String brand) {
		return zdTermTac4GplusMapper.listSpecByBrand(brand);
	}

	
}
