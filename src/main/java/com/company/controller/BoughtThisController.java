package com.company.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.boughtthis.service.BoughtThisService;
import com.company.command.IboughtthisVO;
import com.company.command.PartyBoardVO;
import com.company.command.UsersVO;
import com.company.partyboard.service.PartyBoardService;
import com.company.users.service.UsersService;

@Controller
@RequestMapping("boughtthis")
public class BoughtThisController {

	@Autowired
	@Qualifier("boughtthisService")
	private BoughtThisService boughtthisService;

	@Autowired
	@Qualifier("usersService")
	private UsersService usersService;

	@Autowired
	@Qualifier("partyboardService")
	private PartyBoardService partyboardService;

	@RequestMapping("insertibt")
	public String insertibt(IboughtthisVO vo, HttpSession session, PartyBoardVO pvo, UsersVO uvo) {
		System.out.println(vo.toString());

		boolean result = boughtthisService.insertibt(vo);
           System.out.println(result);
	 boolean result2=	partyboardService.pacPlus(pvo);
		System.out.println(result2);
	 boolean result3=	partyboardService.pointSpend(pvo, uvo);
          System.out.println(result3);
	 boolean result4=	partyboardService.psumPlus(pvo);
System.out.println(result4);

     UsersVO users =  (UsersVO) session.getAttribute("users");
     System.out.println(users.toString());
     users.setPoint(users.getPoint()-pvo.getPattend());
     
     session.setAttribute("users", users);
        
		return "redirect:/partyboard/party_board";
	}

	
	  @RequestMapping("support") 
	  public String support(PartyBoardVO pvo,UsersVO uvo) {
	  
	  partyboardService.pscPlus(pvo); 
	  partyboardService.pointSpend(pvo,uvo);
	  
	  return "redirect:/partyboard/party_board"; }
	

	@RequestMapping("myparty")
	public void myboughtthis(Model model ,UsersVO vo ) {
		
		
     UsersVO users =    usersService.myboughtthis(vo);
     
     model.addAttribute("users",users);
	

	}
	
	@RequestMapping("deleteibt")
	public String deleteibt(IboughtthisVO vo,PartyBoardVO pvo,UsersVO uvo,RedirectAttributes RA,HttpSession session)	{
		
	
	boolean result = boughtthisService.deleteibt(vo);

	boolean result2 = usersService.pointReturn(pvo, uvo);
		System.out.println(result2);
	boolean result3 = partyboardService.psumMinus(pvo);
	 System.out.println(result3);
	boolean result4 = partyboardService.pacMinus(pvo);
		System.out.println(result4);
		
		
         UsersVO users =  (UsersVO) session.getAttribute("users");
	     
	     users.setPoint(users.getPoint()+pvo.getPattend());
	     
	     
	     session.setAttribute("users", users);
	
		
		
		if(result4) {
			
			RA.addFlashAttribute("msg","포인트가 환불되었습니다.");
		}
		
		return "redirect:/boughtthis/myparty?id="+uvo.getId();
		
	}
	
	@RequestMapping("poinglog")
	public void poinglog() {
		
	}
	@RequestMapping("map")
	public void map() {
		
		
		
		
	}
}
