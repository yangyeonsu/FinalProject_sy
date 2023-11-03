package com.yameokja.mc;

public class StoreBreaktimeDTO
{
	private String week_weekend, start_breaktime, end_breaktime;
	private int st_num, week_weekend_num;

	
	

	// getter/setter 구성
	public int getSt_num()
	{
		return st_num;
	}

	public void setSt_num(int st_num)
	{
		this.st_num = st_num;
	}
	public String getWeek_weekend()
	{
		return week_weekend;
	}

	public void setWeek_weekend(String week_weekend)
	{
		this.week_weekend = week_weekend;
	}

	public String getStart_breaktime()
	{
		return start_breaktime;
	}

	public void setStart_breaktime(String start_breaktime)
	{
		this.start_breaktime = start_breaktime;
	}

	public String getEnd_breaktime()
	{
		return end_breaktime;
	}

	public void setEnd_breaktime(String end_breaktime)
	{
		this.end_breaktime = end_breaktime;
	}
	
	public int getWeek_weekend_num()
	{
		return week_weekend_num;
	}

	public void setWeek_weekend_num(int week_weekend_num)
	{
		this.week_weekend_num = week_weekend_num;
	}
}
