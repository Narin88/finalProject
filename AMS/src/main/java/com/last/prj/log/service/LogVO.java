package com.last.prj.log.service;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter @Getter
@ToString
public class LogVO {
	private int visitId;
	private String visitIp;
	private String visitTime;
	private String visitRefer;
	private String visitAgent;
}
