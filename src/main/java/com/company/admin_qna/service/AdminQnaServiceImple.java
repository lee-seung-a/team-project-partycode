package com.company.admin_qna.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.admin_qna.mapper.AdminQnaMapper;
import com.company.command.FaqBoardVO;
import com.company.command.QnaBoardVO;
import com.company.faqboard.mapper.FaqBoardMapper;
import com.company.utill.Criteria;

@Service("adminqnaService")
public class AdminQnaServiceImple implements AdminQnaService{

	@Autowired
	private AdminQnaMapper adminQnaMapper;
	
	@Override
	public ArrayList<QnaBoardVO> getList(Criteria cri) {
		
		return adminQnaMapper.getList(cri);
	}


	@Override
	public QnaBoardVO getContent(int qno) {

		return adminQnaMapper.getContent(qno);
	}

	@Override
	public boolean Update(QnaBoardVO adminqvo) {

		return adminQnaMapper.Update(adminqvo);
	}

	@Override
	public void adminqnaDelete(int qno) {

		adminQnaMapper.adminqnaDelete(qno);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return adminQnaMapper.getTotal(cri);
	}


	@Override
	public boolean qnamultiDel(int qno) {

		return adminQnaMapper.qnamultiDel(qno);
	}




}
