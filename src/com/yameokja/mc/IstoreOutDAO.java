package com.yameokja.mc;

import org.apache.ibatis.annotations.Param;

public interface IstoreOutDAO 
{
	// 가게 폐업 추가
	public Integer placeNum(@Param("user_num") String user_num, @Param("st_num") Integer st_num);
	public int st_Out_apply(@Param("user_num") String user_num, @Param("st_num") Integer st_num);

	
}
