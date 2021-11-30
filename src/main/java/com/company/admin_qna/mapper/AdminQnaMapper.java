package com.company.admin_qna.mapper;

import java.util.ArrayList;

import com.company.command.FaqBoardVO;
import com.company.command.QnaBoardVO;
import com.company.utill.Criteria;

public interface AdminQnaMapper {
	
	public ArrayList<QnaBoardVO> getList(Criteria cri);	
	
	public QnaBoardVO getContent (int qno);
	
	public boolean Update(QnaBoardVO adminqvo);
	
	public void adminqnaDelete(int qno);

	public int getTotal(Criteria cri);
	
	public boolean qnamultiDel(int qno);
	


}
