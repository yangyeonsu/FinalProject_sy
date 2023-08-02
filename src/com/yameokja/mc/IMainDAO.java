package com.yameokja.mc;

import java.util.ArrayList;
import java.util.List;

public interface IMainDAO
{
	// 해당하는 ST_NUM 의 가게정보 리스트 출력 메소드
	public ArrayList<StoreDTO> getStoreList(List<Integer> stList);
	
	// IbmatKeyword 겹치는 5개의 가게번호 리스트 출력 메소드
	public List<Integer> getIbmatStNumber();
	
	// 찜 겹치는 5개의 가게번호 리스트 출력 메소드
	public List<Integer> getJjimStNumber();
	
	// 추천 5개의 가게번호 리스트 출력 메소드
	public List<Integer> getHotStNumber();
	
	// 검색 키워드 스플릿해오는 메소드
	public List<String> getSearchKeyword(String keyword);
	
	// 검색 후 가게번호 리스트 출력 메소드
	public List<Integer> getStoreSearchList(String keyword);
	
	// 비교함 가게정보 리스트 출력 메소드
	public List<Integer> getStoreComList(String user_num);
	
	// 2차 검색 가게번호 리스트 출력 메소드
	public List<Integer> getSecondSearchList();
}