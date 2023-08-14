package com.yameokja.mc;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

public interface IStoreMainDAO
{
	public ArrayList<StoreDTO> searchStoreInfo(String user_num);
	public Integer searchRepStore(String user_num);
	public ArrayList<HashMap<String, String>> star_transition(int st_num);
	public ArrayList<HashMap<String, String>> rv_key_sum(int st_num);
	public ArrayList<ReviewDTO> rv_list(int st_num);

	//public int reviewReply(@RequestParam("rv_num") int rv_num, @RequestParam("reply_content") String reply_content);
	// 리뷰댓글(insert)
	public int reviewReply(@Param("rv_num") int rv_num,@Param("reply_content") String reply_content);
	// 댓글내용
	public ArrayList<ReviewDTO> reply_content(int rv_num); 
	
	public ArrayList<FoodLabelDTO> foodLabel();
	public ArrayList<PayLabelDTO> payLabel();
	public ArrayList<String> weekDayLabel();
	public ArrayList<String> weekWeekendDayLabel();
	public ArrayList<ChboxDTO> chBoxLabel();
}
