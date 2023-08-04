package com.yameokja.mc;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IAdminMainDAO
{
	// 관리자 로그인 확인
	public int adminLoginCheck(@Param("admin_id")String admin_id, @Param("admin_pw")String admin_pw);
	// 관리자 번호 찾기
	public AdminDTO searchNum(@Param("admin_info")String admin_info, @Param("check")String check);
	// 리뷰신고요청 리스트
	public ArrayList<rvListDTO> rvList();
	// 정보수정요청 리스트
	public ArrayList<reqListDTO> reqList();
	// 이의제기 리스트
	public ArrayList<objListDTO> objList();
	// 패널티회수요청 리스트
	public ArrayList<revoListDTO> revoList();
	// 가게 등폐업요청 리스트
	public ArrayList<inoutListDTO> inoutList();
}
