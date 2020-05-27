package com.asiainfo.cmc.enties.consumerBigData;

/**
 * 终端——多维度信息
 * @author yuxuandong
 *ZD_MULT_idimensional
 */
public class ZdMultIdimensional {

	public Integer id;
	public String  composeDims;
	public String  dimension;
	public String  dimensionDesc;//维度描述
	public Integer  idxdimId;
	public String  idxid;
	public Integer  level;
	public String  memo;
	public String  num;
	public String  referinfo;
	public Integer  showdesc;
	public String  starttime;
	public String  stoptime;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getComposeDims() {
		return composeDims;
	}
	public void setComposeDims(String composeDims) {
		this.composeDims = composeDims;
	}
	public String getDimension() {
		return dimension;
	}
	public void setDimension(String dimension) {
		this.dimension = dimension;
	}
	public String getDimensionDesc() {
		return dimensionDesc;
	}
	public void setDimensionDesc(String dimensionDesc) {
		this.dimensionDesc = dimensionDesc;
	}
	public Integer getIdxdimId() {
		return idxdimId;
	}
	public void setIdxdimId(Integer idxdimId) {
		this.idxdimId = idxdimId;
	}
	public String getIdxid() {
		return idxid;
	}
	public void setIdxid(String idxid) {
		this.idxid = idxid;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getReferinfo() {
		return referinfo;
	}
	public void setReferinfo(String referinfo) {
		this.referinfo = referinfo;
	}
	public Integer getShowdesc() {
		return showdesc;
	}
	public void setShowdesc(Integer showdesc) {
		this.showdesc = showdesc;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getStoptime() {
		return stoptime;
	}
	public void setStoptime(String stoptime) {
		this.stoptime = stoptime;
	}
	
	
	public ZdMultIdimensional() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ZdMultIdimensional( Integer id,String composeDims, String dimension, String dimensionDesc, Integer idxdimId,
			String idxid, Integer level, String memo, String num, String referinfo, Integer showdesc, String starttime,
			String stoptime) {
		super();
		this.id=id;
		this.composeDims = composeDims;
		this.dimension = dimension;
		this.dimensionDesc = dimensionDesc;
		this.idxdimId = idxdimId;
		this.idxid = idxid;
		this.level = level;
		this.memo = memo;
		this.num = num;
		this.referinfo = referinfo;
		this.showdesc = showdesc;
		this.starttime = starttime;
		this.stoptime = stoptime;
	}
	
	
	
	
}
