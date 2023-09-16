package com.yameokja.mc;

public class UserrvreportDTO
{
	private String reg_date, st_name, accu_id, final_date, state;
	
	private String rep_rej_num;
	private String rej_rs;
	
	private String rep_mid_num;
	private String mid_rs;
	
	
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

	public String getRep_mid_num()
	{
		return rep_mid_num;
	}

	public void setRep_mid_num(String rep_mid_num)
	{
		this.rep_mid_num = rep_mid_num;
	}

	public String getMid_rs()
	{
		return mid_rs;
	}

	public void setMid_rs(String mid_rs)
	{
		this.mid_rs = mid_rs;
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
	
	/*
	 * public String getReporteduserid() { return reporteduserid; }
	 * 
	 * public void setReporteduserid(String reporteduserid) { this.reporteduserid =
	 * reporteduserid; }
	 */
	

	public String getFinal_date()
	{
		return final_date;
	}

	public void setFinal_date(String final_date)
	{
		this.final_date = final_date;
	}

	public String getAccu_id()
	{
		return accu_id;
	}

	public void setAccu_id(String accu_id)
	{
		this.accu_id = accu_id;
	}

	public String getState()
	{
		return state;
	}

	public void setState(String state)
	{
		this.state = state;
	}
	
	
	
}
