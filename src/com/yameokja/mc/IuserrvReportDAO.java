package com.yameokja.mc;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IuserrvReportDAO
{
	public int count_replist(String user_num);
	public List<UserrvreportDTO> user_rv_Report(
	        @Param("user_num") String user_num,
	        @Param("startRow") int startRow,
	        @Param("endRow") int endRow
	    );
}
