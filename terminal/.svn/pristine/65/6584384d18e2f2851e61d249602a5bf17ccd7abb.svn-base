package com.asiainfo.cmc.service.impl.brandmodel;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.brandmodel.ImportantProduct;
import com.asiainfo.cmc.mapper.brandmodel.ImportantProductMapper;
import com.asiainfo.cmc.service.brandmodel.ImportantProductService;
@Service
@Transactional
public class ImportantProductServiceImpl implements ImportantProductService {

	
	@Resource
	private ImportantProductMapper importantProductMapper;
	
	@Override
	public List<ImportantProduct> selectAllList(String zdcp) {
		// TODO Auto-generated method stub
		return importantProductMapper.selectAllList(zdcp);
	}

}
