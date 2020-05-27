package com.asiainfo.cmc.enties.brandmodel;

/**
 * 手机品牌实体类
 * 手机品牌实体类
 * @author Administrator
 *ZD_TERM_BRND_MDL_CTMS
 */
public class BrandEnty {

	private String TAC;//品牌码

	private String term_brnd_nam;//品牌名

	private String term_mdl_nam;//品牌对应的型号

	private String avg_price;  //平均价格
	
	public String getTAC() {
		return TAC;
	}

	public void setTAC(String tAC) {
		TAC = tAC;
	}

	public String getTerm_brnd_nam() {
		return term_brnd_nam;
	}

	public void setTerm_brnd_nam(String term_brnd_nam) {
		this.term_brnd_nam = term_brnd_nam;
	}

	public String getTerm_mdl_nam() {
		return term_mdl_nam;
	}

	public void setTerm_mdl_nam(String term_mdl_nam) {
		this.term_mdl_nam = term_mdl_nam;
	}

	public BrandEnty(String tAC, String term_brnd_nam, String term_mdl_nam) {
		super();
		TAC = tAC;
		this.term_brnd_nam = term_brnd_nam;
		this.term_mdl_nam = term_mdl_nam;
	}

	public String getAvg_price() {
		return avg_price;
	}

	public void setAvg_price(String avg_price) {
		this.avg_price = avg_price;
	}

	public BrandEnty() {
		super();
		// TODO Auto-generated constructor stub
	}








}
