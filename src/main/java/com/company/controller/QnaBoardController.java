package com.company.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.command.FaqBoardVO;
import com.company.command.QnaBoardVO;
import com.company.command.UsersVO;
import com.company.faqboard.service.FaqBoardService;
import com.company.qnaboard.service.QnaBoardService;
import com.company.utill.Criteria;
import com.company.utill.PageVO;

@Controller
@RequestMapping("/board")
public class QnaBoardController {
	

	@Autowired
	@Qualifier("qnaboardService")
	private QnaBoardService qnaboardService;
	
	@Autowired
	@Qualifier("faqboardService")
	private FaqBoardService faqboardService;
	
	@RequestMapping("/qna_board")
	public String qna_board(Model mv, Criteria cri) {
		
		ArrayList<QnaBoardVO> qnalist = qnaboardService.getList(cri);
		ArrayList<FaqBoardVO> faqlist = faqboardService.getlist();
		
		mv.addAttribute("qnalist", qnalist);
		mv.addAttribute("faqlist", faqlist);


		//페이지네이션
		int total = qnaboardService.getTotal(cri);
		
		PageVO pageVO = new PageVO(cri,total);		
		mv.addAttribute("pageVO" ,pageVO);
		
		System.out.println(pageVO.toString());
		
		return "board/qna_board";
	}
	
	
	
	@RequestMapping("qnaRegist")
	public void qnaRegist() {
		
	}
	
	@RequestMapping("qnaregistForm")
	public String qnaregistForm(QnaBoardVO qnavo, RedirectAttributes RA) {
		
		System.out.println(qnavo.toString());
		
		boolean result = qnaboardService.regist(qnavo);
		System.out.println(result);

		
		if(result) {
			RA.addFlashAttribute("msg","작성성공");
		}else {
			RA.addFlashAttribute("msg","작성실패");
		}
		
		return "redirect:/board/qna_board";
	}
	
	@RequestMapping("qna_detail")
	public void qna_detail(@RequestParam("qno") int qno, Model model) {
		QnaBoardVO qvo = qnaboardService.qna_detail(qno);
		model.addAttribute("qvo",qvo);
		
	}
	
	@RequestMapping("qna_delete")
	public String qna_delete(@RequestParam("qno") int qno, RedirectAttributes RA) {
		
		qnaboardService.qna_delete(qno);
		
		return "redirect:/board/qna_board";
	}
	
	
	

}
