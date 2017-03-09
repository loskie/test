package com.som.entity;

public class ExRecord {

	private Integer id;
	private String exdate;
	private String exnum;
	private String exproduct;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getExdate() {
		return exdate;
	}
	public void setExdate(String exdate) {
		this.exdate = exdate;
	}
	public String getExnum() {
		return exnum;
	}
	public void setExnum(String exnum) {
		this.exnum = exnum;
	}
	public String getExproduct() {
		return exproduct;
	}
	public void setExproduct(String exproduct) {
		this.exproduct = exproduct;
	}
	@Override
	public String toString() {
		return "ExRecord [id=" + id + ", exdate=" + exdate + ", exnum=" + exnum + ", exproduct=" + exproduct + "]";
	}
	
	
	
}
