package com.yameokja.mc;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IStinfoUpdaterelistDAO
{
	public int count_relist(String user_num);
	public List<StinfoUpdaterelistDTO> stinfoupdatelist(
        @Param("user_num") String user_num,
        @Param("startRow") int startRow,
        @Param("endRow") int endRow
    );
	
	public int count_inoutlist(String user_num);
	public List<StInoutDTO> stinoutlist(
	        @Param("user_num") String user_num,
	        @Param("startRow") int startRow,
	        @Param("endRow") int endRow
	);
}
