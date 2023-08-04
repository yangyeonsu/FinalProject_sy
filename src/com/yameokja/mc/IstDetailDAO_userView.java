/* ======================================
 	IstDetailDAO_userView.java
 	- storeDetail-userView.jsp 
 ========================================*/

package com.yameokja.mc;

import java.util.ArrayList;

public interface IstDetailDAO_userView
{
	public ArrayList<stDetailDTO_userView> openClose(int st_num);  // 영업시간
	public ArrayList<stDetailDTO_userView> breakTime(int st_num);	 // 브레이크 타임
	public ArrayList<stDetailDTO_userView> holiday(int st_num);	 // 휴일
	public ArrayList<stDetailDTO_userView> store(int st_num);	     // 가게이름, 좋아요 수, 별점 평균, 리뷰 수, 전화번호, 주소 합침
	public stDetailDTO_userView stName(int st_num);		         // 가게 이름
	public int clikeNum(int st_num);							 // 좋아요 수
	public double creviewScore(int st_num);						 // 별점 평균
	public int creviewNum(int st_num);							 // 리뷰 수
	public stDetailDTO_userView tel(int st_num);								 // 가게 전화번호
	public stDetailDTO_userView lo(int st_num);								 	 // 가게 주소
	public ArrayList<stDetailDTO_userView> others(int st_num);
	public ArrayList<stDetailDTO_userView> menuLists(int st_num);  // 가게 메뉴, 가격, 이미지링크
	public ArrayList<stDetailDTO_userView> stKeys(int st_num);  	 // 가게 키워드
	public ArrayList<stDetailDTO_userView> reViews(int st_num);  	 // 가게 키워드
	
}
