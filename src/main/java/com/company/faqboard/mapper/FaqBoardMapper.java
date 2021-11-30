package com.company.faqboard.mapper;

import java.util.ArrayList;

import com.company.command.FaqBoardVO;

public interface FaqBoardMapper {
	
	public ArrayList<FaqBoardVO> getlist();
	
	public boolean faq_regist(FaqBoardVO fvo); //µî·Ï

	public FaqBoardVO getcontent(int fno);
	
	public void adminfaqDelete(int fno);
	
	public boolean adminfaqUpdate(FaqBoardVO fvo);







}
