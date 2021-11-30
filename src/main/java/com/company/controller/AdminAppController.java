package com.company.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.admin_app.service.AdminAppService;
import com.company.command.FaqBoardVO;
import com.company.command.PartyBoardVO;
import com.company.partyboard.service.PartyBoardService;
import com.company.utill.Criteria;
import com.company.utill.PageVO;


@Controller
@RequestMapping("/adminCs")
public class AdminAppController {
	
	
	
	@Autowired
	@Qualifier("adminappService")
	private AdminAppService adminappService;
	
	@Autowired
	@Qualifier("partyboardService")
	private PartyBoardService partyboardService;
	
	
	@RequestMapping("adminApproval")
	public String adminApproval(Model mv, Criteria cri) {
		
		ArrayList<PartyBoardVO> partylist= adminappService.getList(cri);
		mv.addAttribute("partylist",partylist);
		
		int total = adminappService.getTotal(cri);
		
		PageVO pageVO = new PageVO(cri,total);
		
		mv.addAttribute("pageVO" ,pageVO);
		
		System.out.println(partylist.toString());

		return "/adminCs/adminApproval";
		
		
	}
	
	@RequestMapping("party_detail")
    public String party_detail(@RequestParam("pno") int pno, Model model) {
		PartyBoardVO pvo =adminappService.getContent(pno);
		model.addAttribute("pvo", pvo);
		
		return "partyboard/party_detail";

	}
	
	@RequestMapping("adminpartyUpdate")
	public String adminpartyUpdate(PartyBoardVO adminpvo,RedirectAttributes RA) {
		
		
		System.out.println(adminpvo.toString());
		boolean result = adminappService.Update(adminpvo);
		
		if(result) {
			RA.addFlashAttribute("msg","신청이 승인되어 게시물이 업로드됩니다.");
			
		}else {
			RA.addFlashAttribute("msg", "승인실패");
		}
//		return "redirect:/adminCs/adminqna/adminQNAdetail?fno=" + fvo.getFno();
		return "redirect:/adminCs/adminApproval";
		

	}
}
