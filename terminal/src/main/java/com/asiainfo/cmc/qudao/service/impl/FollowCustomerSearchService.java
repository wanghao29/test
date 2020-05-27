package com.asiainfo.cmc.qudao.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.util.StringUtil;

import com.asiainfo.cmc.qudao.enties.FollowCustomerSearch;
import com.asiainfo.cmc.qudao.mapper.FollowCustomerSearchMapper;
import com.asiainfo.cmc.qudao.service.IFollowCustomerSearchService;
import com.asiainfo.cmc.qudao.vo.FollowCustomerSearchVo;

@Service
@Transactional
public class FollowCustomerSearchService implements IFollowCustomerSearchService{

    @Resource
    private FollowCustomerSearchMapper followCustomerSearchMapper;
    
	public FollowCustomerSearch getMaxValue(FollowCustomerSearchVo followCustomerSearchVo){
		FollowCustomerSearch maxValue = followCustomerSearchMapper.getMaxValue(followCustomerSearchVo);
		maxValue = maxValue!=null?maxValue:new FollowCustomerSearch();
		return maxValue;
	}

	@Override
	public List<FollowCustomerSearch> listFollowCustomer(FollowCustomerSearchVo vo) {
		//cust0 用于查询某地是某时间段所有存在的
		FollowCustomerSearchVo cust0 = new FollowCustomerSearchVo();
		cust0.setTag1(vo.getTag1());
		cust0.setStartDay(vo.getStartDay());
		cust0.setEndDay(vo.getEndDay());
		cust0.setBrandname(vo.getBrandname());
		cust0.setSpec(vo.getSpec());
		cust0.setTag11(vo.getTag11());
		cust0.setTag12(vo.getTag12());
        //全量客商
		List<FollowCustomerSearch> allCust = followCustomerSearchMapper.listCust_zd_result_cust_portrait_new_m(new FollowCustomerSearchVo());
		
		/**
		 * 取出符合条件的orga，当从0开始时：对比全量查出不存在的后做并集
		 */
		List<String> custDynamicD = null;
		//if(isQuery_ZD_RESULT_CUSTOMER_DYNAMIC_D(vo)){
			custDynamicD = followCustomerSearchMapper.listOrga_ZD_RESULT_CUSTOMER_DYNAMIC_D(vo);
			if(isQuery0_ZD_RESULT_CUSTOMER_DYNAMIC_D(vo)){				
				List<String> custDynamicD0 = followCustomerSearchMapper.listOrga_ZD_RESULT_CUSTOMER_DYNAMIC_D(cust0);
				custDynamicD = returnMatchOrgas(allCust,custDynamicD0,custDynamicD);
			}
		//} 
		
		List<String> custNormalM = null;
       // if(StringUtil.isNotEmpty(vo.getCntstockStart())){
        	custNormalM = followCustomerSearchMapper.listOrga_ZD_RESULT_CUSTOMER_NORMAL_M(vo);
        	//if(Float.parseFloat(vo.getCntstockStart())==0){
				List<String> custNormalM0 = followCustomerSearchMapper.listOrga_ZD_RESULT_CUSTOMER_NORMAL_M(cust0);
				custNormalM = returnMatchOrgas(allCust,custNormalM0,custNormalM);
        	//}
        //} 
        
        List<String> ctmsSoD = null;
        if(StringUtil.isNotEmpty(vo.getAmoutSoZd1Start()) || StringUtil.isNotEmpty(vo.getAmoutSoStart())){ //选中数量（而不是仅仅品牌机型）才会查找对应的表
        	ctmsSoD = followCustomerSearchMapper.listOrga_ZD_CTMS_SO_D(vo);
        	if(StringUtil.isNotEmpty(vo.getAmoutSoZd1Start())?Float.parseFloat(vo.getAmoutSoZd1Start())==0:true   //此处与客商新表的品牌、机型处理不同
        			&& StringUtil.isNotEmpty(vo.getAmoutSoStart())?Float.parseFloat(vo.getAmoutSoStart())==0:true){  
				List<String> ctmsSoD0 = followCustomerSearchMapper.listOrga_ZD_CTMS_SO_D(cust0);
				ctmsSoD = returnMatchOrgas(allCust,ctmsSoD0,ctmsSoD);
        	}
        }
        
        List<String> ctmsSiD = null;
        //if(StringUtil.isNotEmpty(vo.getAmoutSiStart())){ //选中数量（而不是仅仅品牌机型）才会查找对应的表
        	ctmsSiD = followCustomerSearchMapper.listOrga_ZD_CTMS_SI_D(vo);
        	//if(StringUtil.isNotEmpty(vo.getAmoutSiStart())?Float.parseFloat(vo.getAmoutSiStart())==0:true){  //此处与客商新表的品牌、机型处理不同
				List<String> ctmsSiD0 = followCustomerSearchMapper.listOrga_ZD_CTMS_SI_D(cust0);
				ctmsSiD = returnMatchOrgas(allCust,ctmsSiD0,ctmsSiD);
        	//}
       // } 
        
        List<String> ksxb_pj = null;
		//if(isQuery_zd_result_cust_portrait_new_m_pj(vo)){
			ksxb_pj = followCustomerSearchMapper.listOrga_zd_result_cust_portrait_new_m_pj(vo);
			//if(isQuery0_zd_result_cust_portrait_new_m_pj(vo)){			//值都为0才会执行，不管品牌机型偏好是否为空	
				 List<String> orgacodes0 = followCustomerSearchMapper.listOrga_zd_result_cust_portrait_new_m_pj(cust0);
				 ksxb_pj = returnMatchOrgas(allCust,orgacodes0,ksxb_pj);
			//}
		//}
        
        List<String> orgacodes = null;
		//if(isQuery_zd_result_cust_portrait_new_m(vo)){
			orgacodes = followCustomerSearchMapper.listOrga_zd_result_cust_portrait_new_m(vo);
			//if(isQuery0_zd_result_cust_portrait_new_m(vo)){			//值都为0才会执行，不管品牌机型偏好是否为空	
				// List<String> orgacodes0 = followCustomerSearchMapper.listOrga_zd_result_cust_portrait_new_m(cust0);
				// orgacodes = returnMatchOrgas(allCust,orgacodes0,orgacodes);
			//}
		//}
        
		//不同的表中取交集
        if(custDynamicD!=null){
            if(orgacodes==null){
            	orgacodes = custDynamicD;
            }else{
            	orgacodes.retainAll(custDynamicD);
            }       	
        }
        
        if(custNormalM!=null){
        	if(orgacodes==null){
        		orgacodes = custNormalM;
        	}else{
        		orgacodes.retainAll(custNormalM);
        	}        	
        }
        
        if(ctmsSoD!=null ){
        	if(orgacodes==null){
        		orgacodes = ctmsSoD;
        	}else{
        		orgacodes.retainAll(ctmsSoD);
        	}        	
        }
        
        if(ctmsSiD!=null ){
        	if(orgacodes==null){
        		orgacodes = ctmsSiD;
        	}else{
        		orgacodes.retainAll(ctmsSiD);
        	}      	
        }
        
        if(ksxb_pj!=null ){
        	if(orgacodes==null){
        		orgacodes = ksxb_pj;
        	}else{
        		orgacodes.retainAll(ksxb_pj);
        	}      	
        }
        
        List<FollowCustomerSearch> custs = new ArrayList<FollowCustomerSearch>();        
        for(FollowCustomerSearch cust : allCust){
        	if(orgacodes==null || orgacodes.size()==0){
        		break;
        	}
        	String orgacode = cust.getOrgacode();
        	if(orgacodes.contains(orgacode)){
        		custs.add(cust);
        	}
        }
        
		return custs;
	}
	
	//符合条件的orga
	public List<String> returnMatchOrgas(List<FollowCustomerSearch> allCust,List<String> existOrga,List<String> orga){
		
		List<String> notExistOrga = new ArrayList<String>();
        for(FollowCustomerSearch f : allCust){
        	notExistOrga.add(f.getOrgacode());
        }
        //取出在全量中而不在某个表中的orga --即表中不存在的orga
        notExistOrga.removeAll(existOrga);
        //再与符合条件的orga合并 --即符合条件的orga  (去除重复
        notExistOrga.removeAll(orga);  
        notExistOrga.addAll(orga);
		return notExistOrga;
	}
	
	public boolean isQuery_ZD_RESULT_CUSTOMER_DYNAMIC_D(FollowCustomerSearchVo vo){
        if(StringUtil.isNotEmpty(vo.getCntnewStart())){     //新增入网数
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getCntotherStart())){   //全网通终端入网数
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getCnt4gpStart())){     //4g+终端入网数
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getCntydStart())){      //移动购机入网数
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getCntselfStart())){    //自带机入网数
        	return true;
        }
		return false;		
	}
	
	//执行方法前，先达成isQuery方法
	public boolean isQuery0_ZD_RESULT_CUSTOMER_DYNAMIC_D(FollowCustomerSearchVo vo){
        if(StringUtil.isNotEmpty(vo.getCntnewStart())){     //新增入网数
        	if(Float.parseFloat(vo.getCntnewStart())!=0){
        		return false;
        	}
        	
        }
        if(StringUtil.isNotEmpty(vo.getCntotherStart())){   //全网通终端入网数
        	if(Float.parseFloat(vo.getCntotherStart())!=0){
        		return false;
        	}
        }
        if(StringUtil.isNotEmpty(vo.getCnt4gpStart())){     //4g+终端入网数
        	if(Float.parseFloat(vo.getCnt4gpStart())!=0){
        		return false;
        	}
        }
        if(StringUtil.isNotEmpty(vo.getCntydStart())){      //移动购机入网数
        	if(Float.parseFloat(vo.getCntydStart())!=0){
        		return false;
        	}
        }
        if(StringUtil.isNotEmpty(vo.getCntselfStart())){    //自带机入网数
        	if(Float.parseFloat(vo.getCntselfStart())!=0){
        		return false;
        	}
        }
		return true;		
	}
	
	//客商新表--关联品牌机型偏好
	public boolean isQuery_zd_result_cust_portrait_new_m_pj(FollowCustomerSearchVo vo){        
        //3、提货偏好	
        if(StringUtil.isNotEmpty(vo.getTag11())){      //品牌偏好
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getTag12())){      //机型偏好
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getTag21Start())){    //提货数量
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getTag16Start())){    //提货次数
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getTag20Start())){    //提货金额
        	return true;
        }
       
		return false;		
	}
	
	//执行方法前，先达成isQuery方法
	public boolean isQuery0_zd_result_cust_portrait_new_m_pj(FollowCustomerSearchVo vo){   
		//此处与ctms的品牌、机型处理不同
        if(StringUtil.isNotEmpty(vo.getTag11())){      //品牌偏好
        	return false;
        }
        if(StringUtil.isNotEmpty(vo.getTag12())){      //机型偏好
        	return false;
        }
		
        if(StringUtil.isNotEmpty(vo.getTag21Start())){    //提货数量
        	if(Float.parseFloat(vo.getTag21Start())!=0){
        		return false;
        	}
        }
        if(StringUtil.isNotEmpty(vo.getTag16Start())){    //提货次数
        	if(Float.parseFloat(vo.getTag16Start())!=0){
        		return false;
        	}
        }
        if(StringUtil.isNotEmpty(vo.getTag20Start())){    //提货金额
        	if(Float.parseFloat(vo.getTag20Start())!=0){
        		return false;
        	}
        }

		return true;		
	}
	
	//客商新表--不关联品牌机型偏好
	public boolean isQuery_zd_result_cust_portrait_new_m(FollowCustomerSearchVo vo){
		//1、客流量信息
        if(StringUtil.isNotEmpty(vo.getNetinValStart())){     //入网量
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getPassengerVolStart())){   //客流量
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getUsrNbrStockStart())){     //存量客户群
        	return true;
        }
        
        //6、厅店扩展
        if(StringUtil.isNotEmpty(vo.getUsrNbrHallValStart())){    //厅店客流群
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getUsrNbrHallStart())){      //厅店覆盖客户数
        	return true;
        }
        
        //7、DM流向	
        if(StringUtil.isNotEmpty(vo.getDmStockRateStart())){    // DM串货率
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getDiffNetRateStart())){     //异网渗透率
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getNetInRatioStart())){     //入网占比
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getBlackCustRatioStart())){  //黑名单客户占比
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getSusCarkRatioStart())){    //疑似养卡客户占比
        	return true;
        }
        if(StringUtil.isNotEmpty(vo.getOneThreeRatioStart())){    //一号三机客户占比
        	return true;
        }
          
        if(StringUtil.isNotEmpty(vo.getCountStart())){            //门店覆盖数
        	return true;
        }

		return false;		
	}
	
	//执行方法前，先达成isQuery方法
	public boolean isQuery0_zd_result_cust_portrait_new_m(FollowCustomerSearchVo vo){
		//1、客流量信息
        if(StringUtil.isNotEmpty(vo.getNetinValStart())){     //入网量
        	if(Float.parseFloat(vo.getNetinValStart())!=0){
        		return false;
        	}
        }
        if(StringUtil.isNotEmpty(vo.getPassengerVolStart())){   //客流量
        	if(Float.parseFloat(vo.getPassengerVolStart())!=0){
        		return false;
        	}
        }
        if(StringUtil.isNotEmpty(vo.getUsrNbrStockStart())){     //存量客户群
        	if(Float.parseFloat(vo.getUsrNbrStockStart())!=0){
        		return false;
        	}
        }
        
        //6、厅店扩展
        if(StringUtil.isNotEmpty(vo.getUsrNbrHallValStart())){    //厅店客流群
        	if(Float.parseFloat(vo.getUsrNbrHallValStart())!=0){
        		return false;
        	}
        }
        if(StringUtil.isNotEmpty(vo.getUsrNbrHallStart())){      //厅店覆盖客户数
        	if(Float.parseFloat(vo.getUsrNbrHallStart())!=0){
        		return false;
        	}
        }
        
        //7、DM流向	
        if(StringUtil.isNotEmpty(vo.getDmStockRateStart())){    // DM串货率
        	if(Float.parseFloat(vo.getDmStockRateStart())!=0){
        		return false;
        	}
        }
        if(StringUtil.isNotEmpty(vo.getDiffNetRateStart())){     //异网渗透率
        	if(Float.parseFloat(vo.getDiffNetRateStart())!=0){
        		return false;
        	}
        }
        if(StringUtil.isNotEmpty(vo.getNetInRatioStart())){     //入网占比
        	if(Float.parseFloat(vo.getNetInRatioStart())!=0){
        		return false;
        	}
        }
        if(StringUtil.isNotEmpty(vo.getBlackCustRatioStart())){  //黑名单客户占比
        	if(Float.parseFloat(vo.getBlackCustRatioStart())!=0){
        		return false;
        	}
        }
        if(StringUtil.isNotEmpty(vo.getSusCarkRatioStart())){    //疑似养卡客户占比
        	if(Float.parseFloat(vo.getSusCarkRatioStart())!=0){
        		return false;
        	}
        }
        if(StringUtil.isNotEmpty(vo.getOneThreeRatioStart())){    //一号三机客户占比
        	if(Float.parseFloat(vo.getOneThreeRatioStart())!=0){
        		return false;
        	}
        }
          
        if(StringUtil.isNotEmpty(vo.getCountStart())){            //门店覆盖数
        	if(Float.parseFloat(vo.getCountStart())!=0){
        		return false;
        	}
        }

		return true;		
	}
}
