package com.company.boughtthis.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.boughtthis.mapper.BoughtThisMapper;
import com.company.command.IboughtthisVO;
import com.company.command.PartyBoardVO;
import com.company.command.UsersVO;

@Service("boughtthisService")
public class BoughtThisServiceImpl implements BoughtThisService {
	
	@Autowired
	private BoughtThisMapper boughtthisMapper;

	@Override
	public boolean insertibt(IboughtthisVO vo) {
		
		return boughtthisMapper.insertibt(vo);
	}

	@Override
	public boolean deleteibt(IboughtthisVO vo) {
		// TODO Auto-generated method stub
		return boughtthisMapper.deleteibt(vo);
	}

	@Override
	public boolean chargeibt(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boughtthisMapper.chargeibt(map);
	}

	@Override
	public boolean deletepointlog(IboughtthisVO vo) {
		// TODO Auto-generated method stub
		return boughtthisMapper.deletepointlog(vo);
	}

	

	
}
