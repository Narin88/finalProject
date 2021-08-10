package com.last.prj.log.service;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter @Getter
@ToString
public class LogVO {
	private String visitId;
	private String visitName;
	private String visitIp;
	private String visitTime;
	private String visitCookie;
	private String visitAgent;
}
