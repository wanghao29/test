package com.asiainfo.cmc.qudao.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.mapper.CusChanPortrayMapper;
import com.asiainfo.cmc.qudao.mapper.ZdResultCellQudaoMMapper;
import com.asiainfo.cmc.qudao.service.IZdResultCellQudaoMService;
import com.asiainfo.cmc.qudao.utils.MyDateFormat;
import com.asiainfo.cmc.qudao.utils.PortrayIntegration;
import com.asiainfo.cmc.qudao.vo.QudaoVo;

@Service
@Transactional
public class ZdResultCellQudaoMService implements IZdResultCellQudaoMService{

    @Resource
    private CusChanPortrayMapper cusChanPortrayMapper;
	@Resource
	private ZdResultCellQudaoMMapper zdResultCellQudaoMMapper;

	@Override
	public List<QudaoVo> listCellQudao(QudaoVo vo) {
		return zdResultCellQudaoMMapper.listCellQudao(vo);
	}
	
	@Override
	public List<String> listBrand(QudaoVo vo) {
		return zdResultCellQudaoMMapper.listBrand(vo);
	}


	@Override
	public List<QudaoVo> listSpecByBrand(QudaoVo vo) {
		return zdResultCellQudaoMMapper.listSpecByBrand(vo);
	}


	@Override
	public List<CusChanPortray> listHallQudaoByIds(QudaoVo vo) {
		List<CusChanPortray> portrays =  cusChanPortrayMapper.listCellQudaoByIds(vo.getIds());
		
		List<CusChanPortray> showType1 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType2 = new ArrayList<CusChanPortray>();//多月份数据拼接
		List<CusChanPortray> showType3 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType4 = new ArrayList<CusChanPortray>();
		String field1 = "stat_month";
		String field2 = "stat_month";
		for(CusChanPortray portray : portrays){
			Integer showType = portray.getShowType();
			if(showType==2){
				showType2.add(portray);
				field2 += ","+"sum("+portray.getName()+") as " + portray.getName();
			}else if(showType==4){
				showType4.add(portray);
			}else if(showType==3){ 
				showType3.add(portray);
				field1 += ","+"sum("+portray.getName()+")/count("+portray.getName()+") as " + portray.getName();
			}else{
				showType1.add(portray);
				field1 += ","+"max("+portray.getName()+") as " + portray.getName();
			}
		}	
		
		List<String> months = MyDateFormat.getMonthSblings(vo.getStatMonth(),6);
		vo.setMonths(months);
		
		//查询showType=1的结果集 并封装画像模型		
		if(showType1.size()>0){
			vo.setField(field1);
			Map<String,Object> map = zdResultCellQudaoMMapper.getFieldByMonth(vo);
			PortrayIntegration.showType1(map,showType1);
		}
		
		//查询showType=2的结果集 并封装画像模型
		vo.setField(field1);
		if(showType2.size()>0){
			vo.setField(field2);
			List<Map<String,Object>> mapList = zdResultCellQudaoMMapper.listFieldByMonths(vo);      
			PortrayIntegration.showType2(mapList,showType2,months,"stat_month");
		}
		
		//查询showType=3的结果集 并封装画像模型		
		if(showType3.size()>0){
			vo.setField(field1);
			Map<String,Object> map = zdResultCellQudaoMMapper.getFieldByMonth(vo);
			PortrayIntegration.showType3(map,showType3);
		}
		
		if(showType4.size()>0){
			String field  = "";
			for(CusChanPortray portray : showType4){				
				String detail = portray.getDetail();
				String[] detailList = detail.split(";")[1].split(",");
				for(String del : detailList){
					field += "sum("+del+") as " + del +",";					
				}
			}
			field = field.substring(0, field.length()-1);
			vo.setField(field);
			Map<String,Object> map4 = zdResultCellQudaoMMapper.getFieldByMonth(vo);
			PortrayIntegration.showType4(map4,showType4);
		}
		
		return portrays;
	}

}
