package com.yameokja.mc;

public class storeOutDTO 
{
	private String admin_read_date, reg_date;
	private int out_apply_num, st_num, st_place_num, user_num, in_process_num;
	private long st_out_num;
	
	
	// getter / setter
	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
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

	public int getOut_apply_num() {
		return out_apply_num;
	}

	public void setOut_apply_num(int out_apply_num) {
		this.out_apply_num = out_apply_num;
	}

	public int getSt_num() {
		return st_num;
	}

	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}

	public int getSt_place_num() {
		return st_place_num;
	}

	public void setSt_place_num(int st_place_num) {
		this.st_place_num = st_place_num;
	}

	public int getIn_process_num() {
		return in_process_num;
	}

	public void setIn_process_num(int in_process_num) {
		this.in_process_num = in_process_num;
	}
}
