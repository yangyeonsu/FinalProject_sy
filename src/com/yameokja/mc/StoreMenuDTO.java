package com.yameokja.mc;

public class StoreMenuDTO
{
	private String menu_name, img_link;
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
	public String getImg_link()
	{
		return img_link;
	}
	public void setImg_link(String img_link)
	{
		this.img_link = img_link;
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
