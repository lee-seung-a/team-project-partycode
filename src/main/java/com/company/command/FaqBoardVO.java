package com.company.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FaqBoardVO {
	
	private int fno;
	private String ask;
	private String fcontent;

}
