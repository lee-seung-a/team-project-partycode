
package com.company.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IboughtthisVO {
	private int this_no;
	private String your_pcode;
	private String your_id;
	private String your_title;
	private int your_pno;
	private String my_id;
	private String this_regdate;
	private int my_no;
	
	private int partyattend;
	private int chargedpoint;
	private int remainpoint;
}