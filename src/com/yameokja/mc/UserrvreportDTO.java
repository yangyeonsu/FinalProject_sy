package com.yameokja.mc;

public class UserrvreportDTO
{
	private String reg_date, st_name, reporteduserid, final_date, status;
	
	private String rep_rej_num;
	private String rej_rs;
	
	
	// getter / setter
	
	public String getRej_rs()
	{
		return rej_rs;
	}

	public void setRej_rs(String rej_rs)
	{
		this.rej_rs = rej_rs;
	}
	

	public String getRep_rej_num()
	{
		return rep_rej_num;
	}

	public void setRep_rej_num(String rep_rej_num)
	{
		this.rep_rej_num = rep_rej_num;
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

	public String getReporteduserid()
	{
		return reporteduserid;
	}

	public void setReporteduserid(String reporteduserid)
	{
		this.reporteduserid = reporteduserid;
	}

	public String getFinal_date()
	{
		return final_date;
	}

	public void setFinal_date(String final_date)
	{
		this.final_date = final_date;
	}

	public String getStatus()
	{
		return status;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}
	
	
}
