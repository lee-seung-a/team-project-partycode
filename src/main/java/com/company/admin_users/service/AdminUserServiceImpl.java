package com.company.admin_users.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.admin_users.mapper.AdminUsersMapper;
import com.company.command.IboughtthisVO;
import com.company.command.UsersVO;
import com.company.utill.Criteria;


@Service("adminUsersService")
public class AdminUserServiceImpl implements AdminUsersService{

	@Autowired
	private AdminUsersMapper adminUsersMapper;

	
	@Override
	public ArrayList<UsersVO> inquiryList(Criteria cri) {
		
		return adminUsersMapper.inquiryList(cri);
	}

	@Override
	public UsersVO updateListDetail(int uno) {
		
		return adminUsersMapper.updateListDetail(uno);
	}

	@Override
	public boolean update(UsersVO vo) {
		
		return adminUsersMapper.update(vo);
	}

	@Override
	public boolean delete(int uno) {
		
		return adminUsersMapper.delete(uno);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return adminUsersMapper.getTotal(cri);
	}



	

}
