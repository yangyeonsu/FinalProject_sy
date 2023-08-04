package com.yameokja.mc;

import java.util.ArrayList;
import java.util.HashMap;

public interface IStoreMainDAO
{
	public ArrayList<HashMap<String, String>> star_transition(String st_num);
	public ArrayList<HashMap<String, String>> rv_key_sum(String st_num);
	public ArrayList<ReviewDTO> rv_list(String st_num);
}
