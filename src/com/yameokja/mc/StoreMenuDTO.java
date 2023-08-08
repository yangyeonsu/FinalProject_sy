package com.yameokja.mc;

public class StoreMenuDTO
{
	private String menu_name, image_link;
	private int price, menu_num;
	
	// getter / setter 구성
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
	
	
}
