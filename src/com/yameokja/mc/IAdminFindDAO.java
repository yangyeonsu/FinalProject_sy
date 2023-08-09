package com.yameokja.mc;

public interface IAdminFindDAO
{
	// rep_apply_num으로 요청내용 찾기
	public RvApplyViewDTO rvSearch(int rep_apply_num);
	// req_apply_num으로 요청내용 찾기
	public ReqApplyViewDTO accuSearch(int req_apply_num);
	// obj_apply_num으로 요청내용 찾기
	public ObjApplyViewDTO objSearch(int obj_apply_num);
	// 패널티회수 요청한 가게로 요청내용 찾기
	
	// 가게 등폐업 요청한 가게로 요청내용 찾기
}
