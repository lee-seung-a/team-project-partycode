package com.company.command;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FollowVO {
	
	private int followno;
	private int activeuser;
	private int passiveuser;
	private Date regdate;
	private String activeuserid;
	private String passiveuserid;
	private String profileName;
}
