package com.company.admin_point.service;

import java.util.ArrayList;

import com.company.command.AdminPointVO;
import com.company.utill.Criteria;

public interface AdminPointService {
	
	public ArrayList<AdminPointVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
}
