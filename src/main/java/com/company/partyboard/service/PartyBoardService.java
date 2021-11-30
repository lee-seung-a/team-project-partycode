package com.company.partyboard.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.company.command.PartyBoardVO;
import com.company.command.ReviewVO;
import com.company.command.UsersVO;
import com.company.utill.Criteria;

public interface PartyBoardService {
	
	
	public ArrayList<PartyBoardVO> getList(Criteria cri);
	
	
	public boolean regist(PartyBoardVO vo);
	
	public PartyBoardVO party_detail(Integer pno);
	
	public int getTotal(Criteria cri);
	
	public boolean registReview(@Param("vo") ReviewVO vo);
	
	public boolean reviewDelete(int revno);
	
	public ArrayList<PartyBoardVO> getparty(Criteria cri);
	
	public boolean partyup(PartyBoardVO vo);
	

    public int likeCount(Map<String, Object> map);
    
    
    public boolean pacPlus(PartyBoardVO pvo);
    public boolean  pacMinus(PartyBoardVO pvo);
    
    public boolean  pscPlus(PartyBoardVO pvo);
    public boolean  pscMinus(PartyBoardVO pvo);
    
    public boolean  psumPlus(PartyBoardVO pvo);
    public boolean  psumMinus(PartyBoardVO pvo);
    
    public boolean  pointSpend( PartyBoardVO pvo,UsersVO uvo);
    
    
}
