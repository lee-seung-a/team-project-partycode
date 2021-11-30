package com.company.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.admin.service.AdminService;
import com.company.command.AdminDashboardVO;
import com.company.command.NoticeVO;


@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	@Qualifier("adminService")
	private AdminService adminService;
	
	
	//dashboard 화면
	@RequestMapping("")
	public String adminIndex(Model model) {
		
		//notice 5개까지
		ArrayList<NoticeVO> notice =  adminService.homeNotice();
		model.addAttribute("notice", notice);
		
		//상단 카운트 4개
		AdminDashboardVO homeCount = adminService.homeCount();
		model.addAttribute("homeCount", homeCount);
//		System.out.println(homeCount);
		
		//장르
		ArrayList<AdminDashboardVO> themeList =  adminService.homeTheme();
		model.addAttribute("themeList", themeList);
		
//		System.out.println(themeList);
		
		//top5
		ArrayList<AdminDashboardVO> homeTopPrivate = adminService.homeTopPrivate();
		model.addAttribute("homeTopPrivate", homeTopPrivate);
		System.out.println(homeTopPrivate);
		
		//recent party
		ArrayList<AdminDashboardVO> recentParty = adminService.homeRecent();
		model.addAttribute("recentParty", recentParty);
		System.out.println(recentParty);
		
		
		return "/admin/adminHome";
	}
	
}
