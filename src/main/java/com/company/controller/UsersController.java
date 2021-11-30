package com.company.controller;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.utill.APP_CONSTANT;
import com.company.utill.Criteria;
import com.company.boughtthis.service.BoughtThisService;
import com.company.command.FollowVO;
import com.company.command.IboughtthisVO;
import com.company.command.PartyBoardVO;
import com.company.command.SnsVO;
import com.company.command.UsersVO;
import com.company.partyboard.service.PartyBoardService;
import com.company.users.service.MailSendService;
import com.company.users.service.UsersService;

@Controller
@RequestMapping("/users")
public class UsersController {

	@Autowired
	@Qualifier("usersService")
	private UsersService usersService;
	
	@Autowired
	@Qualifier("boughtthisService")
	private BoughtThisService boughtthisService;
    
	@Autowired
	@Qualifier("partyboardService")
    private PartyBoardService partyboardService;
	
	@Autowired
	@Qualifier("mss")
	private MailSendService mss;

	@RequestMapping("/usersignUp")
	public void usersignUp() {
	}

	@RequestMapping("/userLogin")
	public void userLogin() {
	}

	/*
	 * @RequestMapping("profile") public String profile(@RequestParam("id") String
	 * id, Model model){
	 * 
	 * 
	 * 
	 * UsersVO usersInfo = usersService.getInfo(id);
	 * 
	 * model.addAttribute("usersInfo", usersInfo);
	 * 
	 * return "users/profile"; }
	 */

	@RequestMapping("othersprofile")
	public String  othersprofile(@RequestParam("id") String id,Model model,HttpSession session) {
		UsersVO user = usersService.othersInfo(id);

		Object object = session.getAttribute("users");
		UsersVO loginuser = (UsersVO)object;

		int userNo = user.getUno();
		int loginUserNo = loginuser.getUno();

		FollowVO follow = new FollowVO();

		follow.setActiveuser(loginUserNo);
		follow.setPassiveuser(userNo);
		
		int followCheck = usersService.isFollow(follow); 
		
		System.out.println(followCheck);

		List<FollowVO> followerList =  usersService.selectPassiveUserList(userNo);
		List<FollowVO> followingList =  usersService.selectActiveUserList(userNo);
		
		System.out.println(followingList.toString());
		System.out.println(followerList.toString());

		model.addAttribute("othersInfo", user);
		model.addAttribute("followCheck", followCheck); 
		model.addAttribute("followerList",followerList);
		model.addAttribute("followingList",followingList);

		return "users/othersprofile";
	}

	  @RequestMapping("updateprofile") 
	  public void updateprofile(@RequestParam("id") String id,Model model) {

		  UsersVO usersInfo = usersService.getprofile(id);
		  model.addAttribute("usersInfo",usersInfo);
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
			System.out.println("==���ε��� ����==");
			e.printStackTrace();
			return "fail";
		}
	}

	@RequestMapping("/getList")
	@ResponseBody
	public ArrayList<SnsVO> getList(){
		System.out.println("����ƴ�");
		ArrayList<SnsVO> list = usersService.getList();
		return list;
	}

	@ResponseBody
	@RequestMapping("/display/{folder}/{file:.+}")
	public ResponseEntity<byte[]> display(@PathVariable("folder") String folder, @PathVariable("file") String file) {
		System.out.println(folder);
		System.out.println(file);

		ResponseEntity<byte[]> result = null;
		try {
			File path = new File(APP_CONSTANT.uploadpath+folder+"/"+file);

			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(path.toPath()));

			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(path), header, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@ResponseBody
	@RequestMapping("/idCheck")
	public ResponseEntity<Integer> idCheck(@RequestBody UsersVO vo){
System.out.println(vo.getId());
		int result = usersService.idCheck(vo);

		ResponseEntity<Integer> entity = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", "application/json");

			entity = new ResponseEntity<Integer>(result,header,HttpStatus.OK);

		}catch(Exception e) {
		}
		System.out.println(entity);
		return entity;
	}

	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public String signUp(UsersVO vo, RedirectAttributes RA) {
		boolean result = usersService.signUp(vo);

		if(result) {
			RA.addFlashAttribute("msg","회원가입해주셔서 감사합니다.");
			return "redirect:/users/userLogin";
		}else {
			
			RA.addFlashAttribute("msg","회원가입에 실패하였습니다..");
			return "redirect:users/usersignUp";
		}
	}

	@RequestMapping(value="login", method=RequestMethod.POST)
	public ModelAndView login(UsersVO vo,HttpSession session) {
		UsersVO users =usersService.login(vo);

		ModelAndView mv = new ModelAndView();
		System.out.println(users);

		mv.setViewName("users/userLogin");
		if(users == null) {
			mv.addObject("msg","로그인에 성공하셨습니다.");
		}else {
			mv.addObject("users",users);
		}
		return mv;
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/partyboard/party_board";	
	}
	
	@ResponseBody	
	@RequestMapping("/follow")
	public String follow(@RequestBody UsersVO vo, HttpSession session,Model model ) throws Exception{ 
		System.out.println(vo.getId());
		
		Object object = session.getAttribute("users");
		UsersVO activeuser = (UsersVO)object;
		UsersVO passiveuser = usersService.othersInfo(vo.getId());
		
		FollowVO follow = new FollowVO();
		follow.setActiveuser(activeuser.getUno());
		follow.setPassiveuser(passiveuser.getUno());

		usersService.follow(follow);

		return "FollowOK";
	}
	
	@ResponseBody
	@RequestMapping("/unfollow")
	public String unfollow(@RequestBody UsersVO vo,HttpSession session,Model model) {
		
		System.out.println(vo.getId());

		Object object = session.getAttribute("users");
		UsersVO activeuser = (UsersVO)object;
		UsersVO passiveuser = usersService.othersInfo(vo.getId());
		
		System.out.println(passiveuser);

		FollowVO follow = new FollowVO();
		follow.setActiveuser(activeuser.getUno());
		follow.setPassiveuser(passiveuser.getUno());

		usersService.unfollow(follow);

		return "UnFollowOK";
	}

	@RequestMapping("profile")
	public String showfollowlist(@RequestParam("id") String id,HttpSession session,Model model) {
		UsersVO user = usersService.getInfo(id);

		Object object = session.getAttribute("users");
		UsersVO loginuser = (UsersVO)object;

		int userNo = user.getUno();
		int loginUserNo = loginuser.getUno();

		FollowVO follow = new FollowVO();
		follow.setActiveuser(loginUserNo);
		follow.setPassiveuser(userNo);
		
		int followCheck = usersService.isFollow(follow);
		
		List<FollowVO> followerList =  usersService.selectPassiveUserList(userNo);
		List<FollowVO> followingList = usersService.selectActiveUserList(userNo);
		System.out.println(followingList.toString());
		System.out.println(followerList.toString());

		model.addAttribute("usersInfo", user);
		model.addAttribute("followCheck", followCheck); 
		model.addAttribute("followerList",followerList);
		model.addAttribute("followingList",followingList);
		
		return "users/profile";
	}
	
	@RequestMapping(value="profile_update", method = RequestMethod.POST)
	public String profile_update(@Param("vo") UsersVO vo, @RequestParam("file") MultipartFile file,HttpSession session, RedirectAttributes ra) throws Exception{
		System.out.println(vo.toString());
		
		String fileRealName = file.getOriginalFilename();
		Long size = file.getSize();
		String extention = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		UUID uuids=  UUID.randomUUID();
		String saveFileName =  uuids.toString().replaceAll("-","")+extention; 

		Date date =new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		String fileloca  =sdf.format(date);
		String uploadpath = APP_CONSTANT.uploadPath+fileloca;
		
		File folder =new File(uploadpath);
		if(!folder.exists()) {
			folder.mkdir(); 
		}
		System.out.println("�뙆�씪�떎�젣�씠由�:" + fileRealName);
		System.out.println("�뙆�씪�겕湲�" +size);
		System.out.println("�솗�옣�옄"+extention);
		System.out.println(uuids.toString());

		File dir = new File(uploadpath+"/"+saveFileName);
		file.transferTo(dir);   

		String imgPath = dir.getPath();
		System.out.println(vo.toString());

		vo.setUploadpath(uploadpath);
		vo.setFileloca(fileloca);
		vo.setFilename(saveFileName);
		vo.setFilerealname(fileRealName);

		boolean result = usersService.profile_update(vo);
		
		if(result){
			ra.addFlashAttribute("msg", "프로필 업데이트 성공.");
		}else {
			ra.addFlashAttribute("msg", "다시 시도해주세요.");
		}
		
		return "redirect:/users/profile?id="+vo.getId();
	}
	
	@RequestMapping("/disflay/{folder}/{file:.+}")
	public ResponseEntity<byte[]> disflay(@PathVariable("folder") String folder, @PathVariable("file") String file)  {
		System.out.println(folder);
		System.out.println(file);
		ResponseEntity<byte[]> result =null;
		try {
			File path = new File(APP_CONSTANT.uploadPath+folder+"/"+file);
			FileCopyUtils.copyToByteArray(path);

			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(path.toPath()));

			result =new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(path),header,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}	
	
	@ResponseBody
	@RequestMapping("/getusers")
	public ArrayList<UsersVO> getusers(@RequestBody Criteria cri,Model model) {
		ArrayList<UsersVO> list=	usersService.getusers(cri);
	  
		System.out.println(list);
		return list;
	}
	
	@RequestMapping("pay")
 	public String pay(UsersVO vo) {
		return "users/pay"; 
		}
	
	@ResponseBody
	@RequestMapping("chargepoint")
	public String chargePoint(@RequestBody Map<String,Object> map,HttpSession session) {
		System.out.println(map.toString());						
		usersService.chargePoint(map);
		System.out.println(map.toString());
		
	boolean result=	boughtthisService.chargeibt(map);
	
	    int point  = (int) map.get("point")*100;
	    UsersVO uvo   =   (UsersVO) session.getAttribute("users");
	    
	    uvo.setPoint(uvo.getPoint()+point);
	    
	    session.setAttribute("users", uvo );
	    
	System.out.println(result);
		
		return "redirect:/partycode/partyboard/party_board";
	}	
	
	@ResponseBody
	@RequestMapping("emailsend")
	public String emailsend(@RequestBody UsersVO vo) {
		
		System.out.println(vo.toString());
		String email=vo.getEmail1()+vo.getEmail2();
		String authKey = mss.sendAuthMail(email);
		
		return authKey;
	}

	@RequestMapping("signAuth")
	public void signAuth() {
		
	}
	
}
