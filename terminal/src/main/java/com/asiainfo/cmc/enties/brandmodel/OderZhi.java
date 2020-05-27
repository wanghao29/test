package com.asiainfo.cmc.enties.brandmodel;
/**
 *秩     取数据
 * 表 ZD_RESULT_OPER_ORDER_AREA_D
 *
 */
public class OderZhi {

	
	private String BRANDNAME;//品牌
		
	private String SPEC;//型号
	
	private String DODATE;//日期
	
	private String AREANAME;//地市
	
	private float LOCALRATIO;//DM本地激活率
	
	private float REMOTERATIO;//DM异地激活率
	
	private float YKRATIO;//疑似套机率

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

	public float getLOCALRATIO() {
		return LOCALRATIO;
	}

	public void setLOCAL_RATIO(float lOCALRATIO) {
		LOCALRATIO = lOCALRATIO;
	}

	public float getREMOTERATIO() {
		return REMOTERATIO;
	}

	public void setREMOTE_RATIO(float rEMOTERATIO) {
		REMOTERATIO = rEMOTERATIO;
	}

	public float getYKRATIO() {
		return YKRATIO;
	}

	public void setYK_RATIO(float yKRATIO) {
		YKRATIO = yKRATIO;
	}

	public OderZhi(String bRANDNAME, String sPEC, String dODATE, String aREANAME, float lOCALRATIO, float rEMOTERATIO,
			float yKRATIO) {
		super();
		BRANDNAME = bRANDNAME;
		SPEC = sPEC;
		DODATE = dODATE;
		AREANAME = aREANAME;
		LOCALRATIO = lOCALRATIO;
		REMOTERATIO = rEMOTERATIO;
		YKRATIO = yKRATIO;
	}

	public OderZhi() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	
	
}
