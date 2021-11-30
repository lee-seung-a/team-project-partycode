package com.company.users.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.company.command.FollowVO;
import com.company.command.PartyBoardVO;
import com.company.command.SnsVO;
import com.company.command.UsersVO;
import com.company.utill.Criteria;

public interface UsersMapper {
	
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
	
	public void deleteUserAllFollow(int activeuser);
	
	public boolean profile_update(UsersVO vo);
	public UsersVO getprofile(String id);
	
	public ArrayList<UsersVO> getusers(Criteria cri);
	
	public int pay(UsersVO vo);
	public void chargePoint(Map<String,Object> map);
	
	public UsersVO getmyparty();
	
	public void pointSpend(@Param("p") int pattend,String id);
	
	public boolean pointReturn(@Param("p") PartyBoardVO pvo,@Param("id") UsersVO uvo);
	
	public UsersVO myboughtthis(UsersVO vo);
	
	public void updateAuthstatus(Map<String,String> map);
}
