package com.asiainfo.cmc.enties.brandmodel;

/**
 * 全生命周期监控实体类
 * @author Administrator
 *表名:ZD_RESULT_OPER_LSLJ_AREA_D
 */

public class AbsoluteRange {

	private String BRANDNAME; // 品牌
	
	private String SPEC;      //型号
	
	private String DODATE;    //日期
	
	private String AREANAME;  //地市
	
	private String amount;    //量
	
	private float AMOUNTPRICE;//收
	
	private float SALECOSTPRICE;//利 salecostprice
	
	private float SALEPRICE;   //价saleprice

	public String getBRANDNAME() {
		return BRANDNAME;
	}

	public void setBRANDNAME(String bRANDNAME) {
		BRANDNAME = bRANDNAME;
	}

	public String getSPEC() {
		return SPEC;
	}

	public void setSPEC(String sPEC) {
		SPEC = sPEC;
	}

	public String getDODATE() {
		return DODATE;
	}

	public void setDODATE(String dODATE) {
		DODATE = dODATE;
	}

	public String getAREANAME() {
		return AREANAME;
	}

	public void setAREANAME(String aREANAME) {
		AREANAME = aREANAME;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String aMOUNT) {
		amount = aMOUNT;
	}

	public float getAMOUNTPRICE() {
		return AMOUNTPRICE;
	}

	public void setAMOUNTPRICE(float aMOUNTPRICE) {
		AMOUNTPRICE = aMOUNTPRICE;
	}

	public float getSALECOSTPRICE() {
		return SALECOSTPRICE;
	}

	public void setSALECOSTPRICE(float sALECOSTPRICE) {
		SALECOSTPRICE = sALECOSTPRICE;
	}

	public float getSALEPRICE() {
		return SALEPRICE;
	}

	public void setSALEPRICE(float sALEPRICE) {
		SALEPRICE = sALEPRICE;
	}

	public AbsoluteRange(String bRANDNAME, String sPEC, String dODATE, String aREANAME, String aMOUNT,
			float aMOUNTPRICE, float sALECOSTPRICE, float sALEPRICE) {
		super();
		BRANDNAME = bRANDNAME;
		SPEC = sPEC;
		DODATE = dODATE;
		AREANAME = aREANAME;
		amount = aMOUNT;
		AMOUNTPRICE = aMOUNTPRICE;
		SALECOSTPRICE = sALECOSTPRICE;
		SALEPRICE = sALEPRICE;
	}

	public AbsoluteRange() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
