package com.company.utill;

import lombok.Data;

@Data
public class PageVO {
	
	//화면에 그려질 페이지 네이션을 계산하는 클래스10
	
	private int startPage;//시작번호
	private int endPage;//끝번호
	private boolean prev;//이전버튼
	private boolean next;//다음버튼
	
	private int total;//전체 게시글 수
	
	private Criteria cri; //조회페이지 번호, 화면에 그려질 데이터개수
	
	private int pageNum;
	private int amount;
 
	//생성자는 cri,total를 받아서 생성하도록 선언
	public PageVO(Criteria cri, int total) {
		this.cri = cri;
		this.total=total;
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		
		//계산처리
		//1.endPage계산
		//pageNum가 11을 가르키면 =>20, pageNum 25를 가리키면->30,pageNum
		//공식=(int)Math.ceil(조회페이지번호/페이지네이션개수)*(페이지네이션개수)
		
		this.endPage = (int)Math.ceil(this.pageNum/ 10.0)*10;
		//2.startPage 계산
		
		this.startPage = this.endPage -10+1;
		
		
		//3.realEnd(실제끝번호)
		//총게시글수가 53개라면 => 맨끝번호는 6
		//총게시글수가 121개라면 -> 맨끝번호는 13
		//공식=(int)Math.ceil(총게시글수/화면에그려질 데이터수)
		int realEnd = (int)Math.ceil(this.total/(double)this.amount);
		
		//4.끝번호의 결정
		
		//데이터 404개라면? realEnd =41
		//1번페이지 조회할 때,  endPage =10  ->endPage
		//41번 페이지 조회할때, endPage =50 -> realEnd
		
		if(this.endPage>=realEnd) {
			this.endPage=realEnd;
		}
		
		//5.이전버튼 활성화 YN
		//starPage = 1, 11, 21,31...
		this.prev = this.startPage >1;
		
		//6.다음버튼 활성화YN (4번예시에서 비교하여 계산)
		
		this.next = realEnd >this.endPage;
		
		
	}
	
	
	
	
	

}
