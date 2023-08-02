package com.yameokja.mc;

public class StoreDTO
{
	// 주요 속성 구성
	private String st_name, photo_link;
	private double star_avg;
	private int st_num, rv_count;
	
	
	// getter / setter 구성
	public int getSt_num()
	{
		return st_num;
	}
	public void setSt_num(int st_num)
	{
		this.st_num = st_num;
	}
	public String getSt_name()
	{
		return st_name;
	}
	public void setSt_name(String st_name)
	{
		this.st_name = st_name;
	}
	public String getPhoto_link()
	{
		return photo_link;
	}
	public void setPhoto_link(String photo_link)
	{
		this.photo_link = photo_link;
	}
	public double getStar_avg()
	{
		return star_avg;
	}
	public void setStar_avg(double star_avg)
	{
		this.star_avg = star_avg;
	}
	public int getRv_count()
	{
		return rv_count;
	}
	public void setRv_count(int rv_count)
	{
		this.rv_count = rv_count;
	}
	
	
}
