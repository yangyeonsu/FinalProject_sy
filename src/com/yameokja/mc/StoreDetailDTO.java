package com.yameokja.mc;


public class StoreDetailDTO
{
	// 주요 속성 구성
	private String st_name, st_location, st_tel, st_explain, photo_link
				, reg_date, st_email, food_name;
	private double star_avg;
	private int st_num, rv_count, max_customers, like_count;
	
	
	// getter / setter 구성
	public String getSt_name()
	{
		return st_name;
	}
	public void setSt_name(String st_name)
	{
		this.st_name = st_name;
	}
	public String getSt_location()
	{
		return st_location;
	}
	public void setSt_location(String st_location)
	{
		this.st_location = st_location;
	}
	public String getSt_tel()
	{
		return st_tel;
	}
	public void setSt_tel(String st_tel)
	{
		this.st_tel = st_tel;
	}
	public String getSt_explain()
	{
		return st_explain;
	}
	public void setSt_explain(String st_explain)
	{
		this.st_explain = st_explain;
	}
	public String getPhoto_link()
	{
		return photo_link;
	}
	public void setPhoto_link(String photo_link)
	{
		this.photo_link = photo_link;
	}
	public String getReg_date()
	{
		return reg_date;
	}
	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
	}
	public String getSt_email()
	{
		return st_email;
	}
	public void setSt_email(String st_email)
	{
		this.st_email = st_email;
	}
	public String getFood_name()
	{
		return food_name;
	}
	public void setFood_name(String food_name)
	{
		this.food_name = food_name;
	}
	public double getStar_avg()
	{
		return star_avg;
	}
	public void setStar_avg(double star_avg)
	{
		this.star_avg = star_avg;
	}
	public int getSt_num()
	{
		return st_num;
	}
	public void setSt_num(int st_num)
	{
		this.st_num = st_num;
	}
	public int getRv_count()
	{
		return rv_count;
	}
	public void setRv_count(int rv_count)
	{
		this.rv_count = rv_count;
	}
	public int getMax_customers()
	{
		return max_customers;
	}
	public void setMax_customers(int max_customers)
	{
		this.max_customers = max_customers;
	}
	

}
