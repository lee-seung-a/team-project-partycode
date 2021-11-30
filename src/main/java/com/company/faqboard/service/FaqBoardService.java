package com.company.faqboard.service;

import java.util.ArrayList;

import com.company.command.FaqBoardVO;

public interface FaqBoardService {
	
	public ArrayList<FaqBoardVO> getlist();
	
	public boolean faq_regist(FaqBoardVO fvo); //µî·Ï
	
	public FaqBoardVO getcontent(int fno);
	
	public void adminfaqDelete(int fno);
	
	public boolean adminfaqUpdate(FaqBoardVO fvo);






}
