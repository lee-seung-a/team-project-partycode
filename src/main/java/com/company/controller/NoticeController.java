package com.company.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.admin_notice.service.AdminNoticeService;
import com.company.command.NoticeVO;
import com.company.utill.APP_CONSTANT;
import com.company.utill.Criteria;
import com.company.utill.PageVO;

@Controller
@RequestMapping("/board")
public class NoticeController {

	@Autowired
	@Qualifier("adminNoticeService")
	private AdminNoticeService adminNoticeService;
	
	
	@RequestMapping("notice")
	public String notice_board(Model model
							, Criteria cri) {
		
		ArrayList<NoticeVO> list = adminNoticeService.getList(cri);
		model.addAttribute("list", list);
		
		//페이지네이션
		int total = adminNoticeService.getTotal(cri);
		PageVO pageVO = new PageVO(cri, total);
		model.addAttribute("pageVO", pageVO);
		
		model.addAttribute("total", total);
		return "board/notice_board";
	}
	
	@RequestMapping("notice/detail")
	public String adminNoticeDetail(@RequestParam("nno") int nno
									, Model model) {
		
		NoticeVO vo = adminNoticeService.getDetail(nno);
		model.addAttribute("vo", vo);
		
		//조회수 증가
		adminNoticeService.updateHit(nno);
		
		return "board/notice_detail";
	}
	
	@ResponseBody
	@RequestMapping("/display/{folder}/{file:.+}")
	public ResponseEntity<byte[]> display(@PathVariable("folder") String folder,
							@PathVariable("file") String file) {
		
		ResponseEntity<byte[]> result = null;
		try {
			//파일의 마임타입(
			File path = new File(APP_CONSTANT.adminUploadPath + folder + "/" + file);
			
			/*
			Files.probeContentType(path.toPath());	//파일의 마임타입(헤더에 저장)
			FileCopyUtils.copyToByteArray(path);	//파일의 데이터(응답바디에 저장)
			*/			
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(path.toPath()) );
			
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(path),	//데이터
												header,		//헤더
												HttpStatus.OK);	//상태정보
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
