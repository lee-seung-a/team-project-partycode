package com.company.admin_point.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.admin_point.mapper.AdminPointMapper;
import com.company.command.AdminPointVO;
import com.company.utill.Criteria;

@Service("adminPointService")
public class AdminPointServiceImpl implements AdminPointService{

	@Autowired
	private AdminPointMapper adminPointMapper;
	
	@Override
	public ArrayList<AdminPointVO> getList(Criteria cri) {
		
		return adminPointMapper.getList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return adminPointMapper.getTotal(cri);
	}

	


}
