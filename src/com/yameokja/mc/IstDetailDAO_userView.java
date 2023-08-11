/* ======================================
 	IstDetailDAO_userView.java
 	- storeDetail-userView.jsp 
 ========================================*/

package com.yameokja.mc;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IstDetailDAO_userView
{
<<<<<<< Updated upstream
	public ArrayList<StoreOpencloseDTO> openClose(int st_num);  			// 영업시간 + 휴무
	public ArrayList<StoreBreaktimeDTO> breakTime(int st_num);	 			// 브레이크 타임
	public ArrayList<StoreDetailDTO> store(int st_num);	     				// 가게이름, 좋아요 수, 별점 평균, 리뷰 수, 전화번호, 주소...
	public int clikeNum(int st_num);							 			// 좋아요 수
	public ArrayList<String> stPay(int st_num);								// 가게 결제수단
	public ArrayList<StoreCheckDTO> stcheck(int st_num);					// 가게 체크박스
	public ArrayList<StoreMenuDTO> menuLists(int st_num);  					// 가게 메뉴, 가격, 이미지링크
	public ArrayList<StoreReviewDTO> reviews(int st_num);  	    			// 리뷰 + 추천/비추천
	public ArrayList<StoreKeyDTO> stKeys(int st_num);  						// 가게 키워드
	public ArrayList<StoreReviewKeyDTO> reviewKeys(int st_num);				// 리뷰 키워드
	public ArrayList<StoreRvPhotoDTO> rvPhoto(int st_num);					// 리뷰 사진
	public ArrayList<userRvRecDTO> userReviewList(@Param("st_num") int st_num, @Param("user_num") String user_num);	// 특정 유저가 가게의 리뷰에 누른 추천/비추천 내역
=======
	public ArrayList<StoreOpencloseDTO> openClose(int st_num);  	// 영업시간 + 휴무
	public ArrayList<StoreBreaktimeDTO> breakTime(int st_num);	 	// 브레이크 타임
	public ArrayList<StoreDetailDTO> store(int st_num);	     		// 가게이름, 좋아요 수, 별점 평균, 리뷰 수, 전화번호, 주소...
	public int clikeNum(int st_num);							 	// 좋아요 수
	
	public ArrayList<StoreMenuDTO> menuLists(int st_num);  			// 가게 메뉴, 가격, 이미지링크
	public ArrayList<StoreReviewDTO> reviews(int st_num);  	    	// 리뷰 + 추천/비추천
	public ArrayList<StoreKeyDTO> stKeys(int st_num);  				// 가게 키워드
	public ArrayList<StoreReviewKeyDTO> reviewKeys(int st_num);		// 리뷰 키워드
	
	public int reviewInsert(int st_num, String user_num, String rv_content		// 리뷰 등록
							, int star_score);
>>>>>>> Stashed changes
	
	
	// 리뷰 신고
	public int reviewRepInsert(@Param("rv_num") int rv_num, @Param("user_num") String user_num, @Param("rep_rs_num") int rep_rs_num);	
	// 리뷰 식별
	public String searchRec(@Param("rv_num") int rv_num, @Param("user_num") String user_num);
	// 리뷰 추천/비추천 등록
	public int reviewRecInsert(@Param("rv_num") int rv_num, @Param("user_num") String user_num, @Param("rec_nonrec_number") int rec_nonrec_number);
	// 리뷰 추천/비추천 삭제
	public int reviewRecRemove(@Param("rv_num") int rv_num, @Param("user_num") String user_num, @Param("rec_nonrec_number") int rec_nonrec_number);
	// 리뷰 추천/비추천 수정
	public int reviewRecModify(@Param("rv_num") int rv_num, @Param("user_num") String user_num, @Param("rec_nonrec_number") int rec_nonrec_number);
	// 리뷰 추천/비추천 카운트
	public int reviewRecCount(@Param("rv_num") int rv_num,@Param("rec_nonrec_number") int rec_nonrec_number);

}
