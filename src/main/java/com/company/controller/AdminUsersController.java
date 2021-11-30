package com.company.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.admin_ibt.service.AdminIBTService;
import com.company.admin_users.service.AdminUsersService;
import com.company.command.IboughtthisVO;
import com.company.command.UsersVO;
import com.company.utill.Criteria;
import com.company.utill.PageVO;

@Controller
@RequestMapping("/admin/users")
public class AdminUsersController {
	
	@Autowired
	@Qualifier("adminUsersService")
	private AdminUsersService adminUsersService;
	
	@Autowired
	@Qualifier("adminIBTService")
	private AdminIBTService adminIBTService;
	

	//조회 화면
	@RequestMapping("/inquiryList")
	public String adminUsersSelect(Model model
									, Criteria cri
									, RedirectAttributes RA) {
		
		ArrayList<UsersVO> list = adminUsersService.inquiryList(cri);
		model.addAttribute("list", list);
		
		//페이지네이션
		int total = adminUsersService.getTotal(cri);
		PageVO pageVO = new PageVO(cri, total);
		model.addAttribute("pageVO", pageVO);
		
		System.out.println(pageVO);
		
		return "/adminUsers/adminUsersSelect";
	}
	
	//수정,삭제 화면
	@RequestMapping("/updateList")
	public String adminUsersUpdate(Model model
								, Criteria cri) {
		
		ArrayList<UsersVO> list = adminUsersService.inquiryList(cri);
		model.addAttribute("list", list);
		
		//페이지네이션
		int total = adminUsersService.getTotal(cri);
		PageVO pageVO = new PageVO(cri, total);
		model.addAttribute("pageVO", pageVO);
				
		return "/adminUsers/adminUsersUpdate";
	}
	
	//detail 화면
	@RequestMapping("/detail")
	public String adminUsersDetail(@RequestParam("uno") int uno,
									Model model) {
		
		UsersVO vo = adminUsersService.updateListDetail(uno);
		ArrayList<IboughtthisVO> list = adminIBTService.reservList(uno);
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		
		return "/adminUsers/adminUsersUpdateDetail";
	}
	
	//수정기능
	@RequestMapping("/update")
	public String adminUsersUpdate(UsersVO vo,
									RedirectAttributes RA) {
		
		boolean result = adminUsersService.update(vo);
		
		if(result) {
			RA.addFlashAttribute("msg", "수정되었습니다");
		}else {
			RA.addFlashAttribute("msg", "수정실패");
		}
		
		return "redirect:/admin/users/updateList";
	}
	
	//삭제기능
	@RequestMapping("/delete")
	public String adminUsersDelete(@RequestParam("uno") int[] uno,
									RedirectAttributes RA) {
		
		int count = 0;
		for(int i : uno) {
			boolean result = adminUsersService.delete(i);
			if(result) count++;
		}
		if(count==uno.length) {
			RA.addFlashAttribute("msg", "모두 삭제되었습니다");
		}else {
			RA.addFlashAttribute("msg", "삭제실패");
		}
		
		return "redirect:/admin/users/updateList";
	}
	
	
	
	
	
	
	

	

}
