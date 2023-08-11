package com.yameokja.mc;

import java.util.ArrayList;
import java.util.HashMap;

public interface IStoreMainDAO
{
	public ArrayList<StoreDTO> searchStoreInfo(String user_num);
	public Integer searchRepStore(String user_num);
	public ArrayList<HashMap<String, String>> star_transition(int st_num);
	public ArrayList<HashMap<String, String>> rv_key_sum(int st_num);
	public ArrayList<ReviewDTO> rv_list(int st_num);
}
