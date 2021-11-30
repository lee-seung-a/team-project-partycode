package com.company.admin_users.service;

import java.util.ArrayList;

import com.company.command.IboughtthisVO;
import com.company.command.UsersVO;
import com.company.utill.Criteria;

public interface AdminUsersService {
	
	public ArrayList<UsersVO> inquiryList(Criteria cri);		//조회화면
	public UsersVO updateListDetail(int uno);		//수정삭제화면
	public boolean update(UsersVO vo);				//수정기능
	public boolean delete(int uno);					//삭제기능
	
	public int getTotal(Criteria cri);
	
}
