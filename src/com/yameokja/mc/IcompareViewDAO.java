package com.yameokja.mc;

import java.util.ArrayList;

public interface IcompareViewDAO 
{
	public ArrayList<compareViewDTO> nameLoCat1(int st_num1);		// 가게, 이름, 카테고리
	public ArrayList<compareViewDTO> scoRe1(int st_num1);			// 별점, 리뷰 수
	public ArrayList<compareViewDTO> openClose1(int st_num1);  		// 영업시간
	public ArrayList<compareViewDTO> others1(int st_num1);			// 옵션 메뉴 : 최대 수용인원
	public ArrayList<compareViewDTO> menuLists1(int st_num1);   	// 가게 메뉴, 가격, 이미지링크
	
	
	public ArrayList<compareViewDTO> nameLoCat2(int st_num2);		// 가게, 이름, 카테고리
	public ArrayList<compareViewDTO> scoRe2(int st_num2);			// 별점, 리뷰 수
	public ArrayList<compareViewDTO> openClose2(int st_num2);  		// 영업시간
	public ArrayList<compareViewDTO> others2(int st_num2);			// 옵션 메뉴 : 최대 수용인원
	public ArrayList<compareViewDTO> menuLists2(int st_num2);   	// 가게 메뉴, 가격, 이미지링크
	
	
	public ArrayList<compareViewDTO> nameLoCat3(int st_num3);		// 가게, 이름, 카테고리
	public ArrayList<compareViewDTO> scoRe3(int st_num3);			// 별점, 리뷰 수
	public ArrayList<compareViewDTO> openClose3(int st_num3);  		// 영업시간
	public ArrayList<compareViewDTO> others3(int st_num3);			// 옵션 메뉴 : 최대 수용인원
	public ArrayList<compareViewDTO> menuLists3(int st_num3);   	// 가게 메뉴, 가격, 이미지링크
	
}
