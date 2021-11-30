package com.company.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaBoardVO {
	
	private int qno;
	private String category;
	private String qtitle;
	private String id;
	private String qcontent;
	private Timestamp regdate;
	private String answer;

}
