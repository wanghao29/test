package com.asiainfo.cmc.qudao.enties;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 渠道厅店常态化宽表
 */
public class ZdResultHallNormalM implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String statMonth;     // 月份
	private String  cityCd;       // 地市
	private String hallBossCd;    // BOSS系统编码
	private String hallName;      // 营业厅名称
	private String cntyCd;        // 县
	private String townCd;        // 镇
	private BigDecimal longitude; // 经度
	private BigDecimal latitude;      // 纬度
	private String linkman;       // 联系人姓名
	private String tel;           // 联系人电话
	
	private Integer cntstock;     // 存量用户数
	private Integer cntdm;        // DM窜货量
	private Integer kll;          // 客流量
	private Integer cntmaybechg;  // 预计换机用户数
	private String malecnt;       // 男性数量
	private String femalecnt;     // 女性数量
	private BigDecimal arpu;
	private BigDecimal mou;
	private BigDecimal dou;
	
	private String agecnt0;       // 年龄未知
	private String agecnt1;       // 年龄18以下
	private String agecnt2;       // 年龄18-21
	private String agecnt3;       // 年龄21-25
	private String agecnt4;       // 年龄25-30
	private String agecnt5;       // 年龄30-40
	private String agecnt6;       // 年龄40-50
	private String agecnt7;       // 年龄50+
	
	private String jobswcnt;      // 商务人士
	private String jobblcnt;      // 白领人士
	private String jobxycnt;      // 校园客户
	private String jobnmcnt;      // 农民客户（个体户）
	private String jobwlcnt;      // 外来人口
	private String jobunknowcnt;  // 职业未知
	
	private String tbapplecnt;    // 苹果
	private String tbhwcnt;       // 华为
	private String tboppocnt;     // OPPO
	private String tbvivocnt;     // VIVO
	private String tbjlcnt;       // 金立
	private String tbsxcnt;       // 三星
	private String tbkpcnt;       // 酷派
	private String tbmicnt;       // 小米
	private String tbztecnt;      // 中兴
	private String tbmz;          // 魅族
	private String tbyd;          // 中国移动
	private String tbother;       // 其它品牌
	
	private String pricecnt0;     // 价位未知
	private String pricecnt1;     // 价位0-99
	private String pricecnt2;     // 价位100-299
	private String pricecnt3;     // 价位300-399
	private String pricecnt4;     // 价位400-499
	private String pricecnt5;     // 价位500-599
	private String pricecnt6;     // 价位600-699
	private String pricecnt7;     // 价位700-799
	private String pricecnt8;     // 价位800-899
	private String pricecnt9;     // 价位900-999
	private String pricecnt10;    // 价位1000-1099
	private String pricecnt11;    // 价位1100-1499
	private String pricecnt12;    // 价位1500-1699
	private String pricecnt13;    // 价位1700-1999
	private String pricecnt14;    // 价位2000-2999
	private String pricecnt15;    // 价位3000-3999
	private String pricecnt16;    // 价位4000-4999
	private String pricecnt17;    // 价位5000+
	
	private String gprscnt0;      // 流量<0
	private String gprscnt1;      // 流量0M
	private String gprscnt2;      // 流量0-10M
	private String gprscnt3;      // 流量10-50M
	private String gprscnt4;      // 流量50-100M
	private String gprscnt5;      // 流量100-200M
	private String gprscnt6;      // 流量200-300M
	private String gprscnt7;      // 流量300-500M
	private String gprscnt8;      // 流量500-1G
	private String gprscnt9;      // 流量1-3G
	private String gprscnt10;     // 流量3G+
	
	private String usefeecnt0;    // <0
	private String usefeecnt1;    // 0元
	private String usefeecnt2;    // 0-50元
	private String usefeecnt3;    // 50-80元
	private String usefeecnt4;    // 80-120元
	private String usefeecnt5;    // 120+元
	
	private String yycnt0;        // <0分种
	private String yycnt1;        // 0分种
	private String yycnt2;        // 0-60分种
	private String yycnt3;        // 60-120分种
	private String yycnt4;        // 120-240分种
	private String yycnt5;        // 240-360分种
	private String yycnt6;        // 360-600分种
	private String yycnt7;        // 600+分种
	
	private String tcfeecnt0;     // 主套餐未知
	private String tcfeecnt1;     // 主套餐<18
	private String tcfeecnt2;     // 主套餐18-28
	private String tcfeecnt3;     // 主套餐28-38
	private String tcfeecnt4;     // 主套餐38-48
	private String tcfeecnt5;     // 主套餐48-58
	private String tcfeecnt6;     // 主套餐58-88
	private String tcfeecnt7;     // 主套餐88-138
	private String tcfeecnt8;     // 主套餐138-158
	private String tcfeecnt9;     // 主套餐158-188
	private String tcfeecnt10;    // 主套餐188-238
	private String tcfeecnt11;    // 主套餐238-268
	private String tcfeecnt12;    // 主套餐268-288
	private String tcfeecnt13;    // 主套餐288-338
	private String tcfeecnt14;    // 主套餐338-588
	private String tcfeecnt15;    // 主套餐588+
	private String month;
	
	
	public String getStatMonth() {
		return statMonth;
	}
	public void setStatMonth(String statMonth) {
		this.statMonth = statMonth;
	}
	public String getHallBossCd() {
		return hallBossCd;
	}
	public void setHallBossCd(String hallBossCd) {
		this.hallBossCd = hallBossCd;
	}
	public String getHallName() {
		return hallName;
	}
	public void setHallName(String hallName) {
		this.hallName = hallName;
	}
	public String getCityCd() {
		return cityCd;
	}
	public void setCityCd(String cityCd) {
		this.cityCd = cityCd;
	}
	public String getCntyCd() {
		return cntyCd;
	}
	public void setCntyCd(String cntyCd) {
		this.cntyCd = cntyCd;
	}
	public String getTownCd() {
		return townCd;
	}
	public void setTownCd(String townCd) {
		this.townCd = townCd;
	}
	public BigDecimal getLongitude() {
		return longitude;
	}
	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}
	public BigDecimal getLatitude() {
		return latitude;
	}
	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Integer getCntstock() {
		return cntstock;
	}
	public void setCntstock(Integer cntstock) {
		this.cntstock = cntstock;
	}
	public Integer getCntdm() {
		return cntdm;
	}
	public void setCntdm(Integer cntdm) {
		this.cntdm = cntdm;
	}
	public Integer getKll() {
		return kll;
	}
	public void setKll(Integer kll) {
		this.kll = kll;
	}
	public Integer getCntmaybechg() {
		return cntmaybechg;
	}
	public void setCntmaybechg(Integer cntmaybechg) {
		this.cntmaybechg = cntmaybechg;
	}
	public BigDecimal getArpu() {
		return arpu;
	}
	public void setArpu(BigDecimal arpu) {
		this.arpu = arpu;
	}
	public BigDecimal getMou() {
		return mou;
	}
	public void setMou(BigDecimal mou) {
		this.mou = mou;
	}
	public BigDecimal getDou() {
		return dou;
	}
	public void setDou(BigDecimal dou) {
		this.dou = dou;
	}
	public String getMalecnt() {
		return malecnt;
	}
	public void setMalecnt(String malecnt) {
		this.malecnt = malecnt;
	}
	public String getFemalecnt() {
		return femalecnt;
	}
	public void setFemalecnt(String femalecnt) {
		this.femalecnt = femalecnt;
	}
	public String getAgecnt0() {
		return agecnt0;
	}
	public void setAgecnt0(String agecnt0) {
		this.agecnt0 = agecnt0;
	}
	public String getAgecnt1() {
		return agecnt1;
	}
	public void setAgecnt1(String agecnt1) {
		this.agecnt1 = agecnt1;
	}
	public String getAgecnt2() {
		return agecnt2;
	}
	public void setAgecnt2(String agecnt2) {
		this.agecnt2 = agecnt2;
	}
	public String getAgecnt3() {
		return agecnt3;
	}
	public void setAgecnt3(String agecnt3) {
		this.agecnt3 = agecnt3;
	}
	public String getAgecnt4() {
		return agecnt4;
	}
	public void setAgecnt4(String agecnt4) {
		this.agecnt4 = agecnt4;
	}
	public String getAgecnt5() {
		return agecnt5;
	}
	public void setAgecnt5(String agecnt5) {
		this.agecnt5 = agecnt5;
	}
	public String getAgecnt6() {
		return agecnt6;
	}
	public void setAgecnt6(String agecnt6) {
		this.agecnt6 = agecnt6;
	}
	public String getAgecnt7() {
		return agecnt7;
	}
	public void setAgecnt7(String agecnt7) {
		this.agecnt7 = agecnt7;
	}
	public String getJobswcnt() {
		return jobswcnt;
	}
	public void setJobswcnt(String jobswcnt) {
		this.jobswcnt = jobswcnt;
	}
	public String getJobblcnt() {
		return jobblcnt;
	}
	public void setJobblcnt(String jobblcnt) {
		this.jobblcnt = jobblcnt;
	}
	public String getJobxycnt() {
		return jobxycnt;
	}
	public void setJobxycnt(String jobxycnt) {
		this.jobxycnt = jobxycnt;
	}
	public String getJobnmcnt() {
		return jobnmcnt;
	}
	public void setJobnmcnt(String jobnmcnt) {
		this.jobnmcnt = jobnmcnt;
	}
	public String getJobwlcnt() {
		return jobwlcnt;
	}
	public void setJobwlcnt(String jobwlcnt) {
		this.jobwlcnt = jobwlcnt;
	}
	public String getJobunknowcnt() {
		return jobunknowcnt;
	}
	public void setJobunknowcnt(String jobunknowcnt) {
		this.jobunknowcnt = jobunknowcnt;
	}
	public String getTbapplecnt() {
		return tbapplecnt;
	}
	public void setTbapplecnt(String tbapplecnt) {
		this.tbapplecnt = tbapplecnt;
	}
	public String getTbhwcnt() {
		return tbhwcnt;
	}
	public void setTbhwcnt(String tbhwcnt) {
		this.tbhwcnt = tbhwcnt;
	}
	public String getTboppocnt() {
		return tboppocnt;
	}
	public void setTboppocnt(String tboppocnt) {
		this.tboppocnt = tboppocnt;
	}
	public String getTbvivocnt() {
		return tbvivocnt;
	}
	public void setTbvivocnt(String tbvivocnt) {
		this.tbvivocnt = tbvivocnt;
	}
	public String getTbjlcnt() {
		return tbjlcnt;
	}
	public void setTbjlcnt(String tbjlcnt) {
		this.tbjlcnt = tbjlcnt;
	}
	public String getTbsxcnt() {
		return tbsxcnt;
	}
	public void setTbsxcnt(String tbsxcnt) {
		this.tbsxcnt = tbsxcnt;
	}
	public String getTbkpcnt() {
		return tbkpcnt;
	}
	public void setTbkpcnt(String tbkpcnt) {
		this.tbkpcnt = tbkpcnt;
	}
	public String getTbmicnt() {
		return tbmicnt;
	}
	public void setTbmicnt(String tbmicnt) {
		this.tbmicnt = tbmicnt;
	}
	public String getTbztecnt() {
		return tbztecnt;
	}
	public void setTbztecnt(String tbztecnt) {
		this.tbztecnt = tbztecnt;
	}
	public String getTbmz() {
		return tbmz;
	}
	public void setTbmz(String tbmz) {
		this.tbmz = tbmz;
	}
	public String getTbyd() {
		return tbyd;
	}
	public void setTbyd(String tbyd) {
		this.tbyd = tbyd;
	}
	public String getTbother() {
		return tbother;
	}
	public void setTbother(String tbother) {
		this.tbother = tbother;
	}
	public String getPricecnt0() {
		return pricecnt0;
	}
	public void setPricecnt0(String pricecnt0) {
		this.pricecnt0 = pricecnt0;
	}
	public String getPricecnt1() {
		return pricecnt1;
	}
	public void setPricecnt1(String pricecnt1) {
		this.pricecnt1 = pricecnt1;
	}
	public String getPricecnt2() {
		return pricecnt2;
	}
	public void setPricecnt2(String pricecnt2) {
		this.pricecnt2 = pricecnt2;
	}
	public String getPricecnt3() {
		return pricecnt3;
	}
	public void setPricecnt3(String pricecnt3) {
		this.pricecnt3 = pricecnt3;
	}
	public String getPricecnt4() {
		return pricecnt4;
	}
	public void setPricecnt4(String pricecnt4) {
		this.pricecnt4 = pricecnt4;
	}
	public String getPricecnt5() {
		return pricecnt5;
	}
	public void setPricecnt5(String pricecnt5) {
		this.pricecnt5 = pricecnt5;
	}
	public String getPricecnt6() {
		return pricecnt6;
	}
	public void setPricecnt6(String pricecnt6) {
		this.pricecnt6 = pricecnt6;
	}
	public String getPricecnt7() {
		return pricecnt7;
	}
	public void setPricecnt7(String pricecnt7) {
		this.pricecnt7 = pricecnt7;
	}
	public String getPricecnt8() {
		return pricecnt8;
	}
	public void setPricecnt8(String pricecnt8) {
		this.pricecnt8 = pricecnt8;
	}
	public String getPricecnt9() {
		return pricecnt9;
	}
	public void setPricecnt9(String pricecnt9) {
		this.pricecnt9 = pricecnt9;
	}
	public String getPricecnt10() {
		return pricecnt10;
	}
	public void setPricecnt10(String pricecnt10) {
		this.pricecnt10 = pricecnt10;
	}
	public String getPricecnt11() {
		return pricecnt11;
	}
	public void setPricecnt11(String pricecnt11) {
		this.pricecnt11 = pricecnt11;
	}
	public String getPricecnt12() {
		return pricecnt12;
	}
	public void setPricecnt12(String pricecnt12) {
		this.pricecnt12 = pricecnt12;
	}
	public String getPricecnt13() {
		return pricecnt13;
	}
	public void setPricecnt13(String pricecnt13) {
		this.pricecnt13 = pricecnt13;
	}
	public String getPricecnt14() {
		return pricecnt14;
	}
	public void setPricecnt14(String pricecnt14) {
		this.pricecnt14 = pricecnt14;
	}
	public String getPricecnt15() {
		return pricecnt15;
	}
	public void setPricecnt15(String pricecnt15) {
		this.pricecnt15 = pricecnt15;
	}
	public String getPricecnt16() {
		return pricecnt16;
	}
	public void setPricecnt16(String pricecnt16) {
		this.pricecnt16 = pricecnt16;
	}
	public String getPricecnt17() {
		return pricecnt17;
	}
	public void setPricecnt17(String pricecnt17) {
		this.pricecnt17 = pricecnt17;
	}
	public String getGprscnt0() {
		return gprscnt0;
	}
	public void setGprscnt0(String gprscnt0) {
		this.gprscnt0 = gprscnt0;
	}
	public String getGprscnt1() {
		return gprscnt1;
	}
	public void setGprscnt1(String gprscnt1) {
		this.gprscnt1 = gprscnt1;
	}
	public String getGprscnt2() {
		return gprscnt2;
	}
	public void setGprscnt2(String gprscnt2) {
		this.gprscnt2 = gprscnt2;
	}
	public String getGprscnt3() {
		return gprscnt3;
	}
	public void setGprscnt3(String gprscnt3) {
		this.gprscnt3 = gprscnt3;
	}
	public String getGprscnt4() {
		return gprscnt4;
	}
	public void setGprscnt4(String gprscnt4) {
		this.gprscnt4 = gprscnt4;
	}
	public String getGprscnt5() {
		return gprscnt5;
	}
	public void setGprscnt5(String gprscnt5) {
		this.gprscnt5 = gprscnt5;
	}
	public String getGprscnt6() {
		return gprscnt6;
	}
	public void setGprscnt6(String gprscnt6) {
		this.gprscnt6 = gprscnt6;
	}
	public String getGprscnt7() {
		return gprscnt7;
	}
	public void setGprscnt7(String gprscnt7) {
		this.gprscnt7 = gprscnt7;
	}
	public String getGprscnt8() {
		return gprscnt8;
	}
	public void setGprscnt8(String gprscnt8) {
		this.gprscnt8 = gprscnt8;
	}
	public String getGprscnt9() {
		return gprscnt9;
	}
	public void setGprscnt9(String gprscnt9) {
		this.gprscnt9 = gprscnt9;
	}
	public String getGprscnt10() {
		return gprscnt10;
	}
	public void setGprscnt10(String gprscnt10) {
		this.gprscnt10 = gprscnt10;
	}
	public String getUsefeecnt0() {
		return usefeecnt0;
	}
	public void setUsefeecnt0(String usefeecnt0) {
		this.usefeecnt0 = usefeecnt0;
	}
	public String getUsefeecnt1() {
		return usefeecnt1;
	}
	public void setUsefeecnt1(String usefeecnt1) {
		this.usefeecnt1 = usefeecnt1;
	}
	public String getUsefeecnt2() {
		return usefeecnt2;
	}
	public void setUsefeecnt2(String usefeecnt2) {
		this.usefeecnt2 = usefeecnt2;
	}
	public String getUsefeecnt3() {
		return usefeecnt3;
	}
	public void setUsefeecnt3(String usefeecnt3) {
		this.usefeecnt3 = usefeecnt3;
	}
	public String getUsefeecnt4() {
		return usefeecnt4;
	}
	public void setUsefeecnt4(String usefeecnt4) {
		this.usefeecnt4 = usefeecnt4;
	}
	public String getUsefeecnt5() {
		return usefeecnt5;
	}
	public void setUsefeecnt5(String usefeecnt5) {
		this.usefeecnt5 = usefeecnt5;
	}
	public String getYycnt0() {
		return yycnt0;
	}
	public void setYycnt0(String yycnt0) {
		this.yycnt0 = yycnt0;
	}
	public String getYycnt1() {
		return yycnt1;
	}
	public void setYycnt1(String yycnt1) {
		this.yycnt1 = yycnt1;
	}
	public String getYycnt2() {
		return yycnt2;
	}
	public void setYycnt2(String yycnt2) {
		this.yycnt2 = yycnt2;
	}
	public String getYycnt3() {
		return yycnt3;
	}
	public void setYycnt3(String yycnt3) {
		this.yycnt3 = yycnt3;
	}
	public String getYycnt4() {
		return yycnt4;
	}
	public void setYycnt4(String yycnt4) {
		this.yycnt4 = yycnt4;
	}
	public String getYycnt5() {
		return yycnt5;
	}
	public void setYycnt5(String yycnt5) {
		this.yycnt5 = yycnt5;
	}
	public String getYycnt6() {
		return yycnt6;
	}
	public void setYycnt6(String yycnt6) {
		this.yycnt6 = yycnt6;
	}
	public String getYycnt7() {
		return yycnt7;
	}
	public void setYycnt7(String yycnt7) {
		this.yycnt7 = yycnt7;
	}
	public String getTcfeecnt0() {
		return tcfeecnt0;
	}
	public void setTcfeecnt0(String tcfeecnt0) {
		this.tcfeecnt0 = tcfeecnt0;
	}
	public String getTcfeecnt1() {
		return tcfeecnt1;
	}
	public void setTcfeecnt1(String tcfeecnt1) {
		this.tcfeecnt1 = tcfeecnt1;
	}
	public String getTcfeecnt2() {
		return tcfeecnt2;
	}
	public void setTcfeecnt2(String tcfeecnt2) {
		this.tcfeecnt2 = tcfeecnt2;
	}
	public String getTcfeecnt3() {
		return tcfeecnt3;
	}
	public void setTcfeecnt3(String tcfeecnt3) {
		this.tcfeecnt3 = tcfeecnt3;
	}
	public String getTcfeecnt4() {
		return tcfeecnt4;
	}
	public void setTcfeecnt4(String tcfeecnt4) {
		this.tcfeecnt4 = tcfeecnt4;
	}
	public String getTcfeecnt5() {
		return tcfeecnt5;
	}
	public void setTcfeecnt5(String tcfeecnt5) {
		this.tcfeecnt5 = tcfeecnt5;
	}
	public String getTcfeecnt6() {
		return tcfeecnt6;
	}
	public void setTcfeecnt6(String tcfeecnt6) {
		this.tcfeecnt6 = tcfeecnt6;
	}
	public String getTcfeecnt7() {
		return tcfeecnt7;
	}
	public void setTcfeecnt7(String tcfeecnt7) {
		this.tcfeecnt7 = tcfeecnt7;
	}
	public String getTcfeecnt8() {
		return tcfeecnt8;
	}
	public void setTcfeecnt8(String tcfeecnt8) {
		this.tcfeecnt8 = tcfeecnt8;
	}
	public String getTcfeecnt9() {
		return tcfeecnt9;
	}
	public void setTcfeecnt9(String tcfeecnt9) {
		this.tcfeecnt9 = tcfeecnt9;
	}
	public String getTcfeecnt10() {
		return tcfeecnt10;
	}
	public void setTcfeecnt10(String tcfeecnt10) {
		this.tcfeecnt10 = tcfeecnt10;
	}
	public String getTcfeecnt11() {
		return tcfeecnt11;
	}
	public void setTcfeecnt11(String tcfeecnt11) {
		this.tcfeecnt11 = tcfeecnt11;
	}
	public String getTcfeecnt12() {
		return tcfeecnt12;
	}
	public void setTcfeecnt12(String tcfeecnt12) {
		this.tcfeecnt12 = tcfeecnt12;
	}
	public String getTcfeecnt13() {
		return tcfeecnt13;
	}
	public void setTcfeecnt13(String tcfeecnt13) {
		this.tcfeecnt13 = tcfeecnt13;
	}
	public String getTcfeecnt14() {
		return tcfeecnt14;
	}
	public void setTcfeecnt14(String tcfeecnt14) {
		this.tcfeecnt14 = tcfeecnt14;
	}
	public String getTcfeecnt15() {
		return tcfeecnt15;
	}
	public void setTcfeecnt15(String tcfeecnt15) {
		this.tcfeecnt15 = tcfeecnt15;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
