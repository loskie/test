package com.som.entity;

public class Prize{

	private Integer id;
	private String grade;
	private String sponsor;
	private String productname;
	private String unitprice;
	private String count;
	private String totalvalue;
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getSponsor() {
		return sponsor;
	}
	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(String unitprice) {
		this.unitprice = unitprice;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getTotalvalue() {
		return totalvalue;
	}
	public void setTotalvalue(String totalvalue) {
		this.totalvalue = totalvalue;
	}
	@Override
	public String toString() {
		return "Prize [id=" + id + ", grade=" + grade + ", sponsor=" + sponsor + ", productname=" + productname
				+ ", unitprice=" + unitprice + ", count=" + count + ", totalvalue=" + totalvalue + "]";
	}
	
}
