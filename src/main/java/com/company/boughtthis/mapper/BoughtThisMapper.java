package com.company.boughtthis.mapper;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;

import com.company.command.IboughtthisVO;
import com.company.command.PartyBoardVO;
import com.company.command.UsersVO;

public interface BoughtThisMapper {
	
	public boolean insertibt(IboughtthisVO vo);
	
	  public boolean deleteibt(IboughtthisVO vo);
	  
	     public boolean chargeibt(Map<String,Object> map);
	     
	     public boolean deletepointlog(IboughtthisVO vo);
}
