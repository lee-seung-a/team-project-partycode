package com.company.admin.service;

import java.util.ArrayList;

import com.company.command.AdminDashboardVO;
import com.company.command.NoticeVO;


public interface AdminService {

	public AdminDashboardVO homeCount();
	
	public ArrayList<AdminDashboardVO> homeTopPrivate();
	public ArrayList<AdminDashboardVO> homeTheme();
	
	public ArrayList<AdminDashboardVO> homeRecent();
	public ArrayList<NoticeVO> homeNotice();
	
}


