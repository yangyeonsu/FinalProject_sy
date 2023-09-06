package com.yameokja.mc;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

public interface IMainDAO
{
	// 해당하는 ST_NUM 의 가게정보 리스트 출력 메소드
	public ArrayList<StoreDTO> getStoreList(List<Integer> stList);
	
	// IbmatKeyword 겹치는 5개의 가게번호 리스트 출력 메소드
	public List<Integer> getIbmatStNumber(String user_num);
	
	// 찜 겹치는 5개의 가게번호 리스트 출력 메소드
	public List<Integer> getJjimStNumber(String user_num);
	
	// 추천 5개의 가게번호 리스트 출력 메소드
	public List<Integer> getHotStNumber();
	
	// 검색 후 가게번호 리스트 출력 메소드
	public List<Integer> getStoreSearchList(String keyword);
	
	// 비교함 가게정보 리스트 출력 메소드
	public List<Integer> getStoreComList(String user_num);
	
	// 2차 검색 가게번호 리스트 출력 메소드
	public List<Integer> getSecondSearchList();
	
	// 지역 범례 리스트 출력 메소드
	public List<RegionDTO> regionList();
	
	// 카테고리 범례 리스트 출력 메소드
	public List<FoodLabelDTO> foodLabelList();
	
	// 가게키워드 범례 리스트 출력 메소드
	public List<StKeyDTO> stKeyList();
	
	// 비교함에 해당 가게가 존재하는지 찾는 메소드 => 1 또는 0반환
	public int comparingSearch(@Param("user_num")String user_num, @Param("st_num") int st_num);
	
	// 비교함 insert 메소드
	public int comparingInsert(@Param("user_num")String user_num, @Param("st_num") int st_num);
	
	// 비교함 delete 메소드
	public int comparingDelete(@Param("user_num") String user_num, @Param("st_num") int st_num);
	
	// 해당 사용자가 찜한 가게 리스트 출력 메소드
	public List<Integer> userJjimSearch(@Param("user_num") String user_num);
	
	// 찜 목록에 해당 가게가 존재하는지 찾는 메소드 => 1 또는 0 반환
	public int jjimSearch(@Param("user_num") String user_num, @Param("st_num") int st_num);
	
	// 찜 목록에 가게 추가하는 메소드
	public int jjimInsert(@Param("user_num") String user_num, @Param("st_num") int st_num);
	
	// 해당 사용자가 당일 찜한 목록의 갯수 출력 메소드
	public int jjimTodayCount(@Param("user_num") String user_num);
	
	// 찜 목록에 가게 삭제하는 메소드
	public int jjimDelete(@Param("user_num") String user_num, @Param("st_num") int st_num);
	
	// 2차 필터 검색 메소드
	public ArrayList<Integer> filterSearchList(@Param("regionCbList") String[] regionCbList, @Param("catCbList") String[] catCbList
			, @Param("stKeyCbList") String[] stKeyCbList, @Param("finalKeyword") List<Integer> finalKeyword);
}