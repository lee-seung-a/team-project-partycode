package com.company.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminPointVO {

	private int uno;
	private String my_id;
	private int charge;
	private int use;
	private String title;
	private Timestamp this_regdate;
	private int remainpoint;
	
}
