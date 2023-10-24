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
	
	// 이의제기
	public int findReqProNum(int req_apply_num);
	public int objapply(@Param("req_process_num")int req_process_num, @Param("obj_rs")String obj_rs);
	
	// 패널티회수신청
	public int findPenNum(int req_apply_num);
	public int revoapply(@Param("pen_grant_num")int pen_grant_num, @Param("st_chbox_num")int st_chbox_num, @Param("revo_rs")String revo_rs);
	
	
	public int count_objlist(String user_num);
	public List<ReportListDTO> stobjlist(
        @Param("user_id") String user_id,
        @Param("startRow") int startRow,
        @Param("endRow") int endRow
    );
	
	
	public int count_revolist(String user_num);
	public List<ReportListDTO> strevolist(
        @Param("user_id") String user_id,
        @Param("startRow") int startRow,
        @Param("endRow") int endRow
    );
}
