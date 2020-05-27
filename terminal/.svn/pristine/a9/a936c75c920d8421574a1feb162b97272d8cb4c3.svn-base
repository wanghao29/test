package com.asiainfo.cmc.qudao.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.util.StringUtil;

import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.enties.ZdResultHallQudaoM;
import com.asiainfo.cmc.qudao.mapper.CusChanPortrayMapper;
import com.asiainfo.cmc.qudao.mapper.ZdResultHallQudaoMMapper;
import com.asiainfo.cmc.qudao.service.IZdResultHallQudaoMService;
import com.asiainfo.cmc.qudao.utils.MyDateFormat;
import com.asiainfo.cmc.qudao.utils.PortrayIntegration;
import com.asiainfo.cmc.qudao.vo.QudaoVo;

@Service
@Transactional
public class ZdResultHallQudaoMService implements IZdResultHallQudaoMService{
	
    @Resource
    private CusChanPortrayMapper cusChanPortrayMapper;
	
	@Resource
	private ZdResultHallQudaoMMapper zdResultHallQudaoMMapper;

	@Override
	public List<QudaoVo> listHallQudao(QudaoVo vo) {
		return zdResultHallQudaoMMapper.listHallQudao(vo);
	}
	
	@Override
	public List<String> listBrand(QudaoVo vo) {
		return zdResultHallQudaoMMapper.listBrand( vo);
	}

	@Override
	public List<QudaoVo> listSpecByBrand(QudaoVo vo) {
		return zdResultHallQudaoMMapper.listSpecByBrand(vo);
	}
	
	@Override
	public List<CusChanPortray> listPortrayFieldInHallQudao() {
		return  cusChanPortrayMapper.listPortrayFieldInHallQudao();
	}

	@Override
	public List<CusChanPortray> listHallQudaoByIds(QudaoVo vo) {
		List<CusChanPortray> portrays =  cusChanPortrayMapper.listHallQudaoByIds(vo.getIds());
		
		List<CusChanPortray> showType1 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType2 = new ArrayList<CusChanPortray>();//多月份数据拼接
		List<CusChanPortray> showType3 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType4 = new ArrayList<CusChanPortray>();
		//sum成不同维度的值
		String field = "stat_month";
		for(CusChanPortray portray : portrays){
			Integer showType = portray.getShowType();
			if(showType==2){
				showType2.add(portray);
				field += ","+"sum("+portray.getName()+") as " + portray.getName();
			}else if(showType==4){
				String details = portray.getDetail();					
				if(StringUtil.isNotEmpty(details)){      //处理特殊柱状图  单点促销能力 
					String[] detNames = details.split(";")[1].split(",");
					for(String detName : detNames){
						field += ","+ "SUM(" +detName+ ") " +detName;
				    }
					showType4.add(portray);
				}else{
					showType2.add(portray);
				}
			}else if(showType==3){ 
				showType3.add(portray);
				field += ","+"sum("+portray.getName()+")/count("+portray.getName()+") as " + portray.getName();
			}else{
				showType1.add(portray);
				field += ","+"max("+portray.getName()+") as " + portray.getName();
			}
		}
				
		List<String> months = MyDateFormat.getMonthSblings(vo.getStatMonth(),6);
		vo.setMonths(months);
		vo.setField(field);
		
		Map<String,Object> map = zdResultHallQudaoMMapper.getFieldByMonth(vo);
		//查询showType=1的结果集 并封装画像模型	
		if(showType1.size()>0){			
			PortrayIntegration.showType1(map,showType1);
		}
		
		//查询showType=3的结果集 并封装画像模型			
		if(showType3.size()>0){
			PortrayIntegration.showType3(map,showType3);
		}
		
		if(showType4.size()>0){			
			Map<String,Object> map4 = zdResultHallQudaoMMapper.getFieldByMonth(vo);
			PortrayIntegration.showType4(map4,showType4);
		}
		
		//查询showType=2的结果集 并封装画像模型
		if(showType2.size()>0){
			List<Map<String,Object>> mapList = zdResultHallQudaoMMapper.listFieldByMonths(vo);  
			PortrayIntegration.showType2(mapList,showType2,months,"stat_month");
		}
		
		return portrays;
	}

	@Override
	public List<ZdResultHallQudaoM> listAllTtemHallQudaoByPortIds(QudaoVo vo) {		
		List<ZdResultHallQudaoM> hallQudaos = zdResultHallQudaoMMapper.listAllTtemHallQudaoByPortIds(vo);
		return hallQudaos;
	}

}
