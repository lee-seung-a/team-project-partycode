package com.company.partyboard.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.company.command.PartyBoardVO;
import com.company.command.ReviewVO;
import com.company.command.UsersVO;
import com.company.partyboard.mapper.PartyBoardMapper;
import com.company.utill.Criteria;


@Service("partyboardService")
public class PartyBoardServiceImpl implements PartyBoardService {

	@Autowired
	private PartyBoardMapper partyboardMapper;


	@Override
	public ArrayList<PartyBoardVO> getList(Criteria cri) {

		return partyboardMapper.getList(cri);
	}



	@Override
	public PartyBoardVO party_detail(Integer pno) {
		System.out.println(pno);
		return partyboardMapper.party_detail(pno);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return partyboardMapper.getTotal(cri);
	}



	@Override
	public boolean regist(PartyBoardVO vo) {


		return partyboardMapper.regist(vo);

	}



	@Override
	public boolean registReview(ReviewVO vo) {

		return partyboardMapper.registReview(vo);

	}



	@Override
	public boolean reviewDelete(int revno) {
		return partyboardMapper.reviewDelete(revno);
		
	}



	@Override
	public ArrayList<PartyBoardVO> getparty(Criteria cri) {
		// TODO Auto-generated method stub
		return partyboardMapper.getparty(cri);
	}



	@Override
	public boolean partyup(PartyBoardVO vo) {
		// TODO Auto-generated method stub
		return partyboardMapper.partyup(vo);
	}


	@Override
	public int likeCount(Map<String, Object> map) {
		return partyboardMapper.likeCount(map);	
		}



	@Override
	public boolean  pacPlus(PartyBoardVO pvo) {


	     return	partyboardMapper.pacPlus(pvo);
		
	}



	@Override
	public boolean  pacMinus(PartyBoardVO pvo) {
	 return	partyboardMapper.pacMinus(pvo);
		
	}



	@Override
	public boolean pscPlus(PartyBoardVO pvo) {
	return	partyboardMapper.pscPlus(pvo);
		
	}



	@Override
	public boolean pscMinus(PartyBoardVO pvo) {
	
	return	partyboardMapper.pscMinus(pvo);
	}



	@Override
	public boolean psumPlus( PartyBoardVO pvo) {
	      System.out.println(pvo.toString());
	return	partyboardMapper.psumPlus(pvo);
		
	}



	@Override
	public boolean psumMinus(PartyBoardVO pvo) {
		
		
	return	partyboardMapper.psumMinus(pvo);
		
	}



	@Override
	public boolean pointSpend( PartyBoardVO pvo, UsersVO uvo) {
	return	partyboardMapper.pointSpend(pvo, uvo);
		
	}



 









}




