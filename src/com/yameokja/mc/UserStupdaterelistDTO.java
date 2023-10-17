package com.yameokja.mc;

public class UserStupdaterelistDTO
{
	private String reg_date, st_name, state, final_date;

	/* REQ_APPLY_NUM, REQ_PROCESS_NUM, REJ_RS 추가*/
	
	private int req_apply_num;
	private String req_process_num, rej_rs, isrej;
	
	// getter / setter
	public int getReq_apply_num()
	{
		return req_apply_num;
	}

	public void setReq_apply_num(int req_apply_num)
	{
		this.req_apply_num = req_apply_num;
	}
	public String getReq_process_num()
	{
		return req_process_num;
	}

	public void setReq_process_num(String req_process_num)
	{
		this.req_process_num = req_process_num;
	}
	public String getRej_rs()
	{
		return rej_rs;
	}

	public void setRej_rs(String rej_rs)
	{
		this.rej_rs = rej_rs;
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

	public String getState()
	{
		return state;
	}

	public void setState(String state)
	{
		this.state = state;
	}

	public String getFinal_date()
	{
		return final_date;
	}

	public void setFinal_date(String final_date)
	{
		this.final_date = final_date;
	}

	public String getIsrej()
	{
		return isrej;
	}

	public void setIsrej(String isrej)
	{
		this.isrej = isrej;
	}
}
