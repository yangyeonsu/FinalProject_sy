package com.yameokja.mc;

public class penaltyListDTO
{
	/* private String reg_date, st_name, write_date; */
	private String reg_date, st_name, state, final_date, rv_content;
	
	// getter / setter
	public String getReg_date()
	{
		return reg_date;
	}

	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
	}

	public String getSt_name()
	{
		return st_name;
	}

	public void setSt_name(String st_name)
	{
		this.st_name = st_name;
	}

	public String getFinal_date()
	{
		return final_date;
	}

	public void setFinal_date(String final_date)
	{
		this.final_date = final_date;
	}
	public String getState()
	{
		return state;
	}

	public void setState(String state)
	{
		this.state = state;
	}

	public String getRv_content()
	{
		return rv_content;
	}

	public void setRv_content(String rv_content)
	{
		this.rv_content = rv_content;
	}

}
