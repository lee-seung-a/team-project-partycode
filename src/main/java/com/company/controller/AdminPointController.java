package com.company.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.admin.service.AdminService;
import com.company.admin_point.service.AdminPointService;
import com.company.command.AdminDashboardVO;
import com.company.command.AdminPointVO;
import com.company.command.NoticeVO;
import com.company.utill.Criteria;
import com.company.utill.PageVO;


@Controller
@RequestMapping("/admin")
public class AdminPointController {

	@Autowired
	@Qualifier("adminPointService")
	private AdminPointService adminPointService;
	
	
	@RequestMapping("/pointlog")
	public String adminPointLog(Model model
							, Criteria cri) {
		//cri.setAmount(10);
		
		ArrayList<AdminPointVO> list = adminPointService.getList(cri);
		model.addAttribute("list", list);
		
		//페이지네이션
		int total = adminPointService.getTotal(cri);
		PageVO pageVO = new PageVO(cri, total);
		model.addAttribute("pageVO", pageVO);
		
		return "/adminPoint/adminPointLog";
	}
}
