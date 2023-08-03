package com.yameokja.mc;

import java.util.ArrayList;

public interface IAdminMainDAO
{
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
