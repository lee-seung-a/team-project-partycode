package com.company.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.admin_qna.service.AdminQnaService;
import com.company.command.FaqBoardVO;
import com.company.command.QnaBoardVO;
import com.company.faqboard.service.FaqBoardService;
import com.company.utill.Criteria;
import com.company.utill.PageVO;

@Controller
@RequestMapping("/admin/adminqna")
public class AdminQnaController {
	
	@Autowired
	@Qualifier("adminqnaService")
	private AdminQnaService adminqnaService;
	
	@Autowired
	@Qualifier("faqboardService")
	private FaqBoardService faqboardService;

	
	@RequestMapping("/list")
	public String AdminFAQQNA(Model mv, Criteria cri) {
		
		ArrayList<QnaBoardVO> qnalist= adminqnaService.getList(cri);
		mv.addAttribute("qnalist",qnalist);
		
		ArrayList<FaqBoardVO> faqlist = faqboardService.getlist();
		mv.addAttribute("faqlist", faqlist);
		
		//페이지네이션
		int total = adminqnaService.getTotal(cri);
		
		PageVO pageVO = new PageVO(cri,total);
		
		mv.addAttribute("pageVO" ,pageVO);
		
		System.out.println(pageVO.toString());
		
		return "/adminCs/adminFAQQNA";
	}


	
	@RequestMapping({"adminFAQdetail","adminqnaAnswer"})
	public String adminqnaDetail(@RequestParam("qno") int qno, Model model) {
		QnaBoardVO adminqvo = adminqnaService.getContent(qno);
		model.addAttribute("adminqvo", adminqvo);
				
		return "/adminCs/adminFAQdetail";
	}
	
	@RequestMapping("adminqnaUpdate")
	public String adminqnaUpdate(QnaBoardVO adminqvo, RedirectAttributes RA) {
		
		System.out.println(adminqvo.toString());

		boolean result = adminqnaService.Update(adminqvo);
		
		System.out.println(adminqvo.toString());

		if(result) {
			RA.addFlashAttribute("msg","답변이 등록되었습니다.");
		}else {
			RA.addFlashAttribute("msg","답변등록이 완료되지 않았습니다.");
		}
		return "redirect:/admin/adminqna/list";
	}
	
	@RequestMapping("adminqnaDelete")
	public String adminqnaDelete(@RequestParam("qno") int qno, RedirectAttributes RA) {
		
		adminqnaService.adminqnaDelete(qno);
		
		return "redirect:/admin/adminqna/list";
	}
	
	@RequestMapping("qnamultiDel")
	public String adminNoticeDelete(@RequestParam("qno") int qno,
			RedirectAttributes RA) {

		boolean result = adminqnaService.qnamultiDel(qno);
		
		if(result) {
		RA.addFlashAttribute("msg", "삭제되었습니다");
		}else {
		RA.addFlashAttribute("msg", "삭제실패");
		}
		
		return "redirect:/admin/adminqna/list";
	}

	//등록/adminCs/adminqna
	@RequestMapping("/adminFAQregist")
	public String faq_regist() {
		
		return "adminCs/adminFAQregist";
		
	}
	
	@RequestMapping("faq_registForm")
	public String faq_registForm(FaqBoardVO fvo,RedirectAttributes RA) {
		 System.out.println(fvo.toString());
		 
		boolean result =faqboardService.faq_regist(fvo);
		
		System.out.println(result);
		
		if(result) {
			RA.addFlashAttribute("msg","정상처리되었습니다.");
		}else {
			RA.addFlashAttribute("msg","등록에 실패하였습니다.");
		}
		 
		return "redirect:/admin/adminqna/list";
	}
	
	

	//내용화면 //상세보기 (변경화면,상세화면은 동일한 내용을 가지고 있어서 묶어서 사용)
//	@RequestMapping("faqModify")
//    public void adminfaqDetail(@RequestParam("fno") int fno, Model model) {
//		FaqBoardVO fvo =faqboardService.getcontent(fno);
//		model.addAttribute("fvo", fvo);
//		
//		return "adminCs/수정화면";
//
//	}

	@RequestMapping("adminQNAdetail")
    public String adminQNAdetail(@RequestParam("fno") int fno, Model model) {
		FaqBoardVO fvo =faqboardService.getcontent(fno);
		model.addAttribute("fvo", fvo);
		
		return "adminCs/adminQNAdetail";

	}
	
	
	@RequestMapping("adminfaqDelete")
	public String adminfaqDelete(@RequestParam("fno") int fno, RedirectAttributes RA) {
		
		faqboardService.adminfaqDelete(fno);
		
		return "redirect:/admin/adminqna/list";
	}
	
	@RequestMapping("adminfaqUpdate")
	public String adminfaqUpdate(FaqBoardVO fvo,RedirectAttributes RA) {
		
		boolean result = faqboardService.adminfaqUpdate(fvo);
		
		if(result) {
			RA.addFlashAttribute("msg","정상 수정되었습니다.");
			
		}else {
			RA.addFlashAttribute("msg", "수정에 실패하였습니다.");
		}
//		return "redirect:/adminCs/adminqna/adminQNAdetail?fno=" + fvo.getFno();
		return "redirect:/admin/adminqna/list";

	}
}
