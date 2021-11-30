package com.company.controller;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

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
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.admin_notice.service.AdminNoticeService;
import com.company.command.NoticeVO;
import com.company.utill.APP_CONSTANT;
import com.company.utill.Criteria;
import com.company.utill.PageVO;

@Controller
@RequestMapping("/admin/notice")
public class AdminNoticeController {

	@Autowired
	@Qualifier("adminNoticeService")
	private AdminNoticeService adminNoticeService;
	
	
	//공지사항 화면
	@RequestMapping("/list")
	public String adminNotice(Model model
							, Criteria cri) {
		
		ArrayList<NoticeVO> list = adminNoticeService.getList(cri);
		model.addAttribute("list", list);
		
		//페이지네이션
		int total = adminNoticeService.getTotal(cri);
		PageVO pageVO = new PageVO(cri, total);
		model.addAttribute("pageVO", pageVO);
		
		model.addAttribute("total", total);
		
		return "/adminCs/adminNoticeList";
	}
	
	
	
	//등록화면
	@RequestMapping("/regist")
	public String adminNoticeRegist() {
		
		return "/adminCs/adminNoticeRegist";
	}
	
	
	//등록기능
	@RequestMapping("/registForm")
	public String adminregistForm(@RequestParam("imgfile") MultipartFile imgfile,
									NoticeVO vo,
									RedirectAttributes RA) {
		
		boolean result = false;
		
		if(!imgfile.isEmpty()) {
			try {
				
				String fileRealName = imgfile.getOriginalFilename(); //실제파일명
				long size = imgfile.getSize(); //파일용량
				
				String extension 
					= fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length() );
				UUID uuid = UUID.randomUUID();
				String saveFileName = uuid.toString().replaceAll("-", "") + extension;
				
				//월별폴더
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
				String fileloca = sdf.format(date);
				
				String uploadPath = APP_CONSTANT.adminUploadPath + fileloca;
				
				File folder = new File(uploadPath);
				if(!folder.exists()) {
					folder.mkdir();
				}
				
				System.out.println("파일 실제 이름: "+ fileRealName);
				System.out.println("파일 용량: "+ size);
				System.out.println("확장자: "+ extension);
				System.out.println("서버에 저장되는 파일명: " + saveFileName);
				
				File dir = new File(uploadPath + "/" + saveFileName);
				imgfile.transferTo(dir);
				
				vo.setUploadpath(uploadPath);
				vo.setFileloca(fileloca);
				vo.setFilename(saveFileName);
				vo.setFilerealname(fileRealName);
				
	//			System.out.println(vo);
				
			}catch (Exception e) {
				System.out.println("===========업로드중 에러============");
				e.printStackTrace();
			}
		}
		result = adminNoticeService.regist(vo);
		
		if(result) {
			RA.addFlashAttribute("msg", "등록되었습니다.");
		}else {
			RA.addFlashAttribute("msg", "등록실패");
		}
		
		return "redirect:/admin/notice/list";
	}
	
	
	// 조회, 수정화면
	@RequestMapping("/detail")
	public String adminNoticeDetail(@RequestParam("nno") int nno
									, Model model) {
		
		NoticeVO vo = adminNoticeService.getDetail(nno);
		model.addAttribute("vo", vo);
		
		//조회수 증가
		adminNoticeService.updateHit(nno);
		
		return "/adminCs/adminNoticeDetail";
	}
	
	
	//이미지 요청시
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
	
	
	//수정기능
	@RequestMapping("/update")
	public String adminNoticeUpdate(@RequestParam("imgfile") MultipartFile imgfile,
									NoticeVO vo,
									RedirectAttributes RA) {
		boolean result = false;
		if(!imgfile.isEmpty()) {
			try {
				
				String fileRealName = imgfile.getOriginalFilename(); //실제파일명
				long size = imgfile.getSize(); //파일용량
				
				String extension 
					= fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length() );
				UUID uuid = UUID.randomUUID();
				String saveFileName = uuid.toString().replaceAll("-", "") + extension;
				
				//월별폴더
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
				String fileloca = sdf.format(date);
				
				String uploadPath = APP_CONSTANT.adminUploadPath + fileloca;
				
				File folder = new File(uploadPath);
				if(!folder.exists()) {
					folder.mkdir();
				}
				
				System.out.println("파일 실제 이름: "+ fileRealName);
				System.out.println("파일 용량: "+ size);
				System.out.println("확장자: "+ extension);
				System.out.println("서버에 저장되는 파일명: " + saveFileName);
				
				File dir = new File(uploadPath + "/" + saveFileName);
				imgfile.transferTo(dir);
				
				vo.setUploadpath(uploadPath);
				vo.setFileloca(fileloca);
				vo.setFilename(saveFileName);
				vo.setFilerealname(fileRealName);
				
	//			System.out.println(vo);
			}catch (Exception e) {
				System.out.println("===========업로드중 에러============");
				e.printStackTrace();
			}
		}
		result = adminNoticeService.updateDetail(vo);
		
		
		if(result) {
			RA.addFlashAttribute("msg", "수정되었습니다");
		}else {
			RA.addFlashAttribute("msg", "수정실패");
		}
		return "redirect:/admin/notice/list";
	}
	
	//삭제기능
	@RequestMapping("/delete")
	public String adminNoticeDelete(@RequestParam("nno") int[] nno,
									RedirectAttributes RA) {
		
		int count = 0;
		for(int i : nno) {
			boolean result = adminNoticeService.deleteNotice(i);
			if(result) count++;
		}
		
		if(count==nno.length) {
			RA.addFlashAttribute("msg", "삭제되었습니다");
		}else {
			RA.addFlashAttribute("msg", "삭제실패");
		}
		return "redirect:/admin/notice/list";
	}
	
	
	
}
