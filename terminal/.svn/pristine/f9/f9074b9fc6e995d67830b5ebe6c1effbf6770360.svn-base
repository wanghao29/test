package com.asiainfo.cmc.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.BrokenScreen;
import com.asiainfo.cmc.enties.CityKpi2019;
import com.asiainfo.cmc.enties.InternetIndex;
import com.asiainfo.cmc.enties.Model5G;
import com.asiainfo.cmc.mapper.CityKpi2019Mapper;
import com.asiainfo.cmc.service.CityKpi2019Service;

/** 
* @author 作者 Your-Name:wanghao 
* @version 创建时间：2019年4月16日 下午3:11:24 
* 
*/
@Service
@Transactional
public class CityKpi2019ServiceImpl implements CityKpi2019Service {
	@Resource
    private CityKpi2019Mapper cityKpi2019Mapper;
	
	
	@Override
	public int insertSelective(List<CityKpi2019> records) {
		int insertNum = 0;
		for(CityKpi2019 z : records){
			//z.setSpare("1");
			cityKpi2019Mapper.insert(z);
			
			insertNum++;
		}
		return insertNum;
	}


	@Override
	public List<CityKpi2019> selectAll(String spare) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.selectAll(spare);
	}


	@Override
	public int updateSelective(List<CityKpi2019> records) {
		int insertNum = 0;
		for(CityKpi2019 z : records){
			//z.setSpare("1");
			cityKpi2019Mapper.updateSelective(z);
			insertNum++;
		}
		return insertNum;
		
	}


	@Override
	public int insertModel5g(List<Model5G> model) {
		int insertNum = 0;
		for(Model5G z : model){
			//z.setSpare("1");
			cityKpi2019Mapper.insertModel5g(z);
			
			insertNum++;
		}
		return insertNum;
	}


	@Override
	public List<Model5G> selectModel5g(String spare) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.selectModel5g(spare);
	}


	@Override
	public Integer getSize(Map map) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.getSize(map);
	}


	@Override
	public List<Map> pageList(Map map) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.pageList(map);
	}


	@Override
	public Model5G selectOne(Integer id) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.selectOne(id);
	}


	@Override
	public int deleteOne(Integer id) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.deleteOne(id);
	}


	@Override
	public int updateOne(Model5G model5g) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.updateOne(model5g);
	}


	@Override
	public int insertOne(Model5G model5g) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.insertOne(model5g);
	}


	@Override
	public int insertBrokenScreens(List<BrokenScreen> model) {
		int insertNum = 0;
		for(BrokenScreen z : model){
			//z.setSpare("1");
			cityKpi2019Mapper.insertBrokenScreen(z);
			
			insertNum++;
		}
		return insertNum;
		
	}


	@Override
	public List<BrokenScreen> selectBrokenScreen() {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.selectBrokenScreen();
	}


	@Override
	public Integer getSizeBrokenScreen(Map map) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.getSizeBrokenScreen(map);
	}


	@Override
	public List<Map> pageListBrokenScreen(Map map) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.pageListBrokenScreen(map);
	}


	@Override
	public BrokenScreen selectOneBrokenScreen(Integer id) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.selectOneBrokenScreen(id);
	}


	@Override
	public int deleteOneBrokenScreen(Integer id) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.deleteOneBrokenScreen(id);
	}


	@Override
	public int updateOneBrokenScreen(BrokenScreen model5g) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.updateOneBrokenScreen(model5g);
	}


	@Override
	public int insertBrokenScreen(BrokenScreen model5g) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.insertBrokenScreen(model5g);
	}


	@Override
	public List<InternetIndex> selectInternetIndex() {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.selectInternetIndex();
	}


	@Override
	public Integer getSizeInternetIndex(Map map) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.getSizeInternetIndex(map);
	}


	@Override
	public List<Map> pageListInternetIndex(Map map) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.pageListInternetIndex(map);
	}


	@Override
	public InternetIndex selectOneInternetIndex(Integer id) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.selectOneInternetIndex(id);
	}


	@Override
	public int deleteOneInternetIndex(Integer id) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.deleteOneInternetIndex(id);
	}


	@Override
	public int updateOneInternetIndex(InternetIndex model5g) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.updateOneInternetIndex(model5g);
	}


	@Override
	public int insertInternetIndex(InternetIndex model5g) {
		// TODO Auto-generated method stub
		return cityKpi2019Mapper.insertInternetIndex(model5g);
	}


	
}
