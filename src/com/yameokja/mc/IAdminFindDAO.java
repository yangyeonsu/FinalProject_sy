package com.yameokja.mc;

public interface IAdminFindDAO
{
	// 리뷰신고 요청자로 요청내용 찾기
	public RvApplyViewDTO rv_search(String user_id);
	// 정보수정 요청자로 요청내용 찾기
	public ReqApplyViewDTO accu_search(String user_id);
	// 이의제기 요청한 가게로 요청내용 찾기
	public ObjApplyViewDTO obj_search(String user_id);
	// 패널티회수 요청한 가게로 요청내용 찾기
	
	// 가게 등폐업 요청한 가게로 요청내용 찾기
}
