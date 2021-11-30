package com.company.admin_notice.mapper;

import java.util.ArrayList;

import com.company.command.NoticeVO;
import com.company.utill.Criteria;

public interface AdminNoticeMapper {

	public boolean regist(NoticeVO vo);			//���
	public ArrayList<NoticeVO> getList(Criteria cri);		//���
	public NoticeVO getDetail(int nno);			//�� ,����
	
	public boolean updateHit(int nno);			//��ȸ������
	public boolean updateDetail(NoticeVO vo);	//������Ʈ
	public boolean deleteNotice(int nno);		//����
	
	public int getTotal(Criteria cri);
	
}
