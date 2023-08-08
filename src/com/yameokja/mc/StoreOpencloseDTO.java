package com.yameokja.mc;

public class StoreOpencloseDTO
{
	private int day_num, st_num;
	private String day_name, operate_time, holiday;
	public int getDay_num()
	{
		return day_num;
	}
	public void setDay_num(int day_num)
	{
		this.day_num = day_num;
	}
	public int getSt_num()
	{
		return st_num;
	}
	public void setSt_num(int st_num)
	{
		this.st_num = st_num;
	}
	public String getDay_name()
	{
		return day_name;
	}
	public void setDay_name(String day_name)
	{
		this.day_name = day_name;
	}
	public String getOperate_time()
	{
		return operate_time;
	}
	public void setOperate_time(String operate_time)
	{
		this.operate_time = operate_time;
	}
	public String getHoliday()
	{
		return holiday;
	}
	public void setHoliday(String holiday)
	{
		this.holiday = holiday;
	}
	
}
