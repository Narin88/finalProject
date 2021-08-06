package com.last.prj.log.service;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter @Getter
@ToString
public class LogVO {
	private String visitid;
	private String visitname;
	private String visitip;
	private String visittime;
	private String visitcookie;
	private String visitagent;
}
