package com.company.admin_point.mapper;

import java.util.ArrayList;

import com.company.command.AdminPointVO;
import com.company.utill.Criteria;

public interface AdminPointMapper {

	public ArrayList<AdminPointVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
}
