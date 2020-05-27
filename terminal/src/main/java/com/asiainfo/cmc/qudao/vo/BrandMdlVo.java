package com.asiainfo.cmc.qudao.vo;

/**
 *  品牌、型号关系表
 */
public class BrandMdlVo {

	private String tac;
    private String brand;      // 品牌
    private String mdl;        // 型号
    
    //select2
    private String id;
    private String text;
    
	public String getTac() {
		return tac;
	}
	public void setTac(String tac) {
		this.tac = tac;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getMdl() {
		return mdl;
	}
	public void setMdl(String mdl) {
		this.mdl = mdl;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
    
}
