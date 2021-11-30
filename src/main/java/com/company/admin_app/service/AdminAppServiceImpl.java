package com.company.admin_app.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.admin_app.mapper.AdminAppMapper;
import com.company.command.PartyBoardVO;
import com.company.utill.Criteria;

@Service("adminappService")
public class AdminAppServiceImpl implements AdminAppService{

	@Autowired
	private AdminAppMapper adminAppMapper;
	
	@Override
	public ArrayList<PartyBoardVO> getList(Criteria cri) {

		return adminAppMapper.getList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		return adminAppMapper.getTotal(cri);
	}

	@Override
	public boolean Update(PartyBoardVO adminpvo) {

		return adminAppMapper.Update(adminpvo);
	}

	@Override
	public PartyBoardVO getContent(int pno) {

		return adminAppMapper.getContent(pno);
	}

}
