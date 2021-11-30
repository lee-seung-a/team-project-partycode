package com.company.admin_users.service;

import java.util.ArrayList;

import com.company.command.IboughtthisVO;
import com.company.command.UsersVO;
import com.company.utill.Criteria;

public interface AdminUsersService {
	
	public ArrayList<UsersVO> inquiryList(Criteria cri);		//��ȸȭ��
	public UsersVO updateListDetail(int uno);		//��������ȭ��
	public boolean update(UsersVO vo);				//�������
	public boolean delete(int uno);					//�������
	
	public int getTotal(Criteria cri);
	
}
