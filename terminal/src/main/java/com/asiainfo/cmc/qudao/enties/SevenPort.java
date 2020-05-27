package com.asiainfo.cmc.qudao.enties;
 
/** 
* @author 作者 Your-Name:wanghao 
* @version 创建时间：2019年12月2日 下午3:56:33 
* 
*/

public class SevenPort {
      
	 private String startMonth;
	 private String endMonth;
	 private String dodateMonth;
	 private String dodateEndMonth;  
	 private String tag1;     
	 private String portCode;
	 private String custName;
	 private String orgacode;
	public String getStartMonth() {
		return startMonth;
	}
	public void setStartMonth(String startMonth) {
		this.startMonth = startMonth;
	}
	public String getEndMonth() {
		return endMonth;
	}
	public void setEndMonth(String endMonth) {
		this.endMonth = endMonth;
	}
	public String getDodateMonth() {
		return dodateMonth;
	}
	public void setDodateMonth(String dodateMonth) {
		this.dodateMonth = dodateMonth;
	}
	public String getDodateEndMonth() {
		return dodateEndMonth;
	}
	public void setDodateEndMonth(String dodateEndMonth) {
		this.dodateEndMonth = dodateEndMonth;
	}
	public String getTag1() {
		return tag1;
	}
	public void setTag1(String tag1) {
		this.tag1 = tag1;
	}
	public String getPortCode() {
		return portCode;
	}
	public void setPortCode(String portCode) {
		this.portCode = portCode;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	
	public SevenPort(String startMonth, String endMonth, String dodateMonth, String dodateEndMonth, String tag1,
			String portCode, String custName, String orgacode) {
		super();
		this.startMonth = startMonth;
		this.endMonth = endMonth;
		this.dodateMonth = dodateMonth;
		this.dodateEndMonth = dodateEndMonth;
		this.tag1 = tag1;
		this.portCode = portCode;
		this.custName = custName;
		this.orgacode = orgacode;
	}
	public String getOrgacode() {
		return orgacode;
	}
	public void setOrgacode(String orgacode) {
		this.orgacode = orgacode;
	}
	public SevenPort() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	
}
