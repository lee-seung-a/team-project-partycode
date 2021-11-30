package com.company.users.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.company.command.FollowVO;
import com.company.command.PartyBoardVO;
import com.company.command.SnsVO;
import com.company.command.UsersVO;
import com.company.utill.Criteria;

public interface UsersService {
	
	
	public int idCheck(UsersVO vo);
	public boolean signUp(UsersVO vo);
	public UsersVO login(UsersVO vo);
	public UsersVO getInfo(String id);
	
	public boolean regist(SnsVO vo);
	public ArrayList<SnsVO> getList();
	
	public UsersVO othersInfo(String id);
	
public void follow(FollowVO follow);
	
	public void unfollow(FollowVO follow);
	
	public int isFollow (FollowVO follow);
	
	public List<FollowVO> selectActiveUserList(int activeuser);
	
	public List<FollowVO> selectPassiveUserList(int passiveuser);
	
	public boolean profile_update(UsersVO vo);
	public UsersVO getprofile(String id);
	
	public ArrayList<UsersVO> getusers(Criteria cri);
	
	public int pay(UsersVO vo);
	public void chargePoint(Map<String,Object> map);
	
	public UsersVO getmyparty();
	
	public void pointSpend(int pattend,String id);
	
	public boolean pointReturn(PartyBoardVO pvo, UsersVO uvo);
	
	public UsersVO myboughtthis(UsersVO vo);
	
	public void updateAuthstatus(Map<String,String> map);

}
