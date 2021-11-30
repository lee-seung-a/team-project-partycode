package com.company.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminDashboardVO {
	
	//total number list
	private int totalusers;
	private int totallike;
	private int ingfundrasing;
	private int endfundrasing;
	private int usersgrowth;
	private int likegrowth;
	private int fingrowth;
	
	
	//top private party
	private String ptitle;
	private int fundpercent;
	
	
	//popular theme
	private String ptheme;
	private String percent;
	
	
	//recent party
	private int hago;
	private String pment;
	private String pid;
	private int pno;
	
	
	
}
