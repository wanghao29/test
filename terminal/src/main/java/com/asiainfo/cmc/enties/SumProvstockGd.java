package com.asiainfo.cmc.enties;
/**库龄库存 表   SUM_PROVSTOCK_GD**/
public class SumProvstockGd {

	private String cycleDay;//CYCLE_DAY;		日期
	private String provinceId;//PROVINCE_ID;
	private String mobileId;//MOBILE_ID;
	private String purgroupId;//PURGROUP_ID;
	private String stockTs;//STOCK_TS;
	private String prodCategory;//PROD_CATEGORY;
	private String materialId;//MATERIAL_ID;
	private int stockAmount;//STOCK_AMOUNT		库龄库存量  合计
	private int stage1Amount;//STAGE1_AMOUNT		0-30天库存数
	private int stage2Amount;//STAGE2_AMOUNT		30-90
	private int stage3Amount;//STAGE3_AMOUNT		90-180
	private int stage4Amount;//STAGE4_AMOUNT		180-270
	private int stage5Amount;//STAGE5_AMOUNT		270-360
	private int stage6Amount;//STAGE6_AMOUNT		360-
	private Float stockMoney;//STOCK_MONEY		库龄库存金额  合计
	private Float stage1Money;//STAGE1_MONEY	0-30天库存金额
	private Float stage2Money;//STAGE2_MONEY	30-90
	private Float stage3Money;//STAGE3_MONEY	90-180
	private Float stage4Money;//STAGE4_MONEY	180-270
	private Float stage5Money;//STAGE5_MONEY	270-360
	private Float stage6Money;//STAGE6_MONEY	360-
	private Float stockAge;//STOCK_AGE			平均库龄天数
	private String sdUnit;//SD_UNIT
	private String sdMoney;//SD_MONEY
	private String filetime;
	public String getCycleDay() {
		return cycleDay;
	}
	public void setCycleDay(String cycleDay) {
		this.cycleDay = cycleDay;
	}
	public String getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}
	public String getMobileId() {
		return mobileId;
	}
	public void setMobileId(String mobileId) {
		this.mobileId = mobileId;
	}
	public String getPurgroupId() {
		return purgroupId;
	}
	public void setPurgroupId(String purgroupId) {
		this.purgroupId = purgroupId;
	}
	public String getStockTs() {
		return stockTs;
	}
	public void setStockTs(String stockTs) {
		this.stockTs = stockTs;
	}
	public String getProdCategory() {
		return prodCategory;
	}
	public void setProdCategory(String prodCategory) {
		this.prodCategory = prodCategory;
	}
	public String getMaterialId() {
		return materialId;
	}
	public void setMaterialId(String materialId) {
		this.materialId = materialId;
	}
	public int getStockAmount() {
		return stockAmount;
	}
	public void setStockAmount(int stockAmount) {
		this.stockAmount = stockAmount;
	}
	public int getStage1Amount() {
		return stage1Amount;
	}
	public void setStage1Amount(int stage1Amount) {
		this.stage1Amount = stage1Amount;
	}
	public int getStage2Amount() {
		return stage2Amount;
	}
	public void setStage2Amount(int stage2Amount) {
		this.stage2Amount = stage2Amount;
	}
	public int getStage3Amount() {
		return stage3Amount;
	}
	public void setStage3Amount(int stage3Amount) {
		this.stage3Amount = stage3Amount;
	}
	public int getStage4Amount() {
		return stage4Amount;
	}
	public void setStage4Amount(int stage4Amount) {
		this.stage4Amount = stage4Amount;
	}
	public int getStage5Amount() {
		return stage5Amount;
	}
	public void setStage5Amount(int stage5Amount) {
		this.stage5Amount = stage5Amount;
	}
	public int getStage6Amount() {
		return stage6Amount;
	}
	public void setStage6Amount(int stage6Amount) {
		this.stage6Amount = stage6Amount;
	}
	public Float getStockMoney() {
		return stockMoney;
	}
	public void setStockMoney(Float stockMoney) {
		this.stockMoney = stockMoney;
	}
	public Float getStage1Money() {
		return stage1Money;
	}
	public void setStage1Money(Float stage1Money) {
		this.stage1Money = stage1Money;
	}
	public Float getStage2Money() {
		return stage2Money;
	}
	public void setStage2Money(Float stage2Money) {
		this.stage2Money = stage2Money;
	}
	public Float getStage3Money() {
		return stage3Money;
	}
	public void setStage3Money(Float stage3Money) {
		this.stage3Money = stage3Money;
	}
	public Float getStage4Money() {
		return stage4Money;
	}
	public void setStage4Money(Float stage4Money) {
		this.stage4Money = stage4Money;
	}
	public Float getStage5Money() {
		return stage5Money;
	}
	public void setStage5Money(Float stage5Money) {
		this.stage5Money = stage5Money;
	}
	public Float getStage6Money() {
		return stage6Money;
	}
	public void setStage6Money(Float stage6Money) {
		this.stage6Money = stage6Money;
	}
	public Float getStockAge() {
		return stockAge;
	}
	public void setStockAge(Float stockAge) {
		this.stockAge = stockAge;
	}
	public String getSdUnit() {
		return sdUnit;
	}
	public void setSdUnit(String sdUnit) {
		this.sdUnit = sdUnit;
	}
	public String getSdMoney() {
		return sdMoney;
	}
	public void setSdMoney(String sdMoney) {
		this.sdMoney = sdMoney;
	}
	public String getFiletime() {
		return filetime;
	}
	public void setFiletime(String filetime) {
		this.filetime = filetime;
	}
	public SumProvstockGd(String cycleDay, String provinceId, String mobileId, String purgroupId, String stockTs,
			String prodCategory, String materialId, int stockAmount, int stage1Amount, int stage2Amount,
			int stage3Amount, int stage4Amount, int stage5Amount, int stage6Amount, Float stockMoney, Float stage1Money,
			Float stage2Money, Float stage3Money, Float stage4Money, Float stage5Money, Float stage6Money,
			Float stockAge, String sdUnit, String sdMoney, String filetime) {
		super();
		this.cycleDay = cycleDay;
		this.provinceId = provinceId;
		this.mobileId = mobileId;
		this.purgroupId = purgroupId;
		this.stockTs = stockTs;
		this.prodCategory = prodCategory;
		this.materialId = materialId;
		this.stockAmount = stockAmount;
		this.stage1Amount = stage1Amount;
		this.stage2Amount = stage2Amount;
		this.stage3Amount = stage3Amount;
		this.stage4Amount = stage4Amount;
		this.stage5Amount = stage5Amount;
		this.stage6Amount = stage6Amount;
		this.stockMoney = stockMoney;
		this.stage1Money = stage1Money;
		this.stage2Money = stage2Money;
		this.stage3Money = stage3Money;
		this.stage4Money = stage4Money;
		this.stage5Money = stage5Money;
		this.stage6Money = stage6Money;
		this.stockAge = stockAge;
		this.sdUnit = sdUnit;
		this.sdMoney = sdMoney;
		this.filetime = filetime;
	}
	public SumProvstockGd() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
