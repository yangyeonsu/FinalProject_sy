/* ======================================
 	IstDetailDAO_userView.java
 	- storeDetail-userView.jsp 
 ========================================*/

package com.yameokja.mc;

import java.util.ArrayList;

public interface IstDetailDAO_userView
{
	public ArrayList<StoreOpencloseDTO> openClose(int st_num);  	// 영업시간 + 휴무
	public ArrayList<StoreBreaktimeDTO> breakTime(int st_num);	 	// 브레이크 타임
	public ArrayList<StoreDetailDTO> store(int st_num);	     		// 가게이름, 좋아요 수, 별점 평균, 리뷰 수, 전화번호, 주소...
	public int clikeNum(int st_num);							 	// 좋아요 수
	public ArrayList<String> stPay(int st_num);						// 가게 결제수단
	public ArrayList<StoreCheckDTO> stcheck(int st_num);			// 가게 체크박스
	public ArrayList<StoreMenuDTO> menuLists(int st_num);  			// 가게 메뉴, 가격, 이미지링크
	public ArrayList<StoreReviewDTO> reviews(int st_num);  	    	// 리뷰 + 추천/비추천
	public ArrayList<StoreKeyDTO> stKeys(int st_num);  				// 가게 키워드
	public ArrayList<StoreReviewKeyDTO> reviewKeys(int st_num);		// 리뷰 키워드
	public ArrayList<StoreRvPhotoDTO> rvPhoto(int st_num);			// 리뷰 사진
	
	//public ArrayList<stDetailDTO_userView> holiday(int st_num);	 	// 휴일
	//public stDetailDTO_userView stName(int st_num);		        	// 가게 이름
	//public ArrayList<stDetailDTO_userView> others(int st_num);
	//public double creviewScore(int st_num);						 	// 별점 평균
	//public stDetailDTO_userView tel(int st_num);						// 가게 전화번호
	//public stDetailDTO_userView lo(int st_num);						// 가게 주소
	//public int creviewNum(int st_num);							 	// 리뷰 수
}
