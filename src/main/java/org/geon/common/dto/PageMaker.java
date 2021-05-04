package org.geon.common.dto;


import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageMaker {

	private boolean prev;
	private boolean next;
	private int start;
	private int end;
	private PageDTO pageInfo;
	private int total;
	private int lastPage;
	
	
	public PageMaker(PageDTO pageInfo, int total) {
		// 총 데이터 개수
		this.total = total;
		this.pageInfo = pageInfo;
		
		int perSheet = pageInfo.getPerSheet();
		
		// 현재 페이지 번호
		double currentPage = (double)pageInfo.getPage();
		
		// System.out.println("currentPage : " + currentPage);
		// System.out.println("perSheet : " + perSheet);
		
		// 임시 마지막 번호 13 -> 1.3 -> 2.0 -> 20
		int tempEnd = (int)(Math.ceil(currentPage * 0.1) * 10);
		// System.out.println("tempEnd : " + tempEnd);
		
		this.start = tempEnd - 9;
		
		// 진짜 마지막 페이지 131
		int realEnd = (int)(Math.ceil(total / (double)perSheet));
		
		// 더 작은 값이 end 가 된다.
		this.end = realEnd < tempEnd ? realEnd : tempEnd;
		
		this.prev = start > 1;
		
		this.next = end * perSheet < total;  
		
		this.lastPage = (int)(Math.ceil(total / (double)perSheet));		
	}
	
	public String getLink(int page) {
		return "page=" + page + "&perSheet=" + this.pageInfo.getPerSheet();
	}
}