package com.yameokja.mc;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IUserSidebarDAO
{
	// 개인이 신고한 리뷰 신고 내역
	public int count_replist(String user_num);
	public List<UserrvreportDTO> user_rv_Report(@Param("user_num") String user_num, @Param("startRow") int startRow, @Param("endRow") int endRow);
	
	// 개인이 요청한 가게정보오류 수정요청 내역
	public int count_relist(String user_num);
	public List<UserStupdaterelistDTO> user_stupdate_relist(@Param("user_num") String user_num, @Param("startRow") int startRow, @Param("endRow") int endRow);
	
	// 개인이 작성한 리뷰에 대한 경고 내역
	public int count_penlist(String user_num);
	public List<penaltyListDTO> user_penList( @Param("user_num") String user_num, @Param("startRow") int startRow, @Param("endRow") int endRow);
	
	
	// 개인이 가게 등/폐업 신청 내역
	public int count_inoutlist(String user_num);

}
