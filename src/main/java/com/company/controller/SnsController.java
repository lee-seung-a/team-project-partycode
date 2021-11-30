package com.company.controller;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;

import com.company.command.SnsVO;
import com.company.command.UsersVO;
import com.company.users.service.UsersService;
import com.company.utill.APP_CONSTANT;

@Controller
@RequestMapping("/snsboard")
public class SnsController {

	@Autowired
	@Qualifier("usersService")
	private UsersService usersService;
	
	@RequestMapping("/sns_board")
	public void snsboard(/* @RequestParam("id") String id,Model model */) {
		
		/*
		 * UsersVO usersInfo = usersService.getprofile(id);
		 * model.addAttribute("usersInfo",usersInfo); System.out.println("aaaaaaa");
		 */
	}
	
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile file,	@RequestParam("content") String content, HttpSession session) {
		try {
			UsersVO vo = (UsersVO)session.getAttribute("users");

			String id = vo.getId();

			System.out.println(file);
			String fileRealName = file.getOriginalFilename(); 
			Long size = file.getSize(); 

			String extension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			UUID uuids = UUID.randomUUID(); 
			String saveFileName = uuids.toString().replaceAll("-", "") + extension;

			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
			String fileloca = sdf.format(date);
			String uploadpath = APP_CONSTANT.uploadpath+fileloca;

			File folder = new File(uploadpath);
			if(!folder.exists()) {
				folder.mkdir();
			}

			File dir = new File(uploadpath+"/"+saveFileName);
			file.transferTo(dir);

			SnsVO snsvo = new SnsVO(0, id,uploadpath, fileloca,saveFileName, fileRealName, content, null);

			System.out.println(snsvo.toString());
			boolean result = usersService.regist(snsvo);

			if(result) {
				return "success";
			}else {
				return "fail";
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	@RequestMapping("/getList")
	@ResponseBody
	public ArrayList<SnsVO> getList(){
		System.out.println("snsnsnsnsnsns");
		ArrayList<SnsVO> list = usersService.getList();
		return list;
	}
	

	@RequestMapping("/disflay/{folder}/{file:.+}")
	public ResponseEntity<byte[]> disflay(@PathVariable("folder") String folder, @PathVariable("file") String file)  {
		System.out.println(folder);
		System.out.println(file);
		ResponseEntity<byte[]> result =null;
		try {
			File path = new File(APP_CONSTANT.uploadpath+folder+"/"+file);
			FileCopyUtils.copyToByteArray(path);

			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(path.toPath()));

			result =new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(path),header,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}	
}
