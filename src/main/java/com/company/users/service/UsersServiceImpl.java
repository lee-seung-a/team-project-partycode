package com.company.users.service;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.command.FollowVO;
import com.company.command.PartyBoardVO;
import com.company.command.SnsVO;
import com.company.command.UsersVO;

import com.company.users.mapper.UsersMapper;
import com.company.utill.Criteria;

@Service("usersService")
public class UsersServiceImpl implements UsersService{

	@Autowired
	private UsersMapper usersMapper;
	
	@Override
	public int idCheck(UsersVO vo) {
		return usersMapper.idCheck(vo);
	}
	
	@Override
	public boolean signUp(UsersVO vo) {
	
	Encoder encoder=Base64.getEncoder();
	
	byte[] result=encoder.encode(vo.getPw().getBytes());
	vo.setPw(new String(result));
	
		return usersMapper.signUp(vo);
	}
	
	@Override
	public UsersVO login(UsersVO vo) {
		Encoder encoder=Base64.getEncoder();
		
		byte[] result=encoder.encode(vo.getPw().getBytes());//byte[]���·� ��ȣȭ�����͸� ����
		vo.setPw(new String(result));
		
		return usersMapper.login(vo);
	}
	
	@Override
	public UsersVO getInfo(String id) {
		return usersMapper.getInfo(id);
	}

	@Override
	public boolean regist(SnsVO vo) {
		
		return usersMapper.regist(vo);
	}
	
	@Override
	public ArrayList<SnsVO> getList() {
		return usersMapper.getList();
	}
	
	@Override
	public UsersVO othersInfo(String id) {
		// TODO Auto-generated method stub
		return usersMapper.othersInfo(id);
	}
	
	@Override
	public void follow(FollowVO follow) {
		usersMapper.follow(follow);
		
	}
	
	@Override
	public void unfollow(FollowVO follow) {
	    usersMapper.unfollow(follow);
		
	}
	@Override
	public int isFollow(FollowVO follow) {
		return usersMapper.isFollow(follow);
	}
	
	@Override
	public boolean profile_update(UsersVO vo) {
		return usersMapper.profile_update(vo);
		
	}
	
	@Override
	public UsersVO getprofile(String id) {
		return usersMapper.getprofile(id);
	}
	
	@Override
	public List<FollowVO> selectActiveUserList(int activeuser) {
		return usersMapper.selectActiveUserList(activeuser);
	}
	
	@Override
	public List<FollowVO> selectPassiveUserList(int passiveuser) {
		return usersMapper.selectPassiveUserList(passiveuser);
	}
	
	@Override
	public ArrayList<UsersVO> getusers(Criteria cri) {
		return usersMapper.getusers(cri);
	}
	
	@Override
	public int pay(UsersVO vo) {
		return usersMapper.pay(vo);
	}
	
	@Override
	public void chargePoint(Map<String, Object> map) {
		usersMapper.chargePoint(map);
	}
	
	@Override
	public UsersVO getmyparty() {
		return usersMapper.getmyparty();
	}
	
	@Override
	public void pointSpend(int pattend,String id) {
		System.out.println(pattend);
		usersMapper.pointSpend(pattend,id);
	}

	@Override
	public UsersVO myboughtthis(UsersVO vo) {
		// TODO Auto-generated method stub
		return usersMapper.myboughtthis(vo);
	}

	@Override
	public boolean pointReturn(PartyBoardVO pvo, UsersVO uvo) {
		// TODO Auto-generated method stub
		return usersMapper.pointReturn(pvo, uvo);
	}

	@Override
	public void updateAuthstatus(Map<String, String> map) {
		usersMapper.updateAuthstatus(map);
	}

}
