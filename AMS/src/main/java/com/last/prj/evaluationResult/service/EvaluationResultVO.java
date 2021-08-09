package com.last.prj.evaluationResult.service;

import lombok.Data;

@Data
public class EvaluationResultVO {
	private int evaluationresultseq;
	private int evaluationseq;
	private int evaluationitemseq;//
	private int member_seq;//sid 구분..(참여유무)//교수에겐 비공개
	private String regdate;//참여일
	
}
