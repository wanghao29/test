package com.asiainfo.cmc.enties.brandmodel;
/**
 * ZD_RESULT_OPER_PRODUCT_LINE_INFO
 * @author Administrator
 *
 */
public class FiveLine {

	private String BRANDNAME;//品牌

	private String SPEC;//型号

	
	private String LINECODE;//五线编码
	
	
	private String LINENAME;//五线名称
	
	private String PORTCODE;//七口编码
	
	private String PORTNAME;//七口名称
	
	private float SALEAMOUNT;//销量
	
	private float INCOME;//收入
	
	private float MAORI;//毛利

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

	public String getLINECODE() {
		return LINECODE;
	}

	public void setLINECODE(String lINECODE) {
		LINECODE = lINECODE;
	}

	public String getLINENAME() {
		return LINENAME;
	}

	public void setLINENAME(String lINENAME) {
		LINENAME = lINENAME;
	}

	public String getPORTCODE() {
		return PORTCODE;
	}

	public void setPORTCODE(String pORTCODE) {
		PORTCODE = pORTCODE;
	}

	public String getPORTNAME() {
		return PORTNAME;
	}

	public void setPORTNAME(String pORTNAME) {
		PORTNAME = pORTNAME;
	}

	public float getSALEAMOUNT() {
		return SALEAMOUNT;
	}

	public void setSALEAMOUNT(float sALEAMOUNT) {
		SALEAMOUNT = sALEAMOUNT;
	}

	public float getINCOME() {
		return INCOME;
	}

	public void setINCOME(float iNCOME) {
		INCOME = iNCOME;
	}

	public float getMAORI() {
		return MAORI;
	}

	public void setMAORI(float mAORI) {
		MAORI = mAORI;
	}

	public FiveLine(String bRANDNAME, String sPEC, String lINECODE, String lINENAME, String pORTCODE, String pORTNAME,
			float sALEAMOUNT, float iNCOME, float mAORI) {
		super();
		BRANDNAME = bRANDNAME;
		SPEC = sPEC;
		LINECODE = lINECODE;
		LINENAME = lINENAME;
		PORTCODE = pORTCODE;
		PORTNAME = pORTNAME;
		SALEAMOUNT = sALEAMOUNT;
		INCOME = iNCOME;
		MAORI = mAORI;
	}

	public FiveLine() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
}
