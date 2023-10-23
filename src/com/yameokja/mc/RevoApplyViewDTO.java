package com.yameokja.mc;

public class RevoApplyViewDTO
{
	// REVO_APPLY_NUM, USER_ID, REG_DATE, ST_NAME
	// PEN_TYPE_NAME, REVO_RS, PHOTO_LINK
	private int revo_apply_num;
	private String user_id, reg_date, st_name;
	private String req_rs, revo_rs, photo_link;
	
	// getter / setter
	public String getUser_id()
	{
		return user_id;
	}
	public int getRevo_apply_num()
	{
		return revo_apply_num;
	}
	public void setRevo_apply_num(int revo_apply_num)
	{
		this.revo_apply_num = revo_apply_num;
	}
	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}
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
	
	public String getReq_rs()
	{
		return req_rs;
	}
	public void setReq_rs(String req_rs)
	{
		this.req_rs = req_rs;
	}
	public String getRevo_rs()
	{
		return revo_rs;
	}
	public void setRevo_rs(String revo_rs)
	{
		this.revo_rs = revo_rs;
	}
	public String getPhoto_link()
	{
		return photo_link;
	}
	public void setPhoto_link(String photo_link)
	{
		this.photo_link = photo_link;
	}
	
	
}
