package com.asiainfo.cmc.mapper;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.enties.BrokenScreen;
import com.asiainfo.cmc.enties.CityKpi2019;
import com.asiainfo.cmc.enties.InternetIndex;
import com.asiainfo.cmc.enties.Model5G;

/** 
* @author 作者 Your-Name:wanghao 
* @version 创建时间：2019年4月16日 下午3:21:33 
* 
*/

public interface CityKpi2019Mapper {

	int insert(CityKpi2019 record);
	
	//查询所有数据的呈现
	List <CityKpi2019> selectAll(String spare);
	//更新功能的实现
	int updateSelective(CityKpi2019 record);	
	//期初数据导入功能的实现
	int insertModel5g(Model5G z);
	//查询所有数据的呈现
	List <Model5G> selectModel5g(String spare);
	//获取数据的条数
    public  Integer getSize(Map map);
    //分页显示
    List<Map> pageList(Map map);
    //查询期初数据一条数据
    Model5G selectOne(Integer id);
    // 删除一条期初数据
    int deleteOne(Integer id);
    //更新一条期初数据
    int updateOne(Model5G model5g);
    //增加一条期初信息
    int insertOne(Model5G model5g);
	
    
    
    
    
	//期初数据导入功能的实现
  	int insertBrokenScreens(List<BrokenScreen> model);
  	//查询所有数据的呈现
      List <BrokenScreen> selectBrokenScreen();
      //获取数据的条数
      public  Integer getSizeBrokenScreen(Map map);
      //分页显示
      List<Map> pageListBrokenScreen(Map map);
      //查询期初数据一条数据
      BrokenScreen selectOneBrokenScreen(Integer id);
      // 删除一条期初数据
      int deleteOneBrokenScreen(Integer id);
      //更新一条期初数据
      int updateOneBrokenScreen(BrokenScreen model5g);
      //增加一条期初信息
      int insertBrokenScreen(BrokenScreen model5g);
    
    
      //互联网数据功能的实现 
      //查询所有数据的呈现
      List <InternetIndex> selectInternetIndex();
      //获取数据的条数
      public  Integer getSizeInternetIndex(Map map);
      //分页显示
      List<Map> pageListInternetIndex(Map map);
      //查询期初数据一条数据
      InternetIndex selectOneInternetIndex(Integer id);
      // 删除一条期初数据
      int deleteOneInternetIndex(Integer id);
      //更新一条期初数据
      int updateOneInternetIndex(InternetIndex model5g);
      //增加一条期初信息
      int insertInternetIndex(InternetIndex model5g);
      
      
      
      
      
      
      
      
    
    
	
	
}
