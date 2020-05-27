package com.asiainfo.cmc.vo.model;

import net.sf.json.JSONArray;

public class EcharDataVo {
	
	private String name;
	private JSONArray  data;
	private JSONArray  data_year;
	private JSONArray  data_mom;
	private JSONArray  legend_data;
	private JSONArray  xAxis_data;
	private JSONArray  nest_data;
	private JSONArray  nest_data_year;
	private JSONArray  nest_data_mom;
	private String sub_dim_select_id;
	private String unit;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public JSONArray getData() {
		return data;
	}
	public void setData(JSONArray data) {
		this.data = data;
	}
	public JSONArray getData_year() {
		return data_year;
	}
	public void setData_year(JSONArray data_year) {
		this.data_year = data_year;
	}
	public JSONArray getData_mom() {
		return data_mom;
	}
	public void setData_mom(JSONArray data_mom) {
		this.data_mom = data_mom;
	}
	public JSONArray getLegend_data() {
		return legend_data;
	}
	public void setLegend_data(JSONArray legend_data) {
		this.legend_data = legend_data;
	}
	public JSONArray getxAxis_data() {
		return xAxis_data;
	}
	public void setxAxis_data(JSONArray xAxis_data) {
		this.xAxis_data = xAxis_data;
	}
	public String getSub_dim_select_id() {
		return sub_dim_select_id;
	}
	public void setSub_dim_select_id(String sub_dim_select_id) {
		this.sub_dim_select_id = sub_dim_select_id;
	}
	public JSONArray getNest_data() {
		return nest_data;
	}
	public void setNest_data(JSONArray nest_data) {
		this.nest_data = nest_data;
	}
	public JSONArray getNest_data_year() {
		return nest_data_year;
	}
	public void setNest_data_year(JSONArray nest_data_year) {
		this.nest_data_year = nest_data_year;
	}
	public JSONArray getNest_data_mom() {
		return nest_data_mom;
	}
	public void setNest_data_mom(JSONArray nest_data_mom) {
		this.nest_data_mom = nest_data_mom;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}

}
