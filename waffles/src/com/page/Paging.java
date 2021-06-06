package com.page;

public class Paging {

	public Paging() {
		
	}
	
	//전체 페이지 수 구하기
	//전체 데이터 갯수, 한 페이지당 보여질 게시물 갯수
	public int getPageCount(int dataCount, int showData) {
		int pageCount = 0;
		pageCount = dataCount/showData;
		
		//나머지가 0이 아니면 1페이지 추가
		if((dataCount % showData) != 0) {
			pageCount++;
		}
		return pageCount;
	}

	//페이지의 게시물 시작번호, 끝번호 계산
	public void setPageRange(int curPage, int showData) {
		//시작번호 = (현재페이지 - 1) * 페이지당 게시물수 + 1
		int pageBegin = (curPage -1) * showData+1;
		//끝번호 = 시작번호 + 페이지당 게시물수 - 1
		int pageEnd = pageBegin + showData-1;
	}
	


//    int prevPage;    //이전 페이지
//    int nextPage;    //다음 페이지
//    int totPage;    //전체 페이지 갯수
//    int totBlock;     //전체 페이지블록 갯수
//    int curBlock;     //현재 블록
//    int prevBlock;     //이전 블록
//    int nextBlock;     //다음 블록
//    int blockBegin; //블록의 시작페이지 번호
//    int blockEnd;     //블록의 끝페이지 번호
	
    
    
	
	
	
	//전체 페이지 블록수 = 전체페이지 갯수 / 블록단위
	//현재 페이지가 속한 블록 = (현재 페이지 - 1) / 페이지 블록 단위 + 1
			
	//페이지 블록의 시작번호 = (현재블록 - 1) * 블록단위 + 1
			
	//페이지 블록의 끝번호 = 블록 시작번호 + 블록단위 - 1
			
	
	
	
}
