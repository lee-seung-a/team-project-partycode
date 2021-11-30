package com.company.utill;


import lombok.Data;


@Data
public class Criteria {
	
	
	 //데이터베이스에 전달될 클래스  (페이지번호,데이터 개수)
	
	private int pageNum;
	private int amount;
	
	private String searchName;
	private String searchName1;
	private String searchName2;
	private String searchType;
	
	
	//기본으로 생성될 때 초기값을 1,10
	public Criteria() {
		this(1,10);
	}

	//아래생성자를 통해 직접 초기값을 지정가능
	public Criteria(int pageNum , int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
