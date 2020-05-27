package com.asiainfo.cmc.enties;

/**
* @author WANGHAO
* @version 创建时间：2020年4月1日 下午4:23:50
* @ClassName 类名称   碎屏险表  对应表名为：BrokenScreen
* @Description 类描述 经分监控，碎屏险导入功能实体类
*/

public class BrokenScreen {

	private Integer id;       //id 
	
	private String ecssAport; //ECSS 编码
	
	private String product;   // 产品
	
	private String retail;    //零售价
	
	private String basePrice;  //基准价
	
	private String shopPrice;   //采购价
	
	private String pag1;        //暂定
	 
	private String pag2;        //暂定
	
	private String pag3;        //暂定

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEcssAport() {
		return ecssAport;
	}

	public void setEcssAport(String ecssAport) {
		this.ecssAport = ecssAport;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getRetail() {
		return retail;
	}

	public void setRetail(String retail) {
		this.retail = retail;
	}

	public String getBasePrice() {
		return basePrice;
	}

	public void setBasePrice(String basePrice) {
		this.basePrice = basePrice;
	}

	public String getShopPrice() {
		return shopPrice;
	}

	public void setShopPrice(String shopPrice) {
		this.shopPrice = shopPrice;
	}

	public String getPag1() {
		return pag1;
	}

	public void setPag1(String pag1) {
		this.pag1 = pag1;
	}

	public String getPag2() {
		return pag2;
	}

	public void setPag2(String pag2) {
		this.pag2 = pag2;
	}

	public String getPag3() {
		return pag3;
	}

	public void setPag3(String pag3) {
		this.pag3 = pag3;
	}

	public BrokenScreen(Integer id, String ecssAport, String product, String retail, String basePrice, String shopPrice,
			String pag1, String pag2, String pag3) {
		super();
		this.id = id;
		this.ecssAport = ecssAport;
		this.product = product;
		this.retail = retail;
		this.basePrice = basePrice;
		this.shopPrice = shopPrice;
		this.pag1 = pag1;
		this.pag2 = pag2;
		this.pag3 = pag3;
	}

	public BrokenScreen() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "BrokenScreen [id=" + id + ", ecssAport=" + ecssAport + ", product=" + product + ", retail=" + retail
				+ ", basePrice=" + basePrice + ", shopPrice=" + shopPrice + ", pag1=" + pag1 + ", pag2=" + pag2
				+ ", pag3=" + pag3 + "]";
	}
	
	
	
	
	
	
	
	
	
}
