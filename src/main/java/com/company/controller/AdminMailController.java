package com.company.controller;

import java.util.ArrayList;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.command.AdminMailVO;


@Controller
public class AdminMailController {

	@Autowired
	private JavaMailSender mailSender;
	
	
	@RequestMapping("/admin/mail")
	public String mailSend(@RequestParam(value="emailList", required = false, defaultValue = "") ArrayList<String> emailList,
							Model model) {
		
		String str = "";
		for(int i=0; i<emailList.size(); i++) {
			str += emailList.get(i);
			if(i != emailList.size()-1) {
				str +=", ";
			}
		}
		model.addAttribute("str", str);
//		System.out.println(str.toString());
		return "/adminUsers/adminMail";
	}
	
	
	@RequestMapping("/admin/mailSending")
	public String mailSending(HttpServletRequest request) {

		String setfrom = "partycodepartycode@gmail.com";
		String mailStr = request.getParameter("mailStr"); // 받는 사람 이메일
		String title = request.getParameter("title"); // 제목
		String content = request.getParameter("content"); // 내용
		//배열처리
		String[] tomail = mailStr.trim().split(",");

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); 	// 보내는사람 생략하면 정상작동을 안함
			//messageHelper.setTo(tomail); 		// 받는사람 이메일
			messageHelper.setBcc(tomail); 		// 참조타입으로
			messageHelper.setSubject(title); 	// 메일제목은 생략이 가능하다
			messageHelper.setText(content); 	// 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "redirect:/admin/users/updateList";
	}
	
	
	
	
	
	
}
