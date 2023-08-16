package com.yameokja.mc;

public class StAppealRequestDTO
{
	private String reg_date, st_name, status, final_date, admin_name;
	private int req_apply_num;
	private String req_process_num, rej_rs;

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



	public String getStatus()
	{
		return status;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}

	public String getFinal_date()
	{
		return final_date;
	}

	public void setFinal_date(String final_date)
	{
		this.final_date = final_date;
	}

	public String getAdmin_name()
	{
		return admin_name;
	}

	public void setAdmin_name(String admin_name)
	{
		this.admin_name = admin_name;
	}
	
}
