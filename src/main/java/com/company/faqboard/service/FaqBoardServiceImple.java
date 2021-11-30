package com.company.faqboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.command.FaqBoardVO;
import com.company.faqboard.mapper.FaqBoardMapper;

@Service("faqboardService")
public class FaqBoardServiceImple implements FaqBoardService{

	@Autowired
	private FaqBoardMapper faqBoardMapper;

	@Override
	public ArrayList<FaqBoardVO> getlist() {
		
		return faqBoardMapper.getlist();
	}

	@Override
	public boolean faq_regist(FaqBoardVO fvo) {

		return faqBoardMapper.faq_regist(fvo);
	}

	@Override
	public FaqBoardVO getcontent(int fno) {

		return faqBoardMapper.getcontent(fno);
	}

	@Override
	public void adminfaqDelete(int fno) {

		faqBoardMapper.adminfaqDelete(fno);

	}

	@Override
	public boolean adminfaqUpdate(FaqBoardVO fvo) {
		
		return faqBoardMapper.adminfaqUpdate(fvo);
	}
	
	

}
