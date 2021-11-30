package com.company.admin_notice.service;

import java.util.ArrayList;

import com.company.command.NoticeVO;
import com.company.utill.Criteria;

public interface AdminNoticeService {

	public boolean regist(NoticeVO vo);			//등록
	public ArrayList<NoticeVO> getList(Criteria cri);		//목록
	public NoticeVO getDetail(int nno);			//상세 ,수정
	
	public boolean updateHit(int nno);			//조회수증가
	public boolean updateDetail(NoticeVO vo);	//업데이트
	public boolean deleteNotice(int nno);		//삭제
	
	public int getTotal(Criteria cri);
	
}
