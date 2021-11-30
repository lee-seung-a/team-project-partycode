package com.company.admin_notice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.company.admin_notice.mapper.AdminNoticeMapper;
import com.company.command.NoticeVO;
import com.company.utill.Criteria;

@Service("adminNoticeService")
public class AdminNoticeServiceImpl implements AdminNoticeService {

	@Autowired
	private AdminNoticeMapper adminNoticeMapper;
	
	
	@Override
	public ArrayList<NoticeVO> getList(Criteria cri) {
		return adminNoticeMapper.getList(cri);
	}

	@Override
	public boolean regist(NoticeVO vo) {
		
		return adminNoticeMapper.regist(vo);
	}

	@Override
	public NoticeVO getDetail(int nno) {
		
		return adminNoticeMapper.getDetail(nno);
	}

	@Override
	public boolean updateHit(int nno) {
		
		return adminNoticeMapper.updateHit(nno);
	}

	@Override
	public boolean updateDetail(NoticeVO vo) {
		
		return adminNoticeMapper.updateDetail(vo);
	}

	@Override
	public boolean deleteNotice(int nno) {
		
		return adminNoticeMapper.deleteNotice(nno);
	}

	@Override
	public int getTotal(Criteria cri) {
		return adminNoticeMapper.getTotal(cri);
	}

}
