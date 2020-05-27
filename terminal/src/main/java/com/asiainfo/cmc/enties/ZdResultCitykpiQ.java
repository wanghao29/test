package com.asiainfo.cmc.enties;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
/**
 * 对象功能:地市KPI结果表 Model对象
 * 开发公司:亚信科技（中国）有限公司
 * 开发人员:Long
 * 创建时间:2018-09-19 15:06:06
 */
public class ZdResultCitykpiQ {
	// 年份 YYYY
	protected String  year;
	// 季度
	protected String  quarter;
	// 地市
	protected String  city;
	// 运营中心
	protected String  operationCenter;
	// kpi名称
	protected String  kpiname;
	// 全年目标值
	protected Double  YGoal;
	// 全年完成值
	protected Double  YValue;
	// 全年完成率
	protected Double  YRate;
	// 季度目标值
	protected Double  QGoal;
	// 季度完成值
	protected Double  QValue;
	// 季度完成率
	protected Double  QRate;
	// 时间进度
	protected Double  progress;
	// 得分
	protected Double  score;
	
	public ZdResultCitykpiQ(){
		
	}
	
	public ZdResultCitykpiQ(String year, String quarter){
		this.year = year;
		this.quarter = quarter;
	}
	
	public ZdResultCitykpiQ(String year, String quarter, String  city, String  kpiname){
		this.year = year;
		this.quarter = quarter;
		this.city = city;
		this.kpiname = kpiname;
	}
	
	public void setYear(String year) 
	{
		this.year = year;
	}
	/**
	 * 返回 年份 YYYY
	 * @return
	 */
	public String getYear() 
	{
		return this.year;
	}
	public void setQuarter(String quarter) 
	{
		this.quarter = quarter;
	}
	/**
	 * 返回 季度
	 * @return
	 */
	public String getQuarter() 
	{
		return this.quarter;
	}
	public void setCity(String city) 
	{
		this.city = city;
	}
	/**
	 * 返回 地市
	 * @return
	 */
	public String getCity() 
	{
		return this.city;
	}
	public void setKpiname(String kpiname) 
	{
		this.kpiname = kpiname;
	}
	public void setOperationCenter(String operationCenter) 
	{
		this.operationCenter = operationCenter;
	}
	/**
	 * 返回 运营中心
	 * @return
	 */
	public String getOperationCenter() 
	{
		return this.operationCenter;
	}
	/**
	 * 返回 kpi名称
	 * @return
	 */
	public String getKpiname() 
	{
		return this.kpiname;
	}
	public void setYGoal(Double YGoal) 
	{
		this.YGoal = YGoal;
	}
	/**
	 * 返回 全年目标值
	 * @return
	 */
	public Double getYGoal() 
	{
		return this.YGoal;
	}
	public void setYValue(Double YValue) 
	{
		this.YValue = YValue;
	}
	/**
	 * 返回 全年完成值
	 * @return
	 */
	public Double getYValue() 
	{
		return this.YValue;
	}
	public void setYRate(Double YRate) 
	{
		this.YRate = YRate;
	}
	/**
	 * 返回 全年完成率
	 * @return
	 */
	public Double getYRate() 
	{
		return this.YRate;
	}
	public void setQGoal(Double QGoal) 
	{
		this.QGoal = QGoal;
	}
	/**
	 * 返回 季度目标值
	 * @return
	 */
	public Double getQGoal() 
	{
		return this.QGoal;
	}
	public void setQValue(Double QValue) 
	{
		this.QValue = QValue;
	}
	/**
	 * 返回 季度完成值
	 * @return
	 */
	public Double getQValue() 
	{
		return this.QValue;
	}
	public void setQRate(Double QRate) 
	{
		this.QRate = QRate;
	}
	/**
	 * 返回 季度完成率
	 * @return
	 */
	public Double getQRate() 
	{
		return this.QRate;
	}
	public void setProgress(Double progress) 
	{
		this.progress = progress;
	}
	/**
	 * 返回 时间进度
	 * @return
	 */
	public Double getProgress() 
	{
		return this.progress;
	}
	public void setScore(Double score) 
	{
		this.score = score;
	}
	/**
	 * 返回 得分
	 * @return
	 */
	public Double getScore() 
	{
		return this.score;
	}

   	/**
	 * @see java.lang.Object#equals(Object)
	 */
	public boolean equals(Object object) 
	{
		if (!(object instanceof ZdResultCitykpiQ)) 
		{
			return false;
		}
		ZdResultCitykpiQ rhs = (ZdResultCitykpiQ) object;
		return new EqualsBuilder()
		.append(this.year, rhs.year)
		.append(this.quarter, rhs.quarter)
		.append(this.city, rhs.city)
		.append(this.operationCenter, rhs.operationCenter)
		.append(this.kpiname, rhs.kpiname)
		.append(this.YGoal, rhs.YGoal)
		.append(this.YValue, rhs.YValue)
		.append(this.YRate, rhs.YRate)
		.append(this.QGoal, rhs.QGoal)
		.append(this.QValue, rhs.QValue)
		.append(this.QRate, rhs.QRate)
		.append(this.progress, rhs.progress)
		.append(this.score, rhs.score)
		.isEquals();
	}

	/**
	 * @see java.lang.Object#hashCode()
	 */
	public int hashCode() 
	{
		return new HashCodeBuilder(-82280557, -700257973)
		.append(this.year) 
		.append(this.quarter) 
		.append(this.city) 
		.append(this.kpiname) 
		.append(this.operationCenter) 
		.append(this.YGoal) 
		.append(this.YValue) 
		.append(this.YRate) 
		.append(this.QGoal) 
		.append(this.QValue) 
		.append(this.QRate) 
		.append(this.progress) 
		.append(this.score) 
		.toHashCode();
	}

	/**
	 * @see java.lang.Object#toString()
	 */
	public String toString() 
	{
		return new ToStringBuilder(this)
		.append("year", this.year) 
		.append("quarter", this.quarter) 
		.append("city", this.city) 
		.append("operationCenter", this.operationCenter) 
		.append("kpiname", this.kpiname) 
		.append("YGoal", this.YGoal) 
		.append("YValue", this.YValue) 
		.append("YRate", this.YRate) 
		.append("QGoal", this.QGoal) 
		.append("QValue", this.QValue) 
		.append("QRate", this.QRate) 
		.append("progress", this.progress) 
		.append("score", this.score) 
		.toString();
	}
   
  

}