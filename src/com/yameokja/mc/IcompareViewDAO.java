package com.yameokja.mc;

import java.util.ArrayList;

public interface IcompareViewDAO 
{	
	public ArrayList<compareViewDTO> nameLoCat(int st_num);		// 가게, 이름, 카테고리
	public ArrayList<compareViewDTO> scoRe(int st_num);			// 별점, 리뷰 수
	public ArrayList<compareViewDTO> openClose(int st_num);  		// 영업시간
	public ArrayList<compareViewDTO> others(int st_num);			// 옵션 메뉴 : 최대 수용인원
	public ArrayList<compareViewDTO> menuLists(int st_num);   	// 가게 메뉴, 가격, 이미지링크
	
}
