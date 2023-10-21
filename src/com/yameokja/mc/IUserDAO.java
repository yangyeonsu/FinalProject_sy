package com.yameokja.mc;

import java.util.List;


import org.apache.ibatis.annotations.Param;

/*import java.util.ArrayList;
import java.util.HashMap;
*/
public interface IUserDAO
{
	public int userLoginCheck(@Param("user_id")String user_id, @Param("user_pw")String user_pw);
	public int userPwCheck(@Param("user_num")String user_num, @Param("user_pw")String user_pw);
	public int idCheck(String user_id);
	// 닉네임중복확인
	public int nickCheck(String user_nick);
	public int joinSend(UserDTO user);
	public int userNumCheck(String user_num);
	
	public int storeCheck(String user_num);
	
	public UserDTO searchUserInfo(@Param("user_info")String user_info, @Param("check")String check);
	public UserDTO firstHalf(String user_num);
	public UserDTO secondHalf(String user_num);
	
	public UserDTO userModify(String user_num);
	
	public String searchStoreInfo(String user_num);
	
	// 입맛 키워드 범례
	public List<TasteLabelDTO> tasteKeyword();
	
	// 사용자 입맛 키워드
	public List<TasteLabelDTO> searchTasteKeyword(@Param("user_num") String user_num);
	
	// 사용자 비교했던 내역
	public List<StoreDTO> searchComparedList(String user_num);
	
	// 사용자 작성 리뷰 리스트
	public List<ReviewDTO> searchRvList(String user_num);
	
	// 사용자 찜한 내역
	public List<StoreDTO> searchLikeList(String user_num);
	
	//public List<StoreDTO> searchComparingBox(String user_num);
	
	public List<AlarmDTO> userAlarm(String user_num);
	
	// (ajax)닉네임중복검사
	public int nickName(@Param("nickName") String nickName);
	
	// 개인정보수정에서 회원정보수정
	//public int userInfoModify(@Param("user_num") String user_num, @Param("user_pw") String user_pw, @Param("user_nickname") String user_nickname, @Param("user_email") String user_email);

	// 개인정보수정에서 입맛키워드 삭제
	public int userIbmatDelete(@Param("user_num") String user_num);
	
	// 개인정보수정에서 입맛키워드 입력
	public int userIbmatInsert(@Param("user_num") String user_num, @Param("taste_num") int taste_num);

	// 개인정보수정에서 비밀번호 update
	public int userPwUpdate(@Param("user_num") String user_num, @Param("user_pw") String user_pw);
	
	// 개인정보수정에서 닉네임 update
	public int userNicknameUpdate(@Param("user_num") String user_num, @Param("user_nickname") String user_nickname);	
	
	// 개인정보수정에서 이메일 update
	public int userEmailUpdate(@Param("user_num") String user_num, @Param("user_email") String user_email);
	
	// 가게로 들어온 정보 수정 요청 확인
	public int reqstAlarmCk(int check_num);
	
	// 회원이 요청한 이의제기 신청 처리 확인
	public int objproAlarmCk(int check_num);

	// 신청한 가게 정보 수정 요청의 처리 결과가 달라짐 확인
	public int reqrejAlarmCk(int check_num);
	
	// 작성한 리뷰 신고 알림 확인
	public int accuapplyAlarmCk(int check_num);
	
	// 작성한 리뷰 신고 처리 알림 확인
	public int accuproAlarmCk(int check_num);
	
	// 요청한 가게 정보 수정 요청 처리 확인
	public int reqAlarmCk(int check_num);
	
	// 신고한 리뷰 처리 확인
	public int repAlarmCk(int check_num);

	// 패널티 회수 요청 처리 확인
	public int penaltyAlarmCk(int check_num);
	
	// 가게 등록 요청 처리 확인
	public int inAlarmCk(int check_num);
	
	// 가게 폐업 요청 처리 확인
	public int outAlarmCk(int check_num);
}
