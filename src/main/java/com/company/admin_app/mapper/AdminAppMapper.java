package com.company.admin_app.mapper;

import java.util.ArrayList;

import com.company.command.PartyBoardVO;
import com.company.command.QnaBoardVO;
import com.company.utill.Criteria;

public interface AdminAppMapper {
	
	public ArrayList<PartyBoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public boolean Update(PartyBoardVO adminpvo);

	public PartyBoardVO getContent(int pno);

}
