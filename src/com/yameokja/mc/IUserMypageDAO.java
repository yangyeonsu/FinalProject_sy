package com.yameokja.mc;

import java.util.ArrayList;

public interface IUserMypageDAO
{
	// 닉네임 포인트 키워드
	public ArrayList<UserMypageDTO> usermp_ni();
	
	// 비교했던 가게 목록
	public ArrayList<UserMypageDTO> usermp_risonstlist();
	
	// 리뷰목록
	public ArrayList<UserMypageDTO> usermp_rvlist();
	
	// 찜 목록
	public ArrayList<UserMypageDTO> usermp_likelist();
	
	// 비교함
	public ArrayList<UserMypageDTO> usermp_compare_box();
	
	// 키워드
	public ArrayList<UserMypageDTO> usermp_ukeyword();
	
	// 포인트
	public ArrayList<UserMypageDTO> usermp_point1();
	// 포인트
	public ArrayList<UserMypageDTO> usermp_point2();
	
	// 등급
	public ArrayList<UserMypageDTO> usermp_grade1();
	// 등급
	public ArrayList<UserMypageDTO> usermp_grade2();
}
