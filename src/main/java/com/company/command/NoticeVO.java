package com.company.command;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeVO {

	private int nno;
	private String nid;
	private String category;
	private String ntitle;
	private String ncontent;
	private Timestamp regdate;
	private Timestamp edit_date;
	private int hit;
	
	private String uploadpath;
	private String fileloca;
	private String filename;
	private String filerealname;
	
	
	public NoticeVO() {
		
	}


	public NoticeVO(int nno, String nid, String category, String ntitle, String ncontent, Timestamp regdate, int hit,
			String uploadpath, String fileloca, String filename, String filerealname) {

		this.nno = nno;
		this.nid = nid;
		this.category = category;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.regdate = regdate;
		this.hit = hit;
		
		this.uploadpath = uploadpath;
		this.fileloca = fileloca;
		this.filename = filename;
		this.filerealname = filerealname;
	}


	public NoticeVO(String uploadpath, String fileloca, String filename, String filerealname) {
		this.uploadpath = uploadpath;
		this.fileloca = fileloca;
		this.filename = filename;
		this.filerealname = filerealname;
	}
	
	
	
	
	
	
}
