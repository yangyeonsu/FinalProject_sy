package com.yameokja.mc;

import java.util.ArrayList;

public interface IcompareViewDAO 
{	
	public ArrayList<StoreOpencloseDTO> openClose(int st_num);  	// 영업시간 + 휴무
	public ArrayList<StoreDetailDTO> store(int st_num);	     		// 가게이름, 좋아요 수, 별점 평균, 리뷰 수, 전화번호, 주소...
	public ArrayList<StoreCheckDTO> stcheck(int st_num);			// 가게 체크박스
	public ArrayList<compareViewDTO> menuLists(int st_num);   	// 가게 메뉴, 평균 가격, 이미지링크
	
}
