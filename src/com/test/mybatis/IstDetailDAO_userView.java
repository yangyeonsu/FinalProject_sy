/* ======================================
 	IstDetailDAO_userView.java
 	- storeDetail-userView.jsp 
 ========================================*/

package com.test.mybatis;

import java.util.ArrayList;

public interface IstDetailDAO_userView
{
	public ArrayList<stDetailDTO_userView> openClose();  // 영업시간
	public ArrayList<stDetailDTO_userView> breakTime();	 // 브레이크 타임
	public ArrayList<stDetailDTO_userView> holiday();	 // 휴일
	public ArrayList<stDetailDTO_userView> store();	     // 가게이름, 좋아요 수, 별점 평균, 리뷰 수, 전화번호, 주소 합침
	public stDetailDTO_userView stName();		         // 가게 이름
	public int clikeNum();							 // 좋아요 수
	public double creviewScore();						 // 별점 평균
	public int creviewNum();							 // 리뷰 수
	public stDetailDTO_userView tel();								 // 가게 전화번호
	public stDetailDTO_userView lo();								 	 // 가게 주소
	public ArrayList<stDetailDTO_userView> others();
	public ArrayList<stDetailDTO_userView> menuLists();  // 가게 메뉴, 가격, 이미지링크
	public ArrayList<stDetailDTO_userView> stKeys();  	 // 가게 키워드
	public ArrayList<stDetailDTO_userView> reViews();  	 // 가게 키워드
	
}
