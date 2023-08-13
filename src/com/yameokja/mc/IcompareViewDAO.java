package com.yameokja.mc;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface IcompareViewDAO 
{	
	public ArrayList<StoreDetailDTO> store(List<Integer> stList);	     				// 가게이름, 좋아요 수, 별점 평균, 리뷰 수, 전화번호, 주소...
	public ArrayList<StoreOpencloseDTO> openClose(List<Integer> stList);  				// 영업시간 + 휴무
	public ArrayList<StoreCheckDTO> stcheck(List<Integer> stList);						// 가게 체크박스
	public StoreMenuDTO menuList(int st_num);   					// 가게 메뉴, 평균 가격, 이미지링크
	public ArrayList<StoreMenuDTO> menuAvg(List<Integer> stList);
}
