package com.company.admin_app.service;

import java.util.ArrayList;

import com.company.command.PartyBoardVO;
import com.company.utill.Criteria;

public interface AdminAppService {
	
	public ArrayList<PartyBoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);

	public boolean Update(PartyBoardVO adminpvo);

	public PartyBoardVO getContent(int pno);


}
