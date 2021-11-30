package com.company.admin.mapper;

import java.util.ArrayList;

import com.company.command.AdminDashboardVO;
import com.company.command.NoticeVO;

public interface AdminMapper {

	public AdminDashboardVO homeCount();
	
	public ArrayList<AdminDashboardVO> homeTopPrivate();
	public ArrayList<AdminDashboardVO> homeTheme();
	
	public ArrayList<AdminDashboardVO> homeRecent();
	public ArrayList<NoticeVO> homeNotice();
	
	
}
