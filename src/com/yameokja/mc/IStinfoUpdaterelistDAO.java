package com.yameokja.mc;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IStinfoUpdaterelistDAO
{
	public int count_relist(String user_num);
	public List<StinfoUpdaterelistDTO> StinfoUpdaterelist(
        @Param("user_num") String user_num,
        @Param("startRow") int startRow,
        @Param("endRow") int endRow
    );
}
