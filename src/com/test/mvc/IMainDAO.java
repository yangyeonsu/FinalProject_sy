package com.test.mvc;

import java.util.ArrayList;
import java.util.List;

public interface IMainDAO
{
	// 해당하는 ST_NUM 의 가게정보 리스트 출력 메소드
	public ArrayList<StoreDTO> getStoreList(List<Integer> st_list);
	
	// IbmatKeyword 겹치는 5개의 가게번호 리스트 출력 메소드
	public List<Integer> getIbmatStNumber();
	
	// 찜 겹치는 5개의 가게번호 리스트 출력 메소드
	public List<Integer> getJjimStNumber();
	
	// 추천 5개의 가게번호 리스트 출력 메소드
	public List<Integer> getHotStNumber();
	
	// 검색 후 가게번호 리스트 출력 메소드
	public ArrayList<StoreDTO> getStoreSearchList();
}