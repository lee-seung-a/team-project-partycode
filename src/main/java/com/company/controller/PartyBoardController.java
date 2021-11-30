package com.company.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.ibatis.annotations.Param;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.utill.APP_CONSTANT;
import com.company.command.PartyBoardVO;
import com.company.command.ReviewVO;
import com.company.command.UsersVO;
import com.company.partyboard.service.PartyBoardService;
import com.company.utill.Criteria;
import com.company.utill.PageVO;

@Controller
@RequestMapping("partyboard")
public class PartyBoardController {

	@Autowired
	@Qualifier("partyboardService")
	private PartyBoardService partyboardService;

	@RequestMapping("party_board")
	public void party_board(Model mo,Criteria cri) throws Exception {

		cri.setAmount(12);
		int total = partyboardService.getTotal(cri);
		
		ArrayList<PartyBoardVO> list = partyboardService.getList(cri);
           
		
	
	
		System.out.println(new Date());
		
		SimpleDateFormat simpleformat = new SimpleDateFormat("yyyy-MM-dd");
		for(int i=0; i<list.size(); i++) {
			System.out.println();
			System.out.println(new Date());
			Date PartyStart = simpleformat.parse(list.get(i).getPdate());
			
			String SysDate = simpleformat.format(new Date());
			Date Sysdate = simpleformat.parse(SysDate);
			
			System.out.println(PartyStart);
			System.out.println(Sysdate);
            System.out.println(PartyStart.getTime());
            System.out.println(Sysdate.getTime());
            
			long calDate = PartyStart.getTime() - Sysdate.getTime();
			long calDateDays = calDate / (24 * 60 * 60 * 1000);
			list.get(i).setRemain(calDateDays);	   
		}
		System.out.println(list.toString());
		
		mo.addAttribute("list", list);
		PageVO pageVO = new PageVO(cri, total);
		mo.addAttribute("pageVO", pageVO);
		System.out.println(pageVO.toString());
	}

	@RequestMapping("party_regist")
	public String party_regist() {

		return "partyboard/party_regist";
	}

	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String regist(PartyBoardVO vo,@RequestParam("file") MultipartFile file, RedirectAttributes ra ) throws Exception{
		System.out.println(vo.toString());
		System.out.println(file);
		
	//	UsersVO vvo	= (UsersVO)session.getAttribute("users");
	//	System.out.println(vvo);	
		
     //  String id= vvo.getId();
		String fileRealName = file.getOriginalFilename();
		Long size =file.getSize();
		String extention = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

		UUID uuids=  UUID.randomUUID(); //랜덤16진수
		String saveFileName =  uuids.toString().replaceAll("-","")+extention;
		
		//월별 폴더생성
		Date date =new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		String fileloca  =sdf.format(date);
		String uploadpath = APP_CONSTANT.uploadPath+fileloca;
		
		File folder =new File(uploadpath);
		if(!folder.exists()) {
			folder.mkdir(); //자바에서 폴더생성
		}
		System.out.println("파일실제이름:" + fileRealName);
		System.out.println("파일크기" +size);
		System.out.println("확장자"+extention);
		System.out.println(uuids.toString());

		File dir = new File(uploadpath+"/"+saveFileName);
		file.transferTo(dir);   //파일 아웃풋 작업을 한번에 처리(로컬환경에 저장)
			
		String imgPath=dir.getPath();
		vo.setUploadpath(uploadpath);
		vo.setFileloca(fileloca);
		vo.setFilename(saveFileName);
		vo.setFilerealname(fileRealName);
		vo.setPadmin(1);

		boolean result = partyboardService.regist(vo);
		if(result) {
			ra.addFlashAttribute("msg", "정상등록 되었습니다.");
		}else
		ra.addFlashAttribute("msg", "다시 시도해주세요");

		return "redirect:party_board";
	}

	@RequestMapping({"party_detail","party_update"})
	public void party_detail(@RequestParam("pno") int pno, Model model) throws Exception {
		
		System.out.println(pno);
		PartyBoardVO vo = partyboardService.party_detail(pno);
		vo.getPdate();
		
	     double psum = vo.getPsum();
	     double pgoal =Integer.parseInt(vo.getPgoal());
	     
	     double percent = (psum/pgoal)*100;
	     
	     
 
		SimpleDateFormat simpleformat = new SimpleDateFormat("yyyy-MM-dd");
		Date PartyStart = simpleformat.parse(vo.getPdate());
		Date sysDate = new Date();
		String SysDate = simpleformat.format(sysDate);
		Date Sysdate = simpleformat.parse(SysDate);

		long calDate = PartyStart.getTime() - Sysdate.getTime();
		long calDateDays = calDate / (24 * 60 * 60 * 1000);
         System.out.println(vo.toString());
		model.addAttribute("vo", vo);
		model.addAttribute("remain", calDateDays);
		model.addAttribute("percent" ,percent);
	}

	@RequestMapping("/display/{folder}/{file:.+}")
	public ResponseEntity<byte[]> display(@PathVariable("folder") String folder, @PathVariable("file") String file){
		System.out.println(folder);
		System.out.println(file);
		
		ResponseEntity<byte[]> result =null;
		try {
		//파일의 마임타입(
		File path = new File(APP_CONSTANT.uploadPath+folder+"/"+file);
		//파일의 마임타입
	    FileCopyUtils.copyToByteArray(path);//파일의 데이터(응답바디에 저장)

	    HttpHeaders header = new HttpHeaders();
		    header.add("Content-type", Files.probeContentType(path.toPath()));
		 	result =new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(path),header,HttpStatus.OK);	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value="/registReview" , method=RequestMethod.POST)
	public String registReview(@Param("vo") ReviewVO vo,@Param("rating") int rating, RedirectAttributes ra) {
		System.out.println(vo.toString());
		System.out.println(rating);
		
		vo.setRating(rating);
		
		boolean result = partyboardService.registReview(vo);
		if(result){
			ra.addFlashAttribute("msg", "리뷰가 등록되었습니다.");
		}else {
			ra.addFlashAttribute("msg", "다시 시도해주세요.");
		}
		
		
		return "redirect:party_detail?pno="+vo.getRpno();		
	}
	
	@RequestMapping("reviewDelete")
    public String reviewDelete(@Param("revno") int revno,@Param("rpno") int rpno, RedirectAttributes ra) {
		ReviewVO vo = new ReviewVO();	
		vo.setRpno(rpno);
		boolean result = partyboardService.reviewDelete(revno);
		if(result){
			ra.addFlashAttribute("msg", "리뷰가 삭제되었습니다.");
		}else {
			ra.addFlashAttribute("msg", "다시 시도해주세요.");
		}

		return "redirect:party_detail?pno="+vo.getRpno();
	}
	
	@ResponseBody
	@RequestMapping("/getparty")
	public ArrayList<PartyBoardVO> getparty(@RequestBody Criteria cri,Model model) {
		ArrayList<PartyBoardVO> list = partyboardService.getparty(cri);
		System.out.println(list);
		
		return list;
	}
	
	@RequestMapping("partyup")
	public String partyup(PartyBoardVO vo,Model model,MultipartFile file) throws Exception {
		
		System.out.println(vo.toString());
		System.out.println(file.getOriginalFilename());
		if(!file.getOriginalFilename().equals("")) {
		String fileRealName = file.getOriginalFilename();
		Long size =file.getSize();
		String extention = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

		UUID uuids=  UUID.randomUUID(); //랜덤16진수
		String saveFileName =  uuids.toString().replaceAll("-","")+extention;
		
		//월별 폴더생성
		Date date =new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		String fileloca  =sdf.format(date);
		String uploadpath = APP_CONSTANT.uploadPath+fileloca;
		
		File folder =new File(uploadpath);
		if(!folder.exists()) {
			folder.mkdir(); //자바에서 폴더생성
		}
		System.out.println("파일실제이름:" + fileRealName);
		System.out.println("파일크기" +size);
		System.out.println("확장자"+extention);
		System.out.println(uuids.toString());

		File dir = new File(uploadpath+"/"+saveFileName);
		file.transferTo(dir);   //파일 아웃풋 작업을 한번에 처리(로컬환경에 저장)
			
		String imgPath=dir.getPath();
		vo.setUploadpath(uploadpath);
		vo.setFileloca(fileloca);
		vo.setFilename(saveFileName);
		vo.setFilerealname(fileRealName);
		
	boolean result =	partyboardService.partyup(vo);
		
		return "redirect:party_detail?pno="+vo.getPno();}else {
			
			boolean result =	partyboardService.partyup(vo);
			
			return "redirect:party_detail?pno="+vo.getPno();
		}
	}
	
	
	@ResponseBody	
	@RequestMapping(value="like" , method = RequestMethod.POST)
	public int like(@RequestBody Map<String, Object> map, HttpSession 	session,Model model ) throws Exception{


		
		System.out.println(map.toString());
		
	  	partyboardService.likeCount(map);
		
		return 1;
	}
	
	
	
	
}