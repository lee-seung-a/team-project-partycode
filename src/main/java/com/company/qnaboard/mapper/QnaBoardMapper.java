package com.company.qnaboard.mapper;

import java.util.ArrayList;

import com.company.command.QnaBoardVO;
import com.company.utill.Criteria;

public interface QnaBoardMapper {

	public ArrayList<QnaBoardVO> getList(Criteria cri);	
	public boolean regist(QnaBoardVO qnavo);	
	public QnaBoardVO qna_detail(int qno);		
	public void qna_delete(int qno);			
	public int getTotal(Criteria cri);

}
