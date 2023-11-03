package com.yameokja.mc;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IUserstupdaterelistDAO
{
	public int count_relist(String user_num);
	public List<UserStupdaterelistDTO> user_stupdate_relist(
        @Param("user_num") String user_num,
        @Param("startRow") int startRow,
        @Param("endRow") int endRow
    );
}
