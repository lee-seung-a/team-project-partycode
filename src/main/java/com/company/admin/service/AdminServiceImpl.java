package com.company.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.admin.mapper.AdminMapper;
import com.company.command.AdminDashboardVO;
import com.company.command.NoticeVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public ArrayList<NoticeVO> homeNotice() {
		
		return adminMapper.homeNotice();
	}

	@Override
	public AdminDashboardVO homeCount() {
		
		return adminMapper.homeCount();
	}

	@Override
	public ArrayList<AdminDashboardVO> homeTheme() {
		
		return adminMapper.homeTheme();
	}

	@Override
	public ArrayList<AdminDashboardVO> homeTopPrivate() {

		return adminMapper.homeTopPrivate();
	}

	@Override
	public ArrayList<AdminDashboardVO> homeRecent() {
		
		return adminMapper.homeRecent();
	}

	
}
