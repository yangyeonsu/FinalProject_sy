package com.yameokja.mc;

public class Paging
{
	public static String pageIndexList(int currentPage, int totalPage, String actionName)
	{
		// 실제 페이징을 저장할 StringBuffer 변수
		StringBuffer strList = new StringBuffer();
		
		int numPerBlock = 10;
		//-- 페이징 처리 시 게시물 리스트 하단의 숫자를 10개씩 보여주겠다.
		
		int currentPageSetup;
		//-- 현재 페이지(이 페이지를 기준으로 보여주는 숫자가 달라져야 하기 때문...)
		
		int page;
		int n;
		//-- 이전 페이지 블럭과 같은 처리에서 이동하기 위한 변수
		//   (얼마만큼 이동해야 하는지...)
		
		// 페이징 처리가 별도로 필요하지 않은 경우
		//-- 데이터가 즉, 게시물이 존재하지 않아 페이징 처리를 할 필요가 없는 경우
		if (currentPage==0)
			return "";
		
		currentPageSetup = (currentPage / numPerBlock) * numPerBlock;
		
		if (currentPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;
	
		if ((totalPage>numPerBlock) && (currentPageSetup>0))
			strList.append(" <a href='"+actionName+"?pageNum=1' id='1'>1</a>");
		
		n = currentPage - numPerBlock;
		
		if ((totalPage>numPerBlock) && (currentPageSetup>0))
			strList.append(" <a href='"+actionName+"?pageNum="+n+")' id='"+n+"'>Prev</a>");
		
		page = currentPageSetup + 1;
		
		while ((page<=totalPage) && (page<=currentPageSetup+numPerBlock))
		{
			if (page==currentPage)
				// 현재 접속하고 있는 페이지는 클릭이 안되게 하기 위해서 a 태그가 아니라 span 태그로 설정
				strList.append(" <span style='color: orange; font-weight: bold;' m>"+page+"</span>");
			else
				strList.append(" <a href='"+actionName+"?pageNum="+page+")'>"+page+"</a>");
			
			page++;
		}
		
		n = currentPage + numPerBlock;
		
		if ((totalPage-currentPageSetup) > numPerBlock)
			strList.append(" <a href='"+actionName+"?pageNum="+n+")' id='"+n+"'>Next</a>");
		
		// 마지막 페이지(마지막으로)
		if ((totalPage>numPerBlock) && (currentPageSetup+numPerBlock)<totalPage)
			strList.append(" <a href='"+actionName+"?pageNum="+totalPage+")' id='"+totalPage+"'>"+totalPage+"</a>");
		
		// 최종 페이징 처리된 내용 반환
		return strList.toString();
	}
}
