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
	
	public ReqApplyViewDTO reqRs(int req_apply_num);
	
	public int findReqProNum(int req_apply_num);
	public int objapply(@Param("req_process_num")int req_process_num, @Param("obj_rs")String obj_rs);
	
}
