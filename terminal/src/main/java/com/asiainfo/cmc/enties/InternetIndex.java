package com.asiainfo.cmc.enties;

/**
 * @author WANGHAO
 * @version 创建时间：2020年4月9日 下午5:34:34
 * @ClassName 类名称 对应表明为 kpi_internet_index
 * @Description 类描述 经分监控，量指标里面的初期数据模型
 */

public class InternetIndex {
    private Integer id;
	
	private String lsltype;// 指标名称，1为销量，2为收入，3为毛利

	private String datetype;// 时间维度，1为月，2为年

	private String datevalue;// 时间

	private String indexvalue;// 指标值

	private String start;

	private String end;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLsltype() {
		return lsltype;
	}

	public void setLsltype(String lsltype) {
		this.lsltype = lsltype;
	}

	public String getDatetype() {
		return datetype;
	}

	public void setDatetype(String datetype) {
		this.datetype = datetype;
	}

	public String getDatevalue() {
		return datevalue;
	}

	public void setDatevalue(String datevalue) {
		this.datevalue = datevalue;
	}

	public String getIndexvalue() {
		return indexvalue;
	}

	public void setIndexvalue(String indexvalue) {
		this.indexvalue = indexvalue;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public InternetIndex(Integer id, String lsltype, String datetype, String datevalue, String indexvalue, String start,
			String end) {
		super();
		this.id = id;
		this.lsltype = lsltype;
		this.datetype = datetype;
		this.datevalue = datevalue;
		this.indexvalue = indexvalue;
		this.start = start;
		this.end = end;
	}

	public InternetIndex() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	
	
	
	
}
