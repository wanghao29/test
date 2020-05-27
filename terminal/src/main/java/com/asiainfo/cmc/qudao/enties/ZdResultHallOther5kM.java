package com.asiainfo.cmc.qudao.enties;

import java.io.Serializable;
import java.math.BigDecimal;

public class ZdResultHallOther5kM implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String orgacode;
	private BigDecimal longitudeminus;
	private BigDecimal latitudeminus;
	private String otherOrgacode;
	private BigDecimal otherLongitudeminus;
	private BigDecimal otherLatitudeminus;
	  
	public String getOrgacode() {
		return orgacode;
	}
	public void setOrgacode(String orgacode) {
		this.orgacode = orgacode;
	}
	public BigDecimal getLongitudeminus() {
		return longitudeminus;
	}
	public void setLongitudeminus(BigDecimal longitudeminus) {
		this.longitudeminus = longitudeminus;
	}
	public BigDecimal getLatitudeminus() {
		return latitudeminus;
	}
	public void setLatitudeminus(BigDecimal latitudeminus) {
		this.latitudeminus = latitudeminus;
	}
	public String getOtherOrgacode() {
		return otherOrgacode;
	}
	public void setOtherOrgacode(String otherOrgacode) {
		this.otherOrgacode = otherOrgacode;
	}
	public BigDecimal getOtherLongitudeminus() {
		return otherLongitudeminus;
	}
	public void setOtherLongitudeminus(BigDecimal otherLongitudeminus) {
		this.otherLongitudeminus = otherLongitudeminus;
	}
	public BigDecimal getOtherLatitudeminus() {
		return otherLatitudeminus;
	}
	public void setOtherLatitudeminus(BigDecimal otherLatitudeminus) {
		this.otherLatitudeminus = otherLatitudeminus;
	}
	  
	  
}
