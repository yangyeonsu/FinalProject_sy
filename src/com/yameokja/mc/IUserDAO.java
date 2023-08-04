package com.yameokja.mc;

import java.util.List;


import org.apache.ibatis.annotations.Param;

/*import java.util.ArrayList;
import java.util.HashMap;
*/
public interface IUserDAO
{
	public int userLoginCheck(@Param("user_id")String user_id, @Param("user_pw")String user_pw);
	public int idCheck(String user_id);
	public int nickCheck(String user_nick);
	public int joinSend(UserDTO user);
	public int userNumCheck(String user_num);
	public UserDTO searchUserInfo(@Param("user_info")String user_info, @Param("check")String check);
	public UserDTO firstHalf(String user_num);
	public UserDTO secondHalf(String user_num);
	public String searchStoreInfo(String user_num);
	public List<String> searchTasteKeyword(String user_num);
	public List<StoreDTO> searchComparedList(String user_num);
	public List<ReviewDTO> searchRvList(String user_num);
	public List<StoreDTO> searchLikeList(String user_num);
	public List<StoreDTO> searchComparingBox(String user_num);
}
