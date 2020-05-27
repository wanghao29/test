package com.asiainfo.cmc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.Goods;
import com.asiainfo.cmc.mapper.GoodsMapper;
import com.asiainfo.cmc.service.Itest;

@Service
@Transactional
public class test implements Itest {
/*	
	@Autowired
	private GoodsMapper goodsMapper;*/
	 //自动装配
    @Resource
    private GoodsMapper goodsMapper;
	 

    //分页
    @Override
    public List<Goods> getGoodsPager() {
        
        return goodsMapper.getGoodsPager();
    }

    //获得单个产品对象
    @Override
    public Goods getGoodsById(int id) {
        return goodsMapper.getGoodsById(id);
    }
    
    //获得商品总数
    @Override
    public int getGoodsCount() {
        return goodsMapper.getGoodsCount();
    }

    //添加
    @Override
    public int insert(Goods entity) {
        return goodsMapper.insert(entity);
    }

    //删除单个
    @Override
    public int delete(int id) {
        return goodsMapper.delete(id);
    }
    
    //删除多个
    @Override
    public int deletes(int[] ids) {
        int rows=0;
        for (int id : ids) {
            rows+=delete(id);
        }
        return rows;
    }

    //更新
    @Override
    public int update(Goods entity) {
        return goodsMapper.update(entity);
    }
	
}
