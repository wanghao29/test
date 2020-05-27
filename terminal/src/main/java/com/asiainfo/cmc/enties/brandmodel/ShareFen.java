package com.asiainfo.cmc.enties.brandmodel;
/**
 * 份额表
 * 表   ZD_RESULT_OPER_SHARE_AREA_D
 *
 */
public class ShareFen {

private String BRANDNAME;//	品牌
	
private String  SPEC;   //	机型

private String  DODATE; //	

private String  AREANAME;//	地市

private float TOTALSHARE;//

private float PROSHARE;  //

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

public float getTOTALSHARE() {
	return TOTALSHARE;
}

public void setTOTALSHARE(float tOTALSHARE) {
	TOTALSHARE = tOTALSHARE;
}

public float getPROSHARE() {
	return PROSHARE;
}

public void setPROSHARE(float pROSHARE) {
	PROSHARE = pROSHARE;
}

public ShareFen(String bRANDNAME, String sPEC, String dODATE, String aREANAME, float tOTALSHARE, float pROSHARE) {
	super();
	BRANDNAME = bRANDNAME;
	SPEC = sPEC;
	DODATE = dODATE;
	AREANAME = aREANAME;
	TOTALSHARE = tOTALSHARE;
	PROSHARE = pROSHARE;
}

public ShareFen() {
	super();
	// TODO Auto-generated constructor stub
}
	
	
	
	
}
