package com.yameokja.mc;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IpenaltyListDAO
{
	public List<penaltyListDTO> penList(
        @Param("user_num") String user_num,
        @Param("startRow") int startRow,
        @Param("endRow") int endRow
    );
}
