package com.yameokja.mc;

public class storeOutDTO 
{
private String user_num, st_name, admin_read_date, reg_date;
	
	private long st_out_num;
	
	private String st_out_file;
	
	private String out_file_name;
	
	// getter / setter
	public String getUser_num() {
		return user_num;
	}

	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public String getAdmin_read_date() {
		return admin_read_date;
	}

	public void setAdmin_read_date(String admin_read_date) {
		this.admin_read_date = admin_read_date;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public long getSt_out_num() {
		return st_out_num;
	}

	public void setSt_out_num(long st_out_num) {
		this.st_out_num = st_out_num;
	}

	public String getSt_out_file() {
		return st_out_file;
	}

	public void setSt_out_file(String st_out_file) {
		this.st_out_file = st_out_file;
	}

	public String getOut_file_name() {
		return out_file_name;
	}

	public void setOut_file_name(String out_file_name) {
		this.out_file_name = out_file_name;
	}
}
