package com.asiainfo.cmc.qudao.enties;

import java.io.Serializable;

/**
 * 基站渠道月表
 */
public class ZdResultCellQudaoM implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String statMonth;     // pk 月份 YYYYMM
	private String termBrnd;      // pk 品牌
	private String termMdl;       // pk 型号
	private String localCd;       // pk
	private String cellCd;        // pk
	private String a4gPlusInd;    // 是否4G+
	private String cityNam;       // 地市
	private String neNam;         // 基站名称
	private String cellLongitude; // 基站经度
	private String cellLatitude;  // 基站纬度
	private String cellLvl;       // 基站级别
	private String cntstock;      // 存量用户数
	private String cntnew;        // 新入网量
	private String cntmaybechg;   // 预计换机客户数
	private String cntyd;         // 移动购机入网数
	private String cntself;       // 自带机入网数
	private String cntin;         // 换入用户数
	private String cntout;        // 换出用户数
	private String malecnt;       // 男性数量
	private String femalecnt;     // 女性数量
	private String agecnt0;       // 年龄未知
	private String agecnt1;       // 年龄<18
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
	private String arpu; 
	private String mou; 
	private String dou; 
	private String prtclPrc;
    private String month;
    
	public String getStatMonth() {
		return statMonth;
	}
	public void setStatMonth(String statMonth) {
		this.statMonth = statMonth;
	}
	public String getTermBrnd() {
		return termBrnd;
	}
	public void setTermBrnd(String termBrnd) {
		this.termBrnd = termBrnd;
	}
	public String getTermMdl() {
		return termMdl;
	}
	public void setTermMdl(String termMdl) {
		this.termMdl = termMdl;
	}
	public String getLocalCd() {
		return localCd;
	}
	public void setLocalCd(String localCd) {
		this.localCd = localCd;
	}
	public String getCellCd() {
		return cellCd;
	}
	public void setCellCd(String cellCd) {
		this.cellCd = cellCd;
	}
	public String getA4gPlusInd() {
		return a4gPlusInd;
	}
	public void setA4gPlusInd(String a4gPlusInd) {
		this.a4gPlusInd = a4gPlusInd;
	}
	public String getCityNam() {
		return cityNam;
	}
	public void setCityNam(String cityNam) {
		this.cityNam = cityNam;
	}
	public String getNeNam() {
		return neNam;
	}
	public void setNeNam(String neNam) {
		this.neNam = neNam;
	}
	public String getCellLongitude() {
		return cellLongitude;
	}
	public void setCellLongitude(String cellLongitude) {
		this.cellLongitude = cellLongitude;
	}
	public String getCellLatitude() {
		return cellLatitude;
	}
	public void setCellLatitude(String cellLatitude) {
		this.cellLatitude = cellLatitude;
	}
	public String getCellLvl() {
		return cellLvl;
	}
	public void setCellLvl(String cellLvl) {
		this.cellLvl = cellLvl;
	}
	public String getCntstock() {
		return cntstock;
	}
	public void setCntstock(String cntstock) {
		this.cntstock = cntstock;
	}
	public String getCntnew() {
		return cntnew;
	}
	public void setCntnew(String cntnew) {
		this.cntnew = cntnew;
	}
	public String getCntmaybechg() {
		return cntmaybechg;
	}
	public void setCntmaybechg(String cntmaybechg) {
		this.cntmaybechg = cntmaybechg;
	}
	public String getCntyd() {
		return cntyd;
	}
	public void setCntyd(String cntyd) {
		this.cntyd = cntyd;
	}
	public String getCntself() {
		return cntself;
	}
	public void setCntself(String cntself) {
		this.cntself = cntself;
	}
	public String getCntin() {
		return cntin;
	}
	public void setCntin(String cntin) {
		this.cntin = cntin;
	}
	public String getCntout() {
		return cntout;
	}
	public void setCntout(String cntout) {
		this.cntout = cntout;
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
	public String getArpu() {
		return arpu;
	}
	public void setArpu(String arpu) {
		this.arpu = arpu;
	}
	public String getMou() {
		return mou;
	}
	public void setMou(String mou) {
		this.mou = mou;
	}
	public String getDou() {
		return dou;
	}
	public void setDou(String dou) {
		this.dou = dou;
	}
	public String getPrtclPrc() {
		return prtclPrc;
	}
	public void setPrtclPrc(String prtclPrc) {
		this.prtclPrc = prtclPrc;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}

}
