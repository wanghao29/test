package com.asiainfo.cmc.service.impl.brandmodel;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.asiainfo.cmc.enties.brandmodel.ProductInformationSetMajor;
import com.asiainfo.cmc.mapper.brandmodel.ProductInformationSetMajorMapper;
import com.asiainfo.cmc.service.brandmodel.ProductInformationSetMajorService;


@Service
@Transactional
public class ProductInformationSetMajorServiceImpl implements ProductInformationSetMajorService{

	 @Resource
	 private ProductInformationSetMajorMapper productInformationSetMajorMapper;



	 @Override
	 public int selectTimeRange(String brand, String spec) {
		// TODO Auto-generated method stub
		return productInformationSetMajorMapper.selectTimeRange(brand, spec);
	}

	 @Override
	 public int updateDate(String brand, String spec, String ranger) {
		// TODO Auto-generated method stub
		return productInformationSetMajorMapper.updateDate(brand, spec, ranger);
	}

	@Override
	public int updateToatal(ProductInformationSetMajor pm) {
		// TODO Auto-generated method stub
		return productInformationSetMajorMapper.updateToatal(pm);
	}

	@Override
	public ProductInformationSetMajor selectOnePm(String brand, String spec) {
		// TODO Auto-generated method stub
		return productInformationSetMajorMapper.selectOnePm(brand, spec);
	}

	@Override
	public int insertMajor(ProductInformationSetMajor pm) {
		// TODO Auto-generated method stub
		return productInformationSetMajorMapper.insertMajor(pm);
	}

	@Override
	public List<ProductInformationSetMajor> selectListTop10() {
		// TODO Auto-generated method stub
		return productInformationSetMajorMapper.selectListTop10();
	}

	@Override
	public ProductInformationSetMajor selectOneTop10(ProductInformationSetMajor pm) {
		// TODO Auto-generated method stub
		return productInformationSetMajorMapper.selectOneTop10(pm);
	}

	@Override
	public int updateTop10(ProductInformationSetMajor pm) {
		// TODO Auto-generated method stub
		return productInformationSetMajorMapper.updateTop10(pm);
	}

	@Override
	public List<String> selectBrandTop10() {
		// TODO Auto-generated method stub
		return productInformationSetMajorMapper.selectBrandTop10();
	}

	@Override
	public List<String> selectModelTop10(ProductInformationSetMajor pm) {
		// TODO Auto-generated method stub
		return productInformationSetMajorMapper.selectModelTop10(pm);
	}

	@Override
	public ProductInformationSetMajor selectNewPM(String brand, String spec) {
		// TODO Auto-generated method stub
		return productInformationSetMajorMapper.selectNewPM(brand, spec);
	}

	@Override
	public List<ProductInformationSetMajor> selectListEntry(String start, String end) {
		// TODO Auto-generated method stub
		return productInformationSetMajorMapper.selectListEntry(start, end);
	}

	@Override
	public String selectStart() {
		// TODO Auto-generated method stub
		return productInformationSetMajorMapper.selectStart();
	}

	@Override
	public String selectEnd() {
		// TODO Auto-generated method stub
		return productInformationSetMajorMapper.selectEnd();
	}
	
	
	 
	 
	 
	 
	 
	
}
