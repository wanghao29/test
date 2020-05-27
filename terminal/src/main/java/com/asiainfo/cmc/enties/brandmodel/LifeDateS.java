package com.asiainfo.cmc.enties.brandmodel;
/**
 * 数据库表ZD_RESULT_OPER_PRODUCT_CYCLE_INFO
 * 
 * @author Administrator
 *
 */
public class LifeDateS {

private String BRANDNAME; //品牌名

private String SPEC;      //品牌型号

private String CYCLE;     //所属生命周期

private Integer DURATION; //持续时长
	
private  String SALEAMOUNT;//销量

private  String INCOME;    //收入

private String MAORI;      //毛利

private  String OVERAMOUNT;//覆盖客户

private  String SHARE;       //份额

private String TURNOVERTIME;//库存周转

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

public String getCYCLE() {
	return CYCLE;
}

public void setCYCLE(String cYCLE) {
	CYCLE = cYCLE;
}

public Integer getDURATION() {
	return DURATION;
}

public void setDURATION(Integer dURATION) {
	DURATION = dURATION;
}

public String getSALEAMOUNT() {
	return SALEAMOUNT;
}

public void setSALEAMOUNT(String sALEAMOUNT) {
	SALEAMOUNT = sALEAMOUNT;
}

public String getINCOME() {
	return INCOME;
}

public void setINCOME(String iNCOME) {
	INCOME = iNCOME;
}

public String getMAORI() {
	return MAORI;
}

public void setMAORI(String mAORI) {
	MAORI = mAORI;
}

public String getOVERAMOUNT() {
	return OVERAMOUNT;
}

public void setOVERAMOUNT(String oVERAMOUNT) {
	OVERAMOUNT = oVERAMOUNT;
}

public String getSHARE() {
	return SHARE;
}

public void setSHARE(String sHARE) {
	SHARE = sHARE;
}

public String getTURNOVERTIME() {
	return TURNOVERTIME;
}

public void setTURNOVERTIME(String tURNOVERTIME) {
	TURNOVERTIME = tURNOVERTIME;
}

public LifeDateS(String bRANDNAME, String sPEC, String cYCLE, Integer dURATION, String sALEAMOUNT, String iNCOME,
		String mAORI, String oVERAMOUNT, String sHARE, String tURNOVERTIME) {
	super();
	BRANDNAME = bRANDNAME;
	SPEC = sPEC;
	CYCLE = cYCLE;
	DURATION = dURATION;
	SALEAMOUNT = sALEAMOUNT;
	INCOME = iNCOME;
	MAORI = mAORI;
	OVERAMOUNT = oVERAMOUNT;
	SHARE = sHARE;
	TURNOVERTIME = tURNOVERTIME;
}

public LifeDateS() {
	super();
	// TODO Auto-generated constructor stub
}





	
}
