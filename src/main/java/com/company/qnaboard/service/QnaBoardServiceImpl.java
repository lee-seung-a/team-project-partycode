package com.company.qnaboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.command.QnaBoardVO;
import com.company.qnaboard.mapper.QnaBoardMapper;
import com.company.utill.Criteria;

@Service("qnaboardService")
public class QnaBoardServiceImpl implements QnaBoardService{

	
	@Autowired
	private QnaBoardMapper qnaBoardMapper;


	@Override
	public ArrayList<QnaBoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return qnaBoardMapper.getList(cri);
	}
	@Override
	public boolean regist(QnaBoardVO qnavo) {

		return qnaBoardMapper.regist(qnavo);
	}

	@Override
	public QnaBoardVO qna_detail(int qno) {

		return qnaBoardMapper.qna_detail(qno);
	}

	@Override
	public void qna_delete(int qno) {

		qnaBoardMapper.qna_delete(qno);
	}
	@Override
	public int getTotal(Criteria cri) {
		
		return qnaBoardMapper.getTotal(cri);
	}

	
		
	
}

