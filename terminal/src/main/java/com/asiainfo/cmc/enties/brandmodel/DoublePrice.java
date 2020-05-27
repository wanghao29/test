package com.asiainfo.cmc.enties.brandmodel;


/*
 * ZD_RESULT_OPER_OPEN_PRICE_FINAL_D
 */
public class DoublePrice {

private String BRANDNAME;//品牌

private String SPEC;     //型号

private String DODATE;   //日期

private String OPENPRICE; //价格

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

public String getOPENPRICE() {
	return OPENPRICE;
}

public void setOPENPRICE(String oPENPRICE) {
	OPENPRICE = oPENPRICE;
}

public DoublePrice(String bRANDNAME, String sPEC, String dODATE, String oPENPRICE) {
	super();
	BRANDNAME = bRANDNAME;
	SPEC = sPEC;
	DODATE = dODATE;
	OPENPRICE = oPENPRICE;
}

public DoublePrice() {
	super();
	// TODO Auto-generated constructor stub
}
	
	
	
	
	
	
	
	
}
