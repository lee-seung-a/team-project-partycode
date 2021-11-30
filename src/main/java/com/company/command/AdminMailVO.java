package com.company.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminMailVO {

	private String tomail;
	private String title;
	private String content;
	
}
