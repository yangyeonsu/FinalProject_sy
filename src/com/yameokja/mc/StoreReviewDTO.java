package com.yameokja.mc;

public class StoreReviewDTO
{
	private String user_nickname, rv_content, reg_date;
	private int rv_num, star_score, rec, nonrec;
	

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
	public int getRv_num()
	{
		return rv_num;
	}
	public void setRv_num(int rv_num)
	{
		this.rv_num = rv_num;
	}
	public int getStar_score()
	{
		return star_score;
	}
	public void setStar_score(int star_score)
	{
		this.star_score = star_score;
	}
	public int getRec()
	{
		return rec;
	}
	public void setRec(int rec)
	{
		this.rec = rec;
	}
	public int getNonrec()
	{
		return nonrec;
	}
	public void setNonrec(int nonrec)
	{
		this.nonrec = nonrec;
	}

}
