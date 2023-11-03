package com.yameokja.mc;

public class StoreMenuDTO
{
	private String menu_name, image_link;
	private int price, menu_num, st_num;
	private double price_avg;
	

	// getter / setter 구성
	public int getSt_num()
	{
		return st_num;
	}
	public void setSt_num(int st_num)
	{
		this.st_num = st_num;
	}
	public String getMenu_name()
	{
		return menu_name;
	}
	public void setMenu_name(String menu_name)
	{
		this.menu_name = menu_name;
	}
	public String getImage_link()
	{
		return image_link;
	}
	public void setImage_link(String image_link)
	{
		this.image_link = image_link;
	}
	public int getPrice()
	{
		return price;
	}
	public void setPrice(int price)
	{
		this.price = price;
	}
	public int getMenu_num()
	{
		return menu_num;
	}
	public void setMenu_num(int menu_num)
	{
		this.menu_num = menu_num;
	}
	public double getPrice_avg()
	{
		return price_avg;
	}
	public void setPrice_avg(double price_avg)
	{
		this.price_avg = price_avg;
	}

}
