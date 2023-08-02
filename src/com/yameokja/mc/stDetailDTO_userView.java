package com.yameokja.mc;

public class stDetailDTO_userView 
{
	private String day_name, start_time, end_time; // 영업 시간 가져오는 DTO
	
	private int st_num, day_num;
	
	private String week_weekend, start_breaktime, end_breaktime; // 브레이크 타입 가져오는 DTO
		
	private String st_name; // 가게 이름
	
	private int like_count ,review_count; // 좋아요 , 리뷰 수
	
	private double star_score;   // 별점 평균
	
	private String st_tel, st_location;  // 전화번호, 주소
	
	private String st_explain, st_email, food_name;	// 가게 기타사항 : 설명, 이메일
	
	private int max_customers;				// 가게 최대 인원수
	
	private String menu_name, image_link, st_keyword, pay_name; // 가게 메뉴, 이미지 링크, 가게 키워드 
	
	private int price;					// 가게 메뉴 가격
	
	private String user_nickname, rv_content, reg_date; // 리뷰 닉네임, 내용, 작성일자
	
	private int rec_nonrec_name1, rec_nonrec_name2; // 추천 / 비추천 수 
	
	
	// getter / setter 설정
	public String getDay_name()
	{
		return day_name;
	}

	public void setDay_name(String day_name)
	{
		this.day_name = day_name;
	}

	public String getStart_time()
	{
		return start_time;
	}

	public void setStart_time(String start_time)
	{
		this.start_time = start_time;
	}

	public String getEnd_time()
	{
		return end_time;
	}

	public void setEnd_time(String end_time)
	{
		this.end_time = end_time;
	}

	public String getWeek_weekend()
	{
		return week_weekend;
	}

	public void setWeek_weekend(String week_weekend)
	{
		this.week_weekend = week_weekend;
	}

	public String getStart_breaktime()
	{
		return start_breaktime;
	}

	public void setStart_breaktime(String start_breaktime)
	{
		this.start_breaktime = start_breaktime;
	}

	public String getEnd_breaktime()
	{
		return end_breaktime;
	}

	public void setEnd_breaktime(String end_breaktime)
	{
		this.end_breaktime = end_breaktime;
	}

	public String getSt_name()
	{
		return st_name;
	}

	public void setSt_name(String st_name)
	{
		this.st_name = st_name;
	}

	public int getLike_count()
	{
		return like_count;
	}

	public void setLike_count(int like_count)
	{
		this.like_count = like_count;
	}

	public int getReview_count()
	{
		return review_count;
	}

	public void setReview_count(int review_count)
	{
		this.review_count = review_count;
	}

	public double getStar_score()
	{
		return star_score;
	}

	public void setStar_score(double star_score)
	{
		this.star_score = star_score;
	}

	public String getSt_tel()
	{
		return st_tel;
	}

	public void setSt_tel(String st_tel)
	{
		this.st_tel = st_tel;
	}

	public String getSt_location()
	{
		return st_location;
	}

	public void setSt_location(String st_location)
	{
		this.st_location = st_location;
	}

	public String getMenu_name()
	{
		return menu_name;
	}

	public void setMenu_name(String menu_name)
	{
		this.menu_name = menu_name;
	}

	public String getImage_link()
	{
		return image_link;
	}

	public void setImage_link(String image_link)
	{
		this.image_link = image_link;
	}

	public int getPrice()
	{
		return price;
	}

	public void setPrice(int price)
	{
		this.price = price;
	}

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

	public String getSt_keyword()
	{
		return st_keyword;
	}

	public void setSt_keyword(String st_keyword)
	{
		this.st_keyword = st_keyword;
	}

	public int getSt_num()
	{
		return st_num;
	}

	public void setSt_num(int st_num)
	{
		this.st_num = st_num;
	}

	public int getDay_num()
	{
		return day_num;
	}

	public void setDay_num(int day_num)
	{
		this.day_num = day_num;
	}

	public String getSt_email()
	{
		return st_email;
	}

	public void setSt_email(String st_email)
	{
		this.st_email = st_email;
	}

	public int getMax_customers()
	{
		return max_customers;
	}

	public void setMax_customers(int max_customers)
	{
		this.max_customers = max_customers;
	}

	public String getSt_explain()
	{
		return st_explain;
	}

	public void setSt_explain(String st_explain)
	{
		this.st_explain = st_explain;
	}

	public String getFood_name()
	{
		return food_name;
	}

	public void setFood_name(String food_name)
	{
		this.food_name = food_name;
	}

	public String getPay_name()
	{
		return pay_name;
	}

	public void setPay_name(String pay_name)
	{
		this.pay_name = pay_name;
	}
	
}



