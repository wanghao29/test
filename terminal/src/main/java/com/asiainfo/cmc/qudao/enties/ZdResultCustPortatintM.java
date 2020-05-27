package com.asiainfo.cmc.qudao.enties;

import java.io.Serializable;

/**
 * 渠道客商画像模型
 */
public class ZdResultCustPortatintM implements Serializable {

	private static final long serialVersionUID = 1L;

	private String orgacode;//客商id
	private String tag1;    //注册地市
	private String tag2;    //客户名称
	private String tag3;    //SCM编码
	private String tag4;    //CTMS编码
	private String tag5;    //注册时长
	private String tag6;    //客户类别
	private String tag7;    //客户子类别
	private String tag8;    //登录次数
	private String tag9;    //日均登录时长回
	private String tag30;   //积分信息
	private String tag31;   //返利金额
	private String tag37;   //支付方式占比
	private String tag32;   //转化率
	private String tag49;   //业务负责人
	private String tag51;   //采购负责人
	private String tag38;   //客户门店数量
	private String tag39;   //精品500门店数量
	private String tag40;   //促销员数量
	private String tag43;   //对应微区域经理
	private String tag50;   //操盘手
	private Integer zd_so_val;          //终端公司零售量SO值
	private Integer zd_so_level;        //终端公司零售量SO档位
	private Integer all_so_val;         //总零售量值
	private Integer all_so_level;       //总零售量档位
	private Integer si_val;             //分销量值
	private Integer si_level;           //分销量档位
	private Integer netin_val;          //入网量值
	private Integer netin_level;        //入网量分档档位
	private Integer passenger_vol;      //客流量
	private Integer usr_nbr_cell;       //覆盖存量用户数-基站
	private Integer usr_nbr_hall;       //覆盖存量用户数-门店
	private Integer usr_nbr_stock;      //存量客户群
	private Integer usr_nbr_hall_val;   //厅店客流群值
	private Integer usr_nbr_hall_level; //厅店客流群档位
	private String tag20;   //提货金额
	private String tag21;   //提货数量
	private String tag22;   //客单价
	private String tag23;   //客单量
	private String tag25;   //历史年度提货量
	private String tag44;   //客户容量
	private String tag35;   //客户SO占比
	private String tag36;   //客户SO份额
	private String avg_dwell_time;       //产品驻留平均时长
	private String single_sales_ability; //单品促销能力
	private String single_sales_amount;
	public String getSingle_sales_amount() {
		return single_sales_amount;
	}
	public void setSingle_sales_amount(String single_sales_amount) {
		this.single_sales_amount = single_sales_amount;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	private String market_matche_brand;  //库存市场匹配度（品牌）
	private String market_matche_price;  //库存市场匹配度（价格段）
	private String market_matche_sales;  //畅销品牌机型市场匹配度
	private String tag15;   //距上次提货时间间隔
	private String tag16;   //提货次数
	private String tag17;   //提货次数（KPI）
	private String tag18;   //历史提货次数
	private String tag19;   //历史提货次数（KPI）
	private String dm_stock_rate;        //DM串货率
	private String diff_net_rate;        //异网渗透率
	private String net_in_ratio;         //入网占比
	private String unhealth_ratio_all;   //不健康销量占比
	private String black_cust_ratio;     //黑名单客户占比
	private String sus_cark_ratio;       //疑似养卡客户占比
	private String one_three_ratio;      //一号3机占比
	private String arpu;    //渠道销售平均ARPU
	private String dou;     //渠道销售平均DOU
	private String mou;     //渠道销售平均MOU
	private String tag26;   //提货量变化情况（同比）
	private String tag27;   //提货量变化情况（环比）
	private String tag28;   //提货额变化情况（同比）
	private String tag29;   //提货额变化情况（环比）
	private String tag10;   //浏览偏好
	private String tag11;   //品牌偏好
	private String tag12;   //机型偏好
	private String tag24;   //提货价位段偏好
	private String tag13;   //畅销品牌占比（top3）
	private String tag14;   //畅销机型占比（top3）
	private String tag34;   //客户SO销量前三品牌机型
	private String tag41;   //销售品牌数量
	private String tag42;   //厂家渠道属性
	private  String month;  //
	
	public String getOrgacode() {
		return orgacode;
	}
	public void setOrgacode(String orgacode) {
		this.orgacode = orgacode;
	}
	public String getTag1() {
		return tag1;
	}
	public void setTag1(String tag1) {
		this.tag1 = tag1;
	}
	public String getTag2() {
		return tag2;
	}
	public void setTag2(String tag2) {
		this.tag2 = tag2;
	}
	public String getTag3() {
		return tag3;
	}
	public void setTag3(String tag3) {
		this.tag3 = tag3;
	}
	public String getTag4() {
		return tag4;
	}
	public void setTag4(String tag4) {
		this.tag4 = tag4;
	}
	public String getTag5() {
		return tag5;
	}
	public void setTag5(String tag5) {
		this.tag5 = tag5;
	}
	public String getTag6() {
		return tag6;
	}
	public void setTag6(String tag6) {
		this.tag6 = tag6;
	}
	public String getTag7() {
		return tag7;
	}
	public void setTag7(String tag7) {
		this.tag7 = tag7;
	}
	public String getTag8() {
		return tag8;
	}
	public void setTag8(String tag8) {
		this.tag8 = tag8;
	}
	public String getTag9() {
		return tag9;
	}
	public void setTag9(String tag9) {
		this.tag9 = tag9;
	}
	public String getTag30() {
		return tag30;
	}
	public void setTag30(String tag30) {
		this.tag30 = tag30;
	}
	public String getTag31() {
		return tag31;
	}
	public void setTag31(String tag31) {
		this.tag31 = tag31;
	}
	public String getTag37() {
		return tag37;
	}
	public void setTag37(String tag37) {
		this.tag37 = tag37;
	}
	public String getTag32() {
		return tag32;
	}
	public void setTag32(String tag32) {
		this.tag32 = tag32;
	}
	public String getTag49() {
		return tag49;
	}
	public void setTag49(String tag49) {
		this.tag49 = tag49;
	}
	public String getTag51() {
		return tag51;
	}
	public void setTag51(String tag51) {
		this.tag51 = tag51;
	}
	public String getTag38() {
		return tag38;
	}
	public void setTag38(String tag38) {
		this.tag38 = tag38;
	}
	public String getTag39() {
		return tag39;
	}
	public void setTag39(String tag39) {
		this.tag39 = tag39;
	}
	public String getTag40() {
		return tag40;
	}
	public void setTag40(String tag40) {
		this.tag40 = tag40;
	}
	public String getTag43() {
		return tag43;
	}
	public void setTag43(String tag43) {
		this.tag43 = tag43;
	}
	public String getTag50() {
		return tag50;
	}
	public void setTag50(String tag50) {
		this.tag50 = tag50;
	}
	public Integer getZd_so_val() {
		return zd_so_val;
	}
	public void setZd_so_val(Integer zd_so_val) {
		this.zd_so_val = zd_so_val;
	}
	public Integer getZd_so_level() {
		return zd_so_level;
	}
	public void setZd_so_level(Integer zd_so_level) {
		this.zd_so_level = zd_so_level;
	}
	public Integer getAll_so_val() {
		return all_so_val;
	}
	public void setAll_so_val(Integer all_so_val) {
		this.all_so_val = all_so_val;
	}
	public Integer getAll_so_level() {
		return all_so_level;
	}
	public void setAll_so_level(Integer all_so_level) {
		this.all_so_level = all_so_level;
	}
	public Integer getSi_val() {
		return si_val;
	}
	public void setSi_val(Integer si_val) {
		this.si_val = si_val;
	}
	public Integer getSi_level() {
		return si_level;
	}
	public void setSi_level(Integer si_level) {
		this.si_level = si_level;
	}
	public Integer getNetin_val() {
		return netin_val;
	}
	public void setNetin_val(Integer netin_val) {
		this.netin_val = netin_val;
	}
	public Integer getNetin_level() {
		return netin_level;
	}
	public void setNetin_level(Integer netin_level) {
		this.netin_level = netin_level;
	}
	public Integer getPassenger_vol() {
		return passenger_vol;
	}
	public void setPassenger_vol(Integer passenger_vol) {
		this.passenger_vol = passenger_vol;
	}
	public Integer getUsr_nbr_cell() {
		return usr_nbr_cell;
	}
	public void setUsr_nbr_cell(Integer usr_nbr_cell) {
		this.usr_nbr_cell = usr_nbr_cell;
	}
	public Integer getUsr_nbr_hall() {
		return usr_nbr_hall;
	}
	public void setUsr_nbr_hall(Integer usr_nbr_hall) {
		this.usr_nbr_hall = usr_nbr_hall;
	}
	public Integer getUsr_nbr_stock() {
		return usr_nbr_stock;
	}
	public void setUsr_nbr_stock(Integer usr_nbr_stock) {
		this.usr_nbr_stock = usr_nbr_stock;
	}
	public Integer getUsr_nbr_hall_val() {
		return usr_nbr_hall_val;
	}
	public void setUsr_nbr_hall_val(Integer usr_nbr_hall_val) {
		this.usr_nbr_hall_val = usr_nbr_hall_val;
	}
	public Integer getUsr_nbr_hall_level() {
		return usr_nbr_hall_level;
	}
	public void setUsr_nbr_hall_level(Integer usr_nbr_hall_level) {
		this.usr_nbr_hall_level = usr_nbr_hall_level;
	}
	public String getTag20() {
		return tag20;
	}
	public void setTag20(String tag20) {
		this.tag20 = tag20;
	}
	public String getTag21() {
		return tag21;
	}
	public void setTag21(String tag21) {
		this.tag21 = tag21;
	}
	public String getTag22() {
		return tag22;
	}
	public void setTag22(String tag22) {
		this.tag22 = tag22;
	}
	public String getTag23() {
		return tag23;
	}
	public void setTag23(String tag23) {
		this.tag23 = tag23;
	}
	public String getTag25() {
		return tag25;
	}
	public void setTag25(String tag25) {
		this.tag25 = tag25;
	}
	public String getTag44() {
		return tag44;
	}
	public void setTag44(String tag44) {
		this.tag44 = tag44;
	}
	public String getTag35() {
		return tag35;
	}
	public void setTag35(String tag35) {
		this.tag35 = tag35;
	}
	public String getTag36() {
		return tag36;
	}
	public void setTag36(String tag36) {
		this.tag36 = tag36;
	}
	public String getAvg_dwell_time() {
		return avg_dwell_time;
	}
	public void setAvg_dwell_time(String avg_dwell_time) {
		this.avg_dwell_time = avg_dwell_time;
	}
	public String getSingle_sales_ability() {
		return single_sales_ability;
	}
	public void setSingle_sales_ability(String single_sales_ability) {
		this.single_sales_ability = single_sales_ability;
	}
	public String getMarket_matche_brand() {
		return market_matche_brand;
	}
	public void setMarket_matche_brand(String market_matche_brand) {
		this.market_matche_brand = market_matche_brand;
	}
	public String getMarket_matche_price() {
		return market_matche_price;
	}
	public void setMarket_matche_price(String market_matche_price) {
		this.market_matche_price = market_matche_price;
	}
	public String getMarket_matche_sales() {
		return market_matche_sales;
	}
	public void setMarket_matche_sales(String market_matche_sales) {
		this.market_matche_sales = market_matche_sales;
	}
	public String getTag15() {
		return tag15;
	}
	public void setTag15(String tag15) {
		this.tag15 = tag15;
	}
	public String getTag16() {
		return tag16;
	}
	public void setTag16(String tag16) {
		this.tag16 = tag16;
	}
	public String getTag17() {
		return tag17;
	}
	public void setTag17(String tag17) {
		this.tag17 = tag17;
	}
	public String getTag18() {
		return tag18;
	}
	public void setTag18(String tag18) {
		this.tag18 = tag18;
	}
	public String getTag19() {
		return tag19;
	}
	public void setTag19(String tag19) {
		this.tag19 = tag19;
	}
	public String getDm_stock_rate() {
		return dm_stock_rate;
	}
	public void setDm_stock_rate(String dm_stock_rate) {
		this.dm_stock_rate = dm_stock_rate;
	}
	public String getDiff_net_rate() {
		return diff_net_rate;
	}
	public void setDiff_net_rate(String diff_net_rate) {
		this.diff_net_rate = diff_net_rate;
	}
	public String getNet_in_ratio() {
		return net_in_ratio;
	}
	public void setNet_in_ratio(String net_in_ratio) {
		this.net_in_ratio = net_in_ratio;
	}
	public String getUnhealth_ratio_all() {
		return unhealth_ratio_all;
	}
	public void setUnhealth_ratio_all(String unhealth_ratio_all) {
		this.unhealth_ratio_all = unhealth_ratio_all;
	}
	public String getBlack_cust_ratio() {
		return black_cust_ratio;
	}
	public void setBlack_cust_ratio(String black_cust_ratio) {
		this.black_cust_ratio = black_cust_ratio;
	}
	public String getSus_cark_ratio() {
		return sus_cark_ratio;
	}
	public void setSus_cark_ratio(String sus_cark_ratio) {
		this.sus_cark_ratio = sus_cark_ratio;
	}
	public String getOne_three_ratio() {
		return one_three_ratio;
	}
	public void setOne_three_ratio(String one_three_ratio) {
		this.one_three_ratio = one_three_ratio;
	}
	public String getArpu() {
		return arpu;
	}
	public void setArpu(String arpu) {
		this.arpu = arpu;
	}
	public String getDou() {
		return dou;
	}
	public void setDou(String dou) {
		this.dou = dou;
	}
	public String getMou() {
		return mou;
	}
	public void setMou(String mou) {
		this.mou = mou;
	}
	public String getTag26() {
		return tag26;
	}
	public void setTag26(String tag26) {
		this.tag26 = tag26;
	}
	public String getTag27() {
		return tag27;
	}
	public void setTag27(String tag27) {
		this.tag27 = tag27;
	}
	public String getTag28() {
		return tag28;
	}
	public void setTag28(String tag28) {
		this.tag28 = tag28;
	}
	public String getTag29() {
		return tag29;
	}
	public void setTag29(String tag29) {
		this.tag29 = tag29;
	}
	public String getTag10() {
		return tag10;
	}
	public void setTag10(String tag10) {
		this.tag10 = tag10;
	}
	public String getTag11() {
		return tag11;
	}
	public void setTag11(String tag11) {
		this.tag11 = tag11;
	}
	public String getTag12() {
		return tag12;
	}
	public void setTag12(String tag12) {
		this.tag12 = tag12;
	}
	public String getTag24() {
		return tag24;
	}
	public void setTag24(String tag24) {
		this.tag24 = tag24;
	}
	public String getTag13() {
		return tag13;
	}
	public void setTag13(String tag13) {
		this.tag13 = tag13;
	}
	public String getTag14() {
		return tag14;
	}
	public void setTag14(String tag14) {
		this.tag14 = tag14;
	}
	public String getTag34() {
		return tag34;
	}
	public void setTag34(String tag34) {
		this.tag34 = tag34;
	}
	public String getTag41() {
		return tag41;
	}
	public void setTag41(String tag41) {
		this.tag41 = tag41;
	}
	public String getTag42() {
		return tag42;
	}
	public void setTag42(String tag42) {
		this.tag42 = tag42;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	
	
}
