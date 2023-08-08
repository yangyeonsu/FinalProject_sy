package com.yameokja.mc;

public class StoreReviewDTO
{
	private String user_nickname, rv_content, reg_date;
	private int star_score, rec_nonrec_name1, rec_nonrec_name2;
	
	// getter / setter 구성
	public String getUser_nickname()
	{
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname)
	{
		this.user_nickname = user_nickname;
	}
	public String getRv_content()
	{
		return rv_content;
	}
	public void setRv_content(String rv_content)
	{
		this.rv_content = rv_content;
	}
	public String getReg_date()
	{
		return reg_date;
	}
	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
	}
	public int getStar_score()
	{
		return star_score;
	}
	public void setStar_score(int star_score)
	{
		this.star_score = star_score;
	}
	public int getRec_nonrec_name1()
	{
		return rec_nonrec_name1;
	}
	public void setRec_nonrec_name1(int rec_nonrec_name1)
	{
		this.rec_nonrec_name1 = rec_nonrec_name1;
	}
	public int getRec_nonrec_name2()
	{
		return rec_nonrec_name2;
	}
	public void setRec_nonrec_name2(int rec_nonrec_name2)
	{
		this.rec_nonrec_name2 = rec_nonrec_name2;
	}
	
	
	
}
