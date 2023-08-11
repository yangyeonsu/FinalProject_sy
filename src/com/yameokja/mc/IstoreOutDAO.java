package com.yameokja.mc;

import org.apache.ibatis.annotations.Param;

public interface IstoreOutDAO 
{
	// 가게 폐업 추가
	public int st_Out_apply(storeOutDTO dto);
	public int placeNum(@Param("user_num") int user_num, @Param("st_num") int st_num);
	
}
