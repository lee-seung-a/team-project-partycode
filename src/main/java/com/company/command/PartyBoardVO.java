package com.company.command;

import java.sql.Timestamp;
import java.util.ArrayList;

import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PartyBoardVO {
	
	private String partycode;
	private int pno;
	private String ptitle;
	private String pid;
	private String ptheme;
	private String pgoal;
	private int psum;
	private int pattend;
	private String pcontent;
	private long remain;
	private String pdate;
	private String pmax;
	private String pmin;
	private String pment;
	private String do_support;
	private String sno;
	private String plike;
	private String plocation1;
	private String plocation2;
	private String plocation3;
	private int report;
	private String uploadpath;
	private String fileloca;
	private String filename;
	private String filerealname;
	private int padmin;
	private int pac;
	private int psc;
	private Timestamp pregdate;
	
	
	private ArrayList<ReviewVO> reviewlist;
	private ArrayList<IboughtthisVO> ibtlist;
}