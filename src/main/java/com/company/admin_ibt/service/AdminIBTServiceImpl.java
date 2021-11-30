package com.company.admin_ibt.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.admin_ibt.mapper.AdminIBTMapper;
import com.company.command.IboughtthisVO;


@Service("adminIBTService")
public class AdminIBTServiceImpl implements AdminIBTService{

	@Autowired
	private AdminIBTMapper adminIBTMapper;

	@Override
	public ArrayList<IboughtthisVO> reservList(int uno) {
		
		return adminIBTMapper.reservList(uno);
	}
	
	


}
